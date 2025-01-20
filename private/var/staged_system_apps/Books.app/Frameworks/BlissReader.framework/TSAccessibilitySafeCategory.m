@interface TSAccessibilitySafeCategory
+ (Class)tsaxBaseSafeCategoryClass;
+ (Class)tsaxTargetClass;
+ (id)tsaxTargetClassName;
+ (void)_tsaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5;
+ (void)_tsaxInitializeSafeCategory;
+ (void)_tsaxInstallSafeCategoryOnClass:(Class)a3;
+ (void)_tsaxInstallSafeCategoryOnClassNamed:(id)a3;
@end

@implementation TSAccessibilitySafeCategory

+ (id)tsaxTargetClassName
{
  return 0;
}

+ (Class)tsaxTargetClass
{
  v2 = (NSString *)[a1 tsaxTargetClassName];

  return NSClassFromString(v2);
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)_tsaxInitializeSafeCategory
{
  id v3 = [a1 tsaxTargetClassName];

  [a1 _tsaxInstallSafeCategoryOnClassNamed:v3];
}

+ (void)_tsaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
{
  BOOL v5 = a5;
  Name = method_getName(a3);
  InstanceMethod = class_getInstanceMethod(a4, Name);
  v11 = InstanceMethod;
  if (InstanceMethod) {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else {
    Implementation = 0;
  }
  v13 = method_getImplementation(a3);
  TypeEncoding = method_getTypeEncoding(a3);
  if (!class_addMethod(a4, Name, v13, TypeEncoding))
  {
    v15 = method_getImplementation(a3);
    method_setImplementation(v11, v15);
  }
  if (v11)
  {
    if (Implementation)
    {
      Superclass = class_getSuperclass((Class)a1);
      if (Superclass)
      {
        Class Class = Superclass;
        Class v18 = class_getSuperclass(Superclass);
        if (v18 == [a1 tsaxBaseSafeCategoryClass])
        {
          if (v5) {
            Class Class = object_getClass(Class);
          }
          v19 = method_getTypeEncoding(v11);
          BOOL v20 = class_addMethod(Class, Name, Implementation, v19);
          if (qword_573840 != -1) {
            dispatch_once(&qword_573840, &stru_46B7C0);
          }
          if (byte_573838) {
            char v21 = v20;
          }
          else {
            char v21 = 1;
          }
          if ((v21 & 1) == 0)
          {
            if (qword_573850 != -1) {
              dispatch_once(&qword_573850, &stru_46B7E0);
            }
            int v22 = byte_573848;
            if (v5) {
              CFStringRef v23 = @"+";
            }
            else {
              CFStringRef v23 = @"-";
            }
            NSStringFromClass(a4);
            NSStringFromSelector(Name);
            if (__TSAccessibilityHandleValidationErrorWithDescription(v22, 1, @"Failed adding %@[%@ %@]", v24, v25, v26, v27, v28, (uint64_t)v23))abort(); {
          }
            }
        }
      }
    }
  }
}

+ (void)_tsaxInstallSafeCategoryOnClassNamed:(id)a3
{
  Class v4 = NSClassFromString((NSString *)a3);
  if (qword_573840 != -1) {
    dispatch_once(&qword_573840, &stru_46B7C0);
  }
  if (byte_573838) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (qword_573850 != -1) {
      dispatch_once(&qword_573850, &stru_46B7E0);
    }
    int v6 = byte_573848;
    v7 = NSStringFromClass((Class)a1);
    if (__TSAccessibilityHandleValidationErrorWithDescription(v6, 1, @"Failed installing %@ on %@. %@ does not exist in runtime.", v8, v9, v10, v11, v12, (uint64_t)v7))abort(); {
  }
    }
  else if (v4)
  {
    [a1 _tsaxInstallSafeCategoryOnClass:v4];
  }
}

+ (void)_tsaxInstallSafeCategoryOnClass:(Class)a3
{
  if (a3)
  {
    unsigned int outCount = 0;
    BOOL v5 = class_copyProtocolList((Class)a1, &outCount);
    if (v5)
    {
      int v6 = v5;
      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ++i)
        {
          uint64_t v8 = v6[i];
          BOOL v9 = class_addProtocol(a3, v8);
          if (qword_573840 != -1) {
            dispatch_once(&qword_573840, &stru_46B7C0);
          }
          if (byte_573838) {
            char v10 = v9;
          }
          else {
            char v10 = 1;
          }
          if ((v10 & 1) == 0)
          {
            if (qword_573850 != -1) {
              dispatch_once(&qword_573850, &stru_46B7E0);
            }
            int v11 = byte_573848;
            uint64_t v12 = NSStringFromProtocol(v8);
            NSStringFromClass((Class)a1);
            NSStringFromClass(a3);
            if (__TSAccessibilityHandleValidationErrorWithDescription(v11, 1, @"Failed adding protocol %@ from safe category %@ to target class %@.", v13, v14, v15, v16, v17, (uint64_t)v12))abort(); {
          }
            }
        }
      }
      free(v6);
    }
    unsigned int v27 = 0;
    Class v18 = class_copyMethodList((Class)a1, &v27);
    if (v18)
    {
      v19 = v18;
      if (v27)
      {
        for (unint64_t j = 0; j < v27; ++j)
        {
          Method v21 = v19[j];
          if (!v21) {
            break;
          }
          [a1 _tsaxAddCategoryMethod:v21 toClass:a3 isClass:0];
        }
      }
      free(v19);
    }
    Class Class = object_getClass(a1);
    CFStringRef v23 = class_copyMethodList(Class, &v27);
    if (v23)
    {
      uint64_t v24 = v23;
      if (v27)
      {
        for (unint64_t k = 0; k < v27; ++k)
        {
          uint64_t v26 = v24[k];
          if (!v26) {
            break;
          }
          if (method_getName(v26) != "load") {
            [a1 _tsaxAddCategoryMethod:v24[k] toClass:object_getClass(a3) isClass:1];
          }
        }
      }
      free(v24);
    }
  }
}

@end