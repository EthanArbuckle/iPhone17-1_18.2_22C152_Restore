@interface FCKeyValueStoreClassRegistry
- (Class)classForValueType:(int)a3;
- (FCKeyValueStoreClassRegistry)init;
- (id).cxx_construct;
- (void)registerClass:(Class)a3;
@end

@implementation FCKeyValueStoreClassRegistry

- (Class)classForValueType:(int)a3
{
  unint64_t value = self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      unint64_t v5 = a3;
      if (value <= a3) {
        unint64_t v5 = a3 % value;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & a3;
    }
    v6 = (uint64_t **)self->_registry.__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v6)
    {
      for (i = *v6; i; i = (uint64_t *)*i)
      {
        unint64_t v8 = i[1];
        if (v8 == a3)
        {
          if (*((_DWORD *)i + 4) == a3) {
            return (Class)(id)i[3];
          }
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= value) {
              v8 %= value;
            }
          }
          else
          {
            v8 &= value - 1;
          }
          if (v8 != v5) {
            return (Class)0;
          }
        }
      }
    }
  }
  return (Class)0;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

- (FCKeyValueStoreClassRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)FCKeyValueStoreClassRegistry;
  v2 = [(FCKeyValueStoreClassRegistry *)&v4 init];
  if (v2)
  {
    [(FCKeyValueStoreClassRegistry *)v2 registerClass:objc_opt_class()];
    [(FCKeyValueStoreClassRegistry *)v2 registerClass:objc_opt_class()];
    [(FCKeyValueStoreClassRegistry *)v2 registerClass:objc_opt_class()];
  }
  return v2;
}

- (void)registerClass:(Class)a3
{
  int v6 = [(objc_class *)a3 keyValuePairType];
  v38 = a3;
  unint64_t v7 = v6;
  unint64_t value = self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v3 = v6;
      if (value <= v6) {
        unint64_t v3 = v6 % value;
      }
    }
    else
    {
      unint64_t v3 = (value - 1) & v6;
    }
    v10 = (uint64_t **)self->_registry.__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v10)
    {
      for (i = *v10; i; i = (uint64_t *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v6)
        {
          if (*((_DWORD *)i + 4) == v6)
          {
            v36 = v38;
            goto LABEL_74;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= value) {
              v12 %= value;
            }
          }
          else
          {
            v12 &= value - 1;
          }
          if (v12 != v3) {
            break;
          }
        }
      }
    }
  }
  v13 = operator new(0x20uLL);
  p_p1 = &self->_registry.__table_.__p1_;
  void *v13 = 0;
  v13[1] = v6;
  *((_DWORD *)v13 + 4) = v6;
  v13[3] = v38;
  float v15 = (float)(self->_registry.__table_.__p2_.__value_ + 1);
  float v16 = self->_registry.__table_.__p3_.__value_;
  if (!value || (float)(v16 * (float)value) < v15)
  {
    BOOL v17 = 1;
    if (value >= 3) {
      BOOL v17 = (value & (value - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * value);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t value = self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(void *)&prime > value) {
      goto LABEL_30;
    }
    if (*(void *)&prime < value)
    {
      unint64_t v27 = vcvtps_u32_f32((float)self->_registry.__table_.__p2_.__value_ / self->_registry.__table_.__p3_.__value_);
      if (value < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)value), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }
      else
      {
        uint64_t v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }
      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= value)
      {
        unint64_t value = self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v21 = (void **)operator new(8 * *(void *)&prime);
          v22 = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
          self->_registry.__table_.__bucket_list_.__ptr_.__value_ = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0;
          self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_registry.__table_.__bucket_list_.__ptr_.__value_[v23++] = 0;
          while (*(void *)&prime != v23);
          next = p_p1->__value_.__next_;
          if (p_p1->__value_.__next_)
          {
            unint64_t v25 = next[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }
            else
            {
              v25 &= *(void *)&prime - 1;
            }
            self->_registry.__table_.__bucket_list_.__ptr_.__value_[v25] = p_p1;
            v30 = (void *)*next;
            if (*next)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }
                else
                {
                  v31 &= *(void *)&prime - 1;
                }
                if (v31 != v25)
                {
                  v32 = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v32[v31])
                  {
                    v32[v31] = next;
                    goto LABEL_55;
                  }
                  void *next = *v30;
                  void *v30 = *(void *)self->_registry.__table_.__bucket_list_.__ptr_.__value_[v31];
                  *(void *)self->_registry.__table_.__bucket_list_.__ptr_.__value_[v31] = v30;
                  v30 = next;
                }
                unint64_t v31 = v25;
LABEL_55:
                next = v30;
                v30 = (void *)*v30;
                unint64_t v25 = v31;
              }
              while (v30);
            }
          }
          unint64_t value = (unint64_t)prime;
          goto LABEL_59;
        }
        v37 = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
        self->_registry.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v37) {
          operator delete(v37);
        }
        unint64_t value = 0;
        self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_59:
    if ((value & (value - 1)) != 0)
    {
      if (value <= v7) {
        unint64_t v3 = v7 % value;
      }
      else {
        unint64_t v3 = v7;
      }
    }
    else
    {
      unint64_t v3 = (value - 1) & v7;
    }
  }
  v33 = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
  v34 = (void **)v33[v3];
  if (v34)
  {
    void *v13 = *v34;
LABEL_72:
    *v34 = v13;
    goto LABEL_73;
  }
  void *v13 = p_p1->__value_.__next_;
  p_p1->__value_.__next_ = v13;
  v33[v3] = p_p1;
  if (*v13)
  {
    unint64_t v35 = *(void *)(*v13 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v35 >= value) {
        v35 %= value;
      }
    }
    else
    {
      v35 &= value - 1;
    }
    v34 = &self->_registry.__table_.__bucket_list_.__ptr_.__value_[v35];
    goto LABEL_72;
  }
LABEL_73:
  v36 = 0;
  ++self->_registry.__table_.__p2_.__value_;
LABEL_74:
}

- (void).cxx_destruct
{
  next = (id *)self->_registry.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      objc_super v4 = (id *)*next;

      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  unint64_t value = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
  self->_registry.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

@end