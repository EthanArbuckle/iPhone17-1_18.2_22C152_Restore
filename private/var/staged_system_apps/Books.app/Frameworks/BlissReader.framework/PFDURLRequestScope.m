@interface PFDURLRequestScope
+ (PFDURLRequestScope)requestScopeWithHosts:(id)a3 bookRootURL:(id)a4 context:(id)a5;
- (NSArray)hosts;
- (NSURL)bookRootURL;
- (PFDContext)context;
- (PFDURLRequestScope)initWithHosts:(id)a3 bookRootURL:(id)a4 context:(id)a5;
- (void)setBookRootURL:(id)a3;
- (void)setContext:(id)a3;
- (void)setHosts:(id)a3;
@end

@implementation PFDURLRequestScope

+ (PFDURLRequestScope)requestScopeWithHosts:(id)a3 bookRootURL:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithHosts:v10 bookRootURL:v9 context:v8];

  return (PFDURLRequestScope *)v11;
}

- (PFDURLRequestScope)initWithHosts:(id)a3 bookRootURL:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PFDURLRequestScope;
  id v11 = [(PFDURLRequestScope *)&v15 init];
  if (v11)
  {
    v12 = (NSArray *)[v8 copy];
    hosts = v11->_hosts;
    v11->_hosts = v12;

    objc_storeStrong((id *)&v11->_bookRootURL, a4);
    objc_storeStrong((id *)&v11->_context, a5);
  }

  return v11;
}

- (NSArray)hosts
{
  return self->_hosts;
}

- (void)setHosts:(id)a3
{
}

- (NSURL)bookRootURL
{
  return self->_bookRootURL;
}

- (void)setBookRootURL:(id)a3
{
}

- (PFDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bookRootURL, 0);

  objc_storeStrong((id *)&self->_hosts, 0);
}

@end