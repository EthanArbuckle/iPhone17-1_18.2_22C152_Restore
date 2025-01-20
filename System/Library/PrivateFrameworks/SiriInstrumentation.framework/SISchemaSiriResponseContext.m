@interface SISchemaSiriResponseContext
- (BOOL)hasDialogPhase;
- (BOOL)hasPresentationType;
- (BOOL)hasSiriResponseMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)dialogPhase;
- (SISchemaSiriResponseContext)initWithDictionary:(id)a3;
- (SISchemaSiriResponseContext)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)presentationType;
- (int)siriResponseMode;
- (unint64_t)hash;
- (void)deleteDialogPhase;
- (void)deletePresentationType;
- (void)deleteSiriResponseMode;
- (void)setDialogPhase:(id)a3;
- (void)setHasDialogPhase:(BOOL)a3;
- (void)setHasPresentationType:(BOOL)a3;
- (void)setHasSiriResponseMode:(BOOL)a3;
- (void)setPresentationType:(int)a3;
- (void)setSiriResponseMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaSiriResponseContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasDialogPhase:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)siriResponseMode
{
  return self->_siriResponseMode;
}

- (int)presentationType
{
  return self->_presentationType;
}

- (void)setDialogPhase:(id)a3
{
}

- (NSString)dialogPhase
{
  return self->_dialogPhase;
}

- (SISchemaSiriResponseContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaSiriResponseContext;
  v5 = [(SISchemaSiriResponseContext *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dialogPhase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaSiriResponseContext *)v5 setDialogPhase:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"presentationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSiriResponseContext setPresentationType:](v5, "setPresentationType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"siriResponseMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSiriResponseContext setSiriResponseMode:](v5, "setSiriResponseMode:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaSiriResponseContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaSiriResponseContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaSiriResponseContext *)self dictionaryRepresentation];
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
  if (self->_dialogPhase)
  {
    id v4 = [(SISchemaSiriResponseContext *)self dialogPhase];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"dialogPhase"];
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v7 = [(SISchemaSiriResponseContext *)self presentationType] - 1;
    if (v7 > 6) {
      v8 = @"SIRIPRESENTATIONTYPE_UNKNOWN_SIRI_PRESENTATION_TYPE";
    }
    else {
      v8 = off_1E5EB8518[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"presentationType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v9 = [(SISchemaSiriResponseContext *)self siriResponseMode] - 1;
    if (v9 > 6) {
      v10 = @"SIRIRESPONSEMODE_UNKNOWN_SIRI_RESPONSE_MODE";
    }
    else {
      v10 = off_1E5EB8550[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"siriResponseMode"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_dialogPhase hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_presentationType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_siriResponseMode;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(SISchemaSiriResponseContext *)self dialogPhase];
  v6 = [v4 dialogPhase];
  unsigned int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(SISchemaSiriResponseContext *)self dialogPhase];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    v10 = [(SISchemaSiriResponseContext *)self dialogPhase];
    v11 = [v4 dialogPhase];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $9F74CAB219D0F06C20453967A4BBB7C6 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int presentationType = self->_presentationType;
    if (presentationType == [v4 presentationType])
    {
      $9F74CAB219D0F06C20453967A4BBB7C6 has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    int siriResponseMode = self->_siriResponseMode;
    if (siriResponseMode != [v4 siriResponseMode]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SISchemaSiriResponseContext *)self dialogPhase];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSiriResponseContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriResponseMode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSiriResponseMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSiriResponseMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSiriResponseMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int siriResponseMode = a3;
}

- (void)deletePresentationType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPresentationType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPresentationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPresentationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int presentationType = a3;
}

- (void)deleteDialogPhase
{
}

- (BOOL)hasDialogPhase
{
  return self->_dialogPhase != 0;
}

@end