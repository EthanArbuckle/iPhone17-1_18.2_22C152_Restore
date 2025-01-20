@interface NSDictionary(NFExtension)
- (id)NF_arrayForKey:()NFExtension;
- (id)NF_dataForKey:()NFExtension;
- (id)NF_dictionaryForKey:()NFExtension;
- (id)NF_numberForKey:()NFExtension;
- (id)NF_objectForKey:()NFExtension expectedClass:;
- (id)NF_stringForKey:()NFExtension;
- (id)NF_urlForKey:()NFExtension;
@end

@implementation NSDictionary(NFExtension)

- (id)NF_objectForKey:()NFExtension expectedClass:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [a1 objectForKey:v7];
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    unint64_t specific = (unint64_t)dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v12 = (void (*)(uint64_t, const char *, ...))_NFLogCustomLoggers[specific];
    if (v12)
    {
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      Class v24 = object_getClass(v8);
      uint64_t v17 = 43;
      if (!isMetaClass) {
        uint64_t v17 = 45;
      }
      v12(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected %{public}@, got %{public}@", v17, ClassName, Name, 17, v7, a4, v24);
      v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v18 = dispatch_get_specific(v10);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v19 = (id)_NFSharedLogClient[(void)v18];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(a1);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      *(_DWORD *)buf = 67110658;
      int v26 = v21;
      __int16 v27 = 2082;
      v28 = object_getClassName(a1);
      __int16 v29 = 2082;
      v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 17;
      __int16 v33 = 2114;
      id v34 = v7;
      __int16 v35 = 2114;
      uint64_t v36 = a4;
      __int16 v37 = 2114;
      Class v38 = object_getClass(v8);
      v22 = v38;
      _os_log_impl(&dword_1CA51A000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected %{public}@, got %{public}@", buf, 0x40u);
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (id)NF_dictionaryForKey:()NFExtension
{
  id v4 = a3;
  v5 = [a1 NF_objectForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)NF_arrayForKey:()NFExtension
{
  id v4 = a3;
  v5 = [a1 NF_objectForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)NF_stringForKey:()NFExtension
{
  id v4 = a3;
  v5 = [a1 NF_objectForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)NF_urlForKey:()NFExtension
{
  id v4 = a3;
  v5 = [a1 NF_objectForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)NF_dataForKey:()NFExtension
{
  id v4 = a3;
  v5 = [a1 NF_objectForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)NF_numberForKey:()NFExtension
{
  id v4 = a3;
  v5 = [a1 NF_objectForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

@end