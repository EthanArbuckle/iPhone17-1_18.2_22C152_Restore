@interface WidgetArtworkLoader
- (_TtC24AppStoreWidgetsExtension19WidgetArtworkLoader)init;
@end

@implementation WidgetArtworkLoader

- (_TtC24AppStoreWidgetsExtension19WidgetArtworkLoader)init
{
  uint64_t v3 = OBJC_IVAR____TtC24AppStoreWidgetsExtension19WidgetArtworkLoader_cache;
  sub_1000069D4(&qword_10007AC28);
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100057124();
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC24AppStoreWidgetsExtension19WidgetArtworkLoader____lazy_storage___session) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for WidgetArtworkLoader();
  return [(WidgetArtworkLoader *)&v6 init];
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24AppStoreWidgetsExtension19WidgetArtworkLoader____lazy_storage___session);
}

@end