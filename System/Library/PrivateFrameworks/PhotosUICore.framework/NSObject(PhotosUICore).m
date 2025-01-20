@interface NSObject(PhotosUICore)
+ (void)px_enumeratePropertiesUsingBlock:()PhotosUICore;
+ (void)px_swizzleClassMethod:()PhotosUICore withMethod:;
+ (void)px_swizzleMethod:()PhotosUICore withMethod:;
+ (void)px_swizzleOnceAsSubclassOfClass:()PhotosUICore context:usingBlock:;
@end

@implementation NSObject(PhotosUICore)

+ (void)px_swizzleOnceAsSubclassOfClass:()PhotosUICore context:usingBlock:
{
  v18 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"NSObject+PhotosUICore.m" lineNumber:43 description:@"not on the main thread"];
  }
  if ((PLIsPhotosAppAnyPlatform() & 1) == 0
    && (PLIsPhotoPicker() & 1) == 0
    && (PLIsCamera() & 1) == 0
    && (PLIsPhotosMessagesApp() & 1) == 0)
  {
    if (a1 == a3)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, a1, @"NSObject+PhotosUICore.m", 50, @"%@ is already the root class", a1 object file lineNumber description];
    }
    v9 = a1;
    while ((void *)[v9 superclass] != a3)
    {
      v9 = (void *)[v9 superclass];
      if (!v9)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2, a1, @"NSObject+PhotosUICore.m", 55, @"%@ isn't a descendant of %@", a1, a3 object file lineNumber description];

        abort();
      }
    }
    a3 = v9;
  }
  v11 = [MEMORY[0x1E4F29238] valueWithPointer:a4];
  v12 = (void *)px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext;
  if (!px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v14 = (void *)px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext;
    px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext = v13;

    v12 = (void *)px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext;
  }
  v15 = [v12 objectForKeyedSubscript:v11];
  if (!v15)
  {
    v15 = [MEMORY[0x1E4F1CA80] set];
    [(id)px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext setObject:v15 forKeyedSubscript:v11];
  }
  if (([v15 containsObject:a3] & 1) == 0)
  {
    [v15 addObject:a3];
    ((void (**)(id, void *))v18)[2](v18, a3);
  }
}

+ (void)px_swizzleMethod:()PhotosUICore withMethod:
{
  InstanceMethod = class_getInstanceMethod(a1, name);
  v8 = class_getInstanceMethod(a1, a4);
  MethodImplementation = class_getMethodImplementation(a1, name);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  if (class_addMethod(a1, name, MethodImplementation, TypeEncoding)) {
    InstanceMethod = class_getInstanceMethod(a1, name);
  }
  v11 = class_getMethodImplementation(a1, a4);
  v12 = method_getTypeEncoding(v8);
  if (class_addMethod(a1, a4, v11, v12)) {
    v8 = class_getInstanceMethod(a1, a4);
  }
  method_exchangeImplementations(InstanceMethod, v8);
}

+ (void)px_enumeratePropertiesUsingBlock:()PhotosUICore
{
  v4 = a3;
  unsigned int outCount = 0;
  v5 = class_copyPropertyList(a1, &outCount);
  if (v5)
  {
    v6 = v5;
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        v8 = v6[i];
        v9 = [NSString stringWithUTF8String:property_getName(v8)];
        v10 = [NSString stringWithUTF8String:property_getAttributes(v8)];
        v11 = [MEMORY[0x1E4F28FE8] scannerWithString:v10];
        Class v12 = 0;
        uint64_t v13 = 0;
        if ([v11 scanString:@"T@\"" intoString:0])
        {
          id v17 = 0;
          int v14 = [v11 scanUpToString:@"\"" intoString:&v17];
          v15 = (NSString *)v17;
          uint64_t v13 = v15;
          if (v14) {
            Class v12 = NSClassFromString(v15);
          }
          else {
            Class v12 = 0;
          }
        }
        v16 = [v10 componentsSeparatedByString:@","];
        v4[2](v4, v9, v12, [v16 containsObject:@"R"]);
      }
    }
    free(v6);
  }
}

+ (void)px_swizzleClassMethod:()PhotosUICore withMethod:
{
  ClassMethod = class_getClassMethod(a1, name);
  v8 = class_getClassMethod(a1, a4);
  Class = object_getClass(a1);
  Implementation = method_getImplementation(v8);
  TypeEncoding = method_getTypeEncoding(v8);
  if (class_addMethod(Class, name, Implementation, TypeEncoding))
  {
    Class v12 = method_getImplementation(ClassMethod);
    uint64_t v13 = method_getTypeEncoding(ClassMethod);
    class_replaceMethod(Class, a4, v12, v13);
  }
  else
  {
    method_exchangeImplementations(ClassMethod, v8);
  }
}

@end