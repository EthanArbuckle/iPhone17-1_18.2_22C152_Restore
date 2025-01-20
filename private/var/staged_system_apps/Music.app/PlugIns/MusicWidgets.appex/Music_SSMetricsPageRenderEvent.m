@interface Music_SSMetricsPageRenderEvent
+ (NSString)Topic;
- (_TtC9MusicCore30Music_SSMetricsPageRenderEvent)init;
- (_TtC9MusicCore30Music_SSMetricsPageRenderEvent)initWithBodyDictionary:(id)a3;
- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4;
@end

@implementation Music_SSMetricsPageRenderEvent

+ (NSString)Topic
{
  NSString v2 = sub_100534CA0();

  return (NSString *)v2;
}

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  id v9 = a3;
  sub_1001B7C1C(a3, v8, v8, (uint64_t)a3, (uint64_t)sub_1001B9024, v7);

  swift_release();
}

- (_TtC9MusicCore30Music_SSMetricsPageRenderEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(Music_SSMetricsPageRenderEvent *)&v3 init];
}

- (_TtC9MusicCore30Music_SSMetricsPageRenderEvent)initWithBodyDictionary:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_100534AB0();
  Class isa = sub_100534A90().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(Music_SSMetricsPageRenderEvent *)&v8 initWithBodyDictionary:isa];

  return v6;
}

@end