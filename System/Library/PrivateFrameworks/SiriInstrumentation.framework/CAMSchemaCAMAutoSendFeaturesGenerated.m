@interface CAMSchemaCAMAutoSendFeaturesGenerated
- (BOOL)hasUserAsrScore;
- (BOOL)hasUserAsrScoreTargetApp;
- (BOOL)hasUserAsrScoreTargetContact;
- (BOOL)hasUserAsrScoreWhenCompleted;
- (BOOL)hasUserAsrScoreWhenRejected;
- (BOOL)hasUserPayloadLengthInCharacters;
- (BOOL)hasUserPayloadLengthInCharactersTargetApp;
- (BOOL)hasUserPayloadLengthInCharactersTargetContact;
- (BOOL)hasUserPayloadLengthInCharactersWhenCompleted;
- (BOOL)hasUserPayloadLengthInCharactersWhenRejected;
- (BOOL)hasUserRejectRate;
- (BOOL)hasUserRejectRateTargetApp;
- (BOOL)hasUserRejectRateTargetContact;
- (BOOL)hasUserRejectRateWhenConfirmDecision;
- (BOOL)hasUserRejectRateWhenSkipDecision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAMSchemaCAMAggregateFeatureValue)userAsrScore;
- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreTargetApp;
- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreTargetContact;
- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreWhenCompleted;
- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreWhenRejected;
- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharacters;
- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersTargetApp;
- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersTargetContact;
- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersWhenCompleted;
- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersWhenRejected;
- (CAMSchemaCAMAggregateFeatureValue)userRejectRate;
- (CAMSchemaCAMAggregateFeatureValue)userRejectRateTargetApp;
- (CAMSchemaCAMAggregateFeatureValue)userRejectRateTargetContact;
- (CAMSchemaCAMAggregateFeatureValue)userRejectRateWhenConfirmDecision;
- (CAMSchemaCAMAggregateFeatureValue)userRejectRateWhenSkipDecision;
- (CAMSchemaCAMAutoSendFeaturesGenerated)initWithDictionary:(id)a3;
- (CAMSchemaCAMAutoSendFeaturesGenerated)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteUserAsrScore;
- (void)deleteUserAsrScoreTargetApp;
- (void)deleteUserAsrScoreTargetContact;
- (void)deleteUserAsrScoreWhenCompleted;
- (void)deleteUserAsrScoreWhenRejected;
- (void)deleteUserPayloadLengthInCharacters;
- (void)deleteUserPayloadLengthInCharactersTargetApp;
- (void)deleteUserPayloadLengthInCharactersTargetContact;
- (void)deleteUserPayloadLengthInCharactersWhenCompleted;
- (void)deleteUserPayloadLengthInCharactersWhenRejected;
- (void)deleteUserRejectRate;
- (void)deleteUserRejectRateTargetApp;
- (void)deleteUserRejectRateTargetContact;
- (void)deleteUserRejectRateWhenConfirmDecision;
- (void)deleteUserRejectRateWhenSkipDecision;
- (void)setHasUserAsrScore:(BOOL)a3;
- (void)setHasUserAsrScoreTargetApp:(BOOL)a3;
- (void)setHasUserAsrScoreTargetContact:(BOOL)a3;
- (void)setHasUserAsrScoreWhenCompleted:(BOOL)a3;
- (void)setHasUserAsrScoreWhenRejected:(BOOL)a3;
- (void)setHasUserPayloadLengthInCharacters:(BOOL)a3;
- (void)setHasUserPayloadLengthInCharactersTargetApp:(BOOL)a3;
- (void)setHasUserPayloadLengthInCharactersTargetContact:(BOOL)a3;
- (void)setHasUserPayloadLengthInCharactersWhenCompleted:(BOOL)a3;
- (void)setHasUserPayloadLengthInCharactersWhenRejected:(BOOL)a3;
- (void)setHasUserRejectRate:(BOOL)a3;
- (void)setHasUserRejectRateTargetApp:(BOOL)a3;
- (void)setHasUserRejectRateTargetContact:(BOOL)a3;
- (void)setHasUserRejectRateWhenConfirmDecision:(BOOL)a3;
- (void)setHasUserRejectRateWhenSkipDecision:(BOOL)a3;
- (void)setUserAsrScore:(id)a3;
- (void)setUserAsrScoreTargetApp:(id)a3;
- (void)setUserAsrScoreTargetContact:(id)a3;
- (void)setUserAsrScoreWhenCompleted:(id)a3;
- (void)setUserAsrScoreWhenRejected:(id)a3;
- (void)setUserPayloadLengthInCharacters:(id)a3;
- (void)setUserPayloadLengthInCharactersTargetApp:(id)a3;
- (void)setUserPayloadLengthInCharactersTargetContact:(id)a3;
- (void)setUserPayloadLengthInCharactersWhenCompleted:(id)a3;
- (void)setUserPayloadLengthInCharactersWhenRejected:(id)a3;
- (void)setUserRejectRate:(id)a3;
- (void)setUserRejectRateTargetApp:(id)a3;
- (void)setUserRejectRateTargetContact:(id)a3;
- (void)setUserRejectRateWhenConfirmDecision:(id)a3;
- (void)setUserRejectRateWhenSkipDecision:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAMSchemaCAMAutoSendFeaturesGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)CAMSchemaCAMAutoSendFeaturesGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v52 applySensitiveConditionsPolicy:v4];
  v6 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScore];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserAsrScore];
  }
  v9 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenCompleted];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserAsrScoreWhenCompleted];
  }
  v12 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenRejected];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserAsrScoreWhenRejected];
  }
  v15 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetContact];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserAsrScoreTargetContact];
  }
  v18 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetApp];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserAsrScoreTargetApp];
  }
  v21 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRate];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserRejectRate];
  }
  v24 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetContact];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserRejectRateTargetContact];
  }
  v27 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetApp];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserRejectRateTargetApp];
  }
  v30 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenSkipDecision];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserRejectRateWhenSkipDecision];
  }
  v33 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenConfirmDecision];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserRejectRateWhenConfirmDecision];
  }
  v36 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharacters];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserPayloadLengthInCharacters];
  }
  v39 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetContact];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserPayloadLengthInCharactersTargetContact];
  }
  v42 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetApp];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserPayloadLengthInCharactersTargetApp];
  }
  v45 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenCompleted];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserPayloadLengthInCharactersWhenCompleted];
  }
  v48 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenRejected];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(CAMSchemaCAMAutoSendFeaturesGenerated *)self deleteUserPayloadLengthInCharactersWhenRejected];
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
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersWhenRejected, 0);
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersWhenCompleted, 0);
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersTargetApp, 0);
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersTargetContact, 0);
  objc_storeStrong((id *)&self->_userPayloadLengthInCharacters, 0);
  objc_storeStrong((id *)&self->_userRejectRateWhenConfirmDecision, 0);
  objc_storeStrong((id *)&self->_userRejectRateWhenSkipDecision, 0);
  objc_storeStrong((id *)&self->_userRejectRateTargetApp, 0);
  objc_storeStrong((id *)&self->_userRejectRateTargetContact, 0);
  objc_storeStrong((id *)&self->_userRejectRate, 0);
  objc_storeStrong((id *)&self->_userAsrScoreTargetApp, 0);
  objc_storeStrong((id *)&self->_userAsrScoreTargetContact, 0);
  objc_storeStrong((id *)&self->_userAsrScoreWhenRejected, 0);
  objc_storeStrong((id *)&self->_userAsrScoreWhenCompleted, 0);
  objc_storeStrong((id *)&self->_userAsrScore, 0);
}

