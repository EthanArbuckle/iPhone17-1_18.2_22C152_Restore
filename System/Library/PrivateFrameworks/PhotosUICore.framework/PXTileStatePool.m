@interface PXTileStatePool
- (PXTileState)_mutableStateAtIndex:(unint64_t)a3;
- (PXTileStatePool)init;
- (id).cxx_construct;
- (id)description;
- (id)indexesOfStatesPassingTest:(id)a3;
- (int64_t)count;
- (unint64_t)checkOutIndexWithInitialConfiguration:(id)a3;
- (unint64_t)indexOfFirstStatePassingTest:(id)a3;
- (unint64_t)indexOfStateWithTargetIdentifier:(PXTileIdentifier *)a3;
- (void)_cleanupStateAtIndex:(unint64_t)a3;
- (void)_storeCurrentFrameLookupForTileState:(PXTileState *)a3 withIndex:(unint64_t)a4;
- (void)_storeTargetIdentifierLookupForTileState:(PXTileState *)a3 withIndex:(unint64_t)a4;
- (void)checkInIndex:(unint64_t)a3;
- (void)checkInIndexes:(id)a3;
- (void)dealloc;
- (void)enumerateStatesAtIndexes:(id)a3 usingBlock:(id)a4;
- (void)enumerateStatesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateStatesUsingBlock:(id)a3;
- (void)setCurrentGeometry:(const PXTileGeometry *)a3 forTileStateAtIndex:(unint64_t)a4;
- (void)setTargetIdentifier:(PXTileIdentifier *)a3 forTileStateAtIndex:(unint64_t)a4;
@end

@implementation PXTileStatePool

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageKeysToRemove, 0);
  objc_storeStrong((id *)&self->_unusedIndexes, 0);
  objc_storeStrong((id *)&self->_usedIndexes, 0);
  objc_storeStrong((id *)&self->_tileIndexesByPageKey, 0);
  next = self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
  self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p;\n", objc_opt_class(), self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __30__PXTileStatePool_description__block_invoke;
  v12[3] = &unk_1E5DBBF28;
  id v4 = v3;
  id v13 = v4;
  [(PXTileStatePool *)self enumerateStatesUsingBlock:v12];
  [v4 appendString:@"* targetIdentifier -> index lookup\n"];
  for (i = self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_; i; i = *(_OWORD **)i)
  {
    long long v6 = i[4];
    v10[2] = i[3];
    v10[3] = v6;
    v10[4] = i[5];
    uint64_t v11 = *((void *)i + 12);
    long long v7 = i[2];
    v10[0] = i[1];
    v10[1] = v7;
    v8 = PXTileIdentifierDescription((unint64_t *)v10);
    [v4 appendFormat:@"%@ -> %lu\n", v8, *((void *)i + 13)];
  }
  [v4 appendFormat:@">"];

  return v4;
}

void __30__PXTileStatePool_description__block_invoke(int a1, int a2, void *__src)
{
  memcpy(__dst, __src, sizeof(__dst));
  PXTileStateDescription(__dst);
}

- (void)_storeCurrentFrameLookupForTileState:(PXTileState *)a3 withIndex:(unint64_t)a4
{
}

void __66__PXTileStatePool__storeCurrentFrameLookupForTileState_withIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:a2];
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F28E60] indexSet];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setObject:forKey:");
  }
  [v3 addIndex:*(void *)(a1 + 40)];
}

