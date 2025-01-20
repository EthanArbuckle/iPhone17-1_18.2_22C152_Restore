@interface GKTurnBasedMultiplayerTurnReminderBulletin
- (id)aggregateDictionaryKey;
- (void)update;
@end

@implementation GKTurnBasedMultiplayerTurnReminderBulletin

- (void)update
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerTurnReminderBulletin update", v5, 2u);
  }
  [(GKTurnBasedMultiplayerBulletin *)self updateBadgeCount];
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedReminder;
}

@end