@interface PEGASUSSchemaPEGASUSCirAlerts
- (BOOL)hasCirAlert;
- (BOOL)hasCirAlertContext;
- (BOOL)hasCirAlertDictionaryOverKgBoost;
- (BOOL)hasCirAlertDomainFallback;
- (BOOL)hasCirAlertEmergencyOverride;
- (BOOL)hasCirAlertKgWaBoost;
- (BOOL)hasCirAlertKgWaBoostQa;
- (BOOL)hasCirAlertKgWaBoostWebPost;
- (BOOL)hasCirAlertKgWaBoostWebPre;
- (BOOL)hasCirAlertMapsKgSwap;
- (BOOL)hasCirAlertMediaPodcastOverride;
- (BOOL)hasCirAlertProfaneFilter;
- (BOOL)hasCirAlertRespectIsFollowUpHeuristicFlag;
- (BOOL)hasCirAlertRespectMultiTurnResolvedRankingFlag;
- (BOOL)hasCirAlertRespectScoreOverrides;
- (BOOL)hasCirAlertVerblessQueriesKgBoost;
- (BOOL)hasCirAlertVideoMediaBoost;
- (BOOL)hasCirAlertWaBoost;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)cirAlert;
- (NSString)cirAlertContext;
- (NSString)cirAlertDictionaryOverKgBoost;
- (NSString)cirAlertDomainFallback;
- (NSString)cirAlertEmergencyOverride;
- (NSString)cirAlertKgWaBoost;
- (NSString)cirAlertKgWaBoostQa;
- (NSString)cirAlertKgWaBoostWebPost;
- (NSString)cirAlertKgWaBoostWebPre;
- (NSString)cirAlertMapsKgSwap;
- (NSString)cirAlertMediaPodcastOverride;
- (NSString)cirAlertProfaneFilter;
- (NSString)cirAlertRespectIsFollowUpHeuristicFlag;
- (NSString)cirAlertRespectMultiTurnResolvedRankingFlag;
- (NSString)cirAlertRespectScoreOverrides;
- (NSString)cirAlertVerblessQueriesKgBoost;
- (NSString)cirAlertVideoMediaBoost;
- (NSString)cirAlertWaBoost;
- (PEGASUSSchemaPEGASUSCirAlerts)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSCirAlerts)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCirAlert;
- (void)deleteCirAlertContext;
- (void)deleteCirAlertDictionaryOverKgBoost;
- (void)deleteCirAlertDomainFallback;
- (void)deleteCirAlertEmergencyOverride;
- (void)deleteCirAlertKgWaBoost;
- (void)deleteCirAlertKgWaBoostQa;
- (void)deleteCirAlertKgWaBoostWebPost;
- (void)deleteCirAlertKgWaBoostWebPre;
- (void)deleteCirAlertMapsKgSwap;
- (void)deleteCirAlertMediaPodcastOverride;
- (void)deleteCirAlertProfaneFilter;
- (void)deleteCirAlertRespectIsFollowUpHeuristicFlag;
- (void)deleteCirAlertRespectMultiTurnResolvedRankingFlag;
- (void)deleteCirAlertRespectScoreOverrides;
- (void)deleteCirAlertVerblessQueriesKgBoost;
- (void)deleteCirAlertVideoMediaBoost;
- (void)deleteCirAlertWaBoost;
- (void)setCirAlert:(id)a3;
- (void)setCirAlertContext:(id)a3;
- (void)setCirAlertDictionaryOverKgBoost:(id)a3;
- (void)setCirAlertDomainFallback:(id)a3;
- (void)setCirAlertEmergencyOverride:(id)a3;
- (void)setCirAlertKgWaBoost:(id)a3;
- (void)setCirAlertKgWaBoostQa:(id)a3;
- (void)setCirAlertKgWaBoostWebPost:(id)a3;
- (void)setCirAlertKgWaBoostWebPre:(id)a3;
- (void)setCirAlertMapsKgSwap:(id)a3;
- (void)setCirAlertMediaPodcastOverride:(id)a3;
- (void)setCirAlertProfaneFilter:(id)a3;
- (void)setCirAlertRespectIsFollowUpHeuristicFlag:(id)a3;
- (void)setCirAlertRespectMultiTurnResolvedRankingFlag:(id)a3;
- (void)setCirAlertRespectScoreOverrides:(id)a3;
- (void)setCirAlertVerblessQueriesKgBoost:(id)a3;
- (void)setCirAlertVideoMediaBoost:(id)a3;
- (void)setCirAlertWaBoost:(id)a3;
- (void)setHasCirAlert:(BOOL)a3;
- (void)setHasCirAlertContext:(BOOL)a3;
- (void)setHasCirAlertDictionaryOverKgBoost:(BOOL)a3;
- (void)setHasCirAlertDomainFallback:(BOOL)a3;
- (void)setHasCirAlertEmergencyOverride:(BOOL)a3;
- (void)setHasCirAlertKgWaBoost:(BOOL)a3;
- (void)setHasCirAlertKgWaBoostQa:(BOOL)a3;
- (void)setHasCirAlertKgWaBoostWebPost:(BOOL)a3;
- (void)setHasCirAlertKgWaBoostWebPre:(BOOL)a3;
- (void)setHasCirAlertMapsKgSwap:(BOOL)a3;
- (void)setHasCirAlertMediaPodcastOverride:(BOOL)a3;
- (void)setHasCirAlertProfaneFilter:(BOOL)a3;
- (void)setHasCirAlertRespectIsFollowUpHeuristicFlag:(BOOL)a3;
- (void)setHasCirAlertRespectMultiTurnResolvedRankingFlag:(BOOL)a3;
- (void)setHasCirAlertRespectScoreOverrides:(BOOL)a3;
- (void)setHasCirAlertVerblessQueriesKgBoost:(BOOL)a3;
- (void)setHasCirAlertVideoMediaBoost:(BOOL)a3;
- (void)setHasCirAlertWaBoost:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSCirAlerts

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cirAlertWaBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertVideoMediaBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertVerblessQueriesKgBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertRespectScoreOverrides, 0);
  objc_storeStrong((id *)&self->_cirAlertRespectMultiTurnResolvedRankingFlag, 0);
  objc_storeStrong((id *)&self->_cirAlertRespectIsFollowUpHeuristicFlag, 0);
  objc_storeStrong((id *)&self->_cirAlertProfaneFilter, 0);
  objc_storeStrong((id *)&self->_cirAlertMediaPodcastOverride, 0);
  objc_storeStrong((id *)&self->_cirAlertMapsKgSwap, 0);
  objc_storeStrong((id *)&self->_cirAlertKgWaBoostWebPre, 0);
  objc_storeStrong((id *)&self->_cirAlertKgWaBoostWebPost, 0);
  objc_storeStrong((id *)&self->_cirAlertKgWaBoostQa, 0);
  objc_storeStrong((id *)&self->_cirAlertKgWaBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertEmergencyOverride, 0);
  objc_storeStrong((id *)&self->_cirAlertDomainFallback, 0);
  objc_storeStrong((id *)&self->_cirAlertDictionaryOverKgBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertContext, 0);
  objc_storeStrong((id *)&self->_cirAlert, 0);
}

