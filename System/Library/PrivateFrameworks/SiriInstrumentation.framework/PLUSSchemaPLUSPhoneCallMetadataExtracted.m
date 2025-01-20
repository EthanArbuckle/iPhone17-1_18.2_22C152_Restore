@interface PLUSSchemaPLUSPhoneCallMetadataExtracted
- (BOOL)hasFollowupNameSimilarity;
- (BOOL)hasHasSiriInitiatedCall;
- (BOOL)hasHasSiriResolvedContact;
- (BOOL)hasHasUserMadeFollowupCallWithinDetectionWindow;
- (BOOL)hasHasUserMadeFollowupCallWithinEvaluationWindow;
- (BOOL)hasIsSameCallCapabilityForFollowup;
- (BOOL)hasIsSameCallRouteForSiriAndFollowup;
- (BOOL)hasOriginalPlusId;
- (BOOL)hasSiriAndFollowupContactComparison;
- (BOOL)hasSiriCallDuration;
- (BOOL)hasSiriCallTimeToHangup;
- (BOOL)hasSiriInitiatedCall;
- (BOOL)hasSiriResolvedContact;
- (BOOL)hasUserMadeFollowupCallWithinDetectionWindow;
- (BOOL)hasUserMadeFollowupCallWithinEvaluationWindow;
- (BOOL)hasUserTimeToFollowup;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSameCallCapabilityForFollowup;
- (BOOL)isSameCallRouteForSiriAndFollowup;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSPhoneCallMetadataExtracted)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSPhoneCallMetadataExtracted)initWithJSON:(id)a3;
- (SISchemaUUID)originalPlusId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)followupNameSimilarity;
- (int)siriAndFollowupContactComparison;
- (int)siriCallDuration;
- (int)siriCallTimeToHangup;
- (int)userTimeToFollowup;
- (unint64_t)hash;
- (void)deleteFollowupNameSimilarity;
- (void)deleteHasSiriInitiatedCall;
- (void)deleteHasSiriResolvedContact;
- (void)deleteHasUserMadeFollowupCallWithinDetectionWindow;
- (void)deleteHasUserMadeFollowupCallWithinEvaluationWindow;
- (void)deleteIsSameCallCapabilityForFollowup;
- (void)deleteIsSameCallRouteForSiriAndFollowup;
- (void)deleteOriginalPlusId;
- (void)deleteSiriAndFollowupContactComparison;
- (void)deleteSiriCallDuration;
- (void)deleteSiriCallTimeToHangup;
- (void)deleteUserTimeToFollowup;
- (void)setFollowupNameSimilarity:(int)a3;
- (void)setHasFollowupNameSimilarity:(BOOL)a3;
- (void)setHasHasSiriInitiatedCall:(BOOL)a3;
- (void)setHasHasSiriResolvedContact:(BOOL)a3;
- (void)setHasHasUserMadeFollowupCallWithinDetectionWindow:(BOOL)a3;
- (void)setHasHasUserMadeFollowupCallWithinEvaluationWindow:(BOOL)a3;
- (void)setHasIsSameCallCapabilityForFollowup:(BOOL)a3;
- (void)setHasIsSameCallRouteForSiriAndFollowup:(BOOL)a3;
- (void)setHasOriginalPlusId:(BOOL)a3;
- (void)setHasSiriAndFollowupContactComparison:(BOOL)a3;
- (void)setHasSiriCallDuration:(BOOL)a3;
- (void)setHasSiriCallTimeToHangup:(BOOL)a3;
- (void)setHasSiriInitiatedCall:(BOOL)a3;
- (void)setHasSiriResolvedContact:(BOOL)a3;
- (void)setHasUserMadeFollowupCallWithinDetectionWindow:(BOOL)a3;
- (void)setHasUserMadeFollowupCallWithinEvaluationWindow:(BOOL)a3;
- (void)setHasUserTimeToFollowup:(BOOL)a3;
- (void)setIsSameCallCapabilityForFollowup:(BOOL)a3;
- (void)setIsSameCallRouteForSiriAndFollowup:(BOOL)a3;
- (void)setOriginalPlusId:(id)a3;
- (void)setSiriAndFollowupContactComparison:(int)a3;
- (void)setSiriCallDuration:(int)a3;
- (void)setSiriCallTimeToHangup:(int)a3;
- (void)setUserTimeToFollowup:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSPhoneCallMetadataExtracted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSPhoneCallMetadataExtracted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self originalPlusId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self deleteOriginalPlusId];
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

