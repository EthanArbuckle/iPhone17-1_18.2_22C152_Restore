@interface TSUUUIDSet
- (BOOL)containsUuid:(const void *)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isAllInvalid;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_addUUID:(const void *)a3;
- (BOOL)p_removeUUID:(const void *)a3;
- (TSUUUIDSet)initWithUUID:(const void *)a3;
- (TSUUUIDSet)initWithUUIDSet:(id)a3;
- (TSUUUIDSet)initWithUUIDVector:(const void *)a3;
- (UUIDData<TSP::UUIDData>)anyUuid;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)expandedSetWithUuid:(const void *)a3;
- (id)expandedSetWithUuids:(const void *)a3;
- (id)expandedSetWithUuidsFromVector:(const void *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)reducedSetMinusUuid:(const void *)a3;
- (id)reducedSetMinusUuids:(const void *)a3;
- (id)reducedSetMinusUuidsFromVector:(const void *)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unsigned)index;
- (vector<TSU::UUIDData<TSP::UUIDData>,)uuidsAsVector;
- (void)foreachUuid:(id)a3;
- (void)p_addUUIDs:(const void *)a3;
- (void)p_addUUIDsFromVector:(const void *)a3;
- (void)p_removeUUIDs:(const void *)a3;
- (void)p_removeUUIDsFromVector:(const void *)a3;
- (void)setIndex:(unsigned int)a3;
@end

@implementation TSUUUIDSet

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (TSUUUIDSet)initWithUUID:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSUUUIDSet;
  v4 = [(TSUUUIDSet *)&v7 init];
  v5 = v4;
  if (v4) {
    std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__emplace_unique_key_args<TSU::UUIDData<TSP::UUIDData>,TSU::UUIDData<TSP::UUIDData> const&>((uint64_t)&v4->_uuidSet, a3, a3);
  }
  return v5;
}

- (TSUUUIDSet)initWithUUIDSet:(id)a3
{
  v4 = (TSUUUIDSet *)a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUUUIDSet;
  v5 = [(TSUUUIDSet *)&v9 init];
  v6 = v5;
  if (v4)
  {
    if (v5) {
      BOOL v7 = v5 == v4;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      v5->_uuidSet.__table_.__p3_.__value_ = v4->_uuidSet.__table_.__p3_.__value_;
      std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<TSU::UUIDData<TSP::UUIDData>,void *> *>>(&v5->_uuidSet.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v4->_uuidSet.__table_.__p1_.__value_.__next_, 0);
    }
  }

  return v6;
}

- (TSUUUIDSet)initWithUUIDVector:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSUUUIDSet;
  v4 = [(TSUUUIDSet *)&v9 init];
  if (v4)
  {
    v5 = *(long long **)a3;
    v6 = (long long *)*((void *)a3 + 1);
    if (*(long long **)a3 != v6)
    {
      do
      {
        long long v8 = *v5;
        std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__emplace_unique_key_args<TSU::UUIDData<TSP::UUIDData>,TSU::UUIDData<TSP::UUIDData> const&>((uint64_t)&v4->_uuidSet, &v8, &v8);
        ++v5;
      }
      while (v5 != v6);
    }
  }
  return v4;
}

- (vector<TSU::UUIDData<TSP::UUIDData>,)uuidsAsVector
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x4812000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = &unk_238F84D77;
  v14 = 0;
  uint64_t v15 = 0;
  __p = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__TSUUUIDSet_uuidsAsVector__block_invoke;
  v6[3] = &unk_264D61680;
  v6[4] = &v7;
  [(TSUUUIDSet *)self foreachUuid:v6];
  v4 = v8;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<TSU::UUIDData<TSP::UUIDData>>::__init_with_size[abi:ne180100]<TSU::UUIDData<TSP::UUIDData>*,TSU::UUIDData<TSP::UUIDData>*>(retstr, (const void *)v4[6], v4[7], (v4[7] - v4[6]) >> 4);
  _Block_object_dispose(&v7, 8);
  result = (vector<TSU::UUIDData<TSP::UUIDData>, std::allocator<TSU::UUIDData<TSP::UUIDData>>> *)__p;
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  return result;
}

