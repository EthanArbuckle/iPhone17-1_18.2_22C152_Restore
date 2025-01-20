@interface SFCoreSpotlightRankingSignals
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEmbeddingStatus;
- (BOOL)hasIsExactMatchOfLaunchString;
- (BOOL)hasIsSemanticMatch;
- (BOOL)hasIsSyntacticMatch;
- (BOOL)hasItemAgeInDays;
- (BOOL)hasResultQueryRecency;
- (BOOL)hasWasEngagedInSpotlight;
- (BOOL)hasWasNominatedAsTopHit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExactMatchOfLaunchString;
- (BOOL)isSemanticMatch;
- (BOOL)isSyntacticMatch;
- (BOOL)wasEngagedInSpotlight;
- (BOOL)wasNominatedAsTopHit;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)engagementScore;
- (NSNumber)freshness;
- (NSNumber)pommesL2Score;
- (NSNumber)predictedLikelihoodOfEngagement;
- (NSNumber)semanticScore;
- (NSNumber)sodiumL2Score;
- (NSNumber)syntacticScore;
- (NSNumber)topicalityScore;
- (SFCoreSpotlightRankingSignals)initWithCoder:(id)a3;
- (SFCoreSpotlightRankingSignals)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)embeddingStatus;
- (int)resultQueryRecency;
- (unint64_t)hash;
- (unint64_t)itemAgeInDays;
- (void)encodeWithCoder:(id)a3;
- (void)setEmbeddingStatus:(int)a3;
- (void)setEngagementScore:(id)a3;
- (void)setFreshness:(id)a3;
- (void)setIsExactMatchOfLaunchString:(BOOL)a3;
- (void)setIsSemanticMatch:(BOOL)a3;
- (void)setIsSyntacticMatch:(BOOL)a3;
- (void)setItemAgeInDays:(unint64_t)a3;
- (void)setPommesL2Score:(id)a3;
- (void)setPredictedLikelihoodOfEngagement:(id)a3;
- (void)setResultQueryRecency:(int)a3;
- (void)setSemanticScore:(id)a3;
- (void)setSodiumL2Score:(id)a3;
- (void)setSyntacticScore:(id)a3;
- (void)setTopicalityScore:(id)a3;
- (void)setWasEngagedInSpotlight:(BOOL)a3;
- (void)setWasNominatedAsTopHit:(BOOL)a3;
@end

@implementation SFCoreSpotlightRankingSignals

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntacticScore, 0);
  objc_storeStrong((id *)&self->_semanticScore, 0);
  objc_storeStrong((id *)&self->_pommesL2Score, 0);
  objc_storeStrong((id *)&self->_sodiumL2Score, 0);
  objc_storeStrong((id *)&self->_predictedLikelihoodOfEngagement, 0);
  objc_storeStrong((id *)&self->_engagementScore, 0);
  objc_storeStrong((id *)&self->_freshness, 0);
  objc_storeStrong((id *)&self->_topicalityScore, 0);
}

- (unint64_t)itemAgeInDays
{
  return self->_itemAgeInDays;
}

- (int)embeddingStatus
{
  return self->_embeddingStatus;
}

- (void)setSyntacticScore:(id)a3
{
}

