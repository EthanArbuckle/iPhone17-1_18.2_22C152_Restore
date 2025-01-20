@interface ATXMPBBlendingClientModelEngagementTracker
- (BOOL)hasAbGroup;
- (BOOL)hasClientModelABGroup;
- (BOOL)hasClientModelCacheAge;
- (BOOL)hasClientModelId;
- (BOOL)hasConsumerSubType;
- (BOOL)hasConsumerSubTypeCacheAge;
- (BOOL)hasEngagementType;
- (BOOL)hasLayoutType;
- (BOOL)hasNumSuggestionsForClientModelInLayout;
- (BOOL)hasPositionInClientModelCacheOfEngagedSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)clientModelABGroup;
- (NSString)clientModelId;
- (NSString)consumerSubType;
- (NSString)layoutType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagementTypeAsString:(int)a3;
- (int)StringAsEngagementType:(id)a3;
- (int)engagementType;
- (unint64_t)hash;
- (unsigned)clientModelCacheAge;
- (unsigned)consumerSubTypeCacheAge;
- (unsigned)numSuggestionsForClientModelInLayout;
- (unsigned)positionInClientModelCacheOfEngagedSuggestion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setClientModelABGroup:(id)a3;
- (void)setClientModelCacheAge:(unsigned int)a3;
- (void)setClientModelId:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setConsumerSubTypeCacheAge:(unsigned int)a3;
- (void)setEngagementType:(int)a3;
- (void)setHasClientModelCacheAge:(BOOL)a3;
- (void)setHasConsumerSubTypeCacheAge:(BOOL)a3;
- (void)setHasEngagementType:(BOOL)a3;
- (void)setHasNumSuggestionsForClientModelInLayout:(BOOL)a3;
- (void)setHasPositionInClientModelCacheOfEngagedSuggestion:(BOOL)a3;
- (void)setLayoutType:(id)a3;
- (void)setNumSuggestionsForClientModelInLayout:(unsigned int)a3;
- (void)setPositionInClientModelCacheOfEngagedSuggestion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBBlendingClientModelEngagementTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setNumSuggestionsForClientModelInLayout:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numSuggestionsForClientModelInLayout = a3;
}

- (void)setHasNumSuggestionsForClientModelInLayout:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumSuggestionsForClientModelInLayout
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPositionInClientModelCacheOfEngagedSuggestion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_positionInClientModelCacheOfEngagedSuggestion = a3;
}

- (void)setHasPositionInClientModelCacheOfEngagedSuggestion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPositionInClientModelCacheOfEngagedSuggestion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (int)engagementType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_engagementType;
  }
  else {
    return 1;
  }
}

- (void)setEngagementType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEngagementType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if ((a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5F01A48[a3 - 1];
  }
  return v3;
}

- (int)StringAsEngagementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ExplicitConfirm"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ImplicitAbandon"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ExplicitReject"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ExplicitTap"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ImplicitDwell"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ExplicitUserScroll"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NotSeen"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ExplicitConfirmOnlyIfHigherRankedSuggestionsWereDeduped"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setConsumerSubTypeCacheAge:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_consumerSubTypeCacheAge = a3;
}

- (void)setHasConsumerSubTypeCacheAge:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConsumerSubTypeCacheAge
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setClientModelCacheAge:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientModelCacheAge = a3;
}

