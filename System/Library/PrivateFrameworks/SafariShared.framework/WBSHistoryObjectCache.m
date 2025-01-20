@interface WBSHistoryObjectCache
- (WBSHistoryObjectCache)init;
- (id).cxx_construct;
- (id)allItems;
- (id)itemForID:(int64_t)a3;
- (id)visitForID:(int64_t)a3;
- (void)_clearNilReferences;
- (void)changeItemIDs:(id)a3;
- (void)changeVisitIDs:(id)a3;
- (void)clear;
- (void)removeItemWithID:(int64_t)a3;
- (void)reserveItemCapacity:(int64_t)a3;
- (void)setItem:(id)a3 forID:(int64_t)a4;
- (void)setVisit:(id)a3 forID:(int64_t)a4;
@end

@implementation WBSHistoryObjectCache

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

- (void)reserveItemCapacity:(int64_t)a3
{
}

- (WBSHistoryObjectCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSHistoryObjectCache;
  v2 = [(WBSHistoryObjectCache *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)allItems
{
  v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:self->_itemsByDatabaseID.__table_.__p2_.__value_];
  for (i = (id *)self->_itemsByDatabaseID.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    id v5 = i[3];
    [v3 addObject:v5];
  }
  return v3;
}

- (id)itemForID:(int64_t)a3
{
  int64_t v5 = a3;
  v3 = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_itemsByDatabaseID.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v5);
  if (v3) {
    v3 = (id *)v3[3];
  }
  return v3;
}

- (void)setItem:(id)a3 forID:(int64_t)a4
{
  id v6 = a3;
  unint64_t v9 = a4;
  v10 = (int64_t *)&v9;
  v7 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)&self->_itemsByDatabaseID, &v9, (uint64_t)&std::piecewise_construct, &v10);
  v8 = (void *)v7[3];
  v7[3] = v6;
}

- (void)removeItemWithID:(int64_t)a3
{
  int64_t v3 = a3;
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__erase_unique<long long>(&self->_itemsByDatabaseID.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v3);
}

- (void)changeItemIDs:(id)a3
{
  id v4 = a3;
  int64_t v5 = *(uint64_t **)([v4 map] + 16);
  if (v5)
  {
    p_itemsByDatabaseID = &self->_itemsByDatabaseID;
    do
    {
      long long v13 = *((_OWORD *)v5 + 1);
      v7 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(p_itemsByDatabaseID, (unint64_t *)&v13);
      v8 = v7;
      if (v7)
      {
        id v9 = (id)v7[3];
        [v9 setDatabaseID:*((void *)&v13 + 1)];
        uint64_t v11 = *((void *)&v13 + 1);
        id v10 = v9;
        id v12 = v10;
        std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::pair<long long,WBSHistoryItem * {__strong}>>((uint64_t)p_itemsByDatabaseID, (unint64_t *)&v11, &v11);

        std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::erase(p_itemsByDatabaseID, v8);
      }
      int64_t v5 = (uint64_t *)*v5;
    }
    while (v5);
  }
}

- (id)visitForID:(int64_t)a3
{
  int64_t v5 = a3;
  WeakRetained = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_weakVisitsByDatabaseID.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v5);
  if (WeakRetained) {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  }
  return WeakRetained;
}

- (void)setVisit:(id)a3 forID:(int64_t)a4
{
  id v6 = a3;
  unint64_t v8 = a4;
  id v9 = (int64_t *)&v8;
  v7 = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)&self->_weakVisitsByDatabaseID, &v8, (uint64_t)&std::piecewise_construct, &v9);
  objc_storeWeak(v7 + 3, v6);
}

- (void)_clearNilReferences
{
  next = (id *)self->_weakVisitsByDatabaseID.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_weakVisitsByDatabaseID = &self->_weakVisitsByDatabaseID;
    do
    {
      while (1)
      {
        id WeakRetained = objc_loadWeakRetained(next + 3);

        if (!WeakRetained) {
          break;
        }
        next = (id *)*next;
        if (!next) {
          return;
        }
      }
      next = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::erase(p_weakVisitsByDatabaseID, (uint64_t *)next);
    }
    while (next);
  }
}

- (void)changeVisitIDs:(id)a3
{
  id v4 = a3;
  [(WBSHistoryObjectCache *)self _clearNilReferences];
  int64_t v5 = *(void **)([v4 map] + 16);
  if (v5)
  {
    p_weakVisitsByDatabaseID = &self->_weakVisitsByDatabaseID;
    do
    {
      v7 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(p_weakVisitsByDatabaseID, v5 + 2);
      unint64_t v8 = v7;
      if (v7)
      {
        id WeakRetained = objc_loadWeakRetained((id *)v7 + 3);
        std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::erase(p_weakVisitsByDatabaseID, v8);
        if (!WeakRetained) {
          break;
        }
        [WeakRetained setDatabaseID:v5[3]];
        unint64_t v11 = v5[3];
        id v10 = WeakRetained;
        id v12 = v10;
        std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::__emplace_unique_key_args<long long,std::pair<long long,WBSHistoryVisit * {__strong}>>((uint64_t)p_weakVisitsByDatabaseID, &v11, &v11);
      }
      int64_t v5 = (void *)*v5;
    }
    while (v5);
  }
}

- (void)clear
{
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::clear((uint64_t)&self->_itemsByDatabaseID);
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::clear((uint64_t)&self->_weakVisitsByDatabaseID);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryVisit * {__weak}>>>::~__hash_table((uint64_t)&self->_weakVisitsByDatabaseID);
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)&self->_itemsByDatabaseID);
}

@end