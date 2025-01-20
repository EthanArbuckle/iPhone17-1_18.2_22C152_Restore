@interface PMAddGroupMembersView.Coordinator
- (_TtCV17PasswordManagerUI21PMAddGroupMembersView11Coordinator)init;
- (void)memberPickerViewController:(id)a3 addedRecipients:(id)a4;
@end

@implementation PMAddGroupMembersView.Coordinator

- (void)memberPickerViewController:(id)a3 addedRecipients:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    sub_25893EF94(0, &qword_26A0AA888);
    uint64_t v4 = sub_258D6F6D8();
  }
  id v7 = a3;
  v8 = self;
  sub_2589F9ED0(v4);

  swift_bridgeObjectRelease();
}

- (_TtCV17PasswordManagerUI21PMAddGroupMembersView11Coordinator)init
{
  result = (_TtCV17PasswordManagerUI21PMAddGroupMembersView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end