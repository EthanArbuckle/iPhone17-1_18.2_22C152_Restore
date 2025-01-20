@interface ACHBankCredentialPickerViewController.EditCredentialHandler
- (_TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler)init;
- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3;
@end

@implementation ACHBankCredentialPickerViewController.EditCredentialHandler

- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FA0D2A0(&OBJC_IVAR____TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler_info, &OBJC_IVAR____TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler_isUpdatingCredential, (uint64_t)&unk_1EF19C218, (uint64_t)&unk_1E94AEF60);
}

- (_TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler)init
{
  result = (_TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler_info));
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler_ach;
  uint64_t v4 = sub_1A03AE448();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
}

@end