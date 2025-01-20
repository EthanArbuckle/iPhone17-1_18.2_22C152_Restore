@interface _SFPBCoreSpotlightRankingSignals
- (BOOL)isEqual:(id)a3;
- (BOOL)isExactMatchOfLaunchString;
- (BOOL)isSemanticMatch;
- (BOOL)isSyntacticMatch;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasEngagedInSpotlight;
- (BOOL)wasNominatedAsTopHit;
- (NSData)jsonData;
- (_SFPBCoreSpotlightRankingSignals)initWithDictionary:(id)a3;
- (_SFPBCoreSpotlightRankingSignals)initWithFacade:(id)a3;
- (_SFPBCoreSpotlightRankingSignals)initWithJSON:(id)a3;
- (float)engagementScore;
- (float)freshness;
- (float)pommesL2Score;
- (float)predictedLikelihoodOfEngagement;
- (float)semanticScore;
- (float)sodiumL2Score;
- (float)syntacticScore;
- (float)topicalityScore;
- (id)dictionaryRepresentation;
- (int)embeddingStatus;
- (int)resultQueryRecency;
- (unint64_t)hash;
- (unsigned)itemAgeInDays;
- (void)setEmbeddingStatus:(int)a3;
- (void)setEngagementScore:(float)a3;
- (void)setFreshness:(float)a3;
- (void)setIsExactMatchOfLaunchString:(BOOL)a3;
- (void)setIsSemanticMatch:(BOOL)a3;
- (void)setIsSyntacticMatch:(BOOL)a3;
- (void)setItemAgeInDays:(unsigned int)a3;
- (void)setPommesL2Score:(float)a3;
- (void)setPredictedLikelihoodOfEngagement:(float)a3;
- (void)setResultQueryRecency:(int)a3;
- (void)setSemanticScore:(float)a3;
- (void)setSodiumL2Score:(float)a3;
- (void)setSyntacticScore:(float)a3;
- (void)setTopicalityScore:(float)a3;
- (void)setWasEngagedInSpotlight:(BOOL)a3;
- (void)setWasNominatedAsTopHit:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCoreSpotlightRankingSignals

