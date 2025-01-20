@interface NTPBUserOnboardingResult
+ (Class)channelIdType;
+ (Class)topicIdType;
- (BOOL)hasIcloudAccountMatch;
- (BOOL)hasOnboardAbandonStage;
- (BOOL)hasResultType;
- (BOOL)hasSawEmailOptIn;
- (BOOL)hasTotalChannelSelections;
- (BOOL)hasTotalResets;
- (BOOL)hasTotalTopicSelections;
- (BOOL)icloudAccountMatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)sawEmailOptIn;
- (NSMutableArray)channelIds;
- (NSMutableArray)topicIds;
- (NSString)onboardAbandonStage;
- (id)channelIdAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicIdAtIndex:(unint64_t)a3;
- (int)resultType;
- (int)totalChannelSelections;
- (int)totalResets;
- (int)totalTopicSelections;
- (unint64_t)channelIdsCount;
- (unint64_t)hash;
- (unint64_t)topicIdsCount;
- (void)addChannelId:(id)a3;
- (void)addTopicId:(id)a3;
- (void)clearChannelIds;
- (void)clearTopicIds;
- (void)mergeFrom:(id)a3;
- (void)setChannelIds:(id)a3;
- (void)setHasIcloudAccountMatch:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setHasSawEmailOptIn:(BOOL)a3;
- (void)setHasTotalChannelSelections:(BOOL)a3;
- (void)setHasTotalResets:(BOOL)a3;
- (void)setHasTotalTopicSelections:(BOOL)a3;
- (void)setIcloudAccountMatch:(BOOL)a3;
- (void)setOnboardAbandonStage:(id)a3;
- (void)setResultType:(int)a3;
- (void)setSawEmailOptIn:(BOOL)a3;
- (void)setTopicIds:(id)a3;
- (void)setTotalChannelSelections:(int)a3;
- (void)setTotalResets:(int)a3;
- (void)setTotalTopicSelections:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBUserOnboardingResult

- (int)resultType
{
  if (*(unsigned char *)&self->_has) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIcloudAccountMatch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_icloudAccountMatch = a3;
}

- (void)setHasIcloudAccountMatch:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIcloudAccountMatch
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasOnboardAbandonStage
{
  return self->_onboardAbandonStage != 0;
}

- (void)setTotalChannelSelections:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalChannelSelections = a3;
}

- (void)setHasTotalChannelSelections:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalChannelSelections
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalTopicSelections:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_totalTopicSelections = a3;
}

- (void)setHasTotalTopicSelections:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalTopicSelections
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearChannelIds
{
}

- (void)addChannelId:(id)a3
{
  id v4 = a3;
  channelIds = self->_channelIds;
  id v8 = v4;
  if (!channelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_channelIds;
    self->_channelIds = v6;

    id v4 = v8;
    channelIds = self->_channelIds;
  }
  [(NSMutableArray *)channelIds addObject:v4];
}

- (unint64_t)channelIdsCount
{
  return [(NSMutableArray *)self->_channelIds count];
}

- (id)channelIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelIds objectAtIndex:a3];
}

+ (Class)channelIdType
{
  return (Class)objc_opt_class();
}

- (void)clearTopicIds
{
}

- (void)addTopicId:(id)a3
{
  id v4 = a3;
  topicIds = self->_topicIds;
  id v8 = v4;
  if (!topicIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicIds;
    self->_topicIds = v6;

    id v4 = v8;
    topicIds = self->_topicIds;
  }
  [(NSMutableArray *)topicIds addObject:v4];
}

- (unint64_t)topicIdsCount
{
  return [(NSMutableArray *)self->_topicIds count];
}

- (id)topicIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicIds objectAtIndex:a3];
}

+ (Class)topicIdType
{
  return (Class)objc_opt_class();
}

- (void)setTotalResets:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalResets = a3;
}

- (void)setHasTotalResets:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalResets
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSawEmailOptIn:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_sawEmailOptIn = a3;
}

