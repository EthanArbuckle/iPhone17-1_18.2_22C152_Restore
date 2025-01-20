@interface MRPromptForRouteAuthorizationResponseMessage
- (MRPromptForRouteAuthorizationResponseMessage)initWithResponse:(id)a3;
- (NSString)response;
- (unint64_t)type;
@end

@implementation MRPromptForRouteAuthorizationResponseMessage

- (MRPromptForRouteAuthorizationResponseMessage)initWithResponse:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRPromptForRouteAuthorizationResponseMessage;
  v5 = [(MRProtocolMessage *)&v8 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRPromptForRouteAuthorizationResponseMessageProtobuf);
    [(_MRPromptForRouteAuthorizationResponseMessageProtobuf *)v6 setResponse:v4];
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }
  return v5;
}

- (NSString)response
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 response];

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 60;
}

@end