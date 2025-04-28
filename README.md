1.How the script handles arguments and options:
It uses getopts to understand options (-n and -v).
After options, it expects exactly 2 arguments: search string and filename.
It checks if the file exists.
Then it reads the file line by line and applies the matching rules.

2.If I added regex / other options:
I would add more options in getopts like -i, -c, -l.
I would maybe let the user input a regular expression instead of a fixed word.
I would use grep more directly inside the loop.

3.Hardest part:
Handling inverted matches (-v) because booleans are tricky in bash.
Also making sure line numbers are correct if -n is used.

screenshots:

![image](https://github.com/user-attachments/assets/d2e5e88a-16fa-48b0-a63e-e39376b1de67)

![image](https://github.com/user-attachments/assets/b3ab6720-595d-42fb-8dd3-3aabfd01f997)

![image](https://github.com/user-attachments/assets/de52d748-fe7f-4ba5-82fd-4cf81b3af06c)
![image](https://github.com/user-attachments/assets/aa6179fd-1ac3-4b4f-aaf6-b7dd1bd4fabf)

