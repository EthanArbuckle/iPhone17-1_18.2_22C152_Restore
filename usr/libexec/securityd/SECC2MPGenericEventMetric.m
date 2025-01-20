@interface SECC2MPGenericEventMetric
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (SECC2MPGenericEventMetricValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPGenericEventMetric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setValue:(id)a3
{
}

- (SECC2MPGenericEventMetricValue)value
{
  return self->_value;
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
  v7 = v4;
  if (v4[1])
  {
    -[SECC2MPGenericEventMetric setKey:](self, "setKey:");
    v4 = v7;
  }
  value = self->_value;
  uint64_t v6 = v4[2];
  if (value)
  {
    if (v6) {
      -[SECC2MPGenericEventMetricValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SECC2MPGenericEventMetric setValue:](self, "setValue:");
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(SECC2MPGenericEventMetricValue *)self->_value hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      unsigned __int8 v7 = -[SECC2MPGenericEventMetricValue isEqual:](value, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SECC2MPGenericEventMetricValue *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    [v4 setKey:];
    id v4 = v5;
  }
  if (self->_value)
  {
    [v5 setValue:];
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_100085594((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value)
  {
    unsigned __int8 v7 = [(SECC2MPGenericEventMetricValue *)value dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPGenericEventMetric;
  NSUInteger v3 = [(SECC2MPGenericEventMetric *)&v7 description];
  id v4 = [(SECC2MPGenericEventMetric *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

@end