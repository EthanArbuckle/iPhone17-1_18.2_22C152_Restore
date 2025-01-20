@interface TextDrawing.View
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtCV16MusicApplication11TextDrawing4View)initWithCoder:(id)a3;
- (_TtCV16MusicApplication11TextDrawing4View)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation TextDrawing.View

- (_TtCV16MusicApplication11TextDrawing4View)initWithFrame:(CGRect)a3
{
  return (_TtCV16MusicApplication11TextDrawing4View *)TextDrawing.View.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV16MusicApplication11TextDrawing4View)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtCV16MusicApplication11TextDrawing4View_isDisabled) = 0;
  v5 = (char *)self + OBJC_IVAR____TtCV16MusicApplication11TextDrawing4View__textDrawingContext;
  sub_15C98(v8);
  sub_15CB0((uint64_t)v8, (uint64_t)v5);
  id v6 = a3;

  result = (_TtCV16MusicApplication11TextDrawing4View *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  _s16MusicApplication11TextDrawingV4ViewC4drawyySo6CGRectVF_0();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  id v8 = a3;
  v9 = self;
  NSString v10 = sub_AB64D0();
  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for TextDrawing.View();
  unsigned int v11 = [(TextDrawing.View *)&v14 _shouldAnimatePropertyWithKey:v10];

  if (v11 || v5 == 0x73746E65746E6F63 && v7 == 0xE800000000000000)
  {

    swift_bridgeObjectRelease();
    char v12 = 1;
  }
  else
  {
    char v12 = sub_AB8640();

    swift_bridgeObjectRelease();
  }

  return v12 & 1;
}

- (void).cxx_destruct
{
  sub_15CB0((uint64_t)self + OBJC_IVAR____TtCV16MusicApplication11TextDrawing4View__textDrawingContext, (uint64_t)v2);
  sub_13A374(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_13A3D8);
}

@end