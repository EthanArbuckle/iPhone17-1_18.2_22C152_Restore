@interface CRLConnectionLineKnob
+ (double)unscaledConnectionKnobOffsetWithEdgeKnob;
+ (double)unscaledConnectionKnobOffsetWithoutEdgeKnob;
- (_TtC8Freeform21CRLConnectionLineKnob)initWithImage:(id)a3 highlightedImage:(id)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7;
- (_TtC8Freeform21CRLConnectionLineKnob)initWithTag:(unint64_t)a3 onRep:(id)a4;
- (id)createKnobRenderable;
- (void)cursorEnteredKnobAtPoint:(CGPoint)a3 withPlatformObject:(id)a4;
- (void)cursorExitedKnobAtPoint:(CGPoint)a3 withPlatformObject:(id)a4;
- (void)dealloc;
- (void)didCreateKnobRenderable;
- (void)updateRenderableImage;
@end

@implementation CRLConnectionLineKnob

+ (double)unscaledConnectionKnobOffsetWithEdgeKnob
{
  return 25.0;
}

+ (double)unscaledConnectionKnobOffsetWithoutEdgeKnob
{
  return 19.0;
}

- (_TtC8Freeform21CRLConnectionLineKnob)initWithTag:(unint64_t)a3 onRep:(id)a4
{
  return (_TtC8Freeform21CRLConnectionLineKnob *)sub_100BCD148(a3, a4);
}

- (void)dealloc
{
  v2 = self;
  sub_100BCD4D8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLConnectionLineKnob_animatedLayer));
}

- (void)updateRenderableImage
{
  v2 = self;
  sub_100BCD798();
}

- (id)createKnobRenderable
{
  v3 = self;
  v4 = self;
  id v5 = [v3 renderable];
  id v6 = [(CRLCanvasButtonKnob *)v4 knobImage];
  if (v6)
  {
    v7 = v6;
    [v6 size];
  }
  [v5 setBounds:sub_100064070()];

  return v5;
}

- (void)didCreateKnobRenderable
{
  v2 = self;
  sub_100BCD95C();
}

- (void)cursorEnteredKnobAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  sub_100BCDA70((uint64_t)a4, x, y);
}

- (void)cursorExitedKnobAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  sub_100BCDBF0((uint64_t)a4, x, y);
}

- (_TtC8Freeform21CRLConnectionLineKnob)initWithImage:(id)a3 highlightedImage:(id)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a7;
  result = (_TtC8Freeform21CRLConnectionLineKnob *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end