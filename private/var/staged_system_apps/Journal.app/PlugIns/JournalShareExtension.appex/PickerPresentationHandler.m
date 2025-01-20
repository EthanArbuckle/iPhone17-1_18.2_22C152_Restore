@interface PickerPresentationHandler
- (_TtC21JournalShareExtensionP33_4FAB2E477D4C03A91C1E70C69F90D90625PickerPresentationHandler)init;
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
  sub_1000D30EC();

  swift_unknownObjectRelease();

  swift_release();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  swift_unownedRetainStrong();
  id v5 = a3;
  v6 = self;
  sub_1000D3630();

  swift_release();
}

- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3
{
  sub_10010A060();
  v7[2] = self;
  v7[3] = a3;
  id v5 = a3;
  v6 = self;
  sub_1000D3FA8((uint64_t)sub_1000D4568, (uint64_t)v7);
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000D41C8(v4);
}

- (_TtC21JournalShareExtensionP33_4FAB2E477D4C03A91C1E70C69F90D90625PickerPresentationHandler)init
{
  result = (_TtC21JournalShareExtensionP33_4FAB2E477D4C03A91C1E70C69F90D90625PickerPresentationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end