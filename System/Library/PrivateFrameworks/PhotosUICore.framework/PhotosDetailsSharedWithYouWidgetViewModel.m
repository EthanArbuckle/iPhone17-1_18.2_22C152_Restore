@interface PhotosDetailsSharedWithYouWidgetViewModel
- (void)syndicationAttributionInfoDidChange:(id)a3;
@end

@implementation PhotosDetailsSharedWithYouWidgetViewModel

- (void)syndicationAttributionInfoDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA116D90(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel_attributionInfo));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel_appAttributionModel));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__syndicationContactName;
  sub_1AA1165B8(0, &qword_1E981BAD8, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__syndicationContactImage;
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F1AC70];
  sub_1AA117A74(0, (unint64_t *)&unk_1E981BB10, (uint64_t (*)(uint64_t))sub_1AA098F78, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  v8 = (char *)self
     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__syndicationSharedInAttributedTitle;
  sub_1AA117A74(0, &qword_1E981BAC0, (uint64_t (*)(uint64_t))sub_1AA0B1F00, v6);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self
      + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__syndicationAttributionInfoIsLoading;
  sub_1A9CD8BF0(0, (unint64_t *)&unk_1E981BAE0, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC70]);
  uint64_t v12 = v11;
  v13 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  v13(v10, v11);
  v13((char *)self+ OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedWithYouWidgetViewModel__hasSyndicationAttributionInfo, v12);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end