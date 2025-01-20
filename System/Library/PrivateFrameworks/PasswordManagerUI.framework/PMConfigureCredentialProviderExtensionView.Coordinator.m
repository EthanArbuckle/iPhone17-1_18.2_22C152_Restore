@interface PMConfigureCredentialProviderExtensionView.Coordinator
- (_TtCV17PasswordManagerUI42PMConfigureCredentialProviderExtensionView11Coordinator)init;
- (void)credentialProviderExtensionConfigurationViewControllerDidFinish:(_ASCredentialProviderExtensionConfigurationViewController *)a3 completion:(id)a4;
@end

@implementation PMConfigureCredentialProviderExtensionView.Coordinator

- (_TtCV17PasswordManagerUI42PMConfigureCredentialProviderExtensionView11Coordinator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV17PasswordManagerUI42PMConfigureCredentialProviderExtensionView11Coordinator_onDismiss);
  void *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(PMConfigureCredentialProviderExtensionView.Coordinator *)&v6 init];
}

- (void)credentialProviderExtensionConfigurationViewControllerDidFinish:(_ASCredentialProviderExtensionConfigurationViewController *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0A9790);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_258D6F798();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A0AD450;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A0AD458;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_258B034A4((uint64_t)v9, (uint64_t)&unk_26A0AD460, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  sub_25891C24C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV17PasswordManagerUI42PMConfigureCredentialProviderExtensionView11Coordinator_onDismiss));
}

@end