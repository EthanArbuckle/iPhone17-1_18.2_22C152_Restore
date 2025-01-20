@interface RBJetsamProperties
+ (id)jetsamPropertiesForProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6;
- (BOOL)isFreezerEligible;
- (BOOL)isValid;
- (id)_altKeyForCategory:(id)a3 strength:(unsigned __int8)a4;
- (id)_defaultKeyForCategory:(id)a3 strength:(unsigned __int8)a4;
- (id)_directPropertyDescription:(id)a3;
- (id)_initWithProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6;
- (id)_keyForCategory:(id)a3 strength:(unsigned __int8)a4;
- (id)_propertiesDescription;
- (id)description;
- (id)getValueFrom:(id)a3 forKey:(id)a4;
- (int)_integerLimitValue:(id)a3;
- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4;
- (unsigned)_altStrength:(unsigned __int8)a3;
- (void)_setLimitFor:(id)a3 strength:(unsigned __int8)a4 toValue:(id)a5;
@end

@implementation RBJetsamProperties

- (BOOL)isValid
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_globalProperties, 0);
  objc_storeStrong(&self->_memoryLimitCategories, 0);
}

- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned int v7 = *a4;
  uint64_t v8 = [(RBJetsamProperties *)self _altStrength:*a4];
  if ([v6 isEqual:@"Active"]) {
    char v9 = 1;
  }
  else {
    char v9 = [v6 isEqual:@"Inactive"];
  }
  if (v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 2;
  }
  v11 = [(RBJetsamProperties *)self _keyForCategory:v6 strength:v10];
  v12 = [(RBJetsamProperties *)self getValueFrom:self->_memoryLimitCategories forKey:v11];
  v13 = v12;
  if (v12 && [v12 longValue] != -1)
  {
    *a4 = v10;
    int taskLimit = [(RBJetsamProperties *)self _integerLimitValue:v13];

    goto LABEL_15;
  }
  v15 = [(RBJetsamProperties *)self _keyForCategory:v6 strength:v8];

  v16 = [(RBJetsamProperties *)self getValueFrom:self->_memoryLimitCategories forKey:v15];

  if (v16)
  {
    *a4 = v8;
    int taskLimit = [(RBJetsamProperties *)self _integerLimitValue:v16];

LABEL_14:
    v11 = v15;
    goto LABEL_15;
  }
  if (v13)
  {
LABEL_13:
    int taskLimit = self->_taskLimit;
    goto LABEL_14;
  }
  v18 = [(RBJetsamProperties *)self _keyForCategory:v6 strength:v10];

  uint64_t v19 = [(RBJetsamProperties *)self getValueFrom:self->_globalProperties forKey:v18];
  if (v19)
  {
    v20 = (void *)v19;
    *a4 = v10;
    int taskLimit = [(RBJetsamProperties *)self _integerLimitValue:v19];

    v11 = v18;
    goto LABEL_15;
  }
  v11 = [(RBJetsamProperties *)self _keyForCategory:v6 strength:v8];

  uint64_t v21 = [(RBJetsamProperties *)self getValueFrom:self->_globalProperties forKey:v11];
  if (v21)
  {
    v22 = (void *)v21;
    *a4 = v8;
    int taskLimit = [(RBJetsamProperties *)self _integerLimitValue:v21];

    goto LABEL_15;
  }
  if (v9 & 1) != 0 || ([v6 isEqual:@"Inactive"])
  {
    v15 = v11;
    goto LABEL_13;
  }
  v23 = rbs_jetsam_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_226AB3000, v23, OS_LOG_TYPE_DEFAULT, "No JetsamProperties for this process for category '%@'", (uint8_t *)&v24, 0xCu);
  }

  int taskLimit = [(RBJetsamProperties *)self memoryLimitForCategory:@"Inactive" strength:a4];
LABEL_15:

  return taskLimit;
}

- (id)getValueFrom:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 valueForKey:v6];
LABEL_3:
    uint64_t v8 = (void *)v7;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  unint64_t v9 = [v5 unsignedLongLongValue];
  if ([v6 isEqualToString:@"InactiveHardMemoryLimit"])
  {
    if ((~v9 & 0xC0000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"InactiveSoftMemoryLimit"])
  {
    if ((v9 & 0xC0000000) == 0x80000000)
    {
LABEL_10:
      if ((v9 & 0x3FFFFFFF) == 0x3FFFFFFF) {
        uint64_t v10 = -1;
      }
      else {
        uint64_t v10 = v9 & 0x3FFFFFFF;
      }
LABEL_25:
      uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v10];
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  if ([v6 isEqualToString:@"ActiveHardMemoryLimit"])
  {
    if (v9 >> 62 != 3) {
      goto LABEL_15;
    }
LABEL_22:
    if ((v9 & 0x3FFFFFFF00000000) == 0x3FFFFFFF00000000) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = HIDWORD(v9) & 0x3FFFFFFF;
    }
    goto LABEL_25;
  }
  uint64_t v8 = 0;
  if ([v6 isEqualToString:@"ActiveSoftMemoryLimit"]
    && (v9 & 0x8000000000000000) != 0
    && (v9 & 0x4000000000000000) == 0)
  {
    goto LABEL_22;
  }
LABEL_16:

  return v8;
}

