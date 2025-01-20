@interface ICIAMMetricEvent
+ (Class)actionDetailsType;
+ (Class)pageDetailsType;
- (BOOL)hasActionType;
- (BOOL)hasActionURL;
- (BOOL)hasEventType;
- (BOOL)hasImpression;
- (BOOL)hasImpressionType;
- (BOOL)hasPageId;
- (BOOL)hasPageType;
- (BOOL)hasPageUrl;
- (BOOL)hasTargetId;
- (BOOL)hasTargetType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ICIAMImpressionNode)impression;
- (NSMutableArray)actionDetails;
- (NSMutableArray)pageDetails;
- (NSString)actionURL;
- (NSString)eventType;
- (NSString)impressionType;
- (NSString)pageId;
- (NSString)pageUrl;
- (NSString)targetId;
- (id)actionDetailsAtIndex:(unint64_t)a3;
- (id)actionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pageDetailsAtIndex:(unint64_t)a3;
- (id)pageTypeAsString:(int)a3;
- (id)targetTypeAsString:(int)a3;
- (int)StringAsActionType:(id)a3;
- (int)StringAsPageType:(id)a3;
- (int)StringAsTargetType:(id)a3;
- (int)actionType;
- (int)pageType;
- (int)targetType;
- (unint64_t)actionDetailsCount;
- (unint64_t)hash;
- (unint64_t)pageDetailsCount;
- (void)addActionDetails:(id)a3;
- (void)addPageDetails:(id)a3;
- (void)clearActionDetails;
- (void)clearPageDetails;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionDetails:(id)a3;
- (void)setActionType:(int)a3;
- (void)setActionURL:(id)a3;
- (void)setEventType:(id)a3;
- (void)setHasActionType:(BOOL)a3;
- (void)setHasPageType:(BOOL)a3;
- (void)setHasTargetType:(BOOL)a3;
- (void)setImpression:(id)a3;
- (void)setImpressionType:(id)a3;
- (void)setPageDetails:(id)a3;
- (void)setPageId:(id)a3;
- (void)setPageType:(int)a3;
- (void)setPageUrl:(id)a3;
- (void)setTargetId:(id)a3;
- (void)setTargetType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetId, 0);
  objc_storeStrong((id *)&self->_pageUrl, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
  objc_storeStrong((id *)&self->_pageDetails, 0);
  objc_storeStrong((id *)&self->_impressionType, 0);
  objc_storeStrong((id *)&self->_impression, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);

  objc_storeStrong((id *)&self->_actionDetails, 0);
}

- (void)setImpression:(id)a3
{
}

- (ICIAMImpressionNode)impression
{
  return self->_impression;
}

- (void)setImpressionType:(id)a3
{
}

- (NSString)impressionType
{
  return self->_impressionType;
}

- (void)setPageUrl:(id)a3
{
}

- (NSString)pageUrl
{
  return self->_pageUrl;
}

