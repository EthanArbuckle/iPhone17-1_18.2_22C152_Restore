@interface NPHNanoRespondWithTextStoreCompanionReplication
- (NPHNanoRespondWithTextStoreCompanionReplication)init;
- (void)_replyWithMessageStoreDidChange;
- (void)dealloc;
@end

@implementation NPHNanoRespondWithTextStoreCompanionReplication

- (NPHNanoRespondWithTextStoreCompanionReplication)init
{
  v7.receiver = self;
  v7.super_class = (Class)NPHNanoRespondWithTextStoreCompanionReplication;
  v2 = [(NPHNanoRespondWithTextStoreCompanionReplication *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_TUReplyWithMessageStoreNotificationHandler, @"com.apple.TelephonyUtilities.TUReplyWithMessageStoreChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(NPHNanoRespondWithTextStoreCompanionReplication *)v2 _replyWithMessageStoreDidChange];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NPHNanoRespondWithTextStoreCompanionReplication;
  [(NPHNanoRespondWithTextStoreCompanionReplication *)&v4 dealloc];
}

- (void)_replyWithMessageStoreDidChange
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[NPHNanoRespondWithTextStoreCompanionReplication _replyWithMessageStoreDidChange]";
    _os_log_impl(&dword_234652000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  npsManager = self->_npsManager;
  v5 = [MEMORY[0x263EFFA08] setWithObject:@"TUReplyWithMessageStoreReplyArray"];
  [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.mobilephone" keys:v5];
}

- (void).cxx_destruct
{
}

@end