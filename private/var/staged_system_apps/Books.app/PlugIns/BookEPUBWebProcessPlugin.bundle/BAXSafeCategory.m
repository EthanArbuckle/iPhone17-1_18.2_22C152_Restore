@interface BAXSafeCategory
+ (Class)baxBaseSafeCategoryClass;
+ (Class)baxTargetClass;
+ (id)baxTargetClassName;
+ (void)_baxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5;
+ (void)_baxInitializeSafeCategory;
+ (void)_baxInstallSafeCategoryOnClass:(Class)a3;
+ (void)_baxInstallSafeCategoryOnClassNamed:(id)a3;
@end

@implementation BAXSafeCategory

+ (id)baxTargetClassName
{
  return 0;
}

+ (Class)baxTargetClass
{
  v2 = [a1 baxTargetClassName];
  v3 = NSClassFromString(v2);

  return (Class)v3;
}

+ (Class)baxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)_baxInitializeSafeCategory
{
  id v3 = [a1 baxTargetClassName];
  [a1 _baxInstallSafeCategoryOnClassNamed:v3];
}

+ (void)_baxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
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
        if (v18 == [a1 baxBaseSafeCategoryClass])
        {
          if (v5) {
            Class Class = object_getClass(Class);
          }
          v19 = method_getTypeEncoding(v11);
          class_addMethod(Class, Name, Implementation, v19);
          if (qword_27258 != -1)
          {
            dispatch_once(&qword_27258, &stru_209F8);
          }
        }
      }
    }
  }
}

+ (void)_baxInstallSafeCategoryOnClassNamed:(id)a3
{
  Class v4 = NSClassFromString((NSString *)a3);
  Class v5 = v4;
  if (qword_27258 == -1)
  {
    if (!v4) {
      return;
    }
  }
  else
  {
    dispatch_once(&qword_27258, &stru_209F8);
    if (!v5) {
      return;
    }
  }

  [a1 _baxInstallSafeCategoryOnClass:v5];
}

+ (void)_baxInstallSafeCategoryOnClass:(Class)a3
{
  if (a3)
  {
    unsigned int outCount = 0;
    Class v5 = class_copyProtocolList((Class)a1, &outCount);
    if (v5)
    {
      v6 = v5;
      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ++i)
        {
          class_addProtocol(a3, v6[i]);
          if (qword_27258 != -1) {
            dispatch_once(&qword_27258, &stru_209F8);
          }
        }
      }
      free(v6);
    }
    unsigned int v17 = 0;
    v8 = class_copyMethodList((Class)a1, &v17);
    if (v8)
    {
      v9 = v8;
      if (v17)
      {
        for (unint64_t j = 0; j < v17; ++j)
        {
          Method v11 = v9[j];
          if (!v11) {
            break;
          }
          [a1 _baxAddCategoryMethod:v11 toClass:a3 isClass:0];
        }
      }
      free(v9);
    }
    Class Class = object_getClass(a1);
    v13 = class_copyMethodList(Class, &v17);
    if (v13)
    {
      v14 = v13;
      if (v17)
      {
        for (unint64_t k = 0; k < v17; ++k)
        {
          v16 = v14[k];
          if (!v16) {
            break;
          }
          if (method_getName(v16) != "load") {
            [a1 _baxAddCategoryMethod:v14[k] toClass:object_getClass(a3) isClass:1];
          }
        }
      }
      free(v14);
    }
  }
}

@end