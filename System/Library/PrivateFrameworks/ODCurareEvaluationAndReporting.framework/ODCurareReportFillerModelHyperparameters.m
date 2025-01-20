@interface ODCurareReportFillerModelHyperparameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)hyperparameterValues;
- (float)hyperparameterValuesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)hyperparameterIndicesCount;
- (unint64_t)hyperparameterValuesCount;
- (unsigned)hyperparameterIndices;
- (unsigned)hyperparameterIndicesAtIndex:(unint64_t)a3;
- (unsigned)versionNumber;
- (void)addHyperparameterIndices:(unsigned int)a3;
- (void)addHyperparameterValues:(float)a3;
- (void)clearHyperparameterIndices;
- (void)clearHyperparameterValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHyperparameterIndices:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHyperparameterValues:(float *)a3 count:(unint64_t)a4;
- (void)setVersionNumber:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerModelHyperparameters

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)ODCurareReportFillerModelHyperparameters;
  [(ODCurareReportFillerModelHyperparameters *)&v3 dealloc];
}

- (unint64_t)hyperparameterIndicesCount
{
  return self->_hyperparameterIndices.count;
}

- (unsigned)hyperparameterIndices
{
  return self->_hyperparameterIndices.list;
}

- (void)clearHyperparameterIndices
{
}

- (void)addHyperparameterIndices:(unsigned int)a3
{
}

- (unsigned)hyperparameterIndicesAtIndex:(unint64_t)a3
{
  p_hyperparameterIndices = &self->_hyperparameterIndices;
  unint64_t count = self->_hyperparameterIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_hyperparameterIndices->list[a3];
}

- (void)setHyperparameterIndices:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)hyperparameterValuesCount
{
  return self->_hyperparameterValues.count;
}

- (float)hyperparameterValues
{
  return self->_hyperparameterValues.list;
}

- (void)clearHyperparameterValues
{
}

- (void)addHyperparameterValues:(float)a3
{
}

- (float)hyperparameterValuesAtIndex:(unint64_t)a3
{
  p_hyperparameterValues = &self->_hyperparameterValues;
  unint64_t count = self->_hyperparameterValues.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_hyperparameterValues->list[a3];
}

- (void)setHyperparameterValues:(float *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerModelHyperparameters;
  v4 = [(ODCurareReportFillerModelHyperparameters *)&v8 description];
  v5 = [(ODCurareReportFillerModelHyperparameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_versionNumber];
  [v3 setObject:v4 forKey:@"versionNumber"];

  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"hyperparameterIndices"];

  v6 = PBRepeatedFloatNSArray();
  [v3 setObject:v6 forKey:@"hyperparameterValues"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerModelHyperparametersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hyperparameterIndices.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_hyperparameterIndices.count);
  }
  p_hyperparameterValues = &self->_hyperparameterValues;
  if (p_hyperparameterValues->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v6;
    }
    while (v6 < p_hyperparameterValues->count);
  }
}

- (void)copyTo:(id)a3
{
  v10 = a3;
  v10[14] = self->_versionNumber;
  if ([(ODCurareReportFillerModelHyperparameters *)self hyperparameterIndicesCount])
  {
    [v10 clearHyperparameterIndices];
    unint64_t v4 = [(ODCurareReportFillerModelHyperparameters *)self hyperparameterIndicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v10, "addHyperparameterIndices:", -[ODCurareReportFillerModelHyperparameters hyperparameterIndicesAtIndex:](self, "hyperparameterIndicesAtIndex:", i));
    }
  }
  if ([(ODCurareReportFillerModelHyperparameters *)self hyperparameterValuesCount])
  {
    [v10 clearHyperparameterValues];
    unint64_t v7 = [(ODCurareReportFillerModelHyperparameters *)self hyperparameterValuesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        [(ODCurareReportFillerModelHyperparameters *)self hyperparameterValuesAtIndex:j];
        objc_msgSend(v10, "addHyperparameterValues:");
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[14] = self->_versionNumber;
  PBRepeatedUInt32Copy();
  PBRepeatedFloatCopy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_versionNumber == v4[14]
    && PBRepeatedUInt32IsEqual())
  {
    char IsEqual = PBRepeatedFloatIsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_versionNumber;
  uint64_t v3 = PBRepeatedUInt32Hash();
  return v2 ^ v3 ^ PBRepeatedFloatHash();
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_versionNumber = v4[14];
  id v11 = v4;
  uint64_t v5 = [v4 hyperparameterIndicesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[ODCurareReportFillerModelHyperparameters addHyperparameterIndices:](self, "addHyperparameterIndices:", [v11 hyperparameterIndicesAtIndex:i]);
  }
  uint64_t v8 = [v11 hyperparameterValuesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
    {
      [v11 hyperparameterValuesAtIndex:j];
      -[ODCurareReportFillerModelHyperparameters addHyperparameterValues:](self, "addHyperparameterValues:");
    }
  }
}

- (unsigned)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(unsigned int)a3
{
  self->_versionNumber = a3;
}

@end