@interface SIRINLUINTERNALSSUSSURequest
+ (Class)matchingSpansType;
+ (Class)salientEntitiesType;
- (BOOL)hasAsrId;
- (BOOL)hasLocale;
- (BOOL)hasNluRequestId;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)matchingSpans;
- (NSMutableArray)salientEntities;
- (NSString)locale;
- (NSString)utterance;
- (SIRINLUEXTERNALRequestID)nluRequestId;
- (SIRINLUEXTERNALUUID)asrId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)matchingSpansAtIndex:(unint64_t)a3;
- (id)salientEntitiesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchingSpansCount;
- (unint64_t)salientEntitiesCount;
- (void)addMatchingSpans:(id)a3;
- (void)addSalientEntities:(id)a3;
- (void)clearMatchingSpans;
- (void)clearSalientEntities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrId:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMatchingSpans:(id)a3;
- (void)setNluRequestId:(id)a3;
- (void)setSalientEntities:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSSUSSURequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setNluRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setSalientEntities:(id)a3
{
}

- (NSMutableArray)salientEntities
{
  return self->_salientEntities;
}

- (void)setMatchingSpans:(id)a3
{
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setAsrId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[SIRINLUINTERNALSSUSSURequest setUtterance:](self, "setUtterance:");
  }
  if (*((void *)v4 + 2)) {
    -[SIRINLUINTERNALSSUSSURequest setLocale:](self, "setLocale:");
  }
  asrId = self->_asrId;
  uint64_t v6 = *((void *)v4 + 1);
  if (asrId)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALSSUSSURequest setAsrId:](self, "setAsrId:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUINTERNALSSUSSURequest *)self addMatchingSpans:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = *((id *)v4 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SIRINLUINTERNALSSUSSURequest addSalientEntities:](self, "addSalientEntities:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  nluRequestId = self->_nluRequestId;
  uint64_t v18 = *((void *)v4 + 4);
  if (nluRequestId)
  {
    if (v18) {
      -[SIRINLUEXTERNALRequestID mergeFrom:](nluRequestId, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUINTERNALSSUSSURequest setNluRequestId:](self, "setNluRequestId:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_utterance hash];
  NSUInteger v4 = [(NSString *)self->_locale hash] ^ v3;
  unint64_t v5 = [(SIRINLUEXTERNALUUID *)self->_asrId hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_matchingSpans hash];
  uint64_t v7 = [(NSMutableArray *)self->_salientEntities hash];
  return v6 ^ v7 ^ [(SIRINLUEXTERNALRequestID *)self->_nluRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[6]))
     || -[NSString isEqual:](utterance, "isEqual:"))
    && ((locale = self->_locale, !((unint64_t)locale | v4[2]))
     || -[NSString isEqual:](locale, "isEqual:"))
    && ((asrId = self->_asrId, !((unint64_t)asrId | v4[1])) || -[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:"))
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[3]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    && ((salientEntities = self->_salientEntities, !((unint64_t)salientEntities | v4[5]))
     || -[NSMutableArray isEqual:](salientEntities, "isEqual:")))
  {
    nluRequestId = self->_nluRequestId;
    if ((unint64_t)nluRequestId | v4[4]) {
      char v11 = -[SIRINLUEXTERNALRequestID isEqual:](nluRequestId, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_utterance copyWithZone:a3];
  uint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  uint64_t v8 = [(NSString *)self->_locale copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(SIRINLUEXTERNALUUID *)self->_asrId copyWithZone:a3];
  char v11 = (void *)v5[1];
  v5[1] = v10;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = self->_matchingSpans;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addMatchingSpans:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v14);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v18 = self->_salientEntities;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v22), "copyWithZone:", a3, (void)v27);
        [v5 addSalientEntities:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  id v24 = [(SIRINLUEXTERNALRequestID *)self->_nluRequestId copyWithZone:a3];
  long long v25 = (void *)v5[4];
  v5[4] = v24;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_utterance) {
    objc_msgSend(v12, "setUtterance:");
  }
  if (self->_locale) {
    objc_msgSend(v12, "setLocale:");
  }
  if (self->_asrId) {
    objc_msgSend(v12, "setAsrId:");
  }
  if ([(SIRINLUINTERNALSSUSSURequest *)self matchingSpansCount])
  {
    [v12 clearMatchingSpans];
    unint64_t v4 = [(SIRINLUINTERNALSSUSSURequest *)self matchingSpansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUINTERNALSSUSSURequest *)self matchingSpansAtIndex:i];
        [v12 addMatchingSpans:v7];
      }
    }
  }
  if ([(SIRINLUINTERNALSSUSSURequest *)self salientEntitiesCount])
  {
    [v12 clearSalientEntities];
    unint64_t v8 = [(SIRINLUINTERNALSSUSSURequest *)self salientEntitiesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        char v11 = [(SIRINLUINTERNALSSUSSURequest *)self salientEntitiesAtIndex:j];
        [v12 addSalientEntities:v11];
      }
    }
  }
  if (self->_nluRequestId) {
    objc_msgSend(v12, "setNluRequestId:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_utterance) {
    PBDataWriterWriteStringField();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  if (self->_asrId) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_matchingSpans;
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
  id v10 = self->_salientEntities;
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

  if (self->_nluRequestId) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSSUSSURequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  locale = self->_locale;
  if (locale) {
    [v4 setObject:locale forKey:@"locale"];
  }
  asrId = self->_asrId;
  if (asrId)
  {
    uint64_t v8 = [(SIRINLUEXTERNALUUID *)asrId dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"asr_id"];
  }
  if ([(NSMutableArray *)self->_matchingSpans count])
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = self->_matchingSpans;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"matching_spans"];
  }
  if ([(NSMutableArray *)self->_salientEntities count])
  {
    long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_salientEntities, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v17 = self->_salientEntities;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (void)v26);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    [v4 setObject:v16 forKey:@"salient_entities"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    id v24 = [(SIRINLUEXTERNALRequestID *)nluRequestId dictionaryRepresentation];
    [v4 setObject:v24 forKey:@"nlu_request_id"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSSUSSURequest;
  id v4 = [(SIRINLUINTERNALSSUSSURequest *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALSSUSSURequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (id)salientEntitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_salientEntities objectAtIndex:a3];
}

- (unint64_t)salientEntitiesCount
{
  return [(NSMutableArray *)self->_salientEntities count];
}

- (void)addSalientEntities:(id)a3
{
  id v4 = a3;
  salientEntities = self->_salientEntities;
  id v8 = v4;
  if (!salientEntities)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_salientEntities;
    self->_salientEntities = v6;

    id v4 = v8;
    salientEntities = self->_salientEntities;
  }
  [(NSMutableArray *)salientEntities addObject:v4];
}

- (void)clearSalientEntities
{
}

- (id)matchingSpansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_matchingSpans objectAtIndex:a3];
}

- (unint64_t)matchingSpansCount
{
  return [(NSMutableArray *)self->_matchingSpans count];
}

- (void)addMatchingSpans:(id)a3
{
  id v4 = a3;
  matchingSpans = self->_matchingSpans;
  id v8 = v4;
  if (!matchingSpans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_matchingSpans;
    self->_matchingSpans = v6;

    id v4 = v8;
    matchingSpans = self->_matchingSpans;
  }
  [(NSMutableArray *)matchingSpans addObject:v4];
}

- (void)clearMatchingSpans
{
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

+ (Class)salientEntitiesType
{
  return (Class)objc_opt_class();
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end