@interface PGMeaningSummarizedFeature
- (BOOL)isMandatoryForKeyAsset;
- (NSSet)intervalsPresent;
- (NSString)meaningLabel;
- (PGMeaningSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 meaningLabel:(id)a5;
- (unsigned)type;
@end

@implementation PGMeaningSummarizedFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningLabel, 0);
  objc_storeStrong((id *)&self->_intervalsPresent, 0);
}

- (NSString)meaningLabel
{
  return self->_meaningLabel;
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

- (PGMeaningSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 meaningLabel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningSummarizedFeature;
  v10 = [(PGMeaningSummarizedFeature *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = 3;
    uint64_t v12 = PGSummarizedFeatureConsolidatedDateIntervals(v8);
    intervalsPresent = v11->_intervalsPresent;
    v11->_intervalsPresent = (NSSet *)v12;

    v11->_isMandatoryForKeyAsset = a4;
    objc_storeStrong((id *)&v11->_meaningLabel, a5);
  }

  return v11;
}

@end