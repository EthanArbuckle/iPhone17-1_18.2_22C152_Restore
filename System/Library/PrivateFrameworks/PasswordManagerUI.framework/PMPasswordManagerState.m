@interface PMPasswordManagerState
- (_TtC17PasswordManagerUI22PMPasswordManagerState)init;
@end

@implementation PMPasswordManagerState

- (_TtC17PasswordManagerUI22PMPasswordManagerState)init
{
  return (_TtC17PasswordManagerUI22PMPasswordManagerState *)PMPasswordManagerState.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__isGeneratedPasswordsLogPresented;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0A7400);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__systemSettingNavigationPath;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0B26E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  v8 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__sharingGroupIDToPresent;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0AA190);
  v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v11 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__contextForPresentedNewGroupFlow;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0B26D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v10((char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__groupIDForRecentlyAcceptedInvitation, v9);
  v5((char *)self+ OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__isMembersOfDeletedGroupMightHaveAccessToAccountsAlertPresented, v4);
  v13 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__groupMemberNamesOfDeletedGroup;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0AA180);
  v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  v5((char *)self+ OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__isMembersOfGroupUserLeftMightHaveAccessToAccountsAlertPresented, v4);
  v15((char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__groupMemberNamesOfGroupTheyLeft, v14);
  v16 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__inboundOTPAuthURLContext;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0B26D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__inboundSharableAccountContext;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0B26C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  swift_release();

  swift_bridgeObjectRelease();
}

@end