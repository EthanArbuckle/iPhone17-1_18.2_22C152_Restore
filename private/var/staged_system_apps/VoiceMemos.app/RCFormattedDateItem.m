@interface RCFormattedDateItem
- (NSString)formattedDate;
- (double)expiration;
- (void)setExpiration:(double)a3;
- (void)setFormattedDate:(id)a3;
@end

@implementation RCFormattedDateItem

- (void)setFormattedDate:(id)a3
{
}

- (void)setExpiration:(double)a3
{
  self->_expiration = a3;
}

- (NSString)formattedDate
{
  return self->_formattedDate;
}

- (double)expiration
{
  return self->_expiration;
}

- (void).cxx_destruct
{
}

@end