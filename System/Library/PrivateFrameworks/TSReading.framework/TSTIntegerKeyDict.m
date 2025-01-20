@interface TSTIntegerKeyDict
- (TSTIntegerKeyDict)init;
- (id)allValues;
- (id)objectForKey:(unsigned int)a3;
- (int64_t)count;
- (void)applyFunction:(void *)a3 withState:(void *)a4;
- (void)applyFunction:(void *)a3 withState:(void *)a4 andState:(void *)a5;
- (void)dealloc;
- (void)makeObjectsPerformSelector:(SEL)a3;
- (void)removeAllObjects;
- (void)removeFirstObject;
- (void)removeObjectForKey:(unsigned int)a3;
- (void)setObject:(id)a3 forKey:(unsigned int)a4;
- (void)transformWithFunction:(void *)a3 withState:(void *)a4;
@end

@implementation TSTIntegerKeyDict

- (TSTIntegerKeyDict)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSTIntegerKeyDict;
  if ([(TSTIntegerKeyDict *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mMap = self->mMap;
  if (mMap)
  {
    uint64_t v4 = std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::~__hash_table((uint64_t)mMap);
    MEMORY[0x223CB8F20](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSTIntegerKeyDict;
  [(TSTIntegerKeyDict *)&v5 dealloc];
}

- (id)objectForKey:(unsigned int)a3
{
  unsigned int v4 = a3;
  id result = std::__hash_table<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>>>::find<unsigned int>((void *)self->mMap, &v4);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (void)setObject:(id)a3 forKey:(unsigned int)a4
{
  if (!a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSTIntegerKeyDict setObject:forKey:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTIntegerKeyDict.mm"), 45, @"Can't set nil objects in this map!");
  }
  mMap = self->mMap;
  id v10 = a3;
  unsigned int v12 = a4;
  id v13 = a3;
  id v11 = a3;
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>((uint64_t)mMap, &v12, (uint64_t)&v12);
}

- (void)removeFirstObject
{
}

- (void)removeObjectForKey:(unsigned int)a3
{
  unsigned int v3 = a3;
  std::__hash_table<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,TSTIntHasher,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::equal_to<unsigned int>,TSTIntHasher,true>,std::allocator<std::__hash_value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((void *)self->mMap, &v3);
}

- (void)removeAllObjects
{
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
  for (i = (uint64_t **)*((void *)self->mMap + 2); i; i = (uint64_t **)*i)
    [i[3] performSelector:a3];
}

- (void)applyFunction:(void *)a3 withState:(void *)a4
{
  for (i = (uint64_t **)*((void *)self->mMap + 2); i; i = (uint64_t **)*i)
    ((void (*)(void, uint64_t *, void *))a3)(*((unsigned int *)i + 4), i[3], a4);
}

- (void)applyFunction:(void *)a3 withState:(void *)a4 andState:(void *)a5
{
  for (i = (uint64_t **)*((void *)self->mMap + 2); i; i = (uint64_t **)*i)
    ((void (*)(void, uint64_t *, void *, void *))a3)(*((unsigned int *)i + 4), i[3], a4, a5);
}

- (void)transformWithFunction:(void *)a3 withState:(void *)a4
{
  for (i = (void **)*((void *)self->mMap + 2); i; i = (void **)*i)
  {
    v7 = i[3];
    uint64_t v8 = (void *)((uint64_t (*)(void, void *, void *))a3)(*((unsigned int *)i + 4), v7, a4);
    if (v8) {
      BOOL v9 = v8 == v7;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9) {
      SFUtility::ObjcSharedPtr<NSObject>::reset(i + 3, v8);
    }
  }
}

- (int64_t)count
{
  return *((void *)self->mMap + 3);
}

- (id)allValues
{
  unsigned int v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[TSTIntegerKeyDict count](self, "count"));
  for (i = (void *)*((void *)self->mMap + 2); i; i = (void *)*i)
    [v3 addObject:i[3]];
  return v3;
}

@end