@interface AWDProactiveModelFittingSparseFloatVector
+ (id)sparseFloatVectorFromModelWeights:(id)a3;
+ (id)sparseFloatVectorFromSparseVector:(id)a3;
- (BOOL)hasLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)valueAtIndex:(unint64_t)a3;
- (float)values;
- (float)valuesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)indices;
- (unint64_t)indicesAtIndex:(unint64_t)a3;
- (unint64_t)indicesCount;
- (unint64_t)length;
- (unint64_t)valuesCount;
- (void)addIndices:(unint64_t)a3;
- (void)addValues:(float)a3;
- (void)clearIndices;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setIndices:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setLength:(unint64_t)a3;
- (void)setValues:(float *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingSparseFloatVector

- (unint64_t)length
{
  return self->_length;
}

- (void)mergeFrom:(id)a3
{
  v10 = (unint64_t *)a3;
  uint64_t v4 = [v10 indicesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingSparseFloatVector addIndices:](self, "addIndices:", [v10 indicesAtIndex:i]);
  }
  uint64_t v7 = [v10 valuesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
    {
      [v10 valuesAtIndex:j];
      -[AWDProactiveModelFittingSparseFloatVector addValues:](self, "addValues:");
    }
  }
  if (v10[8])
  {
    self->_length = v10[7];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt64Hash();
  uint64_t v4 = PBRepeatedFloatHash();
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_length;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || !PBRepeatedUInt64IsEqual()
    || !PBRepeatedFloatIsEqual())
  {
    goto LABEL_8;
  }
  BOOL v5 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) != 0 && self->_length == *((void *)v4 + 7))
    {
      BOOL v5 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v5 = 0;
  }
LABEL_9:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  PBRepeatedFloatCopy();
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 56) = self->_length;
    *(unsigned char *)(v4 + 64) |= 1u;
  }
  return (id)v4;
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if ([(AWDProactiveModelFittingSparseFloatVector *)self indicesCount])
  {
    [v10 clearIndices];
    unint64_t v4 = [(AWDProactiveModelFittingSparseFloatVector *)self indicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v10, "addIndices:", -[AWDProactiveModelFittingSparseFloatVector indicesAtIndex:](self, "indicesAtIndex:", i));
    }
  }
  if ([(AWDProactiveModelFittingSparseFloatVector *)self valuesCount])
  {
    [v10 clearValues];
    unint64_t v7 = [(AWDProactiveModelFittingSparseFloatVector *)self valuesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        [(AWDProactiveModelFittingSparseFloatVector *)self valuesAtIndex:j];
        objc_msgSend(v10, "addValues:");
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v10 + 7) = self->_length;
    *((unsigned char *)v10 + 64) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_indices.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_indices.count);
  }
  if (self->_values.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v7;
      ++v6;
    }
    while (v6 < self->_values.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = PBRepeatedUInt64NSArray();
  [v3 setObject:v4 forKey:@"indices"];

  unint64_t v5 = PBRepeatedFloatNSArray();
  [v3 setObject:v5 forKey:@"values"];

  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = [NSNumber numberWithUnsignedLongLong:self->_length];
    [v3 setObject:v6 forKey:@"length"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingSparseFloatVector;
  id v4 = [(AWDProactiveModelFittingSparseFloatVector *)&v8 description];
  unint64_t v5 = [(AWDProactiveModelFittingSparseFloatVector *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLength:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_length = a3;
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
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
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

- (void)setIndices:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)indicesAtIndex:(unint64_t)a3
{
  p_indices = &self->_indices;
  unint64_t count = self->_indices.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_indices->list[a3];
}

- (void)addIndices:(unint64_t)a3
{
}

- (void)clearIndices
{
}

- (unint64_t)indices
{
  return self->_indices.list;
}

- (unint64_t)indicesCount
{
  return self->_indices.count;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingSparseFloatVector;
  [(AWDProactiveModelFittingSparseFloatVector *)&v3 dealloc];
}

- (float)valueAtIndex:(unint64_t)a3
{
  float v5 = 0.0;
  if ([(AWDProactiveModelFittingSparseFloatVector *)self valuesCount])
  {
    uint64_t v6 = 0;
    while ([(AWDProactiveModelFittingSparseFloatVector *)self indices][8 * v6] != a3)
    {
      if (++v6 >= [(AWDProactiveModelFittingSparseFloatVector *)self valuesCount]) {
        return v5;
      }
    }
    return [(AWDProactiveModelFittingSparseFloatVector *)self values][4 * v6];
  }
  return v5;
}

+ (id)sparseFloatVectorFromSparseVector:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setLength:", objc_msgSend(v3, "length"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__AWDProactiveModelFittingSparseFloatVector_PML__sparseFloatVectorFromSparseVector___block_invoke;
  v7[3] = &unk_26459F230;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateNonZeroValuesWithBlock:v7];

  return v5;
}

uint64_t __84__AWDProactiveModelFittingSparseFloatVector_PML__sparseFloatVectorFromSparseVector___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  [*(id *)(a1 + 32) addIndices:a2];
  id v5 = *(void **)(a1 + 32);
  *(float *)&double v6 = a3;
  return [v5 addValues:v6];
}

+ (id)sparseFloatVectorFromModelWeights:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setLength:", (int)objc_msgSend(v3, "length"));
  if ([v3 length])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = v3;
      float v7 = *(float *)([v6 values] + 4 * v5);
      if (v7 != 0.0)
      {
        [v4 addIndices:v5];
        *(float *)&double v8 = v7;
        [v4 addValues:v8];
      }
      ++v5;
    }
    while (v5 < (int)[v6 length]);
  }

  return v4;
}

@end