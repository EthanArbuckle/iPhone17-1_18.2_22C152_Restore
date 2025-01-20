@interface SXSubscriptionButtonComponentTextProvider
- (SXSubscriptionButtonComponentTextProvider)initWithTextProvider:(id)a3;
- (SXSubscriptionButtonTextProviding)textProvider;
- (id)textForComponent:(id)a3;
@end

@implementation SXSubscriptionButtonComponentTextProvider

- (SXSubscriptionButtonComponentTextProvider)initWithTextProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXSubscriptionButtonComponentTextProvider;
  v6 = [(SXSubscriptionButtonComponentTextProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textProvider, a3);
  }

  return v7;
}

- (id)textForComponent:(id)a3
{
  v4 = [a3 text];
  id v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = [(SXSubscriptionButtonComponentTextProvider *)self textProvider];
    uint64_t v8 = [v7 title];
    objc_super v9 = (void *)v8;
    v10 = &stru_26D5311C0;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v6 = v10;
  }
  return v6;
}

- (SXSubscriptionButtonTextProviding)textProvider
{
  return self->_textProvider;
}

- (void).cxx_destruct
{
}

@end