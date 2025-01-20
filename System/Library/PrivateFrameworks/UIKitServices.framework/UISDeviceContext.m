@interface UISDeviceContext
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)_allKeys;
+ (id)_keysToValueTypes;
+ (id)defaultContext;
- (BOOL)_isDeviceInfoType:(int64_t)a3 appropriateForKey:(id)a4;
- (BOOL)_isDeviceInfoValue:(id)a3 appropriateForKey:(id)a4;
- (BOOL)deviceInfoBoolValueForKey:(id)a3;
- (BOOL)hasDeviceInfoValueForKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (UISDeviceContext)initWithBSXPCCoder:(id)a3;
- (UISDeviceContext)initWithDeviceInfoValues:(id)a3;
- (double)deviceInfoFloatValueForKey:(id)a3;
- (id)_dictionaryWithOnlyValidKeysFromDictionary:(id)a3;
- (id)_rawDeviceInfoKeysToValues;
- (id)deviceInfoStringValueForKey:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)_valueTypeForKey:(id)a3;
- (int64_t)_valueTypeForValue:(id)a3;
- (int64_t)deviceInfoIntegerValueForKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation UISDeviceContext

uint64_t __63__UISDeviceContext__dictionaryWithOnlyValidKeysFromDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _isDeviceInfoValue:a3 appropriateForKey:a2];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

void __28__UISDeviceContext__allKeys__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = [*(id *)(a1 + 32) _keysToValueTypes];
  v3 = [v6 allKeys];
  uint64_t v4 = [v2 initWithArray:v3];
  v5 = (void *)qword_1EB288908;
  qword_1EB288908 = v4;
}

- (double)deviceInfoFloatValueForKey:(id)a3
{
  id v5 = a3;
  if (![(UISDeviceContext *)self _isDeviceInfoType:3 appropriateForKey:v5])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UISDeviceContext.m", 65, @"%s values aren't valid for the key '%@'", "Float", v5 object file lineNumber description];
  }
  id v6 = [(NSDictionary *)self->_deviceInfoKeysToValues objectForKeyedSubscript:v5];
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (UISDeviceContext)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceContextInfo"];

  id v6 = [(UISDeviceContext *)self initWithDeviceInfoValues:v5];
  return v6;
}

- (int64_t)deviceInfoIntegerValueForKey:(id)a3
{
  id v5 = a3;
  if (![(UISDeviceContext *)self _isDeviceInfoType:2 appropriateForKey:v5])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UISDeviceContext.m", 74, @"%s values aren't valid for the key '%@'", "Integer", v5 object file lineNumber description];
  }
  id v6 = [(NSDictionary *)self->_deviceInfoKeysToValues objectForKeyedSubscript:v5];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (BOOL)_isDeviceInfoValue:(id)a3 appropriateForKey:(id)a4
{
  id v6 = a4;
  LOBYTE(a3) = [(UISDeviceContext *)self _isDeviceInfoType:[(UISDeviceContext *)self _valueTypeForValue:a3] appropriateForKey:v6];

  return (char)a3;
}

- (BOOL)_isDeviceInfoType:(int64_t)a3 appropriateForKey:(id)a4
{
  int64_t v5 = [(UISDeviceContext *)self _valueTypeForKey:a4];
  return !(((v5 & a3) < 0) ^ v6 | ((v5 & a3) == 0));
}

- (int64_t)_valueTypeForKey:(id)a3
{
  id v5 = a3;
  char v6 = [(id)objc_opt_class() _allKeys];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UISDeviceContext.m", 140, @"Key '%@' isn't valid", v5 object file lineNumber description];
  }
  double v8 = [(id)objc_opt_class() _keysToValueTypes];
  v9 = [v8 objectForKeyedSubscript:v5];

  if (v9) {
    int64_t v10 = [v9 integerValue];
  }
  else {
    int64_t v10 = 0;
  }

  return v10;
}

+ (id)_keysToValueTypes
{
  if (qword_1EB288900 != -1) {
    dispatch_once(&qword_1EB288900, &__block_literal_global_10);
  }
  id v2 = (void *)_MergedGlobals_15;
  return v2;
}

+ (id)_allKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__UISDeviceContext__allKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB288910 != -1) {
    dispatch_once(&qword_1EB288910, block);
  }
  id v2 = (void *)qword_1EB288908;
  return v2;
}

- (int64_t)_valueTypeForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = 3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v4 = 4;
    }
    else {
      int64_t v4 = 0;
    }
  }

  return v4;
}

