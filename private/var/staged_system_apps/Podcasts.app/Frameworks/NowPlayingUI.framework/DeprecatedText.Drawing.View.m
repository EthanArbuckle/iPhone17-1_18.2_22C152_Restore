@interface DeprecatedText.Drawing.View
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View)initWithCoder:(id)a3;
- (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation DeprecatedText.Drawing.View

- (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View)initWithFrame:(CGRect)a3
{
  return (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View *)sub_10C130(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtCVV12NowPlayingUI14DeprecatedText7Drawing4View_isDisabled) = 0;
  v5 = (char *)self + OBJC_IVAR____TtCVV12NowPlayingUI14DeprecatedText7Drawing4View__textDrawingContext;
  sub_56F84(v8);
  sub_56F9C((uint64_t)v8, (uint64_t)v5);
  id v6 = a3;

  result = (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View *)sub_12A480();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  sub_10CE40();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4 = sub_1299F0();
  uint64_t v6 = v5;
  v7 = self;
  NSString v8 = sub_1299B0();
  v12.receiver = v7;
  v12.super_class = (Class)_s4ViewCMa();
  unsigned int v9 = [(DeprecatedText.Drawing.View *)&v12 _shouldAnimatePropertyWithKey:v8];

  if (v9 || v4 == 0x73746E65746E6F63 && v6 == 0xE800000000000000)
  {

    swift_bridgeObjectRelease();
    char v10 = 1;
  }
  else
  {
    char v10 = sub_12A5D0();

    swift_bridgeObjectRelease();
  }
  return v10 & 1;
}

- (void).cxx_destruct
{
  sub_56F9C((uint64_t)self + OBJC_IVAR____TtCVV12NowPlayingUI14DeprecatedText7Drawing4View__textDrawingContext, (uint64_t)v2);
  sub_84400(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_57078);
}

@end