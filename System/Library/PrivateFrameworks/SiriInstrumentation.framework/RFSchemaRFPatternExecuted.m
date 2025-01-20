@interface RFSchemaRFPatternExecuted
- (BOOL)hasMode;
- (BOOL)hasPattern;
- (BOOL)hasPatternId;
- (BOOL)hasResponseViewId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)patternId;
- (NSString)responseViewId;
- (RFSchemaRFPatternExecuted)initWithDictionary:(id)a3;
- (RFSchemaRFPatternExecuted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mode;
- (int)pattern;
- (unint64_t)hash;
- (void)deleteMode;
- (void)deletePattern;
- (void)deletePatternId;
- (void)deleteResponseViewId;
- (void)setHasMode:(BOOL)a3;
- (void)setHasPattern:(BOOL)a3;
- (void)setHasPatternId:(BOOL)a3;
- (void)setHasResponseViewId:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)setPattern:(int)a3;
- (void)setPatternId:(id)a3;
- (void)setResponseViewId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RFSchemaRFPatternExecuted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseViewId, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
}

- (void)setHasResponseViewId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasPatternId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setResponseViewId:(id)a3
{
}

- (NSString)responseViewId
{
  return self->_responseViewId;
}

- (int)mode
{
  return self->_mode;
}

- (int)pattern
{
  return self->_pattern;
}

- (void)setPatternId:(id)a3
{
}

- (NSString)patternId
{
  return self->_patternId;
}

- (RFSchemaRFPatternExecuted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RFSchemaRFPatternExecuted;
  v5 = [(RFSchemaRFPatternExecuted *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"patternId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(RFSchemaRFPatternExecuted *)v5 setPatternId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"pattern"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RFSchemaRFPatternExecuted setPattern:](v5, "setPattern:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"mode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RFSchemaRFPatternExecuted setMode:](v5, "setMode:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"responseViewId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(RFSchemaRFPatternExecuted *)v5 setResponseViewId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (RFSchemaRFPatternExecuted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RFSchemaRFPatternExecuted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RFSchemaRFPatternExecuted *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v5 = [(RFSchemaRFPatternExecuted *)self mode] - 1;
    if (v5 > 3) {
      v6 = @"RFSIRIMODE_UNKNOWN";
    }
    else {
      v6 = off_1E5EB48D0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"mode"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(RFSchemaRFPatternExecuted *)self pattern] - 1;
    if (v7 > 0x11) {
      v8 = @"RFPATTERN_UNKNOWN";
    }
    else {
      v8 = off_1E5EB48F0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"pattern"];
  }
  if (self->_patternId)
  {
    v9 = [(RFSchemaRFPatternExecuted *)self patternId];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"patternId"];
  }
  if (self->_responseViewId)
  {
    v11 = [(RFSchemaRFPatternExecuted *)self responseViewId];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"responseViewId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_patternId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_pattern;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_responseViewId hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_mode;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_responseViewId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  uint64_t v5 = [(RFSchemaRFPatternExecuted *)self patternId];
  v6 = [v4 patternId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(RFSchemaRFPatternExecuted *)self patternId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(RFSchemaRFPatternExecuted *)self patternId];
    v10 = [v4 patternId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $F2CC6F857CB4D7C290D5DA2C63794A48 has = self->_has;
  unsigned int v13 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int pattern = self->_pattern;
    if (pattern != [v4 pattern]) {
      goto LABEL_19;
    }
    $F2CC6F857CB4D7C290D5DA2C63794A48 has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v15)
  {
    int mode = self->_mode;
    if (mode != [v4 mode]) {
      goto LABEL_19;
    }
  }
  uint64_t v5 = [(RFSchemaRFPatternExecuted *)self responseViewId];
  v6 = [v4 responseViewId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(RFSchemaRFPatternExecuted *)self responseViewId];
  if (!v17)
  {

LABEL_22:
    BOOL v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  v19 = [(RFSchemaRFPatternExecuted *)self responseViewId];
  v20 = [v4 responseViewId];
  char v21 = [v19 isEqual:v20];

  if (v21) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(RFSchemaRFPatternExecuted *)self patternId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(RFSchemaRFPatternExecuted *)self responseViewId];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFPatternExecutedReadFrom(self, (uint64_t)a3);
}

- (void)deleteResponseViewId
{
}

- (BOOL)hasResponseViewId
{
  return self->_responseViewId != 0;
}

- (void)deleteMode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int mode = a3;
}

- (void)deletePattern
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPattern:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPattern
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPattern:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int pattern = a3;
}

- (void)deletePatternId
{
}

- (BOOL)hasPatternId
{
  return self->_patternId != 0;
}

@end