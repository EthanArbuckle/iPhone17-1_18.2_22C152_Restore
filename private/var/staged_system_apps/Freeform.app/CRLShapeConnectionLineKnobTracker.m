@interface CRLShapeConnectionLineKnobTracker
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldHideOtherKnobs;
- (BOOL)shouldHideSelectionHighlight;
- (BOOL)snapEnabled;
- (_TtC8Freeform33CRLShapeConnectionLineKnobTracker)init;
- (_TtC8Freeform33CRLShapeConnectionLineKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (void)beginMovingKnob;
- (void)crlaxAccessibilityRequestsConnectionTo:(CGPoint)a3;
- (void)crlaxAccessibilityRequestsDuplicateItemInsertFromKnobAt:(CGPoint)a3;
- (void)endMovingKnob;
- (void)insertDuplicationPreviewInfosWithSender:(id)a3;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
- (void)setSnapEnabled:(BOOL)a3;
@end

@implementation CRLShapeConnectionLineKnobTracker

- (BOOL)snapEnabled
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_connectionLineKnobTracker))
    return [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_connectionLineKnobTracker) snapEnabled];
  else {
    return *((unsigned char *)&self->super.super.super.isa
  }
           + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker__snapEnabled);
}

- (void)setSnapEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_connectionLineKnobTracker);
  v5 = self;
  [v4 setSnapEnabled:v3];
  *((unsigned char *)&v5->super.super.super.isa + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker__snapEnabled) = v3;
}

- (void)beginMovingKnob
{
  v2 = self;
  sub_10092B7A0();
}

- (void)insertDuplicationPreviewInfosWithSender:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_10092D7DC();

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)shouldHideOtherKnobs
{
  return 1;
}

- (BOOL)shouldHideSelectionHighlight
{
  return 1;
}

- (void)endMovingKnob
{
  v2 = self;
  sub_1009313F8();
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  sub_100931FE8(x, y);
}

- (void)crlaxAccessibilityRequestsDuplicateItemInsertFromKnobAt:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  sub_10093389C(x, y);
}

- (void)crlaxAccessibilityRequestsConnectionTo:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  [(CRLShapeConnectionLineKnobTracker *)v5 beginMovingKnob];
  -[CRLShapeConnectionLineKnobTracker moveKnobToCanvasPosition:](v5, "moveKnobToCanvasPosition:", x, y);
  [(CRLShapeConnectionLineKnobTracker *)v5 endMovingKnob];
}

- (_TtC8Freeform33CRLShapeConnectionLineKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_TtC8Freeform33CRLShapeConnectionLineKnobTracker *)sub_10093417C((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (_TtC8Freeform33CRLShapeConnectionLineKnobTracker)init
{
  return (_TtC8Freeform33CRLShapeConnectionLineKnobTracker *)sub_100933AA8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_connectionLineKnobTracker));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLShapeConnectionLineKnobTracker_duplicatedConnectionLine);
}

@end