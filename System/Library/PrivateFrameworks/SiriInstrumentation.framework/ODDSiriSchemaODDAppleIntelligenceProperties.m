@interface ODDSiriSchemaODDAppleIntelligenceProperties
- (BOOL)hasChatGPTAccountType;
- (BOOL)hasIsAppleIntelligenceAvailable;
- (BOOL)hasIsAppleIntelligenceEnabled;
- (BOOL)hasIsAppleIntelligenceHardwareCapable;
- (BOOL)hasIsChatGPTConfirmationAlwaysRequired;
- (BOOL)hasIsChatGPTEnabled;
- (BOOL)hasIsChatGPTSetUpPrompts;
- (BOOL)hasIsRecordAppleIntelligenceActivity;
- (BOOL)isAppleIntelligenceAvailable;
- (BOOL)isAppleIntelligenceEnabled;
- (BOOL)isAppleIntelligenceHardwareCapable;
- (BOOL)isChatGPTConfirmationAlwaysRequired;
- (BOOL)isChatGPTEnabled;
- (BOOL)isChatGPTSetUpPrompts;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRecordAppleIntelligenceActivity;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAppleIntelligenceProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAppleIntelligenceProperties)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)chatGPTAccountType;
- (unint64_t)hash;
- (void)deleteChatGPTAccountType;
- (void)deleteIsAppleIntelligenceAvailable;
- (void)deleteIsAppleIntelligenceEnabled;
- (void)deleteIsAppleIntelligenceHardwareCapable;
- (void)deleteIsChatGPTConfirmationAlwaysRequired;
- (void)deleteIsChatGPTEnabled;
- (void)deleteIsChatGPTSetUpPrompts;
- (void)deleteIsRecordAppleIntelligenceActivity;
- (void)setChatGPTAccountType:(int)a3;
- (void)setHasChatGPTAccountType:(BOOL)a3;
- (void)setHasIsAppleIntelligenceAvailable:(BOOL)a3;
- (void)setHasIsAppleIntelligenceEnabled:(BOOL)a3;
- (void)setHasIsAppleIntelligenceHardwareCapable:(BOOL)a3;
- (void)setHasIsChatGPTConfirmationAlwaysRequired:(BOOL)a3;
- (void)setHasIsChatGPTEnabled:(BOOL)a3;
- (void)setHasIsChatGPTSetUpPrompts:(BOOL)a3;
- (void)setHasIsRecordAppleIntelligenceActivity:(BOOL)a3;
- (void)setIsAppleIntelligenceAvailable:(BOOL)a3;
- (void)setIsAppleIntelligenceEnabled:(BOOL)a3;
- (void)setIsAppleIntelligenceHardwareCapable:(BOOL)a3;
- (void)setIsChatGPTConfirmationAlwaysRequired:(BOOL)a3;
- (void)setIsChatGPTEnabled:(BOOL)a3;
- (void)setIsChatGPTSetUpPrompts:(BOOL)a3;
- (void)setIsRecordAppleIntelligenceActivity:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAppleIntelligenceProperties

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isChatGPTSetUpPrompts
{
  return self->_isChatGPTSetUpPrompts;
}

- (int)chatGPTAccountType
{
  return self->_chatGPTAccountType;
}

- (BOOL)isChatGPTConfirmationAlwaysRequired
{
  return self->_isChatGPTConfirmationAlwaysRequired;
}

- (BOOL)isChatGPTEnabled
{
  return self->_isChatGPTEnabled;
}

- (BOOL)isAppleIntelligenceAvailable
{
  return self->_isAppleIntelligenceAvailable;
}

- (BOOL)isAppleIntelligenceHardwareCapable
{
  return self->_isAppleIntelligenceHardwareCapable;
}

- (BOOL)isRecordAppleIntelligenceActivity
{
  return self->_isRecordAppleIntelligenceActivity;
}

- (BOOL)isAppleIntelligenceEnabled
{
  return self->_isAppleIntelligenceEnabled;
}

