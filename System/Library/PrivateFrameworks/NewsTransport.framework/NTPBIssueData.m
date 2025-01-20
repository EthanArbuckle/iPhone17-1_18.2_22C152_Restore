@interface NTPBIssueData
+ (Class)topicIdsType;
- (BOOL)hasIsBundlePaid;
- (BOOL)hasIssueId;
- (BOOL)hasIssueType;
- (BOOL)isBundlePaid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)topicIds;
- (NSString)issueId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)issueTypeAsString:(int)a3;
- (id)topicIdsAtIndex:(unint64_t)a3;
- (int)StringAsIssueType:(id)a3;
- (int)issueType;
- (unint64_t)hash;
- (unint64_t)topicIdsCount;
- (void)addTopicIds:(id)a3;
- (void)clearTopicIds;
- (void)mergeFrom:(id)a3;
- (void)setHasIsBundlePaid:(BOOL)a3;
- (void)setHasIssueType:(BOOL)a3;
- (void)setIsBundlePaid:(BOOL)a3;
- (void)setIssueId:(id)a3;
- (void)setIssueType:(int)a3;
- (void)setTopicIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBIssueData

- (BOOL)hasIssueId
{
  return self->_issueId != 0;
}

- (void)setIsBundlePaid:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isBundlePaid = a3;
}

- (void)setHasIsBundlePaid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsBundlePaid
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)issueType
{
  if (*(unsigned char *)&self->_has) {
    return self->_issueType;
  }
  else {
    return 0;
  }
}

- (void)setIssueType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_issueType = a3;
}

- (void)setHasIssueType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIssueType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)issueTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C3C0[a3];
  }

  return v3;
}

- (int)StringAsIssueType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ISSUE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANF_ISSUE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PDF_ISSUE_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearTopicIds
{
}

- (void)addTopicIds:(id)a3
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

- (id)topicIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicIds objectAtIndex:a3];
}

+ (Class)topicIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBIssueData;
  id v4 = [(NTPBIssueData *)&v8 description];
  v5 = [(NTPBIssueData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  issueId = self->_issueId;
  if (issueId) {
    [v3 setObject:issueId forKey:@"issue_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_isBundlePaid];
    [v4 setObject:v7 forKey:@"is_bundle_paid"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t issueType = self->_issueType;
    if (issueType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_issueType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_26444C3C0[issueType];
    }
    [v4 setObject:v9 forKey:@"issue_type"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v4 setObject:topicIds forKey:@"topic_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_issueId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_topicIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_issueId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_isBundlePaid;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_issueType;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_topicIds;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addTopicIds:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  issueId = self->_issueId;
  if ((unint64_t)issueId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](issueId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_isBundlePaid)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_19;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_12;
      }
    }
LABEL_19:
    char v7 = 0;
    goto LABEL_20;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_19;
  }
LABEL_12:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_issueType != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_issueId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isBundlePaid;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_topicIds hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_issueType;
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_topicIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NTPBIssueData setIssueId:](self, "setIssueId:");
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_isBundlePaid = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_uint64_t issueType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NTPBIssueData addTopicIds:](self, "addTopicIds:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)issueId
{
  return self->_issueId;
}

- (void)setIssueId:(id)a3
{
}

- (BOOL)isBundlePaid
{
  return self->_isBundlePaid;
}

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);

  objc_storeStrong((id *)&self->_issueId, 0);
}

@end