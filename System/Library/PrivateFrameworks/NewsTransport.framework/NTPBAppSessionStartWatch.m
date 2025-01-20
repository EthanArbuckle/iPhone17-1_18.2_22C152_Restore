@interface NTPBAppSessionStartWatch
- (BOOL)hasSessionStartMethodWatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionStartMethodWatch;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionStartMethodWatch:(BOOL)a3;
- (void)setSessionStartMethodWatch:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAppSessionStartWatch

- (int)sessionStartMethodWatch
{
  if (*(unsigned char *)&self->_has) {
    return self->_sessionStartMethodWatch;
  }
  else {
    return 0;
  }
}

- (void)setSessionStartMethodWatch:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionStartMethodWatch = a3;
}

- (void)setHasSessionStartMethodWatch:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionStartMethodWatch
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAppSessionStartWatch;
  v4 = [(NTPBAppSessionStartWatch *)&v8 description];
  v5 = [(NTPBAppSessionStartWatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_sessionStartMethodWatch];
    [v3 setObject:v4 forKey:@"session_start_method_watch"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppSessionStartWatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_sessionStartMethodWatch;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_sessionStartMethodWatch == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_sessionStartMethodWatch;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_sessionStartMethodWatch = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end