@interface TPSCondition
+ (id)conditionFromDictionary:(id)a3;
+ (int64_t)typeFromConditionDictionary:(id)a3;
- (NSArray)targetingValidations;
- (NSArray)values;
- (NSString)debugDescription;
- (NSString)identifier;
- (NSString)valueType;
- (TPSCondition)initWithDictionary:(id)a3;
- (id)_valuesFromValuesArray:(id)a3;
- (int64_t)defaultJoinType;
- (int64_t)joinType;
- (int64_t)type;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setJoinType:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setValueType:(id)a3;
- (void)setValues:(id)a3;
- (void)validateWithCompletion:(id)a3;
- (void)validateWithValidations:(id)a3 completion:(id)a4;
@end

@implementation TPSCondition

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)conditionFromDictionary:(id)a3
{
  id v4 = a3;
  switch([a1 typeFromConditionDictionary:v4])
  {
    case 1:
      v5 = TPSDeviceCapabilityCondition;
      break;
    case 2:
      v5 = TPSUserTypeCondition;
      break;
    case 3:
      v5 = TPSRegionsCondition;
      break;
    case 4:
      v5 = TPSInstalledAppsCondition;
      break;
    case 5:
      v5 = TPSDevicesCondition;
      break;
    case 6:
      v5 = TPSPairedDevicesCondition;
      break;
    case 7:
      v5 = TPSCloudDevicesCondition;
      break;
    case 8:
      v5 = TPSNRDeviceCapabilityCondition;
      break;
    case 9:
      v5 = TPSAppStoreRegionsCondition;
      break;
    case 10:
      v5 = TPSSiriLanguagesCondition;
      break;
    case 11:
      v5 = TPSContentStatusCondition;
      break;
    case 12:
      v5 = TPSAppIntentCondition;
      break;
    case 13:
      v5 = TPSAppEntityCondition;
      break;
    default:
      v6 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[TPSCondition conditionFromDictionary:](v4, v6);
      }

      v5 = (__objc2_class *)objc_opt_class();
      break;
  }
  v7 = (void *)[[v5 alloc] initWithDictionary:v4];

  return v7;
}

- (TPSCondition)initWithDictionary:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TPSCondition;
  v5 = [(TPSCondition *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"id"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"unknown";
    }
    objc_storeStrong((id *)&v5->_identifier, v8);

    v5->_type = [(id)objc_opt_class() typeFromConditionDictionary:v4];
    v9 = [v4 TPSSafeStringForKey:@"joinType"];
    if ([v9 isEqualToString:@"AND"])
    {
      uint64_t v10 = 0;
    }
    else if ([v9 isEqualToString:@"OR"])
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = [(TPSCondition *)v5 defaultJoinType];
    }
    v5->_joinType = v10;
    uint64_t v11 = [v4 TPSSafeStringForKey:@"valueType"];
    valueType = v5->_valueType;
    v5->_valueType = (NSString *)v11;

    v13 = [v4 TPSSafeObjectForKey:@"values"];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19[0] = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

        v13 = (void *)v14;
      }
    }
    uint64_t v15 = [(TPSCondition *)v5 _valuesFromValuesArray:v13];
    values = v5->_values;
    v5->_values = (NSArray *)v15;
  }
  return v5;
}

+ (int64_t)typeFromConditionDictionary:(id)a3
{
  v3 = [a3 TPSSafeStringForKey:@"type"];
  if ([v3 isEqualToString:@"deviceCapability"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"userType"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"regions"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"installedApps"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"devices"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"pairedDevices"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"cloudDevices"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"watchCapability"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"appStoreRegions"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"siriLanguages"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"contentStatus"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"appIntent"])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"appEntity"])
  {
    int64_t v4 = 13;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)defaultJoinType
{
  return 0;
}

- (NSString)valueType
{
  return self->_valueType;
}

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSCondition *)self targetingValidations];
  [(TPSCondition *)self validateWithValidations:v5 completion:v4];
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_validations, 0);
}

- (NSArray)targetingValidations
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)validateWithValidations:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (self->_type)
  {
    objc_storeStrong((id *)&self->_validations, a3);
    validations = self->_validations;
    int64_t v11 = [(TPSCondition *)self joinType];
    v12 = [(TPSCondition *)self identifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__TPSCondition_validateWithValidations_completion___block_invoke;
    v13[3] = &unk_1E6E6B5A8;
    id v14 = v9;
    +[TPSTargetingValidator validateConditions:validations joinType:v11 context:v12 cache:0 completionQueue:0 completionHandler:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

uint64_t __51__TPSCondition_validateWithValidations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA98];
  id v5 = a3;
  id v6 = [v4 null];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (id)_valuesFromValuesArray:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TPSCondition *)self identifier];
  if ([(TPSCondition *)self joinType]) {
    id v6 = @"OR";
  }
  else {
    id v6 = @"AND";
  }
  id v7 = [(TPSCondition *)self values];
  id v8 = [v7 valueForKey:@"debugDescription"];
  v9 = [v3 stringWithFormat:@"<%@ %p> [%@] Values(%@): %@ ", v4, self, v5, v6, v8];

  return (NSString *)v9;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setValues:(id)a3
{
}

- (void)setValueType:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setJoinType:(int64_t)a3
{
  self->_joinType = a3;
}

+ (void)conditionFromDictionary:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 TPSSafeStringForKey:@"type"];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Unsupported condition type: %@", (uint8_t *)&v4, 0xCu);
}

@end