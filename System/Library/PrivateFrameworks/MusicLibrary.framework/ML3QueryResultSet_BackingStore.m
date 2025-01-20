@interface ML3QueryResultSet_BackingStore
- (BOOL)containsPersistentIDs:(const void *)a3;
- (id).cxx_construct;
- (id)backingStoreByRemovingPersistentIDs:(const void *)a3;
- (int64_t)persistentIDAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
- (void)enumerateSectionsUsingBlock:(id)a3;
- (void)reverseEnumeratePersistentIDsUsingBlock:(id)a3;
- (void)reverseEnumerateSectionsUsingBlock:(id)a3;
@end

@implementation ML3QueryResultSet_BackingStore

- (unint64_t)count
{
  return self->_persistentIDs.__end_ - self->_persistentIDs.__begin_;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (int64_t)persistentIDAtIndex:(unint64_t)a3
{
  begin = self->_persistentIDs.__begin_;
  unint64_t v5 = self->_persistentIDs.__end_ - begin;
  if (v5 <= a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index (%ld) out of bounds (%lu)", a3, v5);
    begin = self->_persistentIDs.__begin_;
  }
  return begin[a3];
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x4012000000;
  v22 = __Block_byref_object_copy__17073;
  v23 = __Block_byref_object_dispose__17074;
  v24 = "";
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = -1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__ML3QueryResultSet_BackingStore_enumerateSectionsUsingBlock___block_invoke;
  v11[3] = &unk_1E5FB5FE0;
  v13 = &v19;
  v14 = &v15;
  id v5 = v4;
  id v12 = v5;
  v6 = (void (**)(void))MEMORY[0x1B3E93EE0](v11);
  begin = self->_sections.__begin_;
  end = self->_sections.__end_;
  if (begin != end)
  {
    v9 = v16;
    do
    {
      int v10 = *begin;
      if (v10 != *((unsigned __int8 *)v9 + 24))
      {
        v6[2](v6);
        v9 = v16;
        *((unsigned char *)v16 + 24) = v10;
      }
      ++v20[7];
      ++begin;
    }
    while (begin != end);
  }
  v6[2](v6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (void).cxx_destruct
{
  begin = self->_sections.__begin_;
  if (begin)
  {
    self->_sections.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_persistentIDs.__begin_;
  if (v4)
  {
    self->_persistentIDs.__end_ = v4;
    operator delete(v4);
  }
}

- (id)backingStoreByRemovingPersistentIDs:(const void *)a3
{
  begin = self->_persistentIDs.__begin_;
  end = self->_persistentIDs.__end_;
  v7 = objc_alloc_init(ML3QueryResultSet_MutableBackingStore);
  if (end != begin)
  {
    uint64_t v8 = 0;
    if ((unint64_t)(end - begin) <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = end - begin;
    }
    do
    {
      unint64_t v10 = self->_persistentIDs.__begin_[v8];
      if (!std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>(*(void *)a3, *((void *)a3 + 1), v10))
      {
        id v12 = (char *)v7->super._persistentIDs.__end_;
        value = v7->super._persistentIDs.__end_cap_.__value_;
        if (v12 >= (char *)value)
        {
          v14 = v7->super._persistentIDs.__begin_;
          uint64_t v15 = (v12 - (char *)v14) >> 3;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 61) {
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v17 = (char *)value - (char *)v14;
          if (v17 >> 2 > v16) {
            unint64_t v16 = v17 >> 2;
          }
          BOOL v18 = (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8;
          unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v18) {
            unint64_t v19 = v16;
          }
          if (v19)
          {
            unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v19);
            v14 = v7->super._persistentIDs.__begin_;
            id v12 = (char *)v7->super._persistentIDs.__end_;
          }
          else
          {
            uint64_t v20 = 0;
          }
          uint64_t v21 = (int64_t *)(v19 + 8 * v15);
          *uint64_t v21 = v10;
          v13 = v21 + 1;
          while (v12 != (char *)v14)
          {
            int64_t v22 = *((void *)v12 - 1);
            v12 -= 8;
            *--uint64_t v21 = v22;
          }
          v7->super._persistentIDs.__begin_ = v21;
          v7->super._persistentIDs.__end_ = v13;
          v7->super._persistentIDs.__end_cap_.__value_ = (int64_t *)(v19 + 8 * v20);
          if (v14) {
            operator delete(v14);
          }
        }
        else
        {
          *(void *)id v12 = v10;
          v13 = (int64_t *)(v12 + 8);
        }
        v7->super._persistentIDs.__end_ = v13;
        char v23 = self->_sections.__begin_[v8];
        uint64_t v25 = v7->super._sections.__end_;
        v24 = v7->super._sections.__end_cap_.__value_;
        if (v25 >= v24)
        {
          v27 = v7->super._sections.__begin_;
          v28 = (unsigned char *)(v25 - v27);
          uint64_t v29 = v25 - v27 + 1;
          if (v29 < 0) {
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v30 = v24 - v27;
          if (2 * v30 > v29) {
            uint64_t v29 = 2 * v30;
          }
          if (v30 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v31 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v31 = v29;
          }
          if (v31) {
            v32 = (char *)operator new(v31);
          }
          else {
            v32 = 0;
          }
          v33 = &v28[(void)v32];
          v34 = &v28[(void)v32];
          char *v34 = v23;
          uint64_t v26 = v34 + 1;
          if (v25 != v27)
          {
            v35 = &v25[~(unint64_t)v27];
            do
            {
              char v36 = *--v25;
              (v35--)[(void)v32] = v36;
            }
            while (v25 != v27);
            uint64_t v25 = v7->super._sections.__begin_;
            v33 = v32;
          }
          v7->super._sections.__begin_ = v33;
          v7->super._sections.__end_ = v26;
          v7->super._sections.__end_cap_.__value_ = &v32[v31];
          if (v25) {
            operator delete(v25);
          }
        }
        else
        {
          *uint64_t v25 = v23;
          uint64_t v26 = v25 + 1;
        }
        v7->super._sections.__end_ = v26;
      }
      ++v8;
    }
    while (v8 != v9);
  }

  return v7;
}

- (void)reverseEnumerateSectionsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x4012000000;
  int64_t v22 = __Block_byref_object_copy__17073;
  char v23 = __Block_byref_object_dispose__17074;
  v24 = "";
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = -1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ML3QueryResultSet_BackingStore_reverseEnumerateSectionsUsingBlock___block_invoke;
  v11[3] = &unk_1E5FB5FE0;
  v13 = &v19;
  v14 = &v15;
  id v5 = v4;
  id v12 = v5;
  v6 = (void (**)(void))MEMORY[0x1B3E93EE0](v11);
  begin = self->_sections.__begin_;
  end = self->_sections.__end_;
  if (end != begin)
  {
    uint64_t v9 = v16;
    do
    {
      int v10 = *--end;
      if (v10 != *((unsigned __int8 *)v9 + 24))
      {
        v6[2](v6);
        uint64_t v9 = v16;
        *((unsigned char *)v16 + 24) = *end;
        begin = self->_sections.__begin_;
      }
      ++v20[7];
    }
    while (end != begin);
  }
  v6[2](v6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (BOOL)containsPersistentIDs:(const void *)a3
{
  begin = self->_persistentIDs.__begin_;
  end = self->_persistentIDs.__end_;
  if (begin == end) {
    return 0;
  }
  uint64_t v5 = *(void *)a3;
  unint64_t v6 = *((void *)a3 + 1);
  v7 = begin + 1;
  do
  {
    uint64_t v8 = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>(v5, v6, *(v7 - 1));
    BOOL v10 = v8 == 0;
    BOOL result = v8 != 0;
    BOOL v10 = !v10 || v7++ == end;
  }
  while (!v10);
  return result;
}

- (void)reverseEnumeratePersistentIDsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  uint64_t v5 = 0;
  end = self->_persistentIDs.__end_;
  do
  {
    if (end == self->_persistentIDs.__begin_) {
      break;
    }
    char v8 = 0;
    uint64_t v7 = *--end;
    v4[2](v4, v7, v5++, &v8);
  }
  while (!v8);
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  begin = self->_persistentIDs.__begin_;
  end = self->_persistentIDs.__end_;
  if (begin != end)
  {
    uint64_t v7 = 0;
    char v8 = begin + 1;
    do
    {
      uint64_t v9 = *(v8 - 1);
      char v11 = 0;
      v4[2](v4, v9, v7++, &v11);
      if (v11) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v8 == end;
      }
      ++v8;
    }
    while (!v10);
  }
}

@end