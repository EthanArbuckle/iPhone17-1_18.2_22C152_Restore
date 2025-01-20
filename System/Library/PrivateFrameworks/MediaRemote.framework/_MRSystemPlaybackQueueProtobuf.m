@interface _MRSystemPlaybackQueueProtobuf
- (BOOL)hasCustomData;
- (BOOL)hasFeatureName;
- (BOOL)hasIsRequestingImmediatePlayback;
- (BOOL)hasMetrics;
- (BOOL)hasReplaceIntent;
- (BOOL)hasTracklist;
- (BOOL)hasUserInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequestingImmediatePlayback;
- (BOOL)readFrom:(id)a3;
- (NSData)metrics;
- (NSData)userInfo;
- (NSString)featureName;
- (_MRSystemPlaybackCustomDataQueueProtobuf)customData;
- (_MRSystemPlaybackGenericTracklistQueueProtobuf)tracklist;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)replaceIntentAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsReplaceIntent:(id)a3;
- (int)StringAsType:(id)a3;
- (int)replaceIntent;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCustomData:(id)a3;
- (void)setFeatureName:(id)a3;
- (void)setHasIsRequestingImmediatePlayback:(BOOL)a3;
- (void)setHasReplaceIntent:(BOOL)a3;
- (void)setIsRequestingImmediatePlayback:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setReplaceIntent:(int)a3;
- (void)setTracklist:(id)a3;
- (void)setType:(int)a3;
- (void)setUserInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSystemPlaybackQueueProtobuf

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D6548[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SystemPlaybackQueueTypeUnknown"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SystemPlaybackQueueTypeGeneric"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SystemPlaybackQueueTypeCustom"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SystemPlaybackQueueTypeEmpty"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)replaceIntent
{
  if (*(unsigned char *)&self->_has) {
    return self->_replaceIntent;
  }
  else {
    return 1;
  }
}

- (void)setReplaceIntent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_replaceIntent = a3;
}

- (void)setHasReplaceIntent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReplaceIntent
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)replaceIntentAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E57D6568[a3 - 1];
  }

  return v3;
}

- (int)StringAsReplaceIntent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SystemPlaybackQueueReplaceIntentNonDestructive"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SystemPlaybackQueueReplaceIntentClearUpNext"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SystemPlaybackQueueReplaceIntentKeepUpNext"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SystemPlaybackQueueReplaceIntentLeaveSharedSession"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setIsRequestingImmediatePlayback:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isRequestingImmediatePlayback = a3;
}

- (void)setHasIsRequestingImmediatePlayback:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsRequestingImmediatePlayback
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasFeatureName
{
  return self->_featureName != 0;
}

- (BOOL)hasCustomData
{
  return self->_customData != 0;
}

- (BOOL)hasTracklist
{
  return self->_tracklist != 0;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (BOOL)hasMetrics
{
  return self->_metrics != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSystemPlaybackQueueProtobuf;
  int v4 = [(_MRSystemPlaybackQueueProtobuf *)&v8 description];
  v5 = [(_MRSystemPlaybackQueueProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v4 = self->_type - 1;
  if (v4 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E57D6548[v4];
  }
  [v3 setObject:v5 forKey:@"type"];

  char has = (char)self->_has;
  if (has)
  {
    unsigned int v7 = self->_replaceIntent - 1;
    if (v7 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_replaceIntent);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E57D6568[v7];
    }
    [v3 setObject:v8 forKey:@"replaceIntent"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_isRequestingImmediatePlayback];
    [v3 setObject:v9 forKey:@"isRequestingImmediatePlayback"];
  }
  featureName = self->_featureName;
  if (featureName) {
    [v3 setObject:featureName forKey:@"featureName"];
  }
  customData = self->_customData;
  if (customData)
  {
    v12 = [(_MRSystemPlaybackCustomDataQueueProtobuf *)customData dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"customData"];
  }
  tracklist = self->_tracklist;
  if (tracklist)
  {
    v14 = [(_MRSystemPlaybackGenericTracklistQueueProtobuf *)tracklist dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"tracklist"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v3 setObject:userInfo forKey:@"userInfo"];
  }
  metrics = self->_metrics;
  if (metrics) {
    [v3 setObject:metrics forKey:@"metrics"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSystemPlaybackQueueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  v5 = v6;
  if (self->_featureName)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_customData)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_tracklist)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_userInfo)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_metrics)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  unsigned int v4 = a3;
  v4[12] = self->_type;
  char has = (char)self->_has;
  if (has)
  {
    v4[8] = self->_replaceIntent;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_isRequestingImmediatePlayback;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  id v6 = v4;
  if (self->_featureName)
  {
    objc_msgSend(v4, "setFeatureName:");
    unsigned int v4 = v6;
  }
  if (self->_customData)
  {
    objc_msgSend(v6, "setCustomData:");
    unsigned int v4 = v6;
  }
  if (self->_tracklist)
  {
    objc_msgSend(v6, "setTracklist:");
    unsigned int v4 = v6;
  }
  if (self->_userInfo)
  {
    objc_msgSend(v6, "setUserInfo:");
    unsigned int v4 = v6;
  }
  if (self->_metrics)
  {
    objc_msgSend(v6, "setMetrics:");
    unsigned int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  *(_DWORD *)(v5 + 48) = self->_type;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 32) = self->_replaceIntent;
    *(unsigned char *)(v5 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_isRequestingImmediatePlayback;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_featureName copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  id v10 = [(_MRSystemPlaybackCustomDataQueueProtobuf *)self->_customData copyWithZone:a3];
  v11 = (void *)v6[1];
  v6[1] = v10;

  id v12 = [(_MRSystemPlaybackGenericTracklistQueueProtobuf *)self->_tracklist copyWithZone:a3];
  v13 = (void *)v6[5];
  v6[5] = v12;

  uint64_t v14 = [(NSData *)self->_userInfo copyWithZone:a3];
  v15 = (void *)v6[7];
  v6[7] = v14;

  uint64_t v16 = [(NSData *)self->_metrics copyWithZone:a3];
  v17 = (void *)v6[3];
  v6[3] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_type != *((_DWORD *)v4 + 12)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_replaceIntent != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) != 0)
    {
      if (self->_isRequestingImmediatePlayback)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_26;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_16;
      }
    }
