@interface NFSecureElement
+ (id)cachedEmbeddedSecureElementSerialNumber:(id *)a3;
+ (id)embeddedSecureElement;
+ (id)embeddedSecureElementSerialNumber;
+ (id)embeddedSecureElementWithError:(id *)a3;
+ (id)icefallSecureElement;
+ (unsigned)supportedTechnologies;
- (BOOL)available;
- (BOOL)isInRestrictedMode;
- (BOOL)isProductionSigned;
- (BOOL)isSeshatAvailabledInRestrictedMode;
- (NSNumber)sequenceCounter;
- (NSString)eccCertificate;
- (NSString)eckaCertificate;
- (NSString)rsaCertificate;
- (NSString)serialNumber;
- (NSString)systemOSSerialNumber;
- (id)_executeOnUpdatedInstance:(id)a3;
- (id)_initWithInfo:(id)a3;
- (id)identifier;
- (id)info;
- (id)manifestQueryBlob;
- (unint64_t)OSVersion;
- (unint64_t)fullOSVersion;
- (unsigned)hwType;
- (unsigned)supportedTechnologies;
- (void)_markDirty;
- (void)_setIsInRestrictedMode:(BOOL)a3;
- (void)_setIsInRestrictedPerformanceMode:(BOOL)a3;
- (void)_updateSecureElementInfo:(id)a3;
@end

@implementation NFSecureElement

+ (id)embeddedSecureElement
{
  return +[NFSecureElement embeddedSecureElementWithError:0];
}

+ (id)embeddedSecureElementSerialNumber
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = +[NFHardwareManager sharedHardwareManager];
  id v29 = 0;
  v5 = [v4 cachedEmbeddedSecureElementSerialNumber:&v29];
  id v6 = v29;

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7 || ![v5 lengthOfBytesUsingEncoding:4])
  {
    v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i Cache misses; performs full query", v15, ClassName, Name, 66);
    }
    dispatch_get_specific(*v9);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(a1);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      v19 = object_getClassName(a1);
      v20 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v31 = v18;
      __int16 v32 = 2082;
      v33 = v19;
      __int16 v34 = 2082;
      v35 = v20;
      __int16 v36 = 1024;
      int v37 = 66;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cache misses; performs full query",
        buf,
        0x22u);
    }

    v21 = +[NFHardwareManager sharedHardwareManager];
    id v28 = v6;
    v22 = [v21 secureElementWithIdentifier:@"embedded" error:&v28];
    id v23 = v28;

    if (v23)
    {
      v8 = 0;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F1C9B8];
      v25 = [v22 serialNumber];
      v8 = objc_msgSend(v24, "NF_dataWithHexString:", v25);
    }
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", v5);
  }

  return v8;
}

- (id)_initWithInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureElement;
  id v6 = [(NFSecureElement *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_info, a3);
  }

  return v7;
}

+ (id)embeddedSecureElementWithError:(id *)a3
{
  v4 = +[NFHardwareManager sharedHardwareManager];
  id v5 = [v4 secureElementWithIdentifier:@"embedded" error:a3];

  return v5;
}

- (id)info
{
  return [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_10];
}

+ (id)icefallSecureElement
{
  return 0;
}

+ (id)cachedEmbeddedSecureElementSerialNumber:(id *)a3
{
  v4 = +[NFHardwareManager sharedHardwareManager];
  id v5 = [v4 cachedEmbeddedSecureElementSerialNumber:a3];

  return v5;
}

+ (unsigned)supportedTechnologies
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = +[NFHardwareManager sharedHardwareManager];
  v3 = [v2 secureElementsWithError:0];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v10 + 1) + 8 * i) supportedTechnologies];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

id __23__NFSecureElement_info__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 8);
}

- (id)identifier
{
  return [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_21];
}

uint64_t __29__NFSecureElement_identifier__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) identifier];
}

- (NSString)serialNumber
{
  return (NSString *)[(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_23];
}

uint64_t __31__NFSecureElement_serialNumber__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) serialNumber];
}

- (NSString)systemOSSerialNumber
{
  return (NSString *)[(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_25];
}

uint64_t __39__NFSecureElement_systemOSSerialNumber__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) systemOSSerialNumber];
}

- (NSString)rsaCertificate
{
  return (NSString *)[(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_27];
}

uint64_t __33__NFSecureElement_rsaCertificate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) rsaCertificate];
}

- (NSString)eccCertificate
{
  return (NSString *)[(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_29];
}

uint64_t __33__NFSecureElement_eccCertificate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) ecdsaCertificate];
}

- (NSString)eckaCertificate
{
  return (NSString *)[(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_31_0];
}

uint64_t __34__NFSecureElement_eckaCertificate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) eckaCertificate];
}

- (BOOL)isProductionSigned
{
  v2 = [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_34];
  char v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __37__NFSecureElement_isProductionSigned__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = [*(id *)(a2 + 8) signingKeyType] == 2;
  char v3 = NSNumber;
  return [v3 numberWithBool:v2];
}

- (BOOL)isInRestrictedMode
{
  BOOL v2 = [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_37];
  char v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __37__NFSecureElement_isInRestrictedMode__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = NSNumber;
  uint64_t v3 = [*(id *)(a2 + 8) restrictedMode];
  return [v2 numberWithBool:v3];
}

- (unint64_t)OSVersion
{
  BOOL v2 = [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_39];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

id __28__NFSecureElement_OSVersion__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (objc_class *)NSNumber;
  unint64_t v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = (void *)v3[1];

  unsigned int v6 = objc_msgSend(v4, "initWithUnsignedInteger:", objc_msgSend(v5, "OSVersion"));
  return v6;
}

