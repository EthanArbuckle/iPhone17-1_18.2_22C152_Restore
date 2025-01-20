@interface PMCredentialProviderExtensionManager
- (_TtC17PasswordManagerUI36PMCredentialProviderExtensionManager)init;
- (void)credentialProviderExtensionManagerExtensionListDidChange:(id)a3;
@end

@implementation PMCredentialProviderExtensionManager

- (_TtC17PasswordManagerUI36PMCredentialProviderExtensionManager)init
{
  return (_TtC17PasswordManagerUI36PMCredentialProviderExtensionManager *)sub_258AED184();
}

- (void)credentialProviderExtensionManagerExtensionListDidChange:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_258AED7A0(v5);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI36PMCredentialProviderExtensionManager__extensions;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0AD8C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self
     + OBJC_IVAR____TtC17PasswordManagerUI36PMCredentialProviderExtensionManager__numberOfAutoFillProvidersEnabled;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0AD8C0);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end