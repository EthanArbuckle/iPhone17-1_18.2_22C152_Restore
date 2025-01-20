@interface AWDProactiveModelFittingSparseFloatMatrix
+ (id)sparseFloatMatrixFromDenseMatrix:(id)a3;
+ (id)sparseFloatMatrixFromSparseMatrix:(id)a3;
- (BOOL)hasColumnLength;
- (BOOL)hasRowLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)valueAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (float)values;
- (float)valuesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)columnIndices;
- (unint64_t)columnIndicesAtIndex:(unint64_t)a3;
- (unint64_t)columnIndicesCount;
- (unint64_t)columnLength;
- (unint64_t)hash;
- (unint64_t)rowIndices;
- (unint64_t)rowIndicesAtIndex:(unint64_t)a3;
- (unint64_t)rowIndicesCount;
- (unint64_t)rowLength;
- (unint64_t)valuesCount;
- (void)addColumnIndices:(unint64_t)a3;
- (void)addRowIndices:(unint64_t)a3;
- (void)addValues:(float)a3;
- (void)clearColumnIndices;
- (void)clearRowIndices;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setColumnIndices:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setColumnLength:(unint64_t)a3;
- (void)setHasColumnLength:(BOOL)a3;
- (void)setHasRowLength:(BOOL)a3;
- (void)setRowIndices:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRowLength:(unint64_t)a3;
- (void)setValues:(float *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingSparseFloatMatrix

- (unint64_t)rowLength
{
  return self->_rowLength;
}

- (unint64_t)columnLength
{
  return self->_columnLength;
}

- (void)mergeFrom:(id)a3
{
  v13 = (unint64_t *)a3;
  uint64_t v4 = [v13 columnIndicesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingSparseFloatMatrix addColumnIndices:](self, "addColumnIndices:", [v13 columnIndicesAtIndex:i]);
  }
  if (v13[12])
  {
    self->_columnLength = v13[10];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v7 = [v13 rowIndicesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[AWDProactiveModelFittingSparseFloatMatrix addRowIndices:](self, "addRowIndices:", [v13 rowIndicesAtIndex:j]);
  }
  if ((v13[12] & 2) != 0)
  {
    self->_rowLength = v13[11];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v10 = [v13 valuesCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t k = 0; k != v11; ++k)
    {
      [v13 valuesAtIndex:k];
      -[AWDProactiveModelFittingSparseFloatMatrix addValues:](self, "addValues:");
    }
  }
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt64Hash();
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_columnLength;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = PBRepeatedUInt64Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v6 = 2654435761u * self->_rowLength;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ PBRepeatedFloatHash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedUInt64IsEqual()) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_columnLength != *((void *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_15;
  }
  if (!PBRepeatedUInt64IsEqual())
  {
LABEL_15:
    char IsEqual = 0;
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_rowLength != *((void *)v4 + 11)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_15;
  }
  char IsEqual = PBRepeatedFloatIsEqual();
LABEL_16:

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 80) = self->_columnLength;
    *(unsigned char *)(v4 + 96) |= 1u;
  }
  PBRepeatedUInt64Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v4 + 88) = self->_rowLength;
    *(unsigned char *)(v4 + 96) |= 2u;
  }
  PBRepeatedFloatCopy();
  return (id)v4;
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if ([(AWDProactiveModelFittingSparseFloatMatrix *)self columnIndicesCount])
  {
    [v13 clearColumnIndices];
    unint64_t v4 = [(AWDProactiveModelFittingSparseFloatMatrix *)self columnIndicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v13, "addColumnIndices:", -[AWDProactiveModelFittingSparseFloatMatrix columnIndicesAtIndex:](self, "columnIndicesAtIndex:", i));
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v13 + 10) = self->_columnLength;
    *((unsigned char *)v13 + 96) |= 1u;
  }
  if ([(AWDProactiveModelFittingSparseFloatMatrix *)self rowIndicesCount])
  {
    [v13 clearRowIndices];
    unint64_t v7 = [(AWDProactiveModelFittingSparseFloatMatrix *)self rowIndicesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v13, "addRowIndices:", -[AWDProactiveModelFittingSparseFloatMatrix rowIndicesAtIndex:](self, "rowIndicesAtIndex:", j));
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v13 + 11) = self->_rowLength;
    *((unsigned char *)v13 + 96) |= 2u;
  }
  if ([(AWDProactiveModelFittingSparseFloatMatrix *)self valuesCount])
  {
    [v13 clearValues];
    unint64_t v10 = [(AWDProactiveModelFittingSparseFloatMatrix *)self valuesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
      {
        [(AWDProactiveModelFittingSparseFloatMatrix *)self valuesAtIndex:k];
        objc_msgSend(v13, "addValues:");
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_columnIndices.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v9;
      ++v5;
    }
    while (v5 < self->_columnIndices.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
  }
  if (self->_rowIndices.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v9;
      ++v6;
    }
    while (v6 < self->_rowIndices.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
  }
  p_values = &self->_values;
  if (p_values->count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v9;
      ++v8;
    }
    while (v8 < p_values->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingSparseFloatMatrixReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = PBRepeatedUInt64NSArray();
  [v3 setObject:v4 forKey:@"columnIndices"];

  if (*(unsigned char *)&self->_has)
  {
    unint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_columnLength];
    [v3 setObject:v5 forKey:@"columnLength"];
  }
  unint64_t v6 = PBRepeatedUInt64NSArray();
  [v3 setObject:v6 forKey:@"rowIndices"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v7 = [NSNumber numberWithUnsignedLongLong:self->_rowLength];
    [v3 setObject:v7 forKey:@"rowLength"];
  }
  unint64_t v8 = PBRepeatedFloatNSArray();
  [v3 setObject:v8 forKey:@"values"];

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingSparseFloatMatrix;
  id v4 = [(AWDProactiveModelFittingSparseFloatMatrix *)&v8 description];
  unint64_t v5 = [(AWDProactiveModelFittingSparseFloatMatrix *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setValues:(float *)a3 count:(unint64_t)a4
{
}

- (float)valuesAtIndex:(unint64_t)a3
{
  p_values = &self->_values;
  unint64_t count = self->_values.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_values->list[a3];
}

- (void)addValues:(float)a3
{
}

- (void)clearValues
{
}

- (float)values
{
  return self->_values.list;
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (BOOL)hasRowLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasRowLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setRowLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rowLength = a3;
}

- (void)setRowIndices:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rowIndicesAtIndex:(unint64_t)a3
{
  p_rowIndices = &self->_rowIndices;
  unint64_t count = self->_rowIndices.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_rowIndices->list[a3];
}

- (void)addRowIndices:(unint64_t)a3
{
}

- (void)clearRowIndices
{
}

- (unint64_t)rowIndices
{
  return self->_rowIndices.list;
}

- (unint64_t)rowIndicesCount
{
  return self->_rowIndices.count;
}

- (BOOL)hasColumnLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasColumnLength:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setColumnLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_columnLength = a3;
}

- (void)setColumnIndices:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)columnIndicesAtIndex:(unint64_t)a3
{
  p_columnIndices = &self->_columnIndices;
  unint64_t count = self->_columnIndices.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_columnIndices->list[a3];
}

- (void)addColumnIndices:(unint64_t)a3
{
}

- (void)clearColumnIndices
{
}

- (unint64_t)columnIndices
{
  return self->_columnIndices.list;
}

- (unint64_t)columnIndicesCount
{
  return self->_columnIndices.count;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingSparseFloatMatrix;
  [(AWDProactiveModelFittingSparseFloatMatrix *)&v3 dealloc];
}

- (float)valueAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  float v7 = 0.0;
  if ([(AWDProactiveModelFittingSparseFloatMatrix *)self valuesCount])
  {
    uint64_t v8 = 0;
    while ([(AWDProactiveModelFittingSparseFloatMatrix *)self rowIndices][8 * v8] != a3
         || [(AWDProactiveModelFittingSparseFloatMatrix *)self columnIndices][8 * v8] != a4)
    {
      if (++v8 >= [(AWDProactiveModelFittingSparseFloatMatrix *)self valuesCount]) {
        return v7;
      }
    }
    return [(AWDProactiveModelFittingSparseFloatMatrix *)self values][4 * v8];
  }
  return v7;
}

+ (id)sparseFloatMatrixFromSparseMatrix:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setColumnLength:", objc_msgSend(v3, "numberOfColumns"));
  objc_msgSend(v4, "setRowLength:", objc_msgSend(v3, "numberOfRows"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__AWDProactiveModelFittingSparseFloatMatrix_PML__sparseFloatMatrixFromSparseMatrix___block_invoke;
  v7[3] = &unk_26459F400;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateNonZeroValuesWithBlock:v7];

  return v5;
}

uint64_t __84__AWDProactiveModelFittingSparseFloatMatrix_PML__sparseFloatMatrixFromSparseMatrix___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  [*(id *)(a1 + 32) addRowIndices:a2];
  [*(id *)(a1 + 32) addColumnIndices:a3];
  float v7 = *(void **)(a1 + 32);
  *(float *)&double v8 = a4;
  return [v7 addValues:v8];
}

+ (id)sparseFloatMatrixFromDenseMatrix:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setColumnLength:", objc_msgSend(v3, "numberOfColumns"));
  objc_msgSend(v4, "setRowLength:", objc_msgSend(v3, "numberOfRows"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__AWDProactiveModelFittingSparseFloatMatrix_PML__sparseFloatMatrixFromDenseMatrix___block_invoke;
  v7[3] = &unk_26459F400;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateNonZeroValuesWithBlock:v7];

  return v5;
}

uint64_t __83__AWDProactiveModelFittingSparseFloatMatrix_PML__sparseFloatMatrixFromDenseMatrix___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  [*(id *)(a1 + 32) addRowIndices:a2];
  [*(id *)(a1 + 32) addColumnIndices:a3];
  float v7 = *(void **)(a1 + 32);
  *(float *)&double v8 = a4;
  return [v7 addValues:v8];
}

@end