- (void)setHasUserPayloadLengthInCharactersWhenRejected:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharactersWhenRejected = a3;
}

- (void)setHasUserPayloadLengthInCharactersWhenCompleted:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharactersWhenCompleted = a3;
}

- (void)setHasUserPayloadLengthInCharactersTargetApp:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharactersTargetApp = a3;
}

- (void)setHasUserPayloadLengthInCharactersTargetContact:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharactersTargetContact = a3;
}

- (void)setHasUserPayloadLengthInCharacters:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharacters = a3;
}

- (void)setHasUserRejectRateWhenConfirmDecision:(BOOL)a3
{
  self->_hasUserRejectRateWhenConfirmDecision = a3;
}

- (void)setHasUserRejectRateWhenSkipDecision:(BOOL)a3
{
  self->_hasUserRejectRateWhenSkipDecision = a3;
}

- (void)setHasUserRejectRateTargetApp:(BOOL)a3
{
  self->_hasUserRejectRateTargetApp = a3;
}

- (void)setHasUserRejectRateTargetContact:(BOOL)a3
{
  self->_hasUserRejectRateTargetContact = a3;
}

- (void)setHasUserRejectRate:(BOOL)a3
{
  self->_hasUserRejectRate = a3;
}

- (void)setHasUserAsrScoreTargetApp:(BOOL)a3
{
  self->_hasUserAsrScoreTargetApp = a3;
}

