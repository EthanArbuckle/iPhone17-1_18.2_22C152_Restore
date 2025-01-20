@interface UWLPlayEvent
- (BOOL)algorithmicIsDoneEnabled;
- (BOOL)clientIsDone;
- (BOOL)hasAlgorithmicIsDoneEnabled;
- (BOOL)hasBrandId;
- (BOOL)hasCanonicalId;
- (BOOL)hasCanonicalSeasonId;
- (BOOL)hasCanonicalShowId;
- (BOOL)hasClientIsDone;
- (BOOL)hasContractOrTimed;
- (BOOL)hasExternalShowId;
- (BOOL)hasInternalLegId;
- (BOOL)hasIsCurrent;
- (BOOL)hasIsDone;
- (BOOL)hasIsShowOpen;
- (BOOL)hasLegSeasonId;
- (BOOL)hasLegShowId;
- (BOOL)hasMainContentInfo;
- (BOOL)hasMainContentLengthInMilliseconds;
- (BOOL)hasMainContentPlayHeadInMilliseconds;
- (BOOL)hasMediaLengthInMilliseconds;
- (BOOL)hasMediaType;
- (BOOL)hasProfileId;
- (BOOL)isCurrent;
- (BOOL)isDone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShowOpen;
- (BOOL)readFrom:(id)a3;
- (NSString)brandId;
- (NSString)bundleId;
- (NSString)canonicalId;
- (NSString)canonicalSeasonId;
- (NSString)canonicalShowId;
- (NSString)externalPlayableId;
- (NSString)externalShowId;
- (NSString)internalLegId;
- (NSString)legSeasonId;
- (NSString)legShowId;
- (NSString)profileId;
- (UWLSectionInfo)mainContentInfo;
- (id)contractOrTimedAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mediaTypeAsString:(int)a3;
- (int)StringAsContractOrTimed:(id)a3;
- (int)StringAsMediaType:(id)a3;
- (int)contractOrTimed;
- (int)mediaType;
- (int64_t)mainContentLengthInMilliseconds;
- (int64_t)mainContentPlayHeadInMilliseconds;
- (int64_t)mediaLengthInMilliseconds;
- (int64_t)millisecondsSinceEvent;
- (int64_t)playHeadInMilliseconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithmicIsDoneEnabled:(BOOL)a3;
- (void)setBrandId:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setCanonicalId:(id)a3;
- (void)setCanonicalSeasonId:(id)a3;
- (void)setCanonicalShowId:(id)a3;
- (void)setClientIsDone:(BOOL)a3;
- (void)setContractOrTimed:(int)a3;
- (void)setExternalPlayableId:(id)a3;
- (void)setExternalShowId:(id)a3;
- (void)setHasAlgorithmicIsDoneEnabled:(BOOL)a3;
- (void)setHasClientIsDone:(BOOL)a3;
- (void)setHasContractOrTimed:(BOOL)a3;
- (void)setHasIsCurrent:(BOOL)a3;
- (void)setHasIsDone:(BOOL)a3;
- (void)setHasIsShowOpen:(BOOL)a3;
- (void)setHasMainContentLengthInMilliseconds:(BOOL)a3;
- (void)setHasMainContentPlayHeadInMilliseconds:(BOOL)a3;
- (void)setHasMediaLengthInMilliseconds:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setInternalLegId:(id)a3;
- (void)setIsCurrent:(BOOL)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setIsShowOpen:(BOOL)a3;
- (void)setLegSeasonId:(id)a3;
- (void)setLegShowId:(id)a3;
- (void)setMainContentInfo:(id)a3;
- (void)setMainContentLengthInMilliseconds:(int64_t)a3;
- (void)setMainContentPlayHeadInMilliseconds:(int64_t)a3;
- (void)setMediaLengthInMilliseconds:(int64_t)a3;
- (void)setMediaType:(int)a3;
- (void)setMillisecondsSinceEvent:(int64_t)a3;
- (void)setPlayHeadInMilliseconds:(int64_t)a3;
- (void)setProfileId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLPlayEvent

- (void)setIsDone:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isDone = a3;
}

- (void)setHasIsDone:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsDone
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasExternalShowId
{
  return self->_externalShowId != 0;
}

- (void)setMediaLengthInMilliseconds:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_mediaLengthInMilliseconds = a3;
}

- (void)setHasMediaLengthInMilliseconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMediaLengthInMilliseconds
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)mediaType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_mediaType;
  }
  else {
    return 0;
  }
}

- (void)setMediaType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMediaType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100044A60 + a3);
  }

  return v3;
}

- (int)StringAsMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_SPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MOVIE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SPORTS_VOD"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasProfileId
{
  return self->_profileId != 0;
}

- (BOOL)hasBrandId
{
  return self->_brandId != 0;
}

- (void)setIsCurrent:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isCurrent = a3;
}

- (void)setHasIsCurrent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsCurrent
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsShowOpen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isShowOpen = a3;
}

- (void)setHasIsShowOpen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsShowOpen
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasCanonicalId
{
  return self->_canonicalId != 0;
}

- (BOOL)hasCanonicalShowId
{
  return self->_canonicalShowId != 0;
}

- (BOOL)hasInternalLegId
{
  return self->_internalLegId != 0;
}

- (int)contractOrTimed
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_contractOrTimed;
  }
  else {
    return 0;
  }
}

- (void)setContractOrTimed:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_contractOrTimed = a3;
}

- (void)setHasContractOrTimed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasContractOrTimed
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)contractOrTimedAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100044A80 + a3);
  }

  return v3;
}

- (int)StringAsContractOrTimed:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Not_Specified_Implied_Legacy_Contract"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Contract"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Timed"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCanonicalSeasonId
{
  return self->_canonicalSeasonId != 0;
}

- (BOOL)hasLegSeasonId
{
  return self->_legSeasonId != 0;
}

- (BOOL)hasLegShowId
{
  return self->_legShowId != 0;
}

- (void)setClientIsDone:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_clientIsDone = a3;
}

- (void)setHasClientIsDone:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasClientIsDone
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAlgorithmicIsDoneEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_algorithmicIsDoneEnabled = a3;
}

- (void)setHasAlgorithmicIsDoneEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAlgorithmicIsDoneEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMainContentLengthInMilliseconds:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_mainContentLengthInMilliseconds = a3;
}

- (void)setHasMainContentLengthInMilliseconds:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasMainContentLengthInMilliseconds
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMainContentPlayHeadInMilliseconds:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_mainContentPlayHeadInMilliseconds = a3;
}

