@interface PXPhotosContentController.AssociatedData
- (_TtCE12PhotosUICoreCSo25PXPhotosContentControllerP33_35ACB59D2E0D0E7A3B94D0CE2AAA66C214AssociatedData)init;
@end

@implementation PXPhotosContentController.AssociatedData

- (_TtCE12PhotosUICoreCSo25PXPhotosContentControllerP33_35ACB59D2E0D0E7A3B94D0CE2AAA66C214AssociatedData)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCE12PhotosUICoreCSo25PXPhotosContentControllerP33_35ACB59D2E0D0E7A3B94D0CE2AAA66C214AssociatedData_bannerController);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCE12PhotosUICoreCSo25PXPhotosContentControllerP33_35ACB59D2E0D0E7A3B94D0CE2AAA66C214AssociatedData_bannerLoadTask) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCE12PhotosUICoreCSo25PXPhotosContentControllerP33_35ACB59D2E0D0E7A3B94D0CE2AAA66C214AssociatedData_curationModel) = 0;
  v4.receiver = self;
  v4.super_class = (Class)_s14AssociatedDataCMa();
  return [(PXPhotosContentController.AssociatedData *)&v4 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

@end