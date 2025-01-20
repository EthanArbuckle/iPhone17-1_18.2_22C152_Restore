@interface LTSchemaMTClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasAsrSpeechTranslationEvent;
- (BOOL)hasBatchTranslationEvent;
- (BOOL)hasDisambiguationSpeechTranslationEvent;
- (BOOL)hasLidSpeechTranslationEvent;
- (BOOL)hasMtSpeechTranslationEvent;
- (BOOL)hasSafariFeedbackEvent;
- (BOOL)hasSpeechTranslationEvent;
- (BOOL)hasTtsspeechTranslationEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaASRSpeechTranslationEvent)asrSpeechTranslationEvent;
- (LTSchemaBatchTranslationEvent)batchTranslationEvent;
- (LTSchemaDisambiguationSpeechTranslationEvent)disambiguationSpeechTranslationEvent;
- (LTSchemaLIDSpeechTranslationEvent)lidSpeechTranslationEvent;
- (LTSchemaMTClientEvent)initWithDictionary:(id)a3;
- (LTSchemaMTClientEvent)initWithJSON:(id)a3;
- (LTSchemaMTSpeechTranslationEvent)mtSpeechTranslationEvent;
- (LTSchemaSafariFeedbackEvent)safariFeedbackEvent;
- (LTSchemaSpeechTranslationEvent)speechTranslationEvent;
- (LTSchemaTTSSpeechTranslationEvent)ttsspeechTranslationEvent;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAsrSpeechTranslationEvent;
- (void)deleteBatchTranslationEvent;
- (void)deleteDisambiguationSpeechTranslationEvent;
- (void)deleteLidSpeechTranslationEvent;
- (void)deleteMtSpeechTranslationEvent;
- (void)deleteSafariFeedbackEvent;
- (void)deleteSpeechTranslationEvent;
- (void)deleteTtsspeechTranslationEvent;
- (void)setAsrSpeechTranslationEvent:(id)a3;
- (void)setBatchTranslationEvent:(id)a3;
- (void)setDisambiguationSpeechTranslationEvent:(id)a3;
- (void)setHasAsrSpeechTranslationEvent:(BOOL)a3;
- (void)setHasBatchTranslationEvent:(BOOL)a3;
- (void)setHasDisambiguationSpeechTranslationEvent:(BOOL)a3;
- (void)setHasLidSpeechTranslationEvent:(BOOL)a3;
- (void)setHasMtSpeechTranslationEvent:(BOOL)a3;
- (void)setHasSafariFeedbackEvent:(BOOL)a3;
- (void)setHasSpeechTranslationEvent:(BOOL)a3;
- (void)setHasTtsspeechTranslationEvent:(BOOL)a3;
- (void)setLidSpeechTranslationEvent:(id)a3;
- (void)setMtSpeechTranslationEvent:(id)a3;
- (void)setSafariFeedbackEvent:(id)a3;
- (void)setSpeechTranslationEvent:(id)a3;
- (void)setTtsspeechTranslationEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaMTClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)LTSchemaMTClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v31 applySensitiveConditionsPolicy:v4];
  v6 = [(LTSchemaMTClientEvent *)self safariFeedbackEvent];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(LTSchemaMTClientEvent *)self deleteSafariFeedbackEvent];
  }
  v9 = [(LTSchemaMTClientEvent *)self batchTranslationEvent];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(LTSchemaMTClientEvent *)self deleteBatchTranslationEvent];
  }
  v12 = [(LTSchemaMTClientEvent *)self speechTranslationEvent];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(LTSchemaMTClientEvent *)self deleteSpeechTranslationEvent];
  }
  v15 = [(LTSchemaMTClientEvent *)self lidSpeechTranslationEvent];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(LTSchemaMTClientEvent *)self deleteLidSpeechTranslationEvent];
  }
  v18 = [(LTSchemaMTClientEvent *)self disambiguationSpeechTranslationEvent];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(LTSchemaMTClientEvent *)self deleteDisambiguationSpeechTranslationEvent];
  }
  v21 = [(LTSchemaMTClientEvent *)self asrSpeechTranslationEvent];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(LTSchemaMTClientEvent *)self deleteAsrSpeechTranslationEvent];
  }
  v24 = [(LTSchemaMTClientEvent *)self mtSpeechTranslationEvent];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(LTSchemaMTClientEvent *)self deleteMtSpeechTranslationEvent];
  }
  v27 = [(LTSchemaMTClientEvent *)self ttsspeechTranslationEvent];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(LTSchemaMTClientEvent *)self deleteTtsspeechTranslationEvent];
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
  unint64_t v3 = [(LTSchemaMTClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 7) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAAE78[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 7) {
    return 0;
  }
  else {
    return off_1E5EAAEB8[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsspeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_mtSpeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_asrSpeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_disambiguationSpeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_lidSpeechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_speechTranslationEvent, 0);
  objc_storeStrong((id *)&self->_batchTranslationEvent, 0);
  objc_storeStrong((id *)&self->_safariFeedbackEvent, 0);
}

- (void)setHasTtsspeechTranslationEvent:(BOOL)a3
{
  self->_hasTtsspeechTranslationEvent = a3;
}

- (BOOL)hasTtsspeechTranslationEvent
{
  return self->_hasTtsspeechTranslationEvent;
}

- (void)setHasMtSpeechTranslationEvent:(BOOL)a3
{
  self->_hasMtSpeechTranslationEvent = a3;
}

- (BOOL)hasMtSpeechTranslationEvent
{
  return self->_hasMtSpeechTranslationEvent;
}

- (void)setHasAsrSpeechTranslationEvent:(BOOL)a3
{
  self->_hasAsrSpeechTranslationEvent = a3;
}

- (BOOL)hasAsrSpeechTranslationEvent
{
  return self->_hasAsrSpeechTranslationEvent;
}

- (void)setHasDisambiguationSpeechTranslationEvent:(BOOL)a3
{
  self->_hasDisambiguationSpeechTranslationEvent = a3;
}

- (BOOL)hasDisambiguationSpeechTranslationEvent
{
  return self->_hasDisambiguationSpeechTranslationEvent;
}

- (void)setHasLidSpeechTranslationEvent:(BOOL)a3
{
  self->_hasLidSpeechTranslationEvent = a3;
}

- (BOOL)hasLidSpeechTranslationEvent
{
  return self->_hasLidSpeechTranslationEvent;
}

- (void)setHasSpeechTranslationEvent:(BOOL)a3
{
  self->_hasSpeechTranslationEvent = a3;
}

- (BOOL)hasSpeechTranslationEvent
{
  return self->_hasSpeechTranslationEvent;
}

- (void)setHasBatchTranslationEvent:(BOOL)a3
{
  self->_hasBatchTranslationEvent = a3;
}

- (BOOL)hasBatchTranslationEvent
{
  return self->_hasBatchTranslationEvent;
}

- (void)setHasSafariFeedbackEvent:(BOOL)a3
{
  self->_hasSafariFeedbackEvent = a3;
}

- (BOOL)hasSafariFeedbackEvent
{
  return self->_hasSafariFeedbackEvent;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (LTSchemaMTClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)LTSchemaMTClientEvent;
  v5 = [(LTSchemaMTClientEvent *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"safariFeedbackEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[LTSchemaSafariFeedbackEvent alloc] initWithDictionary:v6];
      [(LTSchemaMTClientEvent *)v5 setSafariFeedbackEvent:v7];
    }
    v24 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"batchTranslationEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[LTSchemaBatchTranslationEvent alloc] initWithDictionary:v8];
      [(LTSchemaMTClientEvent *)v5 setBatchTranslationEvent:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"speechTranslationEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[LTSchemaSpeechTranslationEvent alloc] initWithDictionary:v10];
      [(LTSchemaMTClientEvent *)v5 setSpeechTranslationEvent:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"lidSpeechTranslationEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[LTSchemaLIDSpeechTranslationEvent alloc] initWithDictionary:v12];
      [(LTSchemaMTClientEvent *)v5 setLidSpeechTranslationEvent:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"disambiguationSpeechTranslationEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[LTSchemaDisambiguationSpeechTranslationEvent alloc] initWithDictionary:v14];
      [(LTSchemaMTClientEvent *)v5 setDisambiguationSpeechTranslationEvent:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"asrSpeechTranslationEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[LTSchemaASRSpeechTranslationEvent alloc] initWithDictionary:v16];
      [(LTSchemaMTClientEvent *)v5 setAsrSpeechTranslationEvent:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"mtSpeechTranslationEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[LTSchemaMTSpeechTranslationEvent alloc] initWithDictionary:v18];
      [(LTSchemaMTClientEvent *)v5 setMtSpeechTranslationEvent:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"ttsspeechTranslationEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[LTSchemaTTSSpeechTranslationEvent alloc] initWithDictionary:v20];
      [(LTSchemaMTClientEvent *)v5 setTtsspeechTranslationEvent:v21];
    }
    v22 = v5;
  }
  return v5;
}

- (LTSchemaMTClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaMTClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaMTClientEvent *)self dictionaryRepresentation];
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
  if (self->_asrSpeechTranslationEvent)
  {
    id v4 = [(LTSchemaMTClientEvent *)self asrSpeechTranslationEvent];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asrSpeechTranslationEvent"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asrSpeechTranslationEvent"];
    }
  }
  if (self->_batchTranslationEvent)
  {
    uint64_t v7 = [(LTSchemaMTClientEvent *)self batchTranslationEvent];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"batchTranslationEvent"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"batchTranslationEvent"];
    }
  }
  if (self->_disambiguationSpeechTranslationEvent)
  {
    v10 = [(LTSchemaMTClientEvent *)self disambiguationSpeechTranslationEvent];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"disambiguationSpeechTranslationEvent"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"disambiguationSpeechTranslationEvent"];
    }
  }
  if (self->_lidSpeechTranslationEvent)
  {
    v13 = [(LTSchemaMTClientEvent *)self lidSpeechTranslationEvent];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"lidSpeechTranslationEvent"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"lidSpeechTranslationEvent"];
    }
  }
  if (self->_mtSpeechTranslationEvent)
  {
    v16 = [(LTSchemaMTClientEvent *)self mtSpeechTranslationEvent];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"mtSpeechTranslationEvent"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"mtSpeechTranslationEvent"];
    }
  }
  if (self->_safariFeedbackEvent)
  {
    v19 = [(LTSchemaMTClientEvent *)self safariFeedbackEvent];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"safariFeedbackEvent"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"safariFeedbackEvent"];
    }
  }
  if (self->_speechTranslationEvent)
  {
    v22 = [(LTSchemaMTClientEvent *)self speechTranslationEvent];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"speechTranslationEvent"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"speechTranslationEvent"];
    }
  }
  if (self->_ttsspeechTranslationEvent)
  {
    objc_super v25 = [(LTSchemaMTClientEvent *)self ttsspeechTranslationEvent];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"ttsspeechTranslationEvent"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"ttsspeechTranslationEvent"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(LTSchemaSafariFeedbackEvent *)self->_safariFeedbackEvent hash];
  unint64_t v4 = [(LTSchemaBatchTranslationEvent *)self->_batchTranslationEvent hash] ^ v3;
  unint64_t v5 = [(LTSchemaSpeechTranslationEvent *)self->_speechTranslationEvent hash];
  unint64_t v6 = v4 ^ v5 ^ [(LTSchemaLIDSpeechTranslationEvent *)self->_lidSpeechTranslationEvent hash];
  unint64_t v7 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self->_disambiguationSpeechTranslationEvent hash];
  unint64_t v8 = v7 ^ [(LTSchemaASRSpeechTranslationEvent *)self->_asrSpeechTranslationEvent hash];
  unint64_t v9 = v6 ^ v8 ^ [(LTSchemaMTSpeechTranslationEvent *)self->_mtSpeechTranslationEvent hash];
  return v9 ^ [(LTSchemaTTSSpeechTranslationEvent *)self->_ttsspeechTranslationEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_43;
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self safariFeedbackEvent];
  unint64_t v7 = [v4 safariFeedbackEvent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v8 = [(LTSchemaMTClientEvent *)self safariFeedbackEvent];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    v10 = [(LTSchemaMTClientEvent *)self safariFeedbackEvent];
    int v11 = [v4 safariFeedbackEvent];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self batchTranslationEvent];
  unint64_t v7 = [v4 batchTranslationEvent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v13 = [(LTSchemaMTClientEvent *)self batchTranslationEvent];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(LTSchemaMTClientEvent *)self batchTranslationEvent];
    v16 = [v4 batchTranslationEvent];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self speechTranslationEvent];
  unint64_t v7 = [v4 speechTranslationEvent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v18 = [(LTSchemaMTClientEvent *)self speechTranslationEvent];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(LTSchemaMTClientEvent *)self speechTranslationEvent];
    v21 = [v4 speechTranslationEvent];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self lidSpeechTranslationEvent];
  unint64_t v7 = [v4 lidSpeechTranslationEvent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v23 = [(LTSchemaMTClientEvent *)self lidSpeechTranslationEvent];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(LTSchemaMTClientEvent *)self lidSpeechTranslationEvent];
    int v26 = [v4 lidSpeechTranslationEvent];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self disambiguationSpeechTranslationEvent];
  unint64_t v7 = [v4 disambiguationSpeechTranslationEvent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v28 = [(LTSchemaMTClientEvent *)self disambiguationSpeechTranslationEvent];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(LTSchemaMTClientEvent *)self disambiguationSpeechTranslationEvent];
    objc_super v31 = [v4 disambiguationSpeechTranslationEvent];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self asrSpeechTranslationEvent];
  unint64_t v7 = [v4 asrSpeechTranslationEvent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v33 = [(LTSchemaMTClientEvent *)self asrSpeechTranslationEvent];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(LTSchemaMTClientEvent *)self asrSpeechTranslationEvent];
    v36 = [v4 asrSpeechTranslationEvent];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self mtSpeechTranslationEvent];
  unint64_t v7 = [v4 mtSpeechTranslationEvent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v38 = [(LTSchemaMTClientEvent *)self mtSpeechTranslationEvent];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(LTSchemaMTClientEvent *)self mtSpeechTranslationEvent];
    v41 = [v4 mtSpeechTranslationEvent];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self ttsspeechTranslationEvent];
  unint64_t v7 = [v4 ttsspeechTranslationEvent];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v43 = [(LTSchemaMTClientEvent *)self ttsspeechTranslationEvent];
    if (!v43)
    {

LABEL_46:
      BOOL v48 = 1;
      goto LABEL_44;
    }
    v44 = (void *)v43;
    v45 = [(LTSchemaMTClientEvent *)self ttsspeechTranslationEvent];
    v46 = [v4 ttsspeechTranslationEvent];
    char v47 = [v45 isEqual:v46];

    if (v47) {
      goto LABEL_46;
    }
  }
  else
  {
LABEL_42:
  }