- (void)setHasSawEmailOptIn:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSawEmailOptIn
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserOnboardingResult;
  id v4 = [(NTPBUserOnboardingResult *)&v8 description];
  v5 = [(NTPBUserOnboardingResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithInt:self->_resultType];
    [v3 setObject:v5 forKey:@"result_type"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_icloudAccountMatch];
    [v3 setObject:v6 forKey:@"icloud_account_match"];
  }
  onboardAbandonStage = self->_onboardAbandonStage;
  if (onboardAbandonStage) {
    [v3 setObject:onboardAbandonStage forKey:@"onboard_abandon_stage"];
  }
  char v8 = (char)self->_has;
  if ((v8 & 2) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_totalChannelSelections];
    [v3 setObject:v9 forKey:@"total_channel_selections"];

    char v8 = (char)self->_has;
  }
  if ((v8 & 8) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_totalTopicSelections];
    [v3 setObject:v10 forKey:@"total_topic_selections"];
  }
  channelIds = self->_channelIds;
  if (channelIds) {
    [v3 setObject:channelIds forKey:@"channel_id"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v3 setObject:topicIds forKey:@"topic_id"];
  }
  char v13 = (char)self->_has;
  if ((v13 & 4) != 0)
  {
    v14 = [NSNumber numberWithInt:self->_totalResets];
    [v3 setObject:v14 forKey:@"total_resets"];

    char v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_sawEmailOptIn];
    [v3 setObject:v15 forKey:@"saw_email_opt_in"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserOnboardingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_onboardAbandonStage) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = self->_channelIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = self->_topicIds;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  char v17 = (char)self->_has;
  if ((v17 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v17 = (char)self->_has;
  }
  if ((v17 & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_resultType;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 52) = self->_icloudAccountMatch;
    *(unsigned char *)(v5 + 56) |= 0x10u;
  }
  uint64_t v8 = [(NSString *)self->_onboardAbandonStage copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_totalChannelSelections;
    *(unsigned char *)(v6 + 56) |= 2u;
    char v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_totalTopicSelections;
    *(unsigned char *)(v6 + 56) |= 8u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v11 = self->_channelIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addChannelId:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v13);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v17 = self->_topicIds;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (void)v25);
        [(id)v6 addTopicId:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  char v23 = (char)self->_has;
  if ((v23 & 4) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_totalResets;
    *(unsigned char *)(v6 + 56) |= 4u;
    char v23 = (char)self->_has;
  }
  if ((v23 & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 53) = self->_sawEmailOptIn;
    *(unsigned char *)(v6 + 56) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_resultType != *((_DWORD *)v4 + 6)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0) {
      goto LABEL_39;
    }
    if (self->_icloudAccountMatch)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  onboardAbandonStage = self->_onboardAbandonStage;
  if ((unint64_t)onboardAbandonStage | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](onboardAbandonStage, "isEqual:")) {
      goto LABEL_39;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_totalChannelSelections != *((_DWORD *)v4 + 10)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_totalTopicSelections != *((_DWORD *)v4 + 12)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_39;
  }
  channelIds = self->_channelIds;
  if ((unint64_t)channelIds | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](channelIds, "isEqual:"))
  {
    goto LABEL_39;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](topicIds, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_totalResets != *((_DWORD *)v4 + 11)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_39;
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
    {
      if (self->_sawEmailOptIn)
      {
        if (!*((unsigned char *)v4 + 53)) {
          goto LABEL_39;
        }
      }
      else if (*((unsigned char *)v4 + 53))
      {
        goto LABEL_39;
      }
      BOOL v9 = 1;
      goto LABEL_40;
    }
LABEL_39:
    BOOL v9 = 0;
  }
LABEL_40:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_resultType;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_icloudAccountMatch;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_onboardAbandonStage hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_totalChannelSelections;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_totalTopicSelections;
      goto LABEL_11;
    }
  }
  uint64_t v7 = 0;
LABEL_11:
  uint64_t v8 = [(NSMutableArray *)self->_channelIds hash];
  uint64_t v9 = [(NSMutableArray *)self->_topicIds hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_totalResets;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_sawEmailOptIn;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 56);
  if (v6)
  {
    self->_resultType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 56);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_icloudAccountMatch = *((unsigned char *)v4 + 52);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 2)) {
    -[NTPBUserOnboardingResult setOnboardAbandonStage:](self, "setOnboardAbandonStage:");
  }
  char v7 = *((unsigned char *)v5 + 56);
  if ((v7 & 2) != 0)
  {
    self->_totalChannelSelections = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v5 + 56);
  }
  if ((v7 & 8) != 0)
  {
    self->_totalTopicSelections = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = *((id *)v5 + 1);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NTPBUserOnboardingResult *)self addChannelId:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = *((id *)v5 + 4);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[NTPBUserOnboardingResult addTopicId:](self, "addTopicId:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  char v18 = *((unsigned char *)v5 + 56);
  if ((v18 & 4) != 0)
  {
    self->_totalResets = *((_DWORD *)v5 + 11);
    *(unsigned char *)&self->_has |= 4u;
    char v18 = *((unsigned char *)v5 + 56);
  }
  if ((v18 & 0x20) != 0)
  {
    self->_sawEmailOptIn = *((unsigned char *)v5 + 53);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (BOOL)icloudAccountMatch
{
  return self->_icloudAccountMatch;
}

- (NSString)onboardAbandonStage
{
  return self->_onboardAbandonStage;
}

- (void)setOnboardAbandonStage:(id)a3
{
}

- (int)totalChannelSelections
{
  return self->_totalChannelSelections;
}

- (int)totalTopicSelections
{
  return self->_totalTopicSelections;
}

- (NSMutableArray)channelIds
{
  return self->_channelIds;
}

- (void)setChannelIds:(id)a3
{
}

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
}

- (int)totalResets
{
  return self->_totalResets;
}

- (BOOL)sawEmailOptIn
{
  return self->_sawEmailOptIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_onboardAbandonStage, 0);

  objc_storeStrong((id *)&self->_channelIds, 0);
}

@end