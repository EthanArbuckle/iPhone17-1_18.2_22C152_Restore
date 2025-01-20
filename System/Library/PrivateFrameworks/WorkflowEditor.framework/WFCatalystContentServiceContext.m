@interface WFCatalystContentServiceContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (WFCatalystContentHost)hostProxy;
@end

@implementation WFCatalystContentServiceContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E7DFB20];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E7E0E28];
}

- (WFCatalystContentHost)hostProxy
{
  v2 = [(WFCatalystContentServiceContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxy];

  return (WFCatalystContentHost *)v3;
}

@end