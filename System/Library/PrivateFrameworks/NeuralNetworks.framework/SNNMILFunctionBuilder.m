@interface SNNMILFunctionBuilder
- (BOOL)isUniqueOutputName:(id)a3;
- (BOOL)retainOutputs:(id)a3;
- (BOOL)retainOutputsWithNames:(id)a3;
- (NSMutableArray)outputNames;
- (NSString)name;
- (SNNMILContext)context;
- (SNNMILFunction)function;
- (SNNMILFunctionBuilder)initWithName:(id)a3 context:(id)a4 location:(id)a5;
- (SNNMILSourceLocation)location;
- (basic_string<char,)milName;
- (const)tensorValueTypeWithShape:(id)a3 dataType:(unint64_t)a4;
- (id).cxx_construct;
- (id)build;
- (id)constantOperationWithValue:(unique_ptr<const)MIL:(std:(id)a4 :(id)a5 default_delete<const MIL::IRValue>>)a3 :IRValue name:location:;
- (id)constantScalar:(id)a3 dataType:(unint64_t)a4 location:(id)a5;
- (id)constantScalar:(id)a3 dataType:(unint64_t)a4 name:(id)a5 location:(id)a6;
- (id)constantScalar:(id)a3 location:(id)a4;
- (id)constantScalar:(id)a3 name:(id)a4 location:(id)a5;
- (id)constantTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6 location:(id)a7;
- (id)constantTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6 name:(id)a7 location:(id)a8;
- (id)constantTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5 location:(id)a6;
- (id)constantTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5 name:(id)a6 location:(id)a7;
- (id)constantTensorWithScalars:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 location:(id)a6;
- (id)constantTensorWithScalars:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 name:(id)a6 location:(id)a7;
- (id)constantValue:(id)a3 name:(id)a4 location:(id)a5;
- (id)nextSymbol;
- (id)outputsByApplyingOperatorNamed:(id)a3 toInputs:(id)a4 outputs:(id)a5 attributes:(id)a6 location:(id)a7;
- (id)outputsByApplyingOperatorNamed:(id)a3 toInputs:(id)a4 outputs:(id)a5 location:(id)a6;
- (id)placeholderWithShape:(id)a3 dataType:(unint64_t)a4 location:(id)a5;
- (id)placeholderWithShape:(id)a3 dataType:(unint64_t)a4 name:(id)a5 location:(id)a6;
- (uint64_t)build;
- (unique_ptr<MIL::IRArgument,)milArgumentForSNNMILValue:(id)a3;
- (void)setOutputNames:(id)a3;
@end

@implementation SNNMILFunctionBuilder

- (SNNMILFunctionBuilder)initWithName:(id)a3 context:(id)a4 location:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SNNMILFunctionBuilder;
  v12 = [(SNNMILFunctionBuilder *)&v18 init];
  objc_storeStrong((id *)&v12->_name, a3);
  objc_storeWeak((id *)&v12->_context, v10);
  uint64_t v13 = +[SNNMILSourceLocation locationOrEmpty:v11];
  location = v12->_location;
  v12->_location = (SNNMILSourceLocation *)v13;

  uint64_t v15 = [MEMORY[0x263EFFA68] mutableCopy];
  outputNames = v12->_outputNames;
  v12->_outputNames = (NSMutableArray *)v15;

  return v12;
}

- (basic_string<char,)milName
{
  v3 = [v1 name];
  id v5 = v3;
  if (v3)
  {
    [v3 cxxString];
  }
  else
  {
    retstr->__r_.__value_.var0.var1.__data_ = 0;
    retstr->__r_.__value_.var0.var1.__size_ = 0;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = 0;
  }

  return result;
}

- (id)build
{
  function = self->_function;
  if (function)
  {
    v3 = function;
    goto LABEL_33;
  }
  location = self->_location;
  if (location)
  {
    [(SNNMILSourceLocation *)location milLocation];
    if ((void)v31) {
      operator new();
    }
  }
  v35 = 0;
  memset(v34, 0, sizeof(v34));
  long long v31 = 0u;
  long long v32 = 0u;
  int v33 = 1065353216;
  MIL::IRBlock::Make();
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)&v31);
  *(void *)&long long v31 = v34;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
  uint64_t v29 = 0;
  v30 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  uint64_t v7 = [WeakRetained platformOpset];
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
  id v10 = (void *)v9;
  if (v9 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  id v11 = (const void *)v8;
  if (v9 >= 0x17)
  {
    uint64_t v13 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v13 = v9 | 7;
    }
    uint64_t v14 = v13 + 1;
    v12 = (void **)operator new(v13 + 1);
    __dst[1] = v10;
    unint64_t v28 = v14 | 0x8000000000000000;
    __dst[0] = v12;
  }
  else
  {
    HIBYTE(v28) = v9;
    v12 = __dst;
    if (!v9) {
      goto LABEL_16;
    }
  }
  memmove(v12, v11, (size_t)v10);