- (void)setHasCirAlertWaBoost:(BOOL)a3
{
  self->_hasCirAlertWaBoost = a3;
}

- (void)setHasCirAlertVideoMediaBoost:(BOOL)a3
{
  self->_hasCirAlertVideoMediaBoost = a3;
}

- (void)setHasCirAlertVerblessQueriesKgBoost:(BOOL)a3
{
  self->_hasCirAlertVerblessQueriesKgBoost = a3;
}

- (void)setHasCirAlertRespectScoreOverrides:(BOOL)a3
{
  self->_hasCirAlertRespectScoreOverrides = a3;
}

- (void)setHasCirAlertRespectMultiTurnResolvedRankingFlag:(BOOL)a3
{
  self->_hasCirAlertRespectMultiTurnResolvedRankingFlag = a3;
}

- (void)setHasCirAlertRespectIsFollowUpHeuristicFlag:(BOOL)a3
{
  self->_hasCirAlertRespectIsFollowUpHeuristicFlag = a3;
}

- (void)setHasCirAlertProfaneFilter:(BOOL)a3
{
  self->_hasCirAlertProfaneFilter = a3;
}

- (void)setHasCirAlertMediaPodcastOverride:(BOOL)a3
{
  self->_hasCirAlertMediaPodcastOverride = a3;
}

