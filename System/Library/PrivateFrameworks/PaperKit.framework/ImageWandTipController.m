@interface ImageWandTipController
- (BOOL)tipStatusIsAvailable;
- (BOOL)tipStatusIsInvalid;
- (BOOL)tipStatusIsPending;
- (PKImageWandTipControllerDelegate)delegate;
- (_TtC8PaperKit22ImageWandTipController)init;
- (void)hideTipAnimated:(BOOL)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)showTipWithPresentationViewController:(id)a3 sourceItem:(id)a4 passthroughViews:(id)a5 permittedArrowDirections:(unint64_t)a6 tintColor:(id)a7 animated:(BOOL)a8;
- (void)userDidUseImageWand;
@end

@implementation ImageWandTipController

- (BOOL)tipStatusIsInvalid
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Tips.Status?);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8PaperKit22ImageWandTipController_lastTipStatus;
  swift_beginAccess();
  outlined init with copy of Tips.Status?((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Tips.Status();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) == 1)
  {
    outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v5, &demangling cache variable for type metadata for Tips.Status?);
    return 0;
  }
  else
  {
    BOOL v9 = (*(unsigned int (**)(char *, uint64_t))(v8 + 88))(v5, v7) == *MEMORY[0x263F1C040];
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return v9;
}

- (BOOL)tipStatusIsPending
{
  v2 = self;
  char v3 = ImageWandTipController.tipStatusIsPending.getter(MEMORY[0x263F1C048]);

  return v3 & 1;
}

- (BOOL)tipStatusIsAvailable
{
  v2 = self;
  char v3 = ImageWandTipController.tipStatusIsPending.getter(MEMORY[0x263F1C050]);

  return v3 & 1;
}

- (PKImageWandTipControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit22ImageWandTipController_delegate, a2);
  return (PKImageWandTipControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC8PaperKit22ImageWandTipController)init
{
  return (_TtC8PaperKit22ImageWandTipController *)ImageWandTipController.init()();
}

- (void)showTipWithPresentationViewController:(id)a3 sourceItem:(id)a4 passthroughViews:(id)a5 permittedArrowDirections:(unint64_t)a6 tintColor:(id)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = (uint64_t)a5;
  if (a5)
  {
    type metadata accessor for UIView();
    uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v15 = a3;
  swift_unknownObjectRetain();
  id v16 = a7;
  v17 = self;
  ImageWandTipController.showTip(withPresentationViewController:sourceItem:passthroughViews:permittedArrowDirections:tintColor:animated:)(v15, (uint64_t)a4, v11, a6, a7, v8);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)hideTipAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = _sIeyB_Ieg_TRTA_0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  BOOL v8 = self;
  ImageWandTipController.hideTip(animated:completion:)(v4, (uint64_t)v6, v7);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [NSAttributedStringKey : Any], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?((uint64_t)v6);
}

- (void)userDidUseImageWand
{
  v2 = self;
  ImageWandTipController.userDidUseImageWand()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit22ImageWandTipController_lastTipStatus, &demangling cache variable for type metadata for Tips.Status?);
  swift_unknownObjectWeakDestroy();
  char v3 = (char *)self + OBJC_IVAR____TtC8PaperKit22ImageWandTipController_delegate;
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)v3);
}

@end