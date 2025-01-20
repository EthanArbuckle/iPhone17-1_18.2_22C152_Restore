@interface StrokeLayer
- (_TtC16ScreenSharingKit11StrokeLayer)init;
- (_TtC16ScreenSharingKit11StrokeLayer)initWithCoder:(id)a3;
- (_TtC16ScreenSharingKit11StrokeLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation StrokeLayer

- (void)layoutSublayers
{
  v2 = self;
  sub_25BC00748();
}

- (_TtC16ScreenSharingKit11StrokeLayer)init
{
  return (_TtC16ScreenSharingKit11StrokeLayer *)sub_25BC01898();
}

- (_TtC16ScreenSharingKit11StrokeLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_25BC08D08();
  swift_unknownObjectRelease();
  return (_TtC16ScreenSharingKit11StrokeLayer *)sub_25BC01940(v4);
}

- (_TtC16ScreenSharingKit11StrokeLayer)initWithCoder:(id)a3
{
  return (_TtC16ScreenSharingKit11StrokeLayer *)sub_25BC01A5C(a3);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16ScreenSharingKit11StrokeLayer_normalizedPath);
}

@end