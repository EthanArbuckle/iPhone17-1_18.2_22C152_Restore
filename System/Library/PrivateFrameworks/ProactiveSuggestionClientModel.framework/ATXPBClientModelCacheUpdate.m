@interface ATXPBClientModelCacheUpdate
+ (Class)suggestionsType;
- (ATXPBResponseForRequestForSuggestions)responseForRequestForSuggestions;
- (BOOL)hasCacheCreationDate;
- (BOOL)hasClientModelId;
- (BOOL)hasFeedbackMetadata;
- (BOOL)hasResponseForRequestForSuggestions;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)feedbackMetadata;
- (NSMutableArray)suggestions;
- (NSString)clientModelId;
- (NSString)uuidString;
- (double)cacheCreationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (void)addSuggestions:(id)a3;
- (void)clearSuggestions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCacheCreationDate:(double)a3;
- (void)setClientModelId:(id)a3;
- (void)setFeedbackMetadata:(id)a3;
- (void)setHasCacheCreationDate:(BOOL)a3;
- (void)setResponseForRequestForSuggestions:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBClientModelCacheUpdate

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (void)clearSuggestions
{
}

- (void)addSuggestions:(id)a3
{
  id v4 = a3;
  suggestions = self->_suggestions;
  id v8 = v4;
  if (!suggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_suggestions;
    self->_suggestions = v6;

    id v4 = v8;
    suggestions = self->_suggestions;
  }
  [(NSMutableArray *)suggestions addObject:v4];
}

- (unint64_t)suggestionsCount
{
  return [(NSMutableArray *)self->_suggestions count];
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestions objectAtIndex:a3];
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFeedbackMetadata
{
  return self->_feedbackMetadata != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setCacheCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cacheCreationDate = a3;
}

- (void)setHasCacheCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCacheCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasResponseForRequestForSuggestions
{
  return self->_responseForRequestForSuggestions != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBClientModelCacheUpdate;
  id v4 = [(ATXPBClientModelCacheUpdate *)&v8 description];
  v5 = [(ATXPBClientModelCacheUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  if ([(NSMutableArray *)self->_suggestions count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = self->_suggestions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"suggestions"];
  }
  feedbackMetadata = self->_feedbackMetadata;
  if (feedbackMetadata) {
    [v4 setObject:feedbackMetadata forKey:@"feedbackMetadata"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v4 setObject:clientModelId forKey:@"clientModelId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v15 = [NSNumber numberWithDouble:self->_cacheCreationDate];
    [v4 setObject:v15 forKey:@"cacheCreationDate"];
  }
  responseForRequestForSuggestions = self->_responseForRequestForSuggestions;
  if (responseForRequestForSuggestions)
  {
    v17 = [(ATXPBResponseForRequestForSuggestions *)responseForRequestForSuggestions dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"responseForRequestForSuggestions"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBClientModelCacheUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuidString) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_suggestions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_feedbackMetadata) {
    PBDataWriterWriteDataField();
  }
  if (self->_clientModelId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_responseForRequestForSuggestions) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_uuidString) {
    objc_msgSend(v9, "setUuidString:");
  }
  if ([(ATXPBClientModelCacheUpdate *)self suggestionsCount])
  {
    [v9 clearSuggestions];
    unint64_t v4 = [(ATXPBClientModelCacheUpdate *)self suggestionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBClientModelCacheUpdate *)self suggestionsAtIndex:i];
        [v9 addSuggestions:v7];
      }
    }
  }
  if (self->_feedbackMetadata) {
    objc_msgSend(v9, "setFeedbackMetadata:");
  }
  uint64_t v8 = v9;
  if (self->_clientModelId)
  {
    objc_msgSend(v9, "setClientModelId:");
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[1] = *(void *)&self->_cacheCreationDate;
    *((unsigned char *)v8 + 56) |= 1u;
  }
  if (self->_responseForRequestForSuggestions)
  {
    objc_msgSend(v9, "setResponseForRequestForSuggestions:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_suggestions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v12), "copyWithZone:", a3, (void)v21);
        [(id)v5 addSuggestions:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_feedbackMetadata copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  uint64_t v16 = [(NSString *)self->_clientModelId copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_cacheCreationDate;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v18 = -[ATXPBResponseForRequestForSuggestions copyWithZone:](self->_responseForRequestForSuggestions, "copyWithZone:", a3, (void)v21);
  long long v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_17;
    }
  }
  suggestions = self->_suggestions;
  if ((unint64_t)suggestions | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](suggestions, "isEqual:")) {
      goto LABEL_17;
    }
  }
  feedbackMetadata = self->_feedbackMetadata;
  if ((unint64_t)feedbackMetadata | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](feedbackMetadata, "isEqual:")) {
      goto LABEL_17;
    }
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_cacheCreationDate != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  responseForRequestForSuggestions = self->_responseForRequestForSuggestions;
  if ((unint64_t)responseForRequestForSuggestions | *((void *)v4 + 4)) {
    char v10 = -[ATXPBResponseForRequestForSuggestions isEqual:](responseForRequestForSuggestions, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  uint64_t v4 = [(NSMutableArray *)self->_suggestions hash];
  uint64_t v5 = [(NSData *)self->_feedbackMetadata hash];
  NSUInteger v6 = [(NSString *)self->_clientModelId hash];
  if (*(unsigned char *)&self->_has)
  {
    double cacheCreationDate = self->_cacheCreationDate;
    double v9 = -cacheCreationDate;
    if (cacheCreationDate >= 0.0) {
      double v9 = self->_cacheCreationDate;
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(ATXPBResponseForRequestForSuggestions *)self->_responseForRequestForSuggestions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[ATXPBClientModelCacheUpdate setUuidString:](self, "setUuidString:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ATXPBClientModelCacheUpdate addSuggestions:](self, "addSuggestions:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[ATXPBClientModelCacheUpdate setFeedbackMetadata:](self, "setFeedbackMetadata:");
  }
  if (*((void *)v4 + 2)) {
    -[ATXPBClientModelCacheUpdate setClientModelId:](self, "setClientModelId:");
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_double cacheCreationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  responseForRequestForSuggestions = self->_responseForRequestForSuggestions;
  uint64_t v11 = *((void *)v4 + 4);
  if (responseForRequestForSuggestions)
  {
    if (v11) {
      -[ATXPBResponseForRequestForSuggestions mergeFrom:](responseForRequestForSuggestions, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[ATXPBClientModelCacheUpdate setResponseForRequestForSuggestions:](self, "setResponseForRequestForSuggestions:");
  }
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)setFeedbackMetadata:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (double)cacheCreationDate
{
  return self->_cacheCreationDate;
}

- (ATXPBResponseForRequestForSuggestions)responseForRequestForSuggestions
{
  return self->_responseForRequestForSuggestions;
}

- (void)setResponseForRequestForSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_responseForRequestForSuggestions, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

@end