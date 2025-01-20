@interface GKTurnBasedMultiplayerCompletedExchangeBulletin
+ (BOOL)shouldLoadCacheData;
- (id)aggregateDictionaryKey;
- (id)bulletinMessage;
@end

@implementation GKTurnBasedMultiplayerCompletedExchangeBulletin

+ (BOOL)shouldLoadCacheData
{
  return 0;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedExchangeCompleted;
}

- (id)bulletinMessage
{
  return +[GCFLocalizedStrings KETTLE_TURN_BASED_MATCH_EXCHANGE_COMPLETED_NOTIFICATION_MESSAGE_FORMAT_ZERO];
}

@end