@interface GKTurnBasedMultiplayerTurnBulletin
- (id)aggregateDictionaryKey;
- (void)assembleBulletin;
- (void)handleAcceptAction;
- (void)update;
@end

@implementation GKTurnBasedMultiplayerTurnBulletin

- (void)update
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerTurnBulletin update", v5, 2u);
  }
  [(GKTurnBasedMultiplayerBulletin *)self updateBadgeCount];
  [(GKTurnBasedMultiplayerBulletin *)self expireAndLoadCaches];
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedTurn;
}

- (void)handleAcceptAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerTurnBulletin handleAcceptAction", v5, 2u);
  }
  [(GKTurnBasedMultiplayerBulletin *)self acceptTurnBasedTurn];
}

- (void)assembleBulletin
{
  v3.receiver = self;
  v3.super_class = (Class)GKTurnBasedMultiplayerTurnBulletin;
  [(GKTurnBasedMultiplayerBulletin *)&v3 assembleBulletin];
  [(GKBulletin *)self setBulletinType:201];
}

@end