@interface NTPBTodayPersonalizationEvent
+ (Class)headlineTopicsType;
- (BOOL)hasAction;
- (BOOL)hasArticleId;
- (BOOL)hasCreatedAt;
- (BOOL)hasGroupType;
- (BOOL)hasHeadlinePublisher;
- (BOOL)hasOrderInGroup;
- (BOOL)hasOverallOrder;
- (BOOL)hasPersonalizationSectionFeatureId;
- (BOOL)hasSectionOrder;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)headlineTopics;
- (NSString)articleId;
- (NSString)headlinePublisher;
- (NSString)personalizationSectionFeatureId;
- (double)createdAt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)headlineTopicsAtIndex:(unint64_t)a3;
- (int)action;
- (int64_t)groupType;
- (int64_t)orderInGroup;
- (int64_t)overallOrder;
- (int64_t)sectionOrder;
- (unint64_t)hash;
- (unint64_t)headlineTopicsCount;
- (void)addHeadlineTopics:(id)a3;
- (void)clearHeadlineTopics;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int)a3;
- (void)setArticleId:(id)a3;
- (void)setCreatedAt:(double)a3;
- (void)setGroupType:(int64_t)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasCreatedAt:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasOrderInGroup:(BOOL)a3;
- (void)setHasOverallOrder:(BOOL)a3;
- (void)setHasSectionOrder:(BOOL)a3;
- (void)setHeadlinePublisher:(id)a3;
- (void)setHeadlineTopics:(id)a3;
- (void)setOrderInGroup:(int64_t)a3;
- (void)setOverallOrder:(int64_t)a3;
- (void)setPersonalizationSectionFeatureId:(id)a3;
- (void)setSectionOrder:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayPersonalizationEvent

- (int)action
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_action;
  }
  else {
    return 1;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAction
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (void)clearHeadlineTopics
{
}

- (void)addHeadlineTopics:(id)a3
{
  id v4 = a3;
  headlineTopics = self->_headlineTopics;
  id v8 = v4;
  if (!headlineTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_headlineTopics;
    self->_headlineTopics = v6;

    id v4 = v8;
    headlineTopics = self->_headlineTopics;
  }
  [(NSMutableArray *)headlineTopics addObject:v4];
}

- (unint64_t)headlineTopicsCount
{
  return [(NSMutableArray *)self->_headlineTopics count];
}

- (id)headlineTopicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_headlineTopics objectAtIndex:a3];
}

+ (Class)headlineTopicsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHeadlinePublisher
{
  return self->_headlinePublisher != 0;
}

- (void)setCreatedAt:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_createdAt = a3;
}

- (void)setHasCreatedAt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedAt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOrderInGroup:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_orderInGroup = a3;
}

- (void)setHasOrderInGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOrderInGroup
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOverallOrder:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_overallOrder = a3;
}

- (void)setHasOverallOrder:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOverallOrder
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSectionOrder:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_sectionOrder = a3;
}

- (void)setHasSectionOrder:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSectionOrder
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasPersonalizationSectionFeatureId
{
  return self->_personalizationSectionFeatureId != 0;
}

- (void)setGroupType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGroupType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayPersonalizationEvent;
  id v4 = [(NTPBTodayPersonalizationEvent *)&v8 description];
  v5 = [(NTPBTodayPersonalizationEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_action];
    [v3 setObject:v4 forKey:@"action"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  if ([(NSMutableArray *)self->_headlineTopics count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_headlineTopics, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = self->_headlineTopics;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
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
          v12 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"headline_topics"];
  }
  headlinePublisher = self->_headlinePublisher;
  if (headlinePublisher) {
    [v3 setObject:headlinePublisher forKey:@"headline_publisher"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v19 = [NSNumber numberWithDouble:self->_createdAt];
    [v3 setObject:v19 forKey:@"created_at"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_18:
      if ((has & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_18;
  }
  v20 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_orderInGroup, (void)v22);
  [v3 setObject:v20 forKey:@"order_in_group"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_30:
  v21 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_overallOrder, (void)v22);
  [v3 setObject:v21 forKey:@"overall_order"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    v15 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_sectionOrder, (void)v22);
    [v3 setObject:v15 forKey:@"section_order"];
  }
LABEL_21:
  personalizationSectionFeatureId = self->_personalizationSectionFeatureId;
  if (personalizationSectionFeatureId) {
    [v3 setObject:personalizationSectionFeatureId forKey:@"personalization_section_feature_id"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v17 = [NSNumber numberWithLongLong:self->_groupType];
    [v3 setObject:v17 forKey:@"group_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayPersonalizationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_headlineTopics;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_headlinePublisher) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_16:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_18:
  }
    PBDataWriterWriteInt64Field();
LABEL_19:
  if (self->_personalizationSectionFeatureId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_action;
    *(unsigned char *)(v5 + 88) |= 0x20u;
  }
  uint64_t v7 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v7;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = self->_headlineTopics;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [(id)v6 addHeadlineTopics:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSString *)self->_headlinePublisher copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v15;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v6 + 8) = self->_createdAt;
    *(unsigned char *)(v6 + 88) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  *(void *)(v6 + 24) = self->_orderInGroup;
  *(unsigned char *)(v6 + 88) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_20:
  *(void *)(v6 + 32) = self->_overallOrder;
  *(unsigned char *)(v6 + 88) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *(void *)(v6 + 40) = self->_sectionOrder;
    *(unsigned char *)(v6 + 88) |= 0x10u;
  }
LABEL_15:
  uint64_t v18 = -[NSString copyWithZone:](self->_personalizationSectionFeatureId, "copyWithZone:", a3, (void)v21);
  v19 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v18;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_groupType;
    *(unsigned char *)(v6 + 88) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x20) == 0 || self->_action != *((_DWORD *)v4 + 12)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 7) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_40;
  }
  headlineTopics = self->_headlineTopics;
  if ((unint64_t)headlineTopics | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](headlineTopics, "isEqual:")) {
      goto LABEL_40;
    }
  }
  headlinePublisher = self->_headlinePublisher;
  if ((unint64_t)headlinePublisher | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](headlinePublisher, "isEqual:")) {
      goto LABEL_40;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_createdAt != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0 || self->_orderInGroup != *((void *)v4 + 3)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 8) == 0 || self->_overallOrder != *((void *)v4 + 4)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x10) == 0 || self->_sectionOrder != *((void *)v4 + 5)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  personalizationSectionFeatureId = self->_personalizationSectionFeatureId;
  if ((unint64_t)personalizationSectionFeatureId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](personalizationSectionFeatureId, "isEqual:"))
    {
LABEL_40:
      BOOL v10 = 0;
      goto LABEL_41;
    }
    char has = (char)self->_has;
  }
  BOOL v10 = (*((unsigned char *)v4 + 88) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_groupType != *((void *)v4 + 2)) {
      goto LABEL_40;
    }
    BOOL v10 = 1;
  }
