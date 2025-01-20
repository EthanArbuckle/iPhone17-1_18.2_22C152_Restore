@interface FLOWSchemaFLOWPhoneCallContext
- (BOOL)hasEmergencyContext;
- (BOOL)hasIsThirdPartyFaceTime;
- (BOOL)hasPhoneCallAppType;
- (BOOL)hasPhoneCallType;
- (BOOL)hasSearchCallHistoryIntent;
- (BOOL)hasUserPersona;
- (BOOL)isEqual:(id)a3;
- (BOOL)isThirdPartyFaceTime;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWPhoneCallContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWPhoneCallContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWPhoneCallEmergencyContext)emergencyContext;
- (NSArray)personTypes;
- (NSArray)recipientTypes;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)personTypeAtIndex:(unint64_t)a3;
- (int)phoneCallAppType;
- (int)phoneCallType;
- (int)recipientTypeAtIndex:(unint64_t)a3;
- (int)searchCallHistoryIntent;
- (int)userPersona;
- (unint64_t)hash;
- (unint64_t)personTypeCount;
- (unint64_t)recipientTypeCount;
- (void)addPersonType:(int)a3;
- (void)addRecipientType:(int)a3;
- (void)clearPersonType;
- (void)clearRecipientType;
- (void)deleteEmergencyContext;
- (void)deleteIsThirdPartyFaceTime;
- (void)deletePhoneCallAppType;
- (void)deletePhoneCallType;
- (void)deleteSearchCallHistoryIntent;
- (void)deleteUserPersona;
- (void)setEmergencyContext:(id)a3;
- (void)setHasEmergencyContext:(BOOL)a3;
- (void)setHasIsThirdPartyFaceTime:(BOOL)a3;
- (void)setHasPhoneCallAppType:(BOOL)a3;
- (void)setHasPhoneCallType:(BOOL)a3;
- (void)setHasSearchCallHistoryIntent:(BOOL)a3;
- (void)setHasUserPersona:(BOOL)a3;
- (void)setIsThirdPartyFaceTime:(BOOL)a3;
- (void)setPersonTypes:(id)a3;
- (void)setPhoneCallAppType:(int)a3;
- (void)setPhoneCallType:(int)a3;
- (void)setRecipientTypes:(id)a3;
- (void)setSearchCallHistoryIntent:(int)a3;
- (void)setUserPersona:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWPhoneCallContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FLOWSchemaFLOWPhoneCallContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWPhoneCallContext *)self emergencyContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(FLOWSchemaFLOWPhoneCallContext *)self deleteEmergencyContext];
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
  objc_storeStrong((id *)&self->_personTypes, 0);
  objc_storeStrong((id *)&self->_emergencyContext, 0);
  objc_storeStrong((id *)&self->_recipientTypes, 0);
}

- (void)setHasEmergencyContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)userPersona
{
  return self->_userPersona;
}

- (int)searchCallHistoryIntent
{
  return self->_searchCallHistoryIntent;
}

- (BOOL)isThirdPartyFaceTime
{
  return self->_isThirdPartyFaceTime;
}

- (void)setPersonTypes:(id)a3
{
}

- (NSArray)personTypes
{
  return self->_personTypes;
}

- (void)setEmergencyContext:(id)a3
{
}

- (FLOWSchemaFLOWPhoneCallEmergencyContext)emergencyContext
{
  return self->_emergencyContext;
}

- (int)phoneCallAppType
{
  return self->_phoneCallAppType;
}

- (void)setRecipientTypes:(id)a3
{
}

- (NSArray)recipientTypes
{
  return self->_recipientTypes;
}

- (int)phoneCallType
{
  return self->_phoneCallType;
}