LABEL_26:
    char v10 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0) {
    goto LABEL_26;
  }
LABEL_16:
  featureName = self->_featureName;
  if ((unint64_t)featureName | *((void *)v4 + 2)
    && !-[NSString isEqual:](featureName, "isEqual:"))
  {
    goto LABEL_26;
  }
  customData = self->_customData;
  if ((unint64_t)customData | *((void *)v4 + 1))
  {
    if (!-[_MRSystemPlaybackCustomDataQueueProtobuf isEqual:](customData, "isEqual:")) {
      goto LABEL_26;
    }
  }
  tracklist = self->_tracklist;
  if ((unint64_t)tracklist | *((void *)v4 + 5))
  {
    if (!-[_MRSystemPlaybackGenericTracklistQueueProtobuf isEqual:](tracklist, "isEqual:")) {
      goto LABEL_26;
    }
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](userInfo, "isEqual:")) {
      goto LABEL_26;
    }
  }
  metrics = self->_metrics;
  if ((unint64_t)metrics | *((void *)v4 + 3)) {
    char v10 = -[NSData isEqual:](metrics, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_replaceIntent;
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_isRequestingImmediatePlayback;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = 2654435761 * self->_type;
  NSUInteger v6 = v3 ^ v4 ^ [(NSString *)self->_featureName hash];
  unint64_t v7 = v6 ^ [(_MRSystemPlaybackCustomDataQueueProtobuf *)self->_customData hash];
  unint64_t v8 = v7 ^ [(_MRSystemPlaybackGenericTracklistQueueProtobuf *)self->_tracklist hash];
  uint64_t v9 = v8 ^ [(NSData *)self->_userInfo hash] ^ v5;
  return v9 ^ [(NSData *)self->_metrics hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  self->_type = *((_DWORD *)v4 + 12);
  char v6 = *((unsigned char *)v4 + 68);
  if (v6)
  {
    self->_replaceIntent = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((v6 & 2) != 0)
  {
    self->_isRequestingImmediatePlayback = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 2u;
  }
  v11 = v4;
  if (*((void *)v4 + 2))
  {
    -[_MRSystemPlaybackQueueProtobuf setFeatureName:](self, "setFeatureName:");
    uint64_t v5 = v11;
  }
  customData = self->_customData;
  uint64_t v8 = v5[1];
  if (customData)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRSystemPlaybackCustomDataQueueProtobuf mergeFrom:](customData, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRSystemPlaybackQueueProtobuf setCustomData:](self, "setCustomData:");
  }
  uint64_t v5 = v11;
LABEL_13:
  tracklist = self->_tracklist;
  uint64_t v10 = v5[5];
  if (tracklist)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf mergeFrom:](tracklist, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[_MRSystemPlaybackQueueProtobuf setTracklist:](self, "setTracklist:");
  }
  uint64_t v5 = v11;
LABEL_19:
  if (v5[7])
  {
    -[_MRSystemPlaybackQueueProtobuf setUserInfo:](self, "setUserInfo:");
    uint64_t v5 = v11;
  }
  if (v5[3]) {
    -[_MRSystemPlaybackQueueProtobuf setMetrics:](self, "setMetrics:");
  }

  MEMORY[0x1F41817F8]();
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)isRequestingImmediatePlayback
{
  return self->_isRequestingImmediatePlayback;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
}

- (_MRSystemPlaybackCustomDataQueueProtobuf)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
}

- (_MRSystemPlaybackGenericTracklistQueueProtobuf)tracklist
{
  return self->_tracklist;
}

- (void)setTracklist:(id)a3
{
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSData)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_tracklist, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_featureName, 0);

  objc_storeStrong((id *)&self->_customData, 0);
}

@end