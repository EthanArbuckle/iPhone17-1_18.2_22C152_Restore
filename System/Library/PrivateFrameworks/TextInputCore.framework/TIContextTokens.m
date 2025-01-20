@interface TIContextTokens
- (TIContextTokens)init;
- (TIContextTokens)initWithContext:(const TITokenID *)a3 contextLength:(unint64_t)a4 contextStringTokens:(id)a5;
- (const)begin;
- (unint64_t)size;
- (void)appendToken:(TITokenID)a3 string:(id)a4;
- (void)clear;
- (void)context;
- (void)dealloc;
- (void)lmContext;
- (void)popBack;
- (void)setContext:(void *)a3;
@end

@implementation TIContextTokens

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void)context
{
  return self->_context;
}

- (void)dealloc
{
  context = (char *)self->_context;
  if (context)
  {
    v7 = (void **)(context + 80);
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v7);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(context + 72));
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(context + 64));
    v4 = (void *)*((void *)context + 2);
    if (v4)
    {
      *((void *)context + 3) = v4;
      operator delete(v4);
    }
    v5 = (std::__shared_weak_count *)*((void *)context + 1);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v5);
    }
    MEMORY[0x1E4E7BC20](context, 0x1020C40C12D0AD1);
  }
  v6.receiver = self;
  v6.super_class = (Class)TIContextTokens;
  [(TIContextTokens *)&v6 dealloc];
}

- (void)lmContext
{
  return self->_context;
}

- (unint64_t)size
{
  return (uint64_t)(*((void *)self->_context + 3) - *((void *)self->_context + 2)) >> 3;
}

- (const)begin
{
  return (const TITokenID *)*((void *)self->_context + 2);
}

- (void)clear
{
}

- (void)popBack
{
}

- (void)appendToken:(TITokenID)a3 string:(id)a4
{
  id v6 = a4;
  v7 = v6;
  context = (KB::LanguageModelContext *)self->_context;
  if (v6) {
    v9 = (char *)[v6 UTF8String];
  }
  else {
    v9 = "";
  }
  std::string::basic_string[abi:nn180100]<0>(__p, v9);
  KB::LanguageModelContext::append(context, *(void *)&a3, (uint64_t)__p, 0);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

- (TIContextTokens)initWithContext:(const TITokenID *)a3 contextLength:(unint64_t)a4 contextStringTokens:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v29.receiver = self;
  v29.super_class = (Class)TIContextTokens;
  if ([(TIContextTokens *)&v29 init])
  {
    unint64_t v7 = [v6 count];
    v27 = 0;
    v28 = 0;
    v26 = 0;
    if (v7)
    {
      unint64_t v8 = v7;
      if (v7 >= 0xAAAAAAAAAAAAAABLL) {
        abort();
      }
      v9 = (std::string *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v7);
      v26 = v9;
      v28 = &v9[v10];
      size_t v11 = 24 * ((24 * v8 - 24) / 0x18) + 24;
      bzero(v9, v11);
      v27 = (char *)v9 + v11;
    }
    else
    {
      v9 = 0;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v13)
    {
      unint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v23;
      v17 = v9;
      uint64_t v18 = *(void *)v23;
      while (1)
      {
        if (v18 != v16) {
          objc_enumerationMutation(v12);
        }
        id v19 = *(id *)(*((void *)&v22 + 1) + 8 * v15);
        std::string::__assign_external(v17, (const std::string::value_type *)objc_msgSend(v19, "UTF8String", (void)v22));
        if (++v15 >= v14)
        {
          uint64_t v20 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (!v20) {
            break;
          }
          unint64_t v14 = v20;
          uint64_t v15 = 0;
        }
        uint64_t v18 = *(void *)v23;
        ++v17;
      }
    }

    operator new();
  }

  return 0;
}

- (TIContextTokens)init
{
  return [(TIContextTokens *)self initWithContext:0 contextLength:0 contextStringTokens:MEMORY[0x1E4F1CBF0]];
}

@end