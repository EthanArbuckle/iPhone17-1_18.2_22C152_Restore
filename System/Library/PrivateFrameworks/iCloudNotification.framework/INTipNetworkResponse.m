@interface INTipNetworkResponse
- (INTipNetworkResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
@end

@implementation INTipNetworkResponse

- (INTipNetworkResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)INTipNetworkResponse;
  v4 = [(INTipNetworkResponse *)&v9 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v5 = v4;
  if (v4)
  {
    v6 = (id *)&v4->AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse];
    if ([*v6 statusCode] != (id)200)
    {
      v7 = _INLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100028B08(v6, v7);
      }
    }
  }
  return v5;
}

@end