#env | grep SGE;
source ~/.bash_profile
echo $SGE_O_PATH;
echo $PATH;
python3 test.py
