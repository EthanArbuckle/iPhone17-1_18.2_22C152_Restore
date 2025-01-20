@interface SXWebContentLoadEvent
- (NSError)error;
- (NSURL)URL;
- (SXWebContentLoadEvent)initWithURL:(id)a3;
- (void)setError:(id)a3;
@end

@implementation SXWebContentLoadEvent

- (SXWebContentLoadEvent)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXWebContentLoadEvent;
  v5 = [(SXAnalyticsEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;
  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end