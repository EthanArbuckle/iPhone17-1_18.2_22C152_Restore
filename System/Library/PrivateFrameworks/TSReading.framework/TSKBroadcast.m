@interface TSKBroadcast
+ (void)asyncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5;
+ (void)asyncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7;
+ (void)syncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5;
+ (void)syncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7;
+ (void)twoPhaseNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5;
+ (void)twoPhaseNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7;
@end

@implementation TSKBroadcast

+ (void)twoPhaseNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7
{
  if (a3 && a4)
  {
    uint64_t v10 = *(void *)&a5;
    v12 = objc_alloc_init(TSKChangeGroup);
    [(TSKChangeGroup *)v12 registerChange:v10 details:a6 forChangeSource:a7];
    +[TSKBroadcast twoPhaseNotificationWithAccessController:a3 changeNotifier:a4 changeGroup:v12];
  }
}

+ (void)twoPhaseNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5
{
  if (a3 && a4)
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "isMainThread") & 1) == 0)
    {
      v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"+[TSKBroadcast twoPhaseNotificationWithAccessController:changeNotifier:changeGroup:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKBroadcast.m"), 58, @"Must request performing commands on the main thread.");
    }
    if (a5)
    {
      [a3 performRead:0 thenWrite:sel_syncProcessChanges_ thenReadOnMainThread:sel_asyncProcessChanges_ withTarget:a4 argument:a5];
    }
  }
}

+ (void)asyncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7
{
  if (a3 && a4)
  {
    uint64_t v10 = *(void *)&a5;
    v12 = objc_alloc_init(TSKChangeGroup);
    [(TSKChangeGroup *)v12 registerChange:v10 details:a6 forChangeSource:a7];
    +[TSKBroadcast asyncNotificationWithAccessController:a3 changeNotifier:a4 changeGroup:v12];
  }
}

+ (void)asyncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5
{
  if (a3 && a4 && a5)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "isMainThread"))
    {
      [a4 asyncProcessChanges:a5];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__TSKBroadcast_asyncNotificationWithAccessController_changeNotifier_changeGroup___block_invoke;
      block[3] = &unk_2646B0C38;
      block[4] = a3;
      block[5] = a4;
      block[6] = a5;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __81__TSKBroadcast_asyncNotificationWithAccessController_changeNotifier_changeGroup___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__TSKBroadcast_asyncNotificationWithAccessController_changeNotifier_changeGroup___block_invoke_2;
  v3[3] = &unk_2646B0750;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 performRead:v3];
}

uint64_t __81__TSKBroadcast_asyncNotificationWithAccessController_changeNotifier_changeGroup___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) asyncProcessChanges:*(void *)(a1 + 40)];
}

+ (void)syncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7
{
  if (a3 && a4)
  {
    uint64_t v10 = *(void *)&a5;
    v12 = objc_alloc_init(TSKChangeGroup);
    [(TSKChangeGroup *)v12 registerChange:v10 details:a6 forChangeSource:a7];
    +[TSKBroadcast syncNotificationWithAccessController:a3 changeNotifier:a4 changeGroup:v12];
  }
}

+ (void)syncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5
{
  if (a3 && a4)
  {
    if (a5) {
      [a3 performRead:0 thenWrite:sel_syncProcessChanges_ thenReadOnMainThread:0 withTarget:a4 argument:a5];
    }
  }
}

@end