- (void)setHasCirAlertMapsKgSwap:(BOOL)a3
{
  self->_hasCirAlertMapsKgSwap = a3;
}

- (void)setHasCirAlertKgWaBoostWebPre:(BOOL)a3
{
  self->_hasCirAlertKgWaBoostWebPre = a3;
}

- (void)setHasCirAlertKgWaBoostWebPost:(BOOL)a3
{
  self->_hasCirAlertKgWaBoostWebPost = a3;
}

- (void)setHasCirAlertKgWaBoostQa:(BOOL)a3
{
  self->_hasCirAlertKgWaBoostQa = a3;
}

- (void)setHasCirAlertKgWaBoost:(BOOL)a3
{
  self->_hasCirAlertKgWaBoost = a3;
}

- (void)setHasCirAlertEmergencyOverride:(BOOL)a3
{
  self->_hasCirAlertEmergencyOverride = a3;
}

- (void)setHasCirAlertDomainFallback:(BOOL)a3
{
  self->_hasCirAlertDomainFallback = a3;
}

- (void)setHasCirAlertDictionaryOverKgBoost:(BOOL)a3
{
  self->_hasCirAlertDictionaryOverKgBoost = a3;
}

- (void)setHasCirAlertContext:(BOOL)a3
{
  self->_hasCirAlertContext = a3;
}

- (void)setHasCirAlert:(BOOL)a3
{
  self->_hasCirAlert = a3;
}

- (void)setCirAlertWaBoost:(id)a3
{
}

- (NSString)cirAlertWaBoost
{
  return self->_cirAlertWaBoost;
}

- (void)setCirAlertVideoMediaBoost:(id)a3
{
}

- (NSString)cirAlertVideoMediaBoost
{
  return self->_cirAlertVideoMediaBoost;
}

- (void)setCirAlertVerblessQueriesKgBoost:(id)a3
{
}

- (NSString)cirAlertVerblessQueriesKgBoost
{
  return self->_cirAlertVerblessQueriesKgBoost;
}

- (void)setCirAlertRespectScoreOverrides:(id)a3
{
}

- (NSString)cirAlertRespectScoreOverrides
{
  return self->_cirAlertRespectScoreOverrides;
}

- (void)setCirAlertRespectMultiTurnResolvedRankingFlag:(id)a3
{
}

- (NSString)cirAlertRespectMultiTurnResolvedRankingFlag
{
  return self->_cirAlertRespectMultiTurnResolvedRankingFlag;
}

- (void)setCirAlertRespectIsFollowUpHeuristicFlag:(id)a3
{
}

- (NSString)cirAlertRespectIsFollowUpHeuristicFlag
{
  return self->_cirAlertRespectIsFollowUpHeuristicFlag;
}

- (void)setCirAlertProfaneFilter:(id)a3
{
}

- (NSString)cirAlertProfaneFilter
{
  return self->_cirAlertProfaneFilter;
}

- (void)setCirAlertMediaPodcastOverride:(id)a3
{
}

- (NSString)cirAlertMediaPodcastOverride
{
  return self->_cirAlertMediaPodcastOverride;
}

- (void)setCirAlertMapsKgSwap:(id)a3
{
}

- (NSString)cirAlertMapsKgSwap
{
  return self->_cirAlertMapsKgSwap;
}

- (void)setCirAlertKgWaBoostWebPre:(id)a3
{
}

- (NSString)cirAlertKgWaBoostWebPre
{
  return self->_cirAlertKgWaBoostWebPre;
}

- (void)setCirAlertKgWaBoostWebPost:(id)a3
{
}

- (NSString)cirAlertKgWaBoostWebPost
{
  return self->_cirAlertKgWaBoostWebPost;
}

- (void)setCirAlertKgWaBoostQa:(id)a3
{
}

- (NSString)cirAlertKgWaBoostQa
{
  return self->_cirAlertKgWaBoostQa;
}

- (void)setCirAlertKgWaBoost:(id)a3
{
}

- (NSString)cirAlertKgWaBoost
{
  return self->_cirAlertKgWaBoost;
}

- (void)setCirAlertEmergencyOverride:(id)a3
{
}

- (NSString)cirAlertEmergencyOverride
{
  return self->_cirAlertEmergencyOverride;
}

- (void)setCirAlertDomainFallback:(id)a3
{
}

