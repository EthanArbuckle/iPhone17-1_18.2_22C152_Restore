@interface PCStatusConditions
+ (void)clearStatusCondition:(id)a3 completionHandler:(id)a4;
+ (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)setStatusCondition:(id)a3 completionHandler:(id)a4;
@end

@implementation PCStatusConditions

+ (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  v5 = (void (**)(id, PCStatusConditionsImpl *))a4;
  if (!v9)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = -1102;
LABEL_7:
    v6 = [v7 errorWithDomain:@"PCStatusConditionsErrorDomain" code:v8 userInfo:0];
    v5[2](v5, v6);
    goto LABEL_8;
  }
  if (!MKBDeviceUnlockedSinceBoot())
  {
    if (!v5) {
      goto LABEL_9;
    }
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = -1101;
    goto LABEL_7;
  }
  v6 = objc_alloc_init(PCStatusConditionsImpl);
  [(PCStatusConditionsImpl *)v6 setStatusCondition:v9 completionHandler:v5];
LABEL_8:

LABEL_9:
}

+ (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  v5 = (void (**)(id, PCStatusConditionsImpl *))a4;
  if (!v9)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = -1102;
LABEL_7:
    v6 = [v7 errorWithDomain:@"PCStatusConditionsErrorDomain" code:v8 userInfo:0];
    v5[2](v5, v6);
    goto LABEL_8;
  }
  if (!MKBDeviceUnlockedSinceBoot())
  {
    if (!v5) {
      goto LABEL_9;
    }
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = -1101;
    goto LABEL_7;
  }
  v6 = objc_alloc_init(PCStatusConditionsImpl);
  [(PCStatusConditionsImpl *)v6 clearStatusCondition:v9 completionHandler:v5];
LABEL_8:

LABEL_9:
}

+ (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void, PCStatusConditionsImpl *))a5;
  if (!v12 || !v7)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = -1102;
LABEL_8:
    id v9 = [v10 errorWithDomain:@"PCStatusConditionsErrorDomain" code:v11 userInfo:0];
    v8[2](v8, 0, v9);
    goto LABEL_9;
  }
  if (!MKBDeviceUnlockedSinceBoot())
  {
    if (!v8) {
      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = -1101;
    goto LABEL_8;
  }
  id v9 = objc_alloc_init(PCStatusConditionsImpl);
  [(PCStatusConditionsImpl *)v9 isStatusConditionRegistered:v12 bundleIdentifier:v7 completionHandler:v8];
LABEL_9:

LABEL_10:
}

@end