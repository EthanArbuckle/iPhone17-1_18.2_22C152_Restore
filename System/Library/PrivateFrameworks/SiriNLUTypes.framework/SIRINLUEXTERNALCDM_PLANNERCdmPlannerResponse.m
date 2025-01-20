@interface SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse
+ (Class)transcriptEventsType;
- (BOOL)hasGeneratedTranscriptEventsJson;
- (BOOL)hasPlanText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)generatedTranscriptEventsJson;
- (NSMutableArray)transcriptEvents;
- (NSString)planText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)transcriptEventsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)transcriptEventsCount;
- (void)addTranscriptEvents:(id)a3;
- (void)clearTranscriptEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGeneratedTranscriptEventsJson:(id)a3;
- (void)setPlanText:(id)a3;
- (void)setTranscriptEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptEvents, 0);
  objc_storeStrong((id *)&self->_planText, 0);
  objc_storeStrong((id *)&self->_generatedTranscriptEventsJson, 0);
}

- (void)setTranscriptEvents:(id)a3
{
}

- (NSMutableArray)transcriptEvents
{
  return self->_transcriptEvents;
}

- (void)setGeneratedTranscriptEventsJson:(id)a3
{
}

- (NSData)generatedTranscriptEventsJson
{
  return self->_generatedTranscriptEventsJson;
}

- (void)setPlanText:(id)a3
{
}

- (NSString)planText
{
  return self->_planText;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse setPlanText:](self, "setPlanText:");
  }
  if (*((void *)v4 + 1)) {
    -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse setGeneratedTranscriptEventsJson:](self, "setGeneratedTranscriptEventsJson:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse addTranscriptEvents:](self, "addTranscriptEvents:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_planText hash];
  uint64_t v4 = [(NSData *)self->_generatedTranscriptEventsJson hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_transcriptEvents hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((planText = self->_planText, !((unint64_t)planText | v4[2]))
     || -[NSString isEqual:](planText, "isEqual:"))
    && ((generatedTranscriptEventsJson = self->_generatedTranscriptEventsJson,
         !((unint64_t)generatedTranscriptEventsJson | v4[1]))
     || -[NSData isEqual:](generatedTranscriptEventsJson, "isEqual:")))
  {
    transcriptEvents = self->_transcriptEvents;
    if ((unint64_t)transcriptEvents | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](transcriptEvents, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_planText copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_generatedTranscriptEventsJson copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_transcriptEvents;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addTranscriptEvents:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_planText) {
    objc_msgSend(v8, "setPlanText:");
  }
  if (self->_generatedTranscriptEventsJson) {
    objc_msgSend(v8, "setGeneratedTranscriptEventsJson:");
  }
  if ([(SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse *)self transcriptEventsCount])
  {
    [v8 clearTranscriptEvents];
    unint64_t v4 = [(SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse *)self transcriptEventsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse *)self transcriptEventsAtIndex:i];
        [v8 addTranscriptEvents:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_planText) {
    PBDataWriterWriteStringField();
  }
  if (self->_generatedTranscriptEventsJson) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_transcriptEvents;
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
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponseReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  planText = self->_planText;
  if (planText) {
    [v3 setObject:planText forKey:@"plan_text"];
  }
  generatedTranscriptEventsJson = self->_generatedTranscriptEventsJson;
  if (generatedTranscriptEventsJson) {
    [v4 setObject:generatedTranscriptEventsJson forKey:@"generated_transcript_events_json"];
  }
  if ([(NSMutableArray *)self->_transcriptEvents count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_transcriptEvents, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = self->_transcriptEvents;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"transcript_events"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse;
  id v4 = [(SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)transcriptEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transcriptEvents objectAtIndex:a3];
}

- (unint64_t)transcriptEventsCount
{
  return [(NSMutableArray *)self->_transcriptEvents count];
}

- (void)addTranscriptEvents:(id)a3
{
  id v4 = a3;
  transcriptEvents = self->_transcriptEvents;
  id v8 = v4;
  if (!transcriptEvents)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_transcriptEvents;
    self->_transcriptEvents = v6;

    id v4 = v8;
    transcriptEvents = self->_transcriptEvents;
  }
  [(NSMutableArray *)transcriptEvents addObject:v4];
}

- (void)clearTranscriptEvents
{
}

- (BOOL)hasGeneratedTranscriptEventsJson
{
  return self->_generatedTranscriptEventsJson != 0;
}

- (BOOL)hasPlanText
{
  return self->_planText != 0;
}

+ (Class)transcriptEventsType
{
  return (Class)objc_opt_class();
}

@end