- (NSNumber)syntacticScore
{
  return self->_syntacticScore;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (void)setSemanticScore:(id)a3
{
}

- (NSNumber)semanticScore
{
  return self->_semanticScore;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (void)setPommesL2Score:(id)a3
{
}

- (NSNumber)pommesL2Score
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

- (void)setSodiumL2Score:(id)a3
{
}

- (NSNumber)sodiumL2Score
{
  return self->_sodiumL2Score;
}

- (BOOL)wasNominatedAsTopHit
{
  return self->_wasNominatedAsTopHit;
}

- (void)setPredictedLikelihoodOfEngagement:(id)a3
{
}

- (NSNumber)predictedLikelihoodOfEngagement
{
  return self->_predictedLikelihoodOfEngagement;
}

- (void)setEngagementScore:(id)a3
{
}

- (NSNumber)engagementScore
{
  return self->_engagementScore;
}

- (void)setFreshness:(id)a3
{
}

- (NSNumber)freshness
{
  return self->_freshness;
}

- (void)setTopicalityScore:(id)a3
{
}

- (NSNumber)topicalityScore
{
  return self->_topicalityScore;
}

- (unint64_t)hash
{
  v27 = [(SFCoreSpotlightRankingSignals *)self topicalityScore];
  uint64_t v3 = [v27 hash];
  v4 = [(SFCoreSpotlightRankingSignals *)self freshness];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(SFCoreSpotlightRankingSignals *)self engagementScore];
  uint64_t v7 = [v6 hash];
  v8 = [(SFCoreSpotlightRankingSignals *)self predictedLikelihoodOfEngagement];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  uint64_t v10 = [(SFCoreSpotlightRankingSignals *)self wasNominatedAsTopHit];
  v11 = [(SFCoreSpotlightRankingSignals *)self sodiumL2Score];
  uint64_t v12 = v9 ^ v10 ^ [v11 hash];
  uint64_t v13 = [(SFCoreSpotlightRankingSignals *)self isExactMatchOfLaunchString];
  uint64_t v14 = v13 ^ [(SFCoreSpotlightRankingSignals *)self wasEngagedInSpotlight];
  uint64_t v15 = v12 ^ v14 ^ [(SFCoreSpotlightRankingSignals *)self resultQueryRecency];
  v16 = [(SFCoreSpotlightRankingSignals *)self pommesL2Score];
  uint64_t v17 = [v16 hash];
  uint64_t v18 = v17 ^ [(SFCoreSpotlightRankingSignals *)self isSemanticMatch];
  v19 = [(SFCoreSpotlightRankingSignals *)self semanticScore];
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = v15 ^ v20 ^ [(SFCoreSpotlightRankingSignals *)self isSyntacticMatch];
  v22 = [(SFCoreSpotlightRankingSignals *)self syntacticScore];
  uint64_t v23 = [v22 hash];
  uint64_t v24 = v23 ^ [(SFCoreSpotlightRankingSignals *)self embeddingStatus];
  unint64_t v25 = v21 ^ v24 ^ [(SFCoreSpotlightRankingSignals *)self itemAgeInDays];

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFCoreSpotlightRankingSignals *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFCoreSpotlightRankingSignals *)v4 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v5 = v4;
      v6 = [(SFCoreSpotlightRankingSignals *)self topicalityScore];
      uint64_t v7 = [(SFCoreSpotlightRankingSignals *)v5 topicalityScore];
      if ((v6 == 0) == (v7 != 0))
      {
        BOOL v11 = 0;
LABEL_54:

        goto LABEL_55;
      }
      v8 = [(SFCoreSpotlightRankingSignals *)self topicalityScore];
      if (v8)
      {
        uint64_t v9 = [(SFCoreSpotlightRankingSignals *)self topicalityScore];
        uint64_t v10 = [(SFCoreSpotlightRankingSignals *)v5 topicalityScore];
        if (![v9 isEqual:v10])
        {
          BOOL v11 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v73 = v10;
        v74 = v9;
      }
      uint64_t v12 = [(SFCoreSpotlightRankingSignals *)self freshness];
      uint64_t v13 = [(SFCoreSpotlightRankingSignals *)v5 freshness];
      if ((v12 == 0) == (v13 != 0)) {
        goto LABEL_50;
      }
      uint64_t v14 = [(SFCoreSpotlightRankingSignals *)self freshness];
      if (v14)
      {
        uint64_t v15 = [(SFCoreSpotlightRankingSignals *)self freshness];
        v70 = [(SFCoreSpotlightRankingSignals *)v5 freshness];
        v71 = v15;
        if (![v15 isEqual:v70]) {
          goto LABEL_20;
        }
      }
      v72 = v14;
      v16 = [(SFCoreSpotlightRankingSignals *)self engagementScore];
      uint64_t v17 = [(SFCoreSpotlightRankingSignals *)v5 engagementScore];
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14) {
          goto LABEL_50;
        }
        goto LABEL_20;
      }
      v67 = v16;
      v68 = v17;
      v69 = [(SFCoreSpotlightRankingSignals *)self engagementScore];
      if (v69)
      {
        uint64_t v18 = [(SFCoreSpotlightRankingSignals *)self engagementScore];
        v65 = [(SFCoreSpotlightRankingSignals *)v5 engagementScore];
        v66 = v18;
        if (![v18 isEqual:v65])
        {
LABEL_48:

LABEL_49:
          if (v14)
          {
LABEL_20:
          }
LABEL_50:

          BOOL v11 = 0;
          if (!v8)
          {
LABEL_53:

            goto LABEL_54;
          }
          goto LABEL_51;
        }
      }
      v19 = [(SFCoreSpotlightRankingSignals *)self predictedLikelihoodOfEngagement];
      uint64_t v20 = [(SFCoreSpotlightRankingSignals *)v5 predictedLikelihoodOfEngagement];
      if ((v19 == 0) == (v20 != 0))
      {

        goto LABEL_47;
      }
      v62 = v19;
      v63 = v20;
      v64 = [(SFCoreSpotlightRankingSignals *)self predictedLikelihoodOfEngagement];
      if (v64)
      {
        uint64_t v21 = [(SFCoreSpotlightRankingSignals *)self predictedLikelihoodOfEngagement];
        v60 = [(SFCoreSpotlightRankingSignals *)v5 predictedLikelihoodOfEngagement];
        v61 = v21;
        int v22 = objc_msgSend(v21, "isEqual:");
        uint64_t v14 = v72;
        if (!v22) {
          goto LABEL_45;
        }
      }
      BOOL v23 = [(SFCoreSpotlightRankingSignals *)self wasNominatedAsTopHit];
      if (v23 == [(SFCoreSpotlightRankingSignals *)v5 wasNominatedAsTopHit])
      {
        uint64_t v24 = [(SFCoreSpotlightRankingSignals *)self sodiumL2Score];
        unint64_t v25 = [(SFCoreSpotlightRankingSignals *)v5 sodiumL2Score];
        if ((v24 == 0) != (v25 != 0))
        {
          v57 = v24;
          v58 = v25;
          [(SFCoreSpotlightRankingSignals *)self sodiumL2Score];
          v59 = uint64_t v14 = v72;
          if (v59)
          {
            uint64_t v26 = [(SFCoreSpotlightRankingSignals *)self sodiumL2Score];
            uint64_t v27 = [(SFCoreSpotlightRankingSignals *)v5 sodiumL2Score];
            v56 = (void *)v26;
            v28 = (void *)v26;
            uint64_t v24 = (void *)v27;
            if (![v28 isEqual:v27]) {
              goto LABEL_42;
            }
          }
          BOOL v29 = [(SFCoreSpotlightRankingSignals *)self isExactMatchOfLaunchString];
          if (v29 == [(SFCoreSpotlightRankingSignals *)v5 isExactMatchOfLaunchString])
          {
            BOOL v30 = [(SFCoreSpotlightRankingSignals *)self wasEngagedInSpotlight];
            if (v30 == [(SFCoreSpotlightRankingSignals *)v5 wasEngagedInSpotlight])
            {
              int v31 = [(SFCoreSpotlightRankingSignals *)self resultQueryRecency];
              if (v31 == [(SFCoreSpotlightRankingSignals *)v5 resultQueryRecency])
              {
                v55 = [(SFCoreSpotlightRankingSignals *)self pommesL2Score];
                v54 = [(SFCoreSpotlightRankingSignals *)v5 pommesL2Score];
                if ((v55 == 0) != (v54 != 0))
                {
                  v53 = v24;
                  v32 = [(SFCoreSpotlightRankingSignals *)self pommesL2Score];
                  if (v32)
                  {
                    v33 = [(SFCoreSpotlightRankingSignals *)self pommesL2Score];
                    v51 = [(SFCoreSpotlightRankingSignals *)v5 pommesL2Score];
                    v52 = v33;
                    if (!objc_msgSend(v33, "isEqual:")) {
                      goto LABEL_63;
                    }
                  }
                  BOOL v35 = [(SFCoreSpotlightRankingSignals *)self isSemanticMatch];
                  if (v35 == [(SFCoreSpotlightRankingSignals *)v5 isSemanticMatch])
                  {
                    v50 = [(SFCoreSpotlightRankingSignals *)self semanticScore];
                    v49 = [(SFCoreSpotlightRankingSignals *)v5 semanticScore];
                    if ((v50 == 0) != (v49 != 0))
                    {
                      v48 = [(SFCoreSpotlightRankingSignals *)self semanticScore];
                      if (v48)
                      {
                        v36 = [(SFCoreSpotlightRankingSignals *)self semanticScore];
                        v46 = [(SFCoreSpotlightRankingSignals *)v5 semanticScore];
                        v47 = v36;
                        if (!objc_msgSend(v36, "isEqual:"))
                        {
                          BOOL v11 = 0;
LABEL_87:

LABEL_88:
                          if (v32)
                          {
                          }
                          if (v59)
                          {
                          }
                          if (v64)
                          {
                          }
                          if (v69)
                          {
                          }
                          if (v72)
                          {
                          }
                          if (!v8) {
                            goto LABEL_53;
                          }
LABEL_51:
                          uint64_t v10 = v73;
                          uint64_t v9 = v74;
                          goto LABEL_52;
                        }
                      }
                      BOOL v37 = [(SFCoreSpotlightRankingSignals *)self isSyntacticMatch];
                      if (v37 == [(SFCoreSpotlightRankingSignals *)v5 isSyntacticMatch])
                      {
                        v45 = [(SFCoreSpotlightRankingSignals *)self syntacticScore];
                        v44 = [(SFCoreSpotlightRankingSignals *)v5 syntacticScore];
                        if ((v45 == 0) != (v44 != 0))
                        {
                          v43 = [(SFCoreSpotlightRankingSignals *)self syntacticScore];
                          if (!v43
                            || ([(SFCoreSpotlightRankingSignals *)self syntacticScore],
                                v38 = objc_claimAutoreleasedReturnValue(),
                                [(SFCoreSpotlightRankingSignals *)v5 syntacticScore],
                                v41 = objc_claimAutoreleasedReturnValue(),
                                v42 = v38,
                                objc_msgSend(v38, "isEqual:")))
                          {
                            int v39 = [(SFCoreSpotlightRankingSignals *)self embeddingStatus];
                            if (v39 == [(SFCoreSpotlightRankingSignals *)v5 embeddingStatus])
                            {
                              unint64_t v40 = [(SFCoreSpotlightRankingSignals *)self itemAgeInDays];
                              BOOL v11 = v40 == [(SFCoreSpotlightRankingSignals *)v5 itemAgeInDays];
                            }
                            else
                            {
                              BOOL v11 = 0;
                            }
                            if (!v43) {
                              goto LABEL_85;
                            }
                          }
                          else
                          {
                            BOOL v11 = 0;
                          }

LABEL_85:
LABEL_86:
                          if (!v48) {
                            goto LABEL_88;
                          }
                          goto LABEL_87;
                        }
                      }
                      BOOL v11 = 0;
                      goto LABEL_86;
                    }
                  }
                  if (!v32)
                  {
LABEL_64:

                    if (v59)
                    {
                    }
                    if (v64)
                    {
                    }
                    if (v69)
                    {
                    }
                    if (v72)
                    {
                    }
                    goto LABEL_50;
                  }
LABEL_63:

                  goto LABEL_64;
                }
              }
            }
          }
          uint64_t v14 = v72;
          if (!v59)
          {
LABEL_43:

LABEL_44:
            if (!v64)
            {
LABEL_46:

LABEL_47:
              if (!v69) {
                goto LABEL_49;
              }
              goto LABEL_48;
            }
LABEL_45:

            goto LABEL_46;
          }
LABEL_42:

          goto LABEL_43;
        }
      }
      uint64_t v14 = v72;
      goto LABEL_44;
    }
    BOOL v11 = 0;
  }
