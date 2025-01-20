@interface VisionCoreRuntimeUtilities
+ (BOOL)item:(id)a3 overridesClassSelector:(SEL)a4;
+ (BOOL)item:(id)a3 overridesSelector:(SEL)a4;
+ (BOOL)linkTimeOrRunTimeAtLeastVersion:(int)a3;
+ (BOOL)linkTimeOrRunTimeBeforeVersion:(int)a3;
+ (id)_leafClassesFromSubclasses:(uint64_t)a3 withRootClass:;
+ (id)_subclassesOfClass:(uint64_t)a3 excludingRootClass:(void *)a4 passingTest:;
+ (id)allSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingClassSelector:(SEL)a5;
+ (id)allSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingSelector:(SEL)a5;
+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4;
+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingClassSelector:(SEL)a5;
+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingSelector:(SEL)a5;
+ (id)signatureForItem:(id)a3 selector:(SEL)a4;
+ (int)linkTimeVersion;
+ (int)runTimeVersion;
+ (void)enumerateSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 usingBlock:(id)a5;
@end

@implementation VisionCoreRuntimeUtilities

+ (BOOL)item:(id)a3 overridesSelector:(SEL)a4
{
  v5 = (objc_class *)a3;
  v6 = v5;
  if (v5)
  {
    BOOL isClass = object_isClass(v5);
    Class = v6;
    if (!isClass) {
      Class = object_getClass(v6);
    }
    BOOL v9 = _classImplementsSelector(Class, a4);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)item:(id)a3 overridesClassSelector:(SEL)a4
{
  id v5 = a3;
  v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  Class = (objc_class *)v5;
  if (!object_isClass(v5))
  {
    Class = object_getClass(v6);
    if (!Class) {
      goto LABEL_8;
    }
  }
  if (!class_isMetaClass(Class))
  {
    Name = class_getName(Class);
    objc_getMetaClass(Name);
    v8 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
    if (v8) {
      goto LABEL_7;
    }
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  v8 = Class;
LABEL_7:
  BOOL v10 = _classImplementsSelector(v8, a4);
LABEL_9:

  return v10;
}

+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingClassSelector:(SEL)a5
{
  v7 = +[VisionCoreRuntimeUtilities allSubclassesOfClass:a3 excludingRootClass:a4 overridingClassSelector:a5];
  v8 = +[VisionCoreRuntimeUtilities _leafClassesFromSubclasses:withRootClass:]((uint64_t)a1, v7, (uint64_t)a3);

  return v8;
}

+ (id)_leafClassesFromSubclasses:(uint64_t)a3 withRootClass:
{
  id v4 = a2;
  self;
  unint64_t v5 = [v4 count];
  if (v5 <= 1)
  {
    v6 = (void *)[v4 copy];
    goto LABEL_15;
  }
  unint64_t v7 = v5;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", 0, v5);
  for (uint64_t i = 0; i != v7; ++i)
  {
    if (![v8 containsIndex:i]) {
      continue;
    }
    BOOL v10 = (void *)[v4 objectAtIndexedSubscript:i];
    int v11 = [v10 isSubclassOfClass:a3];
    uint64_t v12 = i;
    if (v11)
    {
      uint64_t v13 = objc_msgSend(v10, "superclass", i);
      if (!v13) {
        continue;
      }
      v14 = (void *)v13;
      while (1)
      {
        uint64_t v15 = [v4 indexOfObject:v14];
        if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        v14 = (void *)[v14 superclass];
        if (!v14) {
          goto LABEL_13;
        }
      }
      uint64_t v12 = v15;
    }
    [v8 removeIndex:v12];
LABEL_13:
    ;
  }
  v6 = [v4 objectsAtIndexes:v8];

LABEL_15:
  return v6;
}

+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingSelector:(SEL)a5
{
  unint64_t v7 = +[VisionCoreRuntimeUtilities allSubclassesOfClass:a3 excludingRootClass:a4 overridingSelector:a5];
  v8 = +[VisionCoreRuntimeUtilities _leafClassesFromSubclasses:withRootClass:]((uint64_t)a1, v7, (uint64_t)a3);

  return v8;
}

+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4
{
  v6 = +[VisionCoreRuntimeUtilities _subclassesOfClass:excludingRootClass:passingTest:]((uint64_t)a1, (uint64_t)a3, a4, 0);
  unint64_t v7 = +[VisionCoreRuntimeUtilities _leafClassesFromSubclasses:withRootClass:]((uint64_t)a1, v6, (uint64_t)a3);

  return v7;
}

+ (id)_subclassesOfClass:(uint64_t)a3 excludingRootClass:(void *)a4 passingTest:
{
  id v6 = a4;
  unint64_t v7 = self;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__VisionCoreRuntimeUtilities__subclassesOfClass_excludingRootClass_passingTest___block_invoke;
  v14[3] = &unk_26488B568;
  id v16 = v6;
  id v9 = v8;
  id v15 = v9;
  id v10 = v6;
  [v7 enumerateSubclassesOfClass:a2 excludingRootClass:a3 usingBlock:v14];
  int v11 = v15;
  id v12 = v9;

  return v12;
}

uint64_t __80__VisionCoreRuntimeUtilities__subclassesOfClass_excludingRootClass_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4 || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2), result))
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 addObject:a2];
  }
  return result;
}