- (ODDSiriSchemaODDAppleIntelligenceProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODDSiriSchemaODDAppleIntelligenceProperties;
  v5 = [(ODDSiriSchemaODDAppleIntelligenceProperties *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAppleIntelligenceEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAppleIntelligenceProperties setIsAppleIntelligenceEnabled:](v5, "setIsAppleIntelligenceEnabled:", [v6 BOOLValue]);
    }
    v16 = v6;
    v7 = [v4 objectForKeyedSubscript:@"isRecordAppleIntelligenceActivity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAppleIntelligenceProperties setIsRecordAppleIntelligenceActivity:](v5, "setIsRecordAppleIntelligenceActivity:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isAppleIntelligenceHardwareCapable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAppleIntelligenceProperties setIsAppleIntelligenceHardwareCapable:](v5, "setIsAppleIntelligenceHardwareCapable:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isAppleIntelligenceAvailable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAppleIntelligenceProperties setIsAppleIntelligenceAvailable:](v5, "setIsAppleIntelligenceAvailable:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isChatGPTEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAppleIntelligenceProperties setIsChatGPTEnabled:](v5, "setIsChatGPTEnabled:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isChatGPTConfirmationAlwaysRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAppleIntelligenceProperties setIsChatGPTConfirmationAlwaysRequired:](v5, "setIsChatGPTConfirmationAlwaysRequired:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"chatGPTAccountType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAppleIntelligenceProperties setChatGPTAccountType:](v5, "setChatGPTAccountType:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"isChatGPTSetUpPrompts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAppleIntelligenceProperties setIsChatGPTSetUpPrompts:](v5, "setIsChatGPTSetUpPrompts:", [v13 BOOLValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAppleIntelligenceProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAppleIntelligenceProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAppleIntelligenceProperties *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 0x40) != 0)
  {
    unsigned int v5 = [(ODDSiriSchemaODDAppleIntelligenceProperties *)self chatGPTAccountType] - 1;
    if (v5 > 2) {
      v6 = @"GATACCOUNTTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EC0C00[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"chatGPTAccountType"];
    char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  }
  if ((v4 & 8) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAppleIntelligenceProperties isAppleIntelligenceAvailable](self, "isAppleIntelligenceAvailable"));
    [v3 setObject:v9 forKeyedSubscript:@"isAppleIntelligenceAvailable"];

    char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
    if ((v4 & 1) == 0)
    {
LABEL_8:
      if ((v4 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_8;
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAppleIntelligenceProperties isAppleIntelligenceEnabled](self, "isAppleIntelligenceEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"isAppleIntelligenceEnabled"];

  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 4) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAppleIntelligenceProperties isAppleIntelligenceHardwareCapable](self, "isAppleIntelligenceHardwareCapable"));
  [v3 setObject:v11 forKeyedSubscript:@"isAppleIntelligenceHardwareCapable"];

  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAppleIntelligenceProperties isChatGPTConfirmationAlwaysRequired](self, "isChatGPTConfirmationAlwaysRequired"));
  [v3 setObject:v12 forKeyedSubscript:@"isChatGPTConfirmationAlwaysRequired"];

  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_11:
    if ((v4 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAppleIntelligenceProperties isChatGPTEnabled](self, "isChatGPTEnabled"));
  [v3 setObject:v13 forKeyedSubscript:@"isChatGPTEnabled"];

  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 0x80) == 0)
  {
LABEL_12:
    if ((v4 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_22:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAppleIntelligenceProperties isChatGPTSetUpPrompts](self, "isChatGPTSetUpPrompts"));
  [v3 setObject:v14 forKeyedSubscript:@"isChatGPTSetUpPrompts"];

  if ((*(&self->_isChatGPTSetUpPrompts + 1) & 2) != 0)
  {
LABEL_13:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAppleIntelligenceProperties isRecordAppleIntelligenceActivity](self, "isRecordAppleIntelligenceActivity"));
    [v3 setObject:v7 forKeyedSubscript:@"isRecordAppleIntelligenceActivity"];
  }
