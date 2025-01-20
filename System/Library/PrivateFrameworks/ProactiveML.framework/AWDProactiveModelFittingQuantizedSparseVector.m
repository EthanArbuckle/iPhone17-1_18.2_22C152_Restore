@interface AWDProactiveModelFittingQuantizedSparseVector
+ (id)quantizedSparseVectorFromDenseVector:(id)a3 numberOfBuckets:(unint64_t)a4;
+ (id)quantizedSparseVectorFromSparseVector:(id)a3 numberOfBuckets:(unint64_t)a4;
- (BOOL)hasBucketSize;
- (BOOL)hasLength;
- (BOOL)hasMinValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)bucketSize;
- (float)minValue;
- (float)originalValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)indicesCount;
- (unint64_t)valuesCount;
- (unsigned)indices;
- (unsigned)indicesAtIndex:(unint64_t)a3;
- (unsigned)length;
- (unsigned)values;
- (unsigned)valuesAtIndex:(unint64_t)a3;
- (void)addIndices:(unsigned int)a3;
- (void)addValues:(unsigned int)a3;
- (void)clearIndices;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBucketSize:(float)a3;
- (void)setHasBucketSize:(BOOL)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasMinValue:(BOOL)a3;
- (void)setIndices:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setLength:(unsigned int)a3;
- (void)setMinValue:(float)a3;
- (void)setValues:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingQuantizedSparseVector

- (float)bucketSize
{
  return self->_bucketSize;
}

- (float)minValue
{
  return self->_minValue;
}

- (unsigned)length
{
  return self->_length;
}

- (void)mergeFrom:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 indicesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingQuantizedSparseVector addIndices:](self, "addIndices:", [v11 indicesAtIndex:i]);
  }
  uint64_t v7 = [v11 valuesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[AWDProactiveModelFittingQuantizedSparseVector addValues:](self, "addValues:", [v11 valuesAtIndex:j]);
  }
  char v10 = *((unsigned char *)v11 + 68);
  if ((v10 & 2) != 0)
  {
    self->_length = *((_DWORD *)v11 + 15);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)v11 + 68);
    if ((v10 & 4) == 0)
    {
LABEL_9:
      if ((v10 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v11 + 68) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_minValue = *((float *)v11 + 16);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v11 + 68))
  {
LABEL_10:
    self->_bucketSize = *((float *)v11 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_11:
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v4 = PBRepeatedUInt32Hash();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_length;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float minValue = self->_minValue;
  double v8 = minValue;
  if (minValue < 0.0) {
    double v8 = -minValue;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_11:
  if (has)
  {
    float bucketSize = self->_bucketSize;
    double v14 = bucketSize;
    if (bucketSize < 0.0) {
      double v14 = -bucketSize;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_length != *((_DWORD *)v4 + 15)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_18:
    BOOL v5 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_minValue != *((float *)v4 + 16)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_18;
  }
  BOOL v5 = (*((unsigned char *)v4 + 68) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_bucketSize != *((float *)v4 + 14)) {
      goto LABEL_18;
    }
    BOOL v5 = 1;
  }
LABEL_19:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(float *)(v4 + 64) = self->_minValue;
    *(unsigned char *)(v4 + 68) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v4;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 60) = self->_length;
  *(unsigned char *)(v4 + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(float *)(v4 + 56) = self->_bucketSize;
    *(unsigned char *)(v4 + 68) |= 1u;
  }
  return (id)v4;
}

- (void)copyTo:(id)a3
{
  id v11 = a3;
  if ([(AWDProactiveModelFittingQuantizedSparseVector *)self indicesCount])
  {
    [v11 clearIndices];
    unint64_t v4 = [(AWDProactiveModelFittingQuantizedSparseVector *)self indicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addIndices:", -[AWDProactiveModelFittingQuantizedSparseVector indicesAtIndex:](self, "indicesAtIndex:", i));
    }
  }
  if ([(AWDProactiveModelFittingQuantizedSparseVector *)self valuesCount])
  {
    [v11 clearValues];
    unint64_t v7 = [(AWDProactiveModelFittingQuantizedSparseVector *)self valuesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v11, "addValues:", -[AWDProactiveModelFittingQuantizedSparseVector valuesAtIndex:](self, "valuesAtIndex:", j));
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v11 + 15) = self->_length;
    *((unsigned char *)v11 + 68) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v11 + 16) = LODWORD(self->_minValue);
  *((unsigned char *)v11 + 68) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_12:
    *((_DWORD *)v11 + 14) = LODWORD(self->_bucketSize);
    *((unsigned char *)v11 + 68) |= 1u;
  }
LABEL_13:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_indices.count)
  {
    PBDataWriterPlaceMark();
    if (self->_indices.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_indices.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_values.count)
  {
    PBDataWriterPlaceMark();
    if (self->_values.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_values.count);
    }
    PBDataWriterRecallMark();
  }
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_13;
    }