+ (id)defaultContext
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F62870] sharedInstance];
  v11[0] = @"UISDeviceContextDeviceClassKey";
  int64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v3, "deviceClass"));
  v12[0] = v4;
  v12[1] = &unk_1EE2956E8;
  v11[1] = @"UISDeviceContextDeviceIdiomKey";
  v11[2] = @"UISDeviceContextHomeButtonTypeKey";
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "homeButtonType"));
  v12[2] = v5;
  v11[3] = @"UISDeviceContextDeviceCornerRadiusKey";
  char v6 = (void *)MEMORY[0x1E4F28ED0];
  MGGetFloat32Answer();
  char v7 = objc_msgSend(v6, "numberWithFloat:");
  v12[3] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  v9 = (void *)[objc_alloc((Class)a1) initWithDeviceInfoValues:v8];
  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  deviceInfoKeysToValues = self->_deviceInfoKeysToValues;
  id v5 = a3;
  id v6 = [(UISDeviceContext *)self _dictionaryWithOnlyValidKeysFromDictionary:deviceInfoKeysToValues];
  [v5 encodeObject:v6 forKey:@"DeviceContextInfo"];
}

- (UISDeviceContext)initWithDeviceInfoValues:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UISDeviceContext;
  id v5 = [(UISDeviceContext *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(UISDeviceContext *)v5 _dictionaryWithOnlyValidKeysFromDictionary:v4];
    deviceInfoKeysToValues = v6->_deviceInfoKeysToValues;
    v6->_deviceInfoKeysToValues = (NSDictionary *)v7;
  }
  return v6;
}

- (id)_dictionaryWithOnlyValidKeysFromDictionary:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__UISDeviceContext__dictionaryWithOnlyValidKeysFromDictionary___block_invoke;
  v5[3] = &unk_1E5735740;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "bs_filter:", v5);
  return v3;
}

- (void).cxx_destruct
{
}

void __37__UISDeviceContext__keysToValueTypes__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UISDeviceContextDeviceClassKey";
  v2[1] = @"UISDeviceContextDeviceIdiomKey";
  v3[0] = &unk_1EE295700;
  v3[1] = &unk_1EE295700;
  v2[2] = @"UISDeviceContextHomeButtonTypeKey";
  v2[3] = @"UISDeviceContextDeviceCornerRadiusKey";
  v3[2] = &unk_1EE295700;
  v3[3] = &unk_1EE295718;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v0;
}

- (BOOL)hasDeviceInfoValueForKey:(id)a3
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() _allKeys];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UISDeviceContext.m", 60, @"Key '%@' isn't valid", v5 object file lineNumber description];
  }
  double v8 = [(NSDictionary *)self->_deviceInfoKeysToValues objectForKeyedSubscript:v5];
  BOOL v9 = v8 != 0;

  return v9;
}

- (BOOL)deviceInfoBoolValueForKey:(id)a3
{
  id v5 = a3;
  if (![(UISDeviceContext *)self _isDeviceInfoType:2 appropriateForKey:v5])
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UISDeviceContext.m", 79, @"%s values aren't valid for the key '%@'", "Integer", v5 object file lineNumber description];
  }
  id v6 = [(NSDictionary *)self->_deviceInfoKeysToValues objectForKeyedSubscript:v5];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)deviceInfoStringValueForKey:(id)a3
{
  id v5 = a3;
  if (![(UISDeviceContext *)self _isDeviceInfoType:4 appropriateForKey:v5])
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UISDeviceContext.m", 84, @"%s values aren't valid for the key '%@'", "String", v5 object file lineNumber description];
  }
  id v6 = [(NSDictionary *)self->_deviceInfoKeysToValues objectForKeyedSubscript:v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [UISMutableDeviceContext alloc];
  deviceInfoKeysToValues = self->_deviceInfoKeysToValues;
  return [(UISDeviceContext *)v4 initWithDeviceInfoValues:deviceInfoKeysToValues];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UISDeviceContext *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(UISDeviceContext *)self _rawDeviceInfoKeysToValues];
    char v7 = [(UISDeviceContext *)v5 _rawDeviceInfoKeysToValues];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
LABEL_5:
    char v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  return ~[(NSDictionary *)self->_deviceInfoKeysToValues hash];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_deviceInfoKeysToValues withName:@"DeviceInfoKeysToValues"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (id)_rawDeviceInfoKeysToValues
{
  return self->_deviceInfoKeysToValues;
}

@end