+ (id)allSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingClassSelector:(SEL)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__VisionCoreRuntimeUtilities_allSubclassesOfClass_excludingRootClass_overridingClassSelector___block_invoke;
  v7[3] = &__block_descriptor_40_e12_B24__0_8_B16l;
  v7[4] = a5;
  unint64_t v5 = +[VisionCoreRuntimeUtilities _subclassesOfClass:excludingRootClass:passingTest:]((uint64_t)a1, (uint64_t)a3, a4, v7);
  return v5;
}

BOOL __94__VisionCoreRuntimeUtilities_allSubclassesOfClass_excludingRootClass_overridingClassSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VisionCoreRuntimeUtilities item:a2 overridesClassSelector:*(void *)(a1 + 32)];
}

+ (id)allSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingSelector:(SEL)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__VisionCoreRuntimeUtilities_allSubclassesOfClass_excludingRootClass_overridingSelector___block_invoke;
  v7[3] = &__block_descriptor_40_e12_B24__0_8_B16l;
  v7[4] = a5;
  unint64_t v5 = +[VisionCoreRuntimeUtilities _subclassesOfClass:excludingRootClass:passingTest:]((uint64_t)a1, (uint64_t)a3, a4, v7);
  return v5;
}

BOOL __89__VisionCoreRuntimeUtilities_allSubclassesOfClass_excludingRootClass_overridingSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VisionCoreRuntimeUtilities item:a2 overridesSelector:*(void *)(a1 + 32)];
}

+ (void)enumerateSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = v7;
  if (v5)
  {
    id v9 = (void *)MEMORY[0x230F41C60](v7);
  }
  else
  {
    Superclass = class_getSuperclass(a3);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __87__VisionCoreRuntimeUtilities_enumerateSubclassesOfClass_excludingRootClass_usingBlock___block_invoke;
    v20[3] = &unk_26488B590;
    Class v22 = a3;
    id v21 = v8;
    id v9 = (void *)MEMORY[0x230F41C60](v20);

    a3 = Superclass;
  }
  id v11 = v9;
  unsigned int outCount = 0;
  id v12 = objc_copyImageNames(&outCount);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = ___enumerateProcessSubclasses_block_invoke;
    v23[3] = &unk_26488B5D8;
    id v24 = v11;
    v25 = &v26;
    v14 = (void *)MEMORY[0x230F41C60](v23);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        if (*((unsigned char *)v27 + 24)) {
          break;
        }
        id v16 = v13[i];
        id v17 = v14;
        if (v16)
        {
          v18 = dlopen(v16, 16);
          v19 = v18;
          if (v18)
          {
            objc_enumerateClasses(v18, 0, 0, a3, v17);
            dlclose(v19);
          }
        }
      }
    }

    _Block_object_dispose(&v26, 8);
    free(v13);
  }
}

Class __87__VisionCoreRuntimeUtilities_enumerateSubclassesOfClass_excludingRootClass_usingBlock___block_invoke(Class result, Class cls)
{
  if (cls)
  {
    Class v2 = result;
    v3 = (objc_class *)*((void *)result + 5);
    if (v3)
    {
      uint64_t result = cls;
      while (result != v3)
      {
        uint64_t result = class_getSuperclass(result);
        if (!result) {
          return result;
        }
      }
      uint64_t v4 = *(uint64_t (**)(void))(*((void *)v2 + 4) + 16);
      return (Class)v4();
    }
  }
  return result;
}

+ (id)signatureForItem:(id)a3 selector:(SEL)a4
{
  id v5 = a3;
  BOOL isClass = object_isClass(v5);
  Class = object_getClass(v5);

  id v8 = [NSString alloc];
  id v9 = NSStringFromClass(Class);
  id v10 = NSStringFromSelector(a4);
  uint64_t v11 = 45;
  if (isClass) {
    uint64_t v11 = 43;
  }
  id v12 = (void *)[v8 initWithFormat:@"%c[%@ %@]", v11, v9, v10];

  return v12;
}

+ (BOOL)linkTimeOrRunTimeAtLeastVersion:(int)a3
{
  int v5 = [a1 linkTimeVersion];
  if (v5 == -1) {
    int v5 = [a1 runTimeVersion];
  }
  return v5 > a3;
}

+ (BOOL)linkTimeOrRunTimeBeforeVersion:(int)a3
{
  int v5 = [a1 linkTimeVersion];
  if (v5 == -1) {
    int v5 = [a1 runTimeVersion];
  }
  return v5 < a3;
}

+ (int)runTimeVersion
{
  if (runTimeVersion_onceToken != -1) {
    dispatch_once(&runTimeVersion_onceToken, &__block_literal_global_5);
  }
  return runTimeVersion_version;
}

uint64_t __44__VisionCoreRuntimeUtilities_runTimeVersion__block_invoke()
{
  uint64_t result = NSVersionOfRunTimeLibrary("VisionCore");
  runTimeVersion_version = result;
  return result;
}

+ (int)linkTimeVersion
{
  if (linkTimeVersion_onceToken != -1) {
    dispatch_once(&linkTimeVersion_onceToken, &__block_literal_global_2713);
  }
  return linkTimeVersion_version;
}

uint64_t __45__VisionCoreRuntimeUtilities_linkTimeVersion__block_invoke()
{
  uint64_t result = NSVersionOfLinkTimeLibrary("VisionCore");
  linkTimeVersion_version = result;
  return result;
}

@end