- (void)setHasOriginalPlusId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (int)followupNameSimilarity
{
  return self->_followupNameSimilarity;
}

- (BOOL)isSameCallCapabilityForFollowup
{
  return self->_isSameCallCapabilityForFollowup;
}

- (BOOL)isSameCallRouteForSiriAndFollowup
{
  return self->_isSameCallRouteForSiriAndFollowup;
}

- (int)userTimeToFollowup
{
  return self->_userTimeToFollowup;
}

- (int)siriCallTimeToHangup
{
  return self->_siriCallTimeToHangup;
}

- (int)siriCallDuration
{
  return self->_siriCallDuration;
}

- (int)siriAndFollowupContactComparison
{
  return self->_siriAndFollowupContactComparison;
}

- (BOOL)hasUserMadeFollowupCallWithinEvaluationWindow
{
  return self->_hasUserMadeFollowupCallWithinEvaluationWindow;
}

- (BOOL)hasUserMadeFollowupCallWithinDetectionWindow
{
  return self->_hasUserMadeFollowupCallWithinDetectionWindow;
}

- (BOOL)hasSiriInitiatedCall
{
  return self->_hasSiriInitiatedCall;
}

- (BOOL)hasSiriResolvedContact
{
  return self->_hasSiriResolvedContact;
}

- (void)setOriginalPlusId:(id)a3
{
}

- (SISchemaUUID)originalPlusId
{
  return self->_originalPlusId;
}

- (PLUSSchemaPLUSPhoneCallMetadataExtracted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PLUSSchemaPLUSPhoneCallMetadataExtracted;
  v5 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"originalPlusId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)v5 setOriginalPlusId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"hasSiriResolvedContact"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasSiriResolvedContact:](v5, "setHasSiriResolvedContact:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"hasSiriInitiatedCall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasSiriInitiatedCall:](v5, "setHasSiriInitiatedCall:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"hasUserMadeFollowupCallWithinDetectionWindow"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasUserMadeFollowupCallWithinDetectionWindow:](v5, "setHasUserMadeFollowupCallWithinDetectionWindow:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"hasUserMadeFollowupCallWithinEvaluationWindow"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasUserMadeFollowupCallWithinEvaluationWindow:](v5, "setHasUserMadeFollowupCallWithinEvaluationWindow:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"siriAndFollowupContactComparison"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriAndFollowupContactComparison:](v5, "setSiriAndFollowupContactComparison:", [v12 intValue]);
    }
    v22 = v12;
    v13 = [v4 objectForKeyedSubscript:@"siriCallDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriCallDuration:](v5, "setSiriCallDuration:", [v13 intValue]);
    }
    v25 = v8;
    v14 = [v4 objectForKeyedSubscript:@"siriCallTimeToHangup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriCallTimeToHangup:](v5, "setSiriCallTimeToHangup:", [v14 intValue]);
    }
    v26 = (void *)v6;
    v15 = [v4 objectForKeyedSubscript:@"userTimeToFollowup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setUserTimeToFollowup:](v5, "setUserTimeToFollowup:", [v15 intValue]);
    }
    v23 = v11;
    v24 = v9;
    v16 = [v4 objectForKeyedSubscript:@"isSameCallRouteForSiriAndFollowup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setIsSameCallRouteForSiriAndFollowup:](v5, "setIsSameCallRouteForSiriAndFollowup:", [v16 BOOLValue]);
    }
    v17 = v10;
    v18 = [v4 objectForKeyedSubscript:@"isSameCallCapabilityForFollowup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setIsSameCallCapabilityForFollowup:](v5, "setIsSameCallCapabilityForFollowup:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"followupNameSimilarity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setFollowupNameSimilarity:](v5, "setFollowupNameSimilarity:", [v19 intValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSPhoneCallMetadataExtracted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self dictionaryRepresentation];
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
  if ((has & 0x400) != 0)
  {
    unsigned int v5 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self followupNameSimilarity] - 1;
    if (v5 > 3) {
      uint64_t v6 = @"PLUSCONTACTNAMESTRINGSIMILARITY_UNKNOWN";
    }
    else {
      uint64_t v6 = off_1E5EB40D0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"followupNameSimilarity"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted hasSiriInitiatedCall](self, "hasSiriInitiatedCall"));
    [v3 setObject:v10 forKeyedSubscript:@"hasSiriInitiatedCall"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_8:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_8;
  }
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted hasSiriResolvedContact](self, "hasSiriResolvedContact"));
  [v3 setObject:v11 forKeyedSubscript:@"hasSiriResolvedContact"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted hasUserMadeFollowupCallWithinDetectionWindow](self, "hasUserMadeFollowupCallWithinDetectionWindow"));
  [v3 setObject:v12 forKeyedSubscript:@"hasUserMadeFollowupCallWithinDetectionWindow"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted hasUserMadeFollowupCallWithinEvaluationWindow](self, "hasUserMadeFollowupCallWithinEvaluationWindow"));
  [v3 setObject:v13 forKeyedSubscript:@"hasUserMadeFollowupCallWithinEvaluationWindow"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_20:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted isSameCallCapabilityForFollowup](self, "isSameCallCapabilityForFollowup"));
  [v3 setObject:v14 forKeyedSubscript:@"isSameCallCapabilityForFollowup"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted isSameCallRouteForSiriAndFollowup](self, "isSameCallRouteForSiriAndFollowup"));
    [v3 setObject:v7 forKeyedSubscript:@"isSameCallRouteForSiriAndFollowup"];
  }
