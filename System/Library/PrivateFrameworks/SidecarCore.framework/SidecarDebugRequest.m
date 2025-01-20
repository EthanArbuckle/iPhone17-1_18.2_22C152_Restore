@interface SidecarDebugRequest
- (SidecarDebugRequest)initWithMessage:(id)a3;
- (void)sendItems:(id)a3;
@end

@implementation SidecarDebugRequest

- (void)sendItems:(id)a3
{
}

- (SidecarDebugRequest)initWithMessage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SidecarDebugRequest;
  return [(SidecarRequest *)&v4 initWithSession:0 message:a3];
}

@end