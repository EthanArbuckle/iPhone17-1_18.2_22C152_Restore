@interface NSDictionary
@end

@implementation NSDictionary

void __48__NSDictionary_NFTransportService__encodeToCBOR__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && ([v5 encodeToCBOR], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) != 0
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && ([v6 encodeToCBOR], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = v9;
      [*(id *)(a1 + 40) setObject:v9 forKey:v8];
    }
    else
    {
      v25 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v27 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 48));
        v32 = [v6 description];
        uint64_t v33 = 45;
        if (isMetaClass) {
          uint64_t v33 = 43;
        }
        v27(6, "%c[%{public}s %{public}s]:%i Invalid value type: %@", v33, ClassName, Name, 289, v32);
      }
      dispatch_get_specific(*v25);
      v10 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v34 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v34)) {
          int v35 = 43;
        }
        else {
          int v35 = 45;
        }
        v36 = object_getClassName(*(id *)(a1 + 32));
        v37 = sel_getName(*(SEL *)(a1 + 48));
        v38 = [v6 description];
        *(_DWORD *)buf = 67110146;
        int v40 = v35;
        __int16 v41 = 2082;
        v42 = v36;
        __int16 v43 = 2082;
        v44 = v37;
        __int16 v45 = 1024;
        int v46 = 289;
        __int16 v47 = 2112;
        v48 = v38;
        _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid value type: %@", buf, 0x2Cu);
      }
    }
  }
  else
  {
    v11 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v12 = NFLogGetLogger();
    if (v12)
    {
      v13 = (void (*)(uint64_t, const char *, ...))v12;
      v14 = object_getClass(*(id *)(a1 + 32));
      BOOL v15 = class_isMetaClass(v14);
      v16 = object_getClassName(*(id *)(a1 + 32));
      v17 = sel_getName(*(SEL *)(a1 + 48));
      v18 = [v5 description];
      uint64_t v19 = 45;
      if (v15) {
        uint64_t v19 = 43;
      }
      v13(6, "%c[%{public}s %{public}s]:%i Invalid key type: %@", v19, v16, v17, 270, v18);
    }
    dispatch_get_specific(*v11);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      v22 = object_getClassName(*(id *)(a1 + 32));
      v23 = sel_getName(*(SEL *)(a1 + 48));
      v24 = [v5 description];
      *(_DWORD *)buf = 67110146;
      int v40 = v21;
      __int16 v41 = 2082;
      v42 = v22;
      __int16 v43 = 2082;
      v44 = v23;
      __int16 v45 = 1024;
      int v46 = 270;
      __int16 v47 = 2112;
      v48 = v24;
      _os_log_impl(&dword_19D636000, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid key type: %@", buf, 0x2Cu);
    }
  }
}

@end