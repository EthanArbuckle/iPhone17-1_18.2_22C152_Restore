@interface WPStorageAccessUserAgentStringQuirk
- (NSString)domain;
- (NSString)userAgentString;
- (WPStorageAccessUserAgentStringQuirk)initWithDomain:(id)a3 withUserAgentString:(id)a4;
- (id)description;
@end

@implementation WPStorageAccessUserAgentStringQuirk

- (NSString)userAgentString
{
  return self->_userAgentString;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentString, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (WPStorageAccessUserAgentStringQuirk)initWithDomain:(id)a3 withUserAgentString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WPStorageAccessUserAgentStringQuirk;
  v9 = [(WPStorageAccessUserAgentStringQuirk *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domain, a3);
    objc_storeStrong((id *)&v10->_userAgentString, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  if ([(NSString *)self->_domain length]) {
    [NSString stringWithFormat:@"%@ - %@", self->_domain, self->_userAgentString];
  }
  else {
  v3 = [(NSString *)self->_userAgentString description];
  }

  return v3;
}

@end