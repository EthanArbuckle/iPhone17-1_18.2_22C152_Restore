@interface PhotosDetailsAssetDescriptionWidgetViewModel
@end

@implementation PhotosDetailsAssetDescriptionWidgetViewModel

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC12PhotosUICore44PhotosDetailsAssetDescriptionWidgetViewModel_loadingState);
  unint64_t v4 = *(void *)&self->super.maxContentSizeCategory[OBJC_IVAR____TtC12PhotosUICore44PhotosDetailsAssetDescriptionWidgetViewModel_loadingState];
  sub_1AA594644(v3, v4);
}

@end