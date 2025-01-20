@interface PSESchemaPSECommonSignal
- (BOOL)hasAction;
- (BOOL)hasAppFollowup;
- (BOOL)hasAppLaunchReason;
- (BOOL)hasAppLaunchTimeInSecondsSince2001;
- (BOOL)hasDomain;
- (BOOL)hasEventDonationTimeInSecondsSince2001;
- (BOOL)hasHasUserInitiatedFollowup;
- (BOOL)hasIsDonatedBySiri;
- (BOOL)hasUserInitiatedFollowup;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)action;
- (NSString)domain;
- (PSESchemaPSECommonSignal)initWithDictionary:(id)a3;
- (PSESchemaPSECommonSignal)initWithJSON:(id)a3;
- (double)appLaunchTimeInSecondsSince2001;
- (double)eventDonationTimeInSecondsSince2001;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appFollowup;
- (int)appLaunchReason;
- (int)isDonatedBySiri;
- (unint64_t)hash;
- (void)deleteAction;
- (void)deleteAppFollowup;
- (void)deleteAppLaunchReason;
- (void)deleteAppLaunchTimeInSecondsSince2001;
- (void)deleteDomain;
- (void)deleteEventDonationTimeInSecondsSince2001;
- (void)deleteHasUserInitiatedFollowup;
- (void)deleteIsDonatedBySiri;
- (void)setAction:(id)a3;
- (void)setAppFollowup:(int)a3;
- (void)setAppLaunchReason:(int)a3;
- (void)setAppLaunchTimeInSecondsSince2001:(double)a3;
- (void)setDomain:(id)a3;
- (void)setEventDonationTimeInSecondsSince2001:(double)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasAppFollowup:(BOOL)a3;
- (void)setHasAppLaunchReason:(BOOL)a3;
- (void)setHasAppLaunchTimeInSecondsSince2001:(BOOL)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasEventDonationTimeInSecondsSince2001:(BOOL)a3;
- (void)setHasHasUserInitiatedFollowup:(BOOL)a3;
- (void)setHasIsDonatedBySiri:(BOOL)a3;
- (void)setHasUserInitiatedFollowup:(BOOL)a3;
- (void)setIsDonatedBySiri:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSECommonSignal

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setHasAction:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)appLaunchReason
{
  return self->_appLaunchReason;
}

- (double)appLaunchTimeInSecondsSince2001
{
  return self->_appLaunchTimeInSecondsSince2001;
}

- (int)appFollowup
{
  return self->_appFollowup;
}

- (BOOL)hasUserInitiatedFollowup
{
  return self->_hasUserInitiatedFollowup;
}

- (int)isDonatedBySiri
{
  return self->_isDonatedBySiri;
}

- (void)setAction:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (double)eventDonationTimeInSecondsSince2001
{
  return self->_eventDonationTimeInSecondsSince2001;
}

- (PSESchemaPSECommonSignal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PSESchemaPSECommonSignal;
  v5 = [(PSESchemaPSECommonSignal *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventDonationTimeInSecondsSince2001"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[PSESchemaPSECommonSignal setEventDonationTimeInSecondsSince2001:](v5, "setEventDonationTimeInSecondsSince2001:");
    }
    v18 = v6;
    v7 = [v4 objectForKeyedSubscript:@"domain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(PSESchemaPSECommonSignal *)v5 setDomain:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"action"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(PSESchemaPSECommonSignal *)v5 setAction:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"isDonatedBySiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSECommonSignal setIsDonatedBySiri:](v5, "setIsDonatedBySiri:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"hasUserInitiatedFollowup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSECommonSignal setHasUserInitiatedFollowup:](v5, "setHasUserInitiatedFollowup:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"appFollowup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSECommonSignal setAppFollowup:](v5, "setAppFollowup:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"appLaunchTimeInSecondsSince2001"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      -[PSESchemaPSECommonSignal setAppLaunchTimeInSecondsSince2001:](v5, "setAppLaunchTimeInSecondsSince2001:");
    }
    v15 = [v4 objectForKeyedSubscript:@"appLaunchReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSECommonSignal setAppLaunchReason:](v5, "setAppLaunchReason:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (PSESchemaPSECommonSignal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSECommonSignal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSECommonSignal *)self dictionaryRepresentation];
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
  if (self->_action)
  {
    id v4 = [(PSESchemaPSECommonSignal *)self action];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"action"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    unsigned int v7 = [(PSESchemaPSECommonSignal *)self appFollowup] - 1;
    if (v7 > 3) {
      v8 = @"PSEAPPFOLLOWUP_UNKNOWN";
    }
    else {
      v8 = off_1E5EBA248[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"appFollowup"];
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    unsigned int v9 = [(PSESchemaPSECommonSignal *)self appLaunchReason] - 1;
    if (v9 > 3) {
      v10 = @"PSEAPPLAUNCHREASON_UNKNOWN";
    }
    else {
      v10 = off_1E5EBA268[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"appLaunchReason"];
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v11 = NSNumber;
    [(PSESchemaPSECommonSignal *)self appLaunchTimeInSecondsSince2001];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"appLaunchTimeInSecondsSince2001"];
  }
  if (self->_domain)
  {
    v13 = [(PSESchemaPSECommonSignal *)self domain];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"domain"];
  }
  char v15 = (char)self->_has;
  if ((v15 & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_19;
    }
LABEL_22:
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSECommonSignal hasUserInitiatedFollowup](self, "hasUserInitiatedFollowup"));
    [v3 setObject:v18 forKeyedSubscript:@"hasUserInitiatedFollowup"];

    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_27;
    }
