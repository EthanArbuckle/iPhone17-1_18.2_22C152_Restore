@interface NTPBUserOnboardingChannelPickerComplete
+ (Class)channelIdType;
+ (Class)topicIdType;
- (BOOL)fromPersonalizeNews;
- (BOOL)hasChannelPickerPresentationReason;
- (BOOL)hasFromPersonalizeNews;
- (BOOL)hasTotalChannelSelections;
- (BOOL)hasTotalTopicSelections;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)channelIds;
- (NSMutableArray)topicIds;
- (id)channelIdAtIndex:(unint64_t)a3;
- (id)channelPickerPresentationReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicIdAtIndex:(unint64_t)a3;
- (int)StringAsChannelPickerPresentationReason:(id)a3;
- (int)channelPickerPresentationReason;
- (int)totalChannelSelections;
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
- (void)setChannelPickerPresentationReason:(int)a3;
- (void)setFromPersonalizeNews:(BOOL)a3;
- (void)setHasChannelPickerPresentationReason:(BOOL)a3;
- (void)setHasFromPersonalizeNews:(BOOL)a3;
- (void)setHasTotalChannelSelections:(BOOL)a3;
- (void)setHasTotalTopicSelections:(BOOL)a3;
- (void)setTopicIds:(id)a3;
- (void)setTotalChannelSelections:(int)a3;
- (void)setTotalTopicSelections:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBUserOnboardingChannelPickerComplete

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
  *(unsigned char *)&self->_has |= 4u;
  self->_totalTopicSelections = a3;
}

- (void)setHasTotalTopicSelections:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalTopicSelections
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (void)setFromPersonalizeNews:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_fromPersonalizeNews = a3;
}

- (void)setHasFromPersonalizeNews:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFromPersonalizeNews
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)channelPickerPresentationReason
{
  if (*(unsigned char *)&self->_has) {
    return self->_channelPickerPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setChannelPickerPresentationReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channelPickerPresentationReason = a3;
}

- (void)setHasChannelPickerPresentationReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelPickerPresentationReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)channelPickerPresentationReasonAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444A760[a3];
  }

  return v3;
}

- (int)StringAsChannelPickerPresentationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CHANNEL_PICKER_PRESENTATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PICK_FAVORITES_FOR_YOU_CHANNEL_PICKER_PRESENTATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PICK_FAVORITES_FAVORITES_CHANNEL_PICKER_PRESENTATION_REASON"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserOnboardingChannelPickerComplete;
  int v4 = [(NTPBUserOnboardingChannelPickerComplete *)&v8 description];
  v5 = [(NTPBUserOnboardingChannelPickerComplete *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_totalChannelSelections];
    [v3 setObject:v5 forKey:@"total_channel_selections"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_totalTopicSelections];
    [v3 setObject:v6 forKey:@"total_topic_selections"];
  }
  channelIds = self->_channelIds;
  if (channelIds) {
    [v3 setObject:channelIds forKey:@"channel_id"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v3 setObject:topicIds forKey:@"topic_id"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 8) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_fromPersonalizeNews];
    [v3 setObject:v10 forKey:@"from_personalize_news"];

    char v9 = (char)self->_has;
  }
  if (v9)
  {
    uint64_t channelPickerPresentationReason = self->_channelPickerPresentationReason;
    if (channelPickerPresentationReason >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_channelPickerPresentationReason);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_26444A760[channelPickerPresentationReason];
    }
    [v3 setObject:v12 forKey:@"channel_picker_presentation_reason"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserOnboardingChannelPickerCompleteReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_channelIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = self->_topicIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v16 = (char)self->_has;
  }
  if (v16) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_totalChannelSelections;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_totalTopicSelections;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = self->_channelIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addChannelId:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = self->_topicIds;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        [(id)v6 addTopicId:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  char v20 = (char)self->_has;
  if ((v20 & 8) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_fromPersonalizeNews;
    *(unsigned char *)(v6 + 44) |= 8u;
    char v20 = (char)self->_has;
  }
  if (v20)
  {
    *(_DWORD *)(v6 + 16) = self->_channelPickerPresentationReason;
    *(unsigned char *)(v6 + 44) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_totalChannelSelections != *((_DWORD *)v4 + 8)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_totalTopicSelections != *((_DWORD *)v4 + 9)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_28;
  }
  channelIds = self->_channelIds;
  if ((unint64_t)channelIds | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](channelIds, "isEqual:"))
  {
    goto LABEL_28;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](topicIds, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) != 0)
    {
      if (self->_fromPersonalizeNews)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_28;
        }
        goto LABEL_24;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_24;
      }
    }
LABEL_28:
    BOOL v7 = 0;
    goto LABEL_29;
  }
  if ((*((unsigned char *)v4 + 44) & 8) != 0) {
    goto LABEL_28;
  }
LABEL_24:
  BOOL v7 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_channelPickerPresentationReason != *((_DWORD *)v4 + 4)) {
      goto LABEL_28;
    }
    BOOL v7 = 1;
  }
LABEL_29:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_totalChannelSelections;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_totalTopicSelections;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_channelIds hash];
  uint64_t v6 = [(NSMutableArray *)self->_topicIds hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_fromPersonalizeNews;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_channelPickerPresentationReason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_totalChannelSelections = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((v6 & 4) != 0)
  {
    self->_totalTopicSelections = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
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
        [(NTPBUserOnboardingChannelPickerComplete *)self addChannelId:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = *((id *)v5 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
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
        -[NTPBUserOnboardingChannelPickerComplete addTopicId:](self, "addTopicId:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  char v17 = *((unsigned char *)v5 + 44);
  if ((v17 & 8) != 0)
  {
    self->_fromPersonalizeNews = *((unsigned char *)v5 + 40);
    *(unsigned char *)&self->_has |= 8u;
    char v17 = *((unsigned char *)v5 + 44);
  }
  if (v17)
  {
    self->_uint64_t channelPickerPresentationReason = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
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

- (BOOL)fromPersonalizeNews
{
  return self->_fromPersonalizeNews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);

  objc_storeStrong((id *)&self->_channelIds, 0);
}

@end