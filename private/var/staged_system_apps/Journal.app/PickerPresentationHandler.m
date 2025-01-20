@interface PickerPresentationHandler
- (_TtC7JournalP33_5C692566AD29E277CBCA17308A33F5D425PickerPresentationHandler)init;
- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3;
@end

@implementation PickerPresentationHandler

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  swift_unownedRetainStrong();
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  sub_10007981C();

  swift_unknownObjectRelease();

  swift_release();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  swift_unownedRetainStrong();
  id v5 = a3;
  v6 = self;
  sub_100079D00();

  swift_release();
}

- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3
{
  type metadata accessor for MainActor();
  v7[2] = self;
  v7[3] = a3;
  id v5 = a3;
  v6 = self;
  sub_1002D7240((uint64_t)sub_10007B7BC, (uint64_t)v7);
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10007A70C(v4);
}

- (_TtC7JournalP33_5C692566AD29E277CBCA17308A33F5D425PickerPresentationHandler)init
{
  result = (_TtC7JournalP33_5C692566AD29E277CBCA17308A33F5D425PickerPresentationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end