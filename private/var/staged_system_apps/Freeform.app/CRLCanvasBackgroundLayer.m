@interface CRLCanvasBackgroundLayer
- (BOOL)enabled;
- (BOOL)scalesWithCanvas;
- (CGAffineTransform)dynamicTransform;
- (_TtC8Freeform24CRLCanvasBackgroundLayer)init;
- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithCanvasBackgroundDelegate:(id)a3 viewScale:(double)a4;
- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithCoder:(id)a3;
- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithLayer:(id)a3;
- (double)viewScale;
- (id)actionForKey:(id)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)layoutSublayers;
- (void)setDynamicTransform:(CGAffineTransform *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setScalesWithCanvas:(BOOL)a3;
- (void)setViewScale:(double)a3;
- (void)tearDown;
@end

@implementation CRLCanvasBackgroundLayer

- (double)viewScale
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_viewScale);
}

- (void)setViewScale:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_viewScale) = a3;
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_enabled) == 1) {
    [(CRLCanvasBackgroundLayer *)self setNeedsLayout];
  }
}

- (BOOL)enabled
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_enabled);
}

- (void)setEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_enabled) = a3;
  [(CRLCanvasBackgroundLayer *)self setNeedsLayout];
}

- (CGAffineTransform)dynamicTransform
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_dynamicTransform;
  long long v4 = *(_OWORD *)((char *)&self->c + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_dynamicTransform);
  *(_OWORD *)&retstr->a = *(_OWORD *)((char *)&self->a
                                    + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_dynamicTransform);
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v3 + 2);
  return self;
}

- (void)setDynamicTransform:(CGAffineTransform *)a3
{
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_dynamicTransform);
  long long v4 = *(_OWORD *)&a3->c;
  long long v5 = *(_OWORD *)&a3->tx;
  _OWORD *v3 = *(_OWORD *)&a3->a;
  v3[1] = v4;
  v3[2] = v5;
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_enabled) == 1
    && (*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_scalesWithCanvas) & 1) == 0)
  {
    [(CRLCanvasBackgroundLayer *)self setNeedsLayout];
  }
}

- (BOOL)scalesWithCanvas
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_scalesWithCanvas);
}

- (void)setScalesWithCanvas:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCanvasBackgroundLayer_scalesWithCanvas) = a3;
  [(CRLCanvasBackgroundLayer *)self setNeedsLayout];
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithCanvasBackgroundDelegate:(id)a3 viewScale:(double)a4
{
  swift_unknownObjectRetain();
  long long v5 = (_TtC8Freeform24CRLCanvasBackgroundLayer *)sub_100542C04(a4);
  swift_unknownObjectRelease();
  return v5;
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)init
{
  return (_TtC8Freeform24CRLCanvasBackgroundLayer *)sub_100542538();
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC8Freeform24CRLCanvasBackgroundLayer *)sub_100542664(v4);
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)initWithCoder:(id)a3
{
  return (_TtC8Freeform24CRLCanvasBackgroundLayer *)sub_100542934(a3);
}

- (void)tearDown
{
  swift_unknownObjectWeakAssign();

  [(CRLCanvasBackgroundLayer *)self setDelegate:0];
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)layoutSublayers
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CRLCanvasBackgroundLayer();
  [(CRLCanvasBackgroundLayer *)&v2 layoutSublayers];
}

- (void).cxx_destruct
{
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return 0;
}

@end