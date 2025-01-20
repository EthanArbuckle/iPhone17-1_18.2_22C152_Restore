@interface TPSDevicesCondition
- (TPSDevicesCondition)init;
- (id)targetingValidations;
@end

@implementation TPSDevicesCondition

- (TPSDevicesCondition)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSDevicesCondition;
  v2 = [(TPSDevicesCondition *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TPSCondition *)v2 setType:5];
  }
  return v3;
}

- (id)targetingValidations
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(TPSCondition *)self values];
  objc_super v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  v6 = [(TPSCondition *)self values];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__TPSDevicesCondition_targetingValidations__block_invoke;
  v9[3] = &unk_1E6E6BF20;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __43__TPSDevicesCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [TPSDeviceValidation alloc];
  objc_super v5 = [v3 targetValues];
  v6 = [v3 excludeValues];

  id v7 = [(TPSDeviceValidation *)v4 initWithTargetDevices:v5 excludeDevices:v6];
  [*(id *)(a1 + 32) addObject:v7];
}

@end