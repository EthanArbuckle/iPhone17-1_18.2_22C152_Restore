@interface PSESchemaPSECall
- (BOOL)hasCallDurationInSeconds;
- (BOOL)hasContactFirstNamePhoneticScore;
- (BOOL)hasContactFullNamePhoneticScore;
- (BOOL)hasContactLastNamePhoneticScore;
- (BOOL)hasContactMatch;
- (BOOL)hasDisconnectedReason;
- (BOOL)hasHasUserInitiatedFollowup;
- (BOOL)hasRecentCallStatus;
- (BOOL)hasTimeToEstablishInSeconds;
- (BOOL)hasUserInitiatedFollowup;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PSESchemaPSECall)initWithDictionary:(id)a3;
- (PSESchemaPSECall)initWithJSON:(id)a3;
- (double)callDurationInSeconds;
- (double)contactFirstNamePhoneticScore;
- (double)contactFullNamePhoneticScore;
- (double)contactLastNamePhoneticScore;
- (double)timeToEstablishInSeconds;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)contactMatch;
- (int)disconnectedReason;
- (int)recentCallStatus;
- (unint64_t)hash;
- (void)deleteCallDurationInSeconds;
- (void)deleteContactFirstNamePhoneticScore;
- (void)deleteContactFullNamePhoneticScore;
- (void)deleteContactLastNamePhoneticScore;
- (void)deleteContactMatch;
- (void)deleteDisconnectedReason;
- (void)deleteHasUserInitiatedFollowup;
- (void)deleteRecentCallStatus;
- (void)deleteTimeToEstablishInSeconds;
- (void)setCallDurationInSeconds:(double)a3;
- (void)setContactFirstNamePhoneticScore:(double)a3;
- (void)setContactFullNamePhoneticScore:(double)a3;
- (void)setContactLastNamePhoneticScore:(double)a3;
- (void)setContactMatch:(int)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setHasCallDurationInSeconds:(BOOL)a3;
- (void)setHasContactFirstNamePhoneticScore:(BOOL)a3;
- (void)setHasContactFullNamePhoneticScore:(BOOL)a3;
- (void)setHasContactLastNamePhoneticScore:(BOOL)a3;
- (void)setHasContactMatch:(BOOL)a3;
- (void)setHasDisconnectedReason:(BOOL)a3;
- (void)setHasHasUserInitiatedFollowup:(BOOL)a3;
- (void)setHasRecentCallStatus:(BOOL)a3;
- (void)setHasTimeToEstablishInSeconds:(BOOL)a3;
- (void)setHasUserInitiatedFollowup:(BOOL)a3;
- (void)setRecentCallStatus:(int)a3;
- (void)setTimeToEstablishInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSECall

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

- (int)disconnectedReason
{
  return self->_disconnectedReason;
}

- (int)recentCallStatus
{
  return self->_recentCallStatus;
}

- (double)timeToEstablishInSeconds
{
  return self->_timeToEstablishInSeconds;
}

- (BOOL)hasUserInitiatedFollowup
{
  return self->_hasUserInitiatedFollowup;
}

- (double)callDurationInSeconds
{
  return self->_callDurationInSeconds;
}

- (PSESchemaPSECall)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PSESchemaPSECall;
  v5 = [(PSESchemaPSECall *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"callDurationInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[PSESchemaPSECall setCallDurationInSeconds:](v5, "setCallDurationInSeconds:");
    }
    v7 = [v4 objectForKeyedSubscript:@"hasUserInitiatedFollowup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSECall setHasUserInitiatedFollowup:](v5, "setHasUserInitiatedFollowup:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"timeToEstablishInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[PSESchemaPSECall setTimeToEstablishInSeconds:](v5, "setTimeToEstablishInSeconds:");
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"recentCallStatus", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSECall setRecentCallStatus:](v5, "setRecentCallStatus:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"disconnectedReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSECall setDisconnectedReason:](v5, "setDisconnectedReason:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"contactMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSECall setContactMatch:](v5, "setContactMatch:", [v11 intValue]);
    }
    v19 = v7;
    v12 = [v4 objectForKeyedSubscript:@"contactFullNamePhoneticScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[PSESchemaPSECall setContactFullNamePhoneticScore:](v5, "setContactFullNamePhoneticScore:");
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"contactFirstNamePhoneticScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      -[PSESchemaPSECall setContactFirstNamePhoneticScore:](v5, "setContactFirstNamePhoneticScore:");
    }
    v15 = [v4 objectForKeyedSubscript:@"contactLastNamePhoneticScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 doubleValue];
      -[PSESchemaPSECall setContactLastNamePhoneticScore:](v5, "setContactLastNamePhoneticScore:");
    }
    v16 = v5;
  }
  return v5;
}

