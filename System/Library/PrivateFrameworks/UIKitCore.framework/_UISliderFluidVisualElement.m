@interface _UISliderFluidVisualElement
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)cancelMouseTracking;
- (BOOL)cancelTouchTracking;
- (BOOL)changeWithVolumeButtons;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)driver:(id)a3 shouldAdjustValueForProposedValue:(double)a4 adjustedValue:(double *)a5 startValue:(double *)a6 endValue:(double *)a7;
- (BOOL)driver:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAnimatingValueChange;
- (BOOL)overriddenTrackingState;
- (CGRect)bounds;
- (CGRect)frame;
- (CGRect)maximumValueImageRectForBounds:(CGRect)a3;
- (CGRect)minimumValueImageRectForBounds:(CGRect)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGRect)valueTextRectForBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)result;
- (UIEdgeInsets)thumbHitEdgeInsets;
- (UISlider)slider;
- (UISliderDataModel)data;
- (_UISliderFluidVisualElement)initWithCoder:(id)a3;
- (_UISliderFluidVisualElement)initWithFrame:(CGRect)a3;
- (id)createThumbView;
- (id)currentMaximumTrackImage;
- (id)currentMinimumTrackImage;
- (id)currentThumbImage;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)maxTrackView;
- (id)maxValueImageView;
- (id)minTrackView;
- (id)minValueImageView;
- (id)thumbView;
- (id)thumbViewNeue;
- (unint64_t)fluidUpdateSource;
- (void)didChangeMinimumTrackVisibleWithDuration:(double)a3;
- (void)didPerformLayout;
- (void)didSetEnabled;
- (void)didSetFluidTrackHidden;
- (void)didSetMaximumValueImage;
- (void)didSetSpeedMultiplier;
- (void)didSetValues;
- (void)didUpdateConfiguration;
- (void)didUpdateTraitCollection;
- (void)handleExpansionGesture:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setChangeWithVolumeButtons:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setFluidUpdateSource:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSlider:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
@end

@implementation _UISliderFluidVisualElement

- (UISlider)slider
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UISliderFluidVisualElement_slider, a2);
  return (UISlider *)v2;
}

- (void)setSlider:(id)a3
{
  uint64_t v5 = swift_unknownObjectWeakAssign();
  uint64_t v6 = MEMORY[0x18C109380](v5);
  if (v6)
  {
    id v9 = (id)v6;
    id v7 = a3;
    v8 = self;
    sub_18590EC88(v9);
  }
}

- (UISliderDataModel)data
{
  return (UISliderDataModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____UISliderFluidVisualElement_data));
}

- (void)setData:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_data);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_data) = (Class)a3;
  id v6 = a3;
  uint64_t v5 = self;

  sub_185910A74();
  sub_1859118C0();
}

- (BOOL)changeWithVolumeButtons
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_changeWithVolumeButtons);
}

- (void)setChangeWithVolumeButtons:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_changeWithVolumeButtons) = a3;
  uint64_t v4 = MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UISliderFluidVisualElement_slider, a2);
  if (v4)
  {
    id v6 = (id)v4;
    uint64_t v5 = self;
    sub_18590EC88(v6);
    sub_185910494(0);
  }
}

- (unint64_t)fluidUpdateSource
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____UISliderFluidVisualElement_fluidUpdateSource);
}

- (void)setFluidUpdateSource:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_fluidUpdateSource) = (Class)a3;
}

- (_UISliderFluidVisualElement)initWithFrame:(CGRect)a3
{
  return (_UISliderFluidVisualElement *)sub_18590E2A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UISliderFluidVisualElement)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185913C04();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 20.0;
  result.height = v3;
  return result;
}

- (CGRect)frame
{
  sub_18590EB9C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_18590EB9C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void)handleExpansionGesture:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_18590F8BC(v4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  id v9 = self;
  id v10 = sub_1859119C0((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____UISliderFluidVisualElement_minimumTrackEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____UISliderFluidVisualElement_maximumTrackEffectView));

  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_expansionGesture);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v5 = MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UISliderFluidVisualElement_slider, a2);
  id v6 = a3;
  id v7 = self;
  objc_msgSend(v6, sel_locationInView_, v5);
  CGFloat v9 = v8;
  double v11 = v10;

  LOBYTE(v5) = sub_185911C60(v9, v11);
  return v5 & 1;
}

- (BOOL)driver:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  swift_unknownObjectRetain();
  id v7 = self;
  BOOL v8 = sub_185911C60(x, y);
  swift_unknownObjectRelease();

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)driver:(id)a3 shouldAdjustValueForProposedValue:(double)a4 adjustedValue:(double *)a5 startValue:(double *)a6 endValue:(double *)a7
{
  swift_unknownObjectRetain();
  v12 = self;
  LOBYTE(a7) = sub_185913DD8(a5, a6, a7, a4);
  swift_unknownObjectRelease();

  return a7 & 1;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  id v6 = self;
  sub_185911FE0(a4, a3);
}

- (void)didSetValues
{
  double v2 = self;
  sub_18591212C();
}

- (BOOL)isAnimatingValueChange
{
  return 0;
}

- (void)didPerformLayout
{
  double v2 = self;
  sub_185910494(0);
}

- (void)didUpdateTraitCollection
{
  double v2 = self;
  sub_185910A74();
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = self;
  double v8 = sub_1859123E4(x, y, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = 7.0;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)didUpdateConfiguration
{
  double v2 = self;
  sub_185912660();
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  double v3 = sub_185912D70(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_185912AA8);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  double v3 = sub_185912D70(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_185912C0C);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)didSetMaximumValueImage
{
  double v2 = self;
  sub_1859113EC();
}

- (id)minValueImageView
{
  return sub_185912E54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____UISliderFluidVisualElement_minimumView);
}

- (id)maxValueImageView
{
  return sub_185912E54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____UISliderFluidVisualElement_maximumView);
}

- (void)didChangeMinimumTrackVisibleWithDuration:(double)a3
{
  double v4 = self;
  sub_185912EBC(a3);
}

- (id)minTrackView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____UISliderFluidVisualElement_minimumTrackView));
}

- (id)maxTrackView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____UISliderFluidVisualElement_maximumTrackView));
}

- (void)didSetEnabled
{
  double v2 = self;
  sub_1859118C0();
}

- (void)didSetFluidTrackHidden
{
  double v2 = self;
  sub_1859132C8();
}

- (void)didSetSpeedMultiplier
{
  double v2 = self;
  sub_18591339C();
}

- (CGRect)valueTextRectForBounds:(CGRect)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)currentMinimumTrackImage
{
  return 0;
}

- (id)currentMaximumTrackImage
{
  return 0;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (UIEdgeInsets)thumbHitEdgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)currentThumbImage
{
  return 0;
}

- (id)createThumbView
{
  return 0;
}

- (id)thumbView
{
  return 0;
}

- (id)thumbViewNeue
{
  return 0;
}

- (BOOL)overriddenTrackingState
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____UISliderFluidVisualElement_isInteractivelyChanging);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)cancelMouseTracking
{
  return 0;
}

- (BOOL)cancelTouchTracking
{
  return 0;
}

@end