LABEL_17:
    PBDataWriterWriteFloatField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_17;
  }
LABEL_13:
  if (has) {
LABEL_14:
  }
    PBDataWriterWriteFloatField();
LABEL_15:
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingQuantizedSparseVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = PBRepeatedUInt32NSArray();
  [v3 setObject:v4 forKey:@"indices"];

  unint64_t v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"values"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double v10 = [NSNumber numberWithUnsignedInt:self->_length];
    [v3 setObject:v10 forKey:@"length"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v6 = self->_minValue;
  id v11 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v11 forKey:@"minValue"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(float *)&double v6 = self->_bucketSize;
    unint64_t v8 = [NSNumber numberWithFloat:v6];
    [v3 setObject:v8 forKey:@"bucketSize"];
  }
LABEL_5:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingQuantizedSparseVector;
  id v4 = [(AWDProactiveModelFittingQuantizedSparseVector *)&v8 description];
  unint64_t v5 = [(AWDProactiveModelFittingQuantizedSparseVector *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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

- (BOOL)hasLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_length = a3;
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
    double v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    long double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
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

- (void)setIndices:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unsigned)indicesAtIndex:(unint64_t)a3
{
  p_indices = &self->_indices;
  unint64_t count = self->_indices.count;
  if (count <= a3)
  {
    double v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    long double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_indices->list[a3];
}

- (void)addIndices:(unsigned int)a3
{
}

- (void)clearIndices
{
}

- (unsigned)indices
{
  return self->_indices.list;
}

- (unint64_t)indicesCount
{
  return self->_indices.count;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingQuantizedSparseVector;
  [(AWDProactiveModelFittingQuantizedSparseVector *)&v3 dealloc];
}

- (float)originalValueAtIndex:(unint64_t)a3
{
  float v5 = 0.0;
  if ([(AWDProactiveModelFittingQuantizedSparseVector *)self valuesCount])
  {
    uint64_t v6 = 0;
    while ([(AWDProactiveModelFittingQuantizedSparseVector *)self indices][4 * v6] != a3)
    {
      if (++v6 >= [(AWDProactiveModelFittingQuantizedSparseVector *)self valuesCount]) {
        return v5;
      }
    }
    [(AWDProactiveModelFittingQuantizedSparseVector *)self minValue];
    float v8 = v7;
    float v9 = (float)[(AWDProactiveModelFittingQuantizedSparseVector *)self values][4 * v6];
    [(AWDProactiveModelFittingQuantizedSparseVector *)self bucketSize];
    double v11 = (float)(v8 + (float)(v9 * v10));
    [(AWDProactiveModelFittingQuantizedSparseVector *)self bucketSize];
    return v12 * 0.5 + v11;
  }
  return v5;
}

+ (id)quantizedSparseVectorFromSparseVector:(id)a3 numberOfBuckets:(unint64_t)a4
{
  id v7 = a3;
  if ((unint64_t)[v7 length] >> 32)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"AWDProactiveModelFittingQuantizedSparseVector+PML.m", 23, @"Too big vector (length: %tu)", objc_msgSend(v7, "length"));
  }
  float v8 = objc_opt_new();
  [v7 minValue];
  float v10 = v9;
  [v7 maxValue];
  v18[1] = 3221225472;
  v18[0] = MEMORY[0x263EF8330];
  v18[2] = __108__AWDProactiveModelFittingQuantizedSparseVector_PML__quantizedSparseVectorFromSparseVector_numberOfBuckets___block_invoke;
  v18[3] = &unk_26459F5D8;
  float v12 = (float)(v11 - v10) / (float)a4;
  float v20 = v12;
  float v21 = v10;
  id v13 = v8;
  id v19 = v13;
  [v7 enumerateNonZeroValuesWithBlock:v18];
  *(float *)&double v14 = v12;
  [v13 setBucketSize:v14];
  *(float *)&double v15 = v10;
  [v13 setMinValue:v15];
  objc_msgSend(v13, "setLength:", objc_msgSend(v7, "length"));

  return v13;
}

uint64_t __108__AWDProactiveModelFittingQuantizedSparseVector_PML__quantizedSparseVectorFromSparseVector_numberOfBuckets___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  float v5 = *(float *)(a1 + 40);
  if (v5 == 0.0) {
    uint64_t v3 = 0;
  }
  else {
    LODWORD(v3) = vcvtms_u32_f32((float)(a3 - *(float *)(a1 + 44)) / v5);
  }
  [*(id *)(a1 + 32) addIndices:a2];
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 addValues:v3];
}

+ (id)quantizedSparseVectorFromDenseVector:(id)a3 numberOfBuckets:(unint64_t)a4
{
  uint64_t v6 = +[PMLSparseVector sparseVectorFromDense:a3];
  id v7 = [a1 quantizedSparseVectorFromSparseVector:v6 numberOfBuckets:a4];

  return v7;
}

@end