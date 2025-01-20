@interface PSESchemaPSEAppIntentInteractionEngagement
- (BOOL)hasAppIntentName;
- (BOOL)hasFollowUpActionType;
- (BOOL)hasFollowUpEntityComparison;
- (BOOL)hasIsFirstPartyApp;
- (BOOL)hasIsSiriResultUseful;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstPartyApp;
- (BOOL)isSiriResultUseful;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)appIntentName;
- (PSESchemaPSEAppIntentInteractionEngagement)initWithDictionary:(id)a3;
- (PSESchemaPSEAppIntentInteractionEngagement)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)followUpActionType;
- (int)followUpEntityComparison;
- (unint64_t)hash;
- (void)deleteAppIntentName;
- (void)deleteFollowUpActionType;
- (void)deleteFollowUpEntityComparison;
- (void)deleteIsFirstPartyApp;
- (void)deleteIsSiriResultUseful;
- (void)setAppIntentName:(id)a3;
- (void)setFollowUpActionType:(int)a3;
- (void)setFollowUpEntityComparison:(int)a3;
- (void)setHasAppIntentName:(BOOL)a3;
- (void)setHasFollowUpActionType:(BOOL)a3;
- (void)setHasFollowUpEntityComparison:(BOOL)a3;
- (void)setHasIsFirstPartyApp:(BOOL)a3;
- (void)setHasIsSiriResultUseful:(BOOL)a3;
- (void)setIsFirstPartyApp:(BOOL)a3;
- (void)setIsSiriResultUseful:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSEAppIntentInteractionEngagement

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAppIntentName:(BOOL)a3
{
  *(&self->_isFirstPartyApp + 2) = a3;
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (BOOL)isSiriResultUseful
{
  return self->_isSiriResultUseful;
}

- (int)followUpEntityComparison
{
  return self->_followUpEntityComparison;
}

- (int)followUpActionType
{
  return self->_followUpActionType;
}

- (void)setAppIntentName:(id)a3
{
}

- (NSString)appIntentName
{
  return self->_appIntentName;
}

- (PSESchemaPSEAppIntentInteractionEngagement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PSESchemaPSEAppIntentInteractionEngagement;
  v5 = [(PSESchemaPSEAppIntentInteractionEngagement *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appIntentName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PSESchemaPSEAppIntentInteractionEngagement *)v5 setAppIntentName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"followUpActionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEAppIntentInteractionEngagement setFollowUpActionType:](v5, "setFollowUpActionType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"followUpEntityComparison"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEAppIntentInteractionEngagement setFollowUpEntityComparison:](v5, "setFollowUpEntityComparison:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isSiriResultUseful"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEAppIntentInteractionEngagement setIsSiriResultUseful:](v5, "setIsSiriResultUseful:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isFirstPartyApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEAppIntentInteractionEngagement setIsFirstPartyApp:](v5, "setIsFirstPartyApp:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (PSESchemaPSEAppIntentInteractionEngagement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSEAppIntentInteractionEngagement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSEAppIntentInteractionEngagement *)self dictionaryRepresentation];
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
  if (self->_appIntentName)
  {
    id v4 = [(PSESchemaPSEAppIntentInteractionEngagement *)self appIntentName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appIntentName"];
  }
  char v6 = *(&self->_isFirstPartyApp + 1);
  if (v6)
  {
    unsigned int v7 = [(PSESchemaPSEAppIntentInteractionEngagement *)self followUpActionType] - 1;
    if (v7 > 0x21) {
      v8 = @"PSEAPPINTENTFOLLOWUPACTIONTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EBFEF0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"followUpActionType"];
    char v6 = *(&self->_isFirstPartyApp + 1);
  }
  if ((v6 & 2) != 0)
  {
    unsigned int v9 = [(PSESchemaPSEAppIntentInteractionEngagement *)self followUpEntityComparison] - 1;
    if (v9 > 2) {
      v10 = @"PSEAPPINTENTFOLLOWUPENTITYCOMPARISON_UNKNOWN";
    }
    else {
      v10 = off_1E5EC0000[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"followUpEntityComparison"];
    char v6 = *(&self->_isFirstPartyApp + 1);
  }
  if ((v6 & 8) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEAppIntentInteractionEngagement isFirstPartyApp](self, "isFirstPartyApp"));
    [v3 setObject:v11 forKeyedSubscript:@"isFirstPartyApp"];

    char v6 = *(&self->_isFirstPartyApp + 1);
  }
  if ((v6 & 4) != 0)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEAppIntentInteractionEngagement isSiriResultUseful](self, "isSiriResultUseful"));
    [v3 setObject:v12 forKeyedSubscript:@"isSiriResultUseful"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appIntentName hash];
  if (*(&self->_isFirstPartyApp + 1))
  {
    uint64_t v4 = 2654435761 * self->_followUpActionType;
    if ((*(&self->_isFirstPartyApp + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_followUpEntityComparison;
      if ((*(&self->_isFirstPartyApp + 1) & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(&self->_isFirstPartyApp + 1) & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(&self->_isFirstPartyApp + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(&self->_isFirstPartyApp + 1) & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isSiriResultUseful;
  if ((*(&self->_isFirstPartyApp + 1) & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_isFirstPartyApp;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(PSESchemaPSEAppIntentInteractionEngagement *)self appIntentName];
  uint64_t v6 = [v4 appIntentName];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(PSESchemaPSEAppIntentInteractionEngagement *)self appIntentName];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    v10 = [(PSESchemaPSEAppIntentInteractionEngagement *)self appIntentName];
    v11 = [v4 appIntentName];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  unsigned int v13 = *((unsigned __int8 *)&self->_isFirstPartyApp + 1);
  unsigned int v14 = v4[26];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  if (v13)
  {
    int followUpActionType = self->_followUpActionType;
    if (followUpActionType != [v4 followUpActionType]) {
      goto LABEL_24;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isFirstPartyApp + 1);
    unsigned int v14 = v4[26];
  }
  int v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v16)
  {
    int followUpEntityComparison = self->_followUpEntityComparison;
    if (followUpEntityComparison != [v4 followUpEntityComparison]) {
      goto LABEL_24;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isFirstPartyApp + 1);
    unsigned int v14 = v4[26];
  }
  int v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_24;
  }
  if (v18)
  {
    int isSiriResultUseful = self->_isSiriResultUseful;
    if (isSiriResultUseful == [v4 isSiriResultUseful])
    {
      unsigned int v13 = *((unsigned __int8 *)&self->_isFirstPartyApp + 1);
      unsigned int v14 = v4[26];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  int v20 = (v13 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    int isFirstPartyApp = self->_isFirstPartyApp;
    if (isFirstPartyApp != [v4 isFirstPartyApp]) {
      goto LABEL_24;
    }
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PSESchemaPSEAppIntentInteractionEngagement *)self appIntentName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char v5 = *(&self->_isFirstPartyApp + 1);
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    char v5 = *(&self->_isFirstPartyApp + 1);
  }
  uint64_t v6 = v7;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v7;
    char v5 = *(&self->_isFirstPartyApp + 1);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v6 = v7;
  if ((*(&self->_isFirstPartyApp + 1) & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    uint64_t v6 = v7;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEAppIntentInteractionEngagementReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsFirstPartyApp
{
  *(&self->_isFirstPartyApp + 1) &= ~8u;
}

- (void)setHasIsFirstPartyApp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isFirstPartyApp + 1) = *(&self->_isFirstPartyApp + 1) & 0xF7 | v3;
}

- (BOOL)hasIsFirstPartyApp
{
  return (*((unsigned __int8 *)&self->_isFirstPartyApp + 1) >> 3) & 1;
}

- (void)setIsFirstPartyApp:(BOOL)a3
{
  *(&self->_isFirstPartyApp + 1) |= 8u;
  self->_int isFirstPartyApp = a3;
}

- (void)deleteIsSiriResultUseful
{
  *(&self->_isFirstPartyApp + 1) &= ~4u;
}

- (void)setHasIsSiriResultUseful:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isFirstPartyApp + 1) = *(&self->_isFirstPartyApp + 1) & 0xFB | v3;
}

- (BOOL)hasIsSiriResultUseful
{
  return (*((unsigned __int8 *)&self->_isFirstPartyApp + 1) >> 2) & 1;
}

- (void)setIsSiriResultUseful:(BOOL)a3
{
  *(&self->_isFirstPartyApp + 1) |= 4u;
  self->_int isSiriResultUseful = a3;
}

- (void)deleteFollowUpEntityComparison
{
  *(&self->_isFirstPartyApp + 1) &= ~2u;
}

- (void)setHasFollowUpEntityComparison:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isFirstPartyApp + 1) = *(&self->_isFirstPartyApp + 1) & 0xFD | v3;
}

- (BOOL)hasFollowUpEntityComparison
{
  return (*((unsigned __int8 *)&self->_isFirstPartyApp + 1) >> 1) & 1;
}

- (void)setFollowUpEntityComparison:(int)a3
{
  *(&self->_isFirstPartyApp + 1) |= 2u;
  self->_int followUpEntityComparison = a3;
}

- (void)deleteFollowUpActionType
{
  *(&self->_isFirstPartyApp + 1) &= ~1u;
}

- (void)setHasFollowUpActionType:(BOOL)a3
{
  *(&self->_isFirstPartyApp + 1) = *(&self->_isFirstPartyApp + 1) & 0xFE | a3;
}

- (BOOL)hasFollowUpActionType
{
  return *(&self->_isFirstPartyApp + 1);
}

- (void)setFollowUpActionType:(int)a3
{
  *(&self->_isFirstPartyApp + 1) |= 1u;
  self->_int followUpActionType = a3;
}

- (void)deleteAppIntentName
{
}

- (BOOL)hasAppIntentName
{
  return self->_appIntentName != 0;
}

@end