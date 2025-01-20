@interface TVHighlight
- (NSString)highlightDescription;
- (NSString)localizedName;
- (NSURL)imageURL;
- (TVTimeRange)dateRange;
- (TVTimeRange)timeRange;
- (void)setDateRange:(id)a3;
- (void)setHighlightDescription:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setTimeRange:(id)a3;
@end

@implementation TVHighlight

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)highlightDescription
{
  return self->_highlightDescription;
}

- (void)setHighlightDescription:(id)a3
{
}

- (TVTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (TVTimeRange)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_highlightDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end