@interface NTPBComscoreEventSend
- (BOOL)hasComscoreEventType;
- (BOOL)hasContentViewedId;
- (BOOL)hasEventUdid;
- (BOOL)hasFailureReasonCode;
- (BOOL)hasResultType;
- (BOOL)hasSourceChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contentViewedId;
- (NSString)eventUdid;
- (NSString)failureReasonCode;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)comscoreEventType;
- (int)resultType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setComscoreEventType:(int)a3;
- (void)setContentViewedId:(id)a3;
- (void)setEventUdid:(id)a3;
- (void)setFailureReasonCode:(id)a3;
- (void)setHasComscoreEventType:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setResultType:(int)a3;
- (void)setSourceChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBComscoreEventSend

- (int)comscoreEventType
{
  if (*(unsigned char *)&self->_has) {
    return self->_comscoreEventType;
  }
  else {
    return 0;
  }
}

- (void)setComscoreEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_comscoreEventType = a3;
}

- (void)setHasComscoreEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComscoreEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)resultType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResultType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasEventUdid
{
  return self->_eventUdid != 0;
}

- (BOOL)hasFailureReasonCode
{
  return self->_failureReasonCode != 0;
}

- (BOOL)hasContentViewedId
{
  return self->_contentViewedId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBComscoreEventSend;
  v4 = [(NTPBComscoreEventSend *)&v8 description];
  v5 = [(NTPBComscoreEventSend *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithInt:self->_comscoreEventType];
    [v3 setObject:v5 forKey:@"comscore_event_type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_resultType];
    [v3 setObject:v6 forKey:@"result_type"];
  }
  eventUdid = self->_eventUdid;
  if (eventUdid) {
    [v3 setObject:eventUdid forKey:@"event_udid"];
  }
  failureReasonCode = self->_failureReasonCode;
  if (failureReasonCode) {
    [v3 setObject:failureReasonCode forKey:@"failure_reason_code"];
  }
  contentViewedId = self->_contentViewedId;
  if (contentViewedId) {
    [v3 setObject:contentViewedId forKey:@"content_viewed_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBComscoreEventSendReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_eventUdid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_failureReasonCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_contentViewedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_comscoreEventType;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_resultType;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_eventUdid copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  uint64_t v10 = [(NSString *)self->_failureReasonCode copyWithZone:a3];
  v11 = (void *)v6[4];
  v6[4] = v10;

  uint64_t v12 = [(NSString *)self->_contentViewedId copyWithZone:a3];
  v13 = (void *)v6[2];
  v6[2] = v12;

  uint64_t v14 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v15 = (void *)v6[6];
  v6[6] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_comscoreEventType != *((_DWORD *)v4 + 2)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_resultType != *((_DWORD *)v4 + 10)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_20;
  }
  eventUdid = self->_eventUdid;
  if ((unint64_t)eventUdid | *((void *)v4 + 3) && !-[NSString isEqual:](eventUdid, "isEqual:")) {
    goto LABEL_20;
  }
  failureReasonCode = self->_failureReasonCode;
  if ((unint64_t)failureReasonCode | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](failureReasonCode, "isEqual:")) {
      goto LABEL_20;
    }
  }
  contentViewedId = self->_contentViewedId;
  if ((unint64_t)contentViewedId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](contentViewedId, "isEqual:")) {
      goto LABEL_20;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 6)) {
    char v9 = -[NSString isEqual:](sourceChannelId, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_comscoreEventType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_resultType;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_eventUdid hash];
  NSUInteger v6 = [(NSString *)self->_failureReasonCode hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_contentViewedId hash];
  return v7 ^ [(NSString *)self->_sourceChannelId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_comscoreEventType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_resultType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBComscoreEventSend setEventUdid:](self, "setEventUdid:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBComscoreEventSend setFailureReasonCode:](self, "setFailureReasonCode:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBComscoreEventSend setContentViewedId:](self, "setContentViewedId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBComscoreEventSend setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v6;
  }
}

- (NSString)eventUdid
{
  return self->_eventUdid;
}

- (void)setEventUdid:(id)a3
{
}

- (NSString)failureReasonCode
{
  return self->_failureReasonCode;
}

- (void)setFailureReasonCode:(id)a3
{
}

- (NSString)contentViewedId
{
  return self->_contentViewedId;
}

- (void)setContentViewedId:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_failureReasonCode, 0);
  objc_storeStrong((id *)&self->_eventUdid, 0);

  objc_storeStrong((id *)&self->_contentViewedId, 0);
}

@end