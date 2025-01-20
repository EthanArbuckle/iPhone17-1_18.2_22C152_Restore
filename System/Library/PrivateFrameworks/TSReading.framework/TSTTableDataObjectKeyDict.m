@interface TSTTableDataObjectKeyDict
- (TSTTableDataObjectKeyDict)init;
- (unint64_t)count;
- (unsigned)keyForObject:(id)a3;
- (void)dealloc;
- (void)removeAllKeys;
- (void)removeKeyForObject:(id)a3;
- (void)setKey:(unsigned int)a3 forObject:(id)a4;
@end

@implementation TSTTableDataObjectKeyDict

- (TSTTableDataObjectKeyDict)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataObjectKeyDict;
  if ([(TSTTableDataObjectKeyDict *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mMap = self->mMap;
  if (mMap)
  {
    uint64_t v4 = std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::~__hash_table((uint64_t)mMap);
    MEMORY[0x223CB8F20](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSTTableDataObjectKeyDict;
  [(TSTTableDataObjectKeyDict *)&v5 dealloc];
}

- (unsigned)keyForObject:(id)a3
{
  mMap = self->mMap;
  id v7 = a3;
  id v4 = a3;
  objc_super v5 = std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::find<SFUtility::ObjcSharedPtr<TSTTableDataObject>>(mMap, &v7);

  if (v5) {
    return *((_DWORD *)v5 + 6);
  }
  else {
    return 0;
  }
}

- (void)setKey:(unsigned int)a3 forObject:(id)a4
{
  if (!a3)
  {
    id v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSTTableDataObjectKeyDict setKey:forObject:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableDataObjectKeyDict.mm"), 68, @"Can't set invalid keys in this map!");
  }
  mMap = self->mMap;
  id v10 = a4;
  id v12 = a4;
  id v11 = a4;
  unsigned int v13 = a3;
  std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::__emplace_unique_key_args<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::pair<SFUtility::ObjcSharedPtr<TSTTableDataObject> const,unsigned int>>((uint64_t)mMap, &v12, (uint64_t)&v12);
}

- (void)removeKeyForObject:(id)a3
{
  mMap = self->mMap;
  id v5 = a3;
  id v4 = a3;
  std::__hash_table<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,std::__unordered_map_hasher<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectHasher,TSTTableDataObjectEqual,true>,std::__unordered_map_equal<SFUtility::ObjcSharedPtr<TSTTableDataObject>,std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>,TSTTableDataObjectEqual,TSTTableDataObjectHasher,true>,std::allocator<std::__hash_value_type<SFUtility::ObjcSharedPtr<TSTTableDataObject>,unsigned int>>>::__erase_unique<SFUtility::ObjcSharedPtr<TSTTableDataObject>>(mMap, &v5);
}

- (void)removeAllKeys
{
}

- (unint64_t)count
{
  return *((void *)self->mMap + 3);
}

@end