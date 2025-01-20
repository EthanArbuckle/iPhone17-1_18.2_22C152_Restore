@interface NSObject(NTKIntrospection)
- (id)ntk_listOfDynamicProperties;
- (id)ntk_listOfProperties;
@end

@implementation NSObject(NTKIntrospection)

- (id)ntk_listOfProperties
{
  unsigned int outCount = 0;
  v0 = (objc_class *)objc_opt_class();
  v1 = class_copyPropertyList(v0, &outCount);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v4 = v1[i];
      Name = property_getName(v4);
      if (Name)
      {
        v6 = Name;
        unsigned __int8 v11 = 0;
        v7 = getObjectType(v4, &v11);
        v8 = objc_alloc_init(NTKObjectPropertyInfo);
        v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, objc_msgSend(NSString, "defaultCStringEncoding"));
        [(NTKObjectPropertyInfo *)v8 setName:v9];

        if (v7) {
          [(NTKObjectPropertyInfo *)v8 setTypeString:v7];
        }
        [(NTKObjectPropertyInfo *)v8 setIsDynamic:v11];
        [v2 addObject:v8];
      }
    }
  }
  free(v1);

  return v2;
}

- (id)ntk_listOfDynamicProperties
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = objc_msgSend(a1, "ntk_listOfProperties");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__NSObject_NTKIntrospection__ntk_listOfDynamicProperties__block_invoke;
  v6[3] = &unk_1E62C8B40;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

@end