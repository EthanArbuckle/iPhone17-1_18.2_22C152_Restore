@interface TRANSITPbTransitMac
- (BOOL)hasMac;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)mac;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMac:(BOOL)a3;
- (void)setMac:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbTransitMac

- (void)setMac:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mac = a3;
}

- (void)setHasMac:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMac
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitMac;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbTransitMac *)&v3 description], [(TRANSITPbTransitMac *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_mac)] forKey:@"mac"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100DE7038((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_mac;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = self->_mac;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) == 0;
    if (*(unsigned char *)&self->_has) {
      LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) != 0 && self->_mac == *((void *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_mac;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_mac = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)mac
{
  return self->_mac;
}

@end