LABEL_14:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isChatGPTSetUpPrompts + 1))
  {
    uint64_t v2 = 2654435761 * self->_isAppleIntelligenceEnabled;
    if ((*(&self->_isChatGPTSetUpPrompts + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isRecordAppleIntelligenceActivity;
      if ((*(&self->_isChatGPTSetUpPrompts + 1) & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(&self->_isChatGPTSetUpPrompts + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(&self->_isChatGPTSetUpPrompts + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isAppleIntelligenceHardwareCapable;
    if ((*(&self->_isChatGPTSetUpPrompts + 1) & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(&self->_isChatGPTSetUpPrompts + 1) & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isAppleIntelligenceAvailable;
    if ((*(&self->_isChatGPTSetUpPrompts + 1) & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(&self->_isChatGPTSetUpPrompts + 1) & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_isChatGPTEnabled;
    if ((*(&self->_isChatGPTSetUpPrompts + 1) & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(&self->_isChatGPTSetUpPrompts + 1) & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_isChatGPTConfirmationAlwaysRequired;
    if ((*(&self->_isChatGPTSetUpPrompts + 1) & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if (*(&self->_isChatGPTSetUpPrompts + 1) < 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(&self->_isChatGPTSetUpPrompts + 1) & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_chatGPTAccountType;
  if ((*(&self->_isChatGPTSetUpPrompts + 1) & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_isChatGPTSetUpPrompts;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1);
  unsigned int v6 = v4[21];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_34;
  }
  if (v5)
  {
    int isAppleIntelligenceEnabled = self->_isAppleIntelligenceEnabled;
    if (isAppleIntelligenceEnabled != [v4 isAppleIntelligenceEnabled]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1);
    unsigned int v6 = v4[21];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v8)
  {
    int isRecordAppleIntelligenceActivity = self->_isRecordAppleIntelligenceActivity;
    if (isRecordAppleIntelligenceActivity != [v4 isRecordAppleIntelligenceActivity]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1);
    unsigned int v6 = v4[21];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_34;
  }
  if (v10)
  {
    int isAppleIntelligenceHardwareCapable = self->_isAppleIntelligenceHardwareCapable;
    if (isAppleIntelligenceHardwareCapable != [v4 isAppleIntelligenceHardwareCapable]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1);
    unsigned int v6 = v4[21];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_34;
  }
  if (v12)
  {
    int isAppleIntelligenceAvailable = self->_isAppleIntelligenceAvailable;
    if (isAppleIntelligenceAvailable != [v4 isAppleIntelligenceAvailable]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1);
    unsigned int v6 = v4[21];
  }
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_34;
  }
  if (v14)
  {
    int isChatGPTEnabled = self->_isChatGPTEnabled;
    if (isChatGPTEnabled != [v4 isChatGPTEnabled]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1);
    unsigned int v6 = v4[21];
  }
  int v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_34;
  }
  if (v16)
  {
    int isChatGPTConfirmationAlwaysRequired = self->_isChatGPTConfirmationAlwaysRequired;
    if (isChatGPTConfirmationAlwaysRequired != [v4 isChatGPTConfirmationAlwaysRequired]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1);
    unsigned int v6 = v4[21];
  }
  int v18 = (v5 >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_34;
  }
  if (v18)
  {
    int chatGPTAccountType = self->_chatGPTAccountType;
    if (chatGPTAccountType == [v4 chatGPTAccountType])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1);
      unsigned int v6 = v4[21];
      goto LABEL_30;
    }
LABEL_34:
    BOOL v21 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ v5) & 0x80) != 0) {
    goto LABEL_34;
  }
  if ((v5 & 0x80) != 0)
  {
    int isChatGPTSetUpPrompts = self->_isChatGPTSetUpPrompts;
    if (isChatGPTSetUpPrompts != [v4 isChatGPTSetUpPrompts]) {
      goto LABEL_34;
    }
  }
  BOOL v21 = 1;
LABEL_35:

  return v21;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if (v4)
  {
    PBDataWriterWriteBOOLField();
    char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(&self->_isChatGPTSetUpPrompts + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteInt32Field();
    if ((*(&self->_isChatGPTSetUpPrompts + 1) & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isChatGPTSetUpPrompts + 1);
  if ((v4 & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((v4 & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAppleIntelligencePropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsChatGPTSetUpPrompts
{
  *(&self->_isChatGPTSetUpPrompts + 1) &= ~0x80u;
}

- (void)setHasIsChatGPTSetUpPrompts:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isChatGPTSetUpPrompts + 1) = v3 & 0x80 | *(&self->_isChatGPTSetUpPrompts + 1) & 0x7F;
}

- (BOOL)hasIsChatGPTSetUpPrompts
{
  return *((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1) >> 7;
}

- (void)setIsChatGPTSetUpPrompts:(BOOL)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) |= 0x80u;
  self->_int isChatGPTSetUpPrompts = a3;
}

- (void)deleteChatGPTAccountType
{
  *(&self->_isChatGPTSetUpPrompts + 1) &= ~0x40u;
}

- (void)setHasChatGPTAccountType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isChatGPTSetUpPrompts + 1) = *(&self->_isChatGPTSetUpPrompts + 1) & 0xBF | v3;
}

- (BOOL)hasChatGPTAccountType
{
  return (*((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1) >> 6) & 1;
}

- (void)setChatGPTAccountType:(int)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) |= 0x40u;
  self->_int chatGPTAccountType = a3;
}

- (void)deleteIsChatGPTConfirmationAlwaysRequired
{
  *(&self->_isChatGPTSetUpPrompts + 1) &= ~0x20u;
}

- (void)setHasIsChatGPTConfirmationAlwaysRequired:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isChatGPTSetUpPrompts + 1) = *(&self->_isChatGPTSetUpPrompts + 1) & 0xDF | v3;
}

- (BOOL)hasIsChatGPTConfirmationAlwaysRequired
{
  return (*((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1) >> 5) & 1;
}

- (void)setIsChatGPTConfirmationAlwaysRequired:(BOOL)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) |= 0x20u;
  self->_int isChatGPTConfirmationAlwaysRequired = a3;
}

- (void)deleteIsChatGPTEnabled
{
  *(&self->_isChatGPTSetUpPrompts + 1) &= ~0x10u;
}

- (void)setHasIsChatGPTEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isChatGPTSetUpPrompts + 1) = *(&self->_isChatGPTSetUpPrompts + 1) & 0xEF | v3;
}

- (BOOL)hasIsChatGPTEnabled
{
  return (*((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1) >> 4) & 1;
}

- (void)setIsChatGPTEnabled:(BOOL)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) |= 0x10u;
  self->_int isChatGPTEnabled = a3;
}

- (void)deleteIsAppleIntelligenceAvailable
{
  *(&self->_isChatGPTSetUpPrompts + 1) &= ~8u;
}

- (void)setHasIsAppleIntelligenceAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isChatGPTSetUpPrompts + 1) = *(&self->_isChatGPTSetUpPrompts + 1) & 0xF7 | v3;
}

- (BOOL)hasIsAppleIntelligenceAvailable
{
  return (*((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1) >> 3) & 1;
}

- (void)setIsAppleIntelligenceAvailable:(BOOL)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) |= 8u;
  self->_int isAppleIntelligenceAvailable = a3;
}

- (void)deleteIsAppleIntelligenceHardwareCapable
{
  *(&self->_isChatGPTSetUpPrompts + 1) &= ~4u;
}

- (void)setHasIsAppleIntelligenceHardwareCapable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isChatGPTSetUpPrompts + 1) = *(&self->_isChatGPTSetUpPrompts + 1) & 0xFB | v3;
}

- (BOOL)hasIsAppleIntelligenceHardwareCapable
{
  return (*((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1) >> 2) & 1;
}

- (void)setIsAppleIntelligenceHardwareCapable:(BOOL)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) |= 4u;
  self->_int isAppleIntelligenceHardwareCapable = a3;
}