LABEL_55:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFCoreSpotlightRankingSignals *)self topicalityScore];
  v6 = (void *)[v5 copy];
  [v4 setTopicalityScore:v6];

  uint64_t v7 = [(SFCoreSpotlightRankingSignals *)self freshness];
  v8 = (void *)[v7 copy];
  [v4 setFreshness:v8];

  uint64_t v9 = [(SFCoreSpotlightRankingSignals *)self engagementScore];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setEngagementScore:v10];

  BOOL v11 = [(SFCoreSpotlightRankingSignals *)self predictedLikelihoodOfEngagement];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setPredictedLikelihoodOfEngagement:v12];

  objc_msgSend(v4, "setWasNominatedAsTopHit:", -[SFCoreSpotlightRankingSignals wasNominatedAsTopHit](self, "wasNominatedAsTopHit"));
  uint64_t v13 = [(SFCoreSpotlightRankingSignals *)self sodiumL2Score];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setSodiumL2Score:v14];

  objc_msgSend(v4, "setIsExactMatchOfLaunchString:", -[SFCoreSpotlightRankingSignals isExactMatchOfLaunchString](self, "isExactMatchOfLaunchString"));
  objc_msgSend(v4, "setWasEngagedInSpotlight:", -[SFCoreSpotlightRankingSignals wasEngagedInSpotlight](self, "wasEngagedInSpotlight"));
  objc_msgSend(v4, "setResultQueryRecency:", -[SFCoreSpotlightRankingSignals resultQueryRecency](self, "resultQueryRecency"));
  uint64_t v15 = [(SFCoreSpotlightRankingSignals *)self pommesL2Score];
  v16 = (void *)[v15 copy];
  [v4 setPommesL2Score:v16];

  objc_msgSend(v4, "setIsSemanticMatch:", -[SFCoreSpotlightRankingSignals isSemanticMatch](self, "isSemanticMatch"));
  uint64_t v17 = [(SFCoreSpotlightRankingSignals *)self semanticScore];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setSemanticScore:v18];

  objc_msgSend(v4, "setIsSyntacticMatch:", -[SFCoreSpotlightRankingSignals isSyntacticMatch](self, "isSyntacticMatch"));
  v19 = [(SFCoreSpotlightRankingSignals *)self syntacticScore];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setSyntacticScore:v20];

  objc_msgSend(v4, "setEmbeddingStatus:", -[SFCoreSpotlightRankingSignals embeddingStatus](self, "embeddingStatus"));
  objc_msgSend(v4, "setItemAgeInDays:", -[SFCoreSpotlightRankingSignals itemAgeInDays](self, "itemAgeInDays"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCoreSpotlightRankingSignals alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCoreSpotlightRankingSignals *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCoreSpotlightRankingSignals alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCoreSpotlightRankingSignals *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCoreSpotlightRankingSignals alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCoreSpotlightRankingSignals *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCoreSpotlightRankingSignals)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCoreSpotlightRankingSignals alloc] initWithData:v5];
  uint64_t v7 = [(SFCoreSpotlightRankingSignals *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasItemAgeInDays
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setItemAgeInDays:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_itemAgeInDays = a3;
}

- (BOOL)hasEmbeddingStatus
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setEmbeddingStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_embeddingStatus = a3;
}

