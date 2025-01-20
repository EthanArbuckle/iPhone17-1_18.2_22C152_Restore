@interface TTRIQuickLookPreviewItem
- (BOOL)isEqual:(id)a3;
- (NSString)previewItemTitle;
- (NSURL)previewItemURL;
- (_TtC15RemindersUICore24TTRIQuickLookPreviewItem)init;
@end

@implementation TTRIQuickLookPreviewItem

- (NSURL)previewItemURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9B1A70);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B90CCA04((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore24TTRIQuickLookPreviewItem_previewItemURL, (uint64_t)v5, &qword_1EB9B1A70);
  uint64_t v6 = sub_1B996A580();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1B996A4B0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }

  return (NSURL *)v8;
}

- (NSString)previewItemTitle
{
  if (*(void *)&self->_anon_0[OBJC_IVAR____TtC15RemindersUICore24TTRIQuickLookPreviewItem_previewItemTitle])
  {
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
    v2 = (void *)sub_1B996E9B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1B9672A4C((uint64_t)v8);

  sub_1B90CCA68((uint64_t)v8, &qword_1EB9B4D10);
  return v6;
}

- (_TtC15RemindersUICore24TTRIQuickLookPreviewItem)init
{
  result = (_TtC15RemindersUICore24TTRIQuickLookPreviewItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore24TTRIQuickLookPreviewItem_previewItemURL, &qword_1EB9B1A70);

  swift_bridgeObjectRelease();
}

@end