- (void)_storeTargetIdentifierLookupForTileState:(PXTileState *)a3 withIndex:(unint64_t)a4
{
  p_var2 = &a3->var2;
  unint64_t length = a3->var2.length;
  if (!length) {
    return;
  }
  uint64_t v9 = 0;
  unint64_t v10 = a3->var2.length;
  do
  {
    v10 ^= a3->var2.index[v9] << v9;
    ++v9;
  }
  while (length != v9);
  unint64_t value = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= value) {
        unint64_t v4 = v10 % value;
      }
    }
    else
    {
      unint64_t v4 = (value - 1) & v10;
    }
    id v13 = (void ***)self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v13)
    {
      for (i = *v13; i; i = (void **)*i)
      {
        unint64_t v15 = (unint64_t)i[1];
        if (v15 == v10)
        {
          v16 = i[2];
          BOOL v17 = v16 == (void *)length;
          if (v16) {
            BOOL v18 = v16 == (void *)length;
          }
          else {
            BOOL v18 = 0;
          }
          if (v18)
          {
            unint64_t v19 = 0;
            do
            {
              v20 = i[v19 + 3];
              unint64_t v21 = a3->var2.index[v19];
              BOOL v17 = v20 == (void *)v21;
              ++v19;
            }
            while (v19 < length && v20 == (void *)v21);
          }
          if (v17) {
            goto LABEL_85;
          }
        }
        else
        {
          if (v12.u32[0] > 1uLL)
          {
            if (v15 >= value) {
              v15 %= value;
            }
          }
          else
          {
            v15 &= value - 1;
          }
          if (v15 != v4) {
            break;
          }
        }
      }
    }
  }
  i = (void **)operator new(0x70uLL);
  _OWORD *i = 0;
  i[1] = (void *)v10;
  long long v22 = *(_OWORD *)&p_var2->index[5];
  *((_OWORD *)i + 3) = *(_OWORD *)&p_var2->index[3];
  *((_OWORD *)i + 4) = v22;
  *((_OWORD *)i + 5) = *(_OWORD *)&p_var2->index[7];
  unint64_t v23 = p_var2->index[9];
  long long v24 = *(_OWORD *)&p_var2->index[1];
  *((_OWORD *)i + 1) = *(_OWORD *)&p_var2->length;
  *((_OWORD *)i + 2) = v24;
  i[12] = (void *)v23;
  i[13] = 0;
  float v25 = (float)(self->_indexByTargetIdentifier.__table_.__p2_.__value_ + 1);
  float v26 = self->_indexByTargetIdentifier.__table_.__p3_.__value_;
  if (!value || (float)(v26 * (float)value) < v25)
  {
    BOOL v27 = 1;
    if (value >= 3) {
      BOOL v27 = (value & (value - 1)) != 0;
    }
    unint64_t v28 = v27 | (2 * value);
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      int8x8_t prime = (int8x8_t)v29;
    }
    else {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t value = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(void *)&prime > value) {
      goto LABEL_41;
    }
    if (*(void *)&prime < value)
    {
      unint64_t v37 = vcvtps_u32_f32((float)self->_indexByTargetIdentifier.__table_.__p2_.__value_/ self->_indexByTargetIdentifier.__table_.__p3_.__value_);
      if (value < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)value), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        unint64_t v37 = std::__next_prime(v37);
      }
      else
      {
        uint64_t v39 = 1 << -(char)__clz(v37 - 1);
        if (v37 >= 2) {
          unint64_t v37 = v39;
        }
      }
      if (*(void *)&prime <= v37) {
        int8x8_t prime = (int8x8_t)v37;
      }
      if (*(void *)&prime >= value)
      {
        unint64_t value = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_41:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v31 = (void **)operator new(8 * *(void *)&prime);
          v32 = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
          self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_ = v31;
          if (v32) {
            operator delete(v32);
          }
          uint64_t v33 = 0;
          self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v33++] = 0;
          while (*(void *)&prime != v33);
          next = self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_;
          if (next)
          {
            unint64_t v35 = next[1];
            uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(void *)&prime) {
                v35 %= *(void *)&prime;
              }
            }
            else
            {
              v35 &= *(void *)&prime - 1;
            }
            self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v35] = &self->_indexByTargetIdentifier.__table_.__p1_;
            v40 = (void *)*next;
            if (*next)
            {
              do
              {
                unint64_t v41 = v40[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v41 >= *(void *)&prime) {
                    v41 %= *(void *)&prime;
                  }
                }
                else
                {
                  v41 &= *(void *)&prime - 1;
                }
                if (v41 != v35)
                {
                  v42 = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v42[v41])
                  {
                    v42[v41] = next;
                    goto LABEL_66;
                  }
                  void *next = *v40;
                  void *v40 = *(void *)self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v41];
                  *(void *)self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v41] = v40;
                  v40 = next;
                }
                unint64_t v41 = v35;
LABEL_66:
                next = v40;
                v40 = (void *)*v40;
                unint64_t v35 = v41;
              }
              while (v40);
            }
          }
          unint64_t value = (unint64_t)prime;
          goto LABEL_70;
        }
        v46 = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
        self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v46) {
          operator delete(v46);
        }
        unint64_t value = 0;
        self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_70:
    if ((value & (value - 1)) != 0)
    {
      if (v10 >= value) {
        unint64_t v4 = v10 % value;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (value - 1) & v10;
    }
  }
  v43 = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
  v44 = (void **)v43[v4];
  if (v44)
  {
    _OWORD *i = *v44;
  }
  else
  {
    _OWORD *i = self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_;
    self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_ = i;
    v43[v4] = &self->_indexByTargetIdentifier.__table_.__p1_;
    if (!*i) {
      goto LABEL_84;
    }
    unint64_t v45 = *((void *)*i + 1);
    if ((value & (value - 1)) != 0)
    {
      if (v45 >= value) {
        v45 %= value;
      }
    }
    else
    {
      v45 &= value - 1;
    }
    v44 = &self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v45];
  }
  *v44 = i;
