@interface ATXPBBiomeProactiveSuggestionUIFeedbackResult
+ (Class)engagedSuggestionsType;
+ (Class)rejectedSuggestionsType;
+ (Class)shownSuggestionsType;
- (BOOL)hasBlendingUICacheUpdateUUID;
- (BOOL)hasClientModelCacheCreationDate;
- (BOOL)hasClientModelId;
- (BOOL)hasConsumerSubType;
- (BOOL)hasSessionEndDate;
- (BOOL)hasSessionId;
- (BOOL)hasSessionStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)engagedSuggestions;
- (NSMutableArray)rejectedSuggestions;
- (NSMutableArray)shownSuggestions;
- (NSString)blendingUICacheUpdateUUID;
- (NSString)clientModelId;
- (NSString)consumerSubType;
- (NSString)sessionId;
- (double)clientModelCacheCreationDate;
- (double)sessionEndDate;
- (double)sessionStartDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagedSuggestionsAtIndex:(unint64_t)a3;
- (id)rejectedSuggestionsAtIndex:(unint64_t)a3;
- (id)shownSuggestionsAtIndex:(unint64_t)a3;
- (unint64_t)engagedSuggestionsCount;
- (unint64_t)hash;
- (unint64_t)rejectedSuggestionsCount;
- (unint64_t)shownSuggestionsCount;
- (void)addEngagedSuggestions:(id)a3;
- (void)addRejectedSuggestions:(id)a3;
- (void)addShownSuggestions:(id)a3;
- (void)clearEngagedSuggestions;
- (void)clearRejectedSuggestions;
- (void)clearShownSuggestions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBlendingUICacheUpdateUUID:(id)a3;
- (void)setClientModelCacheCreationDate:(double)a3;
- (void)setClientModelId:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setEngagedSuggestions:(id)a3;
- (void)setHasClientModelCacheCreationDate:(BOOL)a3;
- (void)setHasSessionEndDate:(BOOL)a3;
- (void)setHasSessionStartDate:(BOOL)a3;
- (void)setRejectedSuggestions:(id)a3;
- (void)setSessionEndDate:(double)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionStartDate:(double)a3;
- (void)setShownSuggestions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBBiomeProactiveSuggestionUIFeedbackResult

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasBlendingUICacheUpdateUUID
{
  return self->_blendingUICacheUpdateUUID != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setClientModelCacheCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientModelCacheCreationDate = a3;
}

- (void)setHasClientModelCacheCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientModelCacheCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (void)setSessionStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sessionStartDate = a3;
}

- (void)setHasSessionStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionStartDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSessionEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sessionEndDate = a3;
}

- (void)setHasSessionEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionEndDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearShownSuggestions
{
}

- (void)addShownSuggestions:(id)a3
{
  id v4 = a3;
  shownSuggestions = self->_shownSuggestions;
  id v8 = v4;
  if (!shownSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_shownSuggestions;
    self->_shownSuggestions = v6;

    id v4 = v8;
    shownSuggestions = self->_shownSuggestions;
  }
  [(NSMutableArray *)shownSuggestions addObject:v4];
}

- (unint64_t)shownSuggestionsCount
{
  return [(NSMutableArray *)self->_shownSuggestions count];
}

- (id)shownSuggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_shownSuggestions objectAtIndex:a3];
}

+ (Class)shownSuggestionsType
{
  return (Class)objc_opt_class();
}

- (void)clearEngagedSuggestions
{
}

- (void)addEngagedSuggestions:(id)a3
{
  id v4 = a3;
  engagedSuggestions = self->_engagedSuggestions;
  id v8 = v4;
  if (!engagedSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_engagedSuggestions;
    self->_engagedSuggestions = v6;

    id v4 = v8;
    engagedSuggestions = self->_engagedSuggestions;
  }
  [(NSMutableArray *)engagedSuggestions addObject:v4];
}

- (unint64_t)engagedSuggestionsCount
{
  return [(NSMutableArray *)self->_engagedSuggestions count];
}

- (id)engagedSuggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_engagedSuggestions objectAtIndex:a3];
}

+ (Class)engagedSuggestionsType
{
  return (Class)objc_opt_class();
}

- (void)clearRejectedSuggestions
{
}

- (void)addRejectedSuggestions:(id)a3
{
  id v4 = a3;
  rejectedSuggestions = self->_rejectedSuggestions;
  id v8 = v4;
  if (!rejectedSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_rejectedSuggestions;
    self->_rejectedSuggestions = v6;

    id v4 = v8;
    rejectedSuggestions = self->_rejectedSuggestions;
  }
  [(NSMutableArray *)rejectedSuggestions addObject:v4];
}

