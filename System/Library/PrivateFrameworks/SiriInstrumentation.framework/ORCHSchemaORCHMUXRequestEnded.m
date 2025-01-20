@interface ORCHSchemaORCHMUXRequestEnded
- (BOOL)hasIsMultiUser;
- (BOOL)hasIsOutsider;
- (BOOL)hasIsSelectedUserPartOfMultipleHomes;
- (BOOL)hasNlRerunLatencyInMs;
- (BOOL)hasNlRerunTimeInMs;
- (BOOL)hasORCHUserIdentityClassification;
- (BOOL)hasSelectedSharedUserId;
- (BOOL)hasSelectedUserEphemeralId;
- (BOOL)hasVoiceIdAssetVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiUser;
- (BOOL)isOutsider;
- (BOOL)isSelectedUserPartOfMultipleHomes;
- (BOOL)readFrom:(id)a3;
- (NSArray)userScores;
- (NSData)jsonData;
- (NSString)selectedSharedUserId;
- (NSString)voiceIdAssetVersion;
- (ORCHSchemaORCHMUXRequestEnded)initWithDictionary:(id)a3;
- (ORCHSchemaORCHMUXRequestEnded)initWithJSON:(id)a3;
- (SISchemaUUID)selectedUserEphemeralId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)userScoresAtIndex:(unint64_t)a3;
- (int)ORCHUserIdentityClassification;
- (unint64_t)hash;
- (unint64_t)nlRerunLatencyInMs;
- (unint64_t)userScoresCount;
- (unsigned)nlRerunTimeInMs;
- (void)addUserScores:(id)a3;
- (void)clearUserScores;
- (void)deleteIsMultiUser;
- (void)deleteIsOutsider;
- (void)deleteIsSelectedUserPartOfMultipleHomes;
- (void)deleteNlRerunLatencyInMs;
- (void)deleteNlRerunTimeInMs;
- (void)deleteORCHUserIdentityClassification;
- (void)deleteSelectedSharedUserId;
- (void)deleteSelectedUserEphemeralId;
- (void)deleteVoiceIdAssetVersion;
- (void)setHasIsMultiUser:(BOOL)a3;
- (void)setHasIsOutsider:(BOOL)a3;
- (void)setHasIsSelectedUserPartOfMultipleHomes:(BOOL)a3;
- (void)setHasNlRerunLatencyInMs:(BOOL)a3;
- (void)setHasNlRerunTimeInMs:(BOOL)a3;
- (void)setHasORCHUserIdentityClassification:(BOOL)a3;
- (void)setHasSelectedSharedUserId:(BOOL)a3;
- (void)setHasSelectedUserEphemeralId:(BOOL)a3;
- (void)setHasVoiceIdAssetVersion:(BOOL)a3;
- (void)setIsMultiUser:(BOOL)a3;
- (void)setIsOutsider:(BOOL)a3;
- (void)setIsSelectedUserPartOfMultipleHomes:(BOOL)a3;
- (void)setNlRerunLatencyInMs:(unint64_t)a3;
- (void)setNlRerunTimeInMs:(unsigned int)a3;
- (void)setORCHUserIdentityClassification:(int)a3;
- (void)setSelectedSharedUserId:(id)a3;
- (void)setSelectedUserEphemeralId:(id)a3;
- (void)setUserScores:(id)a3;
- (void)setVoiceIdAssetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHMUXRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHMUXRequestEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHMUXRequestEnded *)self userScores];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(ORCHSchemaORCHMUXRequestEnded *)self setUserScores:v7];

  v8 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedUserEphemeralId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(ORCHSchemaORCHMUXRequestEnded *)self deleteSelectedUserEphemeralId];
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
  objc_storeStrong((id *)&self->_selectedUserEphemeralId, 0);
  objc_storeStrong((id *)&self->_selectedSharedUserId, 0);
  objc_storeStrong((id *)&self->_voiceIdAssetVersion, 0);
  objc_storeStrong((id *)&self->_userScores, 0);
}

- (void)setHasSelectedUserEphemeralId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSelectedSharedUserId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasVoiceIdAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSelectedUserEphemeralId:(id)a3
{
}

- (SISchemaUUID)selectedUserEphemeralId
{
  return self->_selectedUserEphemeralId;
}

- (unint64_t)nlRerunLatencyInMs
{
  return self->_nlRerunLatencyInMs;
}