LABEL_41:

  return v10;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v18 = 2654435761 * self->_action;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_articleId hash];
  uint64_t v4 = [(NSMutableArray *)self->_headlineTopics hash];
  NSUInteger v5 = [(NSString *)self->_headlinePublisher hash];
  char has = (char)self->_has;
  if (has)
  {
    double createdAt = self->_createdAt;
    double v9 = -createdAt;
    if (createdAt >= 0.0) {
      double v9 = self->_createdAt;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 4) == 0)
  {
    uint64_t v12 = 0;
    if ((has & 8) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v13 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v12 = 2654435761 * self->_orderInGroup;
  if ((has & 8) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v13 = 2654435761 * self->_overallOrder;
  if ((has & 0x10) != 0)
  {
LABEL_15:
    uint64_t v14 = 2654435761 * self->_sectionOrder;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v14 = 0;
LABEL_19:
  NSUInteger v15 = [(NSString *)self->_personalizationSectionFeatureId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v16 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v16 = 0;
  }
  return v3 ^ v18 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if ((v4[22] & 0x20) != 0)
  {
    self->_action = v4[12];
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 7)) {
    -[NTPBTodayPersonalizationEvent setArticleId:](self, "setArticleId:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v5 + 9);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NTPBTodayPersonalizationEvent addHeadlineTopics:](self, "addHeadlineTopics:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 8)) {
    -[NTPBTodayPersonalizationEvent setHeadlinePublisher:](self, "setHeadlinePublisher:");
  }
  char v11 = *((unsigned char *)v5 + 88);
  if (v11)
  {
    self->_double createdAt = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v11 = *((unsigned char *)v5 + 88);
    if ((v11 & 4) == 0)
    {
LABEL_16:
      if ((v11 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v5 + 88) & 4) == 0)
  {
    goto LABEL_16;
  }
  self->_orderInGroup = *((void *)v5 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v11 = *((unsigned char *)v5 + 88);
  if ((v11 & 8) == 0)
  {
LABEL_17:
    if ((v11 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_26:
  self->_overallOrder = *((void *)v5 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v5 + 88) & 0x10) != 0)
  {
LABEL_18:
    self->_sectionOrder = *((void *)v5 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_19:
  if (*((void *)v5 + 10)) {
    -[NTPBTodayPersonalizationEvent setPersonalizationSectionFeatureId:](self, "setPersonalizationSectionFeatureId:");
  }
  if ((*((unsigned char *)v5 + 88) & 2) != 0)
  {
    self->_groupType = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSMutableArray)headlineTopics
{
  return self->_headlineTopics;
}

- (void)setHeadlineTopics:(id)a3
{
}

- (NSString)headlinePublisher
{
  return self->_headlinePublisher;
}

- (void)setHeadlinePublisher:(id)a3
{
}

- (double)createdAt
{
  return self->_createdAt;
}

- (int64_t)orderInGroup
{
  return self->_orderInGroup;
}

- (int64_t)overallOrder
{
  return self->_overallOrder;
}

- (int64_t)sectionOrder
{
  return self->_sectionOrder;
}

- (NSString)personalizationSectionFeatureId
{
  return self->_personalizationSectionFeatureId;
}

- (void)setPersonalizationSectionFeatureId:(id)a3
{
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationSectionFeatureId, 0);
  objc_storeStrong((id *)&self->_headlineTopics, 0);
  objc_storeStrong((id *)&self->_headlinePublisher, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end