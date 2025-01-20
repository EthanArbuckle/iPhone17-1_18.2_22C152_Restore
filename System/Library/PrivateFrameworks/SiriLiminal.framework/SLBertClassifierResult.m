@interface SLBertClassifierResult
- (NSArray)domainProb;
- (NSDictionary)extractedFeats;
- (NSString)assetVersion;
- (SLBertClassifierResult)initWithScore:(id)a3 assetVersion:(id)a4 extractedFeats:(id)a5;
- (id)dictionaryRepresentation;
@end

@implementation SLBertClassifierResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedFeats, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_domainProb, 0);
}

- (NSDictionary)extractedFeats
{
  return self->_extractedFeats;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (NSArray)domainProb
{
  return self->_domainProb;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 addEntriesFromDictionary:self->_extractedFeats];
  [v3 setObject:self->_domainProb forKey:@"domainProb"];
  [v3 setObject:self->_assetVersion forKey:@"assetVersion"];
  return v3;
}

- (SLBertClassifierResult)initWithScore:(id)a3 assetVersion:(id)a4 extractedFeats:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SLBertClassifierResult;
  v12 = [(SLBertClassifierResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_domainProb, a3);
    objc_storeStrong((id *)&v13->_assetVersion, a4);
    objc_storeStrong((id *)&v13->_extractedFeats, a5);
  }

  return v13;
}

@end