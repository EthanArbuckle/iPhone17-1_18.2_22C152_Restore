@interface ContextMenuInteraction
- (_TtC11WeatherMaps22ContextMenuInteraction)initWithDelegate:(id)a3;
@end

@implementation ContextMenuInteraction

- (_TtC11WeatherMaps22ContextMenuInteraction)initWithDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22ContextMenuInteraction_strongDelegate));
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22ContextMenuInteraction_weatherDataSource);
  v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps22ContextMenuInteraction_weatherDelegate;
  sub_20A1CC7A0((uint64_t)v3);
}

@end