- (BOOL)hasIsSyntacticMatch
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isSyntacticMatch = a3;
}

- (BOOL)hasIsSemanticMatch
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isSemanticMatch = a3;
}

- (BOOL)hasResultQueryRecency
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setResultQueryRecency:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_resultQueryRecency = a3;
}

- (BOOL)hasWasEngagedInSpotlight
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWasEngagedInSpotlight:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_wasEngagedInSpotlight = a3;
}

- (BOOL)hasIsExactMatchOfLaunchString
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsExactMatchOfLaunchString:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isExactMatchOfLaunchString = a3;
}

- (BOOL)hasWasNominatedAsTopHit
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWasNominatedAsTopHit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_wasNominatedAsTopHit = a3;
}

- (SFCoreSpotlightRankingSignals)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFCoreSpotlightRankingSignals;
  uint64_t v5 = [(SFCoreSpotlightRankingSignals *)&v32 init];
  if (v5)
  {
    [v4 topicalityScore];
    if (v6 != 0.0)
    {
      uint64_t v7 = NSNumber;
      [v4 topicalityScore];
      v8 = objc_msgSend(v7, "numberWithFloat:");
      [(SFCoreSpotlightRankingSignals *)v5 setTopicalityScore:v8];
    }
    [v4 freshness];
    if (v9 != 0.0)
    {
      uint64_t v10 = NSNumber;
      [v4 freshness];
      BOOL v11 = objc_msgSend(v10, "numberWithFloat:");
      [(SFCoreSpotlightRankingSignals *)v5 setFreshness:v11];
    }
    [v4 engagementScore];
    if (v12 != 0.0)
    {
      uint64_t v13 = NSNumber;
      [v4 engagementScore];
      uint64_t v14 = objc_msgSend(v13, "numberWithFloat:");
      [(SFCoreSpotlightRankingSignals *)v5 setEngagementScore:v14];
    }
    [v4 predictedLikelihoodOfEngagement];
    if (v15 != 0.0)
    {
      v16 = NSNumber;
      [v4 predictedLikelihoodOfEngagement];
      uint64_t v17 = objc_msgSend(v16, "numberWithFloat:");
      [(SFCoreSpotlightRankingSignals *)v5 setPredictedLikelihoodOfEngagement:v17];
    }
    if ([v4 wasNominatedAsTopHit]) {
      -[SFCoreSpotlightRankingSignals setWasNominatedAsTopHit:](v5, "setWasNominatedAsTopHit:", [v4 wasNominatedAsTopHit]);
    }
    [v4 sodiumL2Score];
    if (v18 != 0.0)
    {
      v19 = NSNumber;
      [v4 sodiumL2Score];
      uint64_t v20 = objc_msgSend(v19, "numberWithFloat:");
      [(SFCoreSpotlightRankingSignals *)v5 setSodiumL2Score:v20];
    }
    if ([v4 isExactMatchOfLaunchString]) {
      -[SFCoreSpotlightRankingSignals setIsExactMatchOfLaunchString:](v5, "setIsExactMatchOfLaunchString:", [v4 isExactMatchOfLaunchString]);
    }
    if ([v4 wasEngagedInSpotlight]) {
      -[SFCoreSpotlightRankingSignals setWasEngagedInSpotlight:](v5, "setWasEngagedInSpotlight:", [v4 wasEngagedInSpotlight]);
    }
    if ([v4 resultQueryRecency]) {
      -[SFCoreSpotlightRankingSignals setResultQueryRecency:](v5, "setResultQueryRecency:", [v4 resultQueryRecency]);
    }
    [v4 pommesL2Score];
    if (v21 != 0.0)
    {
      int v22 = NSNumber;
      [v4 pommesL2Score];
      BOOL v23 = objc_msgSend(v22, "numberWithFloat:");
      [(SFCoreSpotlightRankingSignals *)v5 setPommesL2Score:v23];
    }
    if ([v4 isSemanticMatch]) {
      -[SFCoreSpotlightRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", [v4 isSemanticMatch]);
    }
    [v4 semanticScore];
    if (v24 != 0.0)
    {
      unint64_t v25 = NSNumber;
      [v4 semanticScore];
      uint64_t v26 = objc_msgSend(v25, "numberWithFloat:");
      [(SFCoreSpotlightRankingSignals *)v5 setSemanticScore:v26];
    }
    if ([v4 isSyntacticMatch]) {
      -[SFCoreSpotlightRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", [v4 isSyntacticMatch]);
    }
    [v4 syntacticScore];
    if (v27 != 0.0)
    {
      v28 = NSNumber;
      [v4 syntacticScore];
      BOOL v29 = objc_msgSend(v28, "numberWithFloat:");
      [(SFCoreSpotlightRankingSignals *)v5 setSyntacticScore:v29];
    }
    if ([v4 embeddingStatus]) {
      -[SFCoreSpotlightRankingSignals setEmbeddingStatus:](v5, "setEmbeddingStatus:", [v4 embeddingStatus]);
    }
    if ([v4 itemAgeInDays]) {
      -[SFCoreSpotlightRankingSignals setItemAgeInDays:](v5, "setItemAgeInDays:", [v4 itemAgeInDays]);
    }
    BOOL v30 = v5;
  }

  return v5;
}

@end