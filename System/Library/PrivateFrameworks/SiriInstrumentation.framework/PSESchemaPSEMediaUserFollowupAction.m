@interface PSESchemaPSEMediaUserFollowupAction
- (BOOL)hasIsAirPlay;
- (BOOL)hasIsFirstPartyAppUsedForFollowup;
- (BOOL)hasIsSameAppUsed;
- (BOOL)hasIsSubscriber;
- (BOOL)hasMediaContentDurationBucket;
- (BOOL)hasMediaEntitySimilarity;
- (BOOL)hasMediaType;
- (BOOL)hasState;
- (BOOL)isAirPlay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstPartyAppUsedForFollowup;
- (BOOL)isSameAppUsed;
- (BOOL)isSubscriber;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PSESchemaPSEMediaEntitySimilarity)mediaEntitySimilarity;
- (PSESchemaPSEMediaUserFollowupAction)initWithDictionary:(id)a3;
- (PSESchemaPSEMediaUserFollowupAction)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mediaContentDurationBucket;
- (int)mediaType;
- (int)state;
- (unint64_t)hash;
- (void)deleteIsAirPlay;
- (void)deleteIsFirstPartyAppUsedForFollowup;
- (void)deleteIsSameAppUsed;
- (void)deleteIsSubscriber;
- (void)deleteMediaContentDurationBucket;
- (void)deleteMediaEntitySimilarity;
- (void)deleteMediaType;
- (void)deleteState;
- (void)setHasIsAirPlay:(BOOL)a3;
- (void)setHasIsFirstPartyAppUsedForFollowup:(BOOL)a3;
- (void)setHasIsSameAppUsed:(BOOL)a3;
- (void)setHasIsSubscriber:(BOOL)a3;
- (void)setHasMediaContentDurationBucket:(BOOL)a3;
- (void)setHasMediaEntitySimilarity:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setIsAirPlay:(BOOL)a3;
- (void)setIsFirstPartyAppUsedForFollowup:(BOOL)a3;
- (void)setIsSameAppUsed:(BOOL)a3;
- (void)setIsSubscriber:(BOOL)a3;
- (void)setMediaContentDurationBucket:(int)a3;
- (void)setMediaEntitySimilarity:(id)a3;
- (void)setMediaType:(int)a3;
- (void)setState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSEMediaUserFollowupAction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSESchemaPSEMediaUserFollowupAction;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaEntitySimilarity];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PSESchemaPSEMediaUserFollowupAction *)self deleteMediaEntitySimilarity];
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

- (void)setHasMediaEntitySimilarity:(BOOL)a3
{
  *(&self->_isSubscriber + 2) = a3;
}

