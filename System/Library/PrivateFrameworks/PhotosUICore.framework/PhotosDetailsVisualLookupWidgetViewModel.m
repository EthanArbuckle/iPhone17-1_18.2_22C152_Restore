@interface PhotosDetailsVisualLookupWidgetViewModel
@end

@implementation PhotosDetailsVisualLookupWidgetViewModel

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore40PhotosDetailsVisualLookupWidgetViewModel__visualLookupData;
  sub_1A9AF3A94(0, (unint64_t *)&unk_1E981BB00, (uint64_t (*)(uint64_t))sub_1AA0BB250, MEMORY[0x1E4F1AC70]);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end