void __27__TSUUUIDSet_uuidsAsVector__block_invoke(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v4 = (_OWORD *)v3[7];
  unint64_t v5 = v3[8];
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = v3[6];
    uint64_t v8 = ((uint64_t)v4 - v7) >> 4;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 60) {
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - v7;
    if (v10 >> 3 > v9) {
      unint64_t v9 = v10 >> 3;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)(v3 + 8), v11);
    }
    else {
      v12 = 0;
    }
    v13 = &v12[16 * v8];
    v14 = &v12[16 * v11];
    *(_OWORD *)v13 = *a2;
    v6 = v13 + 16;
    v16 = (char *)v3[6];
    uint64_t v15 = (char *)v3[7];
    if (v15 != v16)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v15 - 1);
        v13 -= 16;
        v15 -= 16;
      }
      while (v15 != v16);
      uint64_t v15 = (char *)v3[6];
    }
    v3[6] = v13;
    v3[7] = v6;
    v3[8] = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    _OWORD *v4 = *a2;
    v6 = v4 + 1;
  }
  v3[7] = v6;
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__TSUUUIDSet_description__block_invoke;
  v5[3] = &unk_264D61680;
  v5[4] = &v6;
  [(TSUUUIDSet *)self foreachUuid:v5];
  v3 = [NSString stringWithFormat:@"%@<%p>: %@", objc_opt_class(), self, v7[5]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__TSUUUIDSet_description__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v3 = TSU::UUIDData<TSP::UUIDData>::NSStringValue(a2);
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = (id)v3;
  if (v4)
  {
    [v4 appendFormat:@", %@", v3];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F089D8] stringWithString:v3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (BOOL)containsUuid:(const void *)a3
{
  return std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::find<TSU::UUIDData<TSP::UUIDData>>(&self->_uuidSet.__table_.__bucket_list_.__ptr_.__value_, a3) != 0;
}

- (BOOL)intersectsSet:(id)a3
{
  v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if (self->_uuidSet.__table_.__p2_.__value_ <= v4[5])
    {
      uint64_t v9 = 0;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x2020000000;
      char v12 = 0;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __28__TSUUUIDSet_intersectsSet___block_invoke;
      v8[3] = &unk_264D616A8;
      v8[4] = self;
      v8[5] = &v9;
      [(TSUUUIDSet *)self foreachUuid:v8];
      char v6 = *((unsigned char *)v10 + 24) != 0;
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      char v6 = [v4 intersectsSet:self];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

void *__28__TSUUUIDSet_intersectsSet___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  result = std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::find<TSU::UUIDData<TSP::UUIDData>>((void *)(*(void *)(a1 + 32) + 16), a2);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TSUUUIDSet *)a3;
  uint64_t v5 = v4;
  BOOL v6 = self == v4;
  if (v4 && self != v4)
  {
    if (self->_uuidSet.__table_.__p2_.__value_ == v4->_uuidSet.__table_.__p2_.__value_)
    {
      uint64_t v9 = 0;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x2020000000;
      char v12 = 0;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __22__TSUUUIDSet_isEqual___block_invoke;
      v8[3] = &unk_264D616A8;
      v8[4] = self;
      v8[5] = &v9;
      [(TSUUUIDSet *)self foreachUuid:v8];
      BOOL v6 = *((unsigned char *)v10 + 24) == 0;
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

void *__22__TSUUUIDSet_isEqual___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  result = std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::find<TSU::UUIDData<TSP::UUIDData>>((void *)(*(void *)(a1 + 32) + 16), a2);
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_uuidSet.__table_.__p2_.__value_;
}

- (UUIDData<TSP::UUIDData>)anyUuid
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x4012000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  uint64_t v11 = __Block_byref_object_dispose__9;
  char v12 = &unk_238F84D77;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __21__TSUUUIDSet_anyUuid__block_invoke;
  v6[3] = &unk_264D61680;
  v6[4] = &v7;
  [(TSUUUIDSet *)self foreachUuid:v6];
  unint64_t v2 = v8[6];
  unint64_t v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  unint64_t v4 = v2;
  unint64_t v5 = v3;
  result.var0.var2.var1 = v5;
  result.var0.var2.var0 = v4;
  return result;
}

__n128 __21__TSUUUIDSet_anyUuid__block_invoke(uint64_t a1, __n128 *a2, unsigned char *a3)
{
  __n128 result = *a2;
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *a2;
  *a3 = 1;
  return result;
}

- (BOOL)isAllInvalid
{
  if ([(TSUUUIDSet *)self count] != 1) {
    return 0;
  }
  uint64_t v3 = [(TSUUUIDSet *)self anyUuid];
  return (v3 | v4) == 0;
}

- (id)expandedSetWithUuid:(const void *)a3
{
  uint64_t v4 = self;
  if (![(TSUUUIDSet *)v4 containsUuid:a3])
  {
    unint64_t v5 = (TSUUUIDSet *)[(TSUUUIDSet *)v4 copy];

    uint64_t v4 = v5;
    [(TSUUUIDSet *)v5 p_addUUID:a3];
  }
  return v4;
}

- (id)reducedSetMinusUuid:(const void *)a3
{
  uint64_t v4 = self;
  if ([(TSUUUIDSet *)v4 containsUuid:a3])
  {
    unint64_t v5 = (TSUUUIDSet *)[(TSUUUIDSet *)v4 copy];

    uint64_t v4 = v5;
    [(TSUUUIDSet *)v5 p_removeUUID:a3];
  }
  return v4;
}

- (id)expandedSetWithUuids:(const void *)a3
{
  uint64_t v4 = self;
  unint64_t v5 = v4;
  if (*((void *)a3 + 3))
  {
    BOOL v6 = (TSUUUIDSet *)[(TSUUUIDSet *)v4 copy];

    unint64_t v5 = v6;
    [(TSUUUIDSet *)v6 p_addUUIDs:a3];
  }
  return v5;
}

- (id)reducedSetMinusUuids:(const void *)a3
{
  uint64_t v4 = self;
  unint64_t v5 = v4;
  if (*((void *)a3 + 3))
  {
    BOOL v6 = (TSUUUIDSet *)[(TSUUUIDSet *)v4 copy];

    unint64_t v5 = v6;
    [(TSUUUIDSet *)v6 p_addUUIDs:a3];
  }
  return v5;
}

- (id)expandedSetWithUuidsFromVector:(const void *)a3
{
  uint64_t v4 = self;
  unint64_t v5 = v4;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    BOOL v6 = (TSUUUIDSet *)[(TSUUUIDSet *)v4 copy];

    unint64_t v5 = v6;
    [(TSUUUIDSet *)v6 p_addUUIDsFromVector:a3];
  }
  return v5;
}

- (id)reducedSetMinusUuidsFromVector:(const void *)a3
{
  uint64_t v4 = self;
  unint64_t v5 = v4;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    BOOL v6 = (TSUUUIDSet *)[(TSUUUIDSet *)v4 copy];

    unint64_t v5 = v6;
    [(TSUUUIDSet *)v6 p_removeUUIDsFromVector:a3];
  }
  return v5;
}

