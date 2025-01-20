@interface TVPChapter
- (NSString)chapterDescription;
- (NSString)localizedName;
- (TVPDateRange)dateRange;
- (TVPTimeRange)timeRange;
- (void)setChapterDescription:(id)a3;
- (void)setDateRange:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setTimeRange:(id)a3;
@end

@implementation TVPChapter

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)chapterDescription
{
  return self->_chapterDescription;
}

- (void)setChapterDescription:(id)a3
{
}

- (TVPTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (TVPDateRange)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_chapterDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
}

@end