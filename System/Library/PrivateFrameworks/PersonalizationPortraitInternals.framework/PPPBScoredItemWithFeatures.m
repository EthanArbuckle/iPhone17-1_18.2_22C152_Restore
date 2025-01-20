@interface PPPBScoredItemWithFeatures
+ (Class)featuresType;
+ (Class)feedbackItemsType;
- (BOOL)hasNamedEntity;
- (BOOL)hasNamedEntityWithFeedback;
- (BOOL)hasScore;
- (BOOL)hasTopicId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)features;
- (NSMutableArray)feedbackItems;
- (NSString)namedEntity;
- (NSString)namedEntityWithFeedback;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featuresAtIndex:(unint64_t)a3;
- (id)feedbackItemsAtIndex:(unint64_t)a3;
- (unint64_t)featuresCount;
- (unint64_t)feedbackItemsCount;
- (unint64_t)hash;
- (unint64_t)topicId;
- (void)addFeatures:(id)a3;
- (void)addFeedbackItems:(id)a3;
- (void)clearFeatures;
- (void)clearFeedbackItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setFeedbackItems:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasTopicId:(BOOL)a3;
- (void)setNamedEntity:(id)a3;
- (void)setNamedEntityWithFeedback:(id)a3;
- (void)setScore:(float)a3;
- (void)setTopicId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBScoredItemWithFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityWithFeedback, 0);
  objc_storeStrong((id *)&self->_namedEntity, 0);
  objc_storeStrong((id *)&self->_feedbackItems, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

- (void)setFeedbackItems:(id)a3
{
}

- (NSMutableArray)feedbackItems
{
  return self->_feedbackItems;
}

- (void)setFeatures:(id)a3
{
}

- (NSMutableArray)features
{
  return self->_features;
}

- (float)score
{
  return self->_score;
}

- (void)setNamedEntityWithFeedback:(id)a3
{
}

- (NSString)namedEntityWithFeedback
{
  return self->_namedEntityWithFeedback;
}

- (void)setNamedEntity:(id)a3
{
}

- (NSString)namedEntity
{
  return self->_namedEntity;
}

- (unint64_t)topicId
{
  return self->_topicId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 52))
  {
    self->_topicId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[4]) {
    -[PPPBScoredItemWithFeatures setNamedEntity:](self, "setNamedEntity:");
  }
  if ((*((unsigned char *)v5 + 52) & 2) != 0)
  {
    self->_score = *((float *)v5 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v5 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PPPBScoredItemWithFeatures *)self addFeatures:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 3);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[PPPBScoredItemWithFeatures addFeedbackItems:](self, "addFeedbackItems:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (*((void *)v5 + 5)) {
    -[PPPBScoredItemWithFeatures setNamedEntityWithFeedback:](self, "setNamedEntityWithFeedback:");
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_topicId;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_namedEntity hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    float score = self->_score;
    float v7 = -score;
    if (score >= 0.0) {
      float v7 = self->_score;
    }
    float v8 = floorf(v7 + 0.5);
    float v9 = (float)(v7 - v8) * 1.8447e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  uint64_t v10 = v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_features hash];
  uint64_t v11 = [(NSMutableArray *)self->_feedbackItems hash];
  return v10 ^ v11 ^ [(NSString *)self->_namedEntityWithFeedback hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 52);
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_topicId != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_21;
  }
  namedEntity = self->_namedEntity;
  if ((unint64_t)namedEntity | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](namedEntity, "isEqual:"))
    {
LABEL_21:
      char v11 = 0;
      goto LABEL_22;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 52);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_score != *((float *)v4 + 12)) {
      goto LABEL_21;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_21;
  }
  features = self->_features;
  if ((unint64_t)features | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](features, "isEqual:"))
  {
    goto LABEL_21;
  }
  feedbackItems = self->_feedbackItems;
  if ((unint64_t)feedbackItems | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](feedbackItems, "isEqual:")) {
      goto LABEL_21;
    }
  }
  namedEntityWithFeedback = self->_namedEntityWithFeedback;
  if ((unint64_t)namedEntityWithFeedback | *((void *)v4 + 5)) {
    char v11 = -[NSString isEqual:](namedEntityWithFeedback, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_22:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_topicId;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_namedEntity copyWithZone:a3];
  float v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)(v6 + 48) = self->_score;
    *(unsigned char *)(v6 + 52) |= 2u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  float v9 = self->_features;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v13) copyWithZone:a3];
        [(id)v6 addFeatures:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = self->_feedbackItems;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v19), "copyWithZone:", a3, (void)v24);
        [(id)v6 addFeedbackItems:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }

  uint64_t v21 = [(NSString *)self->_namedEntityWithFeedback copyWithZone:a3];
  long long v22 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v21;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_topicId;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  uint64_t v13 = v4;
  if (self->_namedEntity)
  {
    objc_msgSend(v4, "setNamedEntity:");
    id v4 = v13;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = LODWORD(self->_score);
    *((unsigned char *)v4 + 52) |= 2u;
  }
  if ([(PPPBScoredItemWithFeatures *)self featuresCount])
  {
    [v13 clearFeatures];
    unint64_t v5 = [(PPPBScoredItemWithFeatures *)self featuresCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        float v8 = [(PPPBScoredItemWithFeatures *)self featuresAtIndex:i];
        [v13 addFeatures:v8];
      }
    }
  }
  if ([(PPPBScoredItemWithFeatures *)self feedbackItemsCount])
  {
    [v13 clearFeedbackItems];
    unint64_t v9 = [(PPPBScoredItemWithFeatures *)self feedbackItemsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(PPPBScoredItemWithFeatures *)self feedbackItemsAtIndex:j];
        [v13 addFeedbackItems:v12];
      }
    }
  }
  if (self->_namedEntityWithFeedback) {
    objc_msgSend(v13, "setNamedEntityWithFeedback:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_namedEntity) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_features;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v10 = self->_feedbackItems;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_namedEntityWithFeedback) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBScoredItemWithFeaturesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_topicId];
    [v3 setObject:v5 forKey:@"topicId"];
  }
  namedEntity = self->_namedEntity;
  if (namedEntity) {
    [v3 setObject:namedEntity forKey:@"namedEntity"];
  }
  namedEntityWithFeedback = self->_namedEntityWithFeedback;
  if (namedEntityWithFeedback) {
    [v3 setObject:namedEntityWithFeedback forKey:@"namedEntityWithFeedback"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)&double v4 = self->_score;
    uint64_t v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"score"];
  }
  if ([(NSMutableArray *)self->_features count])
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_features, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    unint64_t v10 = self->_features;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"features"];
  }
  if ([(NSMutableArray *)self->_feedbackItems count])
  {
    long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_feedbackItems, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v17 = self->_feedbackItems;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"feedbackItems"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBScoredItemWithFeatures;
  double v4 = [(PPPBScoredItemWithFeatures *)&v8 description];
  unint64_t v5 = [(PPPBScoredItemWithFeatures *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)feedbackItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_feedbackItems objectAtIndex:a3];
}

