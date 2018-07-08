#вар 2
import numpy
import logging

nameFile=''
rowNum = 0
colNum = 0
j = 0
matA = numpy.array([[],[]])
matB = numpy.array([])
arrCol = []
result = []
matB = []

logging.basicConfig(format = u'"time": "%(asctime)s", "levelname": "%(levelname)s", "message": "%(message)s"', level = logging.DEBUG, filename = u'mylog.log')
nameFile = input()
try:
    file=open(nameFile,'r')
except IOError as error:
    logging.error(str(error))
    exit(0)
else:
    with file:
        matA = []
        for line in file:
            try:
                row = [float(i) for i in line.split()]
            except:
                logging.error("Ошибка чтения")
                exit(4)
            matA.append(row)
            arrCol.append(len(row) - 1)
            j = 0
            while j < rowNum:
                if (arrCol[j] != len(row) - 1):
                    logging.error("Неправильный порядок матрицы")
                    exit(2)
                j += 1
            rowNum+=1
        file.closed
colNum = len(row)-1
if (colNum!=rowNum):
    logging.error("Неправильный порядок матрицы")
    exit(0)
#matB = [0 for y in range(rowNum)]
for i in range(rowNum):
    matB.append(matA[i].pop())
try:
    result = numpy.linalg.solve(matA, matB)
except:
    logging.error("Деление на ноль")
    exit(3)
logging.info( u'CoefficientsOfX: %s, freeCoefficients: %s, result: %s', matA, matB, result )