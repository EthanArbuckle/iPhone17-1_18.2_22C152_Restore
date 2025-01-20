@interface PHALocalNotificationInterface
+ (id)localNotificationInterface;
- (BOOL)isNotificationRegistered;
- (PHALocalNotificationInterface)init;
- (void)fireLocalNotificationWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setIsNotificationRegistered:(BOOL)a3;
@end

@implementation PHALocalNotificationInterface

- (void)setIsNotificationRegistered:(BOOL)a3
{
  self->_isNotificationRegistered = a3;
}

- (BOOL)isNotificationRegistered
{
  return self->_isNotificationRegistered;
}

- (void)fireLocalNotificationWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((PLIsFeaturedContentAllowed() & 1) != 0 || [v5 type])
  {
    v7 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__PHALocalNotificationInterface_fireLocalNotificationWithOptions_completionHandler___block_invoke_33;
    v12[3] = &unk_1E69176E8;
    id v13 = v5;
    id v14 = v6;
    dispatch_async(v7, v12);

    v8 = v13;
LABEL_4:

    goto LABEL_5;
  }
  if (__PXLoggraph_workerOnceToken != -1) {
    dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_27_1253);
  }
  v9 = (void *)__PXLoggraph_workerOSLog;
  if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = +[PHANotificationOptions stringFromNotificationType:](PHANotificationOptions, "stringFromNotificationType:", [v5 type]);
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_DEFAULT, "[%@ Notification] Not firing notification because featured content is disabled in settings", buf, 0xCu);
  }
  if (v6)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 14, @"Featured content is disabled in settings");
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v8);
    goto LABEL_4;
  }
LABEL_5:
}

void __84__PHALocalNotificationInterface_fireLocalNotificationWithOptions_completionHandler___block_invoke_33(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) collectionUUID];
  v3 = [*(id *)(a1 + 32) deliveryDate];
  if (__PXLoggraph_workerOnceToken != -1) {
    dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_35);
  }
  v4 = (void *)__PXLoggraph_workerOSLog;
  if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    v7 = +[PHANotificationOptions stringFromNotificationType:](PHANotificationOptions, "stringFromNotificationType:", [v5 type]);
    uint64_t v8 = *(void *)(a1 + 32);
    int v14 = 138412546;
    v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_INFO, "[%@ Notification] Firing notification %@", (uint8_t *)&v14, 0x16u);
  }
  v9 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F39228]) initWithPhotoLibraryURL:v9];
  if (![*(id *)(a1 + 32) type])
  {
    v11 = [v10 assetsdClient];
    v12 = [v11 notificationClient];
    [v12 asyncNotifyInterestingMemoryNotificationForColletionID:v2 notificationDeliveryDate:v3];
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, void))(v13 + 16))(v13, 1, 0);
  }
}

uint64_t __84__PHALocalNotificationInterface_fireLocalNotificationWithOptions_completionHandler___block_invoke_2()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __84__PHALocalNotificationInterface_fireLocalNotificationWithOptions_completionHandler___block_invoke()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

- (PHALocalNotificationInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHALocalNotificationInterface;
  result = [(PHALocalNotificationInterface *)&v3 init];
  if (result) {
    result->_isNotificationRegistered = 0;
  }
  return result;
}

+ (id)localNotificationInterface
{
  if (localNotificationInterface_onceToken != -1) {
    dispatch_once(&localNotificationInterface_onceToken, &__block_literal_global_1264);
  }
  v2 = (void *)localNotificationInterface_interface;

  return v2;
}

uint64_t __59__PHALocalNotificationInterface_localNotificationInterface__block_invoke()
{
  localNotificationInterface_interface = objc_alloc_init(PHALocalNotificationInterface);

  return MEMORY[0x1F41817F8]();
}

@end