LABEL_84:
  ++self->_indexByTargetIdentifier.__table_.__p2_.__value_;
LABEL_85:
  i[13] = (void *)a4;
}

- (void)setCurrentGeometry:(const PXTileGeometry *)a3 forTileStateAtIndex:(unint64_t)a4
{
}

void __58__PXTileStatePool_setCurrentGeometry_forTileStateAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:a2];
  [v3 removeIndex:*(void *)(a1 + 40)];
}

- (void)setTargetIdentifier:(PXTileIdentifier *)a3 forTileStateAtIndex:(unint64_t)a4
{
  states = self->_states;
  v8 = &states[a4];
  p_unint64_t length = &v8->var2.length;
  unint64_t length = v8->var2.length;
  unint64_t v11 = a3->length;
  BOOL v12 = length == a3->length;
  if (length) {
    BOOL v13 = length == v11;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    unint64_t v14 = 0;
    unint64_t index = (unint64_t)states[a4].var2.index;
    do
    {
      uint64_t v16 = *(void *)(index + 8 * v14);
      unint64_t v17 = a3->index[v14];
      BOOL v12 = v16 == v17;
      ++v14;
    }
    while (v14 < length && v16 == v17);
  }
  if (!v12)
  {
    if (v11) {
      goto LABEL_11;
    }
    long long v22 = *(_OWORD *)&v8->var2.index[1];
    v27[0] = *(_OWORD *)p_length;
    v27[1] = v22;
    long long v23 = *(_OWORD *)&v8->var2.index[3];
    long long v24 = *(_OWORD *)&v8->var2.index[5];
    long long v25 = *(_OWORD *)&v8->var2.index[7];
    unint64_t v28 = v8->var2.index[9];
    v27[3] = v24;
    v27[4] = v25;
    v27[2] = v23;
    unint64_t v26 = [(PXTileStatePool *)self indexOfStateWithTargetIdentifier:v27];
    if (v26 == 0x7FFFFFFFFFFFFFFFLL || v26 == a4) {
LABEL_11:
    }
      std::__hash_table<std::__hash_value_type<PXTileIdentifier,unsigned long>,std::__unordered_map_hasher<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::hash<PXTileIdentifier>,std::equal_to<PXTileIdentifier>,true>,std::__unordered_map_equal<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::equal_to<PXTileIdentifier>,std::hash<PXTileIdentifier>,true>,std::allocator<std::__hash_value_type<PXTileIdentifier,unsigned long>>>::__erase_unique<PXTileIdentifier>(&self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_, p_length);
    long long v18 = *(_OWORD *)&a3->index[1];
    *(_OWORD *)p_unint64_t length = *(_OWORD *)&a3->length;
    *(_OWORD *)&v8->var2.index[1] = v18;
    long long v19 = *(_OWORD *)&a3->index[3];
    long long v20 = *(_OWORD *)&a3->index[5];
    long long v21 = *(_OWORD *)&a3->index[7];
    v8->var2.index[9] = a3->index[9];
    *(_OWORD *)&v8->var2.index[5] = v20;
    *(_OWORD *)&v8->var2.index[7] = v21;
    *(_OWORD *)&v8->var2.index[3] = v19;
    [(PXTileStatePool *)self _storeTargetIdentifierLookupForTileState:v8 withIndex:a4];
  }
}

- (unint64_t)indexOfStateWithTargetIdentifier:(PXTileIdentifier *)a3
{
  unint64_t v4 = std::__hash_table<std::__hash_value_type<PXTileIdentifier,unsigned long>,std::__unordered_map_hasher<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::hash<PXTileIdentifier>,std::equal_to<PXTileIdentifier>,true>,std::__unordered_map_equal<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::equal_to<PXTileIdentifier>,std::hash<PXTileIdentifier>,true>,std::allocator<std::__hash_value_type<PXTileIdentifier,unsigned long>>>::find<PXTileIdentifier>(&self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_, &a3->length);
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    unint64_t v6 = v4[13];
    if ([(NSMutableIndexSet *)self->_usedIndexes containsIndex:v6]) {
      return v6;
    }
  }
  return v5;
}