- (NSString)cirAlertDomainFallback
{
  return self->_cirAlertDomainFallback;
}

- (void)setCirAlertDictionaryOverKgBoost:(id)a3
{
}

- (NSString)cirAlertDictionaryOverKgBoost
{
  return self->_cirAlertDictionaryOverKgBoost;
}

- (void)setCirAlertContext:(id)a3
{
}

- (NSString)cirAlertContext
{
  return self->_cirAlertContext;
}

- (void)setCirAlert:(id)a3
{
}

- (NSString)cirAlert
{
  return self->_cirAlert;
}

- (PEGASUSSchemaPEGASUSCirAlerts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PEGASUSSchemaPEGASUSCirAlerts;
  v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)&v55 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"cirAlert"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlert:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"cirAlertContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"cirAlertDictionaryOverKgBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertDictionaryOverKgBoost:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"cirAlertDomainFallback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertDomainFallback:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"cirAlertEmergencyOverride"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertEmergencyOverride:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"cirAlertKgWaBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertKgWaBoost:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"cirAlertKgWaBoostQa"];
    objc_opt_class();
    v54 = v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertKgWaBoostQa:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"cirAlertKgWaBoostWebPost"];
    objc_opt_class();
    v53 = v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = (void *)[v20 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertKgWaBoostWebPost:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"cirAlertKgWaBoostWebPre"];
    objc_opt_class();
    v52 = v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertKgWaBoostWebPre:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"cirAlertMapsKgSwap"];
    objc_opt_class();
    v51 = v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertMapsKgSwap:v25];
    }
    v49 = v8;
    v26 = [v4 objectForKeyedSubscript:@"cirAlertMediaPodcastOverride"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertMediaPodcastOverride:v27];
    }
    v44 = v26;
    v48 = v10;
    v28 = [v4 objectForKeyedSubscript:@"cirAlertProfaneFilter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertProfaneFilter:v29];
    }
    v47 = v12;
    v30 = [v4 objectForKeyedSubscript:@"cirAlertRespectIsFollowUpHeuristicFlag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = (void *)[v30 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertRespectIsFollowUpHeuristicFlag:v31];
    }
    v46 = v14;
    v32 = [v4 objectForKeyedSubscript:@"cirAlertRespectMultiTurnResolvedRankingFlag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = (void *)[v32 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertRespectMultiTurnResolvedRankingFlag:v33];
    }
    v45 = v16;
    v34 = [v4 objectForKeyedSubscript:@"cirAlertRespectScoreOverrides"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = (void *)[v34 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertRespectScoreOverrides:v35];
    }
    v50 = v6;
    v36 = [v4 objectForKeyedSubscript:@"cirAlertVerblessQueriesKgBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = (void *)[v36 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertVerblessQueriesKgBoost:v37];
    }
    v38 = [v4 objectForKeyedSubscript:@"cirAlertVideoMediaBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = (void *)[v38 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertVideoMediaBoost:v39];
    }
    v40 = [v4 objectForKeyedSubscript:@"cirAlertWaBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = (void *)[v40 copy];
      [(PEGASUSSchemaPEGASUSCirAlerts *)v5 setCirAlertWaBoost:v41];
    }
    v42 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSCirAlerts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSCirAlerts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSCirAlerts *)self dictionaryRepresentation];
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
  if (self->_cirAlert)
  {
    id v4 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlert];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"cirAlert"];
  }
  if (self->_cirAlertContext)
  {
    v6 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertContext];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"cirAlertContext"];
  }
  if (self->_cirAlertDictionaryOverKgBoost)
  {
    v8 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDictionaryOverKgBoost];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"cirAlertDictionaryOverKgBoost"];
  }
  if (self->_cirAlertDomainFallback)
  {
    v10 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDomainFallback];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"cirAlertDomainFallback"];
  }
  if (self->_cirAlertEmergencyOverride)
  {
    v12 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertEmergencyOverride];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"cirAlertEmergencyOverride"];
  }
  if (self->_cirAlertKgWaBoost)
  {
    v14 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoost];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"cirAlertKgWaBoost"];
  }
  if (self->_cirAlertKgWaBoostQa)
  {
    v16 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostQa];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"cirAlertKgWaBoostQa"];
  }
  if (self->_cirAlertKgWaBoostWebPost)
  {
    v18 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPost];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"cirAlertKgWaBoostWebPost"];
  }
  if (self->_cirAlertKgWaBoostWebPre)
  {
    v20 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPre];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"cirAlertKgWaBoostWebPre"];
  }
  if (self->_cirAlertMapsKgSwap)
  {
    v22 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMapsKgSwap];
    v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"cirAlertMapsKgSwap"];
  }
  if (self->_cirAlertMediaPodcastOverride)
  {
    v24 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMediaPodcastOverride];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"cirAlertMediaPodcastOverride"];
  }
  if (self->_cirAlertProfaneFilter)
  {
    v26 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertProfaneFilter];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"cirAlertProfaneFilter"];
  }
  if (self->_cirAlertRespectIsFollowUpHeuristicFlag)
  {
    v28 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectIsFollowUpHeuristicFlag];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"cirAlertRespectIsFollowUpHeuristicFlag"];
  }
  if (self->_cirAlertRespectMultiTurnResolvedRankingFlag)
  {
    v30 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectMultiTurnResolvedRankingFlag];
    v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"cirAlertRespectMultiTurnResolvedRankingFlag"];
  }
  if (self->_cirAlertRespectScoreOverrides)
  {
    v32 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectScoreOverrides];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"cirAlertRespectScoreOverrides"];
  }
  if (self->_cirAlertVerblessQueriesKgBoost)
  {
    v34 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVerblessQueriesKgBoost];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"cirAlertVerblessQueriesKgBoost"];
  }
  if (self->_cirAlertVideoMediaBoost)
  {
    v36 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVideoMediaBoost];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"cirAlertVideoMediaBoost"];
  }
  if (self->_cirAlertWaBoost)
  {
    v38 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertWaBoost];
    v39 = (void *)[v38 copy];
    [v3 setObject:v39 forKeyedSubscript:@"cirAlertWaBoost"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_cirAlert hash];
  NSUInteger v4 = [(NSString *)self->_cirAlertContext hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_cirAlertDictionaryOverKgBoost hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_cirAlertDomainFallback hash];
  NSUInteger v7 = [(NSString *)self->_cirAlertEmergencyOverride hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_cirAlertKgWaBoost hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_cirAlertKgWaBoostQa hash];
  NSUInteger v10 = [(NSString *)self->_cirAlertKgWaBoostWebPost hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_cirAlertKgWaBoostWebPre hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_cirAlertMapsKgSwap hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_cirAlertMediaPodcastOverride hash];
  NSUInteger v14 = [(NSString *)self->_cirAlertProfaneFilter hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_cirAlertRespectIsFollowUpHeuristicFlag hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_cirAlertRespectMultiTurnResolvedRankingFlag hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_cirAlertRespectScoreOverrides hash];
  NSUInteger v18 = v13 ^ v17 ^ [(NSString *)self->_cirAlertVerblessQueriesKgBoost hash];
  NSUInteger v19 = [(NSString *)self->_cirAlertVideoMediaBoost hash];
  return v18 ^ v19 ^ [(NSString *)self->_cirAlertWaBoost hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_92;
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlert];
  NSUInteger v6 = [v4 cirAlert];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlert];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlert];
    NSUInteger v10 = [v4 cirAlert];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertContext];
  NSUInteger v6 = [v4 cirAlertContext];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertContext];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    NSUInteger v14 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertContext];
    NSUInteger v15 = [v4 cirAlertContext];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDictionaryOverKgBoost];
  NSUInteger v6 = [v4 cirAlertDictionaryOverKgBoost];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDictionaryOverKgBoost];
  if (v17)
  {
    NSUInteger v18 = (void *)v17;
    NSUInteger v19 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDictionaryOverKgBoost];
    v20 = [v4 cirAlertDictionaryOverKgBoost];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDomainFallback];
  NSUInteger v6 = [v4 cirAlertDomainFallback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v22 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDomainFallback];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDomainFallback];
    v25 = [v4 cirAlertDomainFallback];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertEmergencyOverride];
  NSUInteger v6 = [v4 cirAlertEmergencyOverride];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v27 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertEmergencyOverride];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertEmergencyOverride];
    v30 = [v4 cirAlertEmergencyOverride];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoost];
  NSUInteger v6 = [v4 cirAlertKgWaBoost];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v32 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoost];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoost];
    v35 = [v4 cirAlertKgWaBoost];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostQa];
  NSUInteger v6 = [v4 cirAlertKgWaBoostQa];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v37 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostQa];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostQa];
    v40 = [v4 cirAlertKgWaBoostQa];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPost];
  NSUInteger v6 = [v4 cirAlertKgWaBoostWebPost];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v42 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPost];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPost];
    v45 = [v4 cirAlertKgWaBoostWebPost];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPre];
  NSUInteger v6 = [v4 cirAlertKgWaBoostWebPre];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v47 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPre];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPre];
    v50 = [v4 cirAlertKgWaBoostWebPre];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMapsKgSwap];
  NSUInteger v6 = [v4 cirAlertMapsKgSwap];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v52 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMapsKgSwap];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMapsKgSwap];
    objc_super v55 = [v4 cirAlertMapsKgSwap];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMediaPodcastOverride];
  NSUInteger v6 = [v4 cirAlertMediaPodcastOverride];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v57 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMediaPodcastOverride];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMediaPodcastOverride];
    v60 = [v4 cirAlertMediaPodcastOverride];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertProfaneFilter];
  NSUInteger v6 = [v4 cirAlertProfaneFilter];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v62 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertProfaneFilter];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertProfaneFilter];
    v65 = [v4 cirAlertProfaneFilter];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectIsFollowUpHeuristicFlag];
  NSUInteger v6 = [v4 cirAlertRespectIsFollowUpHeuristicFlag];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v67 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectIsFollowUpHeuristicFlag];
  if (v67)
  {
    v68 = (void *)v67;
    v69 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectIsFollowUpHeuristicFlag];
    v70 = [v4 cirAlertRespectIsFollowUpHeuristicFlag];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectMultiTurnResolvedRankingFlag];
  NSUInteger v6 = [v4 cirAlertRespectMultiTurnResolvedRankingFlag];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v72 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectMultiTurnResolvedRankingFlag];
  if (v72)
  {
    v73 = (void *)v72;
    v74 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectMultiTurnResolvedRankingFlag];
    v75 = [v4 cirAlertRespectMultiTurnResolvedRankingFlag];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectScoreOverrides];
  NSUInteger v6 = [v4 cirAlertRespectScoreOverrides];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v77 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectScoreOverrides];
  if (v77)
  {
    v78 = (void *)v77;
    v79 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectScoreOverrides];
    v80 = [v4 cirAlertRespectScoreOverrides];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVerblessQueriesKgBoost];
  NSUInteger v6 = [v4 cirAlertVerblessQueriesKgBoost];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v82 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVerblessQueriesKgBoost];
  if (v82)
  {
    v83 = (void *)v82;
    v84 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVerblessQueriesKgBoost];
    v85 = [v4 cirAlertVerblessQueriesKgBoost];
    int v86 = [v84 isEqual:v85];

    if (!v86) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVideoMediaBoost];
  NSUInteger v6 = [v4 cirAlertVideoMediaBoost];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_91;
  }
  uint64_t v87 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVideoMediaBoost];
  if (v87)
  {
    v88 = (void *)v87;
    v89 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVideoMediaBoost];
    v90 = [v4 cirAlertVideoMediaBoost];
    int v91 = [v89 isEqual:v90];

    if (!v91) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertWaBoost];
  NSUInteger v6 = [v4 cirAlertWaBoost];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v92 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertWaBoost];
    if (!v92)
    {

LABEL_95:
      BOOL v97 = 1;
      goto LABEL_93;
    }
    v93 = (void *)v92;
    v94 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertWaBoost];
    v95 = [v4 cirAlertWaBoost];
    char v96 = [v94 isEqual:v95];

    if (v96) {
      goto LABEL_95;
    }
  }
  else
  {
LABEL_91:
  }
