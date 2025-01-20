@interface SNNEspressoV1ExecutionContext
- ($C4732ECC957FA13B9B3DF4A51A95735B)network;
- (NSArray)computeUnits;
- (NSArray)globalNames;
- (NSArray)inputNames;
- (NSArray)outputNames;
- (SNNComputePrecision)computePrecision;
- (SNNComputeUnit)primaryComputeUnit;
- (SNNEspressoV1ExecutionContext)initWithMILProgram:(id)a3 primaryComputeUnit:(id)a4 computeUnits:(id)a5 preferredMetalDevice:(id)a6 computePrecision:(id)a7 error:(id *)a8;
- (id).cxx_construct;
- (id)inputAndOutputNames;
- (id)shapeForBlobWithName:(id)a3;
- (id)shapeForInputWithName:(id)a3;
- (id)shapeForOutputWithName:(id)a3;
- (unint64_t)dataTypeForBlobWithName:(id)a3;
- (unint64_t)rawSizeForInputWithName:(id)a3;
- (unint64_t)rawSizeForOutputWithName:(id)a3;
- (void)context;
- (void)dealloc;
- (void)deallocEspressoResources;
- (void)plan;
@end

@implementation SNNEspressoV1ExecutionContext

- (SNNEspressoV1ExecutionContext)initWithMILProgram:(id)a3 primaryComputeUnit:(id)a4 computeUnits:(id)a5 preferredMetalDevice:(id)a6 computePrecision:(id)a7 error:(id *)a8
{
  id v35 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v36 = a7;
  v39.receiver = self;
  v39.super_class = (Class)SNNEspressoV1ExecutionContext;
  v18 = [(SNNEspressoV1ExecutionContext *)&v39 init];
  if (![v16 count]) {
    __assert_rtn("-[SNNEspressoV1ExecutionContext initWithMILProgram:primaryComputeUnit:computeUnits:preferredMetalDevice:computePrecision:error:]", "SNNEspressoExecutors.mm", 139, "computeUnits.count > 0");
  }
  objc_storeStrong((id *)v18 + 3, a4);
  objc_storeStrong((id *)v18 + 4, a5);
  objc_storeStrong((id *)v18 + 5, a7);
  v19 = v35;
  uint64_t v20 = [*((id *)v18 + 3) kind];
  if (v17 && v20 == 2) {
    espresso_device_id_for_metal_device();
  }
  objc_msgSend(v15, "platform", v35);
  uint64_t context = espresso_create_context();
  *((void *)v18 + 6) = context;
  if (context)
  {
    unint64_t v22 = +[SNNComputeUnit bitmakForComputeUnits:v16];
    if (v22 && espresso_context_set_int_option())
    {
      if (a8)
      {
        v23 = NSStringFromSelector(a2);
        v24 = +[SNNError invalidEspressoContextErrorForMethod:v23 description:@"Invalid compute unit selection."];
LABEL_29:
        *a8 = v24;
      }
    }
    else
    {
      if (objc_msgSend(*((id *)v18 + 3), "kind", v22) == 2)
      {
        Espresso::get_internal_context((uint64_t *)&v38, *((Espresso **)v18 + 6), v25);
        long long v26 = v38;
        *(_DWORD *)(v38 + 68) = 0;
        if (*((void *)&v26 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v26 + 1));
        }
      }
      uint64_t plan = espresso_create_plan();
      *((void *)v18 + 7) = plan;
      if (plan)
      {
        if ([v19 isReferencingBlobFile]
          && ([v19 milFilePath], v28 = objc_claimAutoreleasedReturnValue(),
                                                v28,
                                                v28))
        {
          id v29 = [v19 milFilePath];
          [v29 UTF8String];
          [v36 storageType];
          int v30 = espresso_plan_add_network();
        }
        else
        {
          if (v19) {
            [v19 milProgram];
          }
          else {
            v37 = 0;
          }
          [v36 storageType];
          int v30 = espresso_plan_add_cpp_net_from_mil_program_and_reload();
          if (v37) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v37);
          }
        }
        if (v30)
        {
          if (a8)
          {
            v23 = NSStringFromSelector(a2);
            v24 = +[SNNError invalidEspressoNetworkErrorForMethod:v23 description:@"Failed to build plan."];
            goto LABEL_29;
          }
        }
        else
        {
          Espresso::get_internal_network();
          long long v33 = v38;
          long long v38 = 0uLL;
          v34 = (std::__shared_weak_count *)*((void *)v18 + 2);
          *(_OWORD *)(v18 + 8) = v33;
          if (v34)
          {
            std::__shared_weak_count::__release_shared[abi:ne180100](v34);
            if (*((void *)&v38 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v38 + 1));
            }
          }
          if (!*((void *)v18 + 1))
          {
            if (!a8) {
              goto LABEL_30;
            }
            v23 = NSStringFromSelector(a2);
            v24 = +[SNNError invalidEspressoNetworkErrorForMethod:v23 description:@"Failed to load network."];
            goto LABEL_29;
          }
          espresso_plan_build();
          if (espresso_plan_get_phase() == 1)
          {
            v31 = v18;
            goto LABEL_31;
          }
          if (a8)
          {
            v23 = NSStringFromSelector(a2);
            v24 = +[SNNError invalidEspressoConfigurationErrorForMethod:v23 description:@"Invalid built state."];
            goto LABEL_29;
          }
        }
      }
      else if (a8)
      {
        v23 = NSStringFromSelector(a2);
        v24 = +[SNNError invalidEspressoPlanErrorForMethod:v23 description:@"Failed to create plan."];
        goto LABEL_29;
      }
    }
  }
  else if (a8)
  {
    v23 = NSStringFromSelector(a2);
    v24 = +[SNNError invalidEspressoContextErrorForMethod:v23 description:@"Failed to create context."];
    goto LABEL_29;
  }
