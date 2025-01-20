@interface NLXSchemaCDMReformedTurnInputBundle
- (BOOL)hasCurrentTurn;
- (BOOL)hasPreviousTurnsSkip;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMReformedTurnInputBundle)initWithDictionary:(id)a3;
- (NLXSchemaCDMReformedTurnInputBundle)initWithJSON:(id)a3;
- (NLXSchemaCDMTurnInput)currentTurn;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)type;
- (unint64_t)hash;
- (unsigned)previousTurnsSkip;
- (void)deleteCurrentTurn;
- (void)deletePreviousTurnsSkip;
- (void)deleteType;
- (void)setCurrentTurn:(id)a3;
- (void)setHasCurrentTurn:(BOOL)a3;
- (void)setHasPreviousTurnsSkip:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPreviousTurnsSkip:(unsigned int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMReformedTurnInputBundle

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMReformedTurnInputBundle;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMReformedTurnInputBundle *)self currentTurn];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLXSchemaCDMReformedTurnInputBundle *)self deleteCurrentTurn];
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

- (void)setHasCurrentTurn:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)previousTurnsSkip
{
  return self->_previousTurnsSkip;
}

- (void)setCurrentTurn:(id)a3
{
}

- (NLXSchemaCDMTurnInput)currentTurn
{
  return self->_currentTurn;
}

- (int)type
{
  return self->_type;
}

- (NLXSchemaCDMReformedTurnInputBundle)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMReformedTurnInputBundle;
  v5 = [(NLXSchemaCDMReformedTurnInputBundle *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMReformedTurnInputBundle setType:](v5, "setType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"currentTurn"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[NLXSchemaCDMTurnInput alloc] initWithDictionary:v7];
      [(NLXSchemaCDMReformedTurnInputBundle *)v5 setCurrentTurn:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"previousTurnsSkip"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMReformedTurnInputBundle setPreviousTurnsSkip:](v5, "setPreviousTurnsSkip:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaCDMReformedTurnInputBundle)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMReformedTurnInputBundle *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMReformedTurnInputBundle *)self dictionaryRepresentation];
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
  if (self->_currentTurn)
  {
    id v4 = [(NLXSchemaCDMReformedTurnInputBundle *)self currentTurn];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"currentTurn"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"currentTurn"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMReformedTurnInputBundle previousTurnsSkip](self, "previousTurnsSkip"));
    [v3 setObject:v8 forKeyedSubscript:@"previousTurnsSkip"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v9 = [(NLXSchemaCDMReformedTurnInputBundle *)self type] - 1;
    if (v9 > 3) {
      v10 = @"CDMREFORMTYPE_UNKNOWN";
    }
    else {
      v10 = off_1E5EB2D00[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"type"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NLXSchemaCDMTurnInput *)self->_currentTurn hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_previousTurnsSkip;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[28] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int type = self->_type;
    if (type != [v4 type]) {
      goto LABEL_15;
    }
  }
  v6 = [(NLXSchemaCDMReformedTurnInputBundle *)self currentTurn];
  uint64_t v7 = [v4 currentTurn];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(NLXSchemaCDMReformedTurnInputBundle *)self currentTurn];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(NLXSchemaCDMReformedTurnInputBundle *)self currentTurn];
    objc_super v12 = [v4 currentTurn];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    unsigned int previousTurnsSkip = self->_previousTurnsSkip;
    if (previousTurnsSkip != [v4 previousTurnsSkip]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(NLXSchemaCDMReformedTurnInputBundle *)self currentTurn];

  if (v4)
  {
    uint64_t v5 = [(NLXSchemaCDMReformedTurnInputBundle *)self currentTurn];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMReformedTurnInputBundleReadFrom(self, (uint64_t)a3);
}

- (void)deletePreviousTurnsSkip
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPreviousTurnsSkip:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreviousTurnsSkip
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPreviousTurnsSkip:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int previousTurnsSkip = a3;
}

- (void)deleteCurrentTurn
{
}

- (BOOL)hasCurrentTurn
{
  return self->_currentTurn != 0;
}

- (void)deleteType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int type = a3;
}

@end