LABEL_92:
  BOOL v97 = 0;
LABEL_93:

  return v97;
}

- (void)writeTo:(id)a3
{
  id v23 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlert];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertContext];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDictionaryOverKgBoost];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertDomainFallback];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertEmergencyOverride];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v9 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoost];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v10 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostQa];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPost];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertKgWaBoostWebPre];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v13 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMapsKgSwap];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v14 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertMediaPodcastOverride];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v15 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertProfaneFilter];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  int v16 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectIsFollowUpHeuristicFlag];

  if (v16) {
    PBDataWriterWriteStringField();
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectMultiTurnResolvedRankingFlag];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v18 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertRespectScoreOverrides];

  if (v18) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v19 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVerblessQueriesKgBoost];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  v20 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertVideoMediaBoost];

  if (v20) {
    PBDataWriterWriteStringField();
  }
  int v21 = [(PEGASUSSchemaPEGASUSCirAlerts *)self cirAlertWaBoost];

  uint64_t v22 = v23;
  if (v21)
  {
    PBDataWriterWriteStringField();
    uint64_t v22 = v23;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSCirAlertsReadFrom(self, (uint64_t)a3);
}

- (void)deleteCirAlertWaBoost
{
}

- (BOOL)hasCirAlertWaBoost
{
  return self->_cirAlertWaBoost != 0;
}

