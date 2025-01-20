@interface LNEntityMetadata(Strings)
+ (BOOL)wf_addDescriptionMethodsToClass:()Strings withEntityType:appBundleIdentifier:;
+ (id)wf_descriptionClassForEntityType:()Strings appBundleIdentifier:;
@end

@implementation LNEntityMetadata(Strings)

+ (BOOL)wf_addDescriptionMethodsToClass:()Strings withEntityType:appBundleIdentifier:
{
  id v8 = a4;
  id v9 = a5;
  Class = object_getClass(a3);
  v11 = objc_msgSend(a1, "wf_descriptionClassForEntityType:appBundleIdentifier:", v8, v9);
  if (v11)
  {
    v12 = object_getClass(v11);
    unsigned int outCount = 0;
    v13 = class_copyMethodList(v12, &outCount);
    v14 = v13;
    uint64_t v15 = outCount;
    if (outCount)
    {
      LOBYTE(v16) = 1;
      v17 = v13;
      do
      {
        if (v16)
        {
          Name = method_getName(*v17);
          Implementation = method_getImplementation(*v17);
          TypeEncoding = method_getTypeEncoding(*v17);
          BOOL v16 = class_addMethod(Class, Name, Implementation, TypeEncoding);
          uint64_t v15 = outCount;
        }
        else
        {
          BOOL v16 = 0;
        }
        ++v17;
      }
      while (v17 != &v14[v15]);
    }
    else
    {
      BOOL v16 = 1;
    }
    free(v14);
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

+ (id)wf_descriptionClassForEntityType:()Strings appBundleIdentifier:
{
  uint64_t v5 = wf_descriptionClassForEntityType_appBundleIdentifier__token;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&wf_descriptionClassForEntityType_appBundleIdentifier__token, &__block_literal_global_18523);
  }
  id v8 = [(id)wf_descriptionClassForEntityType_appBundleIdentifier__descriptionClassForEntityTypeByAppBundleIdentifier objectForKeyedSubscript:v6];

  id v9 = [v8 objectForKeyedSubscript:v7];

  return v9;
}

@end