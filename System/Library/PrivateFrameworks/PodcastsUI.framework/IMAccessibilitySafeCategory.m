@interface IMAccessibilitySafeCategory
+ (void)_addCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5;
+ (void)installCategoryOnClassNamed:(id)a3;
@end

@implementation IMAccessibilitySafeCategory

+ (void)installCategoryOnClassNamed:(id)a3
{
  v4 = (NSString *)a3;
  Class v5 = NSClassFromString(v4);
  if (!v5)
  {
    v11 = NSString;
    v12 = NSStringFromClass((Class)a1);
    v13 = [v11 stringWithFormat:@"UIAccessibility Error installing %@ on %@.  %@ does not exist in runtime.", v12, v4, v4];

    goto LABEL_21;
  }
  Class v6 = v5;
  unsigned int outCount = 0;
  v7 = class_copyMethodList((Class)a1, &outCount);
  v8 = v7;
  if (v7 && outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Method v10 = v8[i];
      if (!v10) {
        break;
      }
      [a1 _addCategoryMethod:v10 toClass:v6 isClass:0];
    }
  }
  else if (!v7)
  {
    goto LABEL_11;
  }
  free(v8);
LABEL_11:
  Class = object_getClass(a1);
  v15 = class_copyMethodList(Class, &outCount);
  v16 = v15;
  if (v15 && outCount)
  {
    for (unint64_t j = 0; j < outCount; ++j)
    {
      v18 = v16[j];
      if (!v18) {
        break;
      }
      if (method_getName(v18) != sel_load) {
        [a1 _addCategoryMethod:v16[j] toClass:object_getClass(v6) isClass:1];
      }
    }
    goto LABEL_20;
  }
  if (v15) {
LABEL_20:
  }
    free(v16);
LABEL_21:
}

+ (void)_addCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
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
        if (v18 == (Class)objc_opt_class())
        {
          if (v5) {
            Class Class = object_getClass(Class);
          }
          v19 = method_getTypeEncoding(v11);
          if (!class_addMethod(Class, Name, Implementation, v19))
          {
            v20 = NSString;
            if (v5) {
              v21 = @"+";
            }
            else {
              v21 = @"-";
            }
            v22 = NSStringFromClass(a4);
            v23 = NSStringFromSelector(Name);
            id v24 = [v20 stringWithFormat:@"UIAccessibility Error adding %@[%@ %@]", v21, v22, v23];
          }
        }
      }
    }
  }
}

@end