LABEL_16:
  *((unsigned char *)v10 + (void)v12) = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  int v33 = 1065353216;
  MIL::IRFunction::Make();
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)&v31);
  if (SHIBYTE(v28) < 0) {
    operator delete(__dst[0]);
  }

  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  uint64_t v15 = [SNNMILFunction alloc];
  uint64_t v25 = v34[0];
  if (v34[0]) {
    operator new();
  }
  v26 = 0;
  v34[0] = 0;
  v16 = [(SNNMILFunctionBuilder *)self name];
  v17 = v16;
  if (v16)
  {
    [v16 cxxString];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v24 = 0;
  }
  objc_super v18 = [(SNNMILFunction *)v15 initWithFunction:&v25 name:__p];
  v19 = self->_function;
  self->_function = v18;

  if (SHIBYTE(v24) < 0) {
    operator delete(__p[0]);
  }

  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  v3 = self->_function;
  uint64_t v20 = v34[0];
  v34[0] = 0;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  uint64_t v21 = v36;
  uint64_t v36 = 0;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
LABEL_33:
  return v3;
}

- (id)placeholderWithShape:(id)a3 dataType:(unint64_t)a4 name:(id)a5 location:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v32 = a5;
  id v31 = a6;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        uint64_t v14 = WeakRetained;
        if (WeakRetained)
        {
          [WeakRetained context];
          uint64_t v15 = (MIL::IRConstantDimension *)__p;
        }
        else
        {
          uint64_t v15 = 0;
          __p = 0;
          uint64_t v36 = 0;
        }
        uint64_t v16 = MIL::IRConstantDimension::Make(v15, (MILContext *)[v12 unsignedIntegerValue]);
        if (v36) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v36);
        }

        v17 = v44;
        if (v44 >= v45)
        {
          uint64_t v19 = ((char *)v44 - (unsigned char *)v43) >> 3;
          if ((unint64_t)(v19 + 1) >> 61) {
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v20 = ((char *)v45 - (unsigned char *)v43) >> 2;
          if (v20 <= v19 + 1) {
            unint64_t v20 = v19 + 1;
          }
          if ((unint64_t)((char *)v45 - (unsigned char *)v43) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21) {
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MIL::IRDimension const*>>((uint64_t)&v45, v21);
          }
          else {
            v22 = 0;
          }
          v23 = (uint64_t *)&v22[8 * v19];
          uint64_t *v23 = v16;
          objc_super v18 = v23 + 1;
          uint64_t v25 = (char *)v43;
          uint64_t v24 = (char *)v44;
          if (v44 != v43)
          {
            do
            {
              uint64_t v26 = *((void *)v24 - 1);
              v24 -= 8;
              *--v23 = v26;
            }
            while (v24 != v25);
            uint64_t v24 = (char *)v43;
          }
          v43 = v23;
          v44 = v18;
          v45 = (uint64_t *)&v22[8 * v21];
          if (v24) {
            operator delete(v24);
          }
        }
        else
        {
          uint64_t *v44 = v16;
          objc_super v18 = v17 + 1;
        }
        v44 = v18;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v9);
  }

  id v27 = objc_loadWeakRetained((id *)&self->_context);
  [v27 context];
  uint64_t v28 = MIL::IRTensorValueType::MakeWithShape();
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }

  uint64_t v38 = v28;
  if (v32)
  {
    [v32 cxxString];
  }
  else
  {
    __p = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
  }
  p_p = &__p;
  v46 = &v38;
  std::__tree<std::__value_type<std::string,MIL::IRValueType const*>,std::__map_value_compare<std::string,std::__value_type<std::string,MIL::IRValueType const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MIL::IRValueType const*>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<MIL::IRTensorValueType const*&>>((uint64_t **)&self->_inputs, (const void **)&__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_p, &v46);
  if (SHIBYTE(v37) < 0) {
    operator delete(__p);
  }
  uint64_t v29 = [[SNNMILNamedValue alloc] initWithName:v32];
  if (v43)
  {
    v44 = (uint64_t *)v43;
    operator delete(v43);
  }

  return v29;
}

- (id)placeholderWithShape:(id)a3 dataType:(unint64_t)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(SNNMILFunctionBuilder *)self nextSymbol];
  id v11 = [(SNNMILFunctionBuilder *)self placeholderWithShape:v8 dataType:a4 name:v10 location:v9];

  return v11;
}

- (BOOL)retainOutputsWithNames:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    p_outputs = &self->_outputs;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v8)
        {
          [v8 cxxString];
        }
        else
        {
          *(_OWORD *)__p = 0uLL;
          std::string::size_type v21 = 0;
        }
        end = (char *)self->_outputs.__end_;
        value = (char *)self->_outputs.__end_cap_.__value_;
        if (end >= value)
        {
          unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)p_outputs->__begin_) >> 3);
          unint64_t v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((value - (char *)p_outputs->__begin_) >> 3);
          if (2 * v13 > v12) {
            unint64_t v12 = 2 * v13;
          }
          if (v13 >= 0x555555555555555) {
            unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v14 = v12;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&self->_outputs.__end_cap_;
          if (v14) {
            uint64_t v15 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&self->_outputs.__end_cap_, v14);
          }
          else {
            uint64_t v15 = 0;
          }
          uint64_t v16 = v15 + v11;
          __v.__first_ = v15;
          __v.__begin_ = v16;
          __v.__end_cap_.__value_ = &v15[v14];
          v16->__r_.__value_.__r.__words[2] = v21;
          *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
          std::string::size_type v21 = 0;
          *(_OWORD *)__p = 0uLL;
          __v.__end_ = v16 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)&self->_outputs, &__v);
          v17 = self->_outputs.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          self->_outputs.__end_ = v17;
        }
        else
        {
          *((void *)end + 2) = v21;
          *(_OWORD *)end = *(_OWORD *)__p;
          self->_outputs.__end_ = end + 24;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }

  return 1;
}

