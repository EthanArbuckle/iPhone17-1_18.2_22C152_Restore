@interface PGEventLabelerE5Model
- (BOOL)_areFeaturesValidForFeatures:(id)a3 error:(id *)a4;
- (PGEventLabelerE5Model)initWithFilePath:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)computeWithFeatures:(id)a3 error:(id *)a4;
- (id)inputNamesWithError:(id *)a3;
- (id)inputSizeByNameWithError:(id *)a3;
@end

@implementation PGEventLabelerE5Model

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)&self->_outputPortByName);
  next = self->_inputBufferByName.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void *)*next;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>,0>((uint64_t)(next + 2));
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_inputBufferByName.__table_.__bucket_list_.__ptr_.__value_;
  self->_inputBufferByName.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)&self->_inputPortByName);
  v6 = self->_stream.__ptr_.__value_;
  self->_stream.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(ExecutionStream *))(*(void *)v6 + 8))(v6);
  }
  cntrl = self->_esop.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (BOOL)_areFeaturesValidForFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PGEventLabelerE5Model *)self inputSizeByNameWithError:a4];
  if (v7)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 1;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__51873;
    v18 = __Block_byref_object_dispose__51874;
    id v19 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PGEventLabelerE5Model__areFeaturesValidForFeatures_error___block_invoke;
    v10[3] = &unk_1E68EB3F8;
    id v11 = v6;
    v12 = &v20;
    v13 = &v14;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];
    if (a4) {
      *a4 = (id) v15[5];
    }
    BOOL v8 = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __60__PGEventLabelerE5Model__areFeaturesValidForFeatures_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = a3;
  BOOL v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];
  uint64_t v9 = [v8 count];

  unsigned int v10 = [v7 unsignedIntValue];
  if (v9 != v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = [NSString stringWithFormat:@"[PGEventLabelerE5Model] Invalid feature count: %lu, input spec count: %lu, for feature: %@", v9, v10, v16];
    uint64_t v13 = [v11 errorWithDescription:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *a4 = 1;
  }
}

- (id)computeWithFeatures:(id)a3 error:(id *)a4
{
  id v43 = a3;
  id v42 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_outputPortByName.__table_.__p2_.__value_];
  if ([(PGEventLabelerE5Model *)self _areFeaturesValidForFeatures:v43 error:a4])
  {
    for (i = (char *)self->_inputPortByName.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
    {
      id v6 = (E5RT::IOPort *)*((void *)i + 5);
      id v7 = (std::__shared_weak_count *)*((void *)i + 6);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      E5RT::IOPort::GetMemoryObject((uint64_t *)&__p, v6);
      BOOL v8 = (E5RT::BufferObject *)E5RT::MemoryObject::TryAsBuffer((E5RT::MemoryObject *)__p.__r_.__value_.__l.__data_);
      uint64_t DataSpan = E5RT::BufferObject::GetDataSpan(v8);
      if (v10 >= 2) {
        uint64_t v11 = DataSpan;
      }
      else {
        uint64_t v11 = 0;
      }
      if (__p.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
      }
      v12 = i + 16;
      if (i[39] < 0) {
        v12 = (void *)*v12;
      }
      uint64_t v13 = [NSString stringWithUTF8String:v12];
      uint64_t v14 = [v43 objectForKeyedSubscript:v13];
      for (unint64_t j = 0; j < [v14 count]; ++j)
      {
        id v16 = [v14 objectAtIndexedSubscript:j];
        [v16 floatValue];
        if (v17 < -65504.0) {
          float v17 = -65504.0;
        }
        if (v17 <= 65504.0) {
          _S10 = v17;
        }
        else {
          _S10 = 65504.0;
        }

        __asm { FCVT            H0, S10 }
        *(_WORD *)(v11 + 2 * j) = _H0;
      }

      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
    }
    E5RT::ExecutionStream::ExecuteStreamSync((E5RT::ExecutionStream *)self->_stream.__ptr_.__value_);
    for (k = (long long *)self->_outputPortByName.__table_.__p1_.__value_.__next_; k; k = *(long long **)k)
    {
      std::pair<std::string const,std::shared_ptr<E5RT::IOPort>>::pair[abi:ne180100](&__p, k + 1);
      v25 = v47;
      v26 = v48;
      if (v48) {
        atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      E5RT::IOPort::GetMemoryObject((uint64_t *)&v44, v25);
      v27 = (E5RT::BufferObject *)E5RT::MemoryObject::TryAsBuffer(v44);
      uint64_t v28 = E5RT::BufferObject::GetDataSpan(v27);
      if (v29 >= 2) {
        v30 = (__int16 *)v28;
      }
      else {
        v30 = 0;
      }
      if (v45) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v45);
      }
      _H8 = *v30;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v33 = [NSString stringWithUTF8String:p_p];
      v34 = [v33 lowercaseString];
      __asm { FCVT            S8, H8 }

      LODWORD(v36) = _S8;
      v37 = [NSNumber numberWithFloat:v36];
      [v42 setValue:v37 forKey:v34];

      if (v26) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v26);
      }
      if (v48) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v48);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    id v38 = v42;
    v39 = v38;
  }
  else
  {
    v39 = 0;
    id v38 = v42;
  }

  return v39;
}

