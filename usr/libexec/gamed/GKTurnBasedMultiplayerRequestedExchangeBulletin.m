@interface GKTurnBasedMultiplayerRequestedExchangeBulletin
+ (BOOL)shouldLoadCacheData;
- (id)aggregateDictionaryKey;
- (id)bulletinMessage;
@end

@implementation GKTurnBasedMultiplayerRequestedExchangeBulletin

+ (BOOL)shouldLoadCacheData
{
  return 0;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedExchangeRequested;
}

- (id)bulletinMessage
{
  return +[GCFLocalizedStrings KETTLE_TURN_BASED_MATCH_EXCHANGE_REQUEST_NOTIFICATION_MESSAGE_FORMAT];
}

@end