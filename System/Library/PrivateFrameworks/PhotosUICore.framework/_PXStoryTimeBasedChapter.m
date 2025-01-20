@interface _PXStoryTimeBasedChapter
- (NSCopying)identifier;
- (NSDateInterval)dateInterval;
- (NSDateInterval)extendedDateIntervalForComparisonWithAssetDates;
- (NSString)diagnosticDescription;
- (NSString)firstAssetLocalIdentifier;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (_PXStoryTimeBasedChapter)initWithDateInterval:(id)a3 firstAssetLocalIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compareStartDateTo:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setFirstAssetLocalIdentifier:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation _PXStoryTimeBasedChapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (void)setFirstAssetLocalIdentifier:(id)a3
{
}

- (NSString)firstAssetLocalIdentifier
{
  return self->_firstAssetLocalIdentifier;
}

- (void)setDateInterval:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(_PXStoryTimeBasedChapter *)self dateInterval];
  v6 = [(_PXStoryTimeBasedChapter *)self firstAssetLocalIdentifier];
  v7 = (void *)[v4 initWithDateInterval:v5 firstAssetLocalIdentifier:v6];

  v8 = [(_PXStoryTimeBasedChapter *)self localizedTitle];
  [v7 setLocalizedTitle:v8];

  v9 = [(_PXStoryTimeBasedChapter *)self localizedSubtitle];
  [v7 setLocalizedSubtitle:v9];

  return v7;
}

- (NSString)diagnosticDescription
{
  id v3 = [NSString alloc];
  id v4 = [(_PXStoryTimeBasedChapter *)self identifier];
  v5 = [(_PXStoryTimeBasedChapter *)self localizedTitle];
  v6 = [(_PXStoryTimeBasedChapter *)self localizedSubtitle];
  v7 = [(_PXStoryTimeBasedChapter *)self dateInterval];
  v8 = (void *)[v3 initWithFormat:@"{ id=%@ title=“%@” subtitle=“%@” dateInterval=%@ }", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (NSCopying)identifier
{
  v2 = [(_PXStoryTimeBasedChapter *)self dateInterval];
  id v3 = [v2 startDate];

  return (NSCopying *)v3;
}

- (NSDateInterval)extendedDateIntervalForComparisonWithAssetDates
{
  v2 = [(_PXStoryTimeBasedChapter *)self dateInterval];
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v4 = [v2 startDate];
  v5 = [v4 dateByAddingTimeInterval:-0.2];
  [v2 duration];
  v7 = (void *)[v3 initWithStartDate:v5 duration:v6 + 0.4];

  return (NSDateInterval *)v7;
}

- (int64_t)compareStartDateTo:(id)a3
{
  id v4 = a3;
  v5 = [(_PXStoryTimeBasedChapter *)self dateInterval];
  double v6 = [v5 startDate];
  v7 = [v4 dateInterval];

  v8 = [v7 startDate];
  int64_t v9 = [v6 compare:v8];

  return v9;
}

- (_PXStoryTimeBasedChapter)initWithDateInterval:(id)a3 firstAssetLocalIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryTimeBasedChapter;
  int64_t v9 = [(_PXStoryTimeBasedChapter *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateInterval, a3);
    uint64_t v11 = [v8 copy];
    firstAssetLocalIdentifier = v10->_firstAssetLocalIdentifier;
    v10->_firstAssetLocalIdentifier = (NSString *)v11;
  }
  return v10;
}

@end