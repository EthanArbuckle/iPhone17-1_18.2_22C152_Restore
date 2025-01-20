@interface UIOverlayServiceInterfaceSpecification
@end

@implementation UIOverlayServiceInterfaceSpecification

void __52___UIOverlayServiceInterfaceSpecification_interface__block_invoke()
{
  id v4 = [MEMORY[0x1E4F62858] interfaceWithIdentifier:@"com.apple.UIKit.OverlayUI.OverlayService"];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED4408E8];
  [v4 setServer:v0];

  v1 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED6977E0];
  [v4 setClient:v1];

  [v4 setClientMessagingExpectation:0];
  uint64_t v2 = [v4 copy];
  v3 = (void *)_MergedGlobals_1151;
  _MergedGlobals_1151 = v2;
}

@end