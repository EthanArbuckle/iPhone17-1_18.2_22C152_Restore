@interface WiFiAnalyticsAWDWiFiNWActivityStateBin
- (BOOL)hasResidentTime;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)residentTime;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasResidentTime:(BOOL)a3;
- (void)setResidentTime:(unint64_t)a3;
- (void)setState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityStateBin

- (void).cxx_destruct
{
}

- (void)setState:(id)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)setResidentTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_residentTime = a3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  state = self->_state;
  if (state) {
    [v3 setObject:state forKey:@"state"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_residentTime];
    [v4 setObject:v6 forKey:@"residentTime"];
  }
  return v4;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (void)setHasResidentTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResidentTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityStateBin;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityStateBin *)&v8 description];
  id v5 = [(WiFiAnalyticsAWDWiFiNWActivityStateBin *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityStateBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_state)
  {
    id v5 = v4;
    objc_msgSend(v4, "setState:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_residentTime;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_state copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_residentTime;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  state = self->_state;
  if ((unint64_t)state | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](state, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_residentTime == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_state hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_residentTime;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[WiFiAnalyticsAWDWiFiNWActivityStateBin setState:](self, "setState:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_residentTime = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)state
{
  return self->_state;
}

- (unint64_t)residentTime
{
  return self->_residentTime;
}

@end