@interface WPLinkFilteringRule
- (NSString)domain;
- (NSString)path;
- (NSString)queryParameter;
- (WPLinkFilteringRule)initWithQueryParameter:(id)a3 domain:(id)a4 path:(id)a5;
- (id)description;
@end

@implementation WPLinkFilteringRule

- (WPLinkFilteringRule)initWithQueryParameter:(id)a3 domain:(id)a4 path:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WPLinkFilteringRule;
  v12 = [(WPLinkFilteringRule *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queryParameter, a3);
    objc_storeStrong((id *)&v13->_domain, a4);
    objc_storeStrong((id *)&v13->_path, a5);
    v14 = v13;
  }

  return v13;
}

- (id)description
{
  if ([(NSString *)self->_domain length] || [(NSString *)self->_path length])
  {
    v3 = [NSString stringWithFormat:@"%@ - %@ - %@", self->_queryParameter, self->_domain, self->_path];
  }
  else
  {
    v3 = self->_queryParameter;
  }

  return v3;
}

- (NSString)queryParameter
{
  return self->_queryParameter;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_queryParameter, 0);
}

@end