@interface PKPaymentInformationEventExtensionBaseContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)remoteContext;
- (id)remoteContextWithErrorHandler:(id)a3;
@end

@implementation PKPaymentInformationEventExtensionBaseContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_230 != -1) {
    dispatch_once(&_MergedGlobals_230, &__block_literal_global_97);
  }
  v2 = (void *)qword_1EB402E48;
  return v2;
}

void __80__PKPaymentInformationEventExtensionBaseContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2853A8];
  v1 = (void *)qword_1EB402E48;
  qword_1EB402E48 = v0;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB402E50 != -1) {
    dispatch_once(&qword_1EB402E50, &__block_literal_global_2);
  }
  v2 = (void *)qword_1EB402E58;
  return v2;
}

void __82__PKPaymentInformationEventExtensionBaseContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE285330];
  v1 = (void *)qword_1EB402E58;
  qword_1EB402E58 = v0;
}

- (id)remoteContext
{
  return [(PKPaymentInformationEventExtensionBaseContext *)self remoteContextWithErrorHandler:&__block_literal_global_11];
}

void __62__PKPaymentInformationEventExtensionBaseContext_remoteContext__block_invoke(uint64_t a1, uint64_t a2)
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
  uint64_t v5 = [(PKPaymentInformationEventExtensionBaseContext *)self _auxiliaryConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

@end