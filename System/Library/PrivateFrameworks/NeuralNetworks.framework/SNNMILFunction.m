@interface SNNMILFunction
- (NSArray)inputNames;
- (NSArray)outputNames;
- (NSEnumerator)operationEnumerator;
- (SNNMILFunction)init;
- (SNNMILFunction)initWithFunction:(shared_ptr<MIL:()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> IRFunction>)a3 name:;
- (basic_string<char,)name;
- (id).cxx_construct;
- (id)inputWithName:(id)a3;
- (id)operationAtIndex:(int64_t)a3;
- (int64_t)operationCount;
- (shared_ptr<MIL::IRFunction>)milFunction;
@end

@implementation SNNMILFunction

- (SNNMILFunction)init
{
  return 0;
}

- (SNNMILFunction)initWithFunction:(shared_ptr<MIL:()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> IRFunction>)a3 name:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)SNNMILFunction;
  v6 = [(SNNMILFunction *)&v10 init];
  std::string::operator=((std::string *)(v6 + 8), (const std::string *)cntrl);
  long long v7 = *(_OWORD *)ptr;
  *(void *)ptr = 0;
  *((void *)ptr + 1) = 0;
  v8 = (std::__shared_weak_count *)*((void *)v6 + 5);
  *((_OWORD *)v6 + 2) = v7;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return (SNNMILFunction *)v6;
}

- (basic_string<char,)name
{
  if (*((char *)&result->__r_.var1 + 3) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)retstr, (const std::string::value_type *)result->__r_.__value_.var0.var1.__size_, *((void *)&result->__r_.__value_.var0.var1 + 2));
  }
  else
  {
    *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.__value_.var0.var1.__size_;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *(void *)&result->__r_.var0;
  }
  return result;
}

- (shared_ptr<MIL::IRFunction>)milFunction
{
  int64_t var0 = self->_name.var0;
  void *v2 = *(void *)&self->_name.__r_.var0;
  v2[1] = var0;
  if (var0) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(var0 + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (IRFunction *)self;
  return result;
}

- (NSArray)inputNames
{
  v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  v4 = (void *)(*(uint64_t (**)(void))(**(void **)&self->_name.__r_.var0 + 128))(*(void *)&self->_name.__r_.var0);
  v5 = v4 + 1;
  v6 = (void *)*v4;
  if ((void *)*v4 != v4 + 1)
  {
    do
    {
      long long v7 = (void *)[[NSString alloc] initWithCXXString:v6 + 4];
      [v3 addObject:v7];

      v8 = (void *)v6[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (void *)v6[2];
          BOOL v10 = *v9 == (void)v6;
          v6 = v9;
        }
        while (!v10);
      }
      v6 = v9;
    }
    while (v9 != v5);
  }
  return (NSArray *)v3;
}

- (id)inputWithName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 cxxString];
  }
  else
  {
    __p = 0;
    size_t v31 = 0;
    uint64_t v32 = 0;
  }
  v6 = (void *)(*(uint64_t (**)(void))(**(void **)&self->_name.__r_.var0 + 128))(*(void *)&self->_name.__r_.var0);
  long long v7 = v6 + 1;
  v8 = (void *)*v6;
  if ((void *)*v6 == v6 + 1)
  {
LABEL_27:
    v25 = 0;
    goto LABEL_33;
  }
  uint64_t v9 = HIBYTE(v32);
  BOOL v10 = __p;
  size_t v11 = v31;
  if (v32 >= 0) {
    size_t v12 = HIBYTE(v32);
  }
  else {
    size_t v12 = v31;
  }
  while (1)
  {
    uint64_t v13 = *((unsigned __int8 *)v8 + 55);
    int v14 = (char)v13;
    std::string::size_type v15 = v8[5];
    if ((v13 & 0x80u) != 0) {
      uint64_t v13 = v8[5];
    }
    if (v12 != v13) {
      goto LABEL_21;
    }
    v16 = (const std::string::value_type *)v8[4];
    v17 = v14 >= 0 ? (unsigned __int8 *)(v8 + 4) : (unsigned __int8 *)v8[4];
    if ((v9 & 0x80) != 0) {
      break;
    }
    if (!v9) {
      goto LABEL_28;
    }
    p_p = &__p;
    uint64_t v19 = v9;
    while (*(unsigned __int8 *)p_p == *v17)
    {
      p_p = (void **)((char *)p_p + 1);
      ++v17;
      if (!--v19) {
        goto LABEL_28;
      }
    }
LABEL_21:
    v22 = (void *)v8[1];
    if (v22)
    {
      do
      {
        v23 = v22;
        v22 = (void *)*v22;
      }
      while (v22);
    }
    else
    {
      do
      {
        v23 = (void *)v8[2];
        BOOL v24 = *v23 == (void)v8;
        v8 = v23;
      }
      while (!v24);
    }
    v8 = v23;
    if (v23 == v7) {
      goto LABEL_27;
    }
  }
  v28 = v5;
  v20 = v10;
  int v21 = memcmp(v10, v17, v11);
  BOOL v10 = v20;
  v5 = v28;
  if (v21) {
    goto LABEL_21;
  }
LABEL_28:
  uint64_t v26 = v8[7];
  if (v14 < 0) {
    std::string::__init_copy_ctor_external(&v29, v16, v15);
  }
  else {
    std::string v29 = *(std::string *)(v8 + 4);
  }
  v25 = +[SNNMILContext valueForIRValueType:v26 name:&v29];
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
LABEL_33:
  if (SHIBYTE(v32) < 0) {
    operator delete(__p);
  }

  return v25;
}

