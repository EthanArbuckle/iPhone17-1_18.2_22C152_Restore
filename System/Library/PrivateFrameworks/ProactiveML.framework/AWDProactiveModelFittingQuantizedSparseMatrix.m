@interface AWDProactiveModelFittingQuantizedSparseMatrix
+ (id)quantizedSparseMatrixFromSparseMatrix:(id)a3 numberOfBuckets:(unint64_t)a4;
- (BOOL)hasBucketSize;
- (BOOL)hasColumnLength;
- (BOOL)hasMinValue;
- (BOOL)hasRowLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)bucketSize;
- (float)minValue;
- (float)originalValueAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)columnIndicesCount;
- (unint64_t)hash;
- (unint64_t)rowIndicesCount;
- (unint64_t)valuesCount;
- (unsigned)columnIndices;
- (unsigned)columnIndicesAtIndex:(unint64_t)a3;
- (unsigned)columnLength;
- (unsigned)rowIndices;
- (unsigned)rowIndicesAtIndex:(unint64_t)a3;
- (unsigned)rowLength;
- (unsigned)values;
- (unsigned)valuesAtIndex:(unint64_t)a3;
- (void)addColumnIndices:(unsigned int)a3;
- (void)addRowIndices:(unsigned int)a3;
- (void)addValues:(unsigned int)a3;
- (void)clearColumnIndices;
- (void)clearRowIndices;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBucketSize:(float)a3;
- (void)setColumnIndices:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setColumnLength:(unsigned int)a3;
- (void)setHasBucketSize:(BOOL)a3;
- (void)setHasColumnLength:(BOOL)a3;
- (void)setHasMinValue:(BOOL)a3;
- (void)setHasRowLength:(BOOL)a3;
- (void)setMinValue:(float)a3;
- (void)setRowIndices:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRowLength:(unsigned int)a3;
- (void)setValues:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingQuantizedSparseMatrix

- (float)bucketSize
{
  return self->_bucketSize;
}

- (float)minValue
{
  return self->_minValue;
}

- (unsigned)rowLength
{
  return self->_rowLength;
}

- (unsigned)columnLength
{
  return self->_columnLength;
}

- (void)mergeFrom:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 columnIndicesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingQuantizedSparseMatrix addColumnIndices:](self, "addColumnIndices:", [v14 columnIndicesAtIndex:i]);
  }
  if ((*((unsigned char *)v14 + 96) & 2) != 0)
  {
    self->_columnLength = *((_DWORD *)v14 + 21);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v7 = [v14 rowIndicesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[AWDProactiveModelFittingQuantizedSparseMatrix addRowIndices:](self, "addRowIndices:", [v14 rowIndicesAtIndex:j]);
  }
  if ((*((unsigned char *)v14 + 96) & 8) != 0)
  {
    self->_rowLength = *((_DWORD *)v14 + 23);
    *(unsigned char *)&self->_has |= 8u;
  }
  uint64_t v10 = [v14 valuesCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t k = 0; k != v11; ++k)
      -[AWDProactiveModelFittingQuantizedSparseMatrix addValues:](self, "addValues:", [v14 valuesAtIndex:k]);
  }
  char v13 = *((unsigned char *)v14 + 96);
  if ((v13 & 4) != 0)
  {
    self->_minValue = *((float *)v14 + 22);
    *(unsigned char *)&self->_has |= 4u;
    char v13 = *((unsigned char *)v14 + 96);
  }
  if (v13)
  {
    self->_bucketSize = *((float *)v14 + 20);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_columnLength;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_rowLength;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = PBRepeatedUInt32Hash();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    float minValue = self->_minValue;
    double v11 = minValue;
    if (minValue < 0.0) {
      double v11 = -minValue;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if (has)
  {
    float bucketSize = self->_bucketSize;
    double v16 = bucketSize;
    if (bucketSize < 0.0) {
      double v16 = -bucketSize;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_columnLength != *((_DWORD *)v4 + 21)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 8) == 0 || self->_rowLength != *((_DWORD *)v4 + 23)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
    goto LABEL_24;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_24:
    BOOL v5 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_minValue != *((float *)v4 + 22)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_24;
  }
  BOOL v5 = (*((unsigned char *)v4 + 96) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_bucketSize != *((float *)v4 + 20)) {
      goto LABEL_24;
    }
    BOOL v5 = 1;
  }
LABEL_25:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v4 + 84) = self->_columnLength;
    *(unsigned char *)(v4 + 96) |= 2u;
  }
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v4 + 92) = self->_rowLength;
    *(unsigned char *)(v4 + 96) |= 8u;
  }
  PBRepeatedUInt32Copy();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)(v4 + 88) = self->_minValue;
    *(unsigned char *)(v4 + 96) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)(v4 + 80) = self->_bucketSize;
    *(unsigned char *)(v4 + 96) |= 1u;
  }
  return (id)v4;
}