- (_SFPBCoreSpotlightRankingSignals)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCoreSpotlightRankingSignals *)self init];
  if (v5)
  {
    v6 = [v4 topicalityScore];

    if (v6)
    {
      v7 = [v4 topicalityScore];
      [v7 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setTopicalityScore:](v5, "setTopicalityScore:");
    }
    v8 = [v4 freshness];

    if (v8)
    {
      v9 = [v4 freshness];
      [v9 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setFreshness:](v5, "setFreshness:");
    }
    v10 = [v4 engagementScore];

    if (v10)
    {
      v11 = [v4 engagementScore];
      [v11 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setEngagementScore:](v5, "setEngagementScore:");
    }
    v12 = [v4 predictedLikelihoodOfEngagement];

    if (v12)
    {
      v13 = [v4 predictedLikelihoodOfEngagement];
      [v13 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setPredictedLikelihoodOfEngagement:](v5, "setPredictedLikelihoodOfEngagement:");
    }
    if ([v4 hasWasNominatedAsTopHit]) {
      -[_SFPBCoreSpotlightRankingSignals setWasNominatedAsTopHit:](v5, "setWasNominatedAsTopHit:", [v4 wasNominatedAsTopHit]);
    }
    v14 = [v4 sodiumL2Score];

    if (v14)
    {
      v15 = [v4 sodiumL2Score];
      [v15 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setSodiumL2Score:](v5, "setSodiumL2Score:");
    }
    if ([v4 hasIsExactMatchOfLaunchString]) {
      -[_SFPBCoreSpotlightRankingSignals setIsExactMatchOfLaunchString:](v5, "setIsExactMatchOfLaunchString:", [v4 isExactMatchOfLaunchString]);
    }
    if ([v4 hasWasEngagedInSpotlight]) {
      -[_SFPBCoreSpotlightRankingSignals setWasEngagedInSpotlight:](v5, "setWasEngagedInSpotlight:", [v4 wasEngagedInSpotlight]);
    }
    if ([v4 hasResultQueryRecency]) {
      -[_SFPBCoreSpotlightRankingSignals setResultQueryRecency:](v5, "setResultQueryRecency:", [v4 resultQueryRecency]);
    }
    v16 = [v4 pommesL2Score];

    if (v16)
    {
      v17 = [v4 pommesL2Score];
      [v17 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setPommesL2Score:](v5, "setPommesL2Score:");
    }
    if ([v4 hasIsSemanticMatch]) {
      -[_SFPBCoreSpotlightRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", [v4 isSemanticMatch]);
    }
    v18 = [v4 semanticScore];

    if (v18)
    {
      v19 = [v4 semanticScore];
      [v19 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setSemanticScore:](v5, "setSemanticScore:");
    }
    if ([v4 hasIsSyntacticMatch]) {
      -[_SFPBCoreSpotlightRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", [v4 isSyntacticMatch]);
    }
    v20 = [v4 syntacticScore];

    if (v20)
    {
      v21 = [v4 syntacticScore];
      [v21 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setSyntacticScore:](v5, "setSyntacticScore:");
    }
    if ([v4 hasEmbeddingStatus]) {
      -[_SFPBCoreSpotlightRankingSignals setEmbeddingStatus:](v5, "setEmbeddingStatus:", [v4 embeddingStatus]);
    }
    if ([v4 hasItemAgeInDays]) {
      -[_SFPBCoreSpotlightRankingSignals setItemAgeInDays:](v5, "setItemAgeInDays:", [v4 itemAgeInDays]);
    }
    v22 = v5;
  }

  return v5;
}

- (unsigned)itemAgeInDays
{
  return self->_itemAgeInDays;
}

- (int)embeddingStatus
{
  return self->_embeddingStatus;
}

- (float)syntacticScore
{
  return self->_syntacticScore;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (float)pommesL2Score
{
  return self->_pommesL2Score;
}

- (int)resultQueryRecency
{
  return self->_resultQueryRecency;
}

- (BOOL)wasEngagedInSpotlight
{
  return self->_wasEngagedInSpotlight;
}

- (BOOL)isExactMatchOfLaunchString
{
  return self->_isExactMatchOfLaunchString;
}

- (float)sodiumL2Score
{
  return self->_sodiumL2Score;
}

- (BOOL)wasNominatedAsTopHit
{
  return self->_wasNominatedAsTopHit;
}

- (float)predictedLikelihoodOfEngagement
{
  return self->_predictedLikelihoodOfEngagement;
}

- (float)engagementScore
{
  return self->_engagementScore;
}

- (float)freshness
{
  return self->_freshness;
}

- (float)topicalityScore
{
  return self->_topicalityScore;
}

- (_SFPBCoreSpotlightRankingSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_SFPBCoreSpotlightRankingSignals;
  v5 = [(_SFPBCoreSpotlightRankingSignals *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"topicalityScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setTopicalityScore:](v5, "setTopicalityScore:");
    }
    v7 = [v4 objectForKeyedSubscript:@"freshness"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setFreshness:](v5, "setFreshness:");
    }
    v8 = [v4 objectForKeyedSubscript:@"engagementScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setEngagementScore:](v5, "setEngagementScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"predictedLikelihoodOfEngagement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setPredictedLikelihoodOfEngagement:](v5, "setPredictedLikelihoodOfEngagement:");
    }
    v32 = v8;
    v10 = [v4 objectForKeyedSubscript:@"wasNominatedAsTopHit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightRankingSignals setWasNominatedAsTopHit:](v5, "setWasNominatedAsTopHit:", [v10 BOOLValue]);
    }
    v11 = v7;
    v12 = [v4 objectForKeyedSubscript:@"sodiumL2Score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setSodiumL2Score:](v5, "setSodiumL2Score:");
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"isExactMatchOfLaunchString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightRankingSignals setIsExactMatchOfLaunchString:](v5, "setIsExactMatchOfLaunchString:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"wasEngagedInSpotlight"];
    objc_opt_class();
    v35 = v15;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightRankingSignals setWasEngagedInSpotlight:](v5, "setWasEngagedInSpotlight:", [v15 BOOLValue]);
    }
    v34 = v13;
    v16 = [v4 objectForKeyedSubscript:@"resultQueryRecency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightRankingSignals setResultQueryRecency:](v5, "setResultQueryRecency:", [v16 intValue]);
    }
    v33 = v11;
    v17 = [v4 objectForKeyedSubscript:@"pommesL2Score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setPommesL2Score:](v5, "setPommesL2Score:");
    }
    v27 = v17;
    v18 = [v4 objectForKeyedSubscript:@"isSemanticMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", [v18 BOOLValue]);
    }
    v31 = v9;
    v19 = [v4 objectForKeyedSubscript:@"semanticScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setSemanticScore:](v5, "setSemanticScore:");
    }
    v30 = v10;
    v20 = [v4 objectForKeyedSubscript:@"isSyntacticMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", [v20 BOOLValue]);
    }
    v28 = v16;
    v29 = v12;
    v21 = [v4 objectForKeyedSubscript:@"syntacticScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 floatValue];
      -[_SFPBCoreSpotlightRankingSignals setSyntacticScore:](v5, "setSyntacticScore:");
    }
    v22 = v14;
    v23 = [v4 objectForKeyedSubscript:@"embeddingStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightRankingSignals setEmbeddingStatus:](v5, "setEmbeddingStatus:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"itemAgeInDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightRankingSignals setItemAgeInDays:](v5, "setItemAgeInDays:", [v24 unsignedIntValue]);
    }
    v25 = v5;
  }
  return v5;
}

- (_SFPBCoreSpotlightRankingSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCoreSpotlightRankingSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCoreSpotlightRankingSignals *)self dictionaryRepresentation];
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
  if (self->_embeddingStatus)
  {
    uint64_t v4 = [(_SFPBCoreSpotlightRankingSignals *)self embeddingStatus];
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2F058[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"embeddingStatus"];
  }
  if (self->_engagementScore != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBCoreSpotlightRankingSignals *)self engagementScore];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"engagementScore"];
  }
  if (self->_freshness != 0.0)
  {
    v8 = NSNumber;
    [(_SFPBCoreSpotlightRankingSignals *)self freshness];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"freshness"];
  }
  if (self->_isExactMatchOfLaunchString)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals isExactMatchOfLaunchString](self, "isExactMatchOfLaunchString"));
    [v3 setObject:v10 forKeyedSubscript:@"isExactMatchOfLaunchString"];
  }
  if (self->_isSemanticMatch)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals isSemanticMatch](self, "isSemanticMatch"));
    [v3 setObject:v11 forKeyedSubscript:@"isSemanticMatch"];
  }
  if (self->_isSyntacticMatch)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals isSyntacticMatch](self, "isSyntacticMatch"));
    [v3 setObject:v12 forKeyedSubscript:@"isSyntacticMatch"];
  }
  if (self->_itemAgeInDays)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_SFPBCoreSpotlightRankingSignals itemAgeInDays](self, "itemAgeInDays"));
    [v3 setObject:v13 forKeyedSubscript:@"itemAgeInDays"];
  }
  if (self->_pommesL2Score != 0.0)
  {
    v14 = NSNumber;
    [(_SFPBCoreSpotlightRankingSignals *)self pommesL2Score];
    v15 = objc_msgSend(v14, "numberWithFloat:");
    [v3 setObject:v15 forKeyedSubscript:@"pommesL2Score"];
  }
  if (self->_predictedLikelihoodOfEngagement != 0.0)
  {
    v16 = NSNumber;
    [(_SFPBCoreSpotlightRankingSignals *)self predictedLikelihoodOfEngagement];
    v17 = objc_msgSend(v16, "numberWithFloat:");
    [v3 setObject:v17 forKeyedSubscript:@"predictedLikelihoodOfEngagement"];
  }
  if (self->_resultQueryRecency)
  {
    uint64_t v18 = [(_SFPBCoreSpotlightRankingSignals *)self resultQueryRecency];
    if (v18 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E5A2F010[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"resultQueryRecency"];
  }
  if (self->_semanticScore != 0.0)
  {
    v20 = NSNumber;
    [(_SFPBCoreSpotlightRankingSignals *)self semanticScore];
    v21 = objc_msgSend(v20, "numberWithFloat:");
    [v3 setObject:v21 forKeyedSubscript:@"semanticScore"];
  }
  if (self->_sodiumL2Score != 0.0)
  {
    v22 = NSNumber;
    [(_SFPBCoreSpotlightRankingSignals *)self sodiumL2Score];
    v23 = objc_msgSend(v22, "numberWithFloat:");
    [v3 setObject:v23 forKeyedSubscript:@"sodiumL2Score"];
  }
  if (self->_syntacticScore != 0.0)
  {
    v24 = NSNumber;
    [(_SFPBCoreSpotlightRankingSignals *)self syntacticScore];
    v25 = objc_msgSend(v24, "numberWithFloat:");
    [v3 setObject:v25 forKeyedSubscript:@"syntacticScore"];
  }
  if (self->_topicalityScore != 0.0)
  {
    v26 = NSNumber;
    [(_SFPBCoreSpotlightRankingSignals *)self topicalityScore];
    v27 = objc_msgSend(v26, "numberWithFloat:");
    [v3 setObject:v27 forKeyedSubscript:@"topicalityScore"];
  }
  if (self->_wasEngagedInSpotlight)
  {
    v28 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals wasEngagedInSpotlight](self, "wasEngagedInSpotlight"));
    [v3 setObject:v28 forKeyedSubscript:@"wasEngagedInSpotlight"];
  }
  if (self->_wasNominatedAsTopHit)
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals wasNominatedAsTopHit](self, "wasNominatedAsTopHit"));
    [v3 setObject:v29 forKeyedSubscript:@"wasNominatedAsTopHit"];
  }
  return v3;
}

