@interface CalculateScrubberController
- (_TtC8PaperKit27CalculateScrubberController)init;
- (id)activeScrubberView;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)hideScrubber;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)sendValueChanged;
- (void)showScrubberFor:(id)a3 frame:(CGRect)a4 compact:(BOOL)a5;
@end

@implementation CalculateScrubberController

- (void)showScrubberFor:(id)a3 frame:(CGRect)a4 compact:(BOOL)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  v14 = self;
  v15._countAndFlagsBits = v11;
  v15._object = v13;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CalculateScrubberController.showScrubber(for:frame:compact:)(v15, v17, a5);

  swift_bridgeObjectRelease();
}

- (void)hideScrubber
{
  v2 = self;
  CalculateScrubberController.hideScrubber()();
}

- (id)activeScrubberView
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit27CalculateScrubberController_viewController);
  if (v2) {
    id v2 = objc_msgSend(v2, sel_view);
  }
  return v2;
}

- (void)sendValueChanged
{
  id v2 = self;
  CalculateScrubberController.sendValueChanged()();
}

- (_TtC8PaperKit27CalculateScrubberController)init
{
  result = (_TtC8PaperKit27CalculateScrubberController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit27CalculateScrubberController_delegate;
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)v3);
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  v5 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit27CalculateScrubberController_delegate, a2);
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_scrubberControllerDidDismiss_))
    {
      id v7 = a3;
      v8 = self;
      objc_msgSend(v6, sel_scrubberControllerDidDismiss_, v8);
    }
    swift_unknownObjectRelease();
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end