@interface APPBThirdPartySegmentUpdateRequest
+ (Class)segmentIdentifiersType;
+ (id)options;
- (BOOL)hasAppID;
- (BOOL)hasAppVersion;
- (BOOL)hasDPID;
- (BOOL)hasIAdID;
- (BOOL)hasPrivateSegment;
- (BOOL)hasResetSegmentMembership;
- (BOOL)hasRunState;
- (BOOL)hasToroID;
- (BOOL)isEqual:(id)a3;
- (BOOL)privateSegment;
- (BOOL)readFrom:(id)a3;
- (BOOL)resetSegmentMembership;
- (NSData)dPID;
- (NSData)iAdID;
- (NSData)toroID;
- (NSMutableArray)segmentIdentifiers;
- (NSString)appID;
- (NSString)appVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)runStateAsString:(int)a3;
- (id)segmentIdentifiersAtIndex:(unint64_t)a3;
- (int)StringAsRunState:(id)a3;
- (int)runState;
- (unint64_t)hash;
- (unint64_t)segmentIdentifiersCount;
- (void)addSegmentIdentifiers:(id)a3;
- (void)clearSegmentIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setDPID:(id)a3;
- (void)setHasPrivateSegment:(BOOL)a3;
- (void)setHasResetSegmentMembership:(BOOL)a3;
- (void)setHasRunState:(BOOL)a3;
- (void)setIAdID:(id)a3;
- (void)setPrivateSegment:(BOOL)a3;
- (void)setResetSegmentMembership:(BOOL)a3;
- (void)setRunState:(int)a3;
- (void)setSegmentIdentifiers:(id)a3;
- (void)setToroID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBThirdPartySegmentUpdateRequest

+ (id)options
{
  if (qword_100289A90 != -1) {
    dispatch_once(&qword_100289A90, &stru_100235EC8);
  }
  v2 = (void *)qword_100289A88;

  return v2;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasAppID
{
  return self->_appID != 0;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (int)runState
{
  if (*(unsigned char *)&self->_has) {
    return self->_runState;
  }
  else {
    return 0;
  }
}

- (void)setRunState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_runState = a3;
}

- (void)setHasRunState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRunState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)runStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_100235EE8 + a3);
  }

  return v3;
}

- (int)StringAsRunState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Simulator"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DevelopmentDevice"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConsumerDevice"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setResetSegmentMembership:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_resetSegmentMembership = a3;
}

- (void)setHasResetSegmentMembership:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResetSegmentMembership
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearSegmentIdentifiers
{
}

- (void)addSegmentIdentifiers:(id)a3
{
  id v4 = a3;
  segmentIdentifiers = self->_segmentIdentifiers;
  id v8 = v4;
  if (!segmentIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_segmentIdentifiers;
    self->_segmentIdentifiers = v6;

    id v4 = v8;
    segmentIdentifiers = self->_segmentIdentifiers;
  }
  [(NSMutableArray *)segmentIdentifiers addObject:v4];
}

- (unint64_t)segmentIdentifiersCount
{
  return (unint64_t)[(NSMutableArray *)self->_segmentIdentifiers count];
}

- (id)segmentIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_segmentIdentifiers objectAtIndex:a3];
}

+ (Class)segmentIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)setPrivateSegment:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_privateSegment = a3;
}

