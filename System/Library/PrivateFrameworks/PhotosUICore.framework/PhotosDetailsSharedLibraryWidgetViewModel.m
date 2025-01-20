@interface PhotosDetailsSharedLibraryWidgetViewModel
@end

@implementation PhotosDetailsSharedLibraryWidgetViewModel

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedLibraryWidgetViewModel_sharedLibraryAssetStatusProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSharedLibraryWidgetViewModel_sharedLibraryStatusProvider));
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end