LABEL_43:
  BOOL v48 = 0;
LABEL_44:

  return v48;
}

- (void)writeTo:(id)a3
{
  id v20 = a3;
  id v4 = [(LTSchemaMTClientEvent *)self safariFeedbackEvent];

  if (v4)
  {
    unint64_t v5 = [(LTSchemaMTClientEvent *)self safariFeedbackEvent];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(LTSchemaMTClientEvent *)self batchTranslationEvent];

  if (v6)
  {
    unint64_t v7 = [(LTSchemaMTClientEvent *)self batchTranslationEvent];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(LTSchemaMTClientEvent *)self speechTranslationEvent];

  if (v8)
  {
    unint64_t v9 = [(LTSchemaMTClientEvent *)self speechTranslationEvent];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(LTSchemaMTClientEvent *)self lidSpeechTranslationEvent];

  if (v10)
  {
    int v11 = [(LTSchemaMTClientEvent *)self lidSpeechTranslationEvent];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(LTSchemaMTClientEvent *)self disambiguationSpeechTranslationEvent];

  if (v12)
  {
    uint64_t v13 = [(LTSchemaMTClientEvent *)self disambiguationSpeechTranslationEvent];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(LTSchemaMTClientEvent *)self asrSpeechTranslationEvent];

  if (v14)
  {
    v15 = [(LTSchemaMTClientEvent *)self asrSpeechTranslationEvent];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(LTSchemaMTClientEvent *)self mtSpeechTranslationEvent];

  if (v16)
  {
    int v17 = [(LTSchemaMTClientEvent *)self mtSpeechTranslationEvent];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(LTSchemaMTClientEvent *)self ttsspeechTranslationEvent];

  if (v18)
  {
    v19 = [(LTSchemaMTClientEvent *)self ttsspeechTranslationEvent];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaMTClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteTtsspeechTranslationEvent
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ttsspeechTranslationEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LTSchemaTTSSpeechTranslationEvent)ttsspeechTranslationEvent
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_ttsspeechTranslationEvent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTtsspeechTranslationEvent:(id)a3
{
  id v4 = (LTSchemaTTSSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  unint64_t v12 = 108;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = v4;
}

- (void)deleteMtSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_mtSpeechTranslationEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LTSchemaMTSpeechTranslationEvent)mtSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_mtSpeechTranslationEvent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMtSpeechTranslationEvent:(id)a3
{
  id v4 = (LTSchemaMTSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  unint64_t v12 = 107;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = v4;
}

- (void)deleteAsrSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_asrSpeechTranslationEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LTSchemaASRSpeechTranslationEvent)asrSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_asrSpeechTranslationEvent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAsrSpeechTranslationEvent:(id)a3
{
  id v4 = (LTSchemaASRSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  unint64_t v12 = 106;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = v4;
}

- (void)deleteDisambiguationSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_disambiguationSpeechTranslationEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LTSchemaDisambiguationSpeechTranslationEvent)disambiguationSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_disambiguationSpeechTranslationEvent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDisambiguationSpeechTranslationEvent:(id)a3
{
  id v4 = (LTSchemaDisambiguationSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  unint64_t v12 = 105;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = v4;
}

- (void)deleteLidSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_lidSpeechTranslationEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LTSchemaLIDSpeechTranslationEvent)lidSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_lidSpeechTranslationEvent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLidSpeechTranslationEvent:(id)a3
{
  id v4 = (LTSchemaLIDSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  unint64_t v12 = 104;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = v4;
}

- (void)deleteSpeechTranslationEvent
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speechTranslationEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LTSchemaSpeechTranslationEvent)speechTranslationEvent
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_speechTranslationEvent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeechTranslationEvent:(id)a3
{
  id v4 = (LTSchemaSpeechTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  unint64_t v12 = 103;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = v4;
}

- (void)deleteBatchTranslationEvent
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_batchTranslationEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LTSchemaBatchTranslationEvent)batchTranslationEvent
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_batchTranslationEvent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setBatchTranslationEvent:(id)a3
{
  id v4 = (LTSchemaBatchTranslationEvent *)a3;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  unint64_t v12 = 102;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = v4;
}

- (void)deleteSafariFeedbackEvent
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_safariFeedbackEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LTSchemaSafariFeedbackEvent)safariFeedbackEvent
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_safariFeedbackEvent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSafariFeedbackEvent:(id)a3
{
  id v4 = (LTSchemaSafariFeedbackEvent *)a3;
  batchTranslationEvent = self->_batchTranslationEvent;
  self->_batchTranslationEvent = 0;

  speechTranslationEvent = self->_speechTranslationEvent;
  self->_speechTranslationEvent = 0;

  lidSpeechTranslationEvent = self->_lidSpeechTranslationEvent;
  self->_lidSpeechTranslationEvent = 0;

  disambiguationSpeechTranslationEvent = self->_disambiguationSpeechTranslationEvent;
  self->_disambiguationSpeechTranslationEvent = 0;

  asrSpeechTranslationEvent = self->_asrSpeechTranslationEvent;
  self->_asrSpeechTranslationEvent = 0;

  mtSpeechTranslationEvent = self->_mtSpeechTranslationEvent;
  self->_mtSpeechTranslationEvent = 0;

  ttsspeechTranslationEvent = self->_ttsspeechTranslationEvent;
  self->_ttsspeechTranslationEvent = 0;

  unint64_t v12 = 101;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  safariFeedbackEvent = self->_safariFeedbackEvent;
  self->_safariFeedbackEvent = v4;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(LTSchemaMTClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 7) {
    return @"com.apple.aiml.mi.translation.MTClientEvent";
  }
  else {
    return off_1E5EB1058[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 4;
}

@end