- (unint64_t)hash
{
  float topicalityScore = self->_topicalityScore;
  BOOL v4 = topicalityScore < 0.0;
  if (topicalityScore == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = topicalityScore;
    double v6 = -v5;
    if (!v4) {
      double v6 = v5;
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
  }
  float freshness = self->_freshness;
  BOOL v11 = freshness < 0.0;
  if (freshness == 0.0)
  {
    unint64_t v16 = 0;
  }
  else
  {
    double v12 = freshness;
    double v13 = -v12;
    if (!v11) {
      double v13 = v12;
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
  }
  float engagementScore = self->_engagementScore;
  BOOL v18 = engagementScore < 0.0;
  if (engagementScore == 0.0)
  {
    unint64_t v23 = 0;
  }
  else
  {
    double v19 = engagementScore;
    double v20 = -v19;
    if (!v18) {
      double v20 = v19;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v23 += (unint64_t)v22;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v22);
    }
  }
  float predictedLikelihoodOfEngagement = self->_predictedLikelihoodOfEngagement;
  BOOL v25 = predictedLikelihoodOfEngagement < 0.0;
  if (predictedLikelihoodOfEngagement == 0.0)
  {
    unint64_t v30 = 0;
  }
  else
  {
    double v26 = predictedLikelihoodOfEngagement;
    double v27 = -v26;
    if (!v25) {
      double v27 = v26;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v30 += (unint64_t)v29;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v29);
    }
  }
  BOOL wasNominatedAsTopHit = self->_wasNominatedAsTopHit;
  float sodiumL2Score = self->_sodiumL2Score;
  BOOL v33 = sodiumL2Score < 0.0;
  unint64_t v76 = v9;
  if (sodiumL2Score == 0.0)
  {
    unint64_t v38 = 0;
  }
  else
  {
    double v34 = sodiumL2Score;
    double v35 = -v34;
    if (!v33) {
      double v35 = v34;
    }
    long double v36 = floor(v35 + 0.5);
    double v37 = (v35 - v36) * 1.84467441e19;
    unint64_t v38 = 2654435761u * (unint64_t)fmod(v36, 1.84467441e19);
    if (v37 >= 0.0)
    {
      if (v37 > 0.0) {
        v38 += (unint64_t)v37;
      }
    }
    else
    {
      v38 -= (unint64_t)fabs(v37);
    }
  }
  BOOL isExactMatchOfLaunchString = self->_isExactMatchOfLaunchString;
  BOOL wasEngagedInSpotlight = self->_wasEngagedInSpotlight;
  float pommesL2Score = self->_pommesL2Score;
  BOOL v42 = pommesL2Score < 0.0;
  unint64_t v74 = v16;
  unint64_t v75 = v30;
  BOOL v73 = wasNominatedAsTopHit;
  uint64_t resultQueryRecency = self->_resultQueryRecency;
  if (pommesL2Score == 0.0)
  {
    unint64_t v47 = 0;
  }
  else
  {
    double v43 = pommesL2Score;
    double v44 = -v43;
    if (!v42) {
      double v44 = v43;
    }
    long double v45 = floor(v44 + 0.5);
    double v46 = (v44 - v45) * 1.84467441e19;
    unint64_t v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
    if (v46 >= 0.0)
    {
      if (v46 > 0.0) {
        v47 += (unint64_t)v46;
      }
    }
    else
    {
      v47 -= (unint64_t)fabs(v46);
    }
  }
  BOOL isSemanticMatch = self->_isSemanticMatch;
  float semanticScore = self->_semanticScore;
  BOOL v50 = semanticScore < 0.0;
  if (semanticScore == 0.0)
  {
    unint64_t v56 = v38;
    unint64_t v57 = v23;
    unint64_t v55 = 0;
  }
  else
  {
    double v51 = semanticScore;
    double v52 = -v51;
    if (!v50) {
      double v52 = v51;
    }
    long double v53 = floor(v52 + 0.5);
    double v54 = (v52 - v53) * 1.84467441e19;
    unint64_t v55 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    unint64_t v56 = v38;
    unint64_t v57 = v23;
    if (v54 >= 0.0)
    {
      if (v54 > 0.0) {
        v55 += (unint64_t)v54;
      }
    }
    else
    {
      v55 -= (unint64_t)fabs(v54);
    }
  }
  BOOL isSyntacticMatch = self->_isSyntacticMatch;
  float syntacticScore = self->_syntacticScore;
  BOOL v60 = syntacticScore < 0.0;
  if (syntacticScore == 0.0)
  {
    unint64_t v65 = 0;
  }
  else
  {
    double v61 = syntacticScore;
    double v62 = -v61;
    if (!v60) {
      double v62 = v61;
    }
    long double v63 = floor(v62 + 0.5);
    double v64 = (v62 - v63) * 1.84467441e19;
    unint64_t v65 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0) {
        v65 += (unint64_t)v64;
      }
    }
    else
    {
      v65 -= (unint64_t)fabs(v64);
    }
  }
  if (isSyntacticMatch) {
    uint64_t v66 = 2654435761;
  }
  else {
    uint64_t v66 = 0;
  }
  if (isSemanticMatch) {
    uint64_t v67 = 2654435761;
  }
  else {
    uint64_t v67 = 0;
  }
  if (wasEngagedInSpotlight) {
    uint64_t v68 = 2654435761;
  }
  else {
    uint64_t v68 = 0;
  }
  if (isExactMatchOfLaunchString) {
    uint64_t v69 = 2654435761;
  }
  else {
    uint64_t v69 = 0;
  }
  if (v73) {
    uint64_t v70 = 2654435761;
  }
  else {
    uint64_t v70 = 0;
  }
  return v74 ^ v76 ^ v57 ^ v75 ^ v56 ^ v70 ^ v69 ^ v68 ^ v47 ^ (2654435761 * resultQueryRecency) ^ v67 ^ v55 ^ v66 ^ v65 ^ (2654435761 * self->_embeddingStatus) ^ (2654435761 * self->_itemAgeInDays);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  float topicalityScore = self->_topicalityScore;
  [v4 topicalityScore];
  if (topicalityScore != v6) {
    goto LABEL_18;
  }
  float freshness = self->_freshness;
  [v4 freshness];
  if (freshness != v8) {
    goto LABEL_18;
  }
  float engagementScore = self->_engagementScore;
  [v4 engagementScore];
  if (engagementScore != v10) {
    goto LABEL_18;
  }
  float predictedLikelihoodOfEngagement = self->_predictedLikelihoodOfEngagement;
  [v4 predictedLikelihoodOfEngagement];
  if (predictedLikelihoodOfEngagement != v12) {
    goto LABEL_18;
  }
  int wasNominatedAsTopHit = self->_wasNominatedAsTopHit;
  if (wasNominatedAsTopHit != [v4 wasNominatedAsTopHit]) {
    goto LABEL_18;
  }
  float sodiumL2Score = self->_sodiumL2Score;
  [v4 sodiumL2Score];
  if (sodiumL2Score != v15) {
    goto LABEL_18;
  }
  int isExactMatchOfLaunchString = self->_isExactMatchOfLaunchString;
  if (isExactMatchOfLaunchString != [v4 isExactMatchOfLaunchString]) {
    goto LABEL_18;
  }
  int wasEngagedInSpotlight = self->_wasEngagedInSpotlight;
  if (wasEngagedInSpotlight != [v4 wasEngagedInSpotlight]) {
    goto LABEL_18;
  }
  int resultQueryRecency = self->_resultQueryRecency;
  if (resultQueryRecency != [v4 resultQueryRecency]) {
    goto LABEL_18;
  }
  float pommesL2Score = self->_pommesL2Score;
  [v4 pommesL2Score];
  if (pommesL2Score != v20) {
    goto LABEL_18;
  }
  int isSemanticMatch = self->_isSemanticMatch;
  if (isSemanticMatch == [v4 isSemanticMatch]
    && (float semanticScore = self->_semanticScore, [v4 semanticScore], semanticScore == v23)
    && (int isSyntacticMatch = self->_isSyntacticMatch,
        isSyntacticMatch == [v4 isSyntacticMatch])
    && (float syntacticScore = self->_syntacticScore, [v4 syntacticScore], syntacticScore == v26)
    && (int embeddingStatus = self->_embeddingStatus, embeddingStatus == [v4 embeddingStatus]))
  {
    unsigned int itemAgeInDays = self->_itemAgeInDays;
    BOOL v29 = itemAgeInDays == [v4 itemAgeInDays];
  }
  else
  {
LABEL_18:
    BOOL v29 = 0;
  }

  return v29;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  [(_SFPBCoreSpotlightRankingSignals *)self topicalityScore];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_SFPBCoreSpotlightRankingSignals *)self freshness];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_SFPBCoreSpotlightRankingSignals *)self engagementScore];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_SFPBCoreSpotlightRankingSignals *)self predictedLikelihoodOfEngagement];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBCoreSpotlightRankingSignals *)self wasNominatedAsTopHit]) {
    PBDataWriterWriteBOOLField();
  }
  [(_SFPBCoreSpotlightRankingSignals *)self sodiumL2Score];
  if (v8 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBCoreSpotlightRankingSignals *)self isExactMatchOfLaunchString]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCoreSpotlightRankingSignals *)self wasEngagedInSpotlight]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCoreSpotlightRankingSignals *)self resultQueryRecency]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBCoreSpotlightRankingSignals *)self pommesL2Score];
  if (v9 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBCoreSpotlightRankingSignals *)self isSemanticMatch]) {
    PBDataWriterWriteBOOLField();
  }
  [(_SFPBCoreSpotlightRankingSignals *)self semanticScore];
  if (v10 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBCoreSpotlightRankingSignals *)self isSyntacticMatch]) {
    PBDataWriterWriteBOOLField();
  }
  [(_SFPBCoreSpotlightRankingSignals *)self syntacticScore];
  if (v11 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBCoreSpotlightRankingSignals *)self embeddingStatus]) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v12 = [(_SFPBCoreSpotlightRankingSignals *)self itemAgeInDays];
  double v13 = v14;
  if (v12)
  {
    PBDataWriterWriteUint32Field();
    double v13 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCoreSpotlightRankingSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)setItemAgeInDays:(unsigned int)a3
{
  self->_unsigned int itemAgeInDays = a3;
}

