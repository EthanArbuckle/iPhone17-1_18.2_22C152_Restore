@interface WOHealthBridgeKeyedDate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (double)timeSinceReferenceDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setTimeSinceReferenceDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation WOHealthBridgeKeyedDate

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WOHealthBridgeKeyedDate;
  v4 = [(WOHealthBridgeKeyedDate *)&v8 description];
  v5 = [(WOHealthBridgeKeyedDate *)self dictionaryRepresentation];
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
  v6 = [NSNumber numberWithDouble:self->_timeSinceReferenceDate];
  [v4 setObject:v6 forKey:@"timeSinceReferenceDate"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WOHealthBridgeKeyedDateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    -[WOHealthBridgeKeyedDate writeTo:]();
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
  v5[1] = self->_timeSinceReferenceDate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_timeSinceReferenceDate;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | *((void *)v4 + 2)))
     || -[NSString isEqual:](key, "isEqual:"))
    && self->_timeSinceReferenceDate == *((double *)v4 + 1);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  double timeSinceReferenceDate = self->_timeSinceReferenceDate;
  double v5 = -timeSinceReferenceDate;
  if (timeSinceReferenceDate >= 0.0) {
    double v5 = self->_timeSinceReferenceDate;
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
    -[WOHealthBridgeKeyedDate setKey:](self, "setKey:");
    id v4 = v5;
  }
  self->_double timeSinceReferenceDate = v4[1];
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (double)timeSinceReferenceDate
{
  return self->_timeSinceReferenceDate;
}

- (void)setTimeSinceReferenceDate:(double)a3
{
  self->_double timeSinceReferenceDate = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[WOHealthBridgeKeyedDate writeTo:]", "WOHealthBridgeKeyedDate.m", 79, "nil != self->_key");
}

@end