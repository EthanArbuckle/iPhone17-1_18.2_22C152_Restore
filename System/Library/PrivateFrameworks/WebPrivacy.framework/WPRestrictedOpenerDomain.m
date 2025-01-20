@interface WPRestrictedOpenerDomain
- (NSString)domain;
- (WPRestrictedOpenerDomain)initWithDomain:(id)a3 openerType:(int64_t)a4;
- (id)description;
- (int64_t)openerType;
@end

@implementation WPRestrictedOpenerDomain

- (WPRestrictedOpenerDomain)initWithDomain:(id)a3 openerType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPRestrictedOpenerDomain;
  v8 = [(WPRestrictedOpenerDomain *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_domain, a3);
    v9->_openerType = a4;
  }

  return v9;
}

- (id)description
{
  int64_t openerType = self->_openerType;
  v3 = "unknown";
  if (openerType == 2) {
    v3 = "postMessageAndClose";
  }
  if (openerType == 1) {
    v4 = "noOpener";
  }
  else {
    v4 = v3;
  }
  return (id)[NSString stringWithFormat:@"%@ - %s", self->_domain, v4];
}

- (NSString)domain
{
  return self->_domain;
}

- (int64_t)openerType
{
  return self->_openerType;
}

- (void).cxx_destruct
{
}

@end