- (void)setSelectedSharedUserId:(id)a3
{
}

- (NSString)selectedSharedUserId
{
  return self->_selectedSharedUserId;
}

- (BOOL)isSelectedUserPartOfMultipleHomes
{
  return self->_isSelectedUserPartOfMultipleHomes;
}

- (void)setVoiceIdAssetVersion:(id)a3
{
}

- (NSString)voiceIdAssetVersion
{
  return self->_voiceIdAssetVersion;
}

- (BOOL)isOutsider
{
  return self->_isOutsider;
}

- (int)ORCHUserIdentityClassification
{
  return self->_ORCHUserIdentityClassification;
}

- (void)setUserScores:(id)a3
{
}

- (NSArray)userScores
{
  return self->_userScores;
}

- (unsigned)nlRerunTimeInMs
{
  return self->_nlRerunTimeInMs;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (ORCHSchemaORCHMUXRequestEnded)initWithDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ORCHSchemaORCHMUXRequestEnded;
  v5 = [(ORCHSchemaORCHMUXRequestEnded *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isMultiUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMUXRequestEnded setIsMultiUser:](v5, "setIsMultiUser:", [v6 BOOLValue]);
    }
    v31 = v6;
    v7 = [v4 objectForKeyedSubscript:@"nlRerunTimeInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMUXRequestEnded setNlRerunTimeInMs:](v5, "setNlRerunTimeInMs:", [v7 unsignedIntValue]);
    }
    v30 = v7;
    v8 = [v4 objectForKeyedSubscript:@"userScores"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v33;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[ORCHSchemaORCHMultiUserScore alloc] initWithDictionary:v14];
              [(ORCHSchemaORCHMUXRequestEnded *)v5 addUserScores:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v11);
      }
    }
    v16 = [v4 objectForKeyedSubscript:@"ORCHUserIdentityClassification"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMUXRequestEnded setORCHUserIdentityClassification:](v5, "setORCHUserIdentityClassification:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"isOutsider"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMUXRequestEnded setIsOutsider:](v5, "setIsOutsider:", [v17 BOOLValue]);
    }
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"voiceIdAssetVersion", v16);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(ORCHSchemaORCHMUXRequestEnded *)v5 setVoiceIdAssetVersion:v19];
    }
    v29 = v8;
    v20 = [v4 objectForKeyedSubscript:@"isSelectedUserPartOfMultipleHomes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMUXRequestEnded setIsSelectedUserPartOfMultipleHomes:](v5, "setIsSelectedUserPartOfMultipleHomes:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"selectedSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(ORCHSchemaORCHMUXRequestEnded *)v5 setSelectedSharedUserId:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"nlRerunLatencyInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMUXRequestEnded setNlRerunLatencyInMs:](v5, "setNlRerunLatencyInMs:", [v23 unsignedLongLongValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"selectedUserEphemeralId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[SISchemaUUID alloc] initWithDictionary:v24];
      [(ORCHSchemaORCHMUXRequestEnded *)v5 setSelectedUserEphemeralId:v25];
    }
    v26 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHMUXRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHMUXRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHMUXRequestEnded *)self dictionaryRepresentation];
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
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    unsigned int v5 = [(ORCHSchemaORCHMUXRequestEnded *)self ORCHUserIdentityClassification] - 1;
    if (v5 > 5) {
      v6 = @"ORCHUSERIDENTITYCLASSIFICATION_UNKNOWN";
    }
    else {
      v6 = off_1E5EB3A08[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"ORCHUserIdentityClassification"];
    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHMUXRequestEnded isMultiUser](self, "isMultiUser"));
    [v3 setObject:v12 forKeyedSubscript:@"isMultiUser"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHMUXRequestEnded isOutsider](self, "isOutsider"));
  [v3 setObject:v13 forKeyedSubscript:@"isOutsider"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHMUXRequestEnded isSelectedUserPartOfMultipleHomes](self, "isSelectedUserPartOfMultipleHomes"));
  [v3 setObject:v14 forKeyedSubscript:@"isSelectedUserPartOfMultipleHomes"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_20:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ORCHSchemaORCHMUXRequestEnded nlRerunLatencyInMs](self, "nlRerunLatencyInMs"));
  [v3 setObject:v15 forKeyedSubscript:@"nlRerunLatencyInMs"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_11:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ORCHSchemaORCHMUXRequestEnded nlRerunTimeInMs](self, "nlRerunTimeInMs"));
    [v3 setObject:v7 forKeyedSubscript:@"nlRerunTimeInMs"];
  }