LABEL_13:
  if (self->_originalPlusId)
  {
    v8 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self originalPlusId];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"originalPlusId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"originalPlusId"];
    }
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x10) != 0)
  {
    unsigned int v17 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self siriAndFollowupContactComparison]- 1;
    if (v17 > 4) {
      v18 = @"PLUSCONTACTREFERENCECOMPARISON_UNKNOWN";
    }
    else {
      v18 = off_1E5EB40F0[v17];
    }
    [v3 setObject:v18 forKeyedSubscript:@"siriAndFollowupContactComparison"];
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x20) == 0)
    {
LABEL_26:
      if ((v16 & 0x40) == 0) {
        goto LABEL_27;
      }
LABEL_37:
      unsigned int v21 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self siriCallTimeToHangup] - 1;
      if (v21 > 3) {
        v22 = @"PLUSPHONECALLTIMETOHANGUPBUCKET_UNKNOWN";
      }
      else {
        v22 = off_1E5EB4140[v21];
      }
      [v3 setObject:v22 forKeyedSubscript:@"siriCallTimeToHangup"];
      if ((*(_WORD *)&self->_has & 0x80) == 0) {
        goto LABEL_45;
      }
      goto LABEL_41;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_26;
  }
  unsigned int v19 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self siriCallDuration] - 1;
  if (v19 > 4) {
    v20 = @"PLUSPHONECALLDURATIONBUCKET_UNKNOWN";
  }
  else {
    v20 = off_1E5EB4118[v19];
  }
  [v3 setObject:v20 forKeyedSubscript:@"siriCallDuration"];
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x40) != 0) {
    goto LABEL_37;
  }
LABEL_27:
  if ((v16 & 0x80) != 0)
  {
LABEL_41:
    unsigned int v23 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self userTimeToFollowup] - 1;
    if (v23 > 3) {
      v24 = @"PLUSTIMETOFOLLOWUPBUCKET_UNKNOWN";
    }
    else {
      v24 = off_1E5EB4160[v23];
    }
    [v3 setObject:v24 forKeyedSubscript:@"userTimeToFollowup"];
  }
