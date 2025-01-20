@interface PUPhotoStyleToolController
- (BOOL)shouldObserveGenericFocusingViewForInteractionDelay;
- (BOOL)shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable;
- (BOOL)supportsGesturesOfType:(unint64_t)a3;
- (BOOL)wantsFullscreen;
- (BOOL)wantsScrubberKeyControl;
- (BOOL)wantsShadowViews;
- (BOOL)wantsTapToToggleOriginalEnabled;
- (BOOL)wantsZoomAndPanEnabled;
- (NSString)localizedName;
- (NSString)selectedToolbarIconGlyphName;
- (NSString)toolbarIconAccessibilityLabel;
- (NSString)toolbarIconGlyphName;
- (UIView)centerToolbarView;
- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)init;
- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)disabledToolAlertTitle;
- (int64_t)toolControllerTag;
- (int64_t)wheelScrubberView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)wheelScrubberViewNumberOfSections:(id)a3;
- (void)castIntensityInteractionDidBegin;
- (void)castIntensityInteractionDidEnd;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)decreaseScrubberValue:(BOOL)a3;
- (void)didResignActiveTool;
- (void)handleCastIntensitySliderValueChangedTo:(double)a3;
- (void)handlePadDismissalWithGestureRecognizer:(id)a3;
- (void)handlePadValueChangedWithSlider:(id)a3;
- (void)handleToggleOriginalWithGestureRecognizer:(id)a3;
- (void)increaseScrubberValue:(BOOL)a3;
- (void)loadView;
- (void)mediaView:(id)a3 didZoom:(double)a4;
- (void)mediaViewIsReady;
- (void)ppt_selectWithStyle:(id)a3;
- (void)previewingOriginalDidStart;
- (void)previewingOriginalDidStop;
- (void)reactivate;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wheelScrubberView:(id)a3 didTapOnSelectedCellWithFrame:(CGRect)a4;
- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(int64_t)a5;
- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3;
- (void)wheelScrubberViewDidEndDragging:(id)a3;
- (void)wheelScrubberViewDidEndScrolling:(id)a3;
- (void)wheelScrubberViewWillBeginDragging:(id)a3;
- (void)wheelScrubberViewWillBeginScrolling:(id)a3;
- (void)willBecomeActiveTool;
- (void)willBecomeEnabled;
- (void)willResignActiveTool;
@end

@implementation PUPhotoStyleToolController

- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)init
{
  return (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)sub_1AEB2D6A4();
}

- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEB2DA1C();
}

- (void)loadView
{
  v2 = self;
  sub_1AEB2DD88();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AEB2DEC0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AEB2EC08(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1AEB2ECD8(a4, width, height);

  swift_unknownObjectRelease();
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AEB2EEBC();

  swift_unknownObjectRelease();
}

- (void)updateViewConstraints
{
  v2 = self;
  sub_1AEB2EFF8();
}

- (void)handlePadValueChangedWithSlider:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB337DC();
}

- (void)handleCastIntensitySliderValueChangedTo:(double)a3
{
  id v3 = self;
  sub_1AEB33C14();
}

- (void)castIntensityInteractionDidBegin
{
  v2 = self;
  sub_1AEB33FD4();
}

- (void)castIntensityInteractionDidEnd
{
  v2 = self;
  sub_1AEB34060();
}

- (void)handlePadDismissalWithGestureRecognizer:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_1AEB35BF0(v5);
}

- (void)handleToggleOriginalWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEB35CBC(v4);
}

