@interface SagaLibrary
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (BOOL)_isEnabledWithURLBag:(id)a3;
- (SagaLibrary)initWithConfiguration:(id)a3;
- (id)_bagKey;
- (id)_userIdentity;
@end

@implementation SagaLibrary

- (BOOL)_isEnabledWithURLBag:(id)a3
{
  return _ICCloudClientIsSagaEnabledInURLBag(a3, a2);
}

- (id)_bagKey
{
  return @"library-daap";
}

- (id)_userIdentity
{
  v5.receiver = self;
  v5.super_class = (Class)SagaLibrary;
  v2 = [(CloudLibrary *)&v5 configuration];
  v3 = [v2 userIdentity];

  return v3;
}

- (SagaLibrary)initWithConfiguration:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[CloudPendingChangesCoordinator alloc] initWithConfiguration:v4 prefix:@"Saga" loggable:objc_opt_class()];
  v8.receiver = self;
  v8.super_class = (Class)SagaLibrary;
  v6 = [(CloudLibrary *)&v8 _initWithConfiguration:v4 pendingChangesCoordinator:v5];

  return v6;
}

+ (id)oversizeLogCategory
{
  os_log_t v2 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");

  return v2;
}

+ (id)logCategory
{
  os_log_t v2 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");

  return v2;
}

@end