LABEL_45:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalPlusId hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v5 = 2654435761 * self->_hasSiriResolvedContact;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_hasSiriInitiatedCall;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_hasUserMadeFollowupCallWithinDetectionWindow;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_hasUserMadeFollowupCallWithinEvaluationWindow;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_siriAndFollowupContactComparison;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_siriCallDuration;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v10 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_siriCallTimeToHangup;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v11 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_userTimeToFollowup;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_isSameCallRouteForSiriAndFollowup;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v15 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_isSameCallCapabilityForFollowup;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v15 = 2654435761 * self->_followupNameSimilarity;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self originalPlusId];
  uint64_t v6 = [v4 originalPlusId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_52;
  }
  uint64_t v8 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self originalPlusId];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self originalPlusId];
    uint64_t v11 = [v4 originalPlusId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  $85DA9350D4ED826A90B1925CA907032D has = self->_has;
  unsigned int v14 = v4[22];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_52:
    BOOL v36 = 0;
    goto LABEL_53;
  }
  if (*(unsigned char *)&has)
  {
    int hasSiriResolvedContact = self->_hasSiriResolvedContact;
    if (hasSiriResolvedContact != [v4 hasSiriResolvedContact]) {
      goto LABEL_52;
    }
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    unsigned int v14 = v4[22];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_52;
  }
  if (v16)
  {
    int hasSiriInitiatedCall = self->_hasSiriInitiatedCall;
    if (hasSiriInitiatedCall != [v4 hasSiriInitiatedCall]) {
      goto LABEL_52;
    }
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    unsigned int v14 = v4[22];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_52;
  }
  if (v18)
  {
    int hasUserMadeFollowupCallWithinDetectionWindow = self->_hasUserMadeFollowupCallWithinDetectionWindow;
    if (hasUserMadeFollowupCallWithinDetectionWindow != [v4 hasUserMadeFollowupCallWithinDetectionWindow])goto LABEL_52; {
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    }
    unsigned int v14 = v4[22];
  }
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_52;
  }
  if (v20)
  {
    int hasUserMadeFollowupCallWithinEvaluationWindow = self->_hasUserMadeFollowupCallWithinEvaluationWindow;
    if (hasUserMadeFollowupCallWithinEvaluationWindow != [v4 hasUserMadeFollowupCallWithinEvaluationWindow])goto LABEL_52; {
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    }
    unsigned int v14 = v4[22];
  }
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_52;
  }
  if (v22)
  {
    int siriAndFollowupContactComparison = self->_siriAndFollowupContactComparison;
    if (siriAndFollowupContactComparison != [v4 siriAndFollowupContactComparison]) {
      goto LABEL_52;
    }
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    unsigned int v14 = v4[22];
  }
  int v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1)) {
    goto LABEL_52;
  }
  if (v24)
  {
    int siriCallDuration = self->_siriCallDuration;
    if (siriCallDuration != [v4 siriCallDuration]) {
      goto LABEL_52;
    }
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    unsigned int v14 = v4[22];
  }
  int v26 = (*(unsigned int *)&has >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1)) {
    goto LABEL_52;
  }
  if (v26)
  {
    int siriCallTimeToHangup = self->_siriCallTimeToHangup;
    if (siriCallTimeToHangup != [v4 siriCallTimeToHangup]) {
      goto LABEL_52;
    }
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    unsigned int v14 = v4[22];
  }
  int v28 = (*(unsigned int *)&has >> 7) & 1;
  if (v28 != ((v14 >> 7) & 1)) {
    goto LABEL_52;
  }
  if (v28)
  {
    int userTimeToFollowup = self->_userTimeToFollowup;
    if (userTimeToFollowup != [v4 userTimeToFollowup]) {
      goto LABEL_52;
    }
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    unsigned int v14 = v4[22];
  }
  int v30 = (*(unsigned int *)&has >> 8) & 1;
  if (v30 != ((v14 >> 8) & 1)) {
    goto LABEL_52;
  }
  if (v30)
  {
    int isSameCallRouteForSiriAndFollowup = self->_isSameCallRouteForSiriAndFollowup;
    if (isSameCallRouteForSiriAndFollowup != [v4 isSameCallRouteForSiriAndFollowup]) {
      goto LABEL_52;
    }
    $85DA9350D4ED826A90B1925CA907032D has = self->_has;
    unsigned int v14 = v4[22];
  }
  int v32 = (*(unsigned int *)&has >> 9) & 1;
  if (v32 != ((v14 >> 9) & 1)) {
    goto LABEL_52;
  }
  if (v32)
  {
    int isSameCallCapabilityForFollowup = self->_isSameCallCapabilityForFollowup;
    if (isSameCallCapabilityForFollowup == [v4 isSameCallCapabilityForFollowup])
    {
      $85DA9350D4ED826A90B1925CA907032D has = self->_has;
      unsigned int v14 = v4[22];
      goto LABEL_48;
    }
    goto LABEL_52;
  }
