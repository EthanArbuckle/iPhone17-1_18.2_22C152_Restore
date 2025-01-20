@interface SLConversationExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (NSString)messageGUID;
- (id)createURLWithMessageGUIDForCurrentURL:(id)a3;
- (id)dismissalRequestHandler;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)requestDismissal;
- (void)setDismissalRequestHandler:(id)a3;
- (void)setMessageGUID:(id)a3;
@end

@implementation SLConversationExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  return v2;
}

uint64_t __71__SLConversationExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC29580];
  uint64_t v1 = _extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;
  return v2;
}

uint64_t __69__SLConversationExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC3C6B8];
  uint64_t v1 = _extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)requestDismissal
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SLConversationExtensionHostContext_requestDismissal__block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__SLConversationExtensionHostContext_requestDismissal__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dismissalRequestHandler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) dismissalRequestHandler];
    v3[2]();
  }
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  v4 = -[SLConversationExtensionHostContext createURLWithMessageGUIDForCurrentURL:](self, "createURLWithMessageGUIDForCurrentURL:", a3, a4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SLConversationExtensionHostContext_openURL_completionHandler___block_invoke;
  block[3] = &unk_1E58A8720;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__SLConversationExtensionHostContext_openURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (id)createURLWithMessageGUIDForCurrentURL:(id)a3
{
  v4 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [v4 queryItems];
  id v7 = [v5 arrayWithArray:v6];

  v8 = (void *)MEMORY[0x1E4F290C8];
  v9 = [(SLConversationExtensionHostContext *)self messageGUID];
  v10 = [v8 queryItemWithName:@"message-guid" value:v9];
  [v7 addObject:v10];

  v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"overlay" value:@"1"];
  [v7 addObject:v11];

  [v4 setQueryItems:v7];
  v12 = [v4 URL];

  return v12;
}

- (id)dismissalRequestHandler
{
  return self->_dismissalRequestHandler;
}

- (void)setDismissalRequestHandler:(id)a3
{
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong(&self->_dismissalRequestHandler, 0);
}

@end