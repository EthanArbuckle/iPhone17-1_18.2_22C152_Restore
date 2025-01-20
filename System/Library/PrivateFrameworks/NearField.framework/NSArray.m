@interface NSArray
@end

@implementation NSArray

void __43__NSArray_NFTransportService__encodeToCBOR__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && ([v3 encodeToCBOR], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v13 = [v3 description];
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v8(6, "%c[%{public}s %{public}s]:%i Invalid element type: %@", v14, ClassName, Name, 230, v13);
    }
    dispatch_get_specific(*v6);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 48));
      v19 = [v3 description];
      *(_DWORD *)buf = 67110146;
      int v21 = v16;
      __int16 v22 = 2082;
      v23 = v17;
      __int16 v24 = 2082;
      v25 = v18;
      __int16 v26 = 1024;
      int v27 = 230;
      __int16 v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_19D636000, v5, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid element type: %@", buf, 0x2Cu);
    }
  }
}

@end