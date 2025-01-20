@interface IMAccessibilitySafeCategory
+ (Class)imaxBaseSafeCategoryClass;
+ (Class)imaxTargetClass;
+ (id)imaxTargetClassName;
+ (void)_imaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5;
+ (void)_imaxInitializeSafeCategory;
+ (void)_imaxInstallSafeCategoryOnClass:(Class)a3;
+ (void)_imaxInstallSafeCategoryOnClassNamed:(id)a3;
@end

@implementation IMAccessibilitySafeCategory

+ (id)imaxTargetClassName
{
  return 0;
}

+ (Class)imaxTargetClass
{
  v2 = [a1 imaxTargetClassName];
  v3 = NSClassFromString(v2);

  return (Class)v3;
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)_imaxInitializeSafeCategory
{
  id v3 = [a1 imaxTargetClassName];
  [a1 _imaxInstallSafeCategoryOnClassNamed:v3];
}

+ (void)_imaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
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
        if (v18 == [a1 imaxBaseSafeCategoryClass])
        {
          if (v5) {
            Class Class = object_getClass(Class);
          }
          v19 = method_getTypeEncoding(v11);
          BOOL v20 = class_addMethod(Class, Name, Implementation, v19);
          if (qword_349368 != -1) {
            dispatch_once(&qword_349368, &stru_2C9D48);
          }
          if (byte_349360) {
            char v21 = v20;
          }
          else {
            char v21 = 1;
          }
          if ((v21 & 1) == 0)
          {
            if (qword_349378 != -1) {
              dispatch_once(&qword_349378, &stru_2C9D68);
            }
            int v22 = byte_349370;
            if (v5) {
              CFStringRef v23 = @"+";
            }
            else {
              CFStringRef v23 = @"-";
            }
            v24 = NSStringFromClass(a4);
            v31 = NSStringFromSelector(Name);
            int v30 = __IMAccessibilityHandleValidationErrorWithDescription(v22, 1, @"Failed adding %@[%@ %@]", v25, v26, v27, v28, v29, (uint64_t)v23);

            if (v30) {
              abort();
            }
          }
        }
      }
    }
  }
}

+ (void)_imaxInstallSafeCategoryOnClassNamed:(id)a3
{
  v14 = (NSString *)a3;
  Class v4 = NSClassFromString(v14);
  if (qword_349368 != -1) {
    dispatch_once(&qword_349368, &stru_2C9D48);
  }
  if (byte_349360) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (qword_349378 != -1) {
      dispatch_once(&qword_349378, &stru_2C9D68);
    }
    int v6 = byte_349370;
    v7 = NSStringFromClass((Class)a1);
    int v13 = __IMAccessibilityHandleValidationErrorWithDescription(v6, 1, @"Failed installing %@ on %@. %@ does not exist in runtime.", v8, v9, v10, v11, v12, (uint64_t)v7);

    if (v13) {
      abort();
    }
  }
  else if (v4)
  {
    [a1 _imaxInstallSafeCategoryOnClass:v4];
  }
}

+ (void)_imaxInstallSafeCategoryOnClass:(Class)a3
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
        unint64_t v7 = 0;
        uint64_t v8 = &qword_349000;
        do
        {
          uint64_t v9 = v6[v7];
          BOOL v10 = class_addProtocol(a3, v9);
          if (v8[109] != -1) {
            dispatch_once(&qword_349368, &stru_2C9D48);
          }
          if (byte_349360) {
            char v11 = v10;
          }
          else {
            char v11 = 1;
          }
          if ((v11 & 1) == 0)
          {
            if (qword_349378 != -1) {
              dispatch_once(&qword_349378, &stru_2C9D68);
            }
            int v12 = byte_349370;
            int v13 = NSStringFromProtocol(v9);
            v14 = NSStringFromClass((Class)a1);
            int v30 = NSStringFromClass(a3);
            int v20 = __IMAccessibilityHandleValidationErrorWithDescription(v12, 1, @"Failed adding protocol %@ from safe category %@ to target class %@.", v15, v16, v17, v18, v19, (uint64_t)v13);

            uint64_t v8 = &qword_349000;
            if (v20) {
              abort();
            }
          }

          ++v7;
        }
        while (v7 < outCount);
      }
      free(v6);
    }
    unsigned int v31 = 0;
    char v21 = class_copyMethodList((Class)a1, &v31);
    if (v21)
    {
      int v22 = v21;
      if (v31)
      {
        for (unint64_t i = 0; i < v31; ++i)
        {
          Method v24 = v22[i];
          if (!v24) {
            break;
          }
          [a1 _imaxAddCategoryMethod:v24 toClass:a3 isClass:0];
        }
      }
      free(v22);
    }
    Class Class = object_getClass(a1);
    uint64_t v26 = class_copyMethodList(Class, &v31);
    if (v26)
    {
      uint64_t v27 = v26;
      if (v31)
      {
        for (unint64_t j = 0; j < v31; ++j)
        {
          uint64_t v29 = v27[j];
          if (!v29) {
            break;
          }
          if (method_getName(v29) != "load") {
            [a1 _imaxAddCategoryMethod:v27[j] toClass:object_getClass(a3) isClass:1];
          }
        }
      }
      free(v27);
    }
  }
}

@end