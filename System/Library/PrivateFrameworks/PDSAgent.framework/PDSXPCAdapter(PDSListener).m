@interface PDSXPCAdapter(PDSListener)
- (id)listenerForMachService:()PDSListener;
@end

@implementation PDSXPCAdapter(PDSListener)

- (id)listenerForMachService:()PDSListener
{
  v3 = (objc_class *)MEMORY[0x263F08D88];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithMachServiceName:v4];

  return v5;
}

@end