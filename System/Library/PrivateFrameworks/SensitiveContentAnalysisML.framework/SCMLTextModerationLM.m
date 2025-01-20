@interface SCMLTextModerationLM
- (SCMLTextModerationLM)initWithError:(id *)a3;
- (id).cxx_construct;
- (id)predict:(id)a3 error:(id *)a4;
@end

@implementation SCMLTextModerationLM

- (SCMLTextModerationLM)initWithError:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCMLTextModerationLM;
  if ([(SCMLTextModerationLM *)&v5 init]) {
    operator new();
  }
  v3 = (SCMLTextModerationLM *)0;

  return v3;
}

- (id)predict:(id)a3 error:(id *)a4
{
  objc_super v5 = (scml *)a3;
  value = (uint64_t *)self->_moderationLM.__ptr_.__value_;
  scml::strFromNSString(v5, __p);
  if ((v23 & 0x80u) == 0) {
    v7 = __p;
  }
  else {
    v7 = (void **)__p[0];
  }
  if ((v23 & 0x80u) == 0) {
    uint64_t v8 = v23;
  }
  else {
    uint64_t v8 = (uint64_t)__p[1];
  }
  scml::TextModerationLM::predict(value, (uint64_t)v7, v8, 0, (uint64_t)v24);
  if ((char)v23 < 0) {
    operator delete(__p[0]);
  }
  v9 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  uint64_t v10 = v25;
  if (v26 != v25)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = v10 + v11;
      if (*(char *)(v13 + 23) < 0)
      {
        uint64_t v15 = *(void *)v13;
        uint64_t v14 = *(void *)(v13 + 8);
      }
      else
      {
        uint64_t v14 = *(unsigned __int8 *)(v13 + 23);
        uint64_t v15 = v13;
      }
      v16 = scml::strToNSString(v15, v14);
      v17 = [SCMLTextModerationLMPrediction alloc];
      LODWORD(v18) = *((_DWORD *)v28 + v12);
      v19 = [(SCMLTextModerationLMPrediction *)v17 initWithNameP1:v16 safe:(*(void *)((char *)v27 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1 probability:v18];
      [v9 addObject:v19];

      ++v12;
      uint64_t v10 = v25;
      v11 += 24;
    }
    while (v12 < 0xAAAAAAAAAAAAAAABLL * ((v26 - v25) >> 3));
  }
  v20 = objc_alloc_init(SCMLTextModerationLMResult);
  [(SCMLTextModerationLMResult *)v20 setSafe:v24[0]];
  [(SCMLTextModerationLMResult *)v20 setPredictions:v9];

  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }
  if (v27) {
    operator delete(v27);
  }
  __p[0] = &v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v20;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end