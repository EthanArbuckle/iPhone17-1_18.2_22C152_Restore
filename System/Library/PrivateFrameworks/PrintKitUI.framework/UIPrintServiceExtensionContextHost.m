@interface UIPrintServiceExtensionContextHost
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (UIPrintServiceExtensionContextHost)init;
@end

@implementation UIPrintServiceExtensionContextHost

- (UIPrintServiceExtensionContextHost)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIPrintServiceExtensionContextHost;
  return [(UIPrintServiceExtensionContextHost *)&v3 init];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3CFEFE8];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3CE3448];
}

@end