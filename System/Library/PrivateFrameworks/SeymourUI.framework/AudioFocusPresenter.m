@interface AudioFocusPresenter
- (void)handleMediaSelectionDidChangeWithItem:(id)a3;
@end

@implementation AudioFocusPresenter

- (void)handleMediaSelectionDidChangeWithItem:(id)a3
{
  v3 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI19AudioFocusPresenter_state);
  id v4 = a3;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v3 + 12);
  sub_23A79CF44((uint64_t)&v3[4]);
  os_unfair_lock_unlock(v3 + 12);

  swift_release();
  swift_release();
}

@end