- (void)foreachUuid:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, unsigned char *))a3;
  char v7 = 0;
  next = self->_uuidSet.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4[2](v4, (uint64_t)(next + 2), &v7);
      next = (void *)*next;
      if (v7) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = next == 0;
      }
    }
    while (!v6);
  }
}

- (unint64_t)count
{
  return self->_uuidSet.__table_.__p2_.__value_;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [TSUUUIDSet alloc];
  return [(TSUUUIDSet *)v4 initWithUUIDSet:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [TSUMutableUUIDSet alloc];
  return [(TSUUUIDSet *)v4 initWithUUIDSet:self];
}

- (BOOL)p_addUUID:(const void *)a3
{
  std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__emplace_unique_key_args<TSU::UUIDData<TSP::UUIDData>,TSU::UUIDData<TSP::UUIDData> const&>((uint64_t)&self->_uuidSet, a3, a3);
  return v3 & 1;
}

- (BOOL)p_removeUUID:(const void *)a3
{
  p_uuidSet = &self->_uuidSet;
  unint64_t v5 = std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::find<TSU::UUIDData<TSP::UUIDData>>(&self->_uuidSet.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v5) {
    std::__hash_table<TSU::UUIDData<TSP::UUIDData>,std::hash<TSU::UUIDData<TSP::UUIDData>>,std::equal_to<TSU::UUIDData<TSP::UUIDData>>,std::allocator<TSU::UUIDData<TSP::UUIDData>>>::__erase_unique<TSU::UUIDData<TSP::UUIDData>>(p_uuidSet, a3);
  }
  return v5 != 0;
}

- (void)p_addUUIDs:(const void *)a3
{
  for (i = (uint64_t *)*((void *)a3 + 2); i; i = (uint64_t *)*i)
  {
    long long v5 = *((_OWORD *)i + 1);
    [(TSUUUIDSet *)self p_addUUID:&v5];
  }
}

- (void)p_removeUUIDs:(const void *)a3
{
  for (i = (uint64_t *)*((void *)a3 + 2); i; i = (uint64_t *)*i)
  {
    long long v5 = *((_OWORD *)i + 1);
    [(TSUUUIDSet *)self p_removeUUID:&v5];
  }
}

- (void)p_addUUIDsFromVector:(const void *)a3
{
  for (i = *(long long **)a3; i != *((long long **)a3 + 1); ++i)
  {
    long long v6 = *i;
    long long v7 = v6;
    [(TSUUUIDSet *)self p_addUUID:&v7];
  }
}

- (void)p_removeUUIDsFromVector:(const void *)a3
{
  for (i = *(long long **)a3; i != *((long long **)a3 + 1); ++i)
  {
    long long v6 = *i;
    long long v7 = v6;
    [(TSUUUIDSet *)self p_removeUUID:&v7];
  }
}

- (unsigned)index
{
  return self->_index;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  return self;
}

@end