@interface MRCompanionLinkClientRequest
- (NSDate)date;
- (id)callback;
- (void)setCallback:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation MRCompanionLinkClientRequest

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end