- (PSESchemaPSECall)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSECall *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSECall *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v8 = NSNumber;
    [(PSESchemaPSECall *)self callDurationInSeconds];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"callDurationInSeconds"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(PSESchemaPSECall *)self contactFirstNamePhoneticScore];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"contactFirstNamePhoneticScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v12 = NSNumber;
  [(PSESchemaPSECall *)self contactFullNamePhoneticScore];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:@"contactFullNamePhoneticScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v14 = NSNumber;
  [(PSESchemaPSECall *)self contactLastNamePhoneticScore];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v15 forKeyedSubscript:@"contactLastNamePhoneticScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_18:
  unsigned int v16 = [(PSESchemaPSECall *)self contactMatch] - 1;
  if (v16 > 2) {
    v17 = @"PSEMESSAGECONTACTMATCH_UNKNOWN";
  }
  else {
    v17 = off_1E5EBA120[v16];
  }
  [v3 setObject:v17 forKeyedSubscript:@"contactMatch"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_65;
  }
LABEL_22:
  int v18 = [(PSESchemaPSECall *)self disconnectedReason];
  switch(v18)
  {
    case 1:
      v19 = @"PSECALLDISCONNECTEDREASON_REMOTEHANGUP";
      break;
    case 2:
      v19 = @"PSECALLDISCONNECTEDREASON_DECLINED";
      break;
    case 3:
      v19 = @"PSECALLDISCONNECTEDREASON_DECLINED_ELSEWHERE";
      break;
    case 4:
      v19 = @"PSECALLDISCONNECTEDREASON_ANSWERED_ELSEWHERE";
      break;
    case 5:
      v19 = @"PSECALLDISCONNECTEDREASON_RELAY_FAILED_RELAY_DEVICE_RELAY_NOT_ENABLED";
      break;
    case 6:
      v19 = @"PSECALLDISCONNECTEDREASON_REMOTE_UNAVAILABLE";
      break;
    case 7:
      v19 = @"PSECALLDISCONNECTEDREASON_REMOTE_BUSY";
      break;
    case 8:
      v19 = @"PSECALLDISCONNECTEDREASON_NO_LOCAL_LINK";
      break;
    case 9:
      v19 = @"PSECALLDISCONNECTEDREASON_ACCOUNT_UNSUPPORTED";
      break;
    case 10:
      v19 = @"PSECALLDISCONNECTEDREASON_NETWORK_UNSUPPORTED";
      break;
    case 11:
      v19 = @"PSECALLDISCONNECTEDREASON_CALL_FAILED";
      break;
    case 12:
      v19 = @"PSECALLDISCONNECTEDREASON_DIAL_FAILED";
      break;
    case 13:
      v19 = @"PSECALLDISCONNECTEDREASON_COMPONENT_CRASHED";
      break;
    case 14:
      v19 = @"PSECALLDISCONNECTEDREASON_RELAY_FAILED_CONFERENCE_FAILED";
      break;
    case 15:
      v19 = @"PSECALLDISCONNECTEDREASON_RELAY_FAILED_NO_RELAY_DEVICE";
      break;
    case 16:
      v19 = @"PSECALLDISCONNECTEDREASON_HOST_DEVICE_BUSY";
      break;
    case 17:
      v19 = @"PSECALLDISCONNECTEDREASON_CLIENT_DEVICE_BUSY";
      break;
    case 18:
      v19 = @"PSECALLDISCONNECTEDREASON_DECLINED_WITH_TEXT";
      break;
    case 19:
      v19 = @"PSECALLDISCONNECTEDREASON_HANDED_OFF";
      break;
    case 20:
      v19 = @"PSECALLDISCONNECTEDREASON_MMI_OR_USSD_LIKELY";
      break;
    case 21:
      v19 = @"PSECALLDISCONNECTEDREASON_FILTERED_OUT";
      break;
    case 22:
      v19 = @"PSECALLDISCONNECTEDREASON_PROVIDER_CRASHED";
      break;
    case 23:
      v19 = @"PSECALLDISCONNECTEDREASON_MEDIA_START_FAILED";
      break;
    case 24:
      v19 = @"PSECALLDISCONNECTEDREASON_MEDIA_SERVER_CRASHED";
      break;
    case 25:
      v19 = @"PSECALLDISCONNECTEDREASON_MANAGED_DEVICE_POLICY_RESTRICTED";
      break;
    case 26:
      v19 = @"PSECALLDISCONNECTEDREASON_KICKED";
      break;
    case 27:
      v19 = @"PSECALLDISCONNECTEDREASON_LET_ME_IN_REQUEST_REJECTED";
      break;
    case 28:
      v19 = @"PSECALLDISCONNECTEDREASON_INVALID_CONVERSATION_LINK";
      break;
    case 29:
      v19 = @"PSECALLDISCONNECTEDREASON_CONVERSATION_LINKS_DISABLED";
      break;
    case 30:
      v19 = @"PSECALLDISCONNECTEDREASON_NO_DESTINATIONS_AVAILABLE";
      break;
    case 31:
      v19 = @"PSECALLDISCONNECTEDREASON_CALL_FAILED_NIL_CALL_PROVIDER";
      break;
    case 32:
      v19 = @"PSECALLDISCONNECTEDREASON_APPLICATION_NOT_FOREGROUNDED";
      break;
    case 33:
      v19 = @"PSECALLDISCONNECTEDREASON_AVCONFERENCED_CRASHED";
      break;
    case 34:
      v19 = @"PSECALLDISCONNECTEDREASON_CALL_AGAIN";
      break;
    case 35:
      v19 = @"PSECALLDISCONNECTEDREASON_UNKNOWN_PARTICIPANT_ADDED";
      break;
    case 36:
      v19 = @"PSECALLDISCONNECTEDREASON_CALL_SCREENING_TIMEOUT";
      break;
    default:
      objc_super v20 = @"PSECALLDISCONNECTEDREASON_UNKNOWN";
      if (v18 == 1001) {
        objc_super v20 = @"PSECALLDISCONNECTEDREASON_IDS_QUERY_RATE_LIMITED";
      }
      if (v18 == 1000) {
        v19 = @"PSECALLDISCONNECTEDREASON_DECRYPTION_TIMEOUT";
      }
      else {
        v19 = v20;
      }
      break;
  }
  [v3 setObject:v19 forKeyedSubscript:@"disconnectedReason"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_66;
  }
