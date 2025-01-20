@interface NSMapTable(PKAdditions)
+ (id)pk_copiedToWeakObjectsMapTable;
+ (id)pk_strongPointerPersonalityToWeakObjectsMapTable;
+ (id)pk_strongToWeakObjectsMapTable;
+ (id)pk_weakPointerPersonalityToStrongObjectsMapTable;
+ (uint64_t)pk_createStrongPointerPersonalityToStrongObjects;
+ (uint64_t)pk_createStrongPointerPersonalityToWeakObjects;
+ (uint64_t)pk_createWeakPointerPersonalityToStrongObjects;
+ (uint64_t)pk_createWeakPointerPersonalityToWeakObjects;
@end

@implementation NSMapTable(PKAdditions)

+ (id)pk_strongPointerPersonalityToWeakObjectsMapTable
{
  v1 = objc_msgSend(a1, "pk_createStrongPointerPersonalityToWeakObjects");
  return v1;
}

+ (uint64_t)pk_createStrongPointerPersonalityToWeakObjects
{
  id v0 = objc_alloc(MEMORY[0x1E4F28E10]);
  return [v0 initWithKeyOptions:512 valueOptions:5 capacity:0];
}

+ (uint64_t)pk_createStrongPointerPersonalityToStrongObjects
{
  id v0 = objc_alloc(MEMORY[0x1E4F28E10]);
  return [v0 initWithKeyOptions:512 valueOptions:0 capacity:0];
}

+ (uint64_t)pk_createWeakPointerPersonalityToStrongObjects
{
  id v0 = objc_alloc(MEMORY[0x1E4F28E10]);
  return [v0 initWithKeyOptions:517 valueOptions:0 capacity:0];
}

+ (uint64_t)pk_createWeakPointerPersonalityToWeakObjects
{
  id v0 = objc_alloc(MEMORY[0x1E4F28E10]);
  return [v0 initWithKeyOptions:517 valueOptions:5 capacity:0];
}

+ (id)pk_weakPointerPersonalityToStrongObjectsMapTable
{
  v1 = objc_msgSend(a1, "pk_createWeakPointerPersonalityToStrongObjects");
  return v1;
}

+ (id)pk_strongToWeakObjectsMapTable
{
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:0];
  return v0;
}

+ (id)pk_copiedToWeakObjectsMapTable
{
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0x10000 valueOptions:5 capacity:0];
  return v0;
}

@end