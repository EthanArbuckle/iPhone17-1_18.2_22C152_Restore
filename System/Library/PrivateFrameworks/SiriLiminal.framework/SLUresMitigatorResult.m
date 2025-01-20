@interface SLUresMitigatorResult
- (BOOL)didMitigate;
- (NSDictionary)detailedResult;
- (NSDictionary)extractedFeats;
- (NSString)assetVersion;
- (SLUresMitigatorResult)initWithScore:(float)a3 decision:(BOOL)a4 decisionLevel:(double)a5 detailedResults:(id)a6 extractedFeats:(id)a7;
- (double)decisionLevel;
- (float)score;
- (float)speakerIDThreshold;
- (float)threshold;
@end

@implementation SLUresMitigatorResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedFeats, 0);
  objc_storeStrong((id *)&self->_detailedResult, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
}

- (NSDictionary)extractedFeats
{
  return self->_extractedFeats;
}

- (NSDictionary)detailedResult
{
  return self->_detailedResult;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (float)speakerIDThreshold
{
  return self->_speakerIDThreshold;
}

- (float)threshold
{
  return self->_threshold;
}

- (double)decisionLevel
{
  return self->_decisionLevel;
}

- (BOOL)didMitigate
{
  return self->_didMitigate;
}

- (float)score
{
  return self->_score;
}

- (SLUresMitigatorResult)initWithScore:(float)a3 decision:(BOOL)a4 decisionLevel:(double)a5 detailedResults:(id)a6 extractedFeats:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SLUresMitigatorResult;
  v15 = [(SLUresMitigatorResult *)&v24 init];
  v16 = v15;
  if (v15)
  {
    v15->_score = a3;
    v15->_didMitigate = a4;
    objc_storeStrong((id *)&v15->_detailedResult, a6);
    v16->_decisionLevel = a5;
    objc_storeStrong((id *)&v16->_extractedFeats, a7);
    uint64_t v17 = [v13 objectForKeyedSubscript:@"assetVersion"];
    assetVersion = v16->_assetVersion;
    v16->_assetVersion = (NSString *)v17;

    v19 = [v13 objectForKeyedSubscript:@"threshold"];
    [v19 floatValue];
    v16->_threshold = v20;

    v21 = [v13 objectForKeyedSubscript:@"speakerIDthreshold"];
    [v21 floatValue];
    v16->_speakerIDThreshold = v22;
  }
  return v16;
}

@end