LABEL_30:
  v31 = 0;
LABEL_31:

  return v31;
}

- (void)deallocEspressoResources
{
  if (self->_plan) {
    espresso_plan_destroy();
  }
  if (self->_context)
  {
    MEMORY[0x270F27EE0]();
  }
}

- (void)dealloc
{
  [(SNNEspressoV1ExecutionContext *)self deallocEspressoResources];
  v3.receiver = self;
  v3.super_class = (Class)SNNEspressoV1ExecutionContext;
  [(SNNEspressoV1ExecutionContext *)&v3 dealloc];
}

- (id)inputAndOutputNames
{
  objc_super v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  for (i = (long long *)*((void *)self->_cppNetwork.__ptr_ + 19); i; i = *(long long **)i)
  {
    std::pair<std::string const,std::shared_ptr<MIL::IRValue const>>::pair[abi:ne180100](&__p, i + 1);
    v5 = (void *)[[NSString alloc] initWithCXXString:&__p];
    [v3 addObject:v5];

    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return v3;
}

- (NSArray)globalNames
{
  objc_super v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  Espresso::net::all_globals((Espresso::net *)self->_cppNetwork.__ptr_, (uint64_t)v9);
  for (i = v10; i; i = *(long long **)i)
  {
    std::pair<std::string const,std::shared_ptr<MIL::IRValue const>>::pair[abi:ne180100](&__p, i + 1);
    v5 = (void *)[[NSString alloc] initWithCXXString:&__p];
    [v3 addObject:v5];

    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)v9);
  return (NSArray *)v3;
}

- (NSArray)inputNames
{
  objc_super v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  ptr = self->_cppNetwork.__ptr_;
  v5 = (void *)*((void *)ptr + 29);
  v6 = (void *)((char *)ptr + 240);
  if (v5 != (void *)((char *)ptr + 240))
  {
    do
    {
      if (*((char *)v5 + 55) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v5[4], v5[5]);
      }
      else {
        std::string __p = *(std::string *)(v5 + 4);
      }
      char v13 = *((unsigned char *)v5 + 56);
      v7 = (void *)[[NSString alloc] initWithCXXString:&__p];
      [v3 addObject:v7];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      v8 = (void *)v5[1];
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
          v9 = (void *)v5[2];
          BOOL v10 = *v9 == (void)v5;
          v5 = v9;
        }
        while (!v10);
      }
      v5 = v9;
    }
    while (v9 != v6);
  }
  return (NSArray *)v3;
}

