@interface READSchemaREADClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasPlaybackSessionContext;
- (BOOL)hasReadThisRequestContext;
- (BOOL)hasReadsThisRequestPreprocessingContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (READSchemaREADClientEvent)initWithDictionary:(id)a3;
- (READSchemaREADClientEvent)initWithJSON:(id)a3;
- (READSchemaREADClientEventMetadata)eventMetadata;
- (READSchemaREADPlaybackSessionContext)playbackSessionContext;
- (READSchemaREADRequestContext)readThisRequestContext;
- (READSchemaREADRequestPreprocessingContext)readsThisRequestPreprocessingContext;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deletePlaybackSessionContext;
- (void)deleteReadThisRequestContext;
- (void)deleteReadsThisRequestPreprocessingContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasPlaybackSessionContext:(BOOL)a3;
- (void)setHasReadThisRequestContext:(BOOL)a3;
- (void)setHasReadsThisRequestPreprocessingContext:(BOOL)a3;
- (void)setPlaybackSessionContext:(id)a3;
- (void)setReadThisRequestContext:(id)a3;
- (void)setReadsThisRequestPreprocessingContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation READSchemaREADClientEvent

- (int)componentName
{
  v2 = [(READSchemaREADClientEvent *)self eventMetadata];
  v3 = [v2 readId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 40;
      }
      else {
        LODWORD(v4) = 0;
      }
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

- (id)getComponentId
{
  v2 = [(READSchemaREADClientEvent *)self eventMetadata];
  v3 = [v2 readId];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 value];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 length];

  if (v6) {
    id v4 = v3;
  }
  else {
LABEL_5:
  }
    id v4 = 0;
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)READSchemaREADClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(READSchemaREADClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(READSchemaREADClientEvent *)self deleteEventMetadata];
  }
  v9 = [(READSchemaREADClientEvent *)self readThisRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(READSchemaREADClientEvent *)self deleteReadThisRequestContext];
  }
  v12 = [(READSchemaREADClientEvent *)self readsThisRequestPreprocessingContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(READSchemaREADClientEvent *)self deleteReadsThisRequestPreprocessingContext];
  }
  v15 = [(READSchemaREADClientEvent *)self playbackSessionContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(READSchemaREADClientEvent *)self deletePlaybackSessionContext];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(READSchemaREADClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABC48[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2) {
    return 0;
  }
  else {
    return off_1E5EABC60[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSessionContext, 0);
  objc_storeStrong((id *)&self->_readsThisRequestPreprocessingContext, 0);
  objc_storeStrong((id *)&self->_readThisRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasPlaybackSessionContext:(BOOL)a3
{
  self->_hasPlaybackSessionContext = a3;
}

- (BOOL)hasPlaybackSessionContext
{
  return self->_hasPlaybackSessionContext;
}

- (void)setHasReadsThisRequestPreprocessingContext:(BOOL)a3
{
  self->_hasReadsThisRequestPreprocessingContext = a3;
}

- (BOOL)hasReadsThisRequestPreprocessingContext
{
  return self->_hasReadsThisRequestPreprocessingContext;
}

- (void)setHasReadThisRequestContext:(BOOL)a3
{
  self->_hasReadThisRequestContext = a3;
}

- (BOOL)hasReadThisRequestContext
{
  return self->_hasReadThisRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (READSchemaREADClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (READSchemaREADClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)READSchemaREADClientEvent;
  v5 = [(READSchemaREADClientEvent *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[READSchemaREADClientEventMetadata alloc] initWithDictionary:v6];
      [(READSchemaREADClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"readThisRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[READSchemaREADRequestContext alloc] initWithDictionary:v8];
      [(READSchemaREADClientEvent *)v5 setReadThisRequestContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"readsThisRequestPreprocessingContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[READSchemaREADRequestPreprocessingContext alloc] initWithDictionary:v10];
      [(READSchemaREADClientEvent *)v5 setReadsThisRequestPreprocessingContext:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"playbackSessionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[READSchemaREADPlaybackSessionContext alloc] initWithDictionary:v12];
      [(READSchemaREADClientEvent *)v5 setPlaybackSessionContext:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (READSchemaREADClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(READSchemaREADClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(READSchemaREADClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_eventMetadata)
  {
    id v4 = [(READSchemaREADClientEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_playbackSessionContext)
  {
    uint64_t v7 = [(READSchemaREADClientEvent *)self playbackSessionContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"playbackSessionContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"playbackSessionContext"];
    }
  }
  if (self->_readThisRequestContext)
  {
    v10 = [(READSchemaREADClientEvent *)self readThisRequestContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"readThisRequestContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"readThisRequestContext"];
    }
  }
  if (self->_readsThisRequestPreprocessingContext)
  {
    v13 = [(READSchemaREADClientEvent *)self readsThisRequestPreprocessingContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"readsThisRequestPreprocessingContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"readsThisRequestPreprocessingContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(READSchemaREADClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(READSchemaREADRequestContext *)self->_readThisRequestContext hash] ^ v3;
  unint64_t v5 = [(READSchemaREADRequestPreprocessingContext *)self->_readsThisRequestPreprocessingContext hash];
  return v4 ^ v5 ^ [(READSchemaREADPlaybackSessionContext *)self->_playbackSessionContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_23;
  }
  uint64_t v6 = [(READSchemaREADClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(READSchemaREADClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(READSchemaREADClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(READSchemaREADClientEvent *)self readThisRequestContext];
  uint64_t v7 = [v4 readThisRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(READSchemaREADClientEvent *)self readThisRequestContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(READSchemaREADClientEvent *)self readThisRequestContext];
    objc_super v16 = [v4 readThisRequestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(READSchemaREADClientEvent *)self readsThisRequestPreprocessingContext];
  uint64_t v7 = [v4 readsThisRequestPreprocessingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(READSchemaREADClientEvent *)self readsThisRequestPreprocessingContext];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(READSchemaREADClientEvent *)self readsThisRequestPreprocessingContext];
    v21 = [v4 readsThisRequestPreprocessingContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(READSchemaREADClientEvent *)self playbackSessionContext];
  uint64_t v7 = [v4 playbackSessionContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(READSchemaREADClientEvent *)self playbackSessionContext];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(READSchemaREADClientEvent *)self playbackSessionContext];
    v26 = [v4 playbackSessionContext];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(READSchemaREADClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(READSchemaREADClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(READSchemaREADClientEvent *)self readThisRequestContext];

  if (v6)
  {
    uint64_t v7 = [(READSchemaREADClientEvent *)self readThisRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(READSchemaREADClientEvent *)self readsThisRequestPreprocessingContext];

  if (v8)
  {
    v9 = [(READSchemaREADClientEvent *)self readsThisRequestPreprocessingContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(READSchemaREADClientEvent *)self playbackSessionContext];

  if (v10)
  {
    int v11 = [(READSchemaREADClientEvent *)self playbackSessionContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return READSchemaREADClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deletePlaybackSessionContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_playbackSessionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (READSchemaREADPlaybackSessionContext)playbackSessionContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_playbackSessionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPlaybackSessionContext:(id)a3
{
  id v4 = (READSchemaREADPlaybackSessionContext *)a3;
  readThisRequestContext = self->_readThisRequestContext;
  self->_readThisRequestContext = 0;

  readsThisRequestPreprocessingContext = self->_readsThisRequestPreprocessingContext;
  self->_readsThisRequestPreprocessingContext = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  playbackSessionContext = self->_playbackSessionContext;
  self->_playbackSessionContext = v4;
}

- (void)deleteReadsThisRequestPreprocessingContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_readsThisRequestPreprocessingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (READSchemaREADRequestPreprocessingContext)readsThisRequestPreprocessingContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_readsThisRequestPreprocessingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setReadsThisRequestPreprocessingContext:(id)a3
{
  id v4 = (READSchemaREADRequestPreprocessingContext *)a3;
  readThisRequestContext = self->_readThisRequestContext;
  self->_readThisRequestContext = 0;

  playbackSessionContext = self->_playbackSessionContext;
  self->_playbackSessionContext = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  readsThisRequestPreprocessingContext = self->_readsThisRequestPreprocessingContext;
  self->_readsThisRequestPreprocessingContext = v4;
}

- (void)deleteReadThisRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_readThisRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (READSchemaREADRequestContext)readThisRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_readThisRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setReadThisRequestContext:(id)a3
{
  id v4 = (READSchemaREADRequestContext *)a3;
  readsThisRequestPreprocessingContext = self->_readsThisRequestPreprocessingContext;
  self->_readsThisRequestPreprocessingContext = 0;

  playbackSessionContext = self->_playbackSessionContext;
  self->_playbackSessionContext = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  readThisRequestContext = self->_readThisRequestContext;
  self->_readThisRequestContext = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(READSchemaREADClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 2) {
    return @"com.apple.aiml.siri.read.READClientEvent";
  }
  else {
    return off_1E5EBBC48[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 75;
}

@end