@interface PBBProtoPopToControllerType
- (BOOL)hasIntendedFireDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)intendedFireDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)controllerType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setControllerType:(unsigned int)a3;
- (void)setHasIntendedFireDate:(BOOL)a3;
- (void)setIntendedFireDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoPopToControllerType

- (void)setIntendedFireDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_intendedFireDate = a3;
}

- (void)setHasIntendedFireDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIntendedFireDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoPopToControllerType;
  v4 = [(PBBProtoPopToControllerType *)&v8 description];
  v5 = [(PBBProtoPopToControllerType *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_controllerType];
  [v3 setObject:v4 forKey:@"controllerType"];

  if (*(unsigned char *)&self->_has)
  {
    v5 = [NSNumber numberWithDouble:self->_intendedFireDate];
    [v3 setObject:v5 forKey:@"intendedFireDate"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoPopToControllerTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_controllerType;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = *(void *)&self->_intendedFireDate;
    *((unsigned char *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_controllerType;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = *(void *)&self->_intendedFireDate;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_controllerType != *((_DWORD *)v4 + 4))
  {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_intendedFireDate == *((double *)v4 + 1))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  unsigned int controllerType = self->_controllerType;
  if (*(unsigned char *)&self->_has)
  {
    double intendedFireDate = self->_intendedFireDate;
    double v5 = -intendedFireDate;
    if (intendedFireDate >= 0.0) {
      double v5 = self->_intendedFireDate;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3 ^ (2654435761 * controllerType);
}

- (void)mergeFrom:(id)a3
{
  self->_unsigned int controllerType = *((_DWORD *)a3 + 4);
  if (*((unsigned char *)a3 + 20))
  {
    self->_double intendedFireDate = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)controllerType
{
  return self->_controllerType;
}

- (void)setControllerType:(unsigned int)a3
{
  self->_unsigned int controllerType = a3;
}

- (double)intendedFireDate
{
  return self->_intendedFireDate;
}

@end