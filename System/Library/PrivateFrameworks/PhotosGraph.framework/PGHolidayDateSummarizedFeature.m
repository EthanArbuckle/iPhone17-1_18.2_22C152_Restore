@interface PGHolidayDateSummarizedFeature
- (BOOL)isMandatoryForKeyAsset;
- (NSSet)intervalsPresent;
- (NSString)holidayName;
- (PGHolidayDateSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 holidayName:(id)a5;
- (unsigned)type;
@end

@implementation PGHolidayDateSummarizedFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holidayName, 0);
  objc_storeStrong((id *)&self->_intervalsPresent, 0);
}

- (NSString)holidayName
{
  return self->_holidayName;
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

- (PGHolidayDateSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 holidayName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGHolidayDateSummarizedFeature;
  v10 = [(PGHolidayDateSummarizedFeature *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = 5;
    uint64_t v12 = PGSummarizedFeatureConsolidatedDateIntervals(v8);
    intervalsPresent = v11->_intervalsPresent;
    v11->_intervalsPresent = (NSSet *)v12;

    v11->_isMandatoryForKeyAsset = a4;
    objc_storeStrong((id *)&v11->_holidayName, a5);
  }

  return v11;
}

@end