- (void)deleteIsRecordAppleIntelligenceActivity
{
  *(&self->_isChatGPTSetUpPrompts + 1) &= ~2u;
}

- (void)setHasIsRecordAppleIntelligenceActivity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isChatGPTSetUpPrompts + 1) = *(&self->_isChatGPTSetUpPrompts + 1) & 0xFD | v3;
}

- (BOOL)hasIsRecordAppleIntelligenceActivity
{
  return (*((unsigned __int8 *)&self->_isChatGPTSetUpPrompts + 1) >> 1) & 1;
}

- (void)setIsRecordAppleIntelligenceActivity:(BOOL)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) |= 2u;
  self->_int isRecordAppleIntelligenceActivity = a3;
}

- (void)deleteIsAppleIntelligenceEnabled
{
  *(&self->_isChatGPTSetUpPrompts + 1) &= ~1u;
}

- (void)setHasIsAppleIntelligenceEnabled:(BOOL)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) = *(&self->_isChatGPTSetUpPrompts + 1) & 0xFE | a3;
}

- (BOOL)hasIsAppleIntelligenceEnabled
{
  return *(&self->_isChatGPTSetUpPrompts + 1);
}

- (void)setIsAppleIntelligenceEnabled:(BOOL)a3
{
  *(&self->_isChatGPTSetUpPrompts + 1) |= 1u;
  self->_int isAppleIntelligenceEnabled = a3;
}

@end