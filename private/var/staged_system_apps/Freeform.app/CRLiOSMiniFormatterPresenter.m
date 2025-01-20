@interface CRLiOSMiniFormatterPresenter
- (BOOL)isPinnedToTopOfRep;
- (BOOL)isPresentingInFixedPosition;
- (BOOL)isPresentingMiniFormatter;
- (BOOL)isPresentingSecondLayerPopover;
- (_TtC8Freeform28CRLiOSMiniFormatterPresenter)initWithEditorController:(id)a3 canvasLayerHosting:(id)a4;
- (id)crlaxMiniFormatterViewController;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)dismissMiniFormatter;
- (void)dismissMiniFormatterForRep:(id)a3;
- (void)dismissMiniFormatterWithAnimated:(BOOL)a3;
- (void)dismissPresentedMenus;
- (void)dismissSecondLayerPopover;
- (void)forceMiniFormatterVCToReposition;
- (void)handleSingleTapOnRep:(id)a3 withSelectionPath:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentMiniFormatterForSelectionPath:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)updateMiniFormatter;
@end

@implementation CRLiOSMiniFormatterPresenter

- (_TtC8Freeform28CRLiOSMiniFormatterPresenter)initWithEditorController:(id)a3 canvasLayerHosting:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC8Freeform28CRLiOSMiniFormatterPresenter *)sub_10065CADC(v5, a4);
}

- (id)crlaxMiniFormatterViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_miniFormatterVC));
}

- (BOOL)isPresentingInFixedPosition
{
  v2 = self;
  char v3 = sub_10065CCF4();

  return v3 & 1;
}

- (void)handleSingleTapOnRep:(id)a3 withSelectionPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10065CD94(v6, v7);
}

- (void)presentMiniFormatterForSelectionPath:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10065D27C(v4, 1);
}

- (void)dismissMiniFormatter
{
  v2 = self;
  sub_10065DFD8(1, 1, 0);
}

- (void)dismissMiniFormatterWithAnimated:(BOOL)a3
{
  id v4 = self;
  sub_10065DFD8(1, a3, 0);
}

- (void)dismissMiniFormatterForRep:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_repsForCurrentSelectionPath);
  if (v3)
  {
    id v4 = self;
    id v5 = a3;
    id v6 = v4;
    swift_bridgeObjectRetain();
    LOBYTE(v4) = sub_1006E61EC(v5, v3);
    swift_bridgeObjectRelease();
    if (v4) {
      sub_10065DFD8(1, 1, 0);
    }
  }
}

- (void)dismissPresentedMenus
{
  v2 = self;
  sub_10065E4CC();
}

- (void)updateMiniFormatter
{
  v2 = self;
  sub_10065ED80();
}

- (BOOL)isPresentingMiniFormatter
{
  return *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_miniFormatterVC) != 0;
}

- (BOOL)isPresentingSecondLayerPopover
{
  v2 = self;
  BOOL v3 = sub_10065EEC0();

  return v3;
}

- (BOOL)isPinnedToTopOfRep
{
  v2 = self;
  char v3 = sub_10065EF98();

  return v3 & 1;
}

- (void)forceMiniFormatterVCToReposition
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_miniFormatterVC);
  if (v2)
  {
    char v3 = self;
    id v4 = v2;
    sub_100935E98();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_canvasViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_miniFormatterVC));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_ellipsisBuilder));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_ellipsisBaseButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_presentedNavigationController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_presentedAuxiliaryViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_auxiliaryPresentedBuilder));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_presentedWrappedNavigationController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_selectionPath));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_secondLayerPresentedBuilder);
}

- (void)dismissSecondLayerPopover
{
  v2 = self;
  sub_100664274();
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_100669284(v7, v8);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  int64_t v9 = sub_100666494(v6, v7);

  return v9;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1006665DC(v4);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform28CRLMiniFormatterStateManager_canvasLayerHosting);
  id v5 = a3;
  id v6 = self;
  id v7 = [v4 interactiveCanvasController];
  [v7 unobscuredFrameDidChange];
}

@end