- (id)inputSizeByNameWithError:(id *)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_inputPortByName.__table_.__p2_.__value_];
  for (i = (char *)self->_inputPortByName.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    id v6 = (E5RT::IOPort *)*((void *)i + 5);
    id v7 = (std::__shared_weak_count *)*((void *)i + 6);
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    E5RT::IOPort::GetPortDescriptor((uint64_t *)&v17, v6);
    BOOL v8 = (E5RT::TensorDescriptor *)E5RT::OperandDescriptor::TensorDescriptor(v17);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    uint64_t TensorShape = E5RT::TensorDescriptor::GetTensorShape(v8);
    unint64_t v10 = *(uint64_t **)TensorShape;
    uint64_t v11 = 1;
    while (v10 != *(uint64_t **)(TensorShape + 8))
    {
      uint64_t v12 = *v10++;
      v11 *= v12;
    }
    uint64_t v13 = i + 16;
    if (i[39] < 0) {
      uint64_t v13 = (void *)*v13;
    }
    uint64_t v14 = [NSString stringWithUTF8String:v13];
    v15 = [NSNumber numberWithUnsignedLong:v11];
    [v4 setObject:v15 forKeyedSubscript:v14];

    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  return v4;
}

- (id)inputNamesWithError:(id *)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:self->_inputPortByName.__table_.__p2_.__value_];
  for (i = (char *)self->_inputPortByName.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    id v6 = i + 16;
    if (i[39] < 0) {
      id v6 = (void *)*v6;
    }
    id v7 = [NSString stringWithUTF8String:v6];
    [v4 addObject:v7];
  }
  return v4;
}

- (PGEventLabelerE5Model)initWithFilePath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v63.receiver = self;
  v63.super_class = (Class)PGEventLabelerE5Model;
  id v6 = [(PGEventLabelerE5Model *)&v63 init];
  if (v6)
  {
    id v56 = v5;
    std::string::basic_string[abi:ne180100]<0>(&v64, "op");
    std::string::basic_string[abi:ne180100]<0>(&v60, (char *)[v5 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&__p, "main");
    E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp();
    if (v62) {
      operator new();
    }
    uint64_t v62 = 0;
    id v7 = (std::__shared_weak_count *)*((void *)v6 + 2);
    *(_OWORD *)(v6 + 8) = 0u;
    if (v7)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      uint64_t v8 = v62;
      uint64_t v62 = 0;
      if (v8) {
        (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
      }
    }
    else
    {
      uint64_t v62 = 0;
    }
    if (v59 < 0) {
      operator delete(__p);
    }
    if (v61 < 0) {
      operator delete(v60);
    }
    if (v67 < 0) {
      operator delete(v64);
    }
    uint64_t InputPorts = E5RT::ExecutionStreamOperation::GetInputPorts(*((E5RT::ExecutionStreamOperation **)v6 + 1));
    if (v6 + 32 != (char *)InputPorts)
    {
      *((_DWORD *)v6 + 16) = *(_DWORD *)(InputPorts + 32);
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,void *> *>>((void *)v6 + 4, *(uint64_t **)(InputPorts + 16));
    }
    unint64_t v10 = (unsigned __int8 *)*((void *)v6 + 6);
    if (v10)
    {
      uint64_t v11 = (std::__shared_weak_count *)(v6 + 88);
      while (1)
      {
        unint64_t v13 = *((void *)v10 + 5);
        uint64_t v12 = (std::__shared_weak_count *)*((void *)v10 + 6);
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        E5RT::IOPort::GetPortDescriptor((uint64_t *)&v64, (E5RT::IOPort *)v13);
        E5RT::OperandDescriptor::TensorDescriptor((E5RT::OperandDescriptor *)v64);
        if (v65) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v65);
        }
        E5RT::TensorDescriptor::AllocateMemory();
        if (v64) {
          operator new();
        }
        E5RT::IOPort::BindMemoryObject();
        unint64_t v14 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(v10 + 16));
        unint64_t v15 = v14;
        unint64_t v16 = *((void *)v6 + 10);
        if (v16)
        {
          uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
          v17.i16[0] = vaddlv_u8(v17);
          unint64_t v18 = v17.u32[0];
          if (v17.u32[0] > 1uLL)
          {
            unint64_t v13 = v14;
            if (v14 >= v16) {
              unint64_t v13 = v14 % v16;
            }
          }
          else
          {
            unint64_t v13 = (v16 - 1) & v14;
          }
          id v19 = *(unsigned __int8 ***)(*((void *)v6 + 9) + 8 * v13);
          if (v19)
          {
            for (i = *v19; i; i = *(unsigned __int8 **)i)
            {
              unint64_t v21 = *((void *)i + 1);
              if (v21 == v15)
              {
                if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, v10 + 16))
                {
                  uint64_t v11 = (std::__shared_weak_count *)(v6 + 88);
                  goto LABEL_100;
                }
              }
              else
              {
                if (v18 > 1)
                {
                  if (v21 >= v16) {
                    v21 %= v16;
                  }
                }
                else
                {
                  v21 &= v16 - 1;
                }
                if (v21 != v13) {
                  break;
                }
              }
            }
          }
          uint64_t v11 = (std::__shared_weak_count *)(v6 + 88);
        }
        uint64_t v22 = operator new(0x38uLL);
        v64 = (unsigned __int8 **)v22;
        v65 = v11;
        char v66 = 0;
        *uint64_t v22 = 0;
        v22[1] = v15;
        char v23 = (std::string *)(v22 + 2);
        if ((char)v10[39] < 0)
        {
          std::string::__init_copy_ctor_external(v23, *((const std::string::value_type **)v10 + 2), *((void *)v10 + 3));
        }
        else
        {
          long long v24 = *((_OWORD *)v10 + 1);
          v22[4] = *((void *)v10 + 4);
          *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
        }
        v22[5] = 0;
        v22[6] = 0;
        char v66 = 1;
        float v25 = (float)(unint64_t)(*((void *)v6 + 12) + 1);
        float v26 = *((float *)v6 + 26);
        if (!v16 || (float)(v26 * (float)v16) < v25) {
          break;
        }