- (void)setEventType:(id)a3
{
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setActionDetails:(id)a3
{
}

- (NSMutableArray)actionDetails
{
  return self->_actionDetails;
}

- (void)setActionURL:(id)a3
{
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setTargetId:(id)a3
{
}

- (NSString)targetId
{
  return self->_targetId;
}

- (void)setPageDetails:(id)a3
{
}

- (NSMutableArray)pageDetails
{
  return self->_pageDetails;
}

- (void)setPageId:(id)a3
{
}

- (NSString)pageId
{
  return self->_pageId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[ICIAMMetricEvent setPageId:](self, "setPageId:");
  }
  if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    self->_pageType = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ICIAMMetricEvent *)self addPageDetails:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 11)) {
    -[ICIAMMetricEvent setTargetId:](self, "setTargetId:");
  }
  char v10 = *((unsigned char *)v4 + 100);
  if ((v10 & 4) != 0)
  {
    self->_targetType = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
    char v10 = *((unsigned char *)v4 + 100);
  }
  if (v10)
  {
    self->_actionType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[ICIAMMetricEvent setActionURL:](self, "setActionURL:");
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *((id *)v4 + 1);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        -[ICIAMMetricEvent addActionDetails:](self, "addActionDetails:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 4)) {
    -[ICIAMMetricEvent setEventType:](self, "setEventType:");
  }
  if (*((void *)v4 + 10)) {
    -[ICIAMMetricEvent setPageUrl:](self, "setPageUrl:");
  }
  if (*((void *)v4 + 6)) {
    -[ICIAMMetricEvent setImpressionType:](self, "setImpressionType:");
  }
  impression = self->_impression;
  uint64_t v17 = *((void *)v4 + 5);
  if (impression)
  {
    if (v17) {
      -[ICIAMImpressionNode mergeFrom:](impression, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[ICIAMMetricEvent setImpression:](self, "setImpression:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_pageId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_pageType;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_pageDetails hash];
  NSUInteger v6 = [(NSString *)self->_targetId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v7 = 2654435761 * self->_targetType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_actionType;
LABEL_9:
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v10 = v7 ^ v8 ^ [(NSString *)self->_actionURL hash];
  uint64_t v11 = v9 ^ v10 ^ [(NSMutableArray *)self->_actionDetails hash];
  NSUInteger v12 = [(NSString *)self->_eventType hash];
  NSUInteger v13 = v12 ^ [(NSString *)self->_pageUrl hash];
  NSUInteger v14 = v13 ^ [(NSString *)self->_impressionType hash];
  return v11 ^ v14 ^ [(ICIAMImpressionNode *)self->_impression hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  pageId = self->_pageId;
  if ((unint64_t)pageId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](pageId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_pageType != *((_DWORD *)v4 + 18)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
LABEL_35:
    char v14 = 0;
    goto LABEL_36;
  }
  pageDetails = self->_pageDetails;
  if ((unint64_t)pageDetails | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](pageDetails, "isEqual:"))
  {
    goto LABEL_35;
  }
  targetId = self->_targetId;
  if ((unint64_t)targetId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](targetId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_targetType != *((_DWORD *)v4 + 24)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_actionType != *((_DWORD *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_35;
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((void *)v4 + 3) && !-[NSString isEqual:](actionURL, "isEqual:")) {
    goto LABEL_35;
  }
  actionDetails = self->_actionDetails;
  if ((unint64_t)actionDetails | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](actionDetails, "isEqual:")) {
      goto LABEL_35;
    }
  }
  eventType = self->_eventType;
  if ((unint64_t)eventType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](eventType, "isEqual:")) {
      goto LABEL_35;
    }
  }
  pageUrl = self->_pageUrl;
  if ((unint64_t)pageUrl | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](pageUrl, "isEqual:")) {
      goto LABEL_35;
    }
  }
  impressionType = self->_impressionType;
  if ((unint64_t)impressionType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](impressionType, "isEqual:")) {
      goto LABEL_35;
    }
  }
  impression = self->_impression;
  if ((unint64_t)impression | *((void *)v4 + 5)) {
    char v14 = -[ICIAMImpressionNode isEqual:](impression, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_36:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_pageId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_pageType;
    *(unsigned char *)(v5 + 100) |= 2u;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v8 = self->_pageDetails;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        NSUInteger v13 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPageDetails:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_targetId copyWithZone:a3];
  v15 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v14;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_targetType;
    *(unsigned char *)(v5 + 100) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_actionType;
    *(unsigned char *)(v5 + 100) |= 1u;
  }
  uint64_t v17 = [(NSString *)self->_actionURL copyWithZone:a3];
  long long v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v19 = self->_actionDetails;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "copyWithZone:", a3, (void)v34);
        [(id)v5 addActionDetails:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v21);
  }

  uint64_t v25 = [(NSString *)self->_eventType copyWithZone:a3];
  v26 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v25;

  uint64_t v27 = [(NSString *)self->_pageUrl copyWithZone:a3];
  uint64_t v28 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v27;

  uint64_t v29 = [(NSString *)self->_impressionType copyWithZone:a3];
  v30 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v29;

  id v31 = [(ICIAMImpressionNode *)self->_impression copyWithZone:a3];
  v32 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v31;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (self->_pageId)
  {
    objc_msgSend(v4, "setPageId:");
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_pageType;
    *((unsigned char *)v4 + 100) |= 2u;
  }
  if ([(ICIAMMetricEvent *)self pageDetailsCount])
  {
    [v15 clearPageDetails];
    unint64_t v5 = [(ICIAMMetricEvent *)self pageDetailsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ICIAMMetricEvent *)self pageDetailsAtIndex:i];
        [v15 addPageDetails:v8];
      }
    }
  }
  if (self->_targetId) {
    objc_msgSend(v15, "setTargetId:");
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v15 + 24) = self->_targetType;
    *((unsigned char *)v15 + 100) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v15 + 4) = self->_actionType;
    *((unsigned char *)v15 + 100) |= 1u;
  }
  if (self->_actionURL) {
    objc_msgSend(v15, "setActionURL:");
  }
  if ([(ICIAMMetricEvent *)self actionDetailsCount])
  {
    [v15 clearActionDetails];
    unint64_t v10 = [(ICIAMMetricEvent *)self actionDetailsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        NSUInteger v13 = [(ICIAMMetricEvent *)self actionDetailsAtIndex:j];
        [v15 addActionDetails:v13];
      }
    }
  }
  if (self->_eventType) {
    objc_msgSend(v15, "setEventType:");
  }
  uint64_t v14 = v15;
  if (self->_pageUrl)
  {
    objc_msgSend(v15, "setPageUrl:");
    uint64_t v14 = v15;
  }
  if (self->_impressionType)
  {
    objc_msgSend(v15, "setImpressionType:");
    uint64_t v14 = v15;
  }
  if (self->_impression)
  {
    objc_msgSend(v15, "setImpression:");
    uint64_t v14 = v15;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_pageId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v5 = self->_pageDetails;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if (self->_targetId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_actionURL) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v11 = self->_actionDetails;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (self->_eventType) {
    PBDataWriterWriteStringField();
  }
  if (self->_pageUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_impressionType) {
    PBDataWriterWriteStringField();
  }
  if (self->_impression) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMetricEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  pageId = self->_pageId;
  if (pageId) {
    [v3 setObject:pageId forKey:@"pageId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t pageType = self->_pageType;
    if pageType < 5 && ((0x17u >> pageType))
    {
      uint64_t v7 = off_1E5AC9098[pageType];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_pageType);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v7 forKey:@"pageType"];
  }
  if ([(NSMutableArray *)self->_pageDetails count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pageDetails, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v9 = self->_pageDetails;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"pageDetails"];
  }
  targetId = self->_targetId;
  if (targetId) {
    [v4 setObject:targetId forKey:@"targetId"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t targetType = self->_targetType;
    if (targetType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_targetType);
      long long v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v18 = off_1E5AC90C0[targetType];
    }
    [v4 setObject:v18 forKey:@"targetType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t actionType = self->_actionType;
    if (actionType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_actionType);
      long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v20 = off_1E5AC90E8[actionType];
    }
    [v4 setObject:v20 forKey:@"actionType"];
  }
  actionURL = self->_actionURL;
  if (actionURL) {
    [v4 setObject:actionURL forKey:@"actionURL"];
  }
  if ([(NSMutableArray *)self->_actionDetails count])
  {
    long long v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_actionDetails, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v23 = self->_actionDetails;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v35 + 1) + 8 * j) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"actionDetails"];
  }
  eventType = self->_eventType;
  if (eventType) {
    [v4 setObject:eventType forKey:@"eventType"];
  }
  pageUrl = self->_pageUrl;
  if (pageUrl) {
    [v4 setObject:pageUrl forKey:@"pageUrl"];
  }
  impressionType = self->_impressionType;
  if (impressionType) {
    [v4 setObject:impressionType forKey:@"impressionType"];
  }
  impression = self->_impression;
  if (impression)
  {
    v33 = [(ICIAMImpressionNode *)impression dictionaryRepresentation];
    [v4 setObject:v33 forKey:@"impression"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMMetricEvent;
  id v4 = [(ICIAMMetricEvent *)&v8 description];
  unint64_t v5 = [(ICIAMMetricEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasImpression
{
  return self->_impression != 0;
}

- (BOOL)hasImpressionType
{
  return self->_impressionType != 0;
}

- (BOOL)hasPageUrl
{
  return self->_pageUrl != 0;
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

- (id)actionDetailsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_actionDetails objectAtIndex:a3];
}

- (unint64_t)actionDetailsCount
{
  return [(NSMutableArray *)self->_actionDetails count];
}

- (void)addActionDetails:(id)a3
{
  id v4 = a3;
  actionDetails = self->_actionDetails;
  id v8 = v4;
  if (!actionDetails)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_actionDetails;
    self->_actionDetails = v6;

    id v4 = v8;
    actionDetails = self->_actionDetails;
  }
  [(NSMutableArray *)actionDetails addObject:v4];
}

- (void)clearActionDetails
{
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (int)StringAsActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Navigate"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Swipe"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Select"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AC90E8[a3];
  }

  return v3;
}

- (BOOL)hasActionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasActionType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setActionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t actionType = a3;
}