- (unint64_t)rejectedSuggestionsCount
{
  return [(NSMutableArray *)self->_rejectedSuggestions count];
}

- (id)rejectedSuggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rejectedSuggestions objectAtIndex:a3];
}

+ (Class)rejectedSuggestionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBBiomeProactiveSuggestionUIFeedbackResult;
  id v4 = [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)&v8 description];
  v5 = [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  if (blendingUICacheUpdateUUID) {
    [v4 setObject:blendingUICacheUpdateUUID forKey:@"blendingUICacheUpdateUUID"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v4 setObject:clientModelId forKey:@"clientModelId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_clientModelCacheCreationDate];
    [v4 setObject:v8 forKey:@"clientModelCacheCreationDate"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v4 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithDouble:self->_sessionStartDate];
    [v4 setObject:v11 forKey:@"sessionStartDate"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithDouble:self->_sessionEndDate];
    [v4 setObject:v12 forKey:@"sessionEndDate"];
  }
  if ([(NSMutableArray *)self->_shownSuggestions count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_shownSuggestions, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v14 = self->_shownSuggestions;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"shownSuggestions"];
  }
  if ([(NSMutableArray *)self->_engagedSuggestions count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_engagedSuggestions, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v21 = self->_engagedSuggestions;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v39 + 1) + 8 * j) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"engagedSuggestions"];
  }
  if ([(NSMutableArray *)self->_rejectedSuggestions count])
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_rejectedSuggestions, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v28 = self->_rejectedSuggestions;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "dictionaryRepresentation", (void)v35);
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v30);
    }

    [v4 setObject:v27 forKey:@"rejectedSuggestions"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBiomeProactiveSuggestionUIFeedbackResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sessionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_blendingUICacheUpdateUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientModelId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_consumerSubType) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = self->_shownSuggestions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = self->_engagedSuggestions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = self->_rejectedSuggestions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_sessionId)
  {
    objc_msgSend(v4, "setSessionId:");
    id v4 = v18;
  }
  if (self->_blendingUICacheUpdateUUID)
  {
    objc_msgSend(v18, "setBlendingUICacheUpdateUUID:");
    id v4 = v18;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v18, "setClientModelId:");
    id v4 = v18;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_clientModelCacheCreationDate;
    *((unsigned char *)v4 + 88) |= 1u;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v18, "setConsumerSubType:");
    id v4 = v18;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_sessionStartDate;
    *((unsigned char *)v4 + 88) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_sessionEndDate;
    *((unsigned char *)v4 + 88) |= 2u;
  }
  if ([(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self shownSuggestionsCount])
  {
    [v18 clearShownSuggestions];
    unint64_t v6 = [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self shownSuggestionsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self shownSuggestionsAtIndex:i];
        [v18 addShownSuggestions:v9];
      }
    }
  }
  if ([(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self engagedSuggestionsCount])
  {
    [v18 clearEngagedSuggestions];
    unint64_t v10 = [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self engagedSuggestionsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self engagedSuggestionsAtIndex:j];
        [v18 addEngagedSuggestions:v13];
      }
    }
  }
  if ([(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self rejectedSuggestionsCount])
  {
    [v18 clearRejectedSuggestions];
    unint64_t v14 = [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self rejectedSuggestionsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self rejectedSuggestionsAtIndex:k];
        [v18 addRejectedSuggestions:v17];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessionId copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  uint64_t v8 = [(NSString *)self->_blendingUICacheUpdateUUID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_clientModelId copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_clientModelCacheCreationDate;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_sessionStartDate;
    *(unsigned char *)(v5 + 88) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_sessionEndDate;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unint64_t v15 = self->_shownSuggestions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addShownSuggestions:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v17);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v21 = self->_engagedSuggestions;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addEngagedSuggestions:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v23);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v27 = self->_rejectedSuggestions;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * k), "copyWithZone:", a3, (void)v34);
        [(id)v5 addRejectedSuggestions:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v29);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:")) {
      goto LABEL_32;
    }
  }
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  if ((unint64_t)blendingUICacheUpdateUUID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](blendingUICacheUpdateUUID, "isEqual:")) {
      goto LABEL_32;
    }
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_32;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_clientModelCacheCreationDate != *((double *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_32;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
    {
LABEL_32:
      char v13 = 0;
      goto LABEL_33;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0 || self->_sessionStartDate != *((double *)v4 + 3)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_sessionEndDate != *((double *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_32;
  }
  shownSuggestions = self->_shownSuggestions;
  if ((unint64_t)shownSuggestions | *((void *)v4 + 10)
    && !-[NSMutableArray isEqual:](shownSuggestions, "isEqual:"))
  {
    goto LABEL_32;
  }
  engagedSuggestions = self->_engagedSuggestions;
  if ((unint64_t)engagedSuggestions | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](engagedSuggestions, "isEqual:")) {
      goto LABEL_32;
    }
  }
  rejectedSuggestions = self->_rejectedSuggestions;
  if ((unint64_t)rejectedSuggestions | *((void *)v4 + 8)) {
    char v13 = -[NSMutableArray isEqual:](rejectedSuggestions, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_33:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionId hash];
  NSUInteger v4 = [(NSString *)self->_blendingUICacheUpdateUUID hash];
  NSUInteger v5 = [(NSString *)self->_clientModelId hash];
  if (*(unsigned char *)&self->_has)
  {
    double clientModelCacheCreationDate = self->_clientModelCacheCreationDate;
    double v8 = -clientModelCacheCreationDate;
    if (clientModelCacheCreationDate >= 0.0) {
      double v8 = self->_clientModelCacheCreationDate;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_consumerSubType hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double sessionStartDate = self->_sessionStartDate;
    double v15 = -sessionStartDate;
    if (sessionStartDate >= 0.0) {
      double v15 = self->_sessionStartDate;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((has & 2) != 0)
  {
    double sessionEndDate = self->_sessionEndDate;
    double v20 = -sessionEndDate;
    if (sessionEndDate >= 0.0) {
      double v20 = self->_sessionEndDate;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  NSUInteger v23 = v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ v13 ^ v18;
  uint64_t v24 = [(NSMutableArray *)self->_shownSuggestions hash];
  uint64_t v25 = v24 ^ [(NSMutableArray *)self->_engagedSuggestions hash];
  return v23 ^ v25 ^ [(NSMutableArray *)self->_rejectedSuggestions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 9)) {
    -[ATXPBBiomeProactiveSuggestionUIFeedbackResult setSessionId:](self, "setSessionId:");
  }
  if (*((void *)v4 + 4)) {
    -[ATXPBBiomeProactiveSuggestionUIFeedbackResult setBlendingUICacheUpdateUUID:](self, "setBlendingUICacheUpdateUUID:");
  }
  if (*((void *)v4 + 5)) {
    -[ATXPBBiomeProactiveSuggestionUIFeedbackResult setClientModelId:](self, "setClientModelId:");
  }
  if (*((unsigned char *)v4 + 88))
  {
    self->_double clientModelCacheCreationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[ATXPBBiomeProactiveSuggestionUIFeedbackResult setConsumerSubType:](self, "setConsumerSubType:");
  }
  char v5 = *((unsigned char *)v4 + 88);
  if ((v5 & 4) != 0)
  {
    self->_double sessionStartDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 88);
  }
  if ((v5 & 2) != 0)
  {
    self->_double sessionEndDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v4 + 10);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self addShownSuggestions:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v4 + 7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(ATXPBBiomeProactiveSuggestionUIFeedbackResult *)self addEngagedSuggestions:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 8);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[ATXPBBiomeProactiveSuggestionUIFeedbackResult addRejectedSuggestions:](self, "addRejectedSuggestions:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)blendingUICacheUpdateUUID
{
  return self->_blendingUICacheUpdateUUID;
}

- (void)setBlendingUICacheUpdateUUID:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (double)clientModelCacheCreationDate
{
  return self->_clientModelCacheCreationDate;
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (double)sessionStartDate
{
  return self->_sessionStartDate;
}

- (double)sessionEndDate
{
  return self->_sessionEndDate;
}

- (NSMutableArray)shownSuggestions
{
  return self->_shownSuggestions;
}

- (void)setShownSuggestions:(id)a3
{
}

- (NSMutableArray)engagedSuggestions
{
  return self->_engagedSuggestions;
}

- (void)setEngagedSuggestions:(id)a3
{
}

- (NSMutableArray)rejectedSuggestions
{
  return self->_rejectedSuggestions;
}

- (void)setRejectedSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shownSuggestions, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_rejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_engagedSuggestions, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_blendingUICacheUpdateUUID, 0);
}

@end