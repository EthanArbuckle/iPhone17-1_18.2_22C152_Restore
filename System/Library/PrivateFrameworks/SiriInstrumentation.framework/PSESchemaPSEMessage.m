@interface PSESchemaPSEMessage
- (BOOL)hasContactFirstNamePhoneticScore;
- (BOOL)hasContactFullNamePhoneticScore;
- (BOOL)hasContactLastNamePhoneticScore;
- (BOOL)hasContactMatch;
- (BOOL)hasHasUserInitiatedFollowup;
- (BOOL)hasMessageUserFollowupAction;
- (BOOL)hasUserFollowupEventDonationTimeInSecondsSince2001;
- (BOOL)hasUserInitiatedFollowup;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PSESchemaPSEMessage)initWithDictionary:(id)a3;
- (PSESchemaPSEMessage)initWithJSON:(id)a3;
- (double)contactFirstNamePhoneticScore;
- (double)contactFullNamePhoneticScore;
- (double)contactLastNamePhoneticScore;
- (double)userFollowupEventDonationTimeInSecondsSince2001;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)contactMatch;
- (int)messageUserFollowupAction;
- (unint64_t)hash;
- (void)deleteContactFirstNamePhoneticScore;
- (void)deleteContactFullNamePhoneticScore;
- (void)deleteContactLastNamePhoneticScore;
- (void)deleteContactMatch;
- (void)deleteHasUserInitiatedFollowup;
- (void)deleteMessageUserFollowupAction;
- (void)deleteUserFollowupEventDonationTimeInSecondsSince2001;
- (void)setContactFirstNamePhoneticScore:(double)a3;
- (void)setContactFullNamePhoneticScore:(double)a3;
- (void)setContactLastNamePhoneticScore:(double)a3;
- (void)setContactMatch:(int)a3;
- (void)setHasContactFirstNamePhoneticScore:(BOOL)a3;
- (void)setHasContactFullNamePhoneticScore:(BOOL)a3;
- (void)setHasContactLastNamePhoneticScore:(BOOL)a3;
- (void)setHasContactMatch:(BOOL)a3;
- (void)setHasHasUserInitiatedFollowup:(BOOL)a3;
- (void)setHasMessageUserFollowupAction:(BOOL)a3;
- (void)setHasUserFollowupEventDonationTimeInSecondsSince2001:(BOOL)a3;
- (void)setHasUserInitiatedFollowup:(BOOL)a3;
- (void)setMessageUserFollowupAction:(int)a3;
- (void)setUserFollowupEventDonationTimeInSecondsSince2001:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSEMessage

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)contactLastNamePhoneticScore
{
  return self->_contactLastNamePhoneticScore;
}

- (double)contactFirstNamePhoneticScore
{
  return self->_contactFirstNamePhoneticScore;
}

- (double)contactFullNamePhoneticScore
{
  return self->_contactFullNamePhoneticScore;
}

- (int)contactMatch
{
  return self->_contactMatch;
}

- (int)messageUserFollowupAction
{
  return self->_messageUserFollowupAction;
}

- (double)userFollowupEventDonationTimeInSecondsSince2001
{
  return self->_userFollowupEventDonationTimeInSecondsSince2001;
}

- (BOOL)hasUserInitiatedFollowup
{
  return self->_hasUserInitiatedFollowup;
}

- (PSESchemaPSEMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSESchemaPSEMessage;
  v5 = [(PSESchemaPSEMessage *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasUserInitiatedFollowup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMessage setHasUserInitiatedFollowup:](v5, "setHasUserInitiatedFollowup:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"userFollowupEventDonationTimeInSecondsSince2001"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[PSESchemaPSEMessage setUserFollowupEventDonationTimeInSecondsSince2001:](v5, "setUserFollowupEventDonationTimeInSecondsSince2001:");
    }
    v8 = [v4 objectForKeyedSubscript:@"messageUserFollowupAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMessage setMessageUserFollowupAction:](v5, "setMessageUserFollowupAction:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"contactMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMessage setContactMatch:](v5, "setContactMatch:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"contactFullNamePhoneticScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[PSESchemaPSEMessage setContactFullNamePhoneticScore:](v5, "setContactFullNamePhoneticScore:");
    }
    v11 = [v4 objectForKeyedSubscript:@"contactFirstNamePhoneticScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      -[PSESchemaPSEMessage setContactFirstNamePhoneticScore:](v5, "setContactFirstNamePhoneticScore:");
    }
    v12 = [v4 objectForKeyedSubscript:@"contactLastNamePhoneticScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[PSESchemaPSEMessage setContactLastNamePhoneticScore:](v5, "setContactLastNamePhoneticScore:");
    }
    v13 = v5;
  }
  return v5;
}

