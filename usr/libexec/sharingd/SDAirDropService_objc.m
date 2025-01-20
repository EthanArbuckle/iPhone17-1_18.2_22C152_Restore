@interface SDAirDropService_objc
- (SDAirDropService_objc)init;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropService_objc

- (void)start
{
  uint64_t v2 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v2 - 8);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  swift_retain_n();
  static Task<>.noThrow(priority:operation:)();
  swift_release();
  swift_release();
  sub_10039D9F4((uint64_t)v4);
  swift_release();
}

- (void)stop
{
  uint64_t v2 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v2 - 8);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  swift_retain_n();
  sub_10000A844(&qword_10096C4C0);
  static Task<>.noThrow(priority:operation:)();
  swift_release();
  swift_release();
  sub_10039D9F4((uint64_t)v4);
  swift_release();
}

- (SDAirDropService_objc)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_defaultActor_initialize();
  *(void *)self->service = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(SDAirDropService_objc *)&v5 init];
}

@end