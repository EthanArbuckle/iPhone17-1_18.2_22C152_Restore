@interface NetworkObserver
- (void)networkReachabilityDidChange;
@end

@implementation NetworkObserver

- (void)networkReachabilityDidChange
{
  delegateScheduler = self->delegateScheduler;
  swift_beginAccess();
  sub_18168((uint64_t)delegateScheduler, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v4 = (void *)swift_allocObject();
  v4[2] = self;
  v4[3] = sub_3A6D90;
  v4[4] = 0;
  swift_retain_n();
  sub_3D6F90();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  swift_release();
}

@end