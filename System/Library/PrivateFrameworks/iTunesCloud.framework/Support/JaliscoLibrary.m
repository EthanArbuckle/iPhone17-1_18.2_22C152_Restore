@interface JaliscoLibrary
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (JaliscoLibrary)initWithConfiguration:(id)a3;
- (id)_bagKey;
@end

@implementation JaliscoLibrary

+ (id)logCategory
{
  os_log_t v2 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");

  return v2;
}

- (id)_bagKey
{
  return @"purchase-daap";
}

- (JaliscoLibrary)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [[CloudPendingChangesCoordinator alloc] initWithConfiguration:v4 prefix:@"Jalisco-Media" loggable:objc_opt_class()];
  v8.receiver = self;
  v8.super_class = (Class)JaliscoLibrary;
  v6 = [(CloudLibrary *)&v8 _initWithConfiguration:v4 pendingChangesCoordinator:v5];

  return v6;
}

+ (id)oversizeLogCategory
{
  os_log_t v2 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync_Oversize");

  return v2;
}

@end