- (void)setHasMainContentPlayHeadInMilliseconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMainContentPlayHeadInMilliseconds
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasMainContentInfo
{
  return self->_mainContentInfo != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UWLPlayEvent;
  __int16 v3 = [(UWLPlayEvent *)&v7 description];
  int v4 = [(UWLPlayEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundle_id"];
  }
  externalPlayableId = self->_externalPlayableId;
  if (externalPlayableId) {
    [v4 setObject:externalPlayableId forKey:@"external_playable_id"];
  }
  objc_super v7 = +[NSNumber numberWithLongLong:self->_playHeadInMilliseconds];
  [v4 setObject:v7 forKey:@"play_head_in_milliseconds"];

  v8 = +[NSNumber numberWithLongLong:self->_millisecondsSinceEvent];
  [v4 setObject:v8 forKey:@"milliseconds_since_event"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_isDone];
    [v4 setObject:v9 forKey:@"is_done"];
  }
  externalShowId = self->_externalShowId;
  if (externalShowId) {
    [v4 setObject:externalShowId forKey:@"external_show_id"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v12 = +[NSNumber numberWithLongLong:self->_mediaLengthInMilliseconds];
    [v4 setObject:v12 forKey:@"media_length_in_milliseconds"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t mediaType = self->_mediaType;
    if (mediaType >= 4)
    {
      v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mediaType];
    }
    else
    {
      v14 = *(&off_100044A60 + mediaType);
    }
    [v4 setObject:v14 forKey:@"media_type"];
  }
  profileId = self->_profileId;
  if (profileId) {
    [v4 setObject:profileId forKey:@"profile_id"];
  }
  brandId = self->_brandId;
  if (brandId) {
    [v4 setObject:brandId forKey:@"brand_id"];
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x80) != 0)
  {
    v18 = +[NSNumber numberWithBool:self->_isCurrent];
    [v4 setObject:v18 forKey:@"is_current"];

    __int16 v17 = (__int16)self->_has;
  }
  if ((v17 & 0x200) != 0)
  {
    v19 = +[NSNumber numberWithBool:self->_isShowOpen];
    [v4 setObject:v19 forKey:@"is_show_open"];
  }
  canonicalId = self->_canonicalId;
  if (canonicalId) {
    [v4 setObject:canonicalId forKey:@"canonical_id"];
  }
  canonicalShowId = self->_canonicalShowId;
  if (canonicalShowId) {
    [v4 setObject:canonicalShowId forKey:@"canonical_show_id"];
  }
  internalLegId = self->_internalLegId;
  if (internalLegId) {
    [v4 setObject:internalLegId forKey:@"internal_leg_id"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    uint64_t contractOrTimed = self->_contractOrTimed;
    if (contractOrTimed >= 3)
    {
      v24 = +[NSString stringWithFormat:@"(unknown: %i)", self->_contractOrTimed];
    }
    else
    {
      v24 = *(&off_100044A80 + contractOrTimed);
    }
    [v4 setObject:v24 forKey:@"contract_or_timed"];
  }
  canonicalSeasonId = self->_canonicalSeasonId;
  if (canonicalSeasonId) {
    [v4 setObject:canonicalSeasonId forKey:@"canonical_season_id"];
  }
  legSeasonId = self->_legSeasonId;
  if (legSeasonId) {
    [v4 setObject:legSeasonId forKey:@"leg_season_id"];
  }
  legShowId = self->_legShowId;
  if (legShowId) {
    [v4 setObject:legShowId forKey:@"leg_show_id"];
  }
  __int16 v28 = (__int16)self->_has;
  if ((v28 & 0x40) != 0)
  {
    v33 = +[NSNumber numberWithBool:self->_clientIsDone];
    [v4 setObject:v33 forKey:@"clientIsDone"];

    __int16 v28 = (__int16)self->_has;
    if ((v28 & 0x20) == 0)
    {
LABEL_43:
      if ((v28 & 1) == 0) {
        goto LABEL_44;
      }
      goto LABEL_53;
    }
  }
  else if ((v28 & 0x20) == 0)
  {
    goto LABEL_43;
  }
  v34 = +[NSNumber numberWithBool:self->_algorithmicIsDoneEnabled];
  [v4 setObject:v34 forKey:@"algorithmicIsDoneEnabled"];

  __int16 v28 = (__int16)self->_has;
  if ((v28 & 1) == 0)
  {
LABEL_44:
    if ((v28 & 2) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_53:
  v35 = +[NSNumber numberWithLongLong:self->_mainContentLengthInMilliseconds];
  [v4 setObject:v35 forKey:@"main_content_length_in_milliseconds"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_45:
    v29 = +[NSNumber numberWithLongLong:self->_mainContentPlayHeadInMilliseconds];
    [v4 setObject:v29 forKey:@"main_content_play_head_in_milliseconds"];
  }
LABEL_46:
  mainContentInfo = self->_mainContentInfo;
  if (mainContentInfo)
  {
    v31 = [(UWLSectionInfo *)mainContentInfo dictionaryRepresentation];
    [v4 setObject:v31 forKey:@"main_content_info"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLPlayEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_externalShowId) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  v5 = v8;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = v8;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v8;
  }
  if (self->_profileId)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_brandId)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
  }
  if (self->_canonicalId)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_canonicalShowId)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_internalLegId)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v8;
  }
  if (self->_canonicalSeasonId)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_legSeasonId)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_legShowId)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_33:
      if ((v7 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_43;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteBOOLField();
  v5 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_34:
    if ((v7 & 2) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_43:
  PBDataWriterWriteInt64Field();
  v5 = v8;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_35:
    PBDataWriterWriteInt64Field();
    v5 = v8;
  }
LABEL_36:
  if (self->_mainContentInfo)
  {
    PBDataWriterWriteSubmessage();
    v5 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setBundleId:self->_bundleId];
  [v8 setExternalPlayableId:self->_externalPlayableId];
  int v4 = v8;
  *((void *)v8 + 5) = self->_playHeadInMilliseconds;
  *((void *)v8 + 4) = self->_millisecondsSinceEvent;
  if (*((unsigned char *)&self->_has + 1))
  {
    *((unsigned char *)v8 + 163) = self->_isDone;
    *((_WORD *)v8 + 84) |= 0x100u;
  }
  if (self->_externalShowId)
  {
    objc_msgSend(v8, "setExternalShowId:");
    int v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_mediaLengthInMilliseconds;
    *((_WORD *)v4 + 84) |= 4u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_mediaType;
    *((_WORD *)v4 + 84) |= 0x10u;
  }
  if (self->_profileId)
  {
    objc_msgSend(v8, "setProfileId:");
    int v4 = v8;
  }
  if (self->_brandId)
  {
    objc_msgSend(v8, "setBrandId:");
    int v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    *((unsigned char *)v4 + 162) = self->_isCurrent;
    *((_WORD *)v4 + 84) |= 0x80u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 164) = self->_isShowOpen;
    *((_WORD *)v4 + 84) |= 0x200u;
  }
  if (self->_canonicalId)
  {
    objc_msgSend(v8, "setCanonicalId:");
    int v4 = v8;
  }
  if (self->_canonicalShowId)
  {
    objc_msgSend(v8, "setCanonicalShowId:");
    int v4 = v8;
  }
  if (self->_internalLegId)
  {
    objc_msgSend(v8, "setInternalLegId:");
    int v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_contractOrTimed;
    *((_WORD *)v4 + 84) |= 8u;
  }
  if (self->_canonicalSeasonId)
  {
    objc_msgSend(v8, "setCanonicalSeasonId:");
    int v4 = v8;
  }
  if (self->_legSeasonId)
  {
    objc_msgSend(v8, "setLegSeasonId:");
    int v4 = v8;
  }
  if (self->_legShowId)
  {
    objc_msgSend(v8, "setLegShowId:");
    int v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((unsigned char *)v4 + 161) = self->_clientIsDone;
    *((_WORD *)v4 + 84) |= 0x40u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_33:
      if ((v7 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_43;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_33;
  }
  *((unsigned char *)v4 + 160) = self->_algorithmicIsDoneEnabled;
  *((_WORD *)v4 + 84) |= 0x20u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_34:
    if ((v7 & 2) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_43:
  v4[1] = self->_mainContentLengthInMilliseconds;
  *((_WORD *)v4 + 84) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_35:
    v4[2] = self->_mainContentPlayHeadInMilliseconds;
    *((_WORD *)v4 + 84) |= 2u;
  }
LABEL_36:
  if (self->_mainContentInfo)
  {
    objc_msgSend(v8, "setMainContentInfo:");
    int v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  __int16 v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = [(NSString *)self->_externalPlayableId copyWithZone:a3];
  v9 = (void *)v5[12];
  v5[12] = v8;

  v5[5] = self->_playHeadInMilliseconds;
  v5[4] = self->_millisecondsSinceEvent;
  if (*((unsigned char *)&self->_has + 1))
  {
    *((unsigned char *)v5 + 163) = self->_isDone;
    *((_WORD *)v5 + 84) |= 0x100u;
  }
  id v10 = [(NSString *)self->_externalShowId copyWithZone:a3];
  v11 = (void *)v5[13];
  v5[13] = v10;

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v5[3] = self->_mediaLengthInMilliseconds;
    *((_WORD *)v5 + 84) |= 4u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 36) = self->_mediaType;
    *((_WORD *)v5 + 84) |= 0x10u;
  }
  id v13 = [(NSString *)self->_profileId copyWithZone:a3];
  v14 = (void *)v5[19];
  v5[19] = v13;

  id v15 = [(NSString *)self->_brandId copyWithZone:a3];
  v16 = (void *)v5[6];
  v5[6] = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x80) != 0)
  {
    *((unsigned char *)v5 + 162) = self->_isCurrent;
    *((_WORD *)v5 + 84) |= 0x80u;
    __int16 v17 = (__int16)self->_has;
  }
  if ((v17 & 0x200) != 0)
  {
    *((unsigned char *)v5 + 164) = self->_isShowOpen;
    *((_WORD *)v5 + 84) |= 0x200u;
  }
  id v18 = [(NSString *)self->_canonicalId copyWithZone:a3];
  v19 = (void *)v5[8];
  v5[8] = v18;

  id v20 = [(NSString *)self->_canonicalShowId copyWithZone:a3];
  v21 = (void *)v5[10];
  v5[10] = v20;

  id v22 = [(NSString *)self->_internalLegId copyWithZone:a3];
  v23 = (void *)v5[14];
  v5[14] = v22;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 22) = self->_contractOrTimed;
    *((_WORD *)v5 + 84) |= 8u;
  }
  id v24 = [(NSString *)self->_canonicalSeasonId copyWithZone:a3];
  v25 = (void *)v5[9];
  v5[9] = v24;

  id v26 = [(NSString *)self->_legSeasonId copyWithZone:a3];
  v27 = (void *)v5[15];
  v5[15] = v26;

  id v28 = [(NSString *)self->_legShowId copyWithZone:a3];
  v29 = (void *)v5[16];
  v5[16] = v28;

  __int16 v30 = (__int16)self->_has;
  if ((v30 & 0x40) != 0)
  {
    *((unsigned char *)v5 + 161) = self->_clientIsDone;
    *((_WORD *)v5 + 84) |= 0x40u;
    __int16 v30 = (__int16)self->_has;
    if ((v30 & 0x20) == 0)
    {
LABEL_15:
      if ((v30 & 1) == 0) {
        goto LABEL_16;
      }
LABEL_21:
      v5[1] = self->_mainContentLengthInMilliseconds;
      *((_WORD *)v5 + 84) |= 1u;
      if ((*(_WORD *)&self->_has & 2) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v30 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *((unsigned char *)v5 + 160) = self->_algorithmicIsDoneEnabled;
  *((_WORD *)v5 + 84) |= 0x20u;
  __int16 v30 = (__int16)self->_has;
  if (v30) {
    goto LABEL_21;
  }
LABEL_16:
  if ((v30 & 2) != 0)
  {
LABEL_17:
    v5[2] = self->_mainContentPlayHeadInMilliseconds;
    *((_WORD *)v5 + 84) |= 2u;
  }
LABEL_18:
  id v31 = [(UWLSectionInfo *)self->_mainContentInfo copyWithZone:a3];
  v32 = (void *)v5[17];
  v5[17] = v31;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_94;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_94;
    }
  }
  externalPlayableId = self->_externalPlayableId;
  if ((unint64_t)externalPlayableId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](externalPlayableId, "isEqual:")) {
      goto LABEL_94;
    }
  }
  if (self->_playHeadInMilliseconds != *((void *)v4 + 5) || self->_millisecondsSinceEvent != *((void *)v4 + 4)) {
    goto LABEL_94;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x100) == 0) {
      goto LABEL_94;
    }
    if (self->_isDone)
    {
      if (!*((unsigned char *)v4 + 163)) {
        goto LABEL_94;
      }
    }
    else if (*((unsigned char *)v4 + 163))
    {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 84) & 0x100) != 0)
  {
    goto LABEL_94;
  }
  externalShowId = self->_externalShowId;
  if ((unint64_t)externalShowId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](externalShowId, "isEqual:")) {
      goto LABEL_94;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)v4 + 84);
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_mediaLengthInMilliseconds != *((void *)v4 + 3)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_mediaType != *((_DWORD *)v4 + 36)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_94;
  }
  profileId = self->_profileId;
  if ((unint64_t)profileId | *((void *)v4 + 19) && !-[NSString isEqual:](profileId, "isEqual:")) {
    goto LABEL_94;
  }
  brandId = self->_brandId;
  if ((unint64_t)brandId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](brandId, "isEqual:")) {
      goto LABEL_94;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 84);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0) {
      goto LABEL_94;
    }
    if (self->_isCurrent)
    {
      if (!*((unsigned char *)v4 + 162)) {
        goto LABEL_94;
      }
    }
    else if (*((unsigned char *)v4 + 162))
    {
      goto LABEL_94;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x200) == 0) {
      goto LABEL_94;
    }
    if (self->_isShowOpen)
    {
      if (!*((unsigned char *)v4 + 164)) {
        goto LABEL_94;
      }
    }
    else if (*((unsigned char *)v4 + 164))
    {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 84) & 0x200) != 0)
  {
    goto LABEL_94;
  }
  canonicalId = self->_canonicalId;
  if ((unint64_t)canonicalId | *((void *)v4 + 8)
    && !-[NSString isEqual:](canonicalId, "isEqual:"))
  {
    goto LABEL_94;
  }
  canonicalShowId = self->_canonicalShowId;
  if ((unint64_t)canonicalShowId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](canonicalShowId, "isEqual:")) {
      goto LABEL_94;
    }
  }
  internalLegId = self->_internalLegId;
  if ((unint64_t)internalLegId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](internalLegId, "isEqual:")) {
      goto LABEL_94;
    }
  }
  __int16 v16 = *((_WORD *)v4 + 84);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v16 & 8) == 0 || self->_contractOrTimed != *((_DWORD *)v4 + 22)) {
      goto LABEL_94;
    }
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_94;
  }
  canonicalSeasonId = self->_canonicalSeasonId;
  if ((unint64_t)canonicalSeasonId | *((void *)v4 + 9)
    && !-[NSString isEqual:](canonicalSeasonId, "isEqual:"))
  {
    goto LABEL_94;
  }
  legSeasonId = self->_legSeasonId;
  if ((unint64_t)legSeasonId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](legSeasonId, "isEqual:")) {
      goto LABEL_94;
    }
  }
  legShowId = self->_legShowId;
  if ((unint64_t)legShowId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](legShowId, "isEqual:")) {
      goto LABEL_94;
    }
  }
  __int16 v20 = (__int16)self->_has;
  __int16 v21 = *((_WORD *)v4 + 84);
  if ((v20 & 0x40) != 0)
  {
    if ((v21 & 0x40) == 0) {
      goto LABEL_94;
    }
    if (self->_clientIsDone)
    {
      if (!*((unsigned char *)v4 + 161)) {
        goto LABEL_94;
      }
    }
    else if (*((unsigned char *)v4 + 161))
    {
      goto LABEL_94;
    }
  }
  else if ((v21 & 0x40) != 0)
  {
    goto LABEL_94;
  }
  if ((v20 & 0x20) != 0)
  {
    if ((v21 & 0x20) != 0)
    {
      if (self->_algorithmicIsDoneEnabled)
      {
        if (!*((unsigned char *)v4 + 160)) {
          goto LABEL_94;
        }
        goto LABEL_82;
      }
      if (!*((unsigned char *)v4 + 160)) {
        goto LABEL_82;
      }
    }
LABEL_94:
    unsigned __int8 v23 = 0;
    goto LABEL_95;
  }
  if ((v21 & 0x20) != 0) {
    goto LABEL_94;
  }
