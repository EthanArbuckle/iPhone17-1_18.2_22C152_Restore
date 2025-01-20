@interface SUTSchemaTestExecutionEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasMetadata;
- (BOOL)hasTestAssociatedSchemaIdentifier;
- (BOOL)hasTestExecutionBegin;
- (BOOL)hasTestExecutionEnd;
- (BOOL)hasTestOutcomeRecorded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (SUTSchemaTestAssociatedSchemaIdentifier)testAssociatedSchemaIdentifier;
- (SUTSchemaTestExecutionBegin)testExecutionBegin;
- (SUTSchemaTestExecutionEnd)testExecutionEnd;
- (SUTSchemaTestExecutionEvent)initWithDictionary:(id)a3;
- (SUTSchemaTestExecutionEvent)initWithJSON:(id)a3;
- (SUTSchemaTestExecutionMetadata)metadata;
- (SUTSchemaTestOutcomeRecorded)testOutcomeRecorded;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteMetadata;
- (void)deleteTestAssociatedSchemaIdentifier;
- (void)deleteTestExecutionBegin;
- (void)deleteTestExecutionEnd;
- (void)deleteTestOutcomeRecorded;
- (void)setHasMetadata:(BOOL)a3;
- (void)setHasTestAssociatedSchemaIdentifier:(BOOL)a3;
- (void)setHasTestExecutionBegin:(BOOL)a3;
- (void)setHasTestExecutionEnd:(BOOL)a3;
- (void)setHasTestOutcomeRecorded:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setTestAssociatedSchemaIdentifier:(id)a3;
- (void)setTestExecutionBegin:(id)a3;
- (void)setTestExecutionEnd:(id)a3;
- (void)setTestOutcomeRecorded:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUTSchemaTestExecutionEvent

- (int)componentName
{
  v2 = [(SUTSchemaTestExecutionEvent *)self metadata];
  v3 = [v2 fingerprint];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 26;
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
  v2 = [(SUTSchemaTestExecutionEvent *)self metadata];
  v3 = [v2 fingerprint];

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
  v22.receiver = self;
  v22.super_class = (Class)SUTSchemaTestExecutionEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(SUTSchemaTestExecutionEvent *)self metadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SUTSchemaTestExecutionEvent *)self deleteMetadata];
  }
  v9 = [(SUTSchemaTestExecutionEvent *)self testExecutionBegin];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SUTSchemaTestExecutionEvent *)self deleteTestExecutionBegin];
  }
  v12 = [(SUTSchemaTestExecutionEvent *)self testExecutionEnd];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SUTSchemaTestExecutionEvent *)self deleteTestExecutionEnd];
  }
  v15 = [(SUTSchemaTestExecutionEvent *)self testAssociatedSchemaIdentifier];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SUTSchemaTestExecutionEvent *)self deleteTestAssociatedSchemaIdentifier];
  }
  v18 = [(SUTSchemaTestExecutionEvent *)self testOutcomeRecorded];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(SUTSchemaTestExecutionEvent *)self deleteTestOutcomeRecorded];
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
  unint64_t v3 = [(SUTSchemaTestExecutionEvent *)self whichEvent_Type];
  if (v3 - 101 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAC188[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 3) {
    return 0;
  }
  else {
    return off_1E5EAC1A8[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOutcomeRecorded, 0);
  objc_storeStrong((id *)&self->_testAssociatedSchemaIdentifier, 0);
  objc_storeStrong((id *)&self->_testExecutionEnd, 0);
  objc_storeStrong((id *)&self->_testExecutionBegin, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)setHasTestOutcomeRecorded:(BOOL)a3
{
  self->_hasTestOutcomeRecorded = a3;
}

- (BOOL)hasTestOutcomeRecorded
{
  return self->_hasTestOutcomeRecorded;
}

- (void)setHasTestAssociatedSchemaIdentifier:(BOOL)a3
{
  self->_hasTestAssociatedSchemaIdentifier = a3;
}

- (BOOL)hasTestAssociatedSchemaIdentifier
{
  return self->_hasTestAssociatedSchemaIdentifier;
}

- (void)setHasTestExecutionEnd:(BOOL)a3
{
  self->_hasTestExecutionEnd = a3;
}

- (BOOL)hasTestExecutionEnd
{
  return self->_hasTestExecutionEnd;
}

- (void)setHasTestExecutionBegin:(BOOL)a3
{
  self->_hasTestExecutionBegin = a3;
}

- (BOOL)hasTestExecutionBegin
{
  return self->_hasTestExecutionBegin;
}

- (void)setHasMetadata:(BOOL)a3
{
  self->_hasMetadata = a3;
}

- (void)setMetadata:(id)a3
{
}

- (SUTSchemaTestExecutionMetadata)metadata
{
  return self->_metadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SUTSchemaTestExecutionEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUTSchemaTestExecutionEvent;
  v5 = [(SUTSchemaTestExecutionEvent *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SUTSchemaTestExecutionMetadata alloc] initWithDictionary:v6];
      [(SUTSchemaTestExecutionEvent *)v5 setMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"testExecutionBegin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SUTSchemaTestExecutionBegin alloc] initWithDictionary:v8];
      [(SUTSchemaTestExecutionEvent *)v5 setTestExecutionBegin:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"testExecutionEnd"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SUTSchemaTestExecutionEnd alloc] initWithDictionary:v10];
      [(SUTSchemaTestExecutionEvent *)v5 setTestExecutionEnd:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"testAssociatedSchemaIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SUTSchemaTestAssociatedSchemaIdentifier alloc] initWithDictionary:v12];
      [(SUTSchemaTestExecutionEvent *)v5 setTestAssociatedSchemaIdentifier:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"testOutcomeRecorded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SUTSchemaTestOutcomeRecorded alloc] initWithDictionary:v14];
      [(SUTSchemaTestExecutionEvent *)v5 setTestOutcomeRecorded:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (SUTSchemaTestExecutionEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUTSchemaTestExecutionEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUTSchemaTestExecutionEvent *)self dictionaryRepresentation];
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
  if (self->_metadata)
  {
    id v4 = [(SUTSchemaTestExecutionEvent *)self metadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"metadata"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"metadata"];
    }
  }
  if (self->_testAssociatedSchemaIdentifier)
  {
    uint64_t v7 = [(SUTSchemaTestExecutionEvent *)self testAssociatedSchemaIdentifier];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"testAssociatedSchemaIdentifier"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"testAssociatedSchemaIdentifier"];
    }
  }
  if (self->_testExecutionBegin)
  {
    v10 = [(SUTSchemaTestExecutionEvent *)self testExecutionBegin];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"testExecutionBegin"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"testExecutionBegin"];
    }
  }
  if (self->_testExecutionEnd)
  {
    v13 = [(SUTSchemaTestExecutionEvent *)self testExecutionEnd];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"testExecutionEnd"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"testExecutionEnd"];
    }
  }
  if (self->_testOutcomeRecorded)
  {
    v16 = [(SUTSchemaTestExecutionEvent *)self testOutcomeRecorded];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"testOutcomeRecorded"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"testOutcomeRecorded"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SUTSchemaTestExecutionMetadata *)self->_metadata hash];
  unint64_t v4 = [(SUTSchemaTestExecutionBegin *)self->_testExecutionBegin hash] ^ v3;
  unint64_t v5 = [(SUTSchemaTestExecutionEnd *)self->_testExecutionEnd hash];
  unint64_t v6 = v4 ^ v5 ^ [(SUTSchemaTestAssociatedSchemaIdentifier *)self->_testAssociatedSchemaIdentifier hash];
  return v6 ^ [(SUTSchemaTestOutcomeRecorded *)self->_testOutcomeRecorded hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_28;
  }
  unint64_t v6 = [(SUTSchemaTestExecutionEvent *)self metadata];
  uint64_t v7 = [v4 metadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(SUTSchemaTestExecutionEvent *)self metadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SUTSchemaTestExecutionEvent *)self metadata];
    int v11 = [v4 metadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUTSchemaTestExecutionEvent *)self testExecutionBegin];
  uint64_t v7 = [v4 testExecutionBegin];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(SUTSchemaTestExecutionEvent *)self testExecutionBegin];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(SUTSchemaTestExecutionEvent *)self testExecutionBegin];
    v16 = [v4 testExecutionBegin];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUTSchemaTestExecutionEvent *)self testExecutionEnd];
  uint64_t v7 = [v4 testExecutionEnd];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(SUTSchemaTestExecutionEvent *)self testExecutionEnd];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(SUTSchemaTestExecutionEvent *)self testExecutionEnd];
    v21 = [v4 testExecutionEnd];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUTSchemaTestExecutionEvent *)self testAssociatedSchemaIdentifier];
  uint64_t v7 = [v4 testAssociatedSchemaIdentifier];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(SUTSchemaTestExecutionEvent *)self testAssociatedSchemaIdentifier];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(SUTSchemaTestExecutionEvent *)self testAssociatedSchemaIdentifier];
    v26 = [v4 testAssociatedSchemaIdentifier];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUTSchemaTestExecutionEvent *)self testOutcomeRecorded];
  uint64_t v7 = [v4 testOutcomeRecorded];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(SUTSchemaTestExecutionEvent *)self testOutcomeRecorded];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(SUTSchemaTestExecutionEvent *)self testOutcomeRecorded];
    v31 = [v4 testOutcomeRecorded];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_31;
    }
  }
  else
  {
LABEL_27:
  }