- (FLOWSchemaFLOWPhoneCallContext)initWithDictionary:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)FLOWSchemaFLOWPhoneCallContext;
  v5 = [(FLOWSchemaFLOWPhoneCallContext *)&v42 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"phoneCallType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPhoneCallContext setPhoneCallType:](v5, "setPhoneCallType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"recipientType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v6;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      objc_super v9 = v7;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v39;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v39 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWPhoneCallContext addRecipientType:](v5, "addRecipientType:", [v15 intValue]);
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v12);
      }

      v6 = v8;
      v7 = v9;
    }
    v16 = [v4 objectForKeyedSubscript:@"phoneCallAppType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPhoneCallContext setPhoneCallAppType:](v5, "setPhoneCallAppType:", [v16 intValue]);
    }
    v33 = v16;
    v17 = [v4 objectForKeyedSubscript:@"emergencyContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[FLOWSchemaFLOWPhoneCallEmergencyContext alloc] initWithDictionary:v17];
      [(FLOWSchemaFLOWPhoneCallContext *)v5 setEmergencyContext:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"personType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v7;
      v32 = v6;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v35;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v34 + 1) + 8 * v24);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWPhoneCallContext addPersonType:](v5, "addPersonType:", [v25 intValue]);
            }
            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }
        while (v22);
      }

      v7 = v31;
      v6 = v32;
    }
    v26 = [v4 objectForKeyedSubscript:@"isThirdPartyFaceTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPhoneCallContext setIsThirdPartyFaceTime:](v5, "setIsThirdPartyFaceTime:", [v26 BOOLValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"searchCallHistoryIntent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPhoneCallContext setSearchCallHistoryIntent:](v5, "setSearchCallHistoryIntent:", [v27 intValue]);
    }
    v28 = [v4 objectForKeyedSubscript:@"userPersona"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPhoneCallContext setUserPersona:](v5, "setUserPersona:", [v28 intValue]);
    }
    v29 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWPhoneCallContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWPhoneCallContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWPhoneCallContext *)self dictionaryRepresentation];
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
  if (self->_emergencyContext)
  {
    id v4 = [(FLOWSchemaFLOWPhoneCallContext *)self emergencyContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"emergencyContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"emergencyContext"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWPhoneCallContext isThirdPartyFaceTime](self, "isThirdPartyFaceTime"));
    [v3 setObject:v7 forKeyedSubscript:@"isThirdPartyFaceTime"];
  }
  if ([(NSArray *)self->_personTypes count])
  {
    v8 = [(FLOWSchemaFLOWPhoneCallContext *)self personTypes];
    objc_super v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"personType"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v11 = [(FLOWSchemaFLOWPhoneCallContext *)self phoneCallAppType] - 1;
    if (v11 > 3) {
      uint64_t v12 = @"FLOWPHONECALLAPPTYPE_UNKNOWN";
    }
    else {
      uint64_t v12 = off_1E5EAF970[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"phoneCallAppType"];
    char has = (char)self->_has;
  }
  if (has)
  {
    int v13 = [(FLOWSchemaFLOWPhoneCallContext *)self phoneCallType];
    uint64_t v14 = @"FLOWPHONECALLTYPE_UNKNOWN";
    if (v13 == 1) {
      uint64_t v14 = @"FLOWPHONECALLTYPE_AUDIO";
    }
    if (v13 == 2) {
      v15 = @"FLOWPHONECALLTYPE_VIDEO";
    }
    else {
      v15 = v14;
    }
    [v3 setObject:v15 forKeyedSubscript:@"phoneCallType"];
  }
  if ([(NSArray *)self->_recipientTypes count])
  {
    v16 = [(FLOWSchemaFLOWPhoneCallContext *)self recipientTypes];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"recipientType"];
  }
  char v18 = (char)self->_has;
  if ((v18 & 8) != 0)
  {
    int v19 = [(FLOWSchemaFLOWPhoneCallContext *)self searchCallHistoryIntent];
    id v20 = @"FLOWSEARCHCALLHISTORYINTENT_UNKNOWN";
    if (v19 == 1) {
      id v20 = @"FLOWSEARCHCALLHISTORYINTENT_VOICEMAIL";
    }
    if (v19 == 2) {
      uint64_t v21 = @"FLOWSEARCHCALLHISTORYINTENT_SEARCH_CALL_HISTORY";
    }
    else {
      uint64_t v21 = v20;
    }
    [v3 setObject:v21 forKeyedSubscript:@"searchCallHistoryIntent"];
    char v18 = (char)self->_has;
  }
  if ((v18 & 0x10) != 0)
  {
    unsigned int v22 = [(FLOWSchemaFLOWPhoneCallContext *)self userPersona] - 1;
    if (v22 > 5) {
      uint64_t v23 = @"INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN";
    }
    else {
      uint64_t v23 = off_1E5EAF990[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"userPersona"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_phoneCallType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_recipientTypes hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_phoneCallAppType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(FLOWSchemaFLOWPhoneCallEmergencyContext *)self->_emergencyContext hash];
  uint64_t v7 = [(NSArray *)self->_personTypes hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v8 = 2654435761 * self->_isThirdPartyFaceTime;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_searchCallHistoryIntent;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v10 = 2654435761 * self->_userPersona;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[60] & 1)) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    int phoneCallType = self->_phoneCallType;
    if (phoneCallType != [v4 phoneCallType]) {
      goto LABEL_23;
    }
  }
  unint64_t v6 = [(FLOWSchemaFLOWPhoneCallContext *)self recipientTypes];
  uint64_t v7 = [v4 recipientTypes];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(FLOWSchemaFLOWPhoneCallContext *)self recipientTypes];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(FLOWSchemaFLOWPhoneCallContext *)self recipientTypes];
    unsigned int v11 = [v4 recipientTypes];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  int v13 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v13 != ((v4[60] >> 1) & 1)) {
    goto LABEL_23;
  }
  if (v13)
  {
    int phoneCallAppType = self->_phoneCallAppType;
    if (phoneCallAppType != [v4 phoneCallAppType]) {
      goto LABEL_23;
    }
  }
  unint64_t v6 = [(FLOWSchemaFLOWPhoneCallContext *)self emergencyContext];
  uint64_t v7 = [v4 emergencyContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v15 = [(FLOWSchemaFLOWPhoneCallContext *)self emergencyContext];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(FLOWSchemaFLOWPhoneCallContext *)self emergencyContext];
    char v18 = [v4 emergencyContext];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWPhoneCallContext *)self personTypes];
  uint64_t v7 = [v4 personTypes];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v20 = [(FLOWSchemaFLOWPhoneCallContext *)self personTypes];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    unsigned int v22 = [(FLOWSchemaFLOWPhoneCallContext *)self personTypes];
    uint64_t v23 = [v4 personTypes];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  $FC3868DE7B08E39CDBE88B2822C3268C has = self->_has;
  int v28 = (*(unsigned int *)&has >> 2) & 1;
  unsigned int v29 = v4[60];
  if (v28 == ((v29 >> 2) & 1))
  {
    if (v28)
    {
      int isThirdPartyFaceTime = self->_isThirdPartyFaceTime;
      if (isThirdPartyFaceTime != [v4 isThirdPartyFaceTime]) {
        goto LABEL_23;
      }
      $FC3868DE7B08E39CDBE88B2822C3268C has = self->_has;
      unsigned int v29 = v4[60];
    }
    int v31 = (*(unsigned int *)&has >> 3) & 1;
    if (v31 == ((v29 >> 3) & 1))
    {
      if (v31)
      {
        int searchCallHistoryIntent = self->_searchCallHistoryIntent;
        if (searchCallHistoryIntent != [v4 searchCallHistoryIntent]) {
          goto LABEL_23;
        }
        $FC3868DE7B08E39CDBE88B2822C3268C has = self->_has;
        unsigned int v29 = v4[60];
      }
      int v33 = (*(unsigned int *)&has >> 4) & 1;
      if (v33 == ((v29 >> 4) & 1))
      {
        if (!v33 || (int userPersona = self->_userPersona, userPersona == [v4 userPersona]))
        {
          BOOL v25 = 1;
          goto LABEL_24;
        }
      }
    }
  }