LABEL_90:
        id v43 = *(unsigned __int8 ***)(*((void *)v6 + 9) + 8 * v13);
        i = (unsigned __int8 *)v64;
        if (v43)
        {
          *v64 = *v43;
        }
        else
        {
          *v64 = (unsigned __int8 *)*((void *)v6 + 11);
          *((void *)v6 + 11) = i;
          *(void *)(*((void *)v6 + 9) + 8 * v13) = v11;
          if (!*(void *)i) {
            goto LABEL_99;
          }
          unint64_t v44 = *(void *)(*(void *)i + 8);
          if ((v16 & (v16 - 1)) != 0)
          {
            if (v44 >= v16) {
              v44 %= v16;
            }
          }
          else
          {
            v44 &= v16 - 1;
          }
          id v43 = (unsigned __int8 **)(*((void *)v6 + 9) + 8 * v44);
        }
        *id v43 = i;
LABEL_99:
        v64 = 0;
        ++*((void *)v6 + 12);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v64);
LABEL_100:
        v45 = (std::__shared_weak_count *)*((void *)i + 6);
        *((void *)i + 5) = 0;
        *((void *)i + 6) = 0;
        if (v45) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v45);
        }
        if (v12) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v12);
        }
        unint64_t v10 = *(unsigned __int8 **)v10;
        if (!v10) {
          goto LABEL_115;
        }
      }
      BOOL v27 = (v16 & (v16 - 1)) != 0;
      if (v16 < 3) {
        BOOL v27 = 1;
      }
      unint64_t v28 = v27 | (2 * v16);
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
      }
      unint64_t v16 = *((void *)v6 + 10);
      if (*(void *)&prime > v16) {
        goto LABEL_56;
      }
      if (*(void *)&prime < v16)
      {
        unint64_t v37 = vcvtps_u32_f32((float)*((unint64_t *)v6 + 12) / *((float *)v6 + 26));
        if (v16 < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
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
        if (*(void *)&prime >= v16)
        {
          unint64_t v16 = *((void *)v6 + 10);
        }
        else
        {
          if (prime)
          {
LABEL_56:
            if (*(void *)&prime >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v31 = operator new(8 * *(void *)&prime);
            v32 = (void *)*((void *)v6 + 9);
            *((void *)v6 + 9) = v31;
            if (v32) {
              operator delete(v32);
            }
            uint64_t v33 = 0;
            *((int8x8_t *)v6 + 10) = prime;
            do
              *(void *)(*((void *)v6 + 9) + 8 * v33++) = 0;
            while (*(void *)&prime != v33);
            v34 = v11->__vftable;
            if (v11->__vftable)
            {
              v35 = v34->~__shared_weak_count_0;
              uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
              v36.i16[0] = vaddlv_u8(v36);
              if (v36.u32[0] > 1uLL)
              {
                if ((unint64_t)v35 >= *(void *)&prime) {
                  v35 = (void (__cdecl *)(std::__shared_weak_count *__hidden))((unint64_t)v35 % *(void *)&prime);
                }
              }
              else
              {
                v35 = (void (__cdecl *)(std::__shared_weak_count *__hidden))((unint64_t)v35 & (*(void *)&prime - 1));
              }
              *(void *)(*((void *)v6 + 9) + 8 * (void)v35) = v11;
              v40 = (std::__shared_weak_count_vtbl *)v34->~__shared_weak_count;
              if (v34->~__shared_weak_count)
              {
                do
                {
                  unint64_t v41 = (unint64_t)v40->~__shared_weak_count_0;
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
                  if ((void (__cdecl *)(std::__shared_weak_count *__hidden))v41 != v35)
                  {
                    uint64_t v42 = *((void *)v6 + 9);
                    if (!*(void *)(v42 + 8 * v41))
                    {
                      *(void *)(v42 + 8 * v41) = v34;
                      goto LABEL_81;
                    }
                    v34->~__shared_weak_count = v40->~__shared_weak_count;
                    v40->~__shared_weak_count = **(void (__cdecl ***)(std::__shared_weak_count *__hidden))(*((void *)v6 + 9) + 8 * v41);
                    **(void **)(*((void *)v6 + 9) + 8 * v41) = v40;
                    v40 = v34;
                  }
                  unint64_t v41 = (unint64_t)v35;
LABEL_81:
                  v34 = v40;
                  v40 = (std::__shared_weak_count_vtbl *)v40->~__shared_weak_count;
                  v35 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v41;
                }
                while (v40);
              }
            }
            unint64_t v16 = (unint64_t)prime;
            goto LABEL_85;
          }
          v46 = (void *)*((void *)v6 + 9);
          *((void *)v6 + 9) = 0;
          if (v46) {
            operator delete(v46);
          }
          unint64_t v16 = 0;
          *((void *)v6 + 10) = 0;
        }
      }
LABEL_85:
      if ((v16 & (v16 - 1)) != 0)
      {
        if (v15 >= v16) {
          unint64_t v13 = v15 % v16;
        }
        else {
          unint64_t v13 = v15;
        }
      }
      else
      {
        unint64_t v13 = (v16 - 1) & v15;
      }
      goto LABEL_90;
    }
LABEL_115:
    uint64_t OutputPorts = E5RT::ExecutionStreamOperation::GetOutputPorts(*((E5RT::ExecutionStreamOperation **)v6 + 1));
    if (v6 + 112 != (char *)OutputPorts)
    {
      *((_DWORD *)v6 + 36) = *(_DWORD *)(OutputPorts + 32);
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,void *> *>>((void *)v6 + 14, *(uint64_t **)(OutputPorts + 16));
    }
    for (unint64_t j = (void *)*((void *)v6 + 16); j; unint64_t j = (void *)*j)
    {
      v50 = (E5RT::IOPort *)j[5];
      v49 = (std::__shared_weak_count *)j[6];
      if (v49) {
        atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      E5RT::IOPort::GetPortDescriptor((uint64_t *)&v64, v50);
      E5RT::OperandDescriptor::TensorDescriptor((E5RT::OperandDescriptor *)v64);
      if (v65) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v65);
      }
      E5RT::TensorDescriptor::AllocateMemory();
      if (v64) {
        operator new();
      }
      E5RT::IOPort::BindMemoryObject();
      uint64_t OutputPorts = 0;
      if (v49) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v49);
      }
    }
    E5RT::ExecutionStream::CreateExecutionStream((uint64_t *)&v64, (E5RT::ExecutionStream *)OutputPorts);
    v51 = v64;
    v64 = 0;
    uint64_t v52 = *((void *)v6 + 3);
    *((void *)v6 + 3) = v51;
    id v5 = v56;
    if (v52)
    {
      (*(void (**)(uint64_t))(*(void *)v52 + 8))(v52);
      v53 = v64;
      v64 = 0;
      if (v53) {
        (*((void (**)(unsigned __int8 **))*v53 + 1))(v53);
      }
    }
    v54 = (std::__shared_weak_count *)*((void *)v6 + 2);
    v57 = v54;
    if (v54) {
      atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    E5RT::ExecutionStream::EncodeOperation();
    if (v57) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v57);
    }
  }

  return (PGEventLabelerE5Model *)v6;
}

@end