- (PSESchemaPSEMessage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSEMessage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSEMessage *)self dictionaryRepresentation];
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
  if ((has & 0x20) != 0)
  {
    v8 = NSNumber;
    [(PSESchemaPSEMessage *)self contactFirstNamePhoneticScore];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"contactFirstNamePhoneticScore"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(PSESchemaPSEMessage *)self contactFullNamePhoneticScore];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"contactFullNamePhoneticScore"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v12 = NSNumber;
  [(PSESchemaPSEMessage *)self contactLastNamePhoneticScore];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:@"contactLastNamePhoneticScore"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_15:
  unsigned int v14 = [(PSESchemaPSEMessage *)self contactMatch] - 1;
  if (v14 > 2) {
    objc_super v15 = @"PSEMESSAGECONTACTMATCH_UNKNOWN";
  }
  else {
    objc_super v15 = off_1E5EBA858[v14];
  }
  [v3 setObject:v15 forKeyedSubscript:@"contactMatch"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEMessage hasUserInitiatedFollowup](self, "hasUserInitiatedFollowup"));
  [v3 setObject:v16 forKeyedSubscript:@"hasUserInitiatedFollowup"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_20:
  unsigned int v17 = [(PSESchemaPSEMessage *)self messageUserFollowupAction] - 1;
  if (v17 > 3) {
    v18 = @"PSEMESSAGEUSERFOLLOWUPACTION_UNKNOWN";
  }
  else {
    v18 = off_1E5EBA870[v17];
  }
  [v3 setObject:v18 forKeyedSubscript:@"messageUserFollowupAction"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_8:
  v5 = NSNumber;
  [(PSESchemaPSEMessage *)self userFollowupEventDonationTimeInSecondsSince2001];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"userFollowupEventDonationTimeInSecondsSince2001"];

LABEL_9:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_hasUserInitiatedFollowup;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double userFollowupEventDonationTimeInSecondsSince2001 = self->_userFollowupEventDonationTimeInSecondsSince2001;
  double v6 = -userFollowupEventDonationTimeInSecondsSince2001;
  if (userFollowupEventDonationTimeInSecondsSince2001 >= 0.0) {
    double v6 = self->_userFollowupEventDonationTimeInSecondsSince2001;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) == 0)
  {
    uint64_t v10 = 0;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_19:
    uint64_t v11 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_20:
    unint64_t v16 = 0;
    goto LABEL_23;
  }
  uint64_t v10 = 2654435761 * self->_messageUserFollowupAction;
  if ((has & 8) == 0) {
    goto LABEL_19;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_contactMatch;
  if ((has & 0x10) == 0) {
    goto LABEL_20;
  }
LABEL_14:
  double contactFullNamePhoneticScore = self->_contactFullNamePhoneticScore;
  double v13 = -contactFullNamePhoneticScore;
  if (contactFullNamePhoneticScore >= 0.0) {
    double v13 = self->_contactFullNamePhoneticScore;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_23:
  if ((has & 0x20) != 0)
  {
    double contactFirstNamePhoneticScore = self->_contactFirstNamePhoneticScore;
    double v19 = -contactFirstNamePhoneticScore;
    if (contactFirstNamePhoneticScore >= 0.0) {
      double v19 = self->_contactFirstNamePhoneticScore;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double contactLastNamePhoneticScore = self->_contactLastNamePhoneticScore;
    double v24 = -contactLastNamePhoneticScore;
    if (contactLastNamePhoneticScore >= 0.0) {
      double v24 = self->_contactLastNamePhoneticScore;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v11 ^ v16 ^ v17 ^ v22;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  $7E2A05B1487CE0D7772F501AE8EE8F39 has = self->_has;
  unsigned int v6 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    int hasUserInitiatedFollowup = self->_hasUserInitiatedFollowup;
    if (hasUserInitiatedFollowup != [v4 hasUserInitiatedFollowup]) {
      goto LABEL_29;
    }
    $7E2A05B1487CE0D7772F501AE8EE8F39 has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      double userFollowupEventDonationTimeInSecondsSince2001 = self->_userFollowupEventDonationTimeInSecondsSince2001;
      [v4 userFollowupEventDonationTimeInSecondsSince2001];
      if (userFollowupEventDonationTimeInSecondsSince2001 != v10) {
        goto LABEL_29;
      }
      $7E2A05B1487CE0D7772F501AE8EE8F39 has = self->_has;
      unsigned int v6 = v4[56];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        int messageUserFollowupAction = self->_messageUserFollowupAction;
        if (messageUserFollowupAction != [v4 messageUserFollowupAction]) {
          goto LABEL_29;
        }
        $7E2A05B1487CE0D7772F501AE8EE8F39 has = self->_has;
        unsigned int v6 = v4[56];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          int contactMatch = self->_contactMatch;
          if (contactMatch != [v4 contactMatch]) {
            goto LABEL_29;
          }
          $7E2A05B1487CE0D7772F501AE8EE8F39 has = self->_has;
          unsigned int v6 = v4[56];
        }
        int v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (v15)
          {
            double contactFullNamePhoneticScore = self->_contactFullNamePhoneticScore;
            [v4 contactFullNamePhoneticScore];
            if (contactFullNamePhoneticScore != v17) {
              goto LABEL_29;
            }
            $7E2A05B1487CE0D7772F501AE8EE8F39 has = self->_has;
            unsigned int v6 = v4[56];
          }
          int v18 = (*(unsigned int *)&has >> 5) & 1;
          if (v18 == ((v6 >> 5) & 1))
          {
            if (v18)
            {
              double contactFirstNamePhoneticScore = self->_contactFirstNamePhoneticScore;
              [v4 contactFirstNamePhoneticScore];
              if (contactFirstNamePhoneticScore != v20) {
                goto LABEL_29;
              }
              $7E2A05B1487CE0D7772F501AE8EE8F39 has = self->_has;
              unsigned int v6 = v4[56];
            }
            int v21 = (*(unsigned int *)&has >> 6) & 1;
            if (v21 == ((v6 >> 6) & 1))
            {
              if (!v21
                || (double contactLastNamePhoneticScore = self->_contactLastNamePhoneticScore,
                    [v4 contactLastNamePhoneticScore],
                    contactLastNamePhoneticScore == v23))
              {
                BOOL v24 = 1;
                goto LABEL_30;
              }
            }
          }
        }
      }
    }
  }
