@interface AWDProactiveModelFittingQuantizedDenseVector
+ (id)quantizedDenseVectorFromDenseVector:(id)a3 numberOfBuckets:(unint64_t)a4;
- (BOOL)hasBucketSize;
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
- (unint64_t)valuesCount;
- (unsigned)values;
- (unsigned)valuesAtIndex:(unint64_t)a3;
- (void)addValues:(unsigned int)a3;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBucketSize:(float)a3;
- (void)setHasBucketSize:(BOOL)a3;
- (void)setHasMinValue:(BOOL)a3;
- (void)setMinValue:(float)a3;
- (void)setValues:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingQuantizedDenseVector

- (float)originalValueAtIndex:(unint64_t)a3
{
  [(AWDProactiveModelFittingQuantizedDenseVector *)self minValue];
  float v6 = v5;
  float v7 = (float)[(AWDProactiveModelFittingQuantizedDenseVector *)self values][4 * a3];
  [(AWDProactiveModelFittingQuantizedDenseVector *)self bucketSize];
  double v9 = (float)(v6 + (float)(v7 * v8));
  [(AWDProactiveModelFittingQuantizedDenseVector *)self bucketSize];
  return v10 * 0.5 + v9;
}

+ (id)quantizedDenseVectorFromDenseVector:(id)a3 numberOfBuckets:(unint64_t)a4
{
  id v7 = a3;
  if ((unint64_t)[v7 count] >> 32)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"AWDProactiveModelFittingQuantizedDenseVector+PML.m", 17, @"Too big vector (length: %tu)", objc_msgSend(v7, "count"));
  }
  float v8 = objc_opt_new();
  [v7 minValue];
  float v10 = v9;
  [v7 maxValue];
  v18[1] = 3221225472;
  v18[0] = MEMORY[0x263EF8330];
  v18[2] = __105__AWDProactiveModelFittingQuantizedDenseVector_PML__quantizedDenseVectorFromDenseVector_numberOfBuckets___block_invoke;
  v18[3] = &unk_26459F5D8;
  float v12 = (float)(v11 - v10) / (float)a4;
  float v20 = v12;
  float v21 = v10;
  id v13 = v8;
  id v19 = v13;
  [v7 enumerateValuesWithBlock:v18];
  *(float *)&double v14 = v12;
  [v13 setBucketSize:v14];
  *(float *)&double v15 = v10;
  [v13 setMinValue:v15];

  return v13;
}

uint64_t __105__AWDProactiveModelFittingQuantizedDenseVector_PML__quantizedDenseVectorFromDenseVector_numberOfBuckets___block_invoke(uint64_t a1, float a2, uint64_t a3, uint64_t a4)
{
  float v4 = *(float *)(a1 + 40);
  if (v4 == 0.0) {
    a4 = 0;
  }
  else {
    LODWORD(a4) = vcvtms_u32_f32((float)(a2 - *(float *)(a1 + 44)) / v4);
  }
  return [*(id *)(a1 + 32) addValues:a4];
}

- (float)bucketSize
{
  return self->_bucketSize;
}

- (float)minValue
{
  return self->_minValue;
}

- (void)mergeFrom:(id)a3
{
  float v8 = (float *)a3;
  uint64_t v4 = [v8 valuesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingQuantizedDenseVector addValues:](self, "addValues:", [v8 valuesAtIndex:i]);
  }
  char v7 = *((unsigned char *)v8 + 40);
  if ((v7 & 2) != 0)
  {
    self->_minValue = v8[9];
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v8 + 40);
  }
  if (v7)
  {
    self->_bucketSize = v8[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float minValue = self->_minValue;
    double v7 = minValue;
    if (minValue < 0.0) {
      double v7 = -minValue;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if (has)
  {
    float bucketSize = self->_bucketSize;
    double v12 = bucketSize;
    if (bucketSize < 0.0) {
      double v12 = -bucketSize;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_minValue != *((float *)v4 + 9)) {
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_bucketSize != *((float *)v4 + 8)) {
      goto LABEL_12;
    }
    BOOL v5 = 1;
  }
LABEL_13:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v4 + 36) = self->_minValue;
    *(unsigned char *)(v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)(v4 + 32) = self->_bucketSize;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
  return (id)v4;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(AWDProactiveModelFittingQuantizedDenseVector *)self valuesCount])
  {
    [v8 clearValues];
    unint64_t v4 = [(AWDProactiveModelFittingQuantizedDenseVector *)self valuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addValues:", -[AWDProactiveModelFittingQuantizedDenseVector valuesAtIndex:](self, "valuesAtIndex:", i));
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v8 + 9) = LODWORD(self->_minValue);
    *((unsigned char *)v8 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v8 + 8) = LODWORD(self->_bucketSize);
    *((unsigned char *)v8 + 40) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_values.count)
  {
    PBDataWriterPlaceMark();
    if (self->_values.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_values.count);
    }
    PBDataWriterRecallMark();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
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
  return AWDProactiveModelFittingQuantizedDenseVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = PBRepeatedUInt32NSArray();
  [v3 setObject:v4 forKey:@"values"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v5 = self->_minValue;
    double v7 = [NSNumber numberWithFloat:v5];
    [v3 setObject:v7 forKey:@"minValue"];

    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)&double v5 = self->_bucketSize;
    id v8 = [NSNumber numberWithFloat:v5];
    [v3 setObject:v8 forKey:@"bucketSize"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingQuantizedDenseVector;
  id v4 = [(AWDProactiveModelFittingQuantizedDenseVector *)&v8 description];
  double v5 = [(AWDProactiveModelFittingQuantizedDenseVector *)self dictionaryRepresentation];
  float v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMinValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMinValue:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
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
    float v6 = (void *)MEMORY[0x263EFF940];
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

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingQuantizedDenseVector;
  [(AWDProactiveModelFittingQuantizedDenseVector *)&v3 dealloc];
}

@end