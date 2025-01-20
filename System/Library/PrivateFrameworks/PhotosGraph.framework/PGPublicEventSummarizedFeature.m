@interface PGPublicEventSummarizedFeature
- (BOOL)isMandatoryForKeyAsset;
- (NSSet)intervalsPresent;
- (NSString)publicEventLabel;
- (PGPublicEventSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 publicEventLabel:(id)a5;
- (unsigned)type;
@end

@implementation PGPublicEventSummarizedFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventLabel, 0);
  objc_storeStrong((id *)&self->_intervalsPresent, 0);
}

- (NSString)publicEventLabel
{
  return self->_publicEventLabel;
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

- (PGPublicEventSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 publicEventLabel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPublicEventSummarizedFeature;
  v10 = [(PGPublicEventSummarizedFeature *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = 4;
    uint64_t v12 = PGSummarizedFeatureConsolidatedDateIntervals(v8);
    intervalsPresent = v11->_intervalsPresent;
    v11->_intervalsPresent = (NSSet *)v12;

    v11->_isMandatoryForKeyAsset = a4;
    objc_storeStrong((id *)&v11->_publicEventLabel, a5);
  }

  return v11;
}

@end