- (void)setHasUserAsrScoreTargetContact:(BOOL)a3
{
  self->_hasUserAsrScoreTargetContact = a3;
}

- (void)setHasUserAsrScoreWhenRejected:(BOOL)a3
{
  self->_hasUserAsrScoreWhenRejected = a3;
}

- (void)setHasUserAsrScoreWhenCompleted:(BOOL)a3
{
  self->_hasUserAsrScoreWhenCompleted = a3;
}

- (void)setHasUserAsrScore:(BOOL)a3
{
  self->_hasUserAsrScore = a3;
}

- (void)setUserPayloadLengthInCharactersWhenRejected:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersWhenRejected
{
  return self->_userPayloadLengthInCharactersWhenRejected;
}

- (void)setUserPayloadLengthInCharactersWhenCompleted:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersWhenCompleted
{
  return self->_userPayloadLengthInCharactersWhenCompleted;
}

- (void)setUserPayloadLengthInCharactersTargetApp:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersTargetApp
{
  return self->_userPayloadLengthInCharactersTargetApp;
}

- (void)setUserPayloadLengthInCharactersTargetContact:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersTargetContact
{
  return self->_userPayloadLengthInCharactersTargetContact;
}

- (void)setUserPayloadLengthInCharacters:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharacters
{
  return self->_userPayloadLengthInCharacters;
}

- (void)setUserRejectRateWhenConfirmDecision:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRateWhenConfirmDecision
{
  return self->_userRejectRateWhenConfirmDecision;
}

- (void)setUserRejectRateWhenSkipDecision:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRateWhenSkipDecision
{
  return self->_userRejectRateWhenSkipDecision;
}

- (void)setUserRejectRateTargetApp:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRateTargetApp
{
  return self->_userRejectRateTargetApp;
}

- (void)setUserRejectRateTargetContact:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRateTargetContact
{
  return self->_userRejectRateTargetContact;
}

- (void)setUserRejectRate:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRate
{
  return self->_userRejectRate;
}

- (void)setUserAsrScoreTargetApp:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreTargetApp
{
  return self->_userAsrScoreTargetApp;
}

- (void)setUserAsrScoreTargetContact:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreTargetContact
{
  return self->_userAsrScoreTargetContact;
}

- (void)setUserAsrScoreWhenRejected:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreWhenRejected
{
  return self->_userAsrScoreWhenRejected;
}

- (void)setUserAsrScoreWhenCompleted:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreWhenCompleted
{
  return self->_userAsrScoreWhenCompleted;
}

- (void)setUserAsrScore:(id)a3
{
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScore
{
  return self->_userAsrScore;
}

- (CAMSchemaCAMAutoSendFeaturesGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAMSchemaCAMAutoSendFeaturesGenerated;
  v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"userAsrScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v6];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserAsrScore:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"userAsrScoreWhenCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v8];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserAsrScoreWhenCompleted:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"userAsrScoreWhenRejected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v10];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserAsrScoreWhenRejected:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"userAsrScoreTargetContact"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v12];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserAsrScoreTargetContact:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"userAsrScoreTargetApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v14];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserAsrScoreTargetApp:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"userRejectRate"];
    objc_opt_class();
    v45 = (void *)v16;
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v16];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserRejectRate:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"userRejectRateTargetContact"];
    objc_opt_class();
    int v44 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v18];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserRejectRateTargetContact:v19];
    }
    v43 = (void *)v6;
    uint64_t v20 = [v4 objectForKeyedSubscript:@"userRejectRateTargetApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v20];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserRejectRateTargetApp:v21];
    }
    int v38 = (void *)v20;
    v42 = (void *)v8;
    v22 = [v4 objectForKeyedSubscript:@"userRejectRateWhenSkipDecision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v22];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserRejectRateWhenSkipDecision:v23];
    }
    int v41 = (void *)v10;
    v24 = [v4 objectForKeyedSubscript:@"userRejectRateWhenConfirmDecision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v24];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserRejectRateWhenConfirmDecision:v25];
    }
    v40 = (void *)v12;
    int v26 = [v4 objectForKeyedSubscript:@"userPayloadLengthInCharacters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v26];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserPayloadLengthInCharacters:v27];
    }
    v39 = (void *)v14;
    v28 = [v4 objectForKeyedSubscript:@"userPayloadLengthInCharactersTargetContact"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v28];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserPayloadLengthInCharactersTargetContact:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"userPayloadLengthInCharactersTargetApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v30];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserPayloadLengthInCharactersTargetApp:v31];
    }
    int v32 = [v4 objectForKeyedSubscript:@"userPayloadLengthInCharactersWhenCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v32];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserPayloadLengthInCharactersWhenCompleted:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"userPayloadLengthInCharactersWhenRejected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[CAMSchemaCAMAggregateFeatureValue alloc] initWithDictionary:v34];
      [(CAMSchemaCAMAutoSendFeaturesGenerated *)v5 setUserPayloadLengthInCharactersWhenRejected:v35];
    }
    v36 = v5;
  }
  return v5;
}