- (void)setHasPrivateSegment:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrivateSegment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasToroID
{
  return self->_toroID != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBThirdPartySegmentUpdateRequest;
  char v3 = [(APPBThirdPartySegmentUpdateRequest *)&v7 description];
  id v4 = [(APPBThirdPartySegmentUpdateRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  iAdID = self->_iAdID;
  if (iAdID) {
    [v3 setObject:iAdID forKey:@"iAdID"];
  }
  appID = self->_appID;
  if (appID) {
    [v4 setObject:appID forKey:@"appID"];
  }
  appVersion = self->_appVersion;
  if (appVersion) {
    [v4 setObject:appVersion forKey:@"appVersion"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t runState = self->_runState;
    if (runState >= 3)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_runState];
    }
    else
    {
      v10 = *(&off_100235EE8 + runState);
    }
    [v4 setObject:v10 forKey:@"runState"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11 = +[NSNumber numberWithBool:self->_resetSegmentMembership];
    [v4 setObject:v11 forKey:@"resetSegmentMembership"];
  }
  segmentIdentifiers = self->_segmentIdentifiers;
  if (segmentIdentifiers) {
    [v4 setObject:segmentIdentifiers forKey:@"segmentIdentifiers"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13 = +[NSNumber numberWithBool:self->_privateSegment];
    [v4 setObject:v13 forKey:@"privateSegment"];
  }
  toroID = self->_toroID;
  if (toroID) {
    [v4 setObject:toroID forKey:@"toroID"];
  }
  dPID = self->_dPID;
  if (dPID) {
    [v4 setObject:dPID forKey:@"DPID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBThirdPartySegmentUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_iAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_appID) {
    PBDataWriterWriteStringField();
  }
  if (self->_appVersion) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_segmentIdentifiers;
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
        PBDataWriterWriteStringField();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_toroID) {
    PBDataWriterWriteDataField();
  }
  if (self->_dPID) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  long long v11 = v4;
  if (self->_iAdID)
  {
    [v4 setIAdID:];
    id v4 = v11;
  }
  if (self->_appID)
  {
    [v11 setAppID:];
    id v4 = v11;
  }
  if (self->_appVersion)
  {
    [v11 setAppVersion:];
    id v4 = v11;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 10) = self->_runState;
    v4[68] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[65] = self->_resetSegmentMembership;
    v4[68] |= 4u;
  }
  if ([(APPBThirdPartySegmentUpdateRequest *)self segmentIdentifiersCount])
  {
    [v11 clearSegmentIdentifiers];
    unint64_t v6 = [(APPBThirdPartySegmentUpdateRequest *)self segmentIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(APPBThirdPartySegmentUpdateRequest *)self segmentIdentifiersAtIndex:i];
        [v11 addSegmentIdentifiers:v9];
      }
    }
  }
  v10 = v11;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11[64] = self->_privateSegment;
    v11[68] |= 2u;
  }
  if (self->_toroID)
  {
    [v11 setToroID:];
    v10 = v11;
  }
  if (self->_dPID)
  {
    [v11 setDPID:];
    v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSData *)self->_iAdID copyWithZone:a3];
  unint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_appID copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSString *)self->_appVersion copyWithZone:a3];
  long long v11 = (void *)v5[2];
  v5[2] = v10;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 10) = self->_runState;
    *((unsigned char *)v5 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v5 + 65) = self->_resetSegmentMembership;
    *((unsigned char *)v5 + 68) |= 4u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v13 = self->_segmentIdentifiers;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [v5 addSegmentIdentifiers:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v5 + 64) = self->_privateSegment;
    *((unsigned char *)v5 + 68) |= 2u;
  }
  id v19 = -[NSData copyWithZone:](self->_toroID, "copyWithZone:", a3, (void)v24);
  v20 = (void *)v5[7];
  v5[7] = v19;

  id v21 = [(NSData *)self->_dPID copyWithZone:a3];
  v22 = (void *)v5[3];
  v5[3] = v21;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:")) {
      goto LABEL_36;
    }
  }
  appID = self->_appID;
  if ((unint64_t)appID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appID, "isEqual:")) {
      goto LABEL_36;
    }
  }
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appVersion, "isEqual:")) {
      goto LABEL_36;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_runState != *((_DWORD *)v4 + 10)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0) {
      goto LABEL_36;
    }
    if (self->_resetSegmentMembership)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_36;
  }
  segmentIdentifiers = self->_segmentIdentifiers;
  if ((unint64_t)segmentIdentifiers | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](segmentIdentifiers, "isEqual:")) {
      goto LABEL_36;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) != 0)
    {
      if (self->_privateSegment)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_36;
        }
        goto LABEL_32;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_32;
      }
    }
LABEL_36:
    unsigned __int8 v12 = 0;
    goto LABEL_37;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0) {
    goto LABEL_36;
  }
LABEL_32:
  toroID = self->_toroID;
  if ((unint64_t)toroID | *((void *)v4 + 7) && !-[NSData isEqual:](toroID, "isEqual:")) {
    goto LABEL_36;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((void *)v4 + 3)) {
    unsigned __int8 v12 = -[NSData isEqual:](dPID, "isEqual:");
  }
  else {
    unsigned __int8 v12 = 1;
  }
LABEL_37:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_iAdID hash];
  NSUInteger v4 = [(NSString *)self->_appID hash];
  NSUInteger v5 = [(NSString *)self->_appVersion hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_runState;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_resetSegmentMembership;
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_segmentIdentifiers hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_privateSegment;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v11 = (unint64_t)[(NSData *)self->_toroID hash];
  return v10 ^ v11 ^ (unint64_t)[(NSData *)self->_dPID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[APPBThirdPartySegmentUpdateRequest setIAdID:](self, "setIAdID:");
  }
  if (*((void *)v4 + 1)) {
    -[APPBThirdPartySegmentUpdateRequest setAppID:](self, "setAppID:");
  }
  if (*((void *)v4 + 2)) {
    -[APPBThirdPartySegmentUpdateRequest setAppVersion:](self, "setAppVersion:");
  }
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_uint64_t runState = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if ((v5 & 4) != 0)
  {
    self->_resetSegmentMembership = *((unsigned char *)v4 + 65);
    *(unsigned char *)&self->_has |= 4u;
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
        -[APPBThirdPartySegmentUpdateRequest addSegmentIdentifiers:](self, "addSegmentIdentifiers:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_privateSegment = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 7)) {
    -[APPBThirdPartySegmentUpdateRequest setToroID:](self, "setToroID:");
  }
  if (*((void *)v4 + 3)) {
    -[APPBThirdPartySegmentUpdateRequest setDPID:](self, "setDPID:");
  }
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (BOOL)resetSegmentMembership
{
  return self->_resetSegmentMembership;
}

- (NSMutableArray)segmentIdentifiers
{
  return self->_segmentIdentifiers;
}

- (void)setSegmentIdentifiers:(id)a3
{
}

- (BOOL)privateSegment
{
  return self->_privateSegment;
}

- (NSData)toroID
{
  return self->_toroID;
}

- (void)setToroID:(id)a3
{
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_segmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);

  objc_storeStrong((id *)&self->_appID, 0);
}

@end