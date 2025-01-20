@interface VCUIBadgedTextOverlayController_Swift
+ (id)textSegmentModelsForText:(id)a3 type:(int64_t)a4 start:(int64_t)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (BOOL)popoverShowing;
- (CGRect)focusRect;
- (CGSize)preferredContentSize;
- (NSString)text;
- (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift)initWithCoder:(id)a3;
- (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift)initWithNibName:(id)a3 bundle:(id)a4;
- (id)displayedTextSegmentModels;
- (int64_t)startIndex;
- (int64_t)type;
- (int64_t)zOrder;
- (void)setFocusRect:(CGRect)a3;
- (void)setIsOverlay:(BOOL)a3;
- (void)setPopoverShowing:(BOOL)a3;
- (void)setStartIndex:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setZOrder:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation VCUIBadgedTextOverlayController_Swift

- (void)viewDidLoad
{
  v2 = self;
  sub_261525B34();
}

- (CGSize)preferredContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_view);
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, sel_intrinsicContentSize);
    double v9 = v8;
    double v11 = v10;

    double v5 = v9 + 0.0;
    double v6 = v11 + 0.0;
  }
  else
  {
    __break(1u);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (NSString)text
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_261529310();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setText:(id)a3
{
  uint64_t v4 = sub_261529320();
  uint64_t v6 = v5;
  v7 = self;
  sub_261526270(v4, v6);
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
}

- (void)setType:(int64_t)a3
{
  uint64_t v4 = self;
  sub_2615265A8(a3);
}

- (CGRect)focusRect
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  double v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  double v5 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFocusRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_261526824(x, y, width, height);
}

- (int64_t)startIndex
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex);
}

- (void)setStartIndex:(int64_t)a3
{
  double v4 = self;
  sub_261526AA8(a3);
}

- (BOOL)popoverShowing
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing);
}

- (void)setPopoverShowing:(BOOL)a3
{
  double v4 = self;
  sub_261526CE4(a3);
}

- (int64_t)zOrder
{
  double v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  swift_beginAccess();
  return *v2;
}

- (void)setZOrder:(int64_t)a3
{
  double v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  swift_beginAccess();
  *double v4 = a3;
}

- (BOOL)isOverlay
{
  double v2 = (BOOL *)self + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay;
  swift_beginAccess();
  return *v2;
}

- (void)setIsOverlay:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay;
  swift_beginAccess();
  *double v4 = a3;
}

+ (id)textSegmentModelsForText:(id)a3 type:(int64_t)a4 start:(int64_t)a5
{
  uint64_t v7 = sub_261529320();
  uint64_t v9 = v8;
  if (a4 == 1)
  {
    uint64_t v10 = 3;
    int64_t v11 = a5;
    char v12 = 0;
  }
  else
  {
    if (a4)
    {
      id result = (id)sub_261529450();
      __break(1u);
      return result;
    }
    uint64_t v10 = 2;
    int64_t v11 = a5;
    char v12 = 1;
  }
  sub_2615221CC(v10, v11, v12, v7, v9);
  swift_bridgeObjectRelease();
  type metadata accessor for VCUIBadgedTextSegmentModel();
  v13 = (void *)sub_261529350();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)displayedTextSegmentModels
{
  double v2 = self;
  sub_261529060();
  uint64_t v3 = *(uint64_t *)((char *)&v2->super.super.super.isa
                  + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
  swift_retain();
  sub_261525670(v3);

  swift_release_n();
  swift_release();
  type metadata accessor for VCUIBadgedTextSegmentModel();
  double v4 = (void *)sub_261529350();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_261529320();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *)VCUIBadgedTextOverlayController_Swift.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift)initWithCoder:(id)a3
{
  return (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *)VCUIBadgedTextOverlayController_Swift.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController));
  swift_bridgeObjectRelease();
}

@end