- (id)indexesOfStatesPassingTest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
  usedIndexes = self->_usedIndexes;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__PXTileStatePool_indexesOfStatesPassingTest___block_invoke;
  v12[3] = &unk_1E5DB6970;
  void v12[4] = self;
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  id v13 = v8;
  [(NSMutableIndexSet *)usedIndexes enumerateIndexesUsingBlock:v12];
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

uint64_t __46__PXTileStatePool_indexesOfStatesPassingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (result)
  {
    unint64_t v5 = *(void **)(a1 + 40);
    return [v5 addIndex:a2];
  }
  return result;
}

- (unint64_t)indexOfFirstStatePassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  usedIndexes = self->_usedIndexes;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PXTileStatePool_indexOfFirstStatePassingTest___block_invoke;
  v9[3] = &unk_1E5DBE138;
  v9[4] = self;
  id v10 = v4;
  unint64_t v11 = &v12;
  id v6 = v4;
  [(NSMutableIndexSet *)usedIndexes enumerateIndexesUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __48__PXTileStatePool_indexOfFirstStatePassingTest___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (void)enumerateStatesInRect:(CGRect)a3 usingBlock:(id)a4
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  id v4 = a4;
  PXEnumeratePageKeysForRect();
}

void __52__PXTileStatePool_enumerateStatesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PXTileStatePool_enumerateStatesInRect_usingBlock___block_invoke_2;
  v10[3] = &unk_1E5DB4940;
  char v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 72);
  long long v13 = *(_OWORD *)(a1 + 56);
  long long v14 = v7;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = v8;
  uint64_t v12 = v9;
  [v5 enumerateIndexesUsingBlock:v10];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
}

uint64_t __52__PXTileStatePool_enumerateStatesInRect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = CGRectIntersectsRect(*(CGRect *)(a1 + 56), *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 712 * a2 + 288));
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a3 = 1;
    }
  }
  return result;
}

- (void)enumerateStatesAtIndexes:(id)a3 usingBlock:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PXTileStatePool_enumerateStatesAtIndexes_usingBlock___block_invoke;
  v6[3] = &unk_1E5DB4918;
  v6[4] = self;
  v6[5] = a4;
  id v5 = a4;
  [a3 enumerateRangesUsingBlock:v6];
}

uint64_t __55__PXTileStatePool_enumerateStatesAtIndexes_usingBlock___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    uint64_t v3 = a3;
    unint64_t v4 = a2;
    uint64_t v5 = result;
    uint64_t v6 = 712 * a2;
    do
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(v5 + 40) + 16))();
      ++v4;
      v6 += 712;
      --v3;
    }
    while (v3);
  }
  return result;
}

- (void)enumerateStatesUsingBlock:(id)a3
{
}

- (PXTileState)_mutableStateAtIndex:(unint64_t)a3
{
  return &self->_states[a3];
}

- (void)_cleanupStateAtIndex:(unint64_t)a3
{
  states = self->_states;
  uint64_t v6 = &states[a3];
  var10 = v6->var10;
  if (var10)
  {
    p_var10 = &v6->var10;

    *p_var10 = 0;
  }
  uint64_t v9 = &states[a3];
  var11 = v9->var11;
  if (var11)
  {
    p_var11 = &v9->var11;

    *p_var11 = 0;
  }
  uint64_t v12 = &states[a3];
  long long v13 = *(_OWORD *)&v12->var2.index[1];
  v18[0] = *(_OWORD *)&v12->var2.length;
  v18[1] = v13;
  long long v14 = *(_OWORD *)&v12->var2.index[3];
  long long v15 = *(_OWORD *)&v12->var2.index[5];
  long long v16 = *(_OWORD *)&v12->var2.index[7];
  unint64_t v19 = v12->var2.index[9];
  v18[3] = v15;
  v18[4] = v16;
  v18[2] = v14;
  unint64_t v17 = [(PXTileStatePool *)self indexOfStateWithTargetIdentifier:v18];
  if (v17 == a3 && v17 != 0x7FFFFFFFFFFFFFFFLL) {
    std::__hash_table<std::__hash_value_type<PXTileIdentifier,unsigned long>,std::__unordered_map_hasher<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::hash<PXTileIdentifier>,std::equal_to<PXTileIdentifier>,true>,std::__unordered_map_equal<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::equal_to<PXTileIdentifier>,std::hash<PXTileIdentifier>,true>,std::allocator<std::__hash_value_type<PXTileIdentifier,unsigned long>>>::__erase_unique<PXTileIdentifier>(&self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_, &v12->var2.length);
  }
  PXEnumeratePageKeysForRect();
}