- (void)deleteCirAlertVideoMediaBoost
{
}

- (BOOL)hasCirAlertVideoMediaBoost
{
  return self->_cirAlertVideoMediaBoost != 0;
}

- (void)deleteCirAlertVerblessQueriesKgBoost
{
}

- (BOOL)hasCirAlertVerblessQueriesKgBoost
{
  return self->_cirAlertVerblessQueriesKgBoost != 0;
}

- (void)deleteCirAlertRespectScoreOverrides
{
}

- (BOOL)hasCirAlertRespectScoreOverrides
{
  return self->_cirAlertRespectScoreOverrides != 0;
}

- (void)deleteCirAlertRespectMultiTurnResolvedRankingFlag
{
}

- (BOOL)hasCirAlertRespectMultiTurnResolvedRankingFlag
{
  return self->_cirAlertRespectMultiTurnResolvedRankingFlag != 0;
}

- (void)deleteCirAlertRespectIsFollowUpHeuristicFlag
{
}

- (BOOL)hasCirAlertRespectIsFollowUpHeuristicFlag
{
  return self->_cirAlertRespectIsFollowUpHeuristicFlag != 0;
}

- (void)deleteCirAlertProfaneFilter
{
}

- (BOOL)hasCirAlertProfaneFilter
{
  return self->_cirAlertProfaneFilter != 0;
}

