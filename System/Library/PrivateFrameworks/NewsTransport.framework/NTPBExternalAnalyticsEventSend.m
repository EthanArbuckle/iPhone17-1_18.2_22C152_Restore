@interface NTPBExternalAnalyticsEventSend
- (BOOL)hasContentViewedId;
- (BOOL)hasEventUdid;
- (BOOL)hasExternalAnalyticsEventType;
- (BOOL)hasExternalAnalyticsId;
- (BOOL)hasFailureReasonCode;
- (BOOL)hasResultType;
- (BOOL)hasSourceChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contentViewedId;
- (NSString)eventUdid;
- (NSString)externalAnalyticsId;
- (NSString)failureReasonCode;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)externalAnalyticsEventType;
- (int)resultType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setContentViewedId:(id)a3;
- (void)setEventUdid:(id)a3;
- (void)setExternalAnalyticsEventType:(int)a3;
- (void)setExternalAnalyticsId:(id)a3;
- (void)setFailureReasonCode:(id)a3;
- (void)setHasExternalAnalyticsEventType:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setResultType:(int)a3;
- (void)setSourceChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBExternalAnalyticsEventSend

- (int)externalAnalyticsEventType
{
  if (*(unsigned char *)&self->_has) {
    return self->_externalAnalyticsEventType;
  }
  else {
    return 0;
  }
}

- (void)setExternalAnalyticsEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_externalAnalyticsEventType = a3;
}

- (void)setHasExternalAnalyticsEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExternalAnalyticsEventType
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

- (BOOL)hasExternalAnalyticsId
{
  return self->_externalAnalyticsId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBExternalAnalyticsEventSend;
  v4 = [(NTPBExternalAnalyticsEventSend *)&v8 description];
  v5 = [(NTPBExternalAnalyticsEventSend *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithInt:self->_externalAnalyticsEventType];
    [v3 setObject:v5 forKey:@"external_analytics_event_type"];

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
  externalAnalyticsId = self->_externalAnalyticsId;
  if (externalAnalyticsId) {
    [v3 setObject:externalAnalyticsId forKey:@"external_analytics_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBExternalAnalyticsEventSendReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_externalAnalyticsId)
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
    *(_DWORD *)(v5 + 24) = self->_externalAnalyticsEventType;
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_resultType;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_eventUdid copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  uint64_t v10 = [(NSString *)self->_failureReasonCode copyWithZone:a3];
  v11 = (void *)v6[5];
  v6[5] = v10;

  uint64_t v12 = [(NSString *)self->_contentViewedId copyWithZone:a3];
  v13 = (void *)v6[1];
  v6[1] = v12;

  uint64_t v14 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v15 = (void *)v6[7];
  v6[7] = v14;

  uint64_t v16 = [(NSString *)self->_externalAnalyticsId copyWithZone:a3];
  v17 = (void *)v6[4];
  v6[4] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_externalAnalyticsEventType != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_resultType != *((_DWORD *)v4 + 12)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_22;
  }
  eventUdid = self->_eventUdid;
  if ((unint64_t)eventUdid | *((void *)v4 + 2) && !-[NSString isEqual:](eventUdid, "isEqual:")) {
    goto LABEL_22;
  }
  failureReasonCode = self->_failureReasonCode;
  if ((unint64_t)failureReasonCode | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](failureReasonCode, "isEqual:")) {
      goto LABEL_22;
    }
  }
  contentViewedId = self->_contentViewedId;
  if ((unint64_t)contentViewedId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](contentViewedId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  externalAnalyticsId = self->_externalAnalyticsId;
  if ((unint64_t)externalAnalyticsId | *((void *)v4 + 4)) {
    char v10 = -[NSString isEqual:](externalAnalyticsId, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_externalAnalyticsEventType;
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
  NSUInteger v8 = [(NSString *)self->_sourceChannelId hash];
  return v7 ^ v8 ^ [(NSString *)self->_externalAnalyticsId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 64);
  if (v5)
  {
    self->_externalAnalyticsEventType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 64);
  }
  if ((v5 & 2) != 0)
  {
    self->_resultType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBExternalAnalyticsEventSend setEventUdid:](self, "setEventUdid:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[NTPBExternalAnalyticsEventSend setFailureReasonCode:](self, "setFailureReasonCode:");
    id v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBExternalAnalyticsEventSend setContentViewedId:](self, "setContentViewedId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBExternalAnalyticsEventSend setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBExternalAnalyticsEventSend setExternalAnalyticsId:](self, "setExternalAnalyticsId:");
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

- (NSString)externalAnalyticsId
{
  return self->_externalAnalyticsId;
}

- (void)setExternalAnalyticsId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_failureReasonCode, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsId, 0);
  objc_storeStrong((id *)&self->_eventUdid, 0);

  objc_storeStrong((id *)&self->_contentViewedId, 0);
}

@end