@interface PXPhotosUIViewController.AssociatedData
- (_TtCE12PhotosUICoreCSo24PXPhotosUIViewControllerP33_9726CDE1344AAD79E4E4DCF6A3E951E714AssociatedData)init;
@end

@implementation PXPhotosUIViewController.AssociatedData

- (_TtCE12PhotosUICoreCSo24PXPhotosUIViewControllerP33_9726CDE1344AAD79E4E4DCF6A3E951E714AssociatedData)init
{
  uint64_t v3 = OBJC_IVAR____TtCE12PhotosUICoreCSo24PXPhotosUIViewControllerP33_9726CDE1344AAD79E4E4DCF6A3E951E714AssociatedData_chromeTitleFloatingFractionAnimator;
  id v4 = objc_allocWithZone((Class)off_1E5DA74E8);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_initWithValue_, 0.0);
  v6 = (Class *)((char *)&v5->super.isa
               + OBJC_IVAR____TtCE12PhotosUICoreCSo24PXPhotosUIViewControllerP33_9726CDE1344AAD79E4E4DCF6A3E951E714AssociatedData_chromeTitleFloatingFractionAnimatorObservation);
  void *v6 = 0;
  v6[1] = 0;

  v8.receiver = v5;
  v8.super_class = (Class)_s14AssociatedDataCMa_14();
  return [(PXPhotosUIViewController.AssociatedData *)&v8 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE12PhotosUICoreCSo24PXPhotosUIViewControllerP33_9726CDE1344AAD79E4E4DCF6A3E951E714AssociatedData_chromeTitleFloatingFractionAnimator));
  swift_unknownObjectRelease();
}

@end