LABEL_23:
    unsigned int v19 = [(PSESchemaPSECommonSignal *)self isDonatedBySiri] - 1;
    if (v19 > 2) {
      v20 = @"PSEDONATIONSOURCE_UNKNOWN";
    }
    else {
      v20 = off_1E5EBA288[v19];
    }
    [v3 setObject:v20 forKeyedSubscript:@"isDonatedBySiri"];
    goto LABEL_27;
  }
  v16 = NSNumber;
  [(PSESchemaPSECommonSignal *)self eventDonationTimeInSecondsSince2001];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setObject:v17 forKeyedSubscript:@"eventDonationTimeInSecondsSince2001"];

  char v15 = (char)self->_has;
  if ((v15 & 4) != 0) {
    goto LABEL_22;
  }
LABEL_19:
  if ((v15 & 2) != 0) {
    goto LABEL_23;
  }
LABEL_27:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double eventDonationTimeInSecondsSince2001 = self->_eventDonationTimeInSecondsSince2001;
    double v5 = -eventDonationTimeInSecondsSince2001;
    if (eventDonationTimeInSecondsSince2001 >= 0.0) {
      double v5 = self->_eventDonationTimeInSecondsSince2001;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_domain hash];
  NSUInteger v9 = [(NSString *)self->_action hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isDonatedBySiri;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_11:
      uint64_t v12 = 2654435761 * self->_hasUserInitiatedFollowup;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_12;
      }
LABEL_19:
      uint64_t v13 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_13;
      }
LABEL_20:
      unint64_t v18 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_19;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_appFollowup;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_20;
  }