LABEL_82:
  if (v20)
  {
    if ((v21 & 1) == 0 || self->_mainContentLengthInMilliseconds != *((void *)v4 + 1)) {
      goto LABEL_94;
    }
  }
  else if (v21)
  {
    goto LABEL_94;
  }
  if ((v20 & 2) != 0)
  {
    if ((v21 & 2) == 0 || self->_mainContentPlayHeadInMilliseconds != *((void *)v4 + 2)) {
      goto LABEL_94;
    }
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_94;
  }
  mainContentInfo = self->_mainContentInfo;
  if ((unint64_t)mainContentInfo | *((void *)v4 + 17)) {
    unsigned __int8 v23 = -[UWLSectionInfo isEqual:](mainContentInfo, "isEqual:");
  }
  else {
    unsigned __int8 v23 = 1;
  }
LABEL_95:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v28 = [(NSString *)self->_bundleId hash];
  NSUInteger v27 = [(NSString *)self->_externalPlayableId hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v26 = 2654435761 * self->_isDone;
  }
  else {
    uint64_t v26 = 0;
  }
  int64_t millisecondsSinceEvent = self->_millisecondsSinceEvent;
  int64_t playHeadInMilliseconds = self->_playHeadInMilliseconds;
  NSUInteger v23 = [(NSString *)self->_externalShowId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v22 = 2654435761 * self->_mediaLengthInMilliseconds;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v21 = 2654435761 * self->_mediaType;
      goto LABEL_9;
    }
  }
  uint64_t v21 = 0;
