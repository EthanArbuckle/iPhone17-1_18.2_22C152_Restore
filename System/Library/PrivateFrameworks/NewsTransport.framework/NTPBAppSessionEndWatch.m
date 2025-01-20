@interface NTPBAppSessionEndWatch
- (BOOL)hasWatchAppSessionDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)watchAppSessionDuration;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasWatchAppSessionDuration:(BOOL)a3;
- (void)setWatchAppSessionDuration:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAppSessionEndWatch

- (void)setWatchAppSessionDuration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_watchAppSessionDuration = a3;
}

- (void)setHasWatchAppSessionDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWatchAppSessionDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAppSessionEndWatch;
  v4 = [(NTPBAppSessionEndWatch *)&v8 description];
  v5 = [(NTPBAppSessionEndWatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_watchAppSessionDuration];
    [v3 setObject:v4 forKey:@"watch_app_session_duration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppSessionEndWatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = self->_watchAppSessionDuration;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_watchAppSessionDuration == *((void *)v4 + 1))
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
    return 2654435761 * self->_watchAppSessionDuration;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_watchAppSessionDuration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int64_t)watchAppSessionDuration
{
  return self->_watchAppSessionDuration;
}

@end