- (void)deleteCirAlertMediaPodcastOverride
{
}

- (BOOL)hasCirAlertMediaPodcastOverride
{
  return self->_cirAlertMediaPodcastOverride != 0;
}

- (void)deleteCirAlertMapsKgSwap
{
}

- (BOOL)hasCirAlertMapsKgSwap
{
  return self->_cirAlertMapsKgSwap != 0;
}

- (void)deleteCirAlertKgWaBoostWebPre
{
}

- (BOOL)hasCirAlertKgWaBoostWebPre
{
  return self->_cirAlertKgWaBoostWebPre != 0;
}

- (void)deleteCirAlertKgWaBoostWebPost
{
}

- (BOOL)hasCirAlertKgWaBoostWebPost
{
  return self->_cirAlertKgWaBoostWebPost != 0;
}

- (void)deleteCirAlertKgWaBoostQa
{
}

- (BOOL)hasCirAlertKgWaBoostQa
{
  return self->_cirAlertKgWaBoostQa != 0;
}

- (void)deleteCirAlertKgWaBoost
{
}

- (BOOL)hasCirAlertKgWaBoost
{
  return self->_cirAlertKgWaBoost != 0;
}

- (void)deleteCirAlertEmergencyOverride
{
}

- (BOOL)hasCirAlertEmergencyOverride
{
  return self->_cirAlertEmergencyOverride != 0;
}

- (void)deleteCirAlertDomainFallback
{
}

- (BOOL)hasCirAlertDomainFallback
{
  return self->_cirAlertDomainFallback != 0;
}

- (void)deleteCirAlertDictionaryOverKgBoost
{
}

- (BOOL)hasCirAlertDictionaryOverKgBoost
{
  return self->_cirAlertDictionaryOverKgBoost != 0;
}

- (void)deleteCirAlertContext
{
}

- (BOOL)hasCirAlertContext
{
  return self->_cirAlertContext != 0;
}

- (void)deleteCirAlert
{
}

- (BOOL)hasCirAlert
{
  return self->_cirAlert != 0;
}

@end