- (void)copyTo:(id)a3
{
  id v14 = a3;
  if ([(AWDProactiveModelFittingQuantizedSparseMatrix *)self columnIndicesCount])
  {
    [v14 clearColumnIndices];
    unint64_t v4 = [(AWDProactiveModelFittingQuantizedSparseMatrix *)self columnIndicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v14, "addColumnIndices:", -[AWDProactiveModelFittingQuantizedSparseMatrix columnIndicesAtIndex:](self, "columnIndicesAtIndex:", i));
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v14 + 21) = self->_columnLength;
    *((unsigned char *)v14 + 96) |= 2u;
  }
  if ([(AWDProactiveModelFittingQuantizedSparseMatrix *)self rowIndicesCount])
  {
    [v14 clearRowIndices];
    unint64_t v7 = [(AWDProactiveModelFittingQuantizedSparseMatrix *)self rowIndicesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v14, "addRowIndices:", -[AWDProactiveModelFittingQuantizedSparseMatrix rowIndicesAtIndex:](self, "rowIndicesAtIndex:", j));
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v14 + 23) = self->_rowLength;
    *((unsigned char *)v14 + 96) |= 8u;
  }
  if ([(AWDProactiveModelFittingQuantizedSparseMatrix *)self valuesCount])
  {
    [v14 clearValues];
    unint64_t v10 = [(AWDProactiveModelFittingQuantizedSparseMatrix *)self valuesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v14, "addValues:", -[AWDProactiveModelFittingQuantizedSparseMatrix valuesAtIndex:](self, "valuesAtIndex:", k));
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v14 + 22) = LODWORD(self->_minValue);
    *((unsigned char *)v14 + 96) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v14 + 20) = LODWORD(self->_bucketSize);
    *((unsigned char *)v14 + 96) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_columnIndices.count)
  {
    PBDataWriterPlaceMark();
    if (self->_columnIndices.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_columnIndices.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_rowIndices.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rowIndices.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_rowIndices.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_values.count)
  {
    PBDataWriterPlaceMark();
    if (self->_values.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_values.count);
    }
    PBDataWriterRecallMark();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingQuantizedSparseMatrixReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = PBRepeatedUInt32NSArray();
  [v3 setObject:v4 forKey:@"columnIndices"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = [NSNumber numberWithUnsignedInt:self->_columnLength];
    [v3 setObject:v5 forKey:@"columnLength"];
  }
  unint64_t v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"rowIndices"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unint64_t v7 = [NSNumber numberWithUnsignedInt:self->_rowLength];
    [v3 setObject:v7 forKey:@"rowLength"];
  }
  unint64_t v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"values"];

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&double v9 = self->_minValue;
    unint64_t v11 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v11 forKey:@"minValue"];

    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)&double v9 = self->_bucketSize;
    long double v12 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v12 forKey:@"bucketSize"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingQuantizedSparseMatrix;
  id v4 = [(AWDProactiveModelFittingQuantizedSparseMatrix *)&v8 description];
  unint64_t v5 = [(AWDProactiveModelFittingQuantizedSparseMatrix *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBucketSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBucketSize:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBucketSize:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float bucketSize = a3;
}

- (BOOL)hasMinValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasMinValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setMinValue:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float minValue = a3;
}

- (void)setValues:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unsigned)valuesAtIndex:(unint64_t)a3
{
  p_values = &self->_values;
  unint64_t count = self->_values.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_values->list[a3];
}

- (void)addValues:(unsigned int)a3
{
}

- (void)clearValues
{
}

- (unsigned)values
{
  return self->_values.list;
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (BOOL)hasRowLength
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasRowLength:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setRowLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rowLength = a3;
}

- (void)setRowIndices:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unsigned)rowIndicesAtIndex:(unint64_t)a3
{
  p_rowIndices = &self->_rowIndices;
  unint64_t count = self->_rowIndices.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_rowIndices->list[a3];
}

- (void)addRowIndices:(unsigned int)a3
{
}

- (void)clearRowIndices
{
}