LABEL_29:
  BOOL v24 = 0;
LABEL_30:

  return v24;
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
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteDoubleField();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMessageReadFrom(self, (uint64_t)a3);
}

- (void)deleteContactLastNamePhoneticScore
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasContactLastNamePhoneticScore:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasContactLastNamePhoneticScore
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setContactLastNamePhoneticScore:(double)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_double contactLastNamePhoneticScore = a3;
}

- (void)deleteContactFirstNamePhoneticScore
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasContactFirstNamePhoneticScore:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasContactFirstNamePhoneticScore
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setContactFirstNamePhoneticScore:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_double contactFirstNamePhoneticScore = a3;
}

- (void)deleteContactFullNamePhoneticScore
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasContactFullNamePhoneticScore:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasContactFullNamePhoneticScore
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setContactFullNamePhoneticScore:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_double contactFullNamePhoneticScore = a3;
}

- (void)deleteContactMatch
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasContactMatch:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasContactMatch
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setContactMatch:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int contactMatch = a3;
}

- (void)deleteMessageUserFollowupAction
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMessageUserFollowupAction:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMessageUserFollowupAction
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMessageUserFollowupAction:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int messageUserFollowupAction = a3;
}

- (void)deleteUserFollowupEventDonationTimeInSecondsSince2001
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUserFollowupEventDonationTimeInSecondsSince2001:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserFollowupEventDonationTimeInSecondsSince2001
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUserFollowupEventDonationTimeInSecondsSince2001:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double userFollowupEventDonationTimeInSecondsSince2001 = a3;
}

- (void)deleteHasUserInitiatedFollowup
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHasUserInitiatedFollowup:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasUserInitiatedFollowup
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasUserInitiatedFollowup:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int hasUserInitiatedFollowup = a3;
}

@end