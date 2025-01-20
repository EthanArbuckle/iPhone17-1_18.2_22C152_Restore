@interface NFPowerAssertion
+ (id)sharedPowerAssertion;
- (BOOL)enableDebug;
- (NFPowerAssertion)init;
- (id)assertionHolders;
- (id)dumpState;
- (void)holdPowerAssertion:(id)a3;
- (void)holdPowerAssertion:(id)a3 onBehalfOf:(int)a4;
- (void)releasePowerAssertion:(id)a3;
- (void)releasePowerAssertion:(id)a3 logFaultOnOverRelease:(BOOL)a4;
- (void)setEnableDebug:(BOOL)a3;
@end

@implementation NFPowerAssertion

- (void)holdPowerAssertion:(id)a3
{
}

- (void)releasePowerAssertion:(id)a3
{
}

- (void)holdPowerAssertion:(id)a3 onBehalfOf:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v79[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  obj = self->_assertionHolders;
  objc_sync_enter(obj);
  v7 = [(NSMutableDictionary *)self->_assertionHolders objectForKey:v6];
  if (!v7) {
    v7 = objc_opt_new();
  }
  IOPMAssertionID AssertionID = 0;
  id v8 = [NSString alloc];
  v9 = [MEMORY[0x1E4F28F80] processInfo];
  v10 = [v9 processName];
  v64 = (void *)[v8 initWithFormat:@"%@[%@]", v10, v6];

  v11 = objc_opt_new();
  v78[0] = @"AssertType";
  v78[1] = @"AssertName";
  v79[0] = @"PreventUserIdleSystemSleep";
  v79[1] = v64;
  v78[2] = @"AssertLevel";
  v79[2] = &unk_1F24D1FA0;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:3];
  [v11 addEntriesFromDictionary:v12];

  if (v4 != -1)
  {
    v13 = [NSNumber numberWithInt:v4];
    [v11 setValue:v13 forKey:@"AssertionOnBehalfOfPID"];
  }
  uint64_t v14 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v11, &AssertionID);
  if (!v14)
  {
    if (![(NSMutableDictionary *)self->_assertionHolders count])
    {
      v28 = (OS_os_transaction *)os_transaction_create();
      powerAssertTransaction = self->_powerAssertTransaction;
      self->_powerAssertTransaction = v28;
    }
    v61 = [NSNumber numberWithUnsignedLong:AssertionID];
    [v7 addObject:v61];
    [(NSMutableDictionary *)self->_assertionHolders setObject:v7 forKeyedSubscript:v6];
    if (self->_enableDebug)
    {
      v30 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4) {
        goto LABEL_52;
      }
      v32 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v32)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v34 = 43;
        }
        else {
          uint64_t v34 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v32(6, "%c[%{public}s %{public}s]:%i opened assertion: counter: %lu id: %{public}@", v34, ClassName, Name, 113, [v7 count], v6);
        v30 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v37 = dispatch_get_specific(v30);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v38 = (id)_NFSharedLogClient[(void)v37];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = object_getClass(self);
        if (class_isMetaClass(v39)) {
          int v40 = 43;
        }
        else {
          int v40 = 45;
        }
        v41 = object_getClassName(self);
        v42 = sel_getName(a2);
        uint64_t v43 = [v7 count];
        *(_DWORD *)buf = 67110402;
        int v67 = v40;
        __int16 v68 = 2082;
        v69 = v41;
        __int16 v70 = 2082;
        v71 = v42;
        __int16 v72 = 1024;
        int v73 = 113;
        __int16 v74 = 2048;
        uint64_t v75 = v43;
        __int16 v76 = 2114;
        id v77 = v6;
        _os_log_impl(&dword_1CA51A000, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i opened assertion: counter: %lu id: %{public}@", buf, 0x36u);
      }

      v44 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v45 >= 4) {
LABEL_52:
      }
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      v46 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v45);
      if (v46)
      {
        v47 = object_getClass(self);
        if (class_isMetaClass(v47)) {
          uint64_t v48 = 43;
        }
        else {
          uint64_t v48 = 45;
        }
        v49 = object_getClassName(self);
        v50 = sel_getName(a2);
        v51 = [(NFPowerAssertion *)self dumpState];
        v52 = [v51 description];
        v46(6, "%c[%{public}s %{public}s]:%i all assertions: %{public}@", v48, v49, v50, 114, v52);

        v44 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v53 = dispatch_get_specific(v44);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v54 = (id)_NFSharedLogClient[(void)v53];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = object_getClass(self);
        if (class_isMetaClass(v55)) {
          int v56 = 43;
        }
        else {
          int v56 = 45;
        }
        v57 = object_getClassName(self);
        v58 = sel_getName(a2);
        v59 = [(NFPowerAssertion *)self dumpState];
        v60 = [v59 description];
        *(_DWORD *)buf = 67110146;
        int v67 = v56;
        __int16 v68 = 2082;
        v69 = v57;
        __int16 v70 = 2082;
        v71 = v58;
        __int16 v72 = 1024;
        int v73 = 114;
        __int16 v74 = 2114;
        uint64_t v75 = (uint64_t)v60;
        _os_log_impl(&dword_1CA51A000, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i all assertions: %{public}@", buf, 0x2Cu);
      }
    }

    goto LABEL_51;
  }
  v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v16 >= 4) {
    goto LABEL_52;
  }
  v17 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v16);
  if (v17)
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      uint64_t v19 = 43;
    }
    else {
      uint64_t v19 = 45;
    }
    v20 = object_getClassName(self);
    v21 = sel_getName(a2);
    v17(3, "%c[%{public}s %{public}s]:%i Failed with 0x%x", v19, v20, v21, 97, v14);
    v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v22 = dispatch_get_specific(v15);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v23 = (id)_NFSharedLogClient[(void)v22];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = object_getClass(self);
    if (class_isMetaClass(v24)) {
      int v25 = 43;
    }
    else {
      int v25 = 45;
    }
    v26 = object_getClassName(self);
    v27 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v67 = v25;
    __int16 v68 = 2082;
    v69 = v26;
    __int16 v70 = 2082;
    v71 = v27;
    __int16 v72 = 1024;
    int v73 = 97;
    __int16 v74 = 1024;
    LODWORD(v75) = v14;
    _os_log_impl(&dword_1CA51A000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed with 0x%x", buf, 0x28u);
  }

  NFSimulateCrash(57005, (uint64_t)"PM assertion create failure");
