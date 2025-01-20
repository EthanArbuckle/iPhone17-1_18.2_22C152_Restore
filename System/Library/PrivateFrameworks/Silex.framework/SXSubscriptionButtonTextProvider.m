@interface SXSubscriptionButtonTextProvider
- (NSString)title;
- (SXSubscriptionButtonTextProvider)initWithTitle:(id)a3;
@end

@implementation SXSubscriptionButtonTextProvider

- (SXSubscriptionButtonTextProvider)initWithTitle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXSubscriptionButtonTextProvider;
  v5 = [(SXSubscriptionButtonTextProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    title = v5->_title;
    v5->_title = (NSString *)v6;
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end