- (BOOL)retainOutputs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "name", (void)v13);
        [v5 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  BOOL v11 = [(SNNMILFunctionBuilder *)self retainOutputsWithNames:v5];
  return v11;
}

- (id)constantOperationWithValue:(unique_ptr<const)MIL:(std:(id)a4 :(id)a5 default_delete<const MIL::IRValue>>)a3 :IRValue name:location:
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained platformOpset];
  std::string::basic_string[abi:ne180100]<0>(&v57, "const");
  MIL::IROpset::TryGetOperatorSharedPtr();
  if (SHIBYTE(v59) < 0) {
    operator delete(v57);
  }

  id v11 = objc_loadWeakRetained((id *)&self->_context);
  unint64_t v12 = v11;
  if (v11) {
    [v11 milValueForString:v8];
  }
  else {
    v54[0] = 0;
  }

  if (v9)
  {
    [v9 milLocation];
    uint64_t v13 = v50;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v47, "");
    MIL::TextFileLocation::Make();
    uint64_t v13 = v49;
    uint64_t v49 = 0;
    uint64_t v50 = v13;
  }
  uint64_t v51 = v13;
  if (v13) {
    operator new();
  }
  v52 = 0;
  uint64_t v50 = 0;
  v45[2] = (void *)v54[1];
  v46 = v55;
  if (v55) {
    atomic_fetch_add_explicit(&v55->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v45[0] = 0;
  v45[1] = 0;
  v44 = v45;
  if (v8)
  {
    [v8 cxxString];
  }
  else
  {
    __p = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
  }
  (*((void (**)(void))*a3.var0.var0->var0 + 4))();
  MIL::IRNamedValueType::Make();
  v63 = v40;
  if (v40) {
    operator new();
  }
  v64 = 0;
  long long v40 = 0;
  long long v41 = 0;
  long long v42 = 0;
  v43 = 0;
  v57 = &v41;
  LOBYTE(v58) = 0;
  long long v41 = operator new(0x10uLL);
  long long v42 = v41;
  v43 = v41 + 2;
  long long v42 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>,std::shared_ptr<MIL::IRNamedValueType> const*,std::shared_ptr<MIL::IRNamedValueType> const*,std::shared_ptr<MIL::IRNamedValueType>*>((uint64_t)&v43, &v63, &v65, v41);
  std::pair<std::string const,std::shared_ptr<MIL::IRValue const>>::pair[abi:ne180100]<char const(&)[4],std::unique_ptr<MIL::IRValue const>,0>(&v57, "val", (uint64_t *)a3.var0.var0);
  std::pair<std::string const,std::shared_ptr<MIL::IRValue const>>::pair[abi:ne180100]<char const(&)[5],std::unique_ptr<MIL::IRValue const>,0>(v62, "name", v54);
  std::unordered_map<std::string,std::shared_ptr<MIL::IRValue const>>::unordered_map((uint64_t)v36, (unsigned __int8 *)&v57, 2);
  memset(v35, 0, sizeof(v35));
  MIL::IROperation::Make();
  v56 = (void **)v35;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100](&v56);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)v36);
  for (uint64_t i = 0; i != -10; i -= 5)
  {
    long long v15 = (void **)&(&v57)[i];
    long long v16 = (std::__shared_weak_count *)v62[i + 4];
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
    if (*((char *)v15 + 63) < 0) {
      operator delete(v15[5]);
    }
  }
  v57 = &v41;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v57);
  if (v64) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v64);
  }
  v17 = v40;
  long long v40 = 0;
  if (v17)
  {
    MIL::IRNamedValueType::~IRNamedValueType(v17);
    MEMORY[0x25A2BA080]();
  }
  if (SHIBYTE(v39) < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>>>::destroy((uint64_t)&v44, v45[0]);
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
  if (v52) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v52);
  }
  uint64_t v18 = v50;
  uint64_t v50 = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  if (!v9)
  {
    uint64_t v19 = v49;
    uint64_t v49 = 0;
    if (v19) {
      (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
    }
    if (v48 < 0) {
      operator delete(v47);
    }
  }
  if (v53) {
    operator new();
  }
  uint64_t v53 = 0;
  value = (char *)self->_operations.__end_cap_.__value_;
  end = (char *)self->_operations.__end_;
  if (end >= value)
  {
    begin = self->_operations.__begin_;
    uint64_t v24 = (end - begin) >> 4;
    unint64_t v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 60) {
      std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v26 = value - begin;
    if (v26 >> 3 > v25) {
      unint64_t v25 = v26 >> 3;
    }
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v27 = v25;
    }
    p_end_cap = &self->_operations.__end_cap_;
    uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&self->_operations.__end_cap_, v27);
    uint64_t v29 = &v28[16 * v24];
    v57 = (void **)v28;
    v58 = v29;
    v60 = &v28[16 * v30];
    *(void *)uint64_t v29 = 0;
    *((void *)v29 + 1) = 0;
    v59 = v29 + 16;
    std::vector<std::shared_ptr<MIL::IROperation>>::__swap_out_circular_buffer((uint64_t *)&self->_operations, &v57);
    long long v22 = self->_operations.__end_;
    std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer((void **)&v57);
  }
  else
  {
    *(void *)end = 0;
    *((void *)end + 1) = 0;
    long long v22 = end + 16;
    self->_operations.__end_ = end + 16;
  }
  self->_operations.__end_ = v22;
  id v31 = [[SNNMILNamedValue alloc] initWithName:v8];
  uint64_t v32 = v53;
  uint64_t v53 = 0;
  if (v32) {
    (*(void (**)(uint64_t))(*(void *)v32 + 8))(v32);
  }
  uint64_t v33 = v54[0];
  v54[0] = 0;
  if (v33) {
    (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
  }
  if (v55) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v55);
  }

  return v31;
}

