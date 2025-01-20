@interface AMPMusicFeature
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (float)valueAtIndex:(unint64_t)a3;
- (float)values;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)addValue:(float)a3;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValues:(float *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AMPMusicFeature

- (void).cxx_destruct
{
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v8 = v4;
  if (v4[4])
  {
    -[AMPMusicFeature setKey:](self, "setKey:");
    v4 = v8;
  }
  v5 = (char *)[v4 valuesCount];
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      [v8 valueAtIndex:i];
      -[AMPMusicFeature addValue:](self, "addValue:");
    }
  }
}

- (unint64_t)hash
{
  NSUInteger v2 = [(NSString *)self->_key hash];
  return PBRepeatedFloatHash() ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[4])) || -[NSString isEqual:](key, "isEqual:")))
  {
    char IsEqual = PBRepeatedFloatIsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedFloatCopy();
  return v5;
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if (self->_key) {
    objc_msgSend(v7, "setKey:");
  }
  if ([(AMPMusicFeature *)self valuesCount])
  {
    [v7 clearValues];
    unint64_t v4 = [(AMPMusicFeature *)self valuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(AMPMusicFeature *)self valueAtIndex:i];
        objc_msgSend(v7, "addValue:");
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  p_values = &self->_values;
  if (p_values->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_values->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007F018((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  unint64_t v6 = PBRepeatedFloatNSArray();
  [v4 setObject:v6 forKey:@"value"];

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AMPMusicFeature;
  v3 = [(AMPMusicFeature *)&v7 description];
  id v4 = [(AMPMusicFeature *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (void)setValues:(float *)a3 count:(unint64_t)a4
{
}

- (float)valueAtIndex:(unint64_t)a3
{
  p_values = &self->_values;
  unint64_t count = self->_values.count;
  if (count <= a3)
  {
    unint64_t v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    objc_super v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_values->list[a3];
}

- (void)addValue:(float)a3
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

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)dealloc
{
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)AMPMusicFeature;
  [(AMPMusicFeature *)&v3 dealloc];
}

@end