- (NSArray)outputNames
{
  v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)&self->_name.__r_.var0 + 48))(*(void *)&self->_name.__r_.var0);
  v5 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)v4 + 88))(v4);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  if (*v5 != v7)
  {
    do
    {
      v8 = (void *)[[NSString alloc] initWithCXXString:v6];
      [v3 addObject:v8];

      v6 += 24;
    }
    while (v6 != v7);
  }
  return (NSArray *)v3;
}

- (int64_t)operationCount
{
  uint64_t v2 = (*(uint64_t (**)(void, SEL))(**(void **)&self->_name.__r_.var0 + 48))(*(void *)&self->_name.__r_.var0, a2);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 64))(v2);
  return (uint64_t)(*(void *)(*(void *)v3 + 8) - **(void **)v3) >> 4;
}

- (id)operationAtIndex:(int64_t)a3
{
  uint64_t v4 = (*(uint64_t (**)(void, SEL))(**(void **)&self->_name.__r_.var0 + 48))(*(void *)&self->_name.__r_.var0, a2);
  v5 = *(MIL::IRObject **)(**(void **)(*(uint64_t (**)(uint64_t))(*(void *)v4 + 64))(v4) + 16 * a3);
  uint64_t v6 = [[NSString alloc] initWithCXXString:(*(uint64_t (**)(MIL::IRObject *))(*(void *)v5 + 56))(v5)];
  v40 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  uint64_t v7 = (void *)(*(uint64_t (**)(MIL::IRObject *))(*(void *)v5 + 160))(v5);
  BOOL v10 = (void *)*v7;
  v8 = v7 + 1;
  uint64_t v9 = v10;
  v39 = (void *)v6;
  if (v10 == v8) {
    goto LABEL_21;
  }
  v38 = v8;
  do
  {
    size_t v11 = (void *)[[NSString alloc] initWithCXXString:v9 + 4];
    uint64_t v13 = v9[7];
    uint64_t v12 = v9[8];
    while (v13 != v12)
    {
      std::string::size_type v15 = *(MIL::IRArgument **)v13;
      int v14 = *(std::__shared_weak_count **)(v13 + 8);
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if ((*(unsigned int (**)(MIL::IRArgument *))(*(void *)v15 + 24))(v15))
      {
        v16 = +[SNNMILContext valueForIRValue:MIL::IRArgument::GetValue(v15)];
        if (!v16) {
          goto LABEL_12;
        }
        v17 = [[SNNMILNamedArgument alloc] initWithKey:v11 value:v16];
        [v40 addObject:v17];
      }
      else
      {
        v16 = (void *)[[NSString alloc] initWithCXXString:MIL::IRArgument::GetName(v15)];
        v17 = [[SNNMILNamedValue alloc] initWithName:v16];
        v18 = [[SNNMILNamedArgument alloc] initWithKey:v11 value:v17];
        [v40 addObject:v18];
      }
LABEL_12:

      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      v13 += 16;
    }

    uint64_t v19 = (void *)v9[1];
    if (v19)
    {
      do
      {
        v20 = v19;
        uint64_t v19 = (void *)*v19;
      }
      while (v19);
    }
    else
    {
      do
      {
        v20 = (void *)v9[2];
        BOOL v21 = *v20 == (void)v9;
        uint64_t v9 = v20;
      }
      while (!v21);
    }
    uint64_t v9 = v20;
  }
  while (v20 != v38);
LABEL_21:
  v22 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  for (i = *(void **)(MIL::IRObject::GetAttributes(v5) + 16); i; i = (void *)*i)
  {
    BOOL v24 = (void *)[[NSString alloc] initWithCXXString:i + 2];
    v25 = +[SNNMILContext valueForIRValue:i[5]];
    if (v25)
    {
      uint64_t v26 = [[SNNMILNamedArgument alloc] initWithKey:v24 value:v25];
      [v22 addObject:v26];
    }
  }
  v27 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  uint64_t v28 = (*(uint64_t (**)(MIL::IRObject *))(*(void *)v5 + 176))(v5);
  std::string v29 = *(MIL::IRNamedValueType ***)v28;
  v30 = *(MIL::IRNamedValueType ***)(v28 + 8);
  if (*(MIL::IRNamedValueType ***)v28 != v30)
  {
    while (1)
    {
      uint64_t Type = MIL::IRNamedValueType::GetType(*v29);
      uint64_t Name = MIL::IRNamedValueType::GetName(*v29);
      if (*(char *)(Name + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v41, *(const std::string::value_type **)Name, *(void *)(Name + 8));
      }
      else
      {
        long long v33 = *(_OWORD *)Name;
        v41.__r_.__value_.__r.__words[2] = *(void *)(Name + 16);
        *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v33;
      }
      uint64_t v34 = +[SNNMILContext valueForIRValueType:Type name:&v41];
      v35 = (void *)v34;
      if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        break;
      }
      operator delete(v41.__r_.__value_.__l.__data_);
      if (v35) {
        goto LABEL_33;
      }
LABEL_34:

      v29 += 2;
      if (v29 == v30) {
        goto LABEL_35;
      }
    }
    if (!v34) {
      goto LABEL_34;
    }
LABEL_33:
    [v27 addObject:v35];
    goto LABEL_34;
  }
LABEL_35:
  v36 = [[SNNMILOperation alloc] initWithOperatorName:v39 inputs:v40 attributes:v22 outputs:v27];

  return v36;
}

- (NSEnumerator)operationEnumerator
{
  return (NSEnumerator *)self->_function.__ptr_;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_function.__ptr_, 0);
  int64_t var0 = (std::__shared_weak_count *)self->_name.var0;
  if (var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](var0);
  }
  if (*((char *)&self->_name.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self->_name.__r_.__value_.var0.var1.__data_;
    operator delete(data);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end