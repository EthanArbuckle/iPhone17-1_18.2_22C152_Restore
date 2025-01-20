@interface NSObject(IvarDescription)
- (void)__ivarDescriptionForClass:()IvarDescription;
- (void)__methodDescriptionForClass:()IvarDescription;
- (void)__propertyDescriptionForClass:()IvarDescription;
- (void)_ivarDescription;
- (void)_methodDescription;
- (void)_propertyDescription;
- (void)_shortMethodDescription;
@end

@implementation NSObject(IvarDescription)

- (void)__ivarDescriptionForClass:()IvarDescription
{
  v5 = (void *)[MEMORY[0x1E4F28E78] string];
  [v5 appendFormat:@"\nin %@:", a3];
  unsigned int outCount = 0;
  v6 = class_copyIvarList(a3, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      TypeEncoding = (char *)ivar_getTypeEncoding(v6[i]);
      Name = ivar_getName(v6[i]);
      ptrdiff_t Offset = ivar_getOffset(v6[i]);
      [v5 appendFormat:@"\n\t%s (%@): ", Name, _UIDebugObjectTypeDescription(TypeEncoding)];
      if (*TypeEncoding == 35)
      {
        if (!i && (objc_class *)objc_opt_class() == a3)
        {
          v12 = NSString;
          Class Class = object_getClass(a1);
          Ivar = (void *)[v12 stringWithFormat:@"%@ (isa, %p)", Class, object_getIvar(a1, *v6)];
        }
        else
        {
          Ivar = object_getIvar(a1, v6[i]);
        }
      }
      else
      {
        Ivar = _UIDebugIvarValue((__CFString *)&a1[Offset], TypeEncoding, 0);
      }
      [v5 appendFormat:@"%@", Ivar];
    }
  }
  free(v6);
  return v5;
}

- (void)_ivarDescription
{
  v2 = (void *)[MEMORY[0x1E4F28E78] string];
  v3 = (void *)MEMORY[0x18C108260]();
  [v2 appendFormat:@"%@:", ((uint64_t (*)(void *, char *))objc_msgSend(MEMORY[0x1E4FBA8A8], "instanceMethodForSelector:", sel_description))(a1, sel_description)];
  uint64_t v4 = objc_opt_class();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v2, "appendString:", objc_msgSend(a1, "__ivarDescriptionForClass:", v5));
      v5 = (void *)[v5 superclass];
    }
    while (v5);
  }
  return v2;
}

- (void)__propertyDescriptionForClass:()IvarDescription
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] string];
  [v4 appendFormat:@"\n\nin %@:", a3];
  unsigned int outCount = 0;
  v5 = class_copyPropertyList(a3, &outCount);
  if (outCount)
  {
    [v4 appendString:@"\n\tProperties:"];
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; [v4 appendFormat:@"\n\t\t%@", _UIKitPropertyDescription(v5[i++])]);
    }
  }
  free(v5);
  [v4 appendString:@"\n"];
  return v4;
}

- (void)_propertyDescription
{
  v2 = (void *)[MEMORY[0x1E4F28E78] string];
  [v2 appendFormat:@"%@:", ((uint64_t (*)(void *, char *))objc_msgSend(MEMORY[0x1E4FBA8A8], "instanceMethodForSelector:", sel_description))(a1, sel_description)];
  uint64_t v3 = objc_opt_class();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    do
    {
      objc_msgSend(v2, "appendString:", objc_msgSend(a1, "__propertyDescriptionForClass:", v4));
      uint64_t v4 = (void *)[v4 superclass];
    }
    while (v4);
  }
  return v2;
}

- (void)__methodDescriptionForClass:()IvarDescription
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] string];
  [v4 appendFormat:@"\nin %@:", a3];
  unsigned int outCount = 0;
  Name = class_getName(a3);
  MetaClass Class = objc_getMetaClass(Name);
  v7 = class_copyMethodList(MetaClass, &outCount);
  if (outCount)
  {
    [v4 appendString:@"\n\tClass Methods:"];
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; [v4 appendFormat:@"\n\t\t%@", _UIKitMethodDescription(v7[i++], 0)]);
    }
  }
  free(v7);
  unsigned int v15 = 0;
  v9 = class_copyPropertyList(a3, &v15);
  if (v15)
  {
    [v4 appendString:@"\n\tProperties:"];
    if (v15)
    {
      for (unint64_t j = 0; j < v15; [v4 appendFormat:@"\n\t\t%@", _UIKitPropertyDescription(v9[j++])])
        ;
    }
  }
  free(v9);
  unsigned int v14 = 0;
  v11 = class_copyMethodList(a3, &v14);
  if (v14)
  {
    [v4 appendString:@"\n\tInstance Methods:"];
    if (v14)
    {
      for (unint64_t k = 0; k < v14; [v4 appendFormat:@"\n\t\t%@", _UIKitMethodDescription(v11[k++], 1)])
        ;
    }
  }
  free(v11);
  return v4;
}

- (void)_methodDescription
{
  v2 = (void *)[MEMORY[0x1E4F28E78] string];
  [v2 appendFormat:@"%@:", ((uint64_t (*)(void *, char *))objc_msgSend(MEMORY[0x1E4FBA8A8], "instanceMethodForSelector:", sel_description))(a1, sel_description)];
  uint64_t v3 = objc_opt_class();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    do
    {
      objc_msgSend(v2, "appendString:", objc_msgSend(a1, "__methodDescriptionForClass:", v4));
      uint64_t v4 = (void *)[v4 superclass];
    }
    while (v4);
  }
  return v2;
}

- (void)_shortMethodDescription
{
  v2 = (void *)[MEMORY[0x1E4F28E78] string];
  [v2 appendFormat:@"%@:", ((uint64_t (*)(void *, char *))objc_msgSend(MEMORY[0x1E4FBA8A8], "instanceMethodForSelector:", sel_description))(a1, sel_description)];
  uint64_t v3 = objc_opt_class();
  while (v3)
  {
    objc_msgSend(v2, "appendString:", objc_msgSend(a1, "__methodDescriptionForClass:", v3));
    uint64_t v3 = (void *)[v3 superclass];
    uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:v3];
    if (v4 != [MEMORY[0x1E4F28B50] mainBundle])
    {
      [v2 appendFormat:@"\n(%@ ...)", v3];
      return v2;
    }
  }
  return v2;
}

@end