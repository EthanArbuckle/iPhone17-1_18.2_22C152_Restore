@interface WFShortcutsSyncEngine
- (WFShortcutsSyncEngine)init;
- (WFShortcutsSyncEngine)initWithDatabase:(id)a3 container:(id)a4;
- (void)forceReceiveAndSendAllChangesWithCompletionHandler:(id)a3;
@end

@implementation WFShortcutsSyncEngine

- (WFShortcutsSyncEngine)initWithDatabase:(id)a3 container:(id)a4
{
  return (WFShortcutsSyncEngine *)ShortcutsSyncEngine.init(database:container:)((uint64_t)a3, a4);
}

- (WFShortcutsSyncEngine)init
{
}

- (void).cxx_destruct
{
}

- (void)forceReceiveAndSendAllChangesWithCompletionHandler:(id)a3
{
}

@end