LABEL_23:
  BOOL v25 = 0;
LABEL_24:

  return v25;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_recipientTypes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) intValue];
        PBDataWriterWriteInt32Field();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v10 = [(FLOWSchemaFLOWPhoneCallContext *)self emergencyContext];

  if (v10)
  {
    unsigned int v11 = [(FLOWSchemaFLOWPhoneCallContext *)self emergencyContext];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v12 = self->_personTypes;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "intValue", (void)v18);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_23;
    }
LABEL_27:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  if ((has & 0x10) != 0) {
LABEL_24:
  }
    PBDataWriterWriteInt32Field();
LABEL_25:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWPhoneCallContextReadFrom(self, (uint64_t)a3);
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

- (void)deleteSearchCallHistoryIntent
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasSearchCallHistoryIntent:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSearchCallHistoryIntent
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSearchCallHistoryIntent:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int searchCallHistoryIntent = a3;
}

- (void)deleteIsThirdPartyFaceTime
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsThirdPartyFaceTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsThirdPartyFaceTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsThirdPartyFaceTime:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isThirdPartyFaceTime = a3;
}

- (int)personTypeAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_personTypes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)personTypeCount
{
  return [(NSArray *)self->_personTypes count];
}

- (void)addPersonType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  personTypes = self->_personTypes;
  if (!personTypes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_personTypes;
    self->_personTypes = v6;

    personTypes = self->_personTypes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)personTypes addObject:v8];
}

- (void)clearPersonType
{
}

- (void)deleteEmergencyContext
{
}

- (BOOL)hasEmergencyContext
{
  return self->_emergencyContext != 0;
}

- (void)deletePhoneCallAppType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPhoneCallAppType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPhoneCallAppType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPhoneCallAppType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int phoneCallAppType = a3;
}

- (int)recipientTypeAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_recipientTypes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)recipientTypeCount
{
  return [(NSArray *)self->_recipientTypes count];
}

- (void)addRecipientType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  recipientTypes = self->_recipientTypes;
  if (!recipientTypes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_recipientTypes;
    self->_recipientTypes = v6;

    recipientTypes = self->_recipientTypes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)recipientTypes addObject:v8];
}

- (void)clearRecipientType
{
}

- (void)deletePhoneCallType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPhoneCallType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneCallType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPhoneCallType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int phoneCallType = a3;
}

@end