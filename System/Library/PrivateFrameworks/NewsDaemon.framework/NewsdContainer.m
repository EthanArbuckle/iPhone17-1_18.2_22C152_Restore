@interface NewsdContainer
+ (TFResolver)tfResolver;
- (_TtC5newsd14NewsdContainer)init;
@end

@implementation NewsdContainer

+ (TFResolver)tfResolver
{
  if (qword_10006A9E8 != -1) {
    swift_once();
  }
  Container.resolver.getter();
  sub_100017A60(v4, v4[3]);
  v2 = (void *)dispatch thunk of ResolverType.bridgedResolver.getter();
  sub_1000185C0((uint64_t)v4);

  return (TFResolver *)v2;
}

- (_TtC5newsd14NewsdContainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(NewsdContainer *)&v3 init];
}

@end