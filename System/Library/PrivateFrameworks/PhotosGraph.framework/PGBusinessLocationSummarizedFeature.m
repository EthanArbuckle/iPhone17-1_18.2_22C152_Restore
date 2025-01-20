@interface PGBusinessLocationSummarizedFeature
- (BOOL)isMandatoryForKeyAsset;
- (NSSet)intervalsPresent;
- (PGBusinessLocationSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 businessNode:(id)a5;
- (PGGraphBusinessNode)businessNode;
- (unsigned)type;
@end

@implementation PGBusinessLocationSummarizedFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessNode, 0);
  objc_storeStrong((id *)&self->_intervalsPresent, 0);
}

- (PGGraphBusinessNode)businessNode
{
  return self->_businessNode;
}

- (BOOL)isMandatoryForKeyAsset
{
  return self->_isMandatoryForKeyAsset;
}

- (NSSet)intervalsPresent
{
  return self->_intervalsPresent;
}

- (unsigned)type
{
  return self->_type;
}

- (PGBusinessLocationSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 businessNode:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGBusinessLocationSummarizedFeature;
  v10 = [(PGBusinessLocationSummarizedFeature *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = 2;
    uint64_t v12 = PGSummarizedFeatureConsolidatedDateIntervals(v8);
    intervalsPresent = v11->_intervalsPresent;
    v11->_intervalsPresent = (NSSet *)v12;

    v11->_isMandatoryForKeyAsset = a4;
    objc_storeStrong((id *)&v11->_businessNode, a5);
  }

  return v11;
}

@end