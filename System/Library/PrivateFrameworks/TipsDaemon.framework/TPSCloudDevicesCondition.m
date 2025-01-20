@interface TPSCloudDevicesCondition
- (NSArray)registeredDevices;
- (TPSCloudDevicesCondition)init;
- (id)_valuesFromValuesArray:(id)a3;
- (id)targetingValidations;
- (void)setRegisteredDevices:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSCloudDevicesCondition

- (TPSCloudDevicesCondition)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCloudDevicesCondition;
  v2 = [(TPSCloudDevicesCondition *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TPSCondition *)v2 setType:7];
  }
  return v3;
}

- (id)targetingValidations
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(TPSCondition *)self values];
  objc_super v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  v6 = [(TPSCondition *)self values];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__TPSCloudDevicesCondition_targetingValidations__block_invoke;
  v11[3] = &unk_1E6E6C0B8;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  [v6 enumerateObjectsUsingBlock:v11];

  v8 = v12;
  id v9 = v7;

  return v9;
}

void __48__TPSCloudDevicesCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[TPSCloudDeviceValidation alloc] initWithDeviceInfo:v3];

  [(TPSCloudDeviceValidation *)v4 setDataSource:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v4];
}

- (id)_valuesFromValuesArray:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  objc_super v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__TPSCloudDevicesCondition__valuesFromValuesArray___block_invoke;
  v9[3] = &unk_1E6E6B690;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];

  return v7;
}

void __51__TPSCloudDevicesCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[TPSCloudDeviceInfo alloc] initWithDictionary:v3];
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__TPSCloudDevicesCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
}

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F6AB90]);
  id v6 = (void *)[v5 initWithService:*MEMORY[0x1E4FAF510]];
  id v7 = [v6 devices];
  [(TPSCloudDevicesCondition *)self setRegisteredDevices:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__TPSCloudDevicesCondition_validateWithCompletion___block_invoke;
  v10[3] = &unk_1E6E6C0E0;
  v10[4] = self;
  id v11 = v4;
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudDevicesCondition;
  id v8 = v4;
  [(TPSCondition *)&v9 validateWithCompletion:v10];
}

uint64_t __51__TPSCloudDevicesCondition_validateWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 setRegisteredDevices:0];
}

- (NSArray)registeredDevices
{
  return self->_registeredDevices;
}

- (void)setRegisteredDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

void __51__TPSCloudDevicesCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for cloud device condition: %@", (uint8_t *)&v2, 0xCu);
}

@end