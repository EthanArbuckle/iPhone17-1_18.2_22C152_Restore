@interface DUSchemaDUEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasContent;
- (BOOL)hasMetadata;
- (BOOL)hasSearchSessionRecord;
- (BOOL)hasSpeechAudioRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DUSchemaDUContent)content;
- (DUSchemaDUEvent)initWithDictionary:(id)a3;
- (DUSchemaDUEvent)initWithJSON:(id)a3;
- (DUSchemaDUEventMetadata)metadata;
- (DUSchemaDUSearchSessionRecord)searchSessionRecord;
- (DUSchemaDUSpeechAudioRecord)speechAudioRecord;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteContent;
- (void)deleteMetadata;
- (void)deleteSearchSessionRecord;
- (void)deleteSpeechAudioRecord;
- (void)setContent:(id)a3;
- (void)setHasContent:(BOOL)a3;
- (void)setHasMetadata:(BOOL)a3;
- (void)setHasSearchSessionRecord:(BOOL)a3;
- (void)setHasSpeechAudioRecord:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setSearchSessionRecord:(id)a3;
- (void)setSpeechAudioRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DUSchemaDUEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DUSchemaDUEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(DUSchemaDUEvent *)self deleteContent];
  }
  if ([v4 isConditionSet:4]) {
    [(DUSchemaDUEvent *)self deleteContent];
  }
  if ([v4 isConditionSet:5]) {
    [(DUSchemaDUEvent *)self deleteContent];
  }
  if ([v4 isConditionSet:6]) {
    [(DUSchemaDUEvent *)self deleteContent];
  }
  if ([v4 isConditionSet:7]) {
    [(DUSchemaDUEvent *)self deleteContent];
  }
  v6 = [(DUSchemaDUEvent *)self metadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DUSchemaDUEvent *)self deleteMetadata];
  }
  v9 = [(DUSchemaDUEvent *)self content];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DUSchemaDUEvent *)self deleteContent];
  }
  v12 = [(DUSchemaDUEvent *)self speechAudioRecord];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(DUSchemaDUEvent *)self deleteSpeechAudioRecord];
  }
  v15 = [(DUSchemaDUEvent *)self searchSessionRecord];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(DUSchemaDUEvent *)self deleteSearchSessionRecord];
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
  unint64_t v3 = [(DUSchemaDUEvent *)self whichEvent_Type];
  if (v3 == 101)
  {
    id v4 = &OBJC_IVAR___DUSchemaDUEvent__speechAudioRecord;
    goto LABEL_5;
  }
  if (v3 == 102)
  {
    id v4 = &OBJC_IVAR___DUSchemaDUEvent__searchSessionRecord;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  unint64_t v3 = @"searchSessionRecord";
  if (a3 != 102) {
    unint64_t v3 = 0;
  }
  if (a3 == 101) {
    return @"speechAudioRecord";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSessionRecord, 0);
  objc_storeStrong((id *)&self->_speechAudioRecord, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)setHasSearchSessionRecord:(BOOL)a3
{
  self->_hasSearchSessionRecord = a3;
}

- (BOOL)hasSearchSessionRecord
{
  return self->_hasSearchSessionRecord;
}

- (void)setHasSpeechAudioRecord:(BOOL)a3
{
  self->_hasSpeechAudioRecord = a3;
}

- (BOOL)hasSpeechAudioRecord
{
  return self->_hasSpeechAudioRecord;
}

- (void)setHasContent:(BOOL)a3
{
  self->_hasContent = a3;
}

- (void)setHasMetadata:(BOOL)a3
{
  self->_hasMetadata = a3;
}

- (void)setContent:(id)a3
{
}

- (DUSchemaDUContent)content
{
  return self->_content;
}

- (void)setMetadata:(id)a3
{
}

- (DUSchemaDUEventMetadata)metadata
{
  return self->_metadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (DUSchemaDUEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DUSchemaDUEvent;
  id v5 = [(DUSchemaDUEvent *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[DUSchemaDUEventMetadata alloc] initWithDictionary:v6];
      [(DUSchemaDUEvent *)v5 setMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[DUSchemaDUContent alloc] initWithDictionary:v8];
      [(DUSchemaDUEvent *)v5 setContent:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"speechAudioRecord"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[DUSchemaDUSpeechAudioRecord alloc] initWithDictionary:v10];
      [(DUSchemaDUEvent *)v5 setSpeechAudioRecord:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"searchSessionRecord"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[DUSchemaDUSearchSessionRecord alloc] initWithDictionary:v12];
      [(DUSchemaDUEvent *)v5 setSearchSessionRecord:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (DUSchemaDUEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(DUSchemaDUEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DUSchemaDUEvent *)self dictionaryRepresentation];
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
  if (self->_content)
  {
    id v4 = [(DUSchemaDUEvent *)self content];
    id v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"content"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"content"];
    }
  }
  if (self->_metadata)
  {
    uint64_t v7 = [(DUSchemaDUEvent *)self metadata];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"metadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"metadata"];
    }
  }
  if (self->_searchSessionRecord)
  {
    v10 = [(DUSchemaDUEvent *)self searchSessionRecord];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"searchSessionRecord"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"searchSessionRecord"];
    }
  }
  if (self->_speechAudioRecord)
  {
    v13 = [(DUSchemaDUEvent *)self speechAudioRecord];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"speechAudioRecord"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"speechAudioRecord"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DUSchemaDUEventMetadata *)self->_metadata hash];
  unint64_t v4 = [(DUSchemaDUContent *)self->_content hash] ^ v3;
  unint64_t v5 = [(DUSchemaDUSpeechAudioRecord *)self->_speechAudioRecord hash];
  return v4 ^ v5 ^ [(DUSchemaDUSearchSessionRecord *)self->_searchSessionRecord hash];
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
  v6 = [(DUSchemaDUEvent *)self metadata];
  uint64_t v7 = [v4 metadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(DUSchemaDUEvent *)self metadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DUSchemaDUEvent *)self metadata];
    int v11 = [v4 metadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(DUSchemaDUEvent *)self content];
  uint64_t v7 = [v4 content];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(DUSchemaDUEvent *)self content];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(DUSchemaDUEvent *)self content];
    objc_super v16 = [v4 content];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(DUSchemaDUEvent *)self speechAudioRecord];
  uint64_t v7 = [v4 speechAudioRecord];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(DUSchemaDUEvent *)self speechAudioRecord];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(DUSchemaDUEvent *)self speechAudioRecord];
    v21 = [v4 speechAudioRecord];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(DUSchemaDUEvent *)self searchSessionRecord];
  uint64_t v7 = [v4 searchSessionRecord];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(DUSchemaDUEvent *)self searchSessionRecord];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(DUSchemaDUEvent *)self searchSessionRecord];
    v26 = [v4 searchSessionRecord];
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
  id v4 = [(DUSchemaDUEvent *)self metadata];

  if (v4)
  {
    unint64_t v5 = [(DUSchemaDUEvent *)self metadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(DUSchemaDUEvent *)self content];

  if (v6)
  {
    uint64_t v7 = [(DUSchemaDUEvent *)self content];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(DUSchemaDUEvent *)self speechAudioRecord];

  if (v8)
  {
    v9 = [(DUSchemaDUEvent *)self speechAudioRecord];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(DUSchemaDUEvent *)self searchSessionRecord];

  if (v10)
  {
    int v11 = [(DUSchemaDUEvent *)self searchSessionRecord];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DUSchemaDUEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSearchSessionRecord
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_searchSessionRecord = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DUSchemaDUSearchSessionRecord)searchSessionRecord
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_searchSessionRecord;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSearchSessionRecord:(id)a3
{
  id v4 = (DUSchemaDUSearchSessionRecord *)a3;
  speechAudioRecord = self->_speechAudioRecord;
  self->_speechAudioRecord = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  searchSessionRecord = self->_searchSessionRecord;
  self->_searchSessionRecord = v4;
}

- (void)deleteSpeechAudioRecord
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speechAudioRecord = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DUSchemaDUSpeechAudioRecord)speechAudioRecord
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_speechAudioRecord;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeechAudioRecord:(id)a3
{
  id v4 = (DUSchemaDUSpeechAudioRecord *)a3;
  searchSessionRecord = self->_searchSessionRecord;
  self->_searchSessionRecord = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  speechAudioRecord = self->_speechAudioRecord;
  self->_speechAudioRecord = v4;
}

- (void)deleteContent
{
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)deleteMetadata
{
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(DUSchemaDUEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.dataupload.DUEvent";
  if (v2 == 102) {
    unint64_t v3 = @"com.apple.aiml.dataupload.DUEvent.DUSearchSessionRecord";
  }
  if (v2 == 101) {
    return @"com.apple.aiml.dataupload.DUEvent.DUSpeechAudioRecord";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 21;
}

@end