- (unint64_t)feedbackItemsCount
{
  return [(NSMutableArray *)self->_feedbackItems count];
}

- (void)addFeedbackItems:(id)a3
{
  id v4 = a3;
  feedbackItems = self->_feedbackItems;
  id v8 = v4;
  if (!feedbackItems)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_feedbackItems;
    self->_feedbackItems = v6;

    id v4 = v8;
    feedbackItems = self->_feedbackItems;
  }
  [(NSMutableArray *)feedbackItems addObject:v4];
}

- (void)clearFeedbackItems
{
}

- (id)featuresAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_features objectAtIndex:a3];
}

- (unint64_t)featuresCount
{
  return [(NSMutableArray *)self->_features count];
}

- (void)addFeatures:(id)a3
{
  id v4 = a3;
  features = self->_features;
  id v8 = v4;
  if (!features)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_features;
    self->_features = v6;

    id v4 = v8;
    features = self->_features;
  }
  [(NSMutableArray *)features addObject:v4];
}

- (void)clearFeatures
{
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float score = a3;
}

- (BOOL)hasNamedEntityWithFeedback
{
  return self->_namedEntityWithFeedback != 0;
}

- (BOOL)hasNamedEntity
{
  return self->_namedEntity != 0;
}

- (BOOL)hasTopicId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTopicId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTopicId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_topicId = a3;
}

+ (Class)feedbackItemsType
{
  return (Class)objc_opt_class();
}

+ (Class)featuresType
{
  return (Class)objc_opt_class();
}

@end