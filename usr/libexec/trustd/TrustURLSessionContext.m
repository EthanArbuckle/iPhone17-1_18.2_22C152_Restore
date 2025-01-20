@interface TrustURLSessionContext
- (NSArray)URIs;
- (NSMutableData)response;
- (TrustURLSessionContext)initWithContext:(void *)a3 uris:(id)a4;
- (double)maxAge;
- (unint64_t)URIix;
- (unint64_t)attribution;
- (unint64_t)numTasks;
- (void)context;
- (void)dealloc;
- (void)setAttribution:(unint64_t)a3;
- (void)setContext:(void *)a3;
- (void)setMaxAge:(double)a3;
- (void)setNumTasks:(unint64_t)a3;
- (void)setResponse:(id)a3;
- (void)setURIix:(unint64_t)a3;
- (void)setURIs:(id)a3;
@end

@implementation TrustURLSessionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_URIs, 0);
}

- (void)setAttribution:(unint64_t)a3
{
  self->_attribution = a3;
}

- (unint64_t)attribution
{
  return self->_attribution;
}

- (void)setNumTasks:(unint64_t)a3
{
  self->_numTasks = a3;
}

- (unint64_t)numTasks
{
  return self->_numTasks;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (void)setResponse:(id)a3
{
}

- (NSMutableData)response
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setURIix:(unint64_t)a3
{
  self->_URIix = a3;
}

- (unint64_t)URIix
{
  return self->_URIix;
}

- (void)setURIs:(id)a3
{
}

- (NSArray)URIs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void)context
{
  return self->_context;
}

- (void)dealloc
{
  if ([(TrustURLSessionContext *)self context])
  {
    CFRelease([(TrustURLSessionContext *)self context]);
    [(TrustURLSessionContext *)self setContext:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)TrustURLSessionContext;
  [(TrustURLSessionContext *)&v3 dealloc];
}

- (TrustURLSessionContext)initWithContext:(void *)a3 uris:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)TrustURLSessionContext;
  v7 = [(TrustURLSessionContext *)&v9 init];
  if (v7)
  {
    if (a3) {
      CFRetain(a3);
    }
    [(TrustURLSessionContext *)v7 setContext:a3];
    [(TrustURLSessionContext *)v7 setURIs:v6];
    [(TrustURLSessionContext *)v7 setURIix:0];
    [(TrustURLSessionContext *)v7 setNumTasks:0];
    [(TrustURLSessionContext *)v7 setAttribution:0];
  }

  return v7;
}

@end