- (id)_keyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  id v4 = a3;
  id v5 = NSStringFromRBSMemoryLimitStrength();
  id v6 = (void *)[[NSString alloc] initWithFormat:@"%@%@MemoryLimit", v4, v5];

  return v6;
}

- (unsigned)_altStrength:(unsigned __int8)a3
{
  if (a3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int)_integerLimitValue:(id)a3
{
  int result = [a3 intValue];
  if (result == -1)
  {
    uint64_t v5 = 24;
  }
  else
  {
    if (result) {
      return result;
    }
    uint64_t v5 = 28;
  }
  return *(_DWORD *)((char *)&self->super.isa + v5);
}

+ (id)jetsamPropertiesForProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[RBJetsamProperties alloc] _initWithProperties:v10 globalProperties:v9 taskLimit:v7 unLimit:v6];

  return v11;
}

- (id)_initWithProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RBJetsamProperties;
  v12 = [(RBJetsamProperties *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    id memoryLimitCategories = v12->_memoryLimitCategories;
    v12->_id memoryLimitCategories = (id)v13;

    objc_storeStrong(&v12->_globalProperties, a4);
    v12->_int taskLimit = a5;
    v12->_unLimit = a6;
  }

  return v12;
}

- (BOOL)isFreezerEligible
{
  if (!self->_freezerEligibleSet)
  {
    v3 = [(RBJetsamProperties *)self getValueFrom:self->_memoryLimitCategories forKey:@"FreezerEligible"];
    if (!v3)
    {
      uint64_t v4 = [(RBJetsamProperties *)self getValueFrom:self->_globalProperties forKey:@"FreezerEligible"];
      if (v4) {
        v3 = (void *)v4;
      }
      else {
        v3 = (void *)MEMORY[0x263EFFA80];
      }
    }
    self->_freezerEligible = [v3 BOOLValue];
    self->_freezerEligibleSet = 1;
  }
  return self->_freezerEligible;
}

- (id)_altKeyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [(RBJetsamProperties *)self _altStrength:v4];
  uint64_t v7 = NSStringFromRBSMemoryLimitStrength();
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"%@%@MemoryLimit", v6, v7];

  return v8;
}

- (id)_defaultKeyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  return @"InactiveSoftMemoryLimit";
}

- (void)_setLimitFor:(id)a3 strength:(unsigned __int8)a4 toValue:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = [(RBJetsamProperties *)self _keyForCategory:a3 strength:v5];
  [self->_memoryLimitCategories setValue:v8 forKey:v9];
}

- (id)_directPropertyDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RBJetsamProperties *)self _keyForCategory:v4 strength:2];
  uint64_t v6 = [(RBJetsamProperties *)self getValueFrom:self->_memoryLimitCategories forKey:v5];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = @"\t%@SoftMemoryLimit=%lld\n";
    id v9 = v5;
LABEL_5:
    id v11 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", v8, v4, objc_msgSend(v7, "longLongValue"));

    goto LABEL_6;
  }
  id v9 = [(RBJetsamProperties *)self _keyForCategory:v4 strength:1];

  uint64_t v10 = [(RBJetsamProperties *)self getValueFrom:self->_memoryLimitCategories forKey:v9];
  if (v10)
  {
    uint64_t v7 = (void *)v10;
    id v8 = @"\t%@HardMemoryLimit=%lld\n";
    goto LABEL_5;
  }
  id v11 = &stru_26DA9D688;
LABEL_6:

  return v11;
}

- (id)_propertiesDescription
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [self->_memoryLimitCategories entriesToStringWithIndent:1 debug:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [NSString alloc];
      uint64_t v5 = [(RBJetsamProperties *)self _directPropertyDescription:@"Active"];
      uint64_t v6 = [(RBJetsamProperties *)self _directPropertyDescription:@"Inactive"];
      v3 = (void *)[v4 initWithFormat:@"%@%@", v5, v6];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t taskLimit = self->_taskLimit;
  uint64_t v6 = [(RBJetsamProperties *)self _propertiesDescription];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@| tasklimit=%d\n%@>", v4, taskLimit, v6];

  return v7;
}

@end