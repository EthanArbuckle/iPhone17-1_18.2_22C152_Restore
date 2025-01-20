@interface ExtendedLaunchController
- (_TtC10PodcastsUI24ExtendedLaunchController)init;
@end

@implementation ExtendedLaunchController

- (_TtC10PodcastsUI24ExtendedLaunchController)init
{
  uint64_t v3 = OBJC_IVAR____TtC10PodcastsUI24ExtendedLaunchController_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2878);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 28) = 0;
  *(void *)(v4 + 16) = 0;
  *(unsigned char *)(v4 + 24) = 0;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExtendedLaunchController();
  return [(ExtendedLaunchController *)&v6 init];
}

- (void).cxx_destruct
{
}

@end