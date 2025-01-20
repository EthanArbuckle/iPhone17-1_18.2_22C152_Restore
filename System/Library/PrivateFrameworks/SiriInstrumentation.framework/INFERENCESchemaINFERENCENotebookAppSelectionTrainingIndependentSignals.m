@interface INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals
- (BOOL)hasCommonIndependent;
- (BOOL)hasIsNotebookGroupPresent;
- (BOOL)hasIsNotebookPayloadPresent;
- (BOOL)hasIsNotebookTitlePresent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotebookGroupPresent;
- (BOOL)isNotebookPayloadPresent;
- (BOOL)isNotebookTitlePresent;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommonAppIndependentSignals)commonIndependent;
- (INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCommonIndependent;
- (void)deleteIsNotebookGroupPresent;
- (void)deleteIsNotebookPayloadPresent;
- (void)deleteIsNotebookTitlePresent;
- (void)setCommonIndependent:(id)a3;
- (void)setHasCommonIndependent:(BOOL)a3;
- (void)setHasIsNotebookGroupPresent:(BOOL)a3;
- (void)setHasIsNotebookPayloadPresent:(BOOL)a3;
- (void)setHasIsNotebookTitlePresent:(BOOL)a3;
- (void)setIsNotebookGroupPresent:(BOOL)a3;
- (void)setIsNotebookPayloadPresent:(BOOL)a3;
- (void)setIsNotebookTitlePresent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self commonIndependent];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self deleteCommonIndependent];
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
}

- (void)setHasCommonIndependent:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (BOOL)isNotebookGroupPresent
{
  return self->_isNotebookGroupPresent;
}

- (BOOL)isNotebookPayloadPresent
{
  return self->_isNotebookPayloadPresent;
}

- (BOOL)isNotebookTitlePresent
{
  return self->_isNotebookTitlePresent;
}

- (void)setCommonIndependent:(id)a3
{
}

- (INFERENCESchemaINFERENCECommonAppIndependentSignals)commonIndependent
{
  return self->_commonIndependent;
}

- (INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals;
  v5 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"commonIndependent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCECommonAppIndependentSignals alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)v5 setCommonIndependent:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isNotebookTitlePresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookTitlePresent:](v5, "setIsNotebookTitlePresent:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"isNotebookPayloadPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookPayloadPresent:](v5, "setIsNotebookPayloadPresent:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isNotebookGroupPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookGroupPresent:](v5, "setIsNotebookGroupPresent:", [v10 BOOLValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self dictionaryRepresentation];
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
  if (self->_commonIndependent)
  {
    id v4 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self commonIndependent];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"commonIndependent"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"commonIndependent"];
    }
  }
  char v7 = *(&self->_isNotebookGroupPresent + 1);
  if ((v7 & 4) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals isNotebookGroupPresent](self, "isNotebookGroupPresent"));
    [v3 setObject:v10 forKeyedSubscript:@"isNotebookGroupPresent"];

    char v7 = *(&self->_isNotebookGroupPresent + 1);
    if ((v7 & 2) == 0)
    {
LABEL_8:
      if ((v7 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(&self->_isNotebookGroupPresent + 1) & 2) == 0)
  {
    goto LABEL_8;
  }
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals isNotebookPayloadPresent](self, "isNotebookPayloadPresent"));
  [v3 setObject:v11 forKeyedSubscript:@"isNotebookPayloadPresent"];

  if (*(&self->_isNotebookGroupPresent + 1))
  {
LABEL_9:
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals isNotebookTitlePresent](self, "isNotebookTitlePresent"));
    [v3 setObject:v8 forKeyedSubscript:@"isNotebookTitlePresent"];
  }
LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INFERENCESchemaINFERENCECommonAppIndependentSignals *)self->_commonIndependent hash];
  if (!*(&self->_isNotebookGroupPresent + 1))
  {
    uint64_t v4 = 0;
    if ((*(&self->_isNotebookGroupPresent + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(&self->_isNotebookGroupPresent + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_isNotebookTitlePresent;
  if ((*(&self->_isNotebookGroupPresent + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isNotebookPayloadPresent;
  if ((*(&self->_isNotebookGroupPresent + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isNotebookGroupPresent;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self commonIndependent];
  uint64_t v6 = [v4 commonIndependent];
  char v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self commonIndependent];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self commonIndependent];
    v11 = [v4 commonIndependent];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unsigned int v13 = *((unsigned __int8 *)&self->_isNotebookGroupPresent + 1);
  unsigned int v14 = v4[19];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (v13)
  {
    int isNotebookTitlePresent = self->_isNotebookTitlePresent;
    if (isNotebookTitlePresent != [v4 isNotebookTitlePresent]) {
      goto LABEL_20;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isNotebookGroupPresent + 1);
    unsigned int v14 = v4[19];
  }
  int v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    int isNotebookPayloadPresent = self->_isNotebookPayloadPresent;
    if (isNotebookPayloadPresent == [v4 isNotebookPayloadPresent])
    {
      unsigned int v13 = *((unsigned __int8 *)&self->_isNotebookGroupPresent + 1);
      unsigned int v14 = v4[19];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    int isNotebookGroupPresent = self->_isNotebookGroupPresent;
    if (isNotebookGroupPresent != [v4 isNotebookGroupPresent]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self commonIndependent];

  if (v4)
  {
    uint64_t v5 = [(INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *)self commonIndependent];
    PBDataWriterWriteSubmessage();
  }
  char v6 = *(&self->_isNotebookGroupPresent + 1);
  if (v6)
  {
    PBDataWriterWriteBOOLField();
    char v6 = *(&self->_isNotebookGroupPresent + 1);
  }
  char v7 = v8;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v7 = v8;
    char v6 = *(&self->_isNotebookGroupPresent + 1);
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsNotebookGroupPresent
{
  *(&self->_isNotebookGroupPresent + 1) &= ~4u;
}

- (void)setHasIsNotebookGroupPresent:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isNotebookGroupPresent + 1) = *(&self->_isNotebookGroupPresent + 1) & 0xFB | v3;
}

- (BOOL)hasIsNotebookGroupPresent
{
  return (*((unsigned __int8 *)&self->_isNotebookGroupPresent + 1) >> 2) & 1;
}

- (void)setIsNotebookGroupPresent:(BOOL)a3
{
  *(&self->_isNotebookGroupPresent + 1) |= 4u;
  self->_int isNotebookGroupPresent = a3;
}

- (void)deleteIsNotebookPayloadPresent
{
  *(&self->_isNotebookGroupPresent + 1) &= ~2u;
}

- (void)setHasIsNotebookPayloadPresent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isNotebookGroupPresent + 1) = *(&self->_isNotebookGroupPresent + 1) & 0xFD | v3;
}

- (BOOL)hasIsNotebookPayloadPresent
{
  return (*((unsigned __int8 *)&self->_isNotebookGroupPresent + 1) >> 1) & 1;
}

- (void)setIsNotebookPayloadPresent:(BOOL)a3
{
  *(&self->_isNotebookGroupPresent + 1) |= 2u;
  self->_int isNotebookPayloadPresent = a3;
}

- (void)deleteIsNotebookTitlePresent
{
  *(&self->_isNotebookGroupPresent + 1) &= ~1u;
}

- (void)setHasIsNotebookTitlePresent:(BOOL)a3
{
  *(&self->_isNotebookGroupPresent + 1) = *(&self->_isNotebookGroupPresent + 1) & 0xFE | a3;
}

- (BOOL)hasIsNotebookTitlePresent
{
  return *(&self->_isNotebookGroupPresent + 1);
}

- (void)setIsNotebookTitlePresent:(BOOL)a3
{
  *(&self->_isNotebookGroupPresent + 1) |= 1u;
  self->_int isNotebookTitlePresent = a3;
}

- (void)deleteCommonIndependent
{
}

- (BOOL)hasCommonIndependent
{
  return self->_commonIndependent != 0;
}

@end