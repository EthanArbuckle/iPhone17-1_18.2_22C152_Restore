@interface PFObjc
@end

@implementation PFObjc

objc_class *__PFObjc_enumerateSubclassesForHeader_block_invoke(uint64_t a1, char *name)
{
  v4 = *(const char **)(a1 + 40);
  if (!v4 || (size_t v5 = strlen(*(const char **)(a1 + 40)), result = (objc_class *)strncmp(name, v4, v5), !result))
  {
    result = objc_lookUpClass(name);
    if (result)
    {
      v7 = *(objc_class **)(a1 + 48);
      do
        result = class_getSuperclass(result);
      while (result && result != v7);
      if (result == v7)
      {
        v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
        return (objc_class *)v8();
      }
    }
  }
  return result;
}

@end