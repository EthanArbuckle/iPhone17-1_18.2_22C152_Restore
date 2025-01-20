@interface SVXClientServiceServerConnectionFactory
- (id)createWithXPCConnection:(id)a3 performer:(id)a4 delegate:(id)a5;
@end

@implementation SVXClientServiceServerConnectionFactory

- (id)createWithXPCConnection:(id)a3 performer:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[SVXClientServiceServerConnection alloc] initWithXPCConnection:v9 performer:v8 delegate:v7];

  return v10;
}

@end