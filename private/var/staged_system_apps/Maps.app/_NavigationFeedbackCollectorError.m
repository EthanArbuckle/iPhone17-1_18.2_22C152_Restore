@interface _NavigationFeedbackCollectorError
- (NSDate)date;
- (NSError)error;
- (void)setDate:(id)a3;
- (void)setError:(id)a3;
@end

@implementation _NavigationFeedbackCollectorError

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end