- (void)setEmbeddingStatus:(int)a3
{
  self->_int embeddingStatus = a3;
}

- (void)setSyntacticScore:(float)a3
{
  self->_float syntacticScore = a3;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  self->_int isSyntacticMatch = a3;
}

- (void)setSemanticScore:(float)a3
{
  self->_float semanticScore = a3;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  self->_int isSemanticMatch = a3;
}

- (void)setPommesL2Score:(float)a3
{
  self->_float pommesL2Score = a3;
}

- (void)setResultQueryRecency:(int)a3
{
  self->_int resultQueryRecency = a3;
}

- (void)setWasEngagedInSpotlight:(BOOL)a3
{
  self->_int wasEngagedInSpotlight = a3;
}

- (void)setIsExactMatchOfLaunchString:(BOOL)a3
{
  self->_int isExactMatchOfLaunchString = a3;
}

- (void)setSodiumL2Score:(float)a3
{
  self->_float sodiumL2Score = a3;
}

- (void)setWasNominatedAsTopHit:(BOOL)a3
{
  self->_int wasNominatedAsTopHit = a3;
}

- (void)setPredictedLikelihoodOfEngagement:(float)a3
{
  self->_float predictedLikelihoodOfEngagement = a3;
}

- (void)setEngagementScore:(float)a3
{
  self->_float engagementScore = a3;
}

- (void)setFreshness:(float)a3
{
  self->_float freshness = a3;
}

- (void)setTopicalityScore:(float)a3
{
  self->_float topicalityScore = a3;
}

@end