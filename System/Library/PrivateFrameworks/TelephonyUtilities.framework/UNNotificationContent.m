@interface UNNotificationContent
- (NSArray)activeParticipantHandles;
- (NSArray)remoteParticipantHandles;
- (NSString)notificationProviderIdentifier;
@end

@implementation UNNotificationContent

- (NSArray)remoteParticipantHandles
{
  return (NSArray *)sub_1002397F8(self, (uint64_t)a2, 0x800000010047E460, sub_10023987C);
}

- (NSArray)activeParticipantHandles
{
  return (NSArray *)sub_1002397F8(self, (uint64_t)a2, 0x800000010047E480, sub_10023987C);
}

- (NSString)notificationProviderIdentifier
{
  return (NSString *)sub_100239D24(self, (uint64_t)a2, (void (*)(void))sub_10023999C);
}

@end