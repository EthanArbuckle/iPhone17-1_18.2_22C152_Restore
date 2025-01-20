@interface PhotosDetailsEXIFWidgetViewModel
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation PhotosDetailsEXIFWidgetViewModel

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA669D8C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel__isContentLoaded;
  sub_1AA669D40(0, (unint64_t *)&unk_1E981BAE0, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC70]);
  uint64_t v5 = v4;
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v6(v3, v4);
  v6((char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel__showRawEXIF, v5);
  v7 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel__videoHDRBadgeTitle;
  sub_1AA669364(0, &qword_1E981BAD8, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel____lazy_storage___videoFormatInfoProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsEXIFWidgetViewModel_metadataProcessingQueue);
}

@end