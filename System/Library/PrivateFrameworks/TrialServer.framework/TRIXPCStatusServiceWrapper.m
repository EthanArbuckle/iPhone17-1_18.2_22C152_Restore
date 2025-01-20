@interface TRIXPCStatusServiceWrapper
- (TRIXPCStatusServiceWrapper)initWithUnderlyingHandler:(id)a3;
@end

@implementation TRIXPCStatusServiceWrapper

- (TRIXPCStatusServiceWrapper)initWithUnderlyingHandler:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TRIXPCStatusServiceWrapper;
  return [(TRIXPCHandlerWrapper *)&v4 initWithUnderlyingHandler:a3 forProtocol:&unk_1F34861B8];
}

@end