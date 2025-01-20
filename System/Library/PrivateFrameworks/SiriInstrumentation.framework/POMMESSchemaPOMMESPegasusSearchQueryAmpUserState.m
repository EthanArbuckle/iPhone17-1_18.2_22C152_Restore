@interface POMMESSchemaPOMMESPegasusSearchQueryAmpUserState
- (BOOL)hasAmpSubscriptionStatus;
- (BOOL)hasHasAmpSubscriptionStatus;
- (BOOL)hasHasItunesSubscriptionStatus;
- (BOOL)hasHasSharedUserId;
- (BOOL)hasHasUserToken;
- (BOOL)hasItunesSubscriptionStatus;
- (BOOL)hasSharedUserId;
- (BOOL)hasUserToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESPegasusSearchQueryAmpUserState)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusSearchQueryAmpUserState)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHasAmpSubscriptionStatus;
- (void)deleteHasItunesSubscriptionStatus;
- (void)deleteHasSharedUserId;
- (void)deleteHasUserToken;
- (void)setHasAmpSubscriptionStatus:(BOOL)a3;
- (void)setHasHasAmpSubscriptionStatus:(BOOL)a3;
- (void)setHasHasItunesSubscriptionStatus:(BOOL)a3;
- (void)setHasHasSharedUserId:(BOOL)a3;
- (void)setHasHasUserToken:(BOOL)a3;
- (void)setHasItunesSubscriptionStatus:(BOOL)a3;
- (void)setHasSharedUserId:(BOOL)a3;
- (void)setHasUserToken:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusSearchQueryAmpUserState

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)hasSharedUserId
{
  return self->_hasSharedUserId;
}

- (BOOL)hasUserToken
{
  return self->_hasUserToken;
}

- (BOOL)hasItunesSubscriptionStatus
{
  return self->_hasItunesSubscriptionStatus;
}

- (BOOL)hasAmpSubscriptionStatus
{
  return self->_hasAmpSubscriptionStatus;
}

- (POMMESSchemaPOMMESPegasusSearchQueryAmpUserState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESPegasusSearchQueryAmpUserState;
  v5 = [(POMMESSchemaPOMMESPegasusSearchQueryAmpUserState *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasAmpSubscriptionStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState setHasAmpSubscriptionStatus:](v5, "setHasAmpSubscriptionStatus:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hasItunesSubscriptionStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState setHasItunesSubscriptionStatus:](v5, "setHasItunesSubscriptionStatus:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"hasUserToken"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState setHasUserToken:](v5, "setHasUserToken:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"hasSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState setHasSharedUserId:](v5, "setHasSharedUserId:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusSearchQueryAmpUserState)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusSearchQueryAmpUserState *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusSearchQueryAmpUserState *)self dictionaryRepresentation];
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
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState hasAmpSubscriptionStatus](self, "hasAmpSubscriptionStatus"));
    [v3 setObject:v7 forKeyedSubscript:@"hasAmpSubscriptionStatus"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState hasItunesSubscriptionStatus](self, "hasItunesSubscriptionStatus"));
  [v3 setObject:v8 forKeyedSubscript:@"hasItunesSubscriptionStatus"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState hasSharedUserId](self, "hasSharedUserId"));
  [v3 setObject:v9 forKeyedSubscript:@"hasSharedUserId"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState hasUserToken](self, "hasUserToken"));
    [v3 setObject:v5 forKeyedSubscript:@"hasUserToken"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_hasAmpSubscriptionStatus;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_hasItunesSubscriptionStatus;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
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
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_hasUserToken;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_hasSharedUserId;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $B6EBF26958F1DD5978CB0BD9236A1DE7 has = self->_has;
  unsigned int v6 = v4[12];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int hasAmpSubscriptionStatus = self->_hasAmpSubscriptionStatus;
    if (hasAmpSubscriptionStatus != [v4 hasAmpSubscriptionStatus]) {
      goto LABEL_18;
    }
    $B6EBF26958F1DD5978CB0BD9236A1DE7 has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    int hasItunesSubscriptionStatus = self->_hasItunesSubscriptionStatus;
    if (hasItunesSubscriptionStatus != [v4 hasItunesSubscriptionStatus]) {
      goto LABEL_18;
    }
    $B6EBF26958F1DD5978CB0BD9236A1DE7 has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int hasUserToken = self->_hasUserToken;
    if (hasUserToken == [v4 hasUserToken])
    {
      $B6EBF26958F1DD5978CB0BD9236A1DE7 has = self->_has;
      unsigned int v6 = v4[12];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int hasSharedUserId = self->_hasSharedUserId;
    if (hasSharedUserId != [v4 hasSharedUserId]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusSearchQueryAmpUserStateReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasSharedUserId
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasHasSharedUserId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasSharedUserId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSharedUserId:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int hasSharedUserId = a3;
}

- (void)deleteHasUserToken
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHasUserToken:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasUserToken
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasUserToken:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int hasUserToken = a3;
}

- (void)deleteHasItunesSubscriptionStatus
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHasItunesSubscriptionStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasItunesSubscriptionStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasItunesSubscriptionStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int hasItunesSubscriptionStatus = a3;
}

- (void)deleteHasAmpSubscriptionStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHasAmpSubscriptionStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasAmpSubscriptionStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAmpSubscriptionStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int hasAmpSubscriptionStatus = a3;
}

@end