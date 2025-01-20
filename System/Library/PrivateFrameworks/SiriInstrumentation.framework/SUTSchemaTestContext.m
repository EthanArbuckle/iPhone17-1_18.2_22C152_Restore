@interface SUTSchemaTestContext
- (BOOL)hasTestName;
- (BOOL)hasTestSessionInfo;
- (BOOL)hasTestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)testName;
- (SUTSchemaTestContext)initWithDictionary:(id)a3;
- (SUTSchemaTestContext)initWithJSON:(id)a3;
- (SUTSchemaTestSessionInfo)testSessionInfo;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)testType;
- (unint64_t)hash;
- (void)deleteTestName;
- (void)deleteTestSessionInfo;
- (void)deleteTestType;
- (void)setHasTestName:(BOOL)a3;
- (void)setHasTestSessionInfo:(BOOL)a3;
- (void)setHasTestType:(BOOL)a3;
- (void)setTestName:(id)a3;
- (void)setTestSessionInfo:(id)a3;
- (void)setTestType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUTSchemaTestContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUTSchemaTestContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SUTSchemaTestContext *)self testSessionInfo];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SUTSchemaTestContext *)self deleteTestSessionInfo];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSessionInfo, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

- (void)setHasTestSessionInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTestName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTestSessionInfo:(id)a3
{
}

- (SUTSchemaTestSessionInfo)testSessionInfo
{
  return self->_testSessionInfo;
}

- (int)testType
{
  return self->_testType;
}

- (void)setTestName:(id)a3
{
}

- (NSString)testName
{
  return self->_testName;
}

- (SUTSchemaTestContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUTSchemaTestContext;
  v5 = [(SUTSchemaTestContext *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"testName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SUTSchemaTestContext *)v5 setTestName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"testType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUTSchemaTestContext setTestType:](v5, "setTestType:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"testSessionInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SUTSchemaTestSessionInfo alloc] initWithDictionary:v9];
      [(SUTSchemaTestContext *)v5 setTestSessionInfo:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SUTSchemaTestContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUTSchemaTestContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUTSchemaTestContext *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_testName)
  {
    id v4 = [(SUTSchemaTestContext *)self testName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"testName"];
  }
  if (self->_testSessionInfo)
  {
    v6 = [(SUTSchemaTestContext *)self testSessionInfo];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"testSessionInfo"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"testSessionInfo"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v9 = [(SUTSchemaTestContext *)self testType] - 1;
    if (v9 > 3) {
      v10 = @"TESTTYPE_UNKNOWN";
    }
    else {
      v10 = off_1E5EB9708[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"testType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_testName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_testType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(SUTSchemaTestSessionInfo *)self->_testSessionInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(SUTSchemaTestContext *)self testName];
  v6 = [v4 testName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(SUTSchemaTestContext *)self testName];
  if (v7)
  {
    v8 = (void *)v7;
    unsigned int v9 = [(SUTSchemaTestContext *)self testName];
    v10 = [v4 testName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int testType = self->_testType;
    if (testType != [v4 testType]) {
      goto LABEL_15;
    }
  }
  v5 = [(SUTSchemaTestContext *)self testSessionInfo];
  v6 = [v4 testSessionInfo];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(SUTSchemaTestContext *)self testSessionInfo];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SUTSchemaTestContext *)self testSessionInfo];
    v16 = [v4 testSessionInfo];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SUTSchemaTestContext *)self testName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(SUTSchemaTestContext *)self testSessionInfo];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(SUTSchemaTestContext *)self testSessionInfo];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteTestSessionInfo
{
}

- (BOOL)hasTestSessionInfo
{
  return self->_testSessionInfo != 0;
}

- (void)deleteTestType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTestType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTestType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTestType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int testType = a3;
}

- (void)deleteTestName
{
}

- (BOOL)hasTestName
{
  return self->_testName != 0;
}

@end