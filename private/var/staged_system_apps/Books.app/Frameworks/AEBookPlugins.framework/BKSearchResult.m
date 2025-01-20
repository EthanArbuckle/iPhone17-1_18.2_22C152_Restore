@interface BKSearchResult
+ (id)mutableSearchResult;
- (BKLocation)location;
- (NSString)pageTitle;
- (NSString)searchString;
- (NSString)text;
- (_NSRange)searchStringRange;
- (id)pageLocation;
- (int64_t)ordinal;
- (int64_t)pageOffset;
- (void)setLocation:(id)a3;
- (void)setOrdinal:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)setPageTitle:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSearchStringRange:(_NSRange)a3;
- (void)setText:(id)a3;
@end

@implementation BKSearchResult

+ (id)mutableSearchResult
{
  v2 = objc_alloc_init(BKSearchResult);

  return v2;
}

- (id)pageLocation
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->_location;
  }
  else {
    v3 = [[BKPageLocation alloc] initWithOrdinal:self->_ordinal andOffset:self->_pageOffset];
  }

  return v3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (_NSRange)searchStringRange
{
  NSUInteger length = self->_searchStringRange.length;
  NSUInteger location = self->_searchStringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSearchStringRange:(_NSRange)a3
{
  self->_searchStringRange = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(int64_t)a3
{
  self->_ordinal = a3;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  self->_pageOffset = a3;
}

- (BKLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

@end