- (unint64_t)fullOSVersion
{
  BOOL v2 = [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_41_0];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

id __32__NFSecureElement_fullOSVersion__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (objc_class *)NSNumber;
  unint64_t v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = (void *)v3[1];

  unsigned int v6 = objc_msgSend(v4, "initWithUnsignedInteger:", objc_msgSend(v5, "fullOSVersion"));
  return v6;
}

- (NSNumber)sequenceCounter
{
  return (NSNumber *)[(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_43];
}

uint64_t __34__NFSecureElement_sequenceCounter__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) sequenceCounter];
}

- (BOOL)available
{
  BOOL v2 = [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_45_0];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __28__NFSecureElement_available__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = a2;
  if ([v2[1] jcopTooOld]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2[1] osUpdateMode] ^ 1;
  }
  id v4 = [NSNumber numberWithBool:v3];

  return v4;
}

- (unsigned)supportedTechnologies
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  char v3 = [(NFHardwareSecureElementInfo *)v2->_info supportedTechnologies];
  int v4 = [(NFHardwareSecureElementInfo *)v2->_info supportedTechnologies] & 2 | v3 & 1;
  int v5 = [(NFHardwareSecureElementInfo *)v2->_info supportedTechnologies] & 4;
  unsigned int v6 = v4 | v5 | [(NFHardwareSecureElementInfo *)v2->_info supportedTechnologies] & 8;
  objc_sync_exit(v2);

  return v6;
}

- (id)_executeOnUpdatedInstance:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v5 = (void (**)(id, id))a3;
  unsigned int v6 = self;
  objc_sync_enter(v6);
  if (v6->_isDirty)
  {
    objc_sync_exit(v6);

    uint64_t v7 = +[NFHardwareManager sharedHardwareManager];
    char v8 = [v7 refreshSecureElementsWithError:0];

    objc_super v9 = v6;
    objc_sync_enter(v9);
    if ((v8 & 1) == 0)
    {
      long long v10 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        long long v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v9);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v9);
        Name = sel_getName(a2);
        uint64_t v16 = 45;
        if (isMetaClass) {
          uint64_t v16 = 43;
        }
        v12(4, "%c[%{public}s %{public}s]:%i Dirty update failed; reverted to last known values",
          v16,
          ClassName,
          Name,
          216);
      }
      dispatch_get_specific(*v10);
      v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = object_getClass(v9);
        if (class_isMetaClass(v18)) {
          int v19 = 43;
        }
        else {
          int v19 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v24 = v19;
        __int16 v25 = 2082;
        v26 = object_getClassName(v9);
        __int16 v27 = 2082;
        id v28 = sel_getName(a2);
        __int16 v29 = 1024;
        int v30 = 216;
        _os_log_impl(&dword_19D636000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Dirty update failed; reverted to last known values",
          buf,
          0x22u);
      }

      v6->_isDirty = 1;
    }
    v20 = v5[2](v5, v9);
    objc_sync_exit(v9);
  }
  else
  {
    v20 = v5[2](v5, v6);
    objc_sync_exit(v6);
  }
  return v20;
}

- (void)_setIsInRestrictedMode:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  [(NFHardwareSecureElementInfo *)obj->_info _setIsInRestrictedMode:v3];
  objc_sync_exit(obj);
}

- (void)_setIsInRestrictedPerformanceMode:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  [(NFHardwareSecureElementInfo *)obj->_info _setIsInRestrictedMode:v3];
  objc_sync_exit(obj);
}

- (void)_markDirty
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isDirty = 1;
  objc_sync_exit(obj);
}

- (void)_updateSecureElementInfo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v5 = (NFHardwareSecureElementInfo *)a3;
  unsigned int v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    char v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i Info updated", v12, ClassName, Name, 246);
  }
  dispatch_get_specific(*v6);
  long long v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v20 = v15;
    __int16 v21 = 2082;
    v22 = object_getClassName(self);
    __int16 v23 = 2082;
    int v24 = sel_getName(a2);
    __int16 v25 = 1024;
    int v26 = 246;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Info updated", buf, 0x22u);
  }

  uint64_t v16 = self;
  objc_sync_enter(v16);
  info = v16->_info;
  v16->_info = v5;

  v16->_isDirty = 0;
  objc_sync_exit(v16);
}

- (id)manifestQueryBlob
{
  return [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_50_0];
}

id __36__NFSecureElement_manifestQueryBlob__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = a2;
  if ([v2[1] personalisable])
  {
    BOOL v3 = [v2[1] manifestQuery];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (unsigned)hwType
{
  BOOL v2 = [(NFSecureElement *)self _executeOnUpdatedInstance:&__block_literal_global_52];
  uint64_t v3 = [v2 unsignedIntegerValue];
  if (v3 == 6)
  {
    unsigned int v6 = 5;
  }
  else if (v3 == 2)
  {
    int v4 = +[NFHardwareManager sharedHardwareManager];
    int v5 = [v4 controllerInfo];

    if ((unint64_t)[v5 siliconName] <= 6) {
      unsigned int v6 = 3;
    }
    else {
      unsigned int v6 = 4;
    }
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

uint64_t __25__NFSecureElement_hwType__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = NSNumber;
  uint64_t v3 = [*(id *)(a2 + 8) seType];
  return [v2 numberWithUnsignedInteger:v3];
}

- (BOOL)isSeshatAvailabledInRestrictedMode
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NFSecureElement *)v2 sequenceCounter];
  unsigned int v4 = [v3 unsignedIntValue];

  unsigned int v5 = [(NFSecureElement *)v2 hwType];
  BOOL v6 = v5 != 3 || v4 > 0x38B;
  if (v5 == 4) {
    BOOL v6 = v4 > 0x48B;
  }
  BOOL v7 = v5 >= 3 && v6;
  objc_sync_exit(v2);

  return v7;
}

- (void).cxx_destruct
{
}

@end