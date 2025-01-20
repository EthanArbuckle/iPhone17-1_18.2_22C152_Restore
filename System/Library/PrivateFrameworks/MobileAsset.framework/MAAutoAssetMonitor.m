@interface MAAutoAssetMonitor
+ (BOOL)supportsSecureCoding;
+ (id)defaultDispatchQueue;
- (MAAutoAssetMonitor)initWithCoder:(id)a3;
- (MAAutoAssetSelector)assetSelector;
- (NSString)autoAssetClientName;
- (OS_dispatch_queue)notificationDispatchQueue;
- (id)cancelRegistrationSync;
- (id)description;
- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 error:(id *)a5 notifyingStatusChanges:(id)a6;
- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 notifyingFromQueue:(id)a5 error:(id *)a6 notifyingStatusChanges:(id)a7;
- (id)registerForNotificationsSync;
- (id)registerForNotificationsSync:(id)a3;
- (id)statusChangeNotificationBlock;
- (id)summary;
- (void)cancelRegistration:(id)a3;
- (void)registerForNotifications:(id)a3;
- (void)registerForNotifications:(id)a3 completion:(id)a4;
- (void)setStatusChangeNotificationBlock:(id)a3;
@end

@implementation MAAutoAssetMonitor

- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 error:(id *)a5 notifyingStatusChanges:(id)a6
{
  return [(MAAutoAssetMonitor *)self initForClientName:a3 forAssetSelector:a4 notifyingFromQueue:0 error:a5 notifyingStatusChanges:a6];
}

- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 notifyingFromQueue:(id)a5 error:(id *)a6 notifyingStatusChanges:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MAAutoAssetMonitor;
  v17 = [(MAAutoAssetMonitor *)&v25 init];
  v18 = v17;
  if (!v17)
  {
LABEL_8:
    v23 = v18;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v17->_autoAssetClientName, a3);
  objc_storeStrong((id *)&v18->_assetSelector, a4);
  uint64_t v19 = MEMORY[0x1B3EAAEB0](v16);
  id statusChangeNotificationBlock = v18->_statusChangeNotificationBlock;
  v18->_id statusChangeNotificationBlock = (id)v19;

  if (v15)
  {
    v21 = (OS_dispatch_queue *)v15;
  }
  else
  {
    v21 = +[MAAutoAssetMonitor defaultDispatchQueue];
  }
  notificationDispatchQueue = v18->_notificationDispatchQueue;
  v18->_notificationDispatchQueue = v21;

  if (v18->_notificationDispatchQueue)
  {
    if (a6) {
      *a6 = 0;
    }
    goto LABEL_8;
  }
  if (a6)
  {
    +[MAAutoAssetError buildError:6101 fromOperation:@"auto-monitor(defaultDispatchQueue)" underlyingError:0 withDescription:@"unable to assign notification dispatch queue"];
    v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
LABEL_9:

  return v23;
}

- (MAAutoAssetMonitor)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MAAutoAssetMonitor;
  return [(MAAutoAssetMonitor *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)registerForNotifications:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MAAutoAssetMonitor_registerForNotifications___block_invoke;
  v7[3] = &unk_1E60042B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__MAAutoAssetMonitor_registerForNotifications___block_invoke(uint64_t a1)
{
  id v5 = +[MAAutoAssetError buildError:6801 fromOperation:@"auto-monitor(registerForNotifications)" underlyingError:0 withDescription:@"MAAutoAsset-under-development"];
  if (*(void *)(a1 + 40))
  {
    v2 = objc_alloc_init(MAAutoAssetNotifications);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) assetSelector];
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);
  }
}

- (id)registerForNotificationsSync
{
  return +[MAAutoAssetError buildError:6801 fromOperation:@"auto-monitor(registerForNotificationsSync)" underlyingError:0 withDescription:@"MAAutoAsset-under-development"];
}

- (void)registerForNotifications:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MAAutoAssetMonitor_registerForNotifications_completion___block_invoke;
  v8[3] = &unk_1E60042B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __58__MAAutoAssetMonitor_registerForNotifications_completion___block_invoke(uint64_t a1)
{
  id v5 = +[MAAutoAssetError buildError:6801 fromOperation:@"auto-monitor(registerForNotifications:)" underlyingError:0 withDescription:@"MAAutoAsset-under-development"];
  if (*(void *)(a1 + 40))
  {
    v2 = objc_alloc_init(MAAutoAssetNotifications);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) assetSelector];
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);
  }
}

- (id)registerForNotificationsSync:(id)a3
{
  return +[MAAutoAssetError buildError:6801 fromOperation:@"auto-monitor(registerForNotificationsSync:)" underlyingError:0 withDescription:@"MAAutoAsset-under-development"];
}

- (void)cancelRegistration:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__MAAutoAssetMonitor_cancelRegistration___block_invoke;
  v7[3] = &unk_1E60042B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__MAAutoAssetMonitor_cancelRegistration___block_invoke(uint64_t a1)
{
  id v5 = +[MAAutoAssetError buildError:6801 fromOperation:@"auto-monitor(cancelRegistration:)" underlyingError:0 withDescription:@"MAAutoAsset-under-development"];
  if (*(void *)(a1 + 40))
  {
    v2 = objc_alloc_init(MAAutoAssetNotifications);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) assetSelector];
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);
  }
}

- (id)cancelRegistrationSync
{
  return +[MAAutoAssetError buildError:6801 fromOperation:@"auto-monitor(cancelRegistrationSync)" underlyingError:0 withDescription:@"MAAutoAsset-under-development"];
}

- (id)description
{
  return @"MAAutoAssetMonitor SPI:description not-yet-implemented [see rdar://84676752]";
}

- (id)summary
{
  return @"MAAutoAssetMonitor SPI:summary not-yet-implemented [see rdar://84676752]";
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_0 != -1) {
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_0, &__block_literal_global_3);
  }
  v2 = (void *)defaultDispatchQueue_defaultQueue_0;
  return v2;
}

void __42__MAAutoAssetMonitor_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.framework.autoassetmonitor" UTF8String];
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_defaultQueue_0;
  defaultDispatchQueue_defaultQueue_0 = (uint64_t)v1;
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (id)statusChangeNotificationBlock
{
  return self->_statusChangeNotificationBlock;
}

- (void)setStatusChangeNotificationBlock:(id)a3
{
}

- (OS_dispatch_queue)notificationDispatchQueue
{
  return self->_notificationDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationDispatchQueue, 0);
  objc_storeStrong(&self->_statusChangeNotificationBlock, 0);
  objc_storeStrong((id *)&self->_assetSelector, 0);
  objc_storeStrong((id *)&self->_autoAssetClientName, 0);
}

@end