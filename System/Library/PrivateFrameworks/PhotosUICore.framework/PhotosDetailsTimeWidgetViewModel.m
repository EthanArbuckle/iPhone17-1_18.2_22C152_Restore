@interface PhotosDetailsTimeWidgetViewModel
- (void)clipBoardChangedWithPasteboardNotification:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation PhotosDetailsTimeWidgetViewModel

- (void)clipBoardChangedWithPasteboardNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A9E6C1B0(v4);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A9E6C44C(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsTimeWidgetViewModel__cloudLocalState;
  id v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F1AC70];
  sub_1A9E6BB54(0, &qword_1E981BAF8, (uint64_t (*)(uint64_t))type metadata accessor for PHAssetCloudLocalState, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsTimeWidgetViewModel__date;
  sub_1A9E6BB54(0, &qword_1E981BAC8, (uint64_t (*)(uint64_t))sub_1A9B1F51C, v4);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsTimeWidgetViewModel__timeZone;
  sub_1A9E6BB54(0, &qword_1E981BAD0, MEMORY[0x1E4F27D68], v4);
  v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
}

@end