- (id)constantValue:(id)a3 name:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 conformsToProtocol:&unk_270680B30];
  id v11 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (v11) {
    [v11 milValueWithContext:WeakRetained];
  }
  else {
    uint64_t v18 = 0;
  }

  uint64_t v17 = v18;
  uint64_t v18 = 0;
  uint64_t v13 = [(SNNMILFunctionBuilder *)self constantOperationWithValue:&v17 name:v9 location:v10];
  uint64_t v14 = v17;
  uint64_t v17 = 0;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  uint64_t v15 = v18;
  uint64_t v18 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }

  return v13;
}

- (id)constantScalar:(id)a3 name:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  unint64_t v12 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained milValueForString:v8];
  }
  else {
    uint64_t v18 = 0;
  }

  uint64_t v17 = v18;
  uint64_t v18 = 0;
  uint64_t v13 = [(SNNMILFunctionBuilder *)self constantOperationWithValue:&v17 name:v9 location:v10];
  uint64_t v14 = v17;
  uint64_t v17 = 0;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  uint64_t v15 = v18;
  uint64_t v18 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }

  return v13;
}

- (id)constantScalar:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SNNMILFunctionBuilder *)self nextSymbol];
  id v9 = [(SNNMILFunctionBuilder *)self constantScalar:v6 name:v8 location:v7];

  return v9;
}

- (id)constantScalar:(id)a3 dataType:(unint64_t)a4 name:(id)a5 location:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [[SNNMILDataValue alloc] initWithScalar:v10 dataType:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (v13) {
    [(SNNMILDataValue *)v13 milValueWithContext:WeakRetained];
  }
  else {
    uint64_t v20 = 0;
  }

  uint64_t v19 = v20;
  uint64_t v20 = 0;
  uint64_t v15 = [(SNNMILFunctionBuilder *)self constantOperationWithValue:&v19 name:v11 location:v12];
  uint64_t v16 = v19;
  uint64_t v19 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  uint64_t v17 = v20;
  uint64_t v20 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }

  return v15;
}

- (id)constantTensorWithScalars:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 name:(id)a6 location:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [[SNNMILDataValue alloc] initWithShape:v13 scalars:v12 dataType:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (v16) {
    [(SNNMILDataValue *)v16 milValueWithContext:WeakRetained];
  }
  else {
    uint64_t v23 = 0;
  }

  uint64_t v22 = v23;
  uint64_t v23 = 0;
  uint64_t v18 = [(SNNMILFunctionBuilder *)self constantOperationWithValue:&v22 name:v14 location:v15];
  uint64_t v19 = v22;
  uint64_t v22 = 0;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  uint64_t v20 = v23;
  uint64_t v23 = 0;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }

  return v18;
}

- (id)constantScalar:(id)a3 dataType:(unint64_t)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SNNMILFunctionBuilder *)self nextSymbol];
  id v11 = [(SNNMILFunctionBuilder *)self constantScalar:v8 dataType:a4 name:v10 location:v9];

  return v11;
}

- (id)constantTensorWithScalars:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 location:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(SNNMILFunctionBuilder *)self nextSymbol];
  id v14 = [(SNNMILFunctionBuilder *)self constantTensorWithScalars:v10 shape:v11 dataType:a5 name:v13 location:v12];

  return v14;
}

- (id)constantTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5 name:(id)a6 location:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  uint64_t v16 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained milValueForTensorWithBytes:a3 shape:v12 dataType:a5];
  }
  else {
    uint64_t v22 = 0;
  }

  uint64_t v21 = v22;
  uint64_t v22 = 0;
  uint64_t v17 = [(SNNMILFunctionBuilder *)self constantOperationWithValue:&v21 name:v13 location:v14];
  uint64_t v18 = v21;
  uint64_t v21 = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  uint64_t v19 = v22;
  uint64_t v22 = 0;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }

  return v17;
}

- (id)constantTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5 location:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = [(SNNMILFunctionBuilder *)self nextSymbol];
  id v13 = [(SNNMILFunctionBuilder *)self constantTensorWithBytes:a3 shape:v10 dataType:a5 name:v12 location:v11];

  return v13;
}