- (CAMSchemaCAMAutoSendFeaturesGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self dictionaryRepresentation];
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
  if (self->_userAsrScore)
  {
    id v4 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScore];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"userAsrScore"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"userAsrScore"];
    }
  }
  if (self->_userAsrScoreTargetApp)
  {
    uint64_t v7 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetApp];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"userAsrScoreTargetApp"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"userAsrScoreTargetApp"];
    }
  }
  if (self->_userAsrScoreTargetContact)
  {
    uint64_t v10 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetContact];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"userAsrScoreTargetContact"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"userAsrScoreTargetContact"];
    }
  }
  if (self->_userAsrScoreWhenCompleted)
  {
    v13 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenCompleted];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"userAsrScoreWhenCompleted"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"userAsrScoreWhenCompleted"];
    }
  }
  if (self->_userAsrScoreWhenRejected)
  {
    uint64_t v16 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenRejected];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"userAsrScoreWhenRejected"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"userAsrScoreWhenRejected"];
    }
  }
  if (self->_userPayloadLengthInCharacters)
  {
    v19 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharacters];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"userPayloadLengthInCharacters"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"userPayloadLengthInCharacters"];
    }
  }
  if (self->_userPayloadLengthInCharactersTargetApp)
  {
    v22 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetApp];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"userPayloadLengthInCharactersTargetApp"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"userPayloadLengthInCharactersTargetApp"];
    }
  }
  if (self->_userPayloadLengthInCharactersTargetContact)
  {
    v25 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetContact];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"userPayloadLengthInCharactersTargetContact"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"userPayloadLengthInCharactersTargetContact"];
    }
  }
  if (self->_userPayloadLengthInCharactersWhenCompleted)
  {
    v28 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenCompleted];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"userPayloadLengthInCharactersWhenCompleted"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"userPayloadLengthInCharactersWhenCompleted"];
    }
  }
  if (self->_userPayloadLengthInCharactersWhenRejected)
  {
    v31 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenRejected];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"userPayloadLengthInCharactersWhenRejected"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"userPayloadLengthInCharactersWhenRejected"];
    }
  }
  if (self->_userRejectRate)
  {
    v34 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRate];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"userRejectRate"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"userRejectRate"];
    }
  }
  if (self->_userRejectRateTargetApp)
  {
    v37 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetApp];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"userRejectRateTargetApp"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"userRejectRateTargetApp"];
    }
  }
  if (self->_userRejectRateTargetContact)
  {
    v40 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetContact];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"userRejectRateTargetContact"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"userRejectRateTargetContact"];
    }
  }
  if (self->_userRejectRateWhenConfirmDecision)
  {
    v43 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenConfirmDecision];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"userRejectRateWhenConfirmDecision"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"userRejectRateWhenConfirmDecision"];
    }
  }
  if (self->_userRejectRateWhenSkipDecision)
  {
    objc_super v46 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenSkipDecision];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"userRejectRateWhenSkipDecision"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"userRejectRateWhenSkipDecision"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CAMSchemaCAMAggregateFeatureValue *)self->_userAsrScore hash];
  unint64_t v4 = [(CAMSchemaCAMAggregateFeatureValue *)self->_userAsrScoreWhenCompleted hash] ^ v3;
  unint64_t v5 = [(CAMSchemaCAMAggregateFeatureValue *)self->_userAsrScoreWhenRejected hash];
  unint64_t v6 = v4 ^ v5 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userAsrScoreTargetContact hash];
  unint64_t v7 = [(CAMSchemaCAMAggregateFeatureValue *)self->_userAsrScoreTargetApp hash];
  unint64_t v8 = v7 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userRejectRate hash];
  unint64_t v9 = v6 ^ v8 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userRejectRateTargetContact hash];
  unint64_t v10 = [(CAMSchemaCAMAggregateFeatureValue *)self->_userRejectRateTargetApp hash];
  unint64_t v11 = v10 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userRejectRateWhenSkipDecision hash];
  unint64_t v12 = v11 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userRejectRateWhenConfirmDecision hash];
  unint64_t v13 = v9 ^ v12 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userPayloadLengthInCharacters hash];
  unint64_t v14 = [(CAMSchemaCAMAggregateFeatureValue *)self->_userPayloadLengthInCharactersTargetContact hash];
  unint64_t v15 = v14 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userPayloadLengthInCharactersTargetApp hash];
  unint64_t v16 = v15 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userPayloadLengthInCharactersWhenCompleted hash];
  return v13 ^ v16 ^ [(CAMSchemaCAMAggregateFeatureValue *)self->_userPayloadLengthInCharactersWhenRejected hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScore];
  unint64_t v6 = [v4 userAsrScore];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v7 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScore];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScore];
    unint64_t v10 = [v4 userAsrScore];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenCompleted];
  unint64_t v6 = [v4 userAsrScoreWhenCompleted];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v12 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenCompleted];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenCompleted];
    unint64_t v15 = [v4 userAsrScoreWhenCompleted];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenRejected];
  unint64_t v6 = [v4 userAsrScoreWhenRejected];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v17 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenRejected];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenRejected];
    uint64_t v20 = [v4 userAsrScoreWhenRejected];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetContact];
  unint64_t v6 = [v4 userAsrScoreTargetContact];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v22 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetContact];
  if (v22)
  {
    int v23 = (void *)v22;
    v24 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetContact];
    v25 = [v4 userAsrScoreTargetContact];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetApp];
  unint64_t v6 = [v4 userAsrScoreTargetApp];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v27 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetApp];
  if (v27)
  {
    v28 = (void *)v27;
    int v29 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetApp];
    v30 = [v4 userAsrScoreTargetApp];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRate];
  unint64_t v6 = [v4 userRejectRate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v32 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRate];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRate];
    int v35 = [v4 userRejectRate];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetContact];
  unint64_t v6 = [v4 userRejectRateTargetContact];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v37 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetContact];
  if (v37)
  {
    int v38 = (void *)v37;
    v39 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetContact];
    v40 = [v4 userRejectRateTargetContact];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetApp];
  unint64_t v6 = [v4 userRejectRateTargetApp];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v42 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetApp];
  if (v42)
  {
    v43 = (void *)v42;
    int v44 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetApp];
    v45 = [v4 userRejectRateTargetApp];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenSkipDecision];
  unint64_t v6 = [v4 userRejectRateWhenSkipDecision];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v47 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenSkipDecision];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenSkipDecision];
    int v50 = [v4 userRejectRateWhenSkipDecision];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenConfirmDecision];
  unint64_t v6 = [v4 userRejectRateWhenConfirmDecision];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v52 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenConfirmDecision];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenConfirmDecision];
    v55 = [v4 userRejectRateWhenConfirmDecision];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharacters];
  unint64_t v6 = [v4 userPayloadLengthInCharacters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v57 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharacters];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharacters];
    v60 = [v4 userPayloadLengthInCharacters];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetContact];
  unint64_t v6 = [v4 userPayloadLengthInCharactersTargetContact];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v62 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetContact];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetContact];
    v65 = [v4 userPayloadLengthInCharactersTargetContact];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetApp];
  unint64_t v6 = [v4 userPayloadLengthInCharactersTargetApp];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v67 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetApp];
  if (v67)
  {
    v68 = (void *)v67;
    v69 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetApp];
    v70 = [v4 userPayloadLengthInCharactersTargetApp];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenCompleted];
  unint64_t v6 = [v4 userPayloadLengthInCharactersWhenCompleted];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v72 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenCompleted];
  if (v72)
  {
    v73 = (void *)v72;
    v74 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenCompleted];
    v75 = [v4 userPayloadLengthInCharactersWhenCompleted];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenRejected];
  unint64_t v6 = [v4 userPayloadLengthInCharactersWhenRejected];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v77 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenRejected];
    if (!v77)
    {

LABEL_80:
      BOOL v82 = 1;
      goto LABEL_78;
    }
    v78 = (void *)v77;
    v79 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenRejected];
    v80 = [v4 userPayloadLengthInCharactersWhenRejected];
    char v81 = [v79 isEqual:v80];

    if (v81) {
      goto LABEL_80;
    }
  }
  else
  {
LABEL_76:
  }