LABEL_51:

  objc_sync_exit(obj);
}

- (void)releasePowerAssertion:(id)a3 logFaultOnOverRelease:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  obj = self->_assertionHolders;
  objc_sync_enter(obj);
  id v8 = [(NSMutableDictionary *)self->_assertionHolders objectForKey:v7];
  v9 = v8;
  if (!v8)
  {
    if (NFIsInternalBuild_onceToken != -1) {
      dispatch_once(&NFIsInternalBuild_onceToken, &__block_literal_global_73);
    }
    if (NFIsInternalBuild_bVal && v4)
    {
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v10 = (id)_NFSharedLogClient[0];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_92;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)v78 = v7;
LABEL_64:
      _os_log_fault_impl(&dword_1CA51A000, v10, OS_LOG_TYPE_FAULT, "%{public}@ does not hold assertion", buf, 0xCu);
      goto LABEL_92;
    }
    v54 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      goto LABEL_96;
    }
    int v56 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v56)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v58 = 43;
      }
      else {
        uint64_t v58 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v56(3, "%c[%{public}s %{public}s]:%i %{public}@ does not hold assertion", v58, ClassName, Name, 141, v7);
      v54 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v61 = dispatch_get_specific(v54);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v10 = (id)_NFSharedLogClient[(void)v61];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_92;
    }
    v62 = object_getClass(self);
    if (class_isMetaClass(v62)) {
      int v63 = 43;
    }
    else {
      int v63 = 45;
    }
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v78 = v63;
    *(_WORD *)&v78[4] = 2082;
    *(void *)&v78[6] = object_getClassName(self);
    __int16 v79 = 2082;
    v80 = sel_getName(a2);
    __int16 v81 = 1024;
    int v82 = 141;
    __int16 v83 = 2114;
    uint64_t v84 = (uint64_t)v7;
