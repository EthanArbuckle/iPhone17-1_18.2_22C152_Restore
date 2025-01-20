@interface UIRuntimeOutletConnection
- (id)description;
- (void)connect;
- (void)connectForSimulator;
@end

@implementation UIRuntimeOutletConnection

- (void)connect
{
  id v5 = [(UIRuntimeConnection *)self source];
  v3 = [(UIRuntimeConnection *)self destination];
  v4 = [(UIRuntimeConnection *)self label];
  [v5 setValue:v3 forKeyPath:v4];
}

- (void)connectForSimulator
{
  id v5 = [(UIRuntimeConnection *)self source];
  v3 = [(UIRuntimeConnection *)self destination];
  v4 = [(UIRuntimeConnection *)self label];
  [v5 setValue:v3 forKeyPath:v4];
}

- (id)description
{
  v3 = NSString;
  v4 = [(UIRuntimeConnection *)self source];
  id v5 = [(UIRuntimeConnection *)self destination];
  v6 = [(UIRuntimeConnection *)self label];
  v7 = [v3 stringWithFormat:@"Outlet connection with source %@, value %@, and variable name %@.", v4, v5, v6];

  return v7;
}

@end