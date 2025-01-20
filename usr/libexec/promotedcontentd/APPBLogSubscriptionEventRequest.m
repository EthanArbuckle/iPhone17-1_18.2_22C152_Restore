@interface APPBLogSubscriptionEventRequest
+ (Class)infoType;
+ (id)options;
- (BOOL)hasAnonymousDemandiAdID;
- (BOOL)hasContentiAdID;
- (BOOL)hasEvent;
- (BOOL)hasEventTime;
- (BOOL)hasIAdID;
- (BOOL)hasQToken;
- (BOOL)hasSubscriptionSourceID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)anonymousDemandiAdID;
- (NSData)contentiAdID;
- (NSData)iAdID;
- (NSMutableArray)infos;
- (NSString)qToken;
- (NSString)subscriptionSourceID;
- (double)eventTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventAsString:(int)a3;
- (id)infoAtIndex:(unint64_t)a3;
- (int)StringAsEvent:(id)a3;
- (int)event;
- (unint64_t)hash;
- (unint64_t)infosCount;
- (void)addInfo:(id)a3;
- (void)clearInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymousDemandiAdID:(id)a3;
- (void)setContentiAdID:(id)a3;
- (void)setEvent:(int)a3;
- (void)setEventTime:(double)a3;
- (void)setHasEvent:(BOOL)a3;
- (void)setHasEventTime:(BOOL)a3;
- (void)setIAdID:(id)a3;
- (void)setInfos:(id)a3;
- (void)setQToken:(id)a3;
- (void)setSubscriptionSourceID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLogSubscriptionEventRequest

+ (id)options
{
  if (qword_100289B20 != -1) {
    dispatch_once(&qword_100289B20, &stru_100236150);
  }
  v2 = (void *)qword_100289B18;

  return v2;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasSubscriptionSourceID
{
  return self->_subscriptionSourceID != 0;
}

- (BOOL)hasQToken
{
  return self->_qToken != 0;
}

- (int)event
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_event;
  }
  else {
    return 0;
  }
}

- (void)setEvent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_event = a3;
}

- (void)setHasEvent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEvent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eventAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100236170 + a3);
  }

  return v3;
}

- (int)StringAsEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AlreadySubscribed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PurchasedSubscription"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AlreadySubscribedViaNativeAd"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PurchasedSubscriptionViaNativeAd"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEventTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventTime = a3;
}

- (void)setHasEventTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearInfos
{
}

- (void)addInfo:(id)a3
{
  id v4 = a3;
  infos = self->_infos;
  id v8 = v4;
  if (!infos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_infos;
    self->_infos = v6;

    id v4 = v8;
    infos = self->_infos;
  }
  [(NSMutableArray *)infos addObject:v4];
}

- (unint64_t)infosCount
{
  return (unint64_t)[(NSMutableArray *)self->_infos count];
}

- (id)infoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_infos objectAtIndex:a3];
}