LABEL_91:
    _os_log_impl(&dword_1CA51A000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ does not hold assertion", buf, 0x2Cu);
    goto LABEL_92;
  }
  if ([v8 count])
  {
    v10 = [v9 lastObject];
    uint64_t v11 = IOPMAssertionRelease([v10 unsignedLongValue]);
    sel = a2;
    if (v11)
    {
      v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v13 >= 4) {
        goto LABEL_96;
      }
      uint64_t v14 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v13);
      if (v14)
      {
        v15 = object_getClass(self);
        if (class_isMetaClass(v15)) {
          uint64_t v16 = 43;
        }
        else {
          uint64_t v16 = 45;
        }
        v17 = object_getClassName(self);
        v18 = sel_getName(a2);
        v14(3, "%c[%{public}s %{public}s]:%i Failed with 0x%x", v16, v17, v18, 162, v11);
        v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      uint64_t v19 = dispatch_get_specific(v12);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v20 = (id)_NFSharedLogClient[(void)v19];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = object_getClass(self);
        if (class_isMetaClass(v21)) {
          int v22 = 43;
        }
        else {
          int v22 = 45;
        }
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v78 = v22;
        *(_WORD *)&v78[4] = 2082;
        *(void *)&v78[6] = object_getClassName(self);
        __int16 v79 = 2082;
        v80 = sel_getName(a2);
        __int16 v81 = 1024;
        int v82 = 162;
        __int16 v83 = 1024;
        LODWORD(v84) = v11;
        _os_log_impl(&dword_1CA51A000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed with 0x%x", buf, 0x28u);
      }

      NFSimulateCrash(57005, (uint64_t)"PM assertion release failure");
    }
    [v9 removeLastObject];
    if (![v9 count]) {
      [(NSMutableDictionary *)self->_assertionHolders removeObjectForKey:v7];
    }
    if (self->_enableDebug)
    {
      v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v24 < 4)
      {
        int v25 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v24);
        if (v25)
        {
          v26 = object_getClass(self);
          if (class_isMetaClass(v26)) {
            uint64_t v27 = 43;
          }
          else {
            uint64_t v27 = 45;
          }
          v28 = object_getClassName(self);
          v29 = sel_getName(a2);
          v25(6, "%c[%{public}s %{public}s]:%i released assertion: counter: %lu id: %{public}@", v27, v28, v29, 174, [v9 count], v7);
          v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v30 = dispatch_get_specific(v23);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v31 = (id)_NFSharedLogClient[(void)v30];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = object_getClass(self);
          if (class_isMetaClass(v32)) {
            int v33 = 43;
          }
          else {
            int v33 = 45;
          }
          uint64_t v34 = object_getClassName(self);
          v35 = sel_getName(a2);
          uint64_t v36 = [v9 count];
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v78 = v33;
          *(_WORD *)&v78[4] = 2082;
          *(void *)&v78[6] = v34;
          __int16 v79 = 2082;
          v80 = v35;
          __int16 v81 = 1024;
          int v82 = 174;
          __int16 v83 = 2048;
          uint64_t v84 = v36;
          __int16 v85 = 2114;
          id v86 = v7;
          _os_log_impl(&dword_1CA51A000, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i released assertion: counter: %lu id: %{public}@", buf, 0x36u);
        }

        v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v38 < 4)
        {
          v39 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v38);
          if (v39)
          {
            int v40 = object_getClass(self);
            if (class_isMetaClass(v40)) {
              uint64_t v41 = 43;
            }
            else {
              uint64_t v41 = 45;
            }
            v42 = object_getClassName(self);
            uint64_t v43 = sel_getName(sel);
            v44 = [(NFPowerAssertion *)self dumpState];
            v45 = [v44 description];
            v39(6, "%c[%{public}s %{public}s]:%i all assertions: %{public}@", v41, v42, v43, 175, v45);

            v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v46 = dispatch_get_specific(v37);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v47 = (id)_NFSharedLogClient[(void)v46];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v48 = object_getClass(self);
            if (class_isMetaClass(v48)) {
              int v49 = 43;
            }
            else {
              int v49 = 45;
            }
            v50 = object_getClassName(self);
            v51 = sel_getName(sel);
            v52 = [(NFPowerAssertion *)self dumpState];
            v53 = [v52 description];
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v78 = v49;
            *(_WORD *)&v78[4] = 2082;
            *(void *)&v78[6] = v50;
            __int16 v79 = 2082;
            v80 = v51;
            __int16 v81 = 1024;
            int v82 = 175;
            __int16 v83 = 2114;
            uint64_t v84 = (uint64_t)v53;
            _os_log_impl(&dword_1CA51A000, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i all assertions: %{public}@", buf, 0x2Cu);
          }
          goto LABEL_92;
        }
      }