- (NSArray)outputNames
{
  objc_super v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  ptr = self->_cppNetwork.__ptr_;
  v5 = (void *)*((void *)ptr + 32);
  v6 = (void *)((char *)ptr + 264);
  if (v5 != (void *)((char *)ptr + 264))
  {
    do
    {
      if (*((char *)v5 + 55) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v5[4], v5[5]);
      }
      else {
        std::string __p = *(std::string *)(v5 + 4);
      }
      char v13 = *((unsigned char *)v5 + 56);
      v7 = (void *)[[NSString alloc] initWithCXXString:&__p];
      [v3 addObject:v7];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      v8 = (void *)v5[1];
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
          v9 = (void *)v5[2];
          BOOL v10 = *v9 == (void)v5;
          v5 = v9;
        }
        while (!v10);
      }
      v5 = v9;
    }
    while (v9 != v6);
  }
  return (NSArray *)v3;
}

- (id)shapeForInputWithName:(id)a3
{
  objc_super v3 = [(SNNEspressoV1ExecutionContext *)self shapeForBlobWithName:a3];
  return v3;
}

- (id)shapeForOutputWithName:(id)a3
{
  objc_super v3 = [(SNNEspressoV1ExecutionContext *)self shapeForBlobWithName:a3];
  return v3;
}

- (id)shapeForBlobWithName:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  ptr = self->_cppNetwork.__ptr_;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v6 UTF8String]);
  p_p = &__p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, (long long **)&p_p);
  uint64_t v9 = *((void *)v7 + 5);
  v8 = (std::__shared_weak_count *)*((void *)v7 + 6);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v23 < 0) {
    operator delete(__p);
  }
  unsigned int v10 = *(_DWORD *)(v9 + 28);
  Espresso::abstract_blob_container::shape((char *)v9, (uint64_t)&__p);
  if (v10 > 1)
  {
    switch(v10)
    {
      case 2u:
        v11 = [NSNumber numberWithUnsignedLong:SHIDWORD(__p)];
        v30[0] = v11;
        char v13 = [NSNumber numberWithUnsignedLong:(int)__p];
        v30[1] = v13;
        v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
        goto LABEL_15;
      case 3u:
        v11 = [NSNumber numberWithUnsignedLong:v20];
        v29[0] = v11;
        char v13 = [NSNumber numberWithUnsignedLong:SHIDWORD(__p)];
        v29[1] = v13;
        v14 = [NSNumber numberWithUnsignedLong:(int)__p];
        v29[2] = v14;
        v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
        goto LABEL_14;
      case 4u:
        v11 = [NSNumber numberWithUnsignedLong:v21];
        v28[0] = v11;
        char v13 = [NSNumber numberWithUnsignedLong:v20];
        v28[1] = v13;
        v14 = [NSNumber numberWithUnsignedLong:SHIDWORD(__p)];
        v28[2] = v14;
        id v15 = [NSNumber numberWithUnsignedLong:(int)__p];
        v28[3] = v15;
        v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
        goto LABEL_11;
      case 5u:
        v11 = [NSNumber numberWithUnsignedLong:v22];
        v27[0] = v11;
        char v13 = [NSNumber numberWithUnsignedLong:v21];
        v27[1] = v13;
        v14 = [NSNumber numberWithUnsignedLong:v20];
        v27[2] = v14;
        id v15 = [NSNumber numberWithUnsignedLong:SHIDWORD(__p)];
        v27[3] = v15;
        id v16 = [NSNumber numberWithUnsignedLong:(int)__p];
        v27[4] = v16;
        v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:5];

LABEL_11:
LABEL_14:

LABEL_15:
        goto LABEL_16;
      default:
        v12 = 0;
        goto LABEL_17;
    }
  }
  v11 = [NSNumber numberWithUnsignedLong:(int)__p];
  v31[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
LABEL_16:

LABEL_17:
  id v17 = v12;
  if (v24)
  {
    v25 = v24;
    operator delete(v24);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }

  return v17;
}

