@interface CRLAccessibilitySafeCategory
+ (Class)crlaxBaseSafeCategoryClass;
+ (Class)crlaxTargetClass;
+ (id)crlaxTargetClassName;
+ (void)_crlaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5;
+ (void)_crlaxInitializeSafeCategory;
+ (void)_crlaxInstallSafeCategoryOnClass:(Class)a3;
+ (void)_crlaxInstallSafeCategoryOnClassNamed:(id)a3;
@end

@implementation CRLAccessibilitySafeCategory

+ (id)crlaxTargetClassName
{
  return 0;
}

+ (Class)crlaxTargetClass
{
  v2 = (NSString *)[a1 crlaxTargetClassName];

  return NSClassFromString(v2);
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)_crlaxInitializeSafeCategory
{
  id v3 = [a1 crlaxTargetClassName];

  _[a1 _crlaxInstallSafeCategoryOnClassNamed:v3];
}

+ (void)_crlaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
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
        if (v18 == [a1 crlaxBaseSafeCategoryClass])
        {
          if (v5) {
            Class Class = object_getClass(Class);
          }
          v19 = method_getTypeEncoding(v11);
          BOOL v20 = class_addMethod(Class, Name, Implementation, v19);
          if (qword_1016A90D8 != -1) {
            dispatch_once(&qword_1016A90D8, &stru_1014D7238);
          }
          if (byte_1016A90D0) {
            char v21 = v20;
          }
          else {
            char v21 = 1;
          }
          if ((v21 & 1) == 0)
          {
            if (qword_1016A90E8 != -1) {
              dispatch_once(&qword_1016A90E8, &stru_1014D7258);
            }
            int v22 = byte_1016A90E0;
            if (v5) {
              CFStringRef v23 = @"+";
            }
            else {
              CFStringRef v23 = @"-";
            }
            NSStringFromClass(a4);
            NSStringFromSelector(Name);
            if (__CRLAccessibilityHandleValidationErrorWithDescription(v22, 1, @"Failed adding %@[%@ %@]", v24, v25, v26, v27, v28, (uint64_t)v23))abort(); {
          }
            }
        }
      }
    }
  }
}

+ (void)_crlaxInstallSafeCategoryOnClassNamed:(id)a3
{
  Class v4 = NSClassFromString((NSString *)a3);
  if (qword_1016A90D8 != -1) {
    dispatch_once(&qword_1016A90D8, &stru_1014D7238);
  }
  if (byte_1016A90D0) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (qword_1016A90E8 != -1) {
      dispatch_once(&qword_1016A90E8, &stru_1014D7258);
    }
    int v6 = byte_1016A90E0;
    v7 = NSStringFromClass((Class)a1);
    if (__CRLAccessibilityHandleValidationErrorWithDescription(v6, 1, @"Failed installing %@ on %@. %@ does not exist in runtime.", v8, v9, v10, v11, v12, (uint64_t)v7))abort(); {
  }
    }
  else if (v4)
  {
    [a1 _crlaxInstallSafeCategoryOnClass:v4];
  }
}

+ (void)_crlaxInstallSafeCategoryOnClass:(Class)a3
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
          if (qword_1016A90D8 != -1) {
            dispatch_once(&qword_1016A90D8, &stru_1014D7238);
          }
          if (byte_1016A90D0) {
            char v10 = v9;
          }
          else {
            char v10 = 1;
          }
          if ((v10 & 1) == 0)
          {
            if (qword_1016A90E8 != -1) {
              dispatch_once(&qword_1016A90E8, &stru_1014D7258);
            }
            int v11 = byte_1016A90E0;
            uint64_t v12 = NSStringFromProtocol(v8);
            NSStringFromClass((Class)a1);
            NSStringFromClass(a3);
            if (__CRLAccessibilityHandleValidationErrorWithDescription(v11, 1, @"Failed adding protocol %@ from safe category %@ to target class %@.", v13, v14, v15, v16, v17, (uint64_t)v12))abort(); {
          }
            }
        }
      }
      free(v6);
    }
    SEL v18 = NSSelectorFromString(@".cxx_destruct");
    SEL v19 = NSSelectorFromString(@".cxx_construct");
    unsigned int v31 = 0;
    BOOL v20 = class_copyMethodList((Class)a1, &v31);
    if (v20)
    {
      char v21 = v20;
      if (v31)
      {
        uint64_t v22 = 0;
        do
        {
          CFStringRef v23 = v21[v22];
          if (!v23) {
            break;
          }
          SEL Name = method_getName(v23);
          if (Name != v18 && Name != v19) {
            [a1 _crlaxAddCategoryMethod:v21[v22] toClass:a3 isClass:0];
          }
          ++v22;
        }
        while (v22 < v31);
      }
      free(v21);
    }
    Class Class = object_getClass(a1);
    uint64_t v27 = class_copyMethodList(Class, &v31);
    if (v27)
    {
      uint64_t v28 = v27;
      if (v31)
      {
        uint64_t v29 = 0;
        do
        {
          v30 = v28[v29];
          if (!v30) {
            break;
          }
          if (method_getName(v30) != "load") {
            [a1 _crlaxAddCategoryMethod:v28[v29] toClass:object_getClass(a3) isClass:1];
          }
          ++v29;
        }
        while (v29 < v31);
      }
      free(v28);
    }
  }
}

@end