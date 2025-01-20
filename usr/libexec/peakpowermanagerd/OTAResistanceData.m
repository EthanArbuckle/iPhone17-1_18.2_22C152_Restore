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
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
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
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_temperatureCoeffs->list[a3];
}

- (void)setTemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTAResistanceData;
  objc_super v3 = [(OTAResistanceData *)&v7 description];
  v4 = [(OTAResistanceData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = +[NSMutableDictionary dictionary];
  objc_super v3 = PBRepeatedFloatNSArray();
  [v2 setObject:v3 forKey:@"resistance25C"];

  v4 = PBRepeatedFloatNSArray();
  [v2 setObject:v4 forKey:@"temperatureCoeff"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100004350((uint64_t)self, (uint64_t)a3);
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
  id v3 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
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
  unint64_t v4 = (char *)[v10 resistance25CsCount];
  if (v4)
  {
    unint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v10 resistance25CAtIndex:i];
      -[OTAResistanceData addResistance25C:](self, "addResistance25C:");
    }
  }
  unint64_t v7 = (char *)[v10 temperatureCoeffsCount];
  if (v7)
  {
    unint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
    {
      [v10 temperatureCoeffAtIndex:j];
      -[OTAResistanceData addTemperatureCoeff:](self, "addTemperatureCoeff:");
    }
  }
}

@end