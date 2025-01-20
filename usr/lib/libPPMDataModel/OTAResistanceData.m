@interface OTAResistanceData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)resistance25CAtIndex:(unint64_t)a3;
- (float)resistance25Cs;
- (float)temperatureCoeffAtIndex:(unint64_t)a3;
- (float)temperatureCoeffs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)resistance25CsCount;
- (unint64_t)temperatureCoeffsCount;
- (void)addResistance25C:(float)a3;
- (void)addTemperatureCoeff:(float)a3;
- (void)clearResistance25Cs;
- (void)clearTemperatureCoeffs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setResistance25Cs:(float *)a3 count:(unint64_t)a4;
- (void)setTemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation OTAResistanceData

- (void)dealloc
{
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)OTAResistanceData;
  [(OTAResistanceData *)&v3 dealloc];
}

- (unint64_t)resistance25CsCount
{
  return self->_resistance25Cs.count;
}

- (float)resistance25Cs
{
  return self->_resistance25Cs.list;
}

- (void)clearResistance25Cs
{
}

- (void)addResistance25C:(float)a3
{
}

- (float)resistance25CAtIndex:(unint64_t)a3
{
  p_resistance25Cs = &self->_resistance25Cs;
  unint64_t count = self->_resistance25Cs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_resistance25Cs->list[a3];
}

- (void)setResistance25Cs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)temperatureCoeffsCount
{
  return self->_temperatureCoeffs.count;
}

- (float)temperatureCoeffs
{
  return self->_temperatureCoeffs.list;
}

- (void)clearTemperatureCoeffs
{
}

- (void)addTemperatureCoeff:(float)a3
{
}

- (float)temperatureCoeffAtIndex:(unint64_t)a3
{
  p_temperatureCoeffs = &self->_temperatureCoeffs;
  unint64_t count = self->_temperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_temperatureCoeffs->list[a3];
}

- (void)setTemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTAResistanceData;
  v4 = [(OTAResistanceData *)&v8 description];
  v5 = [(OTAResistanceData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  objc_super v3 = PBRepeatedFloatNSArray();
  [v2 setObject:v3 forKey:@"resistance25C"];

  v4 = PBRepeatedFloatNSArray();
  [v2 setObject:v4 forKey:@"temperatureCoeff"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return OTAResistanceDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_resistance25Cs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v8;
      ++v5;
    }
    while (v5 < self->_resistance25Cs.count);
  }
  p_temperatureCoeffs = &self->_temperatureCoeffs;
  if (p_temperatureCoeffs->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_temperatureCoeffs->count);
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if ([(OTAResistanceData *)self resistance25CsCount])
  {
    [v10 clearResistance25Cs];
    unint64_t v4 = [(OTAResistanceData *)self resistance25CsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(OTAResistanceData *)self resistance25CAtIndex:i];
        [v10 addResistance25C:];
      }
    }
  }
  if ([(OTAResistanceData *)self temperatureCoeffsCount])
  {
    [v10 clearTemperatureCoeffs];
    unint64_t v7 = [(OTAResistanceData *)self temperatureCoeffsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        [(OTAResistanceData *)self temperatureCoeffAtIndex:j];
        [v10 addTemperatureCoeff:];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()] && PBRepeatedFloatIsEqual()) {
    char IsEqual = PBRepeatedFloatIsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2 = PBRepeatedFloatHash();
  return PBRepeatedFloatHash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 resistance25CsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v10 resistance25CAtIndex:i];
      -[OTAResistanceData addResistance25C:](self, "addResistance25C:");
    }
  }
  uint64_t v7 = [v10 temperatureCoeffsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
    {
      [v10 temperatureCoeffAtIndex:j];
      -[OTAResistanceData addTemperatureCoeff:](self, "addTemperatureCoeff:");
    }
  }
}

@end