- (unsigned)rowIndices
{
  return self->_rowIndices.list;
}

- (unint64_t)rowIndicesCount
{
  return self->_rowIndices.count;
}

- (BOOL)hasColumnLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasColumnLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setColumnLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_columnLength = a3;
}

- (void)setColumnIndices:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unsigned)columnIndicesAtIndex:(unint64_t)a3
{
  p_columnIndices = &self->_columnIndices;
  unint64_t count = self->_columnIndices.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_columnIndices->list[a3];
}

- (void)addColumnIndices:(unsigned int)a3
{
}

- (void)clearColumnIndices
{
}

- (unsigned)columnIndices
{
  return self->_columnIndices.list;
}

- (unint64_t)columnIndicesCount
{
  return self->_columnIndices.count;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingQuantizedSparseMatrix;
  [(AWDProactiveModelFittingQuantizedSparseMatrix *)&v3 dealloc];
}

- (float)originalValueAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  float v7 = 0.0;
  if ([(AWDProactiveModelFittingQuantizedSparseMatrix *)self valuesCount])
  {
    uint64_t v8 = 0;
    while ([(AWDProactiveModelFittingQuantizedSparseMatrix *)self rowIndices][4 * v8] != a3
         || [(AWDProactiveModelFittingQuantizedSparseMatrix *)self columnIndices][4 * v8] != a4)
    {
      if (++v8 >= [(AWDProactiveModelFittingQuantizedSparseMatrix *)self valuesCount]) {
        return v7;
      }
    }
    [(AWDProactiveModelFittingQuantizedSparseMatrix *)self minValue];
    float v10 = v9;
    float v11 = (float)[(AWDProactiveModelFittingQuantizedSparseMatrix *)self values][4 * v8];
    [(AWDProactiveModelFittingQuantizedSparseMatrix *)self bucketSize];
    double v13 = (float)(v10 + (float)(v11 * v12));
    [(AWDProactiveModelFittingQuantizedSparseMatrix *)self bucketSize];
    return v14 * 0.5 + v13;
  }
  return v7;
}

+ (id)quantizedSparseMatrixFromSparseMatrix:(id)a3 numberOfBuckets:(unint64_t)a4
{
  id v7 = a3;
  if ((unint64_t)[v7 numberOfRows] >> 32)
  {
    long double v17 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"AWDProactiveModelFittingQuantizedSparseMatrix+PML.m", 16, @"Too big matrix (rows: %tu)", objc_msgSend(v7, "numberOfRows"));
  }
  if ((unint64_t)[v7 numberOfColumns] >> 32)
  {
    double v18 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"AWDProactiveModelFittingQuantizedSparseMatrix+PML.m", 17, @"Too big matrix (cols: %tu)", objc_msgSend(v7, "numberOfColumns"));
  }
  uint64_t v8 = objc_opt_new();
  [v7 minValue];
  float v10 = v9;
  [v7 maxValue];
  v19[1] = 3221225472;
  v19[0] = MEMORY[0x263EF8330];
  v19[2] = __108__AWDProactiveModelFittingQuantizedSparseMatrix_PML__quantizedSparseMatrixFromSparseMatrix_numberOfBuckets___block_invoke;
  v19[3] = &unk_26459F150;
  float v12 = (float)(v11 - v10) / (float)a4;
  float v21 = v12;
  float v22 = v10;
  id v13 = v8;
  id v20 = v13;
  [v7 enumerateNonZeroValuesWithBlock:v19];
  *(float *)&double v14 = v12;
  [v13 setBucketSize:v14];
  *(float *)&double v15 = v10;
  [v13 setMinValue:v15];
  objc_msgSend(v13, "setColumnLength:", objc_msgSend(v7, "numberOfColumns"));
  objc_msgSend(v13, "setRowLength:", objc_msgSend(v7, "numberOfRows"));

  return v13;
}

uint64_t __108__AWDProactiveModelFittingQuantizedSparseMatrix_PML__quantizedSparseMatrixFromSparseMatrix_numberOfBuckets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  float v7 = *(float *)(a1 + 40);
  if (v7 == 0.0) {
    uint64_t v4 = 0;
  }
  else {
    LODWORD(v4) = vcvtms_u32_f32((float)(a4 - *(float *)(a1 + 44)) / v7);
  }
  [*(id *)(a1 + 32) addRowIndices:a2];
  [*(id *)(a1 + 32) addColumnIndices:a3];
  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 addValues:v4];
}

@end