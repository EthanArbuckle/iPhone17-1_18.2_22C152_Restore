@interface INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals
- (BOOL)hasDisambiguationAppOrdinal;
- (BOOL)hasIsDisambiguatedApp;
- (BOOL)hasModelAppConfidence;
- (BOOL)isDisambiguatedApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)disambiguationAppOrdinal;
- (int)modelAppConfidence;
- (unint64_t)hash;
- (void)deleteDisambiguationAppOrdinal;
- (void)deleteIsDisambiguatedApp;
- (void)deleteModelAppConfidence;
- (void)setDisambiguationAppOrdinal:(int)a3;
- (void)setHasDisambiguationAppOrdinal:(BOOL)a3;
- (void)setHasIsDisambiguatedApp:(BOOL)a3;
- (void)setHasModelAppConfidence:(BOOL)a3;
- (void)setIsDisambiguatedApp:(BOOL)a3;
- (void)setModelAppConfidence:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)disambiguationAppOrdinal
{
  return self->_disambiguationAppOrdinal;
}

- (int)modelAppConfidence
{
  return self->_modelAppConfidence;
}

- (BOOL)isDisambiguatedApp
{
  return self->_isDisambiguatedApp;
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals;
  v5 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDisambiguatedApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setIsDisambiguatedApp:](v5, "setIsDisambiguatedApp:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"modelAppConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setModelAppConfidence:](v5, "setModelAppConfidence:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"disambiguationAppOrdinal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals setDisambiguationAppOrdinal:](v5, "setDisambiguationAppOrdinal:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals disambiguationAppOrdinal](self, "disambiguationAppOrdinal"));
    [v3 setObject:v7 forKeyedSubscript:@"disambiguationAppOrdinal"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals isDisambiguatedApp](self, "isDisambiguatedApp"));
  [v3 setObject:v8 forKeyedSubscript:@"isDisambiguatedApp"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals modelAppConfidence](self, "modelAppConfidence"));
    [v3 setObject:v5 forKeyedSubscript:@"modelAppConfidence"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_isDisambiguatedApp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_modelAppConfidence;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_disambiguationAppOrdinal;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $9D9EFB1136A05CC2DAFC4A107E1E7449 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int isDisambiguatedApp = self->_isDisambiguatedApp;
    if (isDisambiguatedApp != [v4 isDisambiguatedApp]) {
      goto LABEL_14;
    }
    $9D9EFB1136A05CC2DAFC4A107E1E7449 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int modelAppConfidence = self->_modelAppConfidence;
    if (modelAppConfidence == [v4 modelAppConfidence])
    {
      $9D9EFB1136A05CC2DAFC4A107E1E7449 has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int disambiguationAppOrdinal = self->_disambiguationAppOrdinal;
    if (disambiguationAppOrdinal != [v4 disambiguationAppOrdinal]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteDisambiguationAppOrdinal
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasDisambiguationAppOrdinal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDisambiguationAppOrdinal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDisambiguationAppOrdinal:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int disambiguationAppOrdinal = a3;
}

- (void)deleteModelAppConfidence
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasModelAppConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModelAppConfidence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setModelAppConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int modelAppConfidence = a3;
}

- (void)deleteIsDisambiguatedApp
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsDisambiguatedApp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDisambiguatedApp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsDisambiguatedApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isDisambiguatedApp = a3;
}

@end