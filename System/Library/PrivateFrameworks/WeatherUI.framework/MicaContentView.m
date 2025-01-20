@interface MicaContentView
- (_TtC9WeatherUI15MicaContentView)initWithCoder:(id)a3;
- (_TtC9WeatherUI15MicaContentView)initWithFrame:(CGRect)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation MicaContentView

- (_TtC9WeatherUI15MicaContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B47AB270();
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  MicaContentView.willMove(toWindow:)((UIWindow_optional *)a3);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MicaContentView.layoutSublayers(of:)((CALayer)v4);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  sub_1B4838D20();
  id v6 = a3;
  v7 = self;
  id v8 = MicaContentView.action(for:forKey:)();

  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC9WeatherUI15MicaContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9WeatherUI15MicaContentView_animation);
}

@end