- (id)constantTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6 name:(id)a7 location:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  uint64_t v20 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained milValueForTensorBlobWithFilename:v14 shape:v15 dataType:a5 offset:v16];
  }
  else {
    uint64_t v26 = 0;
  }

  uint64_t v25 = v26;
  uint64_t v26 = 0;
  uint64_t v21 = [(SNNMILFunctionBuilder *)self constantOperationWithValue:&v25 name:v17 location:v18];
  uint64_t v22 = v25;
  uint64_t v25 = 0;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }
  uint64_t v23 = v26;
  uint64_t v26 = 0;
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }

  return v21;
}

- (id)constantTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6 location:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(SNNMILFunctionBuilder *)self nextSymbol];
  id v17 = [(SNNMILFunctionBuilder *)self constantTensorBlobWithFilename:v12 shape:v13 dataType:a5 offset:v14 name:v16 location:v15];

  return v17;
}

- (id)outputsByApplyingOperatorNamed:(id)a3 toInputs:(id)a4 outputs:(id)a5 attributes:(id)a6 location:(id)a7
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v88 = a3;
  id v12 = a4;
  id v87 = a5;
  id v86 = a6;
  id v89 = a7;
  v134[1] = 0;
  v134[0] = 0;
  v133 = (uint64_t *)v134;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id obj = v12;
  uint64_t v91 = [obj countByEnumeratingWithState:&v129 objects:v144 count:16];
  if (v91)
  {
    uint64_t v90 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != v91; ++i)
      {
        if (*(void *)v130 != v90) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        id v14 = objc_msgSend(obj, "objectForKeyedSubscript:", v13, v86, v87);
        long long v112 = 0uLL;
        *(void *)&long long v113 = 0;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          long long v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id v93 = v15;
          id v16 = [v15 values];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v125 objects:v143 count:16];
          id v18 = v93;
          if (v17)
          {
            uint64_t v19 = *(void *)v126;
            id v18 = v93;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v126 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(id *)(*((void *)&v125 + 1) + 8 * j);

                id v18 = v21;
                [(SNNMILFunctionBuilder *)self milArgumentForSNNMILValue:v21];
                if (v122) {
                  operator new();
                }
                uint64_t v122 = 0;
                uint64_t v22 = *((void *)&v112 + 1);
                if (*((void *)&v112 + 1) >= (unint64_t)v113)
                {
                  uint64_t v24 = self;
                  uint64_t v25 = v13;
                  uint64_t v26 = (uint64_t)(*((void *)&v112 + 1) - v112) >> 4;
                  unint64_t v27 = v26 + 1;
                  if ((unint64_t)(v26 + 1) >> 60) {
                    std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v28 = v113 - v112;
                  if ((uint64_t)(v113 - v112) >> 3 > v27) {
                    unint64_t v27 = v28 >> 3;
                  }
                  if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v29 = v27;
                  }
                  p_end_cap = (__compressed_pair<std::shared_ptr<MIL::IROperation> *, std::allocator<std::shared_ptr<MIL::IROperation>>> *)&v113;
                  uint64_t v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&v113, v29);
                  id v31 = &v30[16 * v26];
                  __p = v30;
                  v136 = v31;
                  v138 = &v30[16 * v32];
                  *(void *)id v31 = 0;
                  *((void *)v31 + 1) = 0;
                  v137 = v31 + 16;
                  std::vector<std::shared_ptr<MIL::IRArgument>>::__swap_out_circular_buffer((uint64_t *)&v112, &__p);
                  uint64_t v23 = *((void *)&v112 + 1);
                  std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer(&__p);
                  id v13 = v25;
                  self = v24;
                }
                else
                {
                  **((void **)&v112 + 1) = 0;
                  *(void *)(v22 + 8) = 0;
                  uint64_t v23 = v22 + 16;
                }
                *((void *)&v112 + 1) = v23;
                uint64_t v33 = v122;
                uint64_t v122 = 0;
                if (v33) {
                  (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
                }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v125 objects:v143 count:16];
            }
            while (v17);
          }

          id v14 = 0;
        }
        else
        {
          [(SNNMILFunctionBuilder *)self milArgumentForSNNMILValue:v14];
          if (v122) {
            operator new();
          }
          uint64_t v122 = 0;
          uint64_t v34 = *((void *)&v112 + 1);
          if (*((void *)&v112 + 1) >= (unint64_t)v113)
          {
            uint64_t v36 = (uint64_t)(*((void *)&v112 + 1) - v112) >> 4;
            unint64_t v37 = v36 + 1;
            if ((unint64_t)(v36 + 1) >> 60) {
              std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v38 = v113 - v112;
            if ((uint64_t)(v113 - v112) >> 3 > v37) {
              unint64_t v37 = v38 >> 3;
            }
            if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v39 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v39 = v37;
            }
            p_end_cap = (__compressed_pair<std::shared_ptr<MIL::IROperation> *, std::allocator<std::shared_ptr<MIL::IROperation>>> *)&v113;
            long long v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&v113, v39);
            long long v41 = &v40[16 * v36];
            __p = v40;
            v136 = v41;
            v138 = &v40[16 * v42];
            *(void *)long long v41 = 0;
            *((void *)v41 + 1) = 0;
            v137 = v41 + 16;
            std::vector<std::shared_ptr<MIL::IRArgument>>::__swap_out_circular_buffer((uint64_t *)&v112, &__p);
            uint64_t v35 = *((void *)&v112 + 1);
            std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer(&__p);
          }
          else
          {
            **((void **)&v112 + 1) = 0;
            *(void *)(v34 + 8) = 0;
            uint64_t v35 = v34 + 16;
          }
          *((void *)&v112 + 1) = v35;
          uint64_t v43 = v122;
          uint64_t v122 = 0;
          if (v43) {
            (*(void (**)(uint64_t))(*(void *)v43 + 8))(v43);
          }
        }
        if (v13)
        {
          [v13 cxxString];
        }
        else
        {
          v136 = 0;
          __p = 0;
          v137 = 0;
        }
        std::__tree<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>>>::__emplace_unique_key_args<std::string,std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>(&v133, (const void **)&__p, (uint64_t)&__p, (uint64_t)&v112);
        if (SHIBYTE(v137) < 0) {
          operator delete(__p);
        }
        __p = &v112;
        std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      }
      uint64_t v91 = [obj countByEnumeratingWithState:&v129 objects:v144 count:16];
    }
    while (v91);
  }

  v96 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  uint64_t v122 = 0;
  v123 = 0;
  unint64_t v124 = 0;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v94 = v87;
  uint64_t v44 = [v94 countByEnumeratingWithState:&v118 objects:v142 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v119;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v119 != v45) {
          objc_enumerationMutation(v94);
        }
        v47 = *(void **)(*((void *)&v118 + 1) + 8 * k);
        char v48 = objc_msgSend(v47, "dimensions", v86);
        -[SNNMILFunctionBuilder tensorValueTypeWithShape:dataType:](self, "tensorValueTypeWithShape:dataType:", v48, [v47 dataType]);

        uint64_t v49 = [v47 name];
        if (v49) {
          [v47 name];
        }
        else {
        id v50 = [(SNNMILFunctionBuilder *)self nextSymbol];
        }

        if (v50)
        {
          [v50 cxxString];
        }
        else
        {
          v115 = 0;
          uint64_t v116 = 0;
          uint64_t v117 = 0;
        }
        MIL::IRNamedValueType::Make();
        if (__p) {
          operator new();
        }
        __p = 0;
        if (SHIBYTE(v117) < 0) {
          operator delete(v115);
        }
        uint64_t v51 = v123;
        if ((unint64_t)v123 >= v124)
        {
          uint64_t v53 = ((uint64_t)v123 - v122) >> 4;
          unint64_t v54 = v53 + 1;
          if ((unint64_t)(v53 + 1) >> 60) {
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v55 = v124 - v122;
          if ((uint64_t)(v124 - v122) >> 3 > v54) {
            unint64_t v54 = v55 >> 3;
          }
          if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v56 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v56 = v54;
          }
          p_end_cap = (__compressed_pair<std::shared_ptr<MIL::IROperation> *, std::allocator<std::shared_ptr<MIL::IROperation>>> *)&v124;
          v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&v124, v56);
          v58 = &v57[16 * v53];
          __p = v57;
          v136 = v58;
          v138 = &v57[16 * v59];
          *(void *)v58 = 0;
          *((void *)v58 + 1) = 0;
          v137 = v58 + 16;
          std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__swap_out_circular_buffer(&v122, &__p);
          v52 = v123;
          std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer(&__p);
        }
        else
        {
          void *v123 = 0;
          v51[1] = 0;
          v52 = v51 + 2;
        }
        v123 = v52;
        v60 = [[SNNMILNamedValue alloc] initWithName:v50];
        [v96 addObject:v60];
        [(NSMutableArray *)self->_outputNames addObject:v50];
      }
      uint64_t v44 = [v94 countByEnumeratingWithState:&v118 objects:v142 count:16];
    }
    while (v44);
  }

  long long v112 = 0u;
  long long v113 = 0u;
  int v114 = 1065353216;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v97 = v86;
  uint64_t v61 = [v97 countByEnumeratingWithState:&v108 objects:v141 count:16];
  if (v61)
  {
    uint64_t v62 = *(void *)v109;
    do
    {
      for (uint64_t m = 0; m != v61; ++m)
      {
        if (*(void *)v109 != v62) {
          objc_enumerationMutation(v97);
        }
        v64 = *(void **)(*((void *)&v108 + 1) + 8 * m);
        uint64_t v65 = objc_msgSend(v97, "objectForKeyedSubscript:", v64, v86);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        if (v65) {
          [v65 milValueWithContext:WeakRetained];
        }
        else {
          uint64_t v107 = 0;
        }

        if (v64)
        {
          [v64 cxxString];
        }
        else
        {
          v136 = 0;
          __p = 0;
          v137 = 0;
        }
        p_p = &__p;
        v140 = (void **)&v107;
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<std::unique_ptr<MIL::IRValue const> &&>>((uint64_t)&v112, (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, (long long **)&p_p, (uint64_t **)&v140);
        if (SHIBYTE(v137) < 0) {
          operator delete(__p);
        }
        uint64_t v67 = v107;
        uint64_t v107 = 0;
        if (v67) {
          (*(void (**)(uint64_t))(*(void *)v67 + 8))(v67);
        }
      }
      uint64_t v61 = [v97 countByEnumeratingWithState:&v108 objects:v141 count:16];
    }
    while (v61);
  }

  id v68 = objc_loadWeakRetained((id *)&self->_context);
  [v68 platformOpset];
  if (v88)
  {
    [v88 cxxString];
  }
  else
  {
    v136 = 0;
    __p = 0;
    v137 = 0;
  }
  MIL::IROpset::TryGetOperatorSharedPtr();
  if (SHIBYTE(v137) < 0) {
    operator delete(__p);
  }

  if (!p_p) {
    __assert_rtn("-[SNNMILFunctionBuilder outputsByApplyingOperatorNamed:toInputs:outputs:attributes:location:]", "SNNMILBuilders.mm", 324, "op");
  }
  if (v89)
  {
    [v89 milLocation];
    uint64_t v69 = v102;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v99, "");
    MIL::TextFileLocation::Make();
    uint64_t v69 = v101;
    uint64_t v101 = 0;
    uint64_t v102 = v69;
  }
  uint64_t v103 = v69;
  if (v69) {
    operator new();
  }
  v104 = 0;
  uint64_t v102 = 0;
  v98 = v106;
  if (v106) {
    atomic_fetch_add_explicit(&v106->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v136 = 0;
  __p = 0;
  v137 = 0;
  MIL::IROperation::Make();
  v140 = &__p;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100](&v140);
  if (v98) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v98);
  }
  if (v104) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v104);
  }
  uint64_t v70 = v102;
  uint64_t v102 = 0;
  if (v70) {
    (*(void (**)(uint64_t))(*(void *)v70 + 8))(v70);
  }
  if (!v89)
  {
    uint64_t v71 = v101;
    uint64_t v101 = 0;
    if (v71) {
      (*(void (**)(uint64_t))(*(void *)v71 + 8))(v71);
    }
    if (v100 < 0) {
      operator delete(v99);
    }
  }
  if (v107) {
    operator new();
  }
  uint64_t v107 = 0;
  value = (char *)self->_operations.__end_cap_.__value_;
  end = (char *)self->_operations.__end_;
  if (end >= value)
  {
    begin = self->_operations.__begin_;
    uint64_t v76 = (end - begin) >> 4;
    unint64_t v77 = v76 + 1;
    if ((unint64_t)(v76 + 1) >> 60) {
      std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v78 = value - begin;
    if (v78 >> 3 > v77) {
      unint64_t v77 = v78 >> 3;
    }
    if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v79 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v79 = v77;
    }
    p_end_cap = &self->_operations.__end_cap_;
    v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&self->_operations.__end_cap_, v79);
    v81 = &v80[16 * v76];
    __p = v80;
    v136 = v81;
    v138 = &v80[16 * v82];
    *(void *)v81 = 0;
    *((void *)v81 + 1) = 0;
    v137 = v81 + 16;
    std::vector<std::shared_ptr<MIL::IROperation>>::__swap_out_circular_buffer((uint64_t *)&self->_operations, &__p);
    v74 = self->_operations.__end_;
    std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer(&__p);
  }
  else
  {
    *(void *)end = 0;
    *((void *)end + 1) = 0;
    v74 = end + 16;
    self->_operations.__end_ = end + 16;
  }
  self->_operations.__end_ = v74;
  id v83 = v96;
  uint64_t v84 = v107;
  uint64_t v107 = 0;
  if (v84) {
    (*(void (**)(uint64_t))(*(void *)v84 + 8))(v84);
  }
  if (v106) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v106);
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)&v112);
  __p = &v122;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  std::__tree<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>>>::destroy((uint64_t)&v133, v134[0]);
  return v83;
}