- (void)setHasClientModelCacheAge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientModelCacheAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasClientModelABGroup
{
  return self->_clientModelABGroup != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBBlendingClientModelEngagementTracker;
  int v4 = [(ATXMPBBlendingClientModelEngagementTracker *)&v8 description];
  v5 = [(ATXMPBBlendingClientModelEngagementTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType) {
    [v3 setObject:layoutType forKey:@"layoutType"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v4 setObject:clientModelId forKey:@"clientModelId"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_numSuggestionsForClientModelInLayout];
    [v4 setObject:v8 forKey:@"numSuggestionsForClientModelInLayout"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_positionInClientModelCacheOfEngagedSuggestion];
    [v4 setObject:v9 forKey:@"positionInClientModelCacheOfEngagedSuggestion"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v4 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    unsigned int v16 = self->_engagementType - 1;
    if (v16 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagementType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E5F01A48[v16];
    }
    [v4 setObject:v17 forKey:@"engagementType"];

    char v11 = (char)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_13:
      if ((v11 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v18 = [NSNumber numberWithUnsignedInt:self->_consumerSubTypeCacheAge];
  [v4 setObject:v18 forKey:@"consumerSubTypeCacheAge"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    v12 = [NSNumber numberWithUnsignedInt:self->_clientModelCacheAge];
    [v4 setObject:v12 forKey:@"clientModelCacheAge"];
  }
LABEL_15:
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup) {
    [v4 setObject:clientModelABGroup forKey:@"clientModelABGroup"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingClientModelEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_layoutType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_15:
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_clientModelABGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_layoutType)
  {
    objc_msgSend(v4, "setLayoutType:");
    id v4 = v7;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v7, "setClientModelId:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_numSuggestionsForClientModelInLayout;
    *((unsigned char *)v4 + 72) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_positionInClientModelCacheOfEngagedSuggestion;
    *((unsigned char *)v4 + 72) |= 0x10u;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v7, "setConsumerSubType:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_engagementType;
    *((unsigned char *)v4 + 72) |= 4u;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 12) = self->_consumerSubTypeCacheAge;
  *((unsigned char *)v4 + 72) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    *((_DWORD *)v4 + 6) = self->_clientModelCacheAge;
    *((unsigned char *)v4 + 72) |= 1u;
  }
LABEL_15:
  if (self->_abGroup)
  {
    objc_msgSend(v7, "setAbGroup:");
    id v4 = v7;
  }
  if (self->_clientModelABGroup)
  {
    objc_msgSend(v7, "setClientModelABGroup:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_layoutType copyWithZone:a3];
  id v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_clientModelId copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_numSuggestionsForClientModelInLayout;
    *(unsigned char *)(v5 + 72) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_positionInClientModelCacheOfEngagedSuggestion;
    *(unsigned char *)(v5 + 72) |= 0x10u;
  }
  uint64_t v11 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  char v13 = (char)self->_has;
  if ((v13 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(_DWORD *)(v5 + 48) = self->_consumerSubTypeCacheAge;
    *(unsigned char *)(v5 + 72) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 52) = self->_engagementType;
  *(unsigned char *)(v5 + 72) |= 4u;
  char v13 = (char)self->_has;
  if ((v13 & 2) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if (v13)
  {
LABEL_8:
    *(_DWORD *)(v5 + 24) = self->_clientModelCacheAge;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
LABEL_9:
  uint64_t v14 = [(NSString *)self->_abGroup copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  uint64_t v16 = [(NSString *)self->_clientModelABGroup copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  layoutType = self->_layoutType;
  if ((unint64_t)layoutType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](layoutType, "isEqual:")) {
      goto LABEL_38;
    }
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_38;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_numSuggestionsForClientModelInLayout != *((_DWORD *)v4 + 16)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x10) == 0
      || self->_positionInClientModelCacheOfEngagedSuggestion != *((_DWORD *)v4 + 17))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
    {
LABEL_38:
      char v11 = 0;
      goto LABEL_39;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_engagementType != *((_DWORD *)v4 + 13)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_consumerSubTypeCacheAge != *((_DWORD *)v4 + 12)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_38;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_clientModelCacheAge != *((_DWORD *)v4 + 6)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_38;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1) && !-[NSString isEqual:](abGroup, "isEqual:")) {
    goto LABEL_38;
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((void *)v4 + 2)) {
    char v11 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_39:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_layoutType hash];
  NSUInteger v4 = [(NSString *)self->_clientModelId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_numSuggestionsForClientModelInLayout;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_positionInClientModelCacheOfEngagedSuggestion;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  NSUInteger v7 = [(NSString *)self->_consumerSubType hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v9 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = 2654435761 * self->_engagementType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_consumerSubTypeCacheAge;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_clientModelCacheAge;
LABEL_13:
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  NSUInteger v12 = v8 ^ v9 ^ v10 ^ [(NSString *)self->_abGroup hash];
  return v11 ^ v12 ^ [(NSString *)self->_clientModelABGroup hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 7))
  {
    [(ATXMPBBlendingClientModelEngagementTracker *)self setLayoutType:"setLayoutType:"];
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setClientModelId:](self, "setClientModelId:");
    id v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_numSuggestionsForClientModelInLayout = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_positionInClientModelCacheOfEngagedSuggestion = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 5))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setConsumerSubType:](self, "setConsumerSubType:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 4) != 0)
  {
    self->_engagementType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 72);
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_consumerSubTypeCacheAge = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 72))
  {
LABEL_14:
    self->_clientModelCacheAge = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_15:
  if (*((void *)v4 + 1))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setAbGroup:](self, "setAbGroup:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setClientModelABGroup:](self, "setClientModelABGroup:");
    id v4 = v7;
  }
}

- (NSString)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (unsigned)numSuggestionsForClientModelInLayout
{
  return self->_numSuggestionsForClientModelInLayout;
}

- (unsigned)positionInClientModelCacheOfEngagedSuggestion
{
  return self->_positionInClientModelCacheOfEngagedSuggestion;
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (unsigned)consumerSubTypeCacheAge
{
  return self->_consumerSubTypeCacheAge;
}

- (unsigned)clientModelCacheAge
{
  return self->_clientModelCacheAge;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)clientModelABGroup
{
  return self->_clientModelABGroup;
}

- (void)setClientModelABGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end