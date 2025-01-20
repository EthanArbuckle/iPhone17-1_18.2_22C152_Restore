@interface MicaBackgroundAnimation
- (_TtC9WeatherUI23MicaBackgroundAnimation)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)layoutSublayersOfLayer:(id)a3;
@end

@implementation MicaBackgroundAnimation

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6 = sub_1B4838D20();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  id v11 = MicaBackgroundAnimation.action(for:forKey:)((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
  return v11;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  MicaBackgroundAnimation.layoutSublayers(of:)((CALayer)v4);
}

- (_TtC9WeatherUI23MicaBackgroundAnimation)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WeatherUI23MicaBackgroundAnimation_rootMicaLayer);

  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WeatherUI23MicaBackgroundAnimation_scaleLayer);
}

@end