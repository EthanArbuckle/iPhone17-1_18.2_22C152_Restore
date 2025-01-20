@interface SSParsecBundleFeatureCollection
- (NSNumber)blockIdValue;
- (NSNumber)cep;
- (NSNumber)cepAllMaxRatio;
- (NSNumber)cepMaxRatio;
- (NSNumber)maxCEPAbsRank;
- (NSNumber)maxCEPRelRank;
- (NSNumber)maxScore;
- (NSNumber)maxScoreAbsRank;
- (NSNumber)maxScoreRelRank;
- (NSNumber)numResults;
- (NSNumber)originalOrderAbsRank;
- (NSNumber)originalOrderRelRank;
- (id)description;
- (void)setBlockIdValue:(id)a3;
- (void)setCep:(id)a3;
- (void)setCepAllMaxRatio:(id)a3;
- (void)setCepMaxRatio:(id)a3;
- (void)setMaxCEPAbsRank:(id)a3;
- (void)setMaxCEPRelRank:(id)a3;
- (void)setMaxScore:(id)a3;
- (void)setMaxScoreAbsRank:(id)a3;
- (void)setMaxScoreRelRank:(id)a3;
- (void)setNumResults:(id)a3;
- (void)setOriginalOrderAbsRank:(id)a3;
- (void)setOriginalOrderRelRank:(id)a3;
@end

@implementation SSParsecBundleFeatureCollection

- (id)description
{
  id v14 = (id)NSString;
  v17.receiver = self;
  v17.super_class = (Class)SSParsecBundleFeatureCollection;
  v16 = [(SSParsecBundleFeatureCollection *)&v17 description];
  v3 = [(SSParsecBundleFeatureCollection *)self maxScore];
  v4 = [(SSParsecBundleFeatureCollection *)self originalOrderAbsRank];
  v5 = [(SSParsecBundleFeatureCollection *)self originalOrderRelRank];
  v6 = [(SSParsecBundleFeatureCollection *)self numResults];
  v7 = [(SSParsecBundleFeatureCollection *)self cep];
  v8 = [(SSParsecBundleFeatureCollection *)self maxCEPAbsRank];
  v9 = [(SSParsecBundleFeatureCollection *)self maxCEPRelRank];
  v10 = [(SSParsecBundleFeatureCollection *)self cepMaxRatio];
  v11 = [(SSParsecBundleFeatureCollection *)self cepAllMaxRatio];
  v12 = [(SSParsecBundleFeatureCollection *)self blockIdValue];
  id v15 = [v14 stringWithFormat:@"%@ maxScore:%@ absRank:%@ relRank:%@ numResults:%lu cep:%@ maxCEPAbs:%@ maxCEPRel:%@ cepMaxRatio:%@ cepAllMaxRatio:%@ blockIdValue: %@", v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v15;
}

- (NSNumber)numResults
{
  return self->_numResults;
}

- (void)setNumResults:(id)a3
{
}

- (NSNumber)maxScore
{
  return self->_maxScore;
}

- (void)setMaxScore:(id)a3
{
}

- (NSNumber)originalOrderAbsRank
{
  return self->_originalOrderAbsRank;
}

- (void)setOriginalOrderAbsRank:(id)a3
{
}

- (NSNumber)originalOrderRelRank
{
  return self->_originalOrderRelRank;
}

- (void)setOriginalOrderRelRank:(id)a3
{
}

- (NSNumber)maxCEPAbsRank
{
  return self->_maxCEPAbsRank;
}

- (void)setMaxCEPAbsRank:(id)a3
{
}

- (NSNumber)maxCEPRelRank
{
  return self->_maxCEPRelRank;
}

- (void)setMaxCEPRelRank:(id)a3
{
}

- (NSNumber)cep
{
  return self->_cep;
}

- (void)setCep:(id)a3
{
}

- (NSNumber)cepMaxRatio
{
  return self->_cepMaxRatio;
}

- (void)setCepMaxRatio:(id)a3
{
}

- (NSNumber)cepAllMaxRatio
{
  return self->_cepAllMaxRatio;
}

- (void)setCepAllMaxRatio:(id)a3
{
}

- (NSNumber)blockIdValue
{
  return self->_blockIdValue;
}

- (void)setBlockIdValue:(id)a3
{
}

- (NSNumber)maxScoreAbsRank
{
  return self->_maxScoreAbsRank;
}

- (void)setMaxScoreAbsRank:(id)a3
{
}

- (NSNumber)maxScoreRelRank
{
  return self->_maxScoreRelRank;
}

- (void)setMaxScoreRelRank:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxScoreRelRank, 0);
  objc_storeStrong((id *)&self->_maxScoreAbsRank, 0);
  objc_storeStrong((id *)&self->_blockIdValue, 0);
  objc_storeStrong((id *)&self->_cepAllMaxRatio, 0);
  objc_storeStrong((id *)&self->_cepMaxRatio, 0);
  objc_storeStrong((id *)&self->_cep, 0);
  objc_storeStrong((id *)&self->_maxCEPRelRank, 0);
  objc_storeStrong((id *)&self->_maxCEPAbsRank, 0);
  objc_storeStrong((id *)&self->_originalOrderRelRank, 0);
  objc_storeStrong((id *)&self->_originalOrderAbsRank, 0);
  objc_storeStrong((id *)&self->_maxScore, 0);
  objc_storeStrong((id *)&self->_numResults, 0);
}

@end