@interface LocationDataProvider
- (_TtC18MobileTimerSupport20LocationDataProvider)init;
@end

@implementation LocationDataProvider

- (_TtC18MobileTimerSupport20LocationDataProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_defaultActor_initialize();
  *(void *)&self->_anon_60[8] = MEMORY[0x1E4FBC868];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LocationDataProvider *)&v5 init];
}

@end