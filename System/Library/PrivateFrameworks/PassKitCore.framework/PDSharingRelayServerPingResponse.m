@interface PDSharingRelayServerPingResponse
+ (BOOL)jsonDataOptional;
- (PDSharingRelayServerPingResponse)initWithData:(id)a3;
@end

@implementation PDSharingRelayServerPingResponse

- (PDSharingRelayServerPingResponse)initWithData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDSharingRelayServerPingResponse;
  return [(PDSharingRelayServerPingResponse *)&v4 initWithData:0];
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

@end