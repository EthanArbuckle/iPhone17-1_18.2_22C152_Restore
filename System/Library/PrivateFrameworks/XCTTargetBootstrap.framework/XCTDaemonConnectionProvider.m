@interface XCTDaemonConnectionProvider
- (id)makeNewDaemonConnectionWithServiceName:(id)a3;
@end

@implementation XCTDaemonConnectionProvider

- (id)makeNewDaemonConnectionWithServiceName:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08D68];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithMachServiceName:v4 options:0];

  return v5;
}

@end