LABEL_12:
  if (self->_selectedSharedUserId)
  {
    v8 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedSharedUserId];
    id v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"selectedSharedUserId"];
  }
  if (self->_selectedUserEphemeralId)
  {
    uint64_t v10 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedUserEphemeralId];
    uint64_t v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"selectedUserEphemeralId"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"selectedUserEphemeralId"];
    }
  }
  if ([(NSArray *)self->_userScores count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v18 = self->_userScores;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (void)v28);
          if (v23)
          {
            [v17 addObject:v23];
          }
          else
          {
            v24 = [MEMORY[0x1E4F1CA98] null];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"userScores"];
  }
  if (self->_voiceIdAssetVersion)
  {
    v25 = [(ORCHSchemaORCHMUXRequestEnded *)self voiceIdAssetVersion];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"voiceIdAssetVersion"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v28);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_isMultiUser;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_nlRerunTimeInMs;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSArray *)self->_userScores hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_ORCHUserIdentityClassification;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_isOutsider;
      goto LABEL_11;
    }
  }
  uint64_t v7 = 0;
LABEL_11:
  NSUInteger v8 = [(NSString *)self->_voiceIdAssetVersion hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761 * self->_isSelectedUserPartOfMultipleHomes;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_selectedSharedUserId hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    unint64_t v11 = 2654435761u * self->_nlRerunLatencyInMs;
  }
  else {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(SISchemaUUID *)self->_selectedUserEphemeralId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  $909C2B06A8EBC8E210EDA1F4529ED3E9 has = self->_has;
  unsigned int v6 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    int isMultiUser = self->_isMultiUser;
    if (isMultiUser != [v4 isMultiUser]) {
      goto LABEL_42;
    }
    $909C2B06A8EBC8E210EDA1F4529ED3E9 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_42;
  }
  if (v8)
  {
    unsigned int nlRerunTimeInMs = self->_nlRerunTimeInMs;
    if (nlRerunTimeInMs != [v4 nlRerunTimeInMs]) {
      goto LABEL_42;
    }
  }
  NSUInteger v10 = [(ORCHSchemaORCHMUXRequestEnded *)self userScores];
  unint64_t v11 = [v4 userScores];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(ORCHSchemaORCHMUXRequestEnded *)self userScores];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ORCHSchemaORCHMUXRequestEnded *)self userScores];
    v15 = [v4 userScores];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  $909C2B06A8EBC8E210EDA1F4529ED3E9 v17 = self->_has;
  int v18 = (*(unsigned int *)&v17 >> 2) & 1;
  unsigned int v19 = v4[72];
  if (v18 != ((v19 >> 2) & 1)) {
    goto LABEL_42;
  }
  if (v18)
  {
    int ORCHUserIdentityClassification = self->_ORCHUserIdentityClassification;
    if (ORCHUserIdentityClassification != [v4 ORCHUserIdentityClassification]) {
      goto LABEL_42;
    }
    $909C2B06A8EBC8E210EDA1F4529ED3E9 v17 = self->_has;
    unsigned int v19 = v4[72];
  }
  int v21 = (*(unsigned int *)&v17 >> 3) & 1;
  if (v21 != ((v19 >> 3) & 1)) {
    goto LABEL_42;
  }
  if (v21)
  {
    int isOutsider = self->_isOutsider;
    if (isOutsider != [v4 isOutsider]) {
      goto LABEL_42;
    }
  }
  NSUInteger v10 = [(ORCHSchemaORCHMUXRequestEnded *)self voiceIdAssetVersion];
  unint64_t v11 = [v4 voiceIdAssetVersion];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_41;
  }
  uint64_t v23 = [(ORCHSchemaORCHMUXRequestEnded *)self voiceIdAssetVersion];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(ORCHSchemaORCHMUXRequestEnded *)self voiceIdAssetVersion];
    v26 = [v4 voiceIdAssetVersion];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int v28 = (*(unsigned char *)&self->_has >> 4) & 1;
  if (v28 != ((v4[72] >> 4) & 1)) {
    goto LABEL_42;
  }
  if (v28)
  {
    int isSelectedUserPartOfMultipleHomes = self->_isSelectedUserPartOfMultipleHomes;
    if (isSelectedUserPartOfMultipleHomes != [v4 isSelectedUserPartOfMultipleHomes]) {
      goto LABEL_42;
    }
  }
  NSUInteger v10 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedSharedUserId];
  unint64_t v11 = [v4 selectedSharedUserId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_41;
  }
  uint64_t v30 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedSharedUserId];
  if (v30)
  {
    long long v31 = (void *)v30;
    long long v32 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedSharedUserId];
    uint64_t v33 = [v4 selectedSharedUserId];
    int v34 = [v32 isEqual:v33];

    if (!v34) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int v35 = (*(unsigned char *)&self->_has >> 5) & 1;
  if (v35 != ((v4[72] >> 5) & 1)) {
    goto LABEL_42;
  }
  if (v35)
  {
    unint64_t nlRerunLatencyInMs = self->_nlRerunLatencyInMs;
    if (nlRerunLatencyInMs != [v4 nlRerunLatencyInMs]) {
      goto LABEL_42;
    }
  }
  NSUInteger v10 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedUserEphemeralId];
  unint64_t v11 = [v4 selectedUserEphemeralId];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v37 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedUserEphemeralId];
  if (!v37)
  {

LABEL_45:
    BOOL v42 = 1;
    goto LABEL_43;
  }
  uint64_t v38 = (void *)v37;
  v39 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedUserEphemeralId];
  v40 = [v4 selectedUserEphemeralId];
  char v41 = [v39 isEqual:v40];

  if (v41) {
    goto LABEL_45;
  }
