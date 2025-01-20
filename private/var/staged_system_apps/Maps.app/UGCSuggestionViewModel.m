@interface UGCSuggestionViewModel
- (NSDate)visitDate;
- (int64_t)contentType;
- (void)setContentType:(int64_t)a3;
- (void)setVisitDate:(id)a3;
@end

@implementation UGCSuggestionViewModel

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (NSDate)visitDate
{
  return self->_visitDate;
}

- (void)setVisitDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end