void __40__PXTileStatePool__cleanupStateAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:a2];
  [v3 removeIndex:*(void *)(a1 + 40)];
}

- (void)checkInIndexes:(id)a3
{
  id v4 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PXTileStatePool_checkInIndexes___block_invoke;
  void v5[3] = &unk_1E5DD3010;
  v5[4] = self;
  [v4 enumerateIndexesUsingBlock:v5];
  [(NSMutableIndexSet *)self->_usedIndexes removeIndexes:v4];
  [(NSMutableIndexSet *)self->_unusedIndexes addIndexes:v4];
}

uint64_t __34__PXTileStatePool_checkInIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _cleanupStateAtIndex:a2];
}

- (void)checkInIndex:(unint64_t)a3
{
  -[PXTileStatePool _cleanupStateAtIndex:](self, "_cleanupStateAtIndex:");
  [(NSMutableIndexSet *)self->_usedIndexes removeIndex:a3];
  unusedIndexes = self->_unusedIndexes;
  [(NSMutableIndexSet *)unusedIndexes addIndex:a3];
}

- (unint64_t)checkOutIndexWithInitialConfiguration:(id)a3
{
  id v4 = (void (**)(id, PXTileState *))a3;
  if (![(NSMutableIndexSet *)self->_unusedIndexes count])
  {
    int64_t statesMaxCount = self->_statesMaxCount;
    int64_t v6 = 2 * statesMaxCount;
    if (!statesMaxCount) {
      int64_t v6 = 10;
    }
    self->_int64_t statesMaxCount = v6;
    self->_states = (PXTileState *)malloc_type_realloc(self->_states, 712 * v6, 0x108004092BF69EFuLL);
    -[NSMutableIndexSet addIndexesInRange:](self->_unusedIndexes, "addIndexesInRange:", statesMaxCount, self->_statesMaxCount - statesMaxCount);
  }
  unint64_t v7 = [(NSMutableIndexSet *)self->_unusedIndexes firstIndex];
  [(NSMutableIndexSet *)self->_unusedIndexes removeIndex:v7];
  [(NSMutableIndexSet *)self->_usedIndexes addIndex:v7];
  bzero(&self->_states[v7], 0x2C8uLL);
  id v8 = &self->_states[v7];
  v4[2](v4, v8);
  [(PXTileStatePool *)self _storeCurrentFrameLookupForTileState:v8 withIndex:v7];
  [(PXTileStatePool *)self _storeTargetIdentifierLookupForTileState:v8 withIndex:v7];

  return v7;
}

- (int64_t)count
{
  return [(NSMutableIndexSet *)self->_usedIndexes count];
}

- (void)dealloc
{
  usedIndexes = self->_usedIndexes;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__PXTileStatePool_dealloc__block_invoke;
  v6[3] = &unk_1E5DD3010;
  v6[4] = self;
  [(NSMutableIndexSet *)usedIndexes enumerateIndexesUsingBlock:v6];
  states = self->_states;
  if (states)
  {
    free(states);
    self->_states = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PXTileStatePool;
  [(PXTileStatePool *)&v5 dealloc];
}

void __26__PXTileStatePool_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = v3 + 712 * a2;
  objc_super v5 = *(void **)(v4 + 688);
  if (v5)
  {
    int64_t v6 = (void *)(v4 + 688);

    *int64_t v6 = 0;
  }
  uint64_t v7 = v3 + 712 * a2;
  id v8 = *(void **)(v7 + 680);
  if (v8)
  {
    uint64_t v9 = (void *)(v7 + 680);

    *uint64_t v9 = 0;
  }
}

- (PXTileStatePool)init
{
  v12.receiver = self;
  v12.super_class = (Class)PXTileStatePool;
  v2 = [(PXTileStatePool *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
    usedIndexes = v2->_usedIndexes;
    v2->_usedIndexes = (NSMutableIndexSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
    unusedIndexes = v2->_unusedIndexes;
    v2->_unusedIndexes = (NSMutableIndexSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:1282];
    id v8 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v7 valuePointerFunctions:v8 capacity:0];
    tileIndexesByPageKey = v2->_tileIndexesByPageKey;
    v2->_tileIndexesByPageKey = (NSMapTable *)v9;
  }
  return v2;
}

@end