@interface TTRReminderCopyPasteItem
+ (BOOL)supportsSecureCoding;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)writableTypeIdentifiersForItemProvider;
- (_TtC15RemindersUICore24TTRReminderCopyPasteItem)init;
- (_TtC15RemindersUICore24TTRReminderCopyPasteItem)initWithCoder:(id)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TTRReminderCopyPasteItem

- (_TtC15RemindersUICore24TTRReminderCopyPasteItem)init
{
  result = (_TtC15RemindersUICore24TTRReminderCopyPasteItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90CDBB4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore24TTRReminderCopyPasteItem_metadata), *(void *)&self->metadata[OBJC_IVAR____TtC15RemindersUICore24TTRReminderCopyPasteItem_metadata]);
  sub_1B90CDBB4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore24TTRReminderCopyPasteItem_storages), *(void *)&self->metadata[OBJC_IVAR____TtC15RemindersUICore24TTRReminderCopyPasteItem_storages]);

  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTRReminderCopyPasteItem.encode(with:)((NSCoder)v4);
}

- (_TtC15RemindersUICore24TTRReminderCopyPasteItem)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore24TTRReminderCopyPasteItem *)TTRReminderCopyPasteItem.init(coder:)(a3);
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  v7 = (void *)sub_1B95E9150((uint64_t)v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  return v7;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9B4CB0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1B997AB90;
  if (qword_1EB9AD0B8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_1EB9B9C98;
  *(void *)(v0 + 32) = static TTRReminderCopyPasteItem.pasteboardTypeString;
  *(void *)(v0 + 40) = v1;
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  v2 = (void *)sub_1B996EE40();
  swift_bridgeObjectRelease();

  return v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1B996A5D0();
  unint64_t v10 = v9;

  swift_getObjCClassMetadata();
  v11 = sub_1B95E92B8();
  sub_1B90CDBB4(v8, v10);

  return v11;
}

@end