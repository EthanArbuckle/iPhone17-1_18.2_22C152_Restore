@interface FeatureAvailabilityObserverProxy
- (void)sportsTopicNotificationsWithDidChange:(BOOL)a3;
@end

@implementation FeatureAvailabilityObserverProxy

- (void)sportsTopicNotificationsWithDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = MEMORY[0x1E01EFB70](self->delegate, a2);
  if (v4)
  {
    v5 = (void *)v4;
    swift_retain();
    objc_msgSend(v5, sel_sportsTopicNotificationsWithDidChange_, v3);
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end