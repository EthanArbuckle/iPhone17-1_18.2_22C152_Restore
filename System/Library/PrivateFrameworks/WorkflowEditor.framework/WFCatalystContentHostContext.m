@interface WFCatalystContentHostContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (WFCatalystContentHost)handler;
- (void)actionInterfaceListenerDidBecomeActive:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation WFCatalystContentHostContext

+ (id)_allowedItemPayloadClasses
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E7DFB20];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E7E0E28];
}

- (void).cxx_destruct
{
}

- (void)setHandler:(id)a3
{
}

- (WFCatalystContentHost)handler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  return (WFCatalystContentHost *)WeakRetained;
}

- (void)actionInterfaceListenerDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = [(WFCatalystContentHostContext *)self handler];
  [v5 actionInterfaceListenerDidBecomeActive:v4];
}

@end