- (id)outputsByApplyingOperatorNamed:(id)a3 toInputs:(id)a4 outputs:(id)a5 location:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  id v15 = [(SNNMILFunctionBuilder *)self outputsByApplyingOperatorNamed:v10 toInputs:v11 outputs:v12 attributes:v14 location:v13];

  return v15;
}

- (id)nextSymbol
{
  v2 = NSString;
  unint64_t symbolCounter = self->_symbolCounter;
  self->_unint64_t symbolCounter = symbolCounter + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", @"data_%lu", symbolCounter);
}

- (const)tensorValueTypeWithShape:(id)a3 dataType:(unint64_t)a4
{
  unint64_t v26 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  __p = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        id v10 = WeakRetained;
        if (WeakRetained)
        {
          [WeakRetained context];
          id v11 = v28;
        }
        else
        {
          id v11 = 0;
          uint64_t v28 = 0;
          unint64_t v29 = 0;
        }
        uint64_t v12 = MIL::IRConstantDimension::Make(v11, (MILContext *)objc_msgSend(v8, "unsignedIntegerValue", v26));
        if (v29) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v29);
        }

        id v13 = v35;
        if (v35 >= v36)
        {
          uint64_t v15 = ((char *)v35 - (unsigned char *)__p) >> 3;
          if ((unint64_t)(v15 + 1) >> 61) {
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v16 = ((char *)v36 - (unsigned char *)__p) >> 2;
          if (v16 <= v15 + 1) {
            unint64_t v16 = v15 + 1;
          }
          if ((unint64_t)((char *)v36 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            id v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MIL::IRDimension const*>>((uint64_t)&v36, v17);
          }
          else {
            id v18 = 0;
          }
          uint64_t v19 = (uint64_t *)&v18[8 * v15];
          uint64_t *v19 = v12;
          id v14 = v19 + 1;
          id v21 = (char *)__p;
          uint64_t v20 = (char *)v35;
          if (v35 != __p)
          {
            do
            {
              uint64_t v22 = *((void *)v20 - 1);
              v20 -= 8;
              *--uint64_t v19 = v22;
            }
            while (v20 != v21);
            uint64_t v20 = (char *)__p;
          }
          __p = v19;
          uint64_t v35 = v14;
          uint64_t v36 = (uint64_t *)&v18[8 * v17];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          uint64_t *v35 = v12;
          id v14 = v13 + 1;
        }
        uint64_t v35 = v14;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v5);
  }

  id v23 = objc_loadWeakRetained((id *)&self->_context);
  [v23 context];
  uint64_t v24 = (const IRTensorValueType *)MIL::IRTensorValueType::MakeWithShape();
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }

  if (__p)
  {
    uint64_t v35 = (uint64_t *)__p;
    operator delete(__p);
  }

  return v24;
}

