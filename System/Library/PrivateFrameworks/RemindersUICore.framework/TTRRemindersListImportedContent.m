@interface TTRRemindersListImportedContent
- (NSString)debugDescription;
- (NSString)description;
- (_TtC15RemindersUICore31TTRRemindersListImportedContent)init;
@end

@implementation TTRRemindersListImportedContent

- (NSString)description
{
  return (NSString *)sub_1B9187A08(self, (uint64_t)a2, (void (*)(void))TTRRemindersListImportedContent.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1B9187A08(self, (uint64_t)a2, (void (*)(void))TTRRemindersListImportedContent.debugDescription.getter);
}

- (_TtC15RemindersUICore31TTRRemindersListImportedContent)init
{
  result = (_TtC15RemindersUICore31TTRRemindersListImportedContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore31TTRRemindersListImportedContent_url, &qword_1EB9B1A70);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRRemindersListImportedContent_userActivity));
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore31TTRRemindersListImportedContent_image, &qword_1E9EFD328);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15RemindersUICore31TTRRemindersListImportedContent_copyPasteItem);
}

@end