@interface INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals
- (BOOL)hasAppResolutionType;
- (BOOL)hasCommunicationType;
- (BOOL)hasRequestOriginLanguage;
- (BOOL)hasRequestOriginLocale;
- (BOOL)hasUserPersona;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appResolutionType;
- (int)userPersona;
- (int64_t)communicationType;
- (int64_t)requestOriginLanguage;
- (int64_t)requestOriginLocale;
- (unint64_t)hash;
- (void)deleteAppResolutionType;
- (void)deleteCommunicationType;
- (void)deleteRequestOriginLanguage;
- (void)deleteRequestOriginLocale;
- (void)deleteUserPersona;
- (void)setAppResolutionType:(int)a3;
- (void)setCommunicationType:(int64_t)a3;
- (void)setHasAppResolutionType:(BOOL)a3;
- (void)setHasCommunicationType:(BOOL)a3;
- (void)setHasRequestOriginLanguage:(BOOL)a3;
- (void)setHasRequestOriginLocale:(BOOL)a3;
- (void)setHasUserPersona:(BOOL)a3;
- (void)setRequestOriginLanguage:(int64_t)a3;
- (void)setRequestOriginLocale:(int64_t)a3;
- (void)setUserPersona:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)userPersona
{
  return self->_userPersona;
}

- (int)appResolutionType
{
  return self->_appResolutionType;
}

- (int64_t)communicationType
{
  return self->_communicationType;
}

- (int64_t)requestOriginLanguage
{
  return self->_requestOriginLanguage;
}

- (int64_t)requestOriginLocale
{
  return self->_requestOriginLocale;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals;
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestOriginLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals setRequestOriginLocale:](v5, "setRequestOriginLocale:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"requestOriginLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals setRequestOriginLanguage:](v5, "setRequestOriginLanguage:", [v7 longLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"communicationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals setCommunicationType:](v5, "setCommunicationType:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"appResolutionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals setAppResolutionType:](v5, "setAppResolutionType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"userPersona"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals setUserPersona:](v5, "setUserPersona:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    unsigned int v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals *)self appResolutionType]- 1;
    if (v5 > 9) {
      v6 = @"INFERENCEAPPRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBAEA8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"appResolutionType"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals communicationType](self, "communicationType"));
    [v3 setObject:v7 forKeyedSubscript:@"communicationType"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
LABEL_13:
      v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals requestOriginLocale](self, "requestOriginLocale"));
      [v3 setObject:v9 forKeyedSubscript:@"requestOriginLocale"];

      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        goto LABEL_18;
      }
LABEL_14:
      unsigned int v10 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals *)self userPersona]
          - 1;
      if (v10 > 5) {
        v11 = @"INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN";
      }
      else {
        v11 = off_1E5EBAEF8[v10];
      }
      [v3 setObject:v11 forKeyedSubscript:@"userPersona"];
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_8;
  }
  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals requestOriginLanguage](self, "requestOriginLanguage"));
  [v3 setObject:v8 forKeyedSubscript:@"requestOriginLanguage"];

  char has = (char)self->_has;
  if (has) {
    goto LABEL_13;
  }
LABEL_9:
  if ((has & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_18:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_requestOriginLocale;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_requestOriginLanguage;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_communicationType;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_appResolutionType;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_userPersona;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $FDCC6C41282560788C0D4E75FB514817 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int64_t requestOriginLocale = self->_requestOriginLocale;
    if (requestOriginLocale != [v4 requestOriginLocale]) {
      goto LABEL_22;
    }
    $FDCC6C41282560788C0D4E75FB514817 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int64_t requestOriginLanguage = self->_requestOriginLanguage;
    if (requestOriginLanguage != [v4 requestOriginLanguage]) {
      goto LABEL_22;
    }
    $FDCC6C41282560788C0D4E75FB514817 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    int64_t communicationType = self->_communicationType;
    if (communicationType != [v4 communicationType]) {
      goto LABEL_22;
    }
    $FDCC6C41282560788C0D4E75FB514817 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    int appResolutionType = self->_appResolutionType;
    if (appResolutionType == [v4 appResolutionType])
    {
      $FDCC6C41282560788C0D4E75FB514817 has = self->_has;
      unsigned int v6 = v4[40];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    int userPersona = self->_userPersona;
    if (userPersona != [v4 userPersona]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserPersona
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasUserPersona:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUserPersona
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setUserPersona:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int userPersona = a3;
}

- (void)deleteAppResolutionType
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAppResolutionType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppResolutionType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppResolutionType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int appResolutionType = a3;
}

- (void)deleteCommunicationType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCommunicationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommunicationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCommunicationType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t communicationType = a3;
}

- (void)deleteRequestOriginLanguage
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRequestOriginLanguage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestOriginLanguage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestOriginLanguage:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t requestOriginLanguage = a3;
}

- (void)deleteRequestOriginLocale
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRequestOriginLocale:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestOriginLocale
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestOriginLocale:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t requestOriginLocale = a3;
}

@end