LABEL_9:
  NSUInteger v20 = [(NSString *)self->_profileId hash];
  NSUInteger v19 = [(NSString *)self->_brandId hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t v18 = 2654435761 * self->_isCurrent;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_11:
      uint64_t v4 = 2654435761 * self->_isShowOpen;
      goto LABEL_14;
    }
  }
  uint64_t v4 = 0;
LABEL_14:
  NSUInteger v5 = [(NSString *)self->_canonicalId hash];
  NSUInteger v6 = [(NSString *)self->_canonicalShowId hash];
  NSUInteger v7 = [(NSString *)self->_internalLegId hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_contractOrTimed;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_canonicalSeasonId hash];
  NSUInteger v10 = [(NSString *)self->_legSeasonId hash];
  NSUInteger v11 = [(NSString *)self->_legShowId hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x40) != 0)
  {
    uint64_t v13 = 2654435761 * self->_clientIsDone;
    if ((v12 & 0x20) != 0)
    {
LABEL_19:
      uint64_t v14 = 2654435761 * self->_algorithmicIsDoneEnabled;
      if (v12) {
        goto LABEL_20;
      }
LABEL_24:
      uint64_t v15 = 0;
      if ((v12 & 2) != 0) {
        goto LABEL_21;
      }
LABEL_25:
      uint64_t v16 = 0;
      return v27 ^ v28 ^ (2654435761 * playHeadInMilliseconds) ^ (2654435761 * millisecondsSinceEvent) ^ v26 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(UWLSectionInfo *)self->_mainContentInfo hash];
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 0x20) != 0) {
      goto LABEL_19;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v15 = 2654435761 * self->_mainContentLengthInMilliseconds;
  if ((v12 & 2) == 0) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v16 = 2654435761 * self->_mainContentPlayHeadInMilliseconds;
  return v27 ^ v28 ^ (2654435761 * playHeadInMilliseconds) ^ (2654435761 * millisecondsSinceEvent) ^ v26 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(UWLSectionInfo *)self->_mainContentInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (*((void *)v4 + 7))
  {
    -[UWLPlayEvent setBundleId:](self, "setBundleId:");
    id v4 = v10;
  }
  if (*((void *)v4 + 12))
  {
    -[UWLPlayEvent setExternalPlayableId:](self, "setExternalPlayableId:");
    id v4 = v10;
  }
  self->_int64_t playHeadInMilliseconds = *((void *)v4 + 5);
  self->_int64_t millisecondsSinceEvent = *((void *)v4 + 4);
  if (*((unsigned char *)v4 + 169))
  {
    self->_isDone = *((unsigned char *)v4 + 163);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 13))
  {
    -[UWLPlayEvent setExternalShowId:](self, "setExternalShowId:");
    id v4 = v10;
  }
  __int16 v5 = *((_WORD *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_mediaLengthInMilliseconds = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)v4 + 84);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_uint64_t mediaType = *((_DWORD *)v4 + 36);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 19))
  {
    -[UWLPlayEvent setProfileId:](self, "setProfileId:");
    id v4 = v10;
  }
  if (*((void *)v4 + 6))
  {
    -[UWLPlayEvent setBrandId:](self, "setBrandId:");
    id v4 = v10;
  }
  __int16 v6 = *((_WORD *)v4 + 84);
  if ((v6 & 0x80) != 0)
  {
    self->_isCurrent = *((unsigned char *)v4 + 162);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v6 = *((_WORD *)v4 + 84);
  }
  if ((v6 & 0x200) != 0)
  {
    self->_isShowOpen = *((unsigned char *)v4 + 164);
    *(_WORD *)&self->_has |= 0x200u;
  }
  if (*((void *)v4 + 8))
  {
    -[UWLPlayEvent setCanonicalId:](self, "setCanonicalId:");
    id v4 = v10;
  }
  if (*((void *)v4 + 10))
  {
    -[UWLPlayEvent setCanonicalShowId:](self, "setCanonicalShowId:");
    id v4 = v10;
  }
  if (*((void *)v4 + 14))
  {
    -[UWLPlayEvent setInternalLegId:](self, "setInternalLegId:");
    id v4 = v10;
  }
  if ((*((_WORD *)v4 + 84) & 8) != 0)
  {
    self->_uint64_t contractOrTimed = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 9))
  {
    -[UWLPlayEvent setCanonicalSeasonId:](self, "setCanonicalSeasonId:");
    id v4 = v10;
  }
  if (*((void *)v4 + 15))
  {
    -[UWLPlayEvent setLegSeasonId:](self, "setLegSeasonId:");
    id v4 = v10;
  }
  if (*((void *)v4 + 16))
  {
    -[UWLPlayEvent setLegShowId:](self, "setLegShowId:");
    id v4 = v10;
  }
  __int16 v7 = *((_WORD *)v4 + 84);
  if ((v7 & 0x40) != 0)
  {
    self->_clientIsDone = *((unsigned char *)v4 + 161);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v7 = *((_WORD *)v4 + 84);
    if ((v7 & 0x20) == 0)
    {
LABEL_37:
      if ((v7 & 1) == 0) {
        goto LABEL_38;
      }
      goto LABEL_45;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_37;
  }
  self->_algorithmicIsDoneEnabled = *((unsigned char *)v4 + 160);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v7 = *((_WORD *)v4 + 84);
  if ((v7 & 1) == 0)
  {
LABEL_38:
    if ((v7 & 2) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_45:
  self->_mainContentLengthInMilliseconds = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 84) & 2) != 0)
  {
LABEL_39:
    self->_mainContentPlayHeadInMilliseconds = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_40:
  mainContentInfo = self->_mainContentInfo;
  uint64_t v9 = *((void *)v4 + 17);
  if (mainContentInfo)
  {
    if (v9) {
      -[UWLSectionInfo mergeFrom:](mainContentInfo, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[UWLPlayEvent setMainContentInfo:](self, "setMainContentInfo:");
  }

  _objc_release_x1();
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)externalPlayableId
{
  return self->_externalPlayableId;
}

- (void)setExternalPlayableId:(id)a3
{
}

- (int64_t)playHeadInMilliseconds
{
  return self->_playHeadInMilliseconds;
}

- (void)setPlayHeadInMilliseconds:(int64_t)a3
{
  self->_int64_t playHeadInMilliseconds = a3;
}

- (int64_t)millisecondsSinceEvent
{
  return self->_millisecondsSinceEvent;
}

- (void)setMillisecondsSinceEvent:(int64_t)a3
{
  self->_int64_t millisecondsSinceEvent = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (NSString)externalShowId
{
  return self->_externalShowId;
}

- (void)setExternalShowId:(id)a3
{
}

- (int64_t)mediaLengthInMilliseconds
{
  return self->_mediaLengthInMilliseconds;
}

- (NSString)profileId
{
  return self->_profileId;
}

- (void)setProfileId:(id)a3
{
}

- (NSString)brandId
{
  return self->_brandId;
}

- (void)setBrandId:(id)a3
{
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (BOOL)isShowOpen
{
  return self->_isShowOpen;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (void)setCanonicalId:(id)a3
{
}

- (NSString)canonicalShowId
{
  return self->_canonicalShowId;
}

- (void)setCanonicalShowId:(id)a3
{
}

- (NSString)internalLegId
{
  return self->_internalLegId;
}

- (void)setInternalLegId:(id)a3
{
}

- (NSString)canonicalSeasonId
{
  return self->_canonicalSeasonId;
}

- (void)setCanonicalSeasonId:(id)a3
{
}

- (NSString)legSeasonId
{
  return self->_legSeasonId;
}

- (void)setLegSeasonId:(id)a3
{
}

- (NSString)legShowId
{
  return self->_legShowId;
}

- (void)setLegShowId:(id)a3
{
}

- (BOOL)clientIsDone
{
  return self->_clientIsDone;
}

- (BOOL)algorithmicIsDoneEnabled
{
  return self->_algorithmicIsDoneEnabled;
}

- (int64_t)mainContentLengthInMilliseconds
{
  return self->_mainContentLengthInMilliseconds;
}

- (int64_t)mainContentPlayHeadInMilliseconds
{
  return self->_mainContentPlayHeadInMilliseconds;
}

- (UWLSectionInfo)mainContentInfo
{
  return self->_mainContentInfo;
}

- (void)setMainContentInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileId, 0);
  objc_storeStrong((id *)&self->_mainContentInfo, 0);
  objc_storeStrong((id *)&self->_legShowId, 0);
  objc_storeStrong((id *)&self->_legSeasonId, 0);
  objc_storeStrong((id *)&self->_internalLegId, 0);
  objc_storeStrong((id *)&self->_externalShowId, 0);
  objc_storeStrong((id *)&self->_externalPlayableId, 0);
  objc_storeStrong((id *)&self->_canonicalShowId, 0);
  objc_storeStrong((id *)&self->_canonicalSeasonId, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_brandId, 0);
}

@end