- (_TtC15PhotosUIPrivate26PUPhotoStyleToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AEF96DE0();
  }
  id v5 = a4;
  sub_1AEB36A78();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_thumbnailsBaseCompositionController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_toolTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_styleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_styleSectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_scrubberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_controlView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_dPad));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_expandedPadPulsingTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_overlayPadPulsingTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_impactGenerator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_staticDottedGridImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_castIntensitySlider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_labelsView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_styleLabelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_styleLabelHeightConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_padDismissalMediaViewGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_padDismissalToolViewGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_swipeDownGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_toggleOriginalCustomGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_padRevealAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_padDismissAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_styleSectionLabelVisibilityTimer));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate26PUPhotoStyleToolController_labelValueFormatter);
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  swift_unknownObjectRetain();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_1AEB36D64((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease();
}

- (NSString)localizedName
{
  return (NSString *)sub_1AEB37110(self);
}

- (UIView)centerToolbarView
{
  v2 = sub_1AEB36EFC();
  return (UIView *)v2;
}

- (NSString)toolbarIconGlyphName
{
  return (NSString *)sub_1AEB36FF0(self, (uint64_t)a2, (void (*)(void))sub_1AEB36F44);
}

- (NSString)selectedToolbarIconGlyphName
{
  return (NSString *)sub_1AEB36FF0(self, (uint64_t)a2, (void (*)(void))sub_1AEB37060);
}

- (NSString)toolbarIconAccessibilityLabel
{
  return (NSString *)sub_1AEB37110(self);
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (BOOL)wantsShadowViews
{
  return 1;
}

- (BOOL)wantsFullscreen
{
  return 1;
}

- (BOOL)wantsScrubberKeyControl
{
  return 1;
}

- (void)increaseScrubberValue:(BOOL)a3
{
  id v3 = self;
  sub_1AEB37210();
}

- (void)decreaseScrubberValue:(BOOL)a3
{
  id v3 = self;
  sub_1AEB37320();
}

- (void)willBecomeActiveTool
{
  v2 = self;
  sub_1AEB37410();
}

- (void)willResignActiveTool
{
  v2 = self;
  sub_1AEB37548();
}

- (void)didResignActiveTool
{
  v2 = self;
  sub_1AEB37620();
}

- (void)willBecomeEnabled
{
  v2 = self;
  sub_1AEB376B8();
}

- (BOOL)supportsGesturesOfType:(unint64_t)a3
{
  return sub_1AEB37768(a3) & 1;
}

- (BOOL)wantsTapToToggleOriginalEnabled
{
  return sub_1AEB377F4();
}

- (int64_t)toolControllerTag
{
  return 1007;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  if (a3) {
    sub_1AEF97130();
  }
  id v4 = self;
  sub_1AEB37808();

  swift_bridgeObjectRelease();
}

- (id)disabledToolAlertTitle
{
  v2 = self;
  sub_1AEB37BE0();

  id v3 = (void *)sub_1AEF96DA0();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)mediaViewIsReady
{
  v2 = self;
  sub_1AEB37CBC();
}

- (void)mediaView:(id)a3 didZoom:(double)a4
{
  id v5 = a3;
  v6 = self;
  sub_1AEB37D08();
}

- (BOOL)shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable
{
  return sub_1AEB37DC8();
}

- (BOOL)shouldObserveGenericFocusingViewForInteractionDelay
{
  return sub_1AEB37DC8();
}

- (void)previewingOriginalDidStart
{
  v2 = self;
  sub_1AEB37DFC();
}

- (void)previewingOriginalDidStop
{
  v2 = self;
  sub_1AEB37E9C();
}

- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1AEB37F24();
}

- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEB389B8();
}

- (void)wheelScrubberView:(id)a3 didTapOnSelectedCellWithFrame:(CGRect)a4
{
  id v5 = a3;
  v6 = self;
  sub_1AEB38E18();
}

- (void)wheelScrubberViewWillBeginScrolling:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEB38F48();
}

- (void)wheelScrubberViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEB3905C();
}

- (void)wheelScrubberViewDidEndScrolling:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEB390E0();
}

- (void)wheelScrubberViewDidEndDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEB3920C();
}

- (int64_t)wheelScrubberViewNumberOfSections:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = sub_1AEB3928C();

  return v6;
}

- (int64_t)wheelScrubberView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  int64_t v8 = sub_1AEB39304((uint64_t)v7, a4);

  return v8;
}

- (void)reactivate
{
  v2 = self;
  sub_1AEB394A0();
}

- (void)ppt_selectWithStyle:(id)a3
{
  sub_1AEF96DE0();
  id v4 = self;
  sub_1AEB39570();

  swift_bridgeObjectRelease();
}

@end