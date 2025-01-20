@interface StoryExportActivityViewController
- (_TtC15PhotosUIPrivate33StoryExportActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (id)completionWithItemsHandler;
- (int64_t)modalPresentationStyle;
- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3;
- (void)setCompletionWithItemsHandler:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
@end

@implementation StoryExportActivityViewController

- (_TtC15PhotosUIPrivate33StoryExportActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  if (a4)
  {
    sub_1AEA0826C(0, (unint64_t *)&unk_1E9A9C4F0);
    sub_1AEF96F70();
  }
  sub_1AEAE3A54();
}

- (int64_t)modalPresentationStyle
{
  v2 = self;
  id v3 = sub_1AEAE3B68();

  return (int64_t)v3;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v4 = self;
  sub_1AEAE3BF0(a3);
}

- (id)completionWithItemsHandler
{
  v2 = self;
  id v3 = sub_1AEAE4A68();
  uint64_t v5 = v4;

  if (v3)
  {
    v7[4] = v3;
    v7[5] = v5;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 1107296256;
    v7[2] = sub_1AEAE4F44;
    v7[3] = &block_descriptor_59;
    id v3 = _Block_copy(v7);
    swift_release();
  }
  return v3;
}

- (void)setCompletionWithItemsHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_1AEAE6250;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1AEAE4B8C((uint64_t)v4, v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController_exportActivityItemProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController_exportPreviewViewController));
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController_errorReporter);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController_fullSizePlayerAspect));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController____lazy_storage___linkMetadata);
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AEAE50D4();

  sub_1AEA0826C(0, &qword_1E9A9C460);
  v6 = (void *)sub_1AEF96F60();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AEAE60C0();
}

@end