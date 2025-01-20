@interface SVXXPCConnectionFactory
- (id)createWithMachServiceName:(id)a3 options:(unint64_t)a4;
@end

@implementation SVXXPCConnectionFactory

- (id)createWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  v5 = (objc_class *)MEMORY[0x263F08D68];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithMachServiceName:v6 options:a4];

  return v7;
}

@end