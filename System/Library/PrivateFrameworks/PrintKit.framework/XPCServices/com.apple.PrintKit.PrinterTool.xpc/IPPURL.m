@interface IPPURL
- (IPPSession)session;
- (IPPURL)initWithSession:(id)a3 url:(id)a4;
- (NSURL)url;
@end

@implementation IPPURL

- (IPPURL)initWithSession:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPPURL;
  v9 = [(IPPURL *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_url, a4);
  }

  return v10;
}

- (IPPSession)session
{
  return (IPPSession *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end