@interface DIMSchemaDIMDataSharingSettings
- (BOOL)hasIsAppAnalyticsEnabled;
- (BOOL)hasIsDiagnosticsAndUsageEnabled;
- (BOOL)isAppAnalyticsEnabled;
- (BOOL)isDiagnosticsAndUsageEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DIMSchemaDIMDataSharingSettings)initWithDictionary:(id)a3;
- (DIMSchemaDIMDataSharingSettings)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsAppAnalyticsEnabled;
- (void)deleteIsDiagnosticsAndUsageEnabled;
- (void)setHasIsAppAnalyticsEnabled:(BOOL)a3;
- (void)setHasIsDiagnosticsAndUsageEnabled:(BOOL)a3;
- (void)setIsAppAnalyticsEnabled:(BOOL)a3;
- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation DIMSchemaDIMDataSharingSettings

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isAppAnalyticsEnabled
{
  return self->_isAppAnalyticsEnabled;
}

- (BOOL)isDiagnosticsAndUsageEnabled
{
  return self->_isDiagnosticsAndUsageEnabled;
}

- (DIMSchemaDIMDataSharingSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DIMSchemaDIMDataSharingSettings;
  v5 = [(DIMSchemaDIMDataSharingSettings *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDiagnosticsAndUsageEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDataSharingSettings setIsDiagnosticsAndUsageEnabled:](v5, "setIsDiagnosticsAndUsageEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isAppAnalyticsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDataSharingSettings setIsAppAnalyticsEnabled:](v5, "setIsAppAnalyticsEnabled:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (DIMSchemaDIMDataSharingSettings)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DIMSchemaDIMDataSharingSettings *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DIMSchemaDIMDataSharingSettings *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isAppAnalyticsEnabled + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[DIMSchemaDIMDataSharingSettings isAppAnalyticsEnabled](self, "isAppAnalyticsEnabled"));
    [v3 setObject:v5 forKeyedSubscript:@"isAppAnalyticsEnabled"];

    char v4 = *(&self->_isAppAnalyticsEnabled + 1);
  }
  if (v4)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DIMSchemaDIMDataSharingSettings isDiagnosticsAndUsageEnabled](self, "isDiagnosticsAndUsageEnabled"));
    [v3 setObject:v6 forKeyedSubscript:@"isDiagnosticsAndUsageEnabled"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isAppAnalyticsEnabled + 1))
  {
    uint64_t v2 = 2654435761 * self->_isDiagnosticsAndUsageEnabled;
    if ((*(&self->_isAppAnalyticsEnabled + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_isAppAnalyticsEnabled + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isAppAnalyticsEnabled;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isAppAnalyticsEnabled + 1);
  unsigned int v6 = v4[10];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int isDiagnosticsAndUsageEnabled = self->_isDiagnosticsAndUsageEnabled;
    if (isDiagnosticsAndUsageEnabled != [v4 isDiagnosticsAndUsageEnabled])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isAppAnalyticsEnabled + 1);
    unsigned int v6 = v4[10];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int isAppAnalyticsEnabled = self->_isAppAnalyticsEnabled;
    if (isAppAnalyticsEnabled != [v4 isAppAnalyticsEnabled]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_isAppAnalyticsEnabled + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char v5 = *(&self->_isAppAnalyticsEnabled + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMDataSharingSettingsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsAppAnalyticsEnabled
{
  *(&self->_isAppAnalyticsEnabled + 1) &= ~2u;
}

- (void)setHasIsAppAnalyticsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAppAnalyticsEnabled + 1) = *(&self->_isAppAnalyticsEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasIsAppAnalyticsEnabled
{
  return (*((unsigned __int8 *)&self->_isAppAnalyticsEnabled + 1) >> 1) & 1;
}

- (void)setIsAppAnalyticsEnabled:(BOOL)a3
{
  *(&self->_isAppAnalyticsEnabled + 1) |= 2u;
  self->_int isAppAnalyticsEnabled = a3;
}

- (void)deleteIsDiagnosticsAndUsageEnabled
{
  *(&self->_isAppAnalyticsEnabled + 1) &= ~1u;
}

- (void)setHasIsDiagnosticsAndUsageEnabled:(BOOL)a3
{
  *(&self->_isAppAnalyticsEnabled + 1) = *(&self->_isAppAnalyticsEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsDiagnosticsAndUsageEnabled
{
  return *(&self->_isAppAnalyticsEnabled + 1);
}

- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3
{
  *(&self->_isAppAnalyticsEnabled + 1) |= 1u;
  self->_int isDiagnosticsAndUsageEnabled = a3;
}

@end