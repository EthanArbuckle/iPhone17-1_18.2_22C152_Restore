@interface NSObject(UIAppearanceAdditions)
+ (uint64_t)_installAppearanceSwizzlesForSetter:()UIAppearanceAdditions;
@end

@implementation NSObject(UIAppearanceAdditions)

+ (uint64_t)_installAppearanceSwizzlesForSetter:()UIAppearanceAdditions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  SEL v6 = UIAppearancePrefixedSelectorForSelectorString(a3);
  v27 = a3;
  SEL v7 = NSSelectorFromString((NSString *)a3);
  v8 = (void *)[a1 instanceMethodSignatureForSelector:v7];
  unint64_t v9 = [v8 numberOfArguments];
  if (os_variant_has_internal_diagnostics())
  {
    if (v9 <= 2)
    {
      v21 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = sel_getName(a2);
        _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "%s Not a setter!", buf, 0xCu);
      }
    }
  }
  else if (v9 <= 2)
  {
    v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_installAppearanceSwizzlesForSetter____s_category) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = sel_getName(a2);
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "%s Not a setter!", buf, 0xCu);
    }
  }
  v10 = (const char *)[v8 getArgumentTypeAtIndex:2];
  v26 = v6;
  name = v7;
  if (!strcmp(v10, "@"))
  {
    v12 = (void (*)(void))TaggingAppearanceGeneralSetterIMP;
    if (v9 == 4) {
      v12 = (void (*)(void))TaggingAppearanceObjectSetter1IMP;
    }
    BOOL v11 = v9 == 3;
    v13 = TaggingAppearanceObjectSetterIMP;
  }
  else if (!strcmp(v10, "Q") || !strcmp(v10, "q"))
  {
    BOOL v11 = v9 == 3;
    v12 = (void (*)(void))TaggingAppearanceGeneralSetterIMP;
    v13 = TaggingAppearanceIntegerSetterIMP;
  }
  else
  {
    if (strcmp(v10, "i") && strcmp(v10, "I"))
    {
      if (strcmp(v10, "d")
        && strcmp(v10, "f")
        && strcmp(v10, "{CGPoint=dd}")
        && strcmp(v10, "{CGSize=dd}")
        && strcmp(v10, "{UIOffset=dd}")
        && strcmp(v10, "{CGRect={CGPoint=dd}{CGSize=dd}}")
        && strcmp(v10, "{UIEdgeInsets=dddd}")
        && strcmp(v10, "B")
        && strcmp(v10, "c")
        && strcmp(v10, "#"))
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"*** Illegal property type, %s for appearance setter, %@", v10, v27 format];
      }
      imp = (void (*)(void))TaggingAppearanceGeneralSetterIMP;
      goto LABEL_29;
    }
    BOOL v11 = v9 == 3;
    v12 = (void (*)(void))TaggingAppearanceGeneralSetterIMP;
    v13 = TaggingAppearanceIntSetterIMP;
  }
  if (v11) {
    v12 = (void (*)(void))v13;
  }
  imp = v12;
LABEL_29:
  if (v9 >= 4)
  {
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    for (uint64_t i = 3; i != v9; ++i)
    {
      v16 = (const char *)[v8 getArgumentTypeAtIndex:i];
      if (strcmp(v16, "Q") && strcmp(v16, "q") && strcmp(v16, "i") && strcmp(v16, "I")) {
        [MEMORY[0x1E4F1CA00] raise:v14, @"*** Illegal axis type, %s, for appearance setter, %@. Expected NSInteger or NSUInteger", v16, v27 format];
      }
    }
  }
  InstanceMethod = class_getInstanceMethod((Class)a1, name);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  v19 = class_replaceMethod((Class)a1, name, imp, TypeEncoding);
  uint64_t result = class_addMethod((Class)a1, v26, v19, TypeEncoding);
  if ((result & 1) == 0) {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIAppearance.m", 877, @"setter method swizzle failed");
  }
  return result;
}

@end