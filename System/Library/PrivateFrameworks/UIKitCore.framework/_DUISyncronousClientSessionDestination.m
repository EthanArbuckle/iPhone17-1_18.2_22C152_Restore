@interface _DUISyncronousClientSessionDestination
- (id)serverDestinationProxyWithErrorHandler:(id)a3;
@end

@implementation _DUISyncronousClientSessionDestination

- (id)serverDestinationProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->super._connection synchronousRemoteObjectProxyWithErrorHandler:a3];
}

@end