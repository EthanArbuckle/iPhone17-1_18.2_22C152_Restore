@interface TRANSITPbMacModePair
- (BOOL)hasMac;
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)mac;
- (double)mode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setMac:(id)a3;
- (void)setMode:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbMacModePair

- (void)dealloc
{
  [(TRANSITPbMacModePair *)self setMac:0];
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbMacModePair;
  [(TRANSITPbMacModePair *)&v3 dealloc];
}

- (BOOL)hasMac
{
  return self->_mac != 0;
}

- (void)setMode:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbMacModePair;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbMacModePair *)&v3 description], [(TRANSITPbMacModePair *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  mac = self->_mac;
  if (mac) {
    [v3 setObject:mac forKey:@"mac"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[NSNumber numberWithDouble:self->_mode] forKey:@"mode"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101380458((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_mac) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_mac) {
    [a3 setMac:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = *(void *)&self->_mode;
    *((unsigned char *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[2] = [(NSString *)self->_mac copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(id *)&self->_mode;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    mac = self->_mac;
    if (!((unint64_t)mac | *((void *)a3 + 2))
      || (unsigned int v5 = -[NSString isEqual:](mac, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_mode == *((double *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mac hash];
  if (*(unsigned char *)&self->_has)
  {
    double mode = self->_mode;
    double v6 = -mode;
    if (mode >= 0.0) {
      double v6 = self->_mode;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[TRANSITPbMacModePair setMac:](self, "setMac:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_double mode = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)mac
{
  return self->_mac;
}

- (void)setMac:(id)a3
{
}

- (double)mode
{
  return self->_mode;
}

@end