- (unint64_t)dataTypeForBlobWithName:(id)a3
{
  id v4 = a3;
  ptr = self->_cppNetwork.__ptr_;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  id v16 = __p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v16);
  uint64_t v9 = *((void *)v7 + 5);
  v8 = (std::__shared_weak_count *)*((void *)v7 + 6);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  int v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 32))(v9);
  unint64_t v11 = 3;
  switch(v10)
  {
    case 0:
      goto LABEL_25;
    case 1:
      unint64_t v11 = 2;
      goto LABEL_25;
    case 2:
      unint64_t v11 = 5;
      goto LABEL_25;
    case 3:
      unint64_t v11 = 7;
      goto LABEL_25;
    case 4:
      v12 = +[SNNLogging framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SNNEspressoV1ExecutionContext dataTypeForBlobWithName:]();
      }
      goto LABEL_23;
    case 5:
      unint64_t v11 = 10;
      goto LABEL_25;
    case 6:
      v12 = +[SNNLogging framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SNNEspressoV1ExecutionContext dataTypeForBlobWithName:]();
      }
      goto LABEL_23;
    case 7:
      unint64_t v11 = 6;
      goto LABEL_25;
    case 8:
      unint64_t v11 = 8;
      goto LABEL_25;
    case 9:
      v12 = +[SNNLogging framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SNNEspressoV1ExecutionContext dataTypeForBlobWithName:]();
      }
      goto LABEL_23;
    case 10:
      unint64_t v11 = 11;
      goto LABEL_25;
    case 11:
    case 12:
      unint64_t v11 = 12;
      goto LABEL_25;
    case 13:
      v12 = +[SNNLogging framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SNNEspressoV1ExecutionContext dataTypeForBlobWithName:].cold.4();
      }
LABEL_23:

      goto LABEL_24;
    case 14:
      unint64_t v11 = 0;
      goto LABEL_25;
    default:
LABEL_24:
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Unsupported data type"];
      unint64_t v11 = 3;
LABEL_25:
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }

      return v11;
  }
}

- (unint64_t)rawSizeForInputWithName:(id)a3
{
  id v4 = a3;
  ptr = self->_cppNetwork.__ptr_;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  v14 = __p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v14);
  uint64_t v9 = *((void *)v7 + 5);
  v8 = (std::__shared_weak_count *)*((void *)v7 + 6);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 128))(v9);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }

  return v10;
}

- (unint64_t)rawSizeForOutputWithName:(id)a3
{
  id v4 = a3;
  ptr = self->_cppNetwork.__ptr_;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  v14 = __p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v14);
  uint64_t v9 = *((void *)v7 + 5);
  v8 = (std::__shared_weak_count *)*((void *)v7 + 6);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 128))(v9);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }

  return v10;
}

- (SNNComputeUnit)primaryComputeUnit
{
  return self->_primaryComputeUnit;
}

- (NSArray)computeUnits
{
  return self->_computeUnits;
}

- (SNNComputePrecision)computePrecision
{
  return self->_computePrecision;
}

- (void)context
{
  return self->_context;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  objc_copyStruct(v4, &self->_network, 16, 1, 0);
  v2 = (void *)v4[0];
  uint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)plan
{
  return self->_plan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computePrecision, 0);
  objc_storeStrong((id *)&self->_computeUnits, 0);
  objc_storeStrong((id *)&self->_primaryComputeUnit, 0);
  cntrl = self->_cppNetwork.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)dataTypeForBlobWithName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_257455000, v0, v1, "Unsupported data type Espresso::U8 requested", v2, v3, v4, v5, v6);
}

- (void)dataTypeForBlobWithName:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_257455000, v0, v1, "Unsupported data type Espresso::I4 requested", v2, v3, v4, v5, v6);
}

- (void)dataTypeForBlobWithName:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_257455000, v0, v1, "Unsupported data type Espresso::U4 requested", v2, v3, v4, v5, v6);
}

- (void)dataTypeForBlobWithName:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_257455000, v0, v1, "Unsupported data type Espresso::BFP16 requested", v2, v3, v4, v5, v6);
}

@end