LABEL_13:
  double appLaunchTimeInSecondsSince2001 = self->_appLaunchTimeInSecondsSince2001;
  double v15 = -appLaunchTimeInSecondsSince2001;
  if (appLaunchTimeInSecondsSince2001 >= 0.0) {
    double v15 = self->_appLaunchTimeInSecondsSince2001;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_23:
  if ((has & 0x20) != 0) {
    uint64_t v19 = 2654435761 * self->_appLaunchReason;
  }
  else {
    uint64_t v19 = 0;
  }
  return v8 ^ v3 ^ v9 ^ v11 ^ v12 ^ v13 ^ v18 ^ v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[60] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    double eventDonationTimeInSecondsSince2001 = self->_eventDonationTimeInSecondsSince2001;
    [v4 eventDonationTimeInSecondsSince2001];
    if (eventDonationTimeInSecondsSince2001 != v6) {
      goto LABEL_15;
    }
  }
  double v7 = [(PSESchemaPSECommonSignal *)self domain];
  NSUInteger v8 = [v4 domain];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_14;
  }
  uint64_t v9 = [(PSESchemaPSECommonSignal *)self domain];
  if (v9)
  {
    v10 = (void *)v9;
    uint64_t v11 = [(PSESchemaPSECommonSignal *)self domain];
    uint64_t v12 = [v4 domain];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  double v7 = [(PSESchemaPSECommonSignal *)self action];
  NSUInteger v8 = [v4 action];
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v14 = [(PSESchemaPSECommonSignal *)self action];
  if (v14)
  {
    double v15 = (void *)v14;
    long double v16 = [(PSESchemaPSECommonSignal *)self action];
    double v17 = [v4 action];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  $1E7707DC8BB745E69B83A7053F425171 has = self->_has;
  int v22 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v23 = v4[60];
  if (v22 == ((v23 >> 1) & 1))
  {
    if (v22)
    {
      int isDonatedBySiri = self->_isDonatedBySiri;
      if (isDonatedBySiri != [v4 isDonatedBySiri]) {
        goto LABEL_15;
      }
      $1E7707DC8BB745E69B83A7053F425171 has = self->_has;
      unsigned int v23 = v4[60];
    }
    int v25 = (*(unsigned int *)&has >> 2) & 1;
    if (v25 == ((v23 >> 2) & 1))
    {
      if (v25)
      {
        int hasUserInitiatedFollowup = self->_hasUserInitiatedFollowup;
        if (hasUserInitiatedFollowup != [v4 hasUserInitiatedFollowup]) {
          goto LABEL_15;
        }
        $1E7707DC8BB745E69B83A7053F425171 has = self->_has;
        unsigned int v23 = v4[60];
      }
      int v27 = (*(unsigned int *)&has >> 3) & 1;
      if (v27 == ((v23 >> 3) & 1))
      {
        if (v27)
        {
          int appFollowup = self->_appFollowup;
          if (appFollowup != [v4 appFollowup]) {
            goto LABEL_15;
          }
          $1E7707DC8BB745E69B83A7053F425171 has = self->_has;
          unsigned int v23 = v4[60];
        }
        int v29 = (*(unsigned int *)&has >> 4) & 1;
        if (v29 == ((v23 >> 4) & 1))
        {
          if (v29)
          {
            double appLaunchTimeInSecondsSince2001 = self->_appLaunchTimeInSecondsSince2001;
            [v4 appLaunchTimeInSecondsSince2001];
            if (appLaunchTimeInSecondsSince2001 != v31) {
              goto LABEL_15;
            }
            $1E7707DC8BB745E69B83A7053F425171 has = self->_has;
            unsigned int v23 = v4[60];
          }
          int v32 = (*(unsigned int *)&has >> 5) & 1;
          if (v32 == ((v23 >> 5) & 1))
          {
            if (!v32
              || (int appLaunchReason = self->_appLaunchReason,
                  appLaunchReason == [v4 appLaunchReason]))
            {
              BOOL v19 = 1;
              goto LABEL_16;
            }
          }
        }
      }
    }
  }
LABEL_15:
  BOOL v19 = 0;
LABEL_16:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  id v4 = [(PSESchemaPSECommonSignal *)self domain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  double v5 = [(PSESchemaPSECommonSignal *)self action];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSECommonSignalReadFrom(self, (uint64_t)a3);
}

- (void)deleteAppLaunchReason
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasAppLaunchReason:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAppLaunchReason
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAppLaunchReason:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int appLaunchReason = a3;
}

- (void)deleteAppLaunchTimeInSecondsSince2001
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasAppLaunchTimeInSecondsSince2001:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAppLaunchTimeInSecondsSince2001
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAppLaunchTimeInSecondsSince2001:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_double appLaunchTimeInSecondsSince2001 = a3;
}

- (void)deleteAppFollowup
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAppFollowup:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppFollowup
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppFollowup:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int appFollowup = a3;
}

- (void)deleteHasUserInitiatedFollowup
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHasUserInitiatedFollowup:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasUserInitiatedFollowup
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasUserInitiatedFollowup:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int hasUserInitiatedFollowup = a3;
}

- (void)deleteIsDonatedBySiri
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsDonatedBySiri:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsDonatedBySiri
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsDonatedBySiri:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isDonatedBySiri = a3;
}

- (void)deleteAction
{
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (void)deleteDomain
{
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)deleteEventDonationTimeInSecondsSince2001
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventDonationTimeInSecondsSince2001:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventDonationTimeInSecondsSince2001
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventDonationTimeInSecondsSince2001:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double eventDonationTimeInSecondsSince2001 = a3;
}

@end