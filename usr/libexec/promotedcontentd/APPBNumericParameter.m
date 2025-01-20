@interface APPBNumericParameter
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)value;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBNumericParameter

+ (id)options
{
  if (qword_100289AA0 != -1) {
    dispatch_once(&qword_100289AA0, &stru_100235F20);
  }
  v2 = (void *)qword_100289A98;

  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBNumericParameter;
  v3 = [(APPBNumericParameter *)&v7 description];
  v4 = [(APPBNumericParameter *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  v6 = +[NSNumber numberWithInt:self->_value];
  [v4 setObject:v6 forKey:@"value"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBNumericParameterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    sub_10019A7B8();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 setKey:key];
  v5[4] = self->_value;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  *((_DWORD *)v5 + 4) = self->_value;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | *((void *)v4 + 1)))
     || -[NSString isEqual:](key, "isEqual:"))
    && self->_value == *((_DWORD *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_value) ^ [(NSString *)self->_key hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[APPBNumericParameter setKey:](self, "setKey:");
    id v4 = v5;
  }
  self->_value = v4[4];
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (int)value
{
  return self->_value;
}

- (void)setValue:(int)a3
{
  self->_value = a3;
}

- (void).cxx_destruct
{
}

@end