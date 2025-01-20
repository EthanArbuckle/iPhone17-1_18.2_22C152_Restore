@interface PPHighlightedEventQuery
- (id)description;
- (int)highlightsOptions;
- (void)setHighlightsOptions:(int)a3;
@end

@implementation PPHighlightedEventQuery

- (void)setHighlightsOptions:(int)a3
{
  self->_highlightsOptions = a3;
}

- (int)highlightsOptions
{
  return self->_highlightsOptions;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(PPEventQuery *)self fromDate];
  v5 = [(PPEventQuery *)self toDate];
  v6 = (void *)[v3 initWithFormat:@"<PPHighlightedEventQuery f:%@ t:%@ o:%d>", v4, v5, self->_highlightsOptions];

  return v6;
}

@end