- (unique_ptr<MIL::IRArgument,)milArgumentForSNNMILValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 name];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 cxxString];
    }
    else
    {
      id v10 = 0;
      char v11 = 0;
    }

    MIL::IRArgument::Make();
    if (v11 < 0) {
      operator delete(v10);
    }
  }
  else
  {
    [v4 conformsToProtocol:&unk_270680B30];
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    if (v7) {
      [v7 milValueWithContext:WeakRetained];
    }
    else {
      id v10 = 0;
    }

    if (v10) {
      operator new();
    }
    MIL::IRArgument::Make();
  }
  return v9;
}

- (BOOL)isUniqueOutputName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 cxxString];
  }
  else
  {
    __s1 = 0;
    size_t __n = 0;
    uint64_t v28 = 0;
  }
  begin = (char *)self->_outputs.__begin_;
  end = (char *)self->_outputs.__end_;
  if (begin != end)
  {
    while (1)
    {
      if (begin[23] < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)begin, *((void *)begin + 1));
      }
      else
      {
        long long v8 = *(_OWORD *)begin;
        __p.__r_.__value_.__r.__words[2] = *((void *)begin + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
      }
      if (v28 >= 0) {
        size_t v9 = HIBYTE(v28);
      }
      else {
        size_t v9 = __n;
      }
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      int v11 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      if (v9 == size)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if (v28 < 0)
        {
          BOOL v21 = memcmp(__s1, p_p, __n) == 0;
        }
        else
        {
          if (!HIBYTE(v28))
          {
            BOOL v21 = 1;
            if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_31;
            }
LABEL_30:
            operator delete(__p.__r_.__value_.__l.__data_);
            goto LABEL_31;
          }
          uint64_t v13 = HIBYTE(v28) - 1;
          p_s1 = &__s1;
          do
          {
            int v16 = *(unsigned __int8 *)p_s1;
            p_s1 = (void **)((char *)p_s1 + 1);
            int v15 = v16;
            int v18 = p_p->__r_.__value_.__s.__data_[0];
            p_p = (std::string *)((char *)p_p + 1);
            int v17 = v18;
            BOOL v20 = v13-- != 0;
            BOOL v21 = v15 == v17;
          }
          while (v15 == v17 && v20);
        }
        if (v11 < 0) {
          goto LABEL_30;
        }
      }
      else
      {
        BOOL v21 = 0;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_30;
        }
      }
