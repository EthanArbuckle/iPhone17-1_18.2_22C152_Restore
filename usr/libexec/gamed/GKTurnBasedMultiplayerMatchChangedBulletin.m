@interface GKTurnBasedMultiplayerMatchChangedBulletin
+ (BOOL)displayNotification;
- (id)aggregateDictionaryKey;
@end

@implementation GKTurnBasedMultiplayerMatchChangedBulletin

+ (BOOL)displayNotification
{
  return 0;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedMatchChanged;
}

@end