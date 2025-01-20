@interface TRIXPCNamespaceManagementServiceWrapper
- (TRIXPCNamespaceManagementServiceWrapper)initWithUnderlyingHandler:(id)a3;
@end

@implementation TRIXPCNamespaceManagementServiceWrapper

- (TRIXPCNamespaceManagementServiceWrapper)initWithUnderlyingHandler:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TRIXPCNamespaceManagementServiceWrapper;
  return [(TRIXPCHandlerWrapper *)&v4 initWithUnderlyingHandler:a3 forProtocol:&unk_1F3485E50];
}

@end