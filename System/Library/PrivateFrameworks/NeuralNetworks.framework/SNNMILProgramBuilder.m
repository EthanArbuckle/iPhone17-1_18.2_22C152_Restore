@interface SNNMILProgramBuilder
- (NSMutableArray)functionBuilders;
- (SNNMILContext)context;
- (SNNMILProgram)program;
- (SNNMILProgramBuilder)init;
- (SNNMILProgramBuilder)initWithContext:(id)a3 location:(id)a4;
- (SNNMILSourceLocation)location;
- (id)build;
- (id)functionWithName:(id)a3 location:(id)a4;
- (unique_ptr<MIL::Location,)milLocation;
@end

@implementation SNNMILProgramBuilder

- (SNNMILProgramBuilder)init
{
  v8.receiver = self;
  v8.super_class = (Class)SNNMILProgramBuilder;
  v2 = [(SNNMILProgramBuilder *)&v8 init];
  v3 = objc_alloc_init(SNNMILContext);
  context = v2->_context;
  v2->_context = v3;

  uint64_t v5 = [MEMORY[0x263EFFA68] mutableCopy];
  functionBuilders = v2->_functionBuilders;
  v2->_functionBuilders = (NSMutableArray *)v5;

  return v2;
}

- (SNNMILProgramBuilder)initWithContext:(id)a3 location:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SNNMILProgramBuilder;
  v9 = [(SNNMILProgramBuilder *)&v13 init];
  objc_storeStrong((id *)&v9->_context, a3);
  objc_storeStrong((id *)&v9->_location, a4);
  uint64_t v10 = [MEMORY[0x263EFFA68] mutableCopy];
  functionBuilders = v9->_functionBuilders;
  v9->_functionBuilders = (NSMutableArray *)v10;

  return v9;
}

- (id)build
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  program = self->_program;
  if (program)
  {
    v3 = program;
  }
  else
  {
    memset(v37, 0, sizeof(v37));
    int v38 = 1065353216;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v4 = self->_functionBuilders;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = [*(id *)(*((void *)&v33 + 1) + 8 * i) build];
          v9 = v8;
          if (v8)
          {
            [v8 name];
            [v9 milFunction];
          }
          else
          {
            id v10 = [NSString alloc];
            __p = 0;
            uint64_t v25 = 0;
            uint64_t v26 = 0;
            v11 = (void *)[v10 initWithCXXString:&__p];
            if (SHIBYTE(v26) < 0) {
              operator delete(__p);
            }

            __p = 0;
            uint64_t v25 = 0;
            uint64_t v26 = 0;
            v31 = 0;
            v32 = 0;
          }
          p_p = &__p;
          v39 = &v31;
          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRFunction>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<std::shared_ptr<MIL::IRFunction>&&>>((uint64_t)v37, (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, (long long **)&p_p, (uint64_t *)&v39);
          if (v32) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v32);
          }
          if (SHIBYTE(v26) < 0) {
            operator delete(__p);
          }
        }
        uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v5);
    }

    context = self->_context;
    if (context)
    {
      [(SNNMILContext *)context context];
    }
    else
    {
      uint64_t v29 = 0;
      v30 = 0;
    }
    [(SNNMILProgramBuilder *)self milLocation];
    v27 = __p;
    if (__p) {
      operator new();
    }
    v28 = 0;
    __p = 0;
    MIL::IRProgram::Make();
    if (v28) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    }
    v14 = __p;
    __p = 0;
    if (v14) {
      (*(void (**)(void *))(*(void *)v14 + 8))(v14);
    }
    if (v30) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    }
    MIL::IRProgramValidator::Validate((uint64_t *)&__p, v31, v13);
    if ((MIL::ValidationResult::IsGood((MIL::ValidationResult *)&__p) & 1) == 0) {

    }
    v15 = [SNNMILProgram alloc];
    v16 = v31;
    v31 = 0;
    v23 = v16;
    v17 = [(SNNMILProgram *)v15 initWithProgram:&v23];
    v18 = self->_program;
    self->_program = v17;

    v19 = v23;
    v23 = 0;
    if (v19) {
      (*(void (**)(MIL::IRProgramValidator *))(*(void *)v19 + 8))(v19);
    }
    v3 = self->_program;
    MEMORY[0x25A2B9B80](&__p);
    v20 = v31;
    v31 = 0;
    if (v20) {
      (*(void (**)(MIL::IRProgramValidator *))(*(void *)v20 + 8))(v20);
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)v37);
  }
  return v3;
}

- (unique_ptr<MIL::Location,)milLocation
{
  v3 = v2;
  location = self->_location;
  if (location)
  {
    return (unique_ptr<MIL::Location, std::default_delete<MIL::Location>>)[(SNNMILSourceLocation *)location milLocation];
  }
  else
  {
    uint64_t v5 = MIL::UnknownLocation::Make(&v6, 0);
    void *v3 = v6;
  }
  return (unique_ptr<MIL::Location, std::default_delete<MIL::Location>>)v5;
}

- (id)functionWithName:(id)a3 location:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = self->_functionBuilders;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v13 = objc_msgSend(v12, "name", (void)v17);
        char v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          v15 = v12;

          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v15 = [[SNNMILFunctionBuilder alloc] initWithName:v6 context:self->_context location:v7];
  [(NSMutableArray *)self->_functionBuilders addObject:v15];
LABEL_11:

  return v15;
}

- (SNNMILContext)context
{
  return self->_context;
}

- (SNNMILProgram)program
{
  return self->_program;
}

- (SNNMILSourceLocation)location
{
  return self->_location;
}

- (NSMutableArray)functionBuilders
{
  return self->_functionBuilders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionBuilders, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end