LABEL_28:
  BOOL v33 = 0;
LABEL_29:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(SUTSchemaTestExecutionEvent *)self metadata];

  if (v4)
  {
    unint64_t v5 = [(SUTSchemaTestExecutionEvent *)self metadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(SUTSchemaTestExecutionEvent *)self testExecutionBegin];

  if (v6)
  {
    uint64_t v7 = [(SUTSchemaTestExecutionEvent *)self testExecutionBegin];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SUTSchemaTestExecutionEvent *)self testExecutionEnd];

  if (v8)
  {
    v9 = [(SUTSchemaTestExecutionEvent *)self testExecutionEnd];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(SUTSchemaTestExecutionEvent *)self testAssociatedSchemaIdentifier];

  if (v10)
  {
    int v11 = [(SUTSchemaTestExecutionEvent *)self testAssociatedSchemaIdentifier];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(SUTSchemaTestExecutionEvent *)self testOutcomeRecorded];

  if (v12)
  {
    uint64_t v13 = [(SUTSchemaTestExecutionEvent *)self testOutcomeRecorded];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestExecutionEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteTestOutcomeRecorded
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_testOutcomeRecorded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUTSchemaTestOutcomeRecorded)testOutcomeRecorded
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_testOutcomeRecorded;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTestOutcomeRecorded:(id)a3
{
  id v4 = (SUTSchemaTestOutcomeRecorded *)a3;
  testExecutionBegin = self->_testExecutionBegin;
  self->_testExecutionBegin = 0;

  testExecutionEnd = self->_testExecutionEnd;
  self->_testExecutionEnd = 0;

  testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
  self->_testAssociatedSchemaIdentifier = 0;

  unint64_t v8 = 104;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  testOutcomeRecorded = self->_testOutcomeRecorded;
  self->_testOutcomeRecorded = v4;
}

- (void)deleteTestAssociatedSchemaIdentifier
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_testAssociatedSchemaIdentifier = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUTSchemaTestAssociatedSchemaIdentifier)testAssociatedSchemaIdentifier
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_testAssociatedSchemaIdentifier;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTestAssociatedSchemaIdentifier:(id)a3
{
  id v4 = (SUTSchemaTestAssociatedSchemaIdentifier *)a3;
  testExecutionBegin = self->_testExecutionBegin;
  self->_testExecutionBegin = 0;

  testExecutionEnd = self->_testExecutionEnd;
  self->_testExecutionEnd = 0;

  testOutcomeRecorded = self->_testOutcomeRecorded;
  self->_testOutcomeRecorded = 0;

  unint64_t v8 = 103;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
  self->_testAssociatedSchemaIdentifier = v4;
}

- (void)deleteTestExecutionEnd
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_testExecutionEnd = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUTSchemaTestExecutionEnd)testExecutionEnd
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_testExecutionEnd;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTestExecutionEnd:(id)a3
{
  id v4 = (SUTSchemaTestExecutionEnd *)a3;
  testExecutionBegin = self->_testExecutionBegin;
  self->_testExecutionBegin = 0;

  testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
  self->_testAssociatedSchemaIdentifier = 0;

  testOutcomeRecorded = self->_testOutcomeRecorded;
  self->_testOutcomeRecorded = 0;

  unint64_t v8 = 102;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  testExecutionEnd = self->_testExecutionEnd;
  self->_testExecutionEnd = v4;
}

- (void)deleteTestExecutionBegin
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_testExecutionBegin = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUTSchemaTestExecutionBegin)testExecutionBegin
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_testExecutionBegin;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTestExecutionBegin:(id)a3
{
  id v4 = (SUTSchemaTestExecutionBegin *)a3;
  testExecutionEnd = self->_testExecutionEnd;
  self->_testExecutionEnd = 0;

  testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
  self->_testAssociatedSchemaIdentifier = 0;

  testOutcomeRecorded = self->_testOutcomeRecorded;
  self->_testOutcomeRecorded = 0;

  unint64_t v8 = 101;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  testExecutionBegin = self->_testExecutionBegin;
  self->_testExecutionBegin = v4;
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
  unint64_t v2 = [(SUTSchemaTestExecutionEvent *)self whichEvent_Type];
  if (v2 - 101 > 3) {
    return @"com.apple.aiml.siri.siriundertest.TestExecutionEvent";
  }
  else {
    return off_1E5EB9750[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 8;
}

@end