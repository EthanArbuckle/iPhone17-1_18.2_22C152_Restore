@interface PointRender
- (SCNVector3)position;
- (_TtC7Measure11PointRender)init;
- (_TtC7Measure11PointRender)initWithCoder:(id)a3;
- (void)setPosition:(SCNVector3)a3;
@end

@implementation PointRender

- (SCNVector3)position
{
  [*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11PointRender_point) position];
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11PointRender_point);
  v13 = self;
  *(float *)&double v7 = x;
  *(float *)&double v8 = y;
  *(float *)&double v9 = z;
  [v6 setWorldPosition:v7, v8, v9];
  *(float *)&double v10 = x;
  *(float *)&double v11 = y;
  *(float *)&double v12 = z;
  [*(id *)((char *)&v13->super.super.isa + OBJC_IVAR____TtC7Measure11PointRender_pointPrime) setWorldPosition:v10, v11, v12];
}

- (_TtC7Measure11PointRender)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC7Measure11PointRender *)sub_100157E60();
}

- (_TtC7Measure11PointRender)init
{
  SCNVector3 result = (_TtC7Measure11PointRender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure11PointRender____lazy_storage___pointMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure11PointRender____lazy_storage___pointPrimeMaterial));

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end