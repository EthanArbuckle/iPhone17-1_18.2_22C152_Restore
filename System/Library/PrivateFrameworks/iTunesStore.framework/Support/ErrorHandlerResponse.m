@interface ErrorHandlerResponse
- (NSURL)URL;
- (int64_t)responseType;
- (void)dealloc;
- (void)setResponseType:(int64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation ErrorHandlerResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ErrorHandlerResponse;
  [(ErrorHandlerResponse *)&v3 dealloc];
}

- (int64_t)responseType
{
  return self->_responseType;
}

- (void)setResponseType:(int64_t)a3
{
  self->_responseType = a3;
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

@end