import time
import os

def clear_screen():
    os.system('clear')

def game_loop():
    running = True
    print("Game Initializing...")
    
    while running:
        clear_screen()
        # --- Game Logic Starts Here ---
        print("Welcome to your game!")
        print("1. Do something cool")
        print("2. Exit")
        
        choice = input("> ")
        
        if choice == "2":
            running = False
        # ------------------------------
        
        time.sleep(0.1)

if __name__ == "__main__":
    game_loop()