LABEL_77:
  BOOL v82 = 0;
LABEL_78:

  return v82;
}

- (void)writeTo:(id)a3
{
  id v34 = a3;
  id v4 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScore];

  if (v4)
  {
    unint64_t v5 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScore];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenCompleted];

  if (v6)
  {
    uint64_t v7 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenCompleted];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenRejected];

  if (v8)
  {
    unint64_t v9 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreWhenRejected];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetContact];

  if (v10)
  {
    int v11 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetContact];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetApp];

  if (v12)
  {
    unint64_t v13 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userAsrScoreTargetApp];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRate];

  if (v14)
  {
    unint64_t v15 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRate];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetContact];

  if (v16)
  {
    uint64_t v17 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetContact];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetApp];

  if (v18)
  {
    v19 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateTargetApp];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v20 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenSkipDecision];

  if (v20)
  {
    int v21 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenSkipDecision];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v22 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenConfirmDecision];

  if (v22)
  {
    int v23 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userRejectRateWhenConfirmDecision];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharacters];

  if (v24)
  {
    v25 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharacters];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetContact];

  if (v26)
  {
    uint64_t v27 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetContact];
    PBDataWriterWriteSubmessage();
  }
  v28 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetApp];

  if (v28)
  {
    int v29 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersTargetApp];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenCompleted];

  if (v30)
  {
    int v31 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenCompleted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v32 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenRejected];

  if (v32)
  {
    v33 = [(CAMSchemaCAMAutoSendFeaturesGenerated *)self userPayloadLengthInCharactersWhenRejected];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMAutoSendFeaturesGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserPayloadLengthInCharactersWhenRejected
{
}

- (BOOL)hasUserPayloadLengthInCharactersWhenRejected
{
  return self->_userPayloadLengthInCharactersWhenRejected != 0;
}

- (void)deleteUserPayloadLengthInCharactersWhenCompleted
{
}

- (BOOL)hasUserPayloadLengthInCharactersWhenCompleted
{
  return self->_userPayloadLengthInCharactersWhenCompleted != 0;
}

- (void)deleteUserPayloadLengthInCharactersTargetApp
{
}

- (BOOL)hasUserPayloadLengthInCharactersTargetApp
{
  return self->_userPayloadLengthInCharactersTargetApp != 0;
}

- (void)deleteUserPayloadLengthInCharactersTargetContact
{
}

- (BOOL)hasUserPayloadLengthInCharactersTargetContact
{
  return self->_userPayloadLengthInCharactersTargetContact != 0;
}

- (void)deleteUserPayloadLengthInCharacters
{
}

- (BOOL)hasUserPayloadLengthInCharacters
{
  return self->_userPayloadLengthInCharacters != 0;
}

- (void)deleteUserRejectRateWhenConfirmDecision
{
}

- (BOOL)hasUserRejectRateWhenConfirmDecision
{
  return self->_userRejectRateWhenConfirmDecision != 0;
}

- (void)deleteUserRejectRateWhenSkipDecision
{
}

- (BOOL)hasUserRejectRateWhenSkipDecision
{
  return self->_userRejectRateWhenSkipDecision != 0;
}

- (void)deleteUserRejectRateTargetApp
{
}

- (BOOL)hasUserRejectRateTargetApp
{
  return self->_userRejectRateTargetApp != 0;
}

- (void)deleteUserRejectRateTargetContact
{
}

- (BOOL)hasUserRejectRateTargetContact
{
  return self->_userRejectRateTargetContact != 0;
}

- (void)deleteUserRejectRate
{
}

- (BOOL)hasUserRejectRate
{
  return self->_userRejectRate != 0;
}

- (void)deleteUserAsrScoreTargetApp
{
}

- (BOOL)hasUserAsrScoreTargetApp
{
  return self->_userAsrScoreTargetApp != 0;
}

- (void)deleteUserAsrScoreTargetContact
{
}

- (BOOL)hasUserAsrScoreTargetContact
{
  return self->_userAsrScoreTargetContact != 0;
}

- (void)deleteUserAsrScoreWhenRejected
{
}

- (BOOL)hasUserAsrScoreWhenRejected
{
  return self->_userAsrScoreWhenRejected != 0;
}

- (void)deleteUserAsrScoreWhenCompleted
{
}

- (BOOL)hasUserAsrScoreWhenCompleted
{
  return self->_userAsrScoreWhenCompleted != 0;
}

- (void)deleteUserAsrScore
{
}

- (BOOL)hasUserAsrScore
{
  return self->_userAsrScore != 0;
}

@end