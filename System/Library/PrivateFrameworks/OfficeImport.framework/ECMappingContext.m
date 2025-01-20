@interface ECMappingContext
+ (id)mappingContext;
- (ECMappingContext)init;
- (id).cxx_construct;
- (id)mappingInfoAtIndex:(unint64_t)a3;
- (id)mappingInfoForObject:(id)a3;
- (unint64_t)mappedSheetIndexForSheetIndex:(unint64_t)a3;
- (unint64_t)mappedSheetIndexForSheetName:(id)a3;
- (unint64_t)mappingInfoCount;
- (void)associateMappingInfo:(id)a3 withSheetName:(id)a4 andSheetIndex:(unint64_t)a5 andObject:(id)a6;
- (void)dealloc;
- (void)mappedSheetNames;
@end

@implementation ECMappingContext

- (ECMappingContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)ECMappingContext;
  v2 = [(ECMappingContext *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mSheetNameToMappedIndex = v2->mSheetNameToMappedIndex;
    v2->mSheetNameToMappedIndex = v3;

    v2->mObjectToMappingInfo = CFDictionaryCreateMutable(0, 64, 0, MEMORY[0x263EFFF90]);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mMappingInfos = v2->mMappingInfos;
    v2->mMappingInfos = v5;
  }
  return v2;
}

+ (id)mappingContext
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)dealloc
{
  mObjectToMappingInfo = self->mObjectToMappingInfo;
  if (mObjectToMappingInfo) {
    CFRelease(mObjectToMappingInfo);
  }
  v4.receiver = self;
  v4.super_class = (Class)ECMappingContext;
  [(ECMappingContext *)&v4 dealloc];
}

- (void)mappedSheetNames
{
}

- (unint64_t)mappedSheetIndexForSheetIndex:(unint64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *)self->mIndexToMappedIndex.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->mIndexToMappedIndex.__tree_.__pair1_;
  objc_super v4 = left;
  if (!left) {
    return -1;
  }
  v6 = p_pair1;
  do
  {
    unint64_t v7 = (unint64_t)v4[4].__value_.__left_;
    BOOL v8 = v7 >= a3;
    if (v7 >= a3) {
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)v4;
    }
    else {
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)&v4[1];
    }
    if (v8) {
      v6 = v4;
    }
    objc_super v4 = *v9;
  }
  while (*v9);
  if (v6 != p_pair1 && v6[4].__value_.__left_ <= (void *)a3) {
    return (unint64_t)v6[5].__value_.__left_;
  }
  else {
    return -1;
  }
}

- (unint64_t)mappedSheetIndexForSheetName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mSheetNameToMappedIndex objectForKey:a3];
  objc_super v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = -1;
  }

  return v5;
}

- (id)mappingInfoForObject:(id)a3
{
  v3 = CFDictionaryGetValue(self->mObjectToMappingInfo, a3);
  return v3;
}

- (unint64_t)mappingInfoCount
{
  return [(NSMutableArray *)self->mMappingInfos count];
}

- (id)mappingInfoAtIndex:(unint64_t)a3
{
  if ([(ECMappingContext *)self mappingInfoCount] >= a3)
  {
    unint64_t v5 = [(NSMutableArray *)self->mMappingInfos objectAtIndex:a3];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMappingInfos, 0);
  objc_storeStrong((id *)&self->mSheetNameToMappedIndex, 0);
  left = self->mIndexToMappedIndex.__tree_.__pair1_.__value_.__left_;
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)&self->mIndexToMappedIndex, left);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

- (void)associateMappingInfo:(id)a3 withSheetName:(id)a4 andSheetIndex:(unint64_t)a5 andObject:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v16 = a5;
  id v12 = a6;
  uint64_t v13 = [(NSMutableArray *)self->mMappingInfos count];
  [(NSMutableArray *)self->mMappingInfos addObject:v10];
  if (a5 != -1)
  {
    v17 = &v16;
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)&self->mIndexToMappedIndex, &v16, (uint64_t)&std::piecewise_construct, (uint64_t **)&v17)[5] = v13;
  }
  if (v11 && [v11 length])
  {
    mSheetNameToMappedIndex = self->mSheetNameToMappedIndex;
    v15 = [NSNumber numberWithUnsignedInteger:v13];
    [(NSMutableDictionary *)mSheetNameToMappedIndex setValue:v15 forKey:v11];
  }
  if (v12) {
    CFDictionarySetValue(self->mObjectToMappingInfo, v12, v10);
  }
}

@end