- (int)actionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_actionType;
  }
  else {
    return 0;
  }
}

- (int)StringAsTargetType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Card"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Button"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Slider"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Banner"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Close"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)targetTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AC90C0[a3];
  }

  return v3;
}

- (BOOL)hasTargetType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTargetType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTargetType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t targetType = a3;
}

- (int)targetType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_targetType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasTargetId
{
  return self->_targetId != 0;
}

- (id)pageDetailsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pageDetails objectAtIndex:a3];
}

- (unint64_t)pageDetailsCount
{
  return [(NSMutableArray *)self->_pageDetails count];
}

- (void)addPageDetails:(id)a3
{
  id v4 = a3;
  pageDetails = self->_pageDetails;
  id v8 = v4;
  if (!pageDetails)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_pageDetails;
    self->_pageDetails = v6;

    id v4 = v8;
    pageDetails = self->_pageDetails;
  }
  [(NSMutableArray *)pageDetails addObject:v4];
}

- (void)clearPageDetails
{
}

- (int)StringAsPageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Banner"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Modal"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Native"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Notification"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)pageTypeAsString:(int)a3
{
  if a3 < 5 && ((0x17u >> a3))
  {
    id v3 = off_1E5AC9098[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)hasPageType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPageType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPageType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t pageType = a3;
}

- (int)pageType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_pageType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasPageId
{
  return self->_pageId != 0;
}

+ (Class)actionDetailsType
{
  return (Class)objc_opt_class();
}

+ (Class)pageDetailsType
{
  return (Class)objc_opt_class();
}

@end