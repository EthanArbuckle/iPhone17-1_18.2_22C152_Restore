@interface UIAccessibilitySafeCategory
+ (Class)safeCategoryBaseClass;
+ (Class)safeCategoryTargetClass;
+ (id)_initializeSafeCategoryFromValidationManager;
+ (id)_installLocalValidationMethodOnClassNamed:(id)a3;
+ (id)_installSafeCategoryOnClass:(Class)a3 isManaged:(BOOL)a4;
+ (id)_installSafeCategoryOnClassNamed:(id)a3 isManaged:(BOOL)a4;
+ (id)_installSafeCategoryValidationMethod;
+ (id)safeCategoryTargetClassName;
+ (void)_addCategoryMethods:(objc_method *)a3 count:(unsigned int)a4 excluding:(id)a5 toClass:(Class)a6 isClass:(BOOL)a7;
+ (void)_installSafeCategoryOnClassNamed:(id)a3;
@end

@implementation UIAccessibilitySafeCategory

+ (id)_initializeSafeCategoryFromValidationManager
{
  v3 = [a1 safeCategoryTargetClassName];
  v4 = [a1 _installSafeCategoryOnClassNamed:v3 isManaged:1];

  return v4;
}

+ (id)_installSafeCategoryOnClassNamed:(id)a3 isManaged:(BOOL)a4
{
  BOOL v4 = a4;
  Class v6 = NSClassFromString((NSString *)a3);

  return (id)[a1 _installSafeCategoryOnClass:v6 isManaged:v4];
}

+ (id)_installSafeCategoryOnClass:(Class)a3 isManaged:(BOOL)a4
{
  v5 = a3;
  if (!a3)
  {
    v12 = NSString;
    v13 = NSStringFromClass((Class)a1);
    v14 = [v12 stringWithFormat:@"Error installing %@", v13];

    goto LABEL_18;
  }
  unsigned int outCount = 0;
  v7 = class_copyMethodList((Class)a1, &outCount);
  v8 = v7;
  if (v7 && outCount)
  {
    unint64_t v9 = 0;
    v10 = &unk_26C4A4D68;
    do
    {
      if (method_getName(v8[v9]) == sel__accessibilityIgnoreSwiftInit)
      {
        uint64_t v11 = [v10 arrayByAddingObject:@"init"];

        v10 = (void *)v11;
      }
      ++v9;
    }
    while (v9 < outCount);
    [a1 _addCategoryMethods:v8 count:v10 excluding:v11 toClass:v12 isClass:v13];

    goto LABEL_11;
  }
  if (v7) {
LABEL_11:
  }
    free(v8);
  Class = object_getClass(a1);
  v16 = class_copyMethodList(Class, &outCount);
  v17 = v16;
  if (v16 && outCount)
  {
    [a1 _addCategoryMethods:v16 count:outCount excluding:&unk_26C4A4D80 toClass:object_getClass(v5) isClass:1];
LABEL_16:
    free(v17);
    goto LABEL_17;
  }
  if (v16) {
    goto LABEL_16;
  }
LABEL_17:
  v14 = 0;
LABEL_18:
  unsigned __int8 v18 = atomic_load(_installSafeCategoryOnClass_isManaged__needsPost);
  if (v18)
  {
    atomic_store(0, _installSafeCategoryOnClass_isManaged__needsPost);
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x263EFFE88], &__block_literal_global);
  }
  if (v14 && !a4)
  {
    if (v5)
    {
      v5 = NSStringFromClass((Class)v5);
      v20 = (void (*)(void *, void *))_UIAXReportSenderErrorLogger;
      if (_UIAXReportSenderErrorLogger)
      {
        v21 = NSStringFromClass((Class)a1);
        v20(v5, v21);
      }
    }
    v22 = (void (*)(void))_UIAXValidationLogger;
    if (_UIAXValidationLogger)
    {
      v23 = NSString;
      v24 = NSStringFromClass((Class)a1);
      v25 = [v23 stringWithFormat:@"UIAccessibility Error installing %@ on %@.  %@ does not exist in runtime", v24, v5, v5];
      v22();
    }
  }

  return v14;
}

