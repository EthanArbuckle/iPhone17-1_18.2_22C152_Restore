@interface PKExtensionBaseContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)remoteContext;
- (id)remoteContextWithErrorHandler:(id)a3;
@end

@implementation PKExtensionBaseContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_251 != -1) {
    dispatch_once(&_MergedGlobals_251, &__block_literal_global_151);
  }
  v2 = (void *)qword_1EB403218;
  return v2;
}

void __57__PKExtensionBaseContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE250810];
  v1 = (void *)qword_1EB403218;
  qword_1EB403218 = v0;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB403220 != -1) {
    dispatch_once(&qword_1EB403220, &__block_literal_global_89);
  }
  v2 = (void *)qword_1EB403228;
  return v2;
}

void __59__PKExtensionBaseContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2A0378];
  v1 = (void *)qword_1EB403228;
  qword_1EB403228 = v0;

  v2 = (void *)qword_1EB403228;
  PKPaymentAuthorizationServiceInterfaceSet(v2);
}

- (id)remoteContext
{
  return [(PKExtensionBaseContext *)self remoteContextWithErrorHandler:&__block_literal_global_134];
}

void __39__PKExtensionBaseContext_remoteContext__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "error getting remote context for extension: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)remoteContextWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKExtensionBaseContext *)self _auxiliaryConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

@end