LABEL_65:
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSECall hasUserInitiatedFollowup](self, "hasUserInitiatedFollowup"));
  [v3 setObject:v21 forKeyedSubscript:@"hasUserInitiatedFollowup"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_66:
  unsigned int v22 = [(PSESchemaPSECall *)self recentCallStatus] - 1;
  if (v22 > 9) {
    v23 = @"PSECALLSTATUS_UNKNOWN";
  }
  else {
    v23 = off_1E5EBA138[v22];
  }
  [v3 setObject:v23 forKeyedSubscript:@"recentCallStatus"];
  if ((*(_WORD *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_10:
  v5 = NSNumber;
  [(PSESchemaPSECall *)self timeToEstablishInSeconds];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"timeToEstablishInSeconds"];

LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    double callDurationInSeconds = self->_callDurationInSeconds;
    double v6 = -callDurationInSeconds;
    if (callDurationInSeconds >= 0.0) {
      double v6 = self->_callDurationInSeconds;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v33 = 2654435761 * self->_hasUserInitiatedFollowup;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v13 = 0;
    goto LABEL_19;
  }
  uint64_t v33 = 0;
  if ((has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double timeToEstablishInSeconds = self->_timeToEstablishInSeconds;
  double v10 = -timeToEstablishInSeconds;
  if (timeToEstablishInSeconds >= 0.0) {
    double v10 = self->_timeToEstablishInSeconds;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((has & 8) != 0)
  {
    uint64_t v14 = 2654435761 * self->_recentCallStatus;
    if ((has & 0x10) != 0)
    {
LABEL_21:
      uint64_t v15 = 2654435761 * self->_disconnectedReason;
      if ((has & 0x20) != 0) {
        goto LABEL_22;
      }
LABEL_29:
      uint64_t v16 = 0;
      if ((has & 0x40) != 0) {
        goto LABEL_23;
      }
LABEL_30:
      unint64_t v21 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v15 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_29;
  }
LABEL_22:
  uint64_t v16 = 2654435761 * self->_contactMatch;
  if ((has & 0x40) == 0) {
    goto LABEL_30;
  }
LABEL_23:
  double contactFullNamePhoneticScore = self->_contactFullNamePhoneticScore;
  double v18 = -contactFullNamePhoneticScore;
  if (contactFullNamePhoneticScore >= 0.0) {
    double v18 = self->_contactFullNamePhoneticScore;
  }
  long double v19 = floor(v18 + 0.5);
  double v20 = (v18 - v19) * 1.84467441e19;
  unint64_t v21 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
  if (v20 >= 0.0)
  {
    if (v20 > 0.0) {
      v21 += (unint64_t)v20;
    }
  }
  else
  {
    v21 -= (unint64_t)fabs(v20);
  }
LABEL_33:
  if ((has & 0x80) != 0)
  {
    double contactFirstNamePhoneticScore = self->_contactFirstNamePhoneticScore;
    double v24 = -contactFirstNamePhoneticScore;
    if (contactFirstNamePhoneticScore >= 0.0) {
      double v24 = self->_contactFirstNamePhoneticScore;
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
  if ((has & 0x100) != 0)
  {
    double contactLastNamePhoneticScore = self->_contactLastNamePhoneticScore;
    double v29 = -contactLastNamePhoneticScore;
    if (contactLastNamePhoneticScore >= 0.0) {
      double v29 = self->_contactLastNamePhoneticScore;
    }
    long double v30 = floor(v29 + 0.5);
    double v31 = (v29 - v30) * 1.84467441e19;
    unint64_t v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0) {
        v27 += (unint64_t)v31;
      }
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  return v33 ^ v4 ^ v13 ^ v14 ^ v15 ^ v16 ^ v21 ^ v22 ^ v27;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  $AB42235949FEB2A84C82C63A61872421 has = self->_has;
  unsigned int v6 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_37;
  }
  if (*(unsigned char *)&has)
  {
    double callDurationInSeconds = self->_callDurationInSeconds;
    [v4 callDurationInSeconds];
    if (callDurationInSeconds != v8) {
      goto LABEL_37;
    }
    $AB42235949FEB2A84C82C63A61872421 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      int hasUserInitiatedFollowup = self->_hasUserInitiatedFollowup;
      if (hasUserInitiatedFollowup != [v4 hasUserInitiatedFollowup]) {
        goto LABEL_37;
      }
      $AB42235949FEB2A84C82C63A61872421 has = self->_has;
      unsigned int v6 = v4[36];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        double timeToEstablishInSeconds = self->_timeToEstablishInSeconds;
        [v4 timeToEstablishInSeconds];
        if (timeToEstablishInSeconds != v13) {
          goto LABEL_37;
        }
        $AB42235949FEB2A84C82C63A61872421 has = self->_has;
        unsigned int v6 = v4[36];
      }
      int v14 = (*(unsigned int *)&has >> 3) & 1;
      if (v14 == ((v6 >> 3) & 1))
      {
        if (v14)
        {
          int recentCallStatus = self->_recentCallStatus;
          if (recentCallStatus != [v4 recentCallStatus]) {
            goto LABEL_37;
          }
          $AB42235949FEB2A84C82C63A61872421 has = self->_has;
          unsigned int v6 = v4[36];
        }
        int v16 = (*(unsigned int *)&has >> 4) & 1;
        if (v16 == ((v6 >> 4) & 1))
        {
          if (v16)
          {
            int disconnectedReason = self->_disconnectedReason;
            if (disconnectedReason != [v4 disconnectedReason]) {
              goto LABEL_37;
            }
            $AB42235949FEB2A84C82C63A61872421 has = self->_has;
            unsigned int v6 = v4[36];
          }
          int v18 = (*(unsigned int *)&has >> 5) & 1;
          if (v18 == ((v6 >> 5) & 1))
          {
            if (v18)
            {
              int contactMatch = self->_contactMatch;
              if (contactMatch != [v4 contactMatch]) {
                goto LABEL_37;
              }
              $AB42235949FEB2A84C82C63A61872421 has = self->_has;
              unsigned int v6 = v4[36];
            }
            int v20 = (*(unsigned int *)&has >> 6) & 1;
            if (v20 == ((v6 >> 6) & 1))
            {
              if (v20)
              {
                double contactFullNamePhoneticScore = self->_contactFullNamePhoneticScore;
                [v4 contactFullNamePhoneticScore];
                if (contactFullNamePhoneticScore != v22) {
                  goto LABEL_37;
                }
                $AB42235949FEB2A84C82C63A61872421 has = self->_has;
                unsigned int v6 = v4[36];
              }
              int v23 = (*(unsigned int *)&has >> 7) & 1;
              if (v23 == ((v6 >> 7) & 1))
              {
                if (v23)
                {
                  double contactFirstNamePhoneticScore = self->_contactFirstNamePhoneticScore;
                  [v4 contactFirstNamePhoneticScore];
                  if (contactFirstNamePhoneticScore != v25) {
                    goto LABEL_37;
                  }
                  $AB42235949FEB2A84C82C63A61872421 has = self->_has;
                  unsigned int v6 = v4[36];
                }
                int v26 = (*(unsigned int *)&has >> 8) & 1;
                if (v26 == ((v6 >> 8) & 1))
                {
                  if (!v26
                    || (double contactLastNamePhoneticScore = self->_contactLastNamePhoneticScore,
                        [v4 contactLastNamePhoneticScore],
                        contactLastNamePhoneticScore == v28))
                  {
                    BOOL v29 = 1;
                    goto LABEL_38;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_37:
  BOOL v29 = 0;
LABEL_38:

  return v29;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteDoubleField();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSECallReadFrom(self, (uint64_t)a3);
}

- (void)deleteContactLastNamePhoneticScore
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasContactLastNamePhoneticScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasContactLastNamePhoneticScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setContactLastNamePhoneticScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_double contactLastNamePhoneticScore = a3;
}

- (void)deleteContactFirstNamePhoneticScore
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasContactFirstNamePhoneticScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasContactFirstNamePhoneticScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setContactFirstNamePhoneticScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_double contactFirstNamePhoneticScore = a3;
}

- (void)deleteContactFullNamePhoneticScore
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasContactFullNamePhoneticScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasContactFullNamePhoneticScore
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setContactFullNamePhoneticScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_double contactFullNamePhoneticScore = a3;
}

- (void)deleteContactMatch
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasContactMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasContactMatch
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setContactMatch:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int contactMatch = a3;
}

- (void)deleteDisconnectedReason
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasDisconnectedReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDisconnectedReason
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDisconnectedReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int disconnectedReason = a3;
}

- (void)deleteRecentCallStatus
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasRecentCallStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRecentCallStatus
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRecentCallStatus:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int recentCallStatus = a3;
}

- (void)deleteTimeToEstablishInSeconds
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasTimeToEstablishInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimeToEstablishInSeconds
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTimeToEstablishInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_double timeToEstablishInSeconds = a3;
}

- (void)deleteHasUserInitiatedFollowup
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasHasUserInitiatedFollowup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHasUserInitiatedFollowup
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasUserInitiatedFollowup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int hasUserInitiatedFollowup = a3;
}

- (void)deleteCallDurationInSeconds
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasCallDurationInSeconds:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCallDurationInSeconds
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCallDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_double callDurationInSeconds = a3;
}

@end