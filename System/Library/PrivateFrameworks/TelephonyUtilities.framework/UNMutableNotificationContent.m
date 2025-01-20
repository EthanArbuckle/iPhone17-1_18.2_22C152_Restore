@interface UNMutableNotificationContent
- (NSArray)activeParticipantHandles;
- (NSArray)remoteParticipantHandles;
- (NSString)notificationProviderIdentifier;
- (void)setActiveParticipantHandles:(id)a3;
- (void)setNotificationProviderIdentifier:(id)a3;
- (void)setRemoteParticipantHandles:(id)a3;
@end

@implementation UNMutableNotificationContent

- (NSArray)remoteParticipantHandles
{
  return (NSArray *)sub_1002397F8(self, (uint64_t)a2, (uint64_t)&selRef_remoteParticipantHandles, (uint64_t (*)(uint64_t))sub_100239B04);
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (NSArray)activeParticipantHandles
{
  return (NSArray *)sub_1002397F8(self, (uint64_t)a2, (uint64_t)&selRef_activeParticipantHandles, (uint64_t (*)(uint64_t))sub_100239B04);
}

- (void)setActiveParticipantHandles:(id)a3
{
}

- (NSString)notificationProviderIdentifier
{
  return (NSString *)sub_100239D24(self, (uint64_t)a2, (void (*)(void))sub_100239DA4);
}

- (void)setNotificationProviderIdentifier:(id)a3
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v4 = self;
  sub_100239EA0();
}

@end