LABEL_48:
  int v34 = (*(unsigned int *)&has >> 10) & 1;
  if (v34 != ((v14 >> 10) & 1)) {
    goto LABEL_52;
  }
  if (v34)
  {
    int followupNameSimilarity = self->_followupNameSimilarity;
    if (followupNameSimilarity != [v4 followupNameSimilarity]) {
      goto LABEL_52;
    }
  }
  BOOL v36 = 1;
LABEL_53:

  return v36;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self originalPlusId];

  if (v4)
  {
    uint64_t v5 = [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self originalPlusId];
    PBDataWriterWriteSubmessage();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v7 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  uint64_t v7 = v8;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_16:
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSPhoneCallMetadataExtractedReadFrom(self, (uint64_t)a3);
}

- (void)deleteFollowupNameSimilarity
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasFollowupNameSimilarity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasFollowupNameSimilarity
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setFollowupNameSimilarity:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int followupNameSimilarity = a3;
}

- (void)deleteIsSameCallCapabilityForFollowup
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasIsSameCallCapabilityForFollowup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsSameCallCapabilityForFollowup
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsSameCallCapabilityForFollowup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int isSameCallCapabilityForFollowup = a3;
}

- (void)deleteIsSameCallRouteForSiriAndFollowup
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasIsSameCallRouteForSiriAndFollowup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsSameCallRouteForSiriAndFollowup
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsSameCallRouteForSiriAndFollowup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int isSameCallRouteForSiriAndFollowup = a3;
}

- (void)deleteUserTimeToFollowup
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasUserTimeToFollowup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasUserTimeToFollowup
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setUserTimeToFollowup:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int userTimeToFollowup = a3;
}

- (void)deleteSiriCallTimeToHangup
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasSiriCallTimeToHangup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSiriCallTimeToHangup
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSiriCallTimeToHangup:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int siriCallTimeToHangup = a3;
}

- (void)deleteSiriCallDuration
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasSiriCallDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSiriCallDuration
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSiriCallDuration:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int siriCallDuration = a3;
}

- (void)deleteSiriAndFollowupContactComparison
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasSiriAndFollowupContactComparison:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSiriAndFollowupContactComparison
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSiriAndFollowupContactComparison:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int siriAndFollowupContactComparison = a3;
}

- (void)deleteHasUserMadeFollowupCallWithinEvaluationWindow
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasHasUserMadeFollowupCallWithinEvaluationWindow:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHasUserMadeFollowupCallWithinEvaluationWindow
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasUserMadeFollowupCallWithinEvaluationWindow:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int hasUserMadeFollowupCallWithinEvaluationWindow = a3;
}

- (void)deleteHasUserMadeFollowupCallWithinDetectionWindow
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasHasUserMadeFollowupCallWithinDetectionWindow:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHasUserMadeFollowupCallWithinDetectionWindow
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasUserMadeFollowupCallWithinDetectionWindow:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int hasUserMadeFollowupCallWithinDetectionWindow = a3;
}

- (void)deleteHasSiriInitiatedCall
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasHasSiriInitiatedCall:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHasSiriInitiatedCall
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasSiriInitiatedCall:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int hasSiriInitiatedCall = a3;
}

- (void)deleteHasSiriResolvedContact
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasHasSiriResolvedContact:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasHasSiriResolvedContact
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasSiriResolvedContact:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int hasSiriResolvedContact = a3;
}

- (void)deleteOriginalPlusId
{
}

- (BOOL)hasOriginalPlusId
{
  return self->_originalPlusId != 0;
}

@end