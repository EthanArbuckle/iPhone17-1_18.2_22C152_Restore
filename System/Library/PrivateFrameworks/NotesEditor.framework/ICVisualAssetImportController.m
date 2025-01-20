@interface ICVisualAssetImportController
- (BOOL)isShowing;
- (ICVisualAssetImportController)init;
- (ICVisualAssetImportController)initWithCoder:(id)a3;
- (ICVisualAssetImportController)initWithNote:(id)a3 textView:(id)a4;
- (void)addImageData:(id)a3 typeIdentifier:(id)a4;
- (void)addImageData:(id)a3 typeIdentifier:(id)a4 forceAddToPaper:(BOOL)a5;
- (void)presentVisualAssetCaptureControllerWithDisableAutorotate:(BOOL)a3;
- (void)presentVisualAssetPickerController;
- (void)setIsShowing:(BOOL)a3;
@end

@implementation ICVisualAssetImportController

- (ICVisualAssetImportController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICVisualAssetImportController_paperImageInsertionController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICVisualAssetImportController_captureController) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR___ICVisualAssetImportController_doNotAdvanceInsertionPointAfterInsertingAttachment) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICVisualAssetImportController_isShowing) = 0;

  result = (ICVisualAssetImportController *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (ICVisualAssetImportController)initWithNote:(id)a3 textView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (ICVisualAssetImportController *)sub_20C0012E8((uint64_t)v5, v6);

  return v7;
}

- (BOOL)isShowing
{
  v2 = (BOOL *)self + OBJC_IVAR___ICVisualAssetImportController_isShowing;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowing:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___ICVisualAssetImportController_isShowing;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)presentVisualAssetPickerController
{
  v2 = self;
  VisualAssetImportController.presentVisualAssetPickerController()();
}

- (void)presentVisualAssetCaptureControllerWithDisableAutorotate:(BOOL)a3
{
  v4 = self;
  VisualAssetImportController.presentVisualAssetCaptureController(disableAutorotate:)(a3);
}

- (void)addImageData:(id)a3 typeIdentifier:(id)a4
{
  uint64_t v6 = sub_20C162CF0();
  if (a4)
  {
    uint64_t v7 = sub_20C162AC0();
    a4 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v9 = self;
  v10.value._countAndFlagsBits = v7;
  v10.value._object = a4;
  VisualAssetImportController.add(_:typeIdentifier:forceAddToPaper:)((Swift::OpaquePointer)v6, v10, 0);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)addImageData:(id)a3 typeIdentifier:(id)a4 forceAddToPaper:(BOOL)a5
{
  uint64_t v8 = sub_20C162CF0();
  if (a4)
  {
    uint64_t v9 = sub_20C162AC0();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v11 = self;
  v12.value._countAndFlagsBits = v9;
  v12.value._object = a4;
  VisualAssetImportController.add(_:typeIdentifier:forceAddToPaper:)((Swift::OpaquePointer)v8, v12, a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (ICVisualAssetImportController)init
{
  result = (ICVisualAssetImportController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectUnownedDestroy();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICVisualAssetImportController_captureController);
}

@end