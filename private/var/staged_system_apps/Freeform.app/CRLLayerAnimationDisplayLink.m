@interface CRLLayerAnimationDisplayLink
+ (_TtC8Freeform28CRLLayerAnimationDisplayLink)shared;
- (BOOL)isRunning;
- (_TtC8Freeform28CRLLayerAnimationDisplayLink)init;
- (void)dealloc;
- (void)endDisplayLink;
- (void)startDisplayLink;
@end

@implementation CRLLayerAnimationDisplayLink

+ (_TtC8Freeform28CRLLayerAnimationDisplayLink)shared
{
  if (qword_101670210 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10171CC58;

  return (_TtC8Freeform28CRLLayerAnimationDisplayLink *)v2;
}

- (BOOL)isRunning
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLLayerAnimationDisplayLink_displayLink);
  if (v2) {
    LOBYTE(v2) = [v2 paused] ^ 1;
  }
  return (char)v2;
}

- (void)startDisplayLink
{
  v2 = self;
  sub_100F81488();
}

- (void)endDisplayLink
{
  v2 = self;
  sub_100F817E8();
}

- (void)dealloc
{
  v2 = self;
  sub_100F817E8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CRLLayerAnimationDisplayLink();
  [(CRLLayerAnimationDisplayLink *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1005174AC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform28CRLLayerAnimationDisplayLink_completionHandler));

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform28CRLLayerAnimationDisplayLink)init
{
  return (_TtC8Freeform28CRLLayerAnimationDisplayLink *)sub_100F82A64();
}

@end