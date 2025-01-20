@interface TTRIQuickLookImageAttachmentPreviewItem
- (BOOL)isEqual:(id)a3;
- (NSString)previewItemTitle;
- (NSURL)previewItemURL;
- (_TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem)init;
@end

@implementation TTRIQuickLookImageAttachmentPreviewItem

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = TTRIQuickLookImageAttachmentPreviewItem.isEqual(_:)((uint64_t)v8);

  sub_1B922A57C((uint64_t)v8);
  return v6 & 1;
}

- (_TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem)init
{
  result = (_TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem_attachmentID));
  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem_fileURL;
  uint64_t v4 = sub_1B996A580();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (NSURL)previewItemURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9B1A70);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem_fileURL;
  uint64_t v7 = sub_1B996A580();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1B996A4B0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (NSString)previewItemTitle
{
  uint64_t v2 = qword_1EB9B6110;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_1B996A200();

  uint64_t v4 = (void *)sub_1B996E9B0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

@end