LABEL_96:
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    goto LABEL_92;
  }
  [(NSMutableDictionary *)self->_assertionHolders removeObjectForKey:v7];
  if (NFIsInternalBuild_onceToken != -1) {
    dispatch_once(&NFIsInternalBuild_onceToken, &__block_literal_global_73);
  }
  if (NFIsInternalBuild_bVal && v4)
  {
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v10 = (id)_NFSharedLogClient[0];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_92;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)v78 = v7;
    goto LABEL_64;
  }
  v64 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v65 >= 4) {
    goto LABEL_96;
  }
  v66 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v65);
  if (v66)
  {
    int v67 = object_getClass(self);
    if (class_isMetaClass(v67)) {
      uint64_t v68 = 43;
    }
    else {
      uint64_t v68 = 45;
    }
    v69 = object_getClassName(self);
    __int16 v70 = sel_getName(a2);
    v66(3, "%c[%{public}s %{public}s]:%i %{public}@ does not hold assertion", v68, v69, v70, 150, v7);
    v64 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v71 = dispatch_get_specific(v64);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v10 = (id)_NFSharedLogClient[(void)v71];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __int16 v72 = object_getClass(self);
    if (class_isMetaClass(v72)) {
      int v73 = 43;
    }
    else {
      int v73 = 45;
    }
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v78 = v73;
    *(_WORD *)&v78[4] = 2082;
    *(void *)&v78[6] = object_getClassName(self);
    __int16 v79 = 2082;
    v80 = sel_getName(a2);
    __int16 v81 = 1024;
    int v82 = 150;
    __int16 v83 = 2114;
    uint64_t v84 = (uint64_t)v7;
    goto LABEL_91;
  }
LABEL_92:

  if (self->_powerAssertTransaction && ![(NSMutableDictionary *)self->_assertionHolders count])
  {
    powerAssertTransaction = self->_powerAssertTransaction;
    self->_powerAssertTransaction = 0;
  }
  objc_sync_exit(obj);
}

+ (id)sharedPowerAssertion
{
  if (qword_1EB4D2848 != -1) {
    dispatch_once(&qword_1EB4D2848, &__block_literal_global_2);
  }
  v2 = (void *)_MergedGlobals_3;

  return v2;
}

uint64_t __40__NFPowerAssertion_sharedPowerAssertion__block_invoke()
{
  _MergedGlobals_3 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (NFPowerAssertion)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFPowerAssertion;
  v2 = [(NFPowerAssertion *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assertionHolders = v2->_assertionHolders;
    v2->_assertionHolders = v3;
  }
  return v2;
}

- (id)assertionHolders
{
  v3 = self->_assertionHolders;
  objc_sync_enter(v3);
  BOOL v4 = [(NFPowerAssertion *)self dumpState];
  objc_sync_exit(v3);

  return v4;
}

- (id)dumpState
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  BOOL v4 = self->_assertionHolders;
  objc_sync_enter(v4);
  assertionHolders = self->_assertionHolders;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __29__NFPowerAssertion_dumpState__block_invoke;
  v13 = &unk_1E65ABEC0;
  id v6 = v3;
  id v14 = v6;
  [(NSMutableDictionary *)assertionHolders enumerateKeysAndObjectsUsingBlock:&v10];

  objc_sync_exit(v4);
  id v16 = v6;
  v17 = @"NFPowerAssertion";
  v15 = @"holders";
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16, v15, 1, v10, v11, v12, v13];
  v18[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  return v8;
}

void __29__NFPowerAssertion_dumpState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)enableDebug
{
  return self->_enableDebug;
}

- (void)setEnableDebug:(BOOL)a3
{
  self->_enableDebug = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionHolders, 0);

  objc_storeStrong((id *)&self->_powerAssertTransaction, 0);
}

@end