+ (Class)infoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogSubscriptionEventRequest;
  id v3 = [(APPBLogSubscriptionEventRequest *)&v7 description];
  id v4 = [(APPBLogSubscriptionEventRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  iAdID = self->_iAdID;
  if (iAdID) {
    [v3 setObject:iAdID forKey:@"iAdID"];
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID) {
    [v4 setObject:anonymousDemandiAdID forKey:@"anonymousDemandiAdID"];
  }
  contentiAdID = self->_contentiAdID;
  if (contentiAdID) {
    [v4 setObject:contentiAdID forKey:@"contentiAdID"];
  }
  subscriptionSourceID = self->_subscriptionSourceID;
  if (subscriptionSourceID) {
    [v4 setObject:subscriptionSourceID forKey:@"subscriptionSourceID"];
  }
  qToken = self->_qToken;
  if (qToken) {
    [v4 setObject:qToken forKey:@"qToken"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t event = self->_event;
    if (event >= 5)
    {
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_event];
    }
    else
    {
      v12 = *(&off_100236170 + event);
    }
    [v4 setObject:v12 forKey:@"event"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = +[NSNumber numberWithDouble:self->_eventTime];
    [v4 setObject:v13 forKey:@"eventTime"];
  }
  if ([(NSMutableArray *)self->_infos count])
  {
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_infos, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_infos;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"info"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogSubscriptionEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_iAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_anonymousDemandiAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_contentiAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_subscriptionSourceID) {
    PBDataWriterWriteStringField();
  }
  if (self->_qToken) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_infos;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_iAdID)
  {
    [v4 setIAdID:];
    id v4 = v10;
  }
  if (self->_anonymousDemandiAdID)
  {
    [v10 setAnonymousDemandiAdID:];
    id v4 = v10;
  }
  if (self->_contentiAdID)
  {
    [v10 setContentiAdID:];
    id v4 = v10;
  }
  if (self->_subscriptionSourceID)
  {
    [v10 setSubscriptionSourceID:];
    id v4 = v10;
  }
  if (self->_qToken)
  {
    [v10 setQToken:];
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_event;
    *((unsigned char *)v4 + 72) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_eventTime;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if ([(APPBLogSubscriptionEventRequest *)self infosCount])
  {
    [v10 clearInfos];
    unint64_t v6 = [(APPBLogSubscriptionEventRequest *)self infosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(APPBLogSubscriptionEventRequest *)self infoAtIndex:i];
        [v10 addInfo:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSData *)self->_iAdID copyWithZone:a3];
  unint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NSData *)self->_anonymousDemandiAdID copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSData *)self->_contentiAdID copyWithZone:a3];
  long long v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(NSString *)self->_subscriptionSourceID copyWithZone:a3];
  long long v13 = (void *)v5[8];
  v5[8] = v12;

  id v14 = [(NSString *)self->_qToken copyWithZone:a3];
  v15 = (void *)v5[7];
  v5[7] = v14;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_event;
    *((unsigned char *)v5 + 72) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = *(void *)&self->_eventTime;
    *((unsigned char *)v5 + 72) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = self->_infos;
  id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [v5 addInfo:v22];
      }
      id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:")) {
      goto LABEL_24;
    }
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:")) {
      goto LABEL_24;
    }
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:")) {
      goto LABEL_24;
    }
  }
  subscriptionSourceID = self->_subscriptionSourceID;
  if ((unint64_t)subscriptionSourceID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](subscriptionSourceID, "isEqual:")) {
      goto LABEL_24;
    }
  }
  qToken = self->_qToken;
  if ((unint64_t)qToken | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](qToken, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_event != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
LABEL_24:
    unsigned __int8 v11 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_eventTime != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_24;
  }
  infos = self->_infos;
  if ((unint64_t)infos | *((void *)v4 + 6)) {
    unsigned __int8 v11 = -[NSMutableArray isEqual:](infos, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_iAdID hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_anonymousDemandiAdID hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_contentiAdID hash];
  NSUInteger v6 = [(NSString *)self->_subscriptionSourceID hash];
  NSUInteger v7 = [(NSString *)self->_qToken hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_event;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ (unint64_t)[(NSMutableArray *)self->_infos hash];
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double eventTime = self->_eventTime;
  double v10 = -eventTime;
  if (eventTime >= 0.0) {
    double v10 = self->_eventTime;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ (unint64_t)[(NSMutableArray *)self->_infos hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[APPBLogSubscriptionEventRequest setIAdID:](self, "setIAdID:");
  }
  if (*((void *)v4 + 2)) {
    -[APPBLogSubscriptionEventRequest setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
  }
  if (*((void *)v4 + 3)) {
    -[APPBLogSubscriptionEventRequest setContentiAdID:](self, "setContentiAdID:");
  }
  if (*((void *)v4 + 8)) {
    -[APPBLogSubscriptionEventRequest setSubscriptionSourceID:](self, "setSubscriptionSourceID:");
  }
  if (*((void *)v4 + 7)) {
    -[APPBLogSubscriptionEventRequest setQToken:](self, "setQToken:");
  }
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t event = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if (v5)
  {
    self->_double eventTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 6);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[APPBLogSubscriptionEventRequest addInfo:](self, "addInfo:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (void)setAnonymousDemandiAdID:(id)a3
{
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
}

- (NSString)subscriptionSourceID
{
  return self->_subscriptionSourceID;
}

- (void)setSubscriptionSourceID:(id)a3
{
}

- (NSString)qToken
{
  return self->_qToken;
}

- (void)setQToken:(id)a3
{
}

- (double)eventTime
{
  return self->_eventTime;
}

- (NSMutableArray)infos
{
  return self->_infos;
}

- (void)setInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionSourceID, 0);
  objc_storeStrong((id *)&self->_qToken, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);

  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
}

@end