LABEL_31:
      begin += 24;
      char v22 = begin == end || v21;
      if (v22)
      {
        char v23 = !v21;
        goto LABEL_39;
      }
    }
  }
  char v23 = 1;
LABEL_39:
  if (SHIBYTE(v28) < 0) {
    operator delete(__s1);
  }

  return v23;
}

- (NSString)name
{
  return self->_name;
}

- (SNNMILContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (SNNMILContext *)WeakRetained;
}

- (SNNMILSourceLocation)location
{
  return self->_location;
}

- (SNNMILFunction)function
{
  return self->_function;
}

- (NSMutableArray)outputNames
{
  return self->_outputNames;
}

- (void)setOutputNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_function, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_name, 0);
  p_begin = &self->_operations.__begin_;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_outputs.__begin_;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  std::__tree<std::__value_type<std::string,MIL::IRValueType const*>,std::__map_value_compare<std::string,std::__value_type<std::string,MIL::IRValueType const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MIL::IRValueType const*>>>::destroy((uint64_t)&self->_inputs, (char *)self->_inputs.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

- (uint64_t)build
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

- (void)constantValue:(uint64_t *)a1 name:location:.cold.1(uint64_t *a1)
{
  if (OUTLINED_FUNCTION_0_0(a1))
  {
    OUTLINED_FUNCTION_0();
    (*(void (**)(void))(v1 + 8))();
  }
  OUTLINED_FUNCTION_2();
}

- (uint64_t)constantValue:name:location:.cold.2()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

@end