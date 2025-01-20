@interface TTRIQuickLookPreviewController.DataSource
- (_TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource)init;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
@end

@implementation TTRIQuickLookPreviewController.DataSource

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource_previewItems);
  if (!(v3 >> 62)) {
    return *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v6 = a3;
  v7 = self;
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  int64_t v8 = sub_1B9970930();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t v5 = *(void *)((char *)self
                 + OBJC_IVAR____TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource_previewItems);
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v7 = self;
    id v8 = a3;
    id v9 = v7;
    id v6 = (void *)MEMORY[0x1BA9D9380](a4, v5);

    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return self;
  }
  id v6 = *(void **)(v5 + 8 * a4 + 32);
  swift_unknownObjectRetain();
LABEL_5:

  return v6;
}

- (_TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource)init
{
  result = (_TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end