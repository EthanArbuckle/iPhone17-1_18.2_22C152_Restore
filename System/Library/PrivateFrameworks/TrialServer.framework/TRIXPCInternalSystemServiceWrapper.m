@interface TRIXPCInternalSystemServiceWrapper
- (TRIXPCInternalSystemServiceWrapper)initWithUnderlyingHandler:(id)a3;
@end

@implementation TRIXPCInternalSystemServiceWrapper

- (TRIXPCInternalSystemServiceWrapper)initWithUnderlyingHandler:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TRIXPCInternalSystemServiceWrapper;
  return [(TRIXPCHandlerWrapper *)&v4 initWithUnderlyingHandler:a3 forProtocol:&unk_1F3486860];
}

@end