LABEL_42:
  BOOL v42 = 0;
LABEL_43:

  return v42;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v6 = self->_userScores;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(ORCHSchemaORCHMUXRequestEnded *)self voiceIdAssetVersion];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v13 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedSharedUserId];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint64Field();
  }
  uint64_t v14 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedUserEphemeralId];

  if (v14)
  {
    v15 = [(ORCHSchemaORCHMUXRequestEnded *)self selectedUserEphemeralId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMUXRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSelectedUserEphemeralId
{
}

- (BOOL)hasSelectedUserEphemeralId
{
  return self->_selectedUserEphemeralId != 0;
}

- (void)deleteNlRerunLatencyInMs
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasNlRerunLatencyInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNlRerunLatencyInMs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNlRerunLatencyInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unint64_t nlRerunLatencyInMs = a3;
}

- (void)deleteSelectedSharedUserId
{
}

- (BOOL)hasSelectedSharedUserId
{
  return self->_selectedSharedUserId != 0;
}

- (void)deleteIsSelectedUserPartOfMultipleHomes
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIsSelectedUserPartOfMultipleHomes:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsSelectedUserPartOfMultipleHomes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsSelectedUserPartOfMultipleHomes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isSelectedUserPartOfMultipleHomes = a3;
}

- (void)deleteVoiceIdAssetVersion
{
}

- (BOOL)hasVoiceIdAssetVersion
{
  return self->_voiceIdAssetVersion != 0;
}

- (void)deleteIsOutsider
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsOutsider:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsOutsider
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsOutsider:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isOutsider = a3;
}

- (void)deleteORCHUserIdentityClassification
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasORCHUserIdentityClassification:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasORCHUserIdentityClassification
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setORCHUserIdentityClassification:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int ORCHUserIdentityClassification = a3;
}

- (id)userScoresAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_userScores objectAtIndexedSubscript:a3];
}

- (unint64_t)userScoresCount
{
  return [(NSArray *)self->_userScores count];
}

- (void)addUserScores:(id)a3
{
  id v4 = a3;
  userScores = self->_userScores;
  id v8 = v4;
  if (!userScores)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_userScores;
    self->_userScores = v6;

    id v4 = v8;
    userScores = self->_userScores;
  }
  [(NSArray *)userScores addObject:v4];
}

- (void)clearUserScores
{
}

- (void)deleteNlRerunTimeInMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNlRerunTimeInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNlRerunTimeInMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNlRerunTimeInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int nlRerunTimeInMs = a3;
}

- (void)deleteIsMultiUser
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsMultiUser:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMultiUser
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsMultiUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isMultiUser = a3;
}

@end