- (BOOL)isSubscriber
{
  return self->_isSubscriber;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (BOOL)isAirPlay
{
  return self->_isAirPlay;
}

- (void)setMediaEntitySimilarity:(id)a3
{
}

- (PSESchemaPSEMediaEntitySimilarity)mediaEntitySimilarity
{
  return self->_mediaEntitySimilarity;
}

- (BOOL)isFirstPartyAppUsedForFollowup
{
  return self->_isFirstPartyAppUsedForFollowup;
}

- (BOOL)isSameAppUsed
{
  return self->_isSameAppUsed;
}

- (int)mediaContentDurationBucket
{
  return self->_mediaContentDurationBucket;
}

- (int)state
{
  return self->_state;
}

- (PSESchemaPSEMediaUserFollowupAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PSESchemaPSEMediaUserFollowupAction;
  v5 = [(PSESchemaPSEMediaUserFollowupAction *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"state"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMediaUserFollowupAction setState:](v5, "setState:", [v6 intValue]);
    }
    v17 = v6;
    v7 = [v4 objectForKeyedSubscript:@"mediaContentDurationBucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMediaUserFollowupAction setMediaContentDurationBucket:](v5, "setMediaContentDurationBucket:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isSameAppUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMediaUserFollowupAction setIsSameAppUsed:](v5, "setIsSameAppUsed:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"isFirstPartyAppUsedForFollowup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMediaUserFollowupAction setIsFirstPartyAppUsedForFollowup:](v5, "setIsFirstPartyAppUsedForFollowup:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"mediaEntitySimilarity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[PSESchemaPSEMediaEntitySimilarity alloc] initWithDictionary:v10];
      [(PSESchemaPSEMediaUserFollowupAction *)v5 setMediaEntitySimilarity:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"isAirPlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMediaUserFollowupAction setIsAirPlay:](v5, "setIsAirPlay:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"mediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMediaUserFollowupAction setMediaType:](v5, "setMediaType:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"isSubscriber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMediaUserFollowupAction setIsSubscriber:](v5, "setIsSubscriber:", [v14 BOOLValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (PSESchemaPSEMediaUserFollowupAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSEMediaUserFollowupAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSEMediaUserFollowupAction *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 0x10) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEMediaUserFollowupAction isAirPlay](self, "isAirPlay"));
    [v3 setObject:v5 forKeyedSubscript:@"isAirPlay"];

    char v4 = *(&self->_isSubscriber + 1);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(&self->_isSubscriber + 1) & 8) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEMediaUserFollowupAction isFirstPartyAppUsedForFollowup](self, "isFirstPartyAppUsedForFollowup"));
  [v3 setObject:v6 forKeyedSubscript:@"isFirstPartyAppUsedForFollowup"];

  char v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEMediaUserFollowupAction isSameAppUsed](self, "isSameAppUsed"));
  [v3 setObject:v7 forKeyedSubscript:@"isSameAppUsed"];

  char v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_10:
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEMediaUserFollowupAction isSubscriber](self, "isSubscriber"));
  [v3 setObject:v8 forKeyedSubscript:@"isSubscriber"];

  if ((*(&self->_isSubscriber + 1) & 2) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  unsigned int v9 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaContentDurationBucket] - 1;
  if (v9 > 0x10) {
    v10 = @"PSEMEDIACONTENTDURATIONBUCKET_UNKNOWN";
  }
  else {
    v10 = off_1E5EBB1D0[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"mediaContentDurationBucket"];
LABEL_15:
  if (self->_mediaEntitySimilarity)
  {
    v11 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaEntitySimilarity];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"mediaEntitySimilarity"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"mediaEntitySimilarity"];
    }
  }
  char v14 = *(&self->_isSubscriber + 1);
  if ((v14 & 0x20) != 0)
  {
    unsigned int v15 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaType] - 1;
    if (v15 > 6) {
      v16 = @"MEDIATYPE_UNKNOWN";
    }
    else {
      v16 = off_1E5EBB258[v15];
    }
    [v3 setObject:v16 forKeyedSubscript:@"mediaType"];
    char v14 = *(&self->_isSubscriber + 1);
  }
  if (v14)
  {
    unsigned int v17 = [(PSESchemaPSEMediaUserFollowupAction *)self state] - 1;
    if (v17 > 5) {
      objc_super v18 = @"MEDIAPLAYBACKSTATE_UNKNOWN";
    }
    else {
      objc_super v18 = off_1E5EBB290[v17];
    }
    [v3 setObject:v18 forKeyedSubscript:@"state"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isSubscriber + 1))
  {
    uint64_t v3 = 2654435761 * self->_state;
    if ((*(&self->_isSubscriber + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_mediaContentDurationBucket;
      if ((*(&self->_isSubscriber + 1) & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(&self->_isSubscriber + 1) & 8) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(&self->_isSubscriber + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(&self->_isSubscriber + 1) & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_isSameAppUsed;
  if ((*(&self->_isSubscriber + 1) & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_isFirstPartyAppUsedForFollowup;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  unint64_t v7 = [(PSESchemaPSEMediaEntitySimilarity *)self->_mediaEntitySimilarity hash];
  if ((*(&self->_isSubscriber + 1) & 0x10) == 0)
  {
    uint64_t v8 = 0;
    if ((*(&self->_isSubscriber + 1) & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v9 = 0;
    if ((*(&self->_isSubscriber + 1) & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v7;
  }
  uint64_t v8 = 2654435761 * self->_isAirPlay;
  if ((*(&self->_isSubscriber + 1) & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v9 = 2654435761 * self->_mediaType;
  if ((*(&self->_isSubscriber + 1) & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v10 = 2654435761 * self->_isSubscriber;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isSubscriber + 1);
  unsigned int v6 = v4[41];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_35;
  }
  if (v5)
  {
    int state = self->_state;
    if (state != [v4 state]) {
      goto LABEL_35;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isSubscriber + 1);
    unsigned int v6 = v4[41];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_35;
  }
  if (v8)
  {
    int mediaContentDurationBucket = self->_mediaContentDurationBucket;
    if (mediaContentDurationBucket != [v4 mediaContentDurationBucket]) {
      goto LABEL_35;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isSubscriber + 1);
    unsigned int v6 = v4[41];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_35;
  }
  if (v10)
  {
    int isSameAppUsed = self->_isSameAppUsed;
    if (isSameAppUsed != [v4 isSameAppUsed]) {
      goto LABEL_35;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isSubscriber + 1);
    unsigned int v6 = v4[41];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_35;
  }
  if (v12)
  {
    int isFirstPartyAppUsedForFollowup = self->_isFirstPartyAppUsedForFollowup;
    if (isFirstPartyAppUsedForFollowup != [v4 isFirstPartyAppUsedForFollowup]) {
      goto LABEL_35;
    }
  }
  char v14 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaEntitySimilarity];
  unsigned int v15 = [v4 mediaEntitySimilarity];
  v16 = v15;
  if ((v14 == 0) == (v15 != 0))
  {

    goto LABEL_35;
  }
  uint64_t v17 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaEntitySimilarity];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaEntitySimilarity];
    v20 = [v4 mediaEntitySimilarity];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unsigned int v22 = *((unsigned __int8 *)&self->_isSubscriber + 1);
  int v23 = (v22 >> 4) & 1;
  unsigned int v24 = v4[41];
  if (v23 != ((v24 >> 4) & 1))
  {
LABEL_35:
    BOOL v30 = 0;
    goto LABEL_36;
  }
  if (v23)
  {
    int isAirPlay = self->_isAirPlay;
    if (isAirPlay != [v4 isAirPlay]) {
      goto LABEL_35;
    }
    unsigned int v22 = *((unsigned __int8 *)&self->_isSubscriber + 1);
    unsigned int v24 = v4[41];
  }
  int v26 = (v22 >> 5) & 1;
  if (v26 != ((v24 >> 5) & 1)) {
    goto LABEL_35;
  }
  if (v26)
  {
    int mediaType = self->_mediaType;
    if (mediaType == [v4 mediaType])
    {
      unsigned int v22 = *((unsigned __int8 *)&self->_isSubscriber + 1);
      unsigned int v24 = v4[41];
      goto LABEL_31;
    }
    goto LABEL_35;
  }
LABEL_31:
  int v28 = (v22 >> 6) & 1;
  if (v28 != ((v24 >> 6) & 1)) {
    goto LABEL_35;
  }
  if (v28)
  {
    int isSubscriber = self->_isSubscriber;
    if (isSubscriber != [v4 isSubscriber]) {
      goto LABEL_35;
    }
  }
  BOOL v30 = 1;
LABEL_36:

  return v30;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char v4 = *(&self->_isSubscriber + 1);
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    char v4 = *(&self->_isSubscriber + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(&self->_isSubscriber + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_isSubscriber + 1) & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  unsigned int v5 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaEntitySimilarity];

  if (v5)
  {
    unsigned int v6 = [(PSESchemaPSEMediaUserFollowupAction *)self mediaEntitySimilarity];
    PBDataWriterWriteSubmessage();
  }
  char v7 = *(&self->_isSubscriber + 1);
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v7 = *(&self->_isSubscriber + 1);
    if ((v7 & 0x20) == 0)
    {
LABEL_10:
      if ((v7 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(&self->_isSubscriber + 1) & 0x20) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt32Field();
  if ((*(&self->_isSubscriber + 1) & 0x40) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMediaUserFollowupActionReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsSubscriber
{
  *(&self->_isSubscriber + 1) &= ~0x40u;
}

- (void)setHasIsSubscriber:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xBF | v3;
}

- (BOOL)hasIsSubscriber
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 6) & 1;
}

- (void)setIsSubscriber:(BOOL)a3
{
  *(&self->_isSubscriber + 1) |= 0x40u;
  self->_int isSubscriber = a3;
}

- (void)deleteMediaType
{
  *(&self->_isSubscriber + 1) &= ~0x20u;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xDF | v3;
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 5) & 1;
}

- (void)setMediaType:(int)a3
{
  *(&self->_isSubscriber + 1) |= 0x20u;
  self->_int mediaType = a3;
}

- (void)deleteIsAirPlay
{
  *(&self->_isSubscriber + 1) &= ~0x10u;
}

- (void)setHasIsAirPlay:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xEF | v3;
}

- (BOOL)hasIsAirPlay
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 4) & 1;
}

- (void)setIsAirPlay:(BOOL)a3
{
  *(&self->_isSubscriber + 1) |= 0x10u;
  self->_int isAirPlay = a3;
}

- (void)deleteMediaEntitySimilarity
{
}

- (BOOL)hasMediaEntitySimilarity
{
  return self->_mediaEntitySimilarity != 0;
}

- (void)deleteIsFirstPartyAppUsedForFollowup
{
  *(&self->_isSubscriber + 1) &= ~8u;
}

- (void)setHasIsFirstPartyAppUsedForFollowup:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xF7 | v3;
}

- (BOOL)hasIsFirstPartyAppUsedForFollowup
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 3) & 1;
}

- (void)setIsFirstPartyAppUsedForFollowup:(BOOL)a3
{
  *(&self->_isSubscriber + 1) |= 8u;
  self->_int isFirstPartyAppUsedForFollowup = a3;
}

- (void)deleteIsSameAppUsed
{
  *(&self->_isSubscriber + 1) &= ~4u;
}

- (void)setHasIsSameAppUsed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xFB | v3;
}

- (BOOL)hasIsSameAppUsed
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 2) & 1;
}

- (void)setIsSameAppUsed:(BOOL)a3
{
  *(&self->_isSubscriber + 1) |= 4u;
  self->_int isSameAppUsed = a3;
}

- (void)deleteMediaContentDurationBucket
{
  *(&self->_isSubscriber + 1) &= ~2u;
}

- (void)setHasMediaContentDurationBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xFD | v3;
}

- (BOOL)hasMediaContentDurationBucket
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 1) & 1;
}

- (void)setMediaContentDurationBucket:(int)a3
{
  *(&self->_isSubscriber + 1) |= 2u;
  self->_int mediaContentDurationBucket = a3;
}

- (void)deleteState
{
  *(&self->_isSubscriber + 1) &= ~1u;
}

- (void)setHasState:(BOOL)a3
{
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(&self->_isSubscriber + 1);
}

- (void)setState:(int)a3
{
  *(&self->_isSubscriber + 1) |= 1u;
  self->_int state = a3;
}

@end