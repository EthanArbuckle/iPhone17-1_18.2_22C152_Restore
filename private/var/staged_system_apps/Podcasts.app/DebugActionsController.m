@interface DebugActionsController
- (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122DebugActionsController)init;
- (void)clearAll;
- (void)sendMostRecentNotification;
- (void)sendOldestNoticication;
- (void)sendRandomNotification;
- (void)showiOSDebugMenu;
@end

@implementation DebugActionsController

- (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122DebugActionsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DebugActionsController();
  return [(DebugActionsController *)&v3 init];
}

- (void)sendRandomNotification
{
}

- (void)sendMostRecentNotification
{
}

- (void)sendOldestNoticication
{
}

- (void)clearAll
{
}

- (void)showiOSDebugMenu
{
  v2 = self;
  sub_100288A4C();
}

@end