@interface WOHealthBridgeKeyedNumber
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (double)number;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setNumber:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation WOHealthBridgeKeyedNumber

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WOHealthBridgeKeyedNumber;
  v4 = [(WOHealthBridgeKeyedNumber *)&v8 description];
  v5 = [(WOHealthBridgeKeyedNumber *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  v6 = [NSNumber numberWithDouble:self->_number];
  [v4 setObject:v6 forKey:@"number"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WOHealthBridgeKeyedNumberReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    -[WOHealthBridgeKeyedNumber writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  key = self->_key;
  id v5 = (double *)a3;
  [v5 setKey:key];
  v5[1] = self->_number;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_number;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | *((void *)v4 + 2)))
     || -[NSString isEqual:](key, "isEqual:"))
    && self->_number == *((double *)v4 + 1);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  double number = self->_number;
  double v5 = -number;
  if (number >= 0.0) {
    double v5 = self->_number;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  double v10 = fabs(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if (*((void *)v4 + 2))
  {
    double v5 = v4;
    -[WOHealthBridgeKeyedNumber setKey:](self, "setKey:");
    id v4 = v5;
  }
  self->_double number = v4[1];
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (double)number
{
  return self->_number;
}

- (void)setNumber:(double)a3
{
  self->_double number = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[WOHealthBridgeKeyedNumber writeTo:]", "WOHealthBridgeKeyedNumber.m", 79, "nil != self->_key");
}

@end