+ (void)_addCategoryMethods:(objc_method *)a3 count:(unsigned int)a4 excluding:(id)a5 toClass:(Class)a6 isClass:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a4;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v12 = a5;
  size_t v13 = 48 * v9;
  if (v9 > 0x55)
  {
    v48 = (char *)malloc_type_malloc(48 * v9, 0x6ED3E0E5uLL);
  }
  else
  {
    v48 = (char *)&v42 - ((v13 + 15) & 0x7FFFFFFFF0);
    bzero(v48, v13);
  }
  Superclass = class_getSuperclass((Class)a1);
  v15 = Superclass;
  if (Superclass)
  {
    Class v16 = class_getSuperclass(Superclass);
    BOOL v49 = v16 == (Class)[a1 safeCategoryBaseClass];
    if (!v9) {
      goto LABEL_33;
    }
  }
  else
  {
    BOOL v49 = 0;
    if (!v9) {
      goto LABEL_33;
    }
  }
  v44 = v15;
  uint64_t v45 = v9;
  id v42 = a1;
  BOOL v43 = v7;
  uint64_t v17 = 0;
  int v18 = 0;
  int v19 = 0;
  uint64_t v20 = v9;
  v52 = &v48[24 * v9];
  Class v53 = a6;
  v51 = &v48[40 * v9];
  v46 = &v48[16 * v9];
  v47 = &v48[8 * v9];
  v50 = &v48[32 * v9];
  do
  {
    Name = method_getName(a3[v17]);
    if (objc_msgSend(v12, "count", v42))
    {
      uint64_t v22 = 0;
      unsigned int v23 = 1;
      while (1)
      {
        v24 = [v12 objectAtIndexedSubscript:v22];
        SEL v25 = NSSelectorFromString(v24);

        if (Name == v25) {
          break;
        }
        uint64_t v22 = v23;
        if ([v12 count] <= (unint64_t)v23++) {
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      TypeEncoding = method_getTypeEncoding(a3[v17]);
      InstanceMethod = class_getInstanceMethod(v53, Name);
      if (InstanceMethod)
      {
        IMP Implementation = method_getImplementation(InstanceMethod);
        BOOL v30 = v49;
        if (!Implementation) {
          BOOL v30 = 0;
        }
        if (v30)
        {
          *(void *)&v48[8 * v19] = Name;
          *(void *)&v47[8 * v19] = Implementation;
          *(void *)&v46[8 * v19++] = TypeEncoding;
        }
      }
      *(void *)&v52[8 * v18] = Name;
      IMP v31 = method_getImplementation(a3[v17]);
      *(void *)&v50[8 * v18] = v31;
      *(void *)&v51[8 * v18++] = TypeEncoding;
    }
    ++v17;
  }
  while (v17 != v20);
  Class Class = v44;
  unsigned int v33 = v45;
  v34 = v53;
  if (!v19)
  {
LABEL_29:
    if (!v18) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v43) {
    Class Class = object_getClass(v44);
  }
  if (Class)
  {
    unsigned int v54 = 0;
    uint64_t v35 = class_addMethodsBulk();
    if (v35)
    {
      v36 = (SEL *)v35;
      if (v54)
      {
        for (unint64_t i = 0; i < v54; ++i)
        {
          v38 = NSStringFromClass(v34);
          v40 = NSStringFromSelector(v36[i]);
          _AXSafeCategoryLog(0, @"UIAccessibility Error adding method that already exists. It's likely this class is being installed as a safe category twice %@[%@ %@]");
        }
      }
      free(v36);
      unsigned int v33 = v45;
    }
    goto LABEL_29;
  }
  v39 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v39);
  _AXSafeCategoryLog(0, @"UIAccessibility Error unable to add %u methods to NULL superclass of %@");

  if (v18) {
LABEL_30:
  }
    class_replaceMethodsBulk();
LABEL_31:
  if (v33 >= 0x56) {
    free(v48);
  }
LABEL_33:
}

void __69__UIAccessibilitySafeCategory__installSafeCategoryOnClass_isManaged___block_invoke()
{
  atomic_store(1u, _installSafeCategoryOnClass_isManaged__needsPost);
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"_AXClearIMPCachesNotification" object:0];
}

+ (id)safeCategoryTargetClassName
{
  return 0;
}

+ (Class)safeCategoryTargetClass
{
  v2 = [a1 safeCategoryTargetClassName];
  v3 = NSClassFromString(v2);

  return (Class)v3;
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)_installSafeCategoryValidationMethod
{
  v3 = [a1 safeCategoryTargetClassName];
  BOOL v4 = [a1 _installLocalValidationMethodOnClassNamed:v3];

  return v4;
}

+ (id)_installLocalValidationMethodOnClassNamed:(id)a3
{
  BOOL v4 = (NSString *)a3;
  Class v5 = NSClassFromString(v4);
  if (!v5)
  {
    size_t v13 = NSString;
    v14 = NSStringFromClass((Class)a1);
    v15 = [v13 stringWithFormat:@"Error installing %@ on %@.  %@ does not exist in runtime", v14, v4, v4];

    goto LABEL_18;
  }
  Class v6 = v5;
  unsigned int outCount = 0;
  Class Class = object_getClass(a1);
  v8 = class_copyMethodList(Class, &outCount);
  uint64_t v9 = v8;
  char v10 = 0;
  if (v8 && outCount)
  {
    unint64_t v11 = 0;
    id v12 = v8;
    while (1)
    {
      if (!*v12)
      {
        free(v9);
        goto LABEL_17;
      }
      if (method_getName(*v12) == sel__accessibilityPerformValidations_) {
        break;
      }
      ++v11;
      ++v12;
      if (v11 >= outCount)
      {
        char v10 = 0;
        goto LABEL_9;
      }
    }
    char v10 = 1;
    [a1 _addCategoryMethods:v12 count:1 excluding:0 toClass:object_getClass(v6) isClass:1];
    if (!v9)
    {
LABEL_15:
      if (v10) {
        goto LABEL_16;
      }
      goto LABEL_17;
    }
  }
  else
  {
LABEL_9:
    if (!v9) {
      goto LABEL_15;
    }
  }
  free(v9);
  if (v10)
  {
LABEL_16:
    v15 = 0;
    goto LABEL_18;
  }
LABEL_17:
  v15 = @"No validation method found";
LABEL_18:

  return v15;
}

+ (void)_installSafeCategoryOnClassNamed:(id)a3
{
  id v3 = (id)[a1 _installSafeCategoryOnClassNamed:a3 isManaged:0];
}

@end