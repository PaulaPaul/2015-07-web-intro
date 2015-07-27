class GameController < ApplicationController
  
  def home
    die = {"red-die-1.png" => 1, 
           "red-die-2.png" => 2, 
           "red-die-3.png" => 3, 
           "red-die-4.png" => 4,
           "red-die-5.png" => 5,
           "red-die-6.png" => 6}
           
    if request.post? # the user pressed the Rollem! button (post)
      roll = die.values.sample 
      @player_die1 = die.key(roll)
      roll = die.values.sample 
      @player_die2 = die.key(roll)
      @computer_die1 = params[:computer_die1]
      @computer_die2 = params[:computer_die2]
      
      if die[@player_die1] + die[@player_die2] == die[@computer_die1] + die[@computer_die2]
        @message = "Tie! Bet you can't do that again!"
      elsif die[@player_die1] + die[@player_die2] > die[@computer_die1] + die[@computer_die2] 
        @message = "You win!  Lucky roll...  Try again!"
      else 
        @message = "You lose!  Better luck next time.  Try again!"
      end
      
    elsif request.get? # this is the request to render (get), the home page, to start a game 
      roll = die.values.sample 
      @computer_die1 = die.key(roll)
      roll = die.values.sample 
      @computer_die2 = die.key(roll)
      @message = "Press 'Rollem!' to see if you can beat my roll!"
    end 
  end

end
