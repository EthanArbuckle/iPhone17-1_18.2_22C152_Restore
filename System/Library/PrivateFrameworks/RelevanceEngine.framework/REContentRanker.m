@interface REContentRanker
- (BOOL)load:(id)a3 error:(id *)a4;
- (BOOL)save:(id)a3 error:(id *)a4;
- (BOOL)train:(id)a3 isPositive:(BOOL)a4;
- (NSString)negativeContent;
- (NSString)positiveContent;
- (REContentRanker)init;
- (id).cxx_construct;
- (id)predict:(id)a3;
- (int64_t)negativeMapSize;
- (int64_t)positiveMapSize;
@end

@implementation REContentRanker

- (REContentRanker)init
{
  v3.receiver = self;
  v3.super_class = (Class)REContentRanker;
  return [(REContentRanker *)&v3 init];
}

- (BOOL)load:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 stringByAppendingPathComponent:@"PositiveContent.dic"];
  v8 = [NSString stringWithContentsOfFile:v7 encoding:4 error:a4];
  v9 = v8;
  if (!v8) {
    goto LABEL_8;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
  p_extractor = &self->_extractor;
  BOOL v11 = REContentFeatureExtractor::LoadPositiveModel((uint64_t)&self->_extractor, &__p);
  BOOL v12 = v11;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v12) {
      goto LABEL_4;
    }
LABEL_8:
    BOOL v16 = 0;
    goto LABEL_11;
  }
  if (!v11) {
    goto LABEL_8;
  }
LABEL_4:
  v13 = [v6 stringByAppendingPathComponent:@"NegativeContent.dic"];
  v14 = [NSString stringWithContentsOfFile:v13 encoding:4 error:a4];
  v15 = v14;
  if (v14)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v14 UTF8String]);
    BOOL v16 = REContentFeatureExtractor::LoadNegativeModel((uint64_t)p_extractor, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    BOOL v16 = 0;
  }

LABEL_11:
  return v16;
}

- (BOOL)save:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 stringByAppendingPathComponent:@"PositiveContent.dic"];
  MEMORY[0x223C30D40](__sb);
  id v7 = v6;
  [v7 UTF8String];
  std::filebuf::open();
  BOOL v8 = v21;
  if (v21)
  {
    uint64_t v16 = MEMORY[0x263F8C2F8] + 24;
    v17.__vftable = (std::ios_base_vtbl *)(MEMORY[0x263F8C2F8] + 64);
    std::ios_base::init(&v17, __sb);
    uint64_t v18 = 0;
    int v19 = -1;
    REContentFeatureExtractor::SavePositiveModel((uint64_t)&self->_extractor, &v16);
    std::ostream::flush();
    std::ostream::~ostream();
  }
  std::filebuf::close();
  if (v8)
  {
    v9 = [v5 stringByAppendingPathComponent:@"NegativeContent.dic"];
    MEMORY[0x223C30D40](&v16);
    id v10 = v9;
    [v10 UTF8String];
    std::filebuf::open();
    LOBYTE(v8) = v17.__parray_ != 0;
    if (v17.__parray_)
    {
      uint64_t v12 = MEMORY[0x263F8C2F8] + 24;
      v13.__vftable = (std::ios_base_vtbl *)(MEMORY[0x263F8C2F8] + 64);
      std::ios_base::init(&v13, &v16);
      uint64_t v14 = 0;
      int v15 = -1;
      REContentFeatureExtractor::SaveNegativeModel((uint64_t)&self->_extractor, &v12);
      std::ostream::flush();
      std::ostream::~ostream();
    }
    std::filebuf::close();
    MEMORY[0x223C30D50](&v16);
  }
  MEMORY[0x223C30D50](__sb);

  return v8;
}

- (BOOL)train:(id)a3 isPositive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    std::vector<std::string>::vector(&v13, [v6 count]);
    uint64_t v7 = 0;
    for (unint64_t i = 0; i < [v6 count]; ++i)
    {
      id v9 = [v6 objectAtIndexedSubscript:i];
      uint64_t v10 = [v9 UTF8String];
      MEMORY[0x223C30CE0](&v13.__begin_[v7], v10);

      ++v7;
    }
    char v11 = REContentFeatureExtractor::train(&self->_extractor.m_rwlock, (long long **)&v13, v4);
    uint64_t v14 = &v13;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)predict:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 count])
  {
    std::vector<std::string>::vector(&v15, [v4 count]);
    uint64_t v6 = 0;
    for (unint64_t i = 0; i < [v4 count]; ++i)
    {
      id v8 = [v4 objectAtIndexedSubscript:i];
      uint64_t v9 = [v8 UTF8String];
      MEMORY[0x223C30CE0](&v15.__begin_[v6], v9);

      ++v6;
    }
    REContentFeatureExtractor::predict((uint64_t)&self->_extractor, (unsigned __int8 **)&v15, (uint64_t)v11);
    [v5 setValid:LOBYTE(v11[0])];
    [v5 setPositivePolarity:*(double *)&v11[2]];
    [v5 setNegativePolarity:*(double *)&v11[1]];
    [v5 setUnknownCount:v12];
    [v5 setUnbiasedPositivePolarity:v13];
    [v5 setUnbiasedNegativePolarity:v14];
    v11[0] = (void **)&v15;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v11);
  }
  else
  {
    [v5 setValid:0];
  }

  return v5;
}

- (int64_t)positiveMapSize
{
  return SLODWORD(self->_extractor.m_trueTopTokens.m_mapDocumentFrequency.__table_.__p2_.__value_);
}

- (int64_t)negativeMapSize
{
  return SLODWORD(self->_extractor.m_falseTopTokens.m_mapDocumentFrequency.__table_.__p2_.__value_);
}

- (NSString)positiveContent
{
  std::streambuf::basic_streambuf();
  uint64_t v3 = MEMORY[0x263F8C318] + 16;
  __sb[0] = MEMORY[0x263F8C318] + 16;
  long long v15 = 0u;
  long long v16 = 0u;
  int v17 = 24;
  uint64_t v10 = MEMORY[0x263F8C2F8] + 24;
  v11.__vftable = (std::ios_base_vtbl *)(MEMORY[0x263F8C2F8] + 64);
  std::ios_base::init(&v11, __sb);
  uint64_t v12 = 0;
  int v13 = -1;
  REContentFeatureExtractor::SavePositiveModel((uint64_t)&self->_extractor, &v10);
  std::ostream::flush();
  id v4 = NSString;
  std::stringbuf::str();
  if (v9 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  uint64_t v6 = [v4 stringWithUTF8String:p_p];
  if (v9 < 0) {
    operator delete(__p);
  }
  std::ostream::~ostream();
  __sb[0] = v3;
  if (SBYTE7(v16) < 0) {
    operator delete((void *)v15);
  }
  std::streambuf::~streambuf();
  return (NSString *)v6;
}

- (NSString)negativeContent
{
  std::streambuf::basic_streambuf();
  uint64_t v3 = MEMORY[0x263F8C318] + 16;
  __sb[0] = MEMORY[0x263F8C318] + 16;
  long long v15 = 0u;
  long long v16 = 0u;
  int v17 = 24;
  uint64_t v10 = MEMORY[0x263F8C2F8] + 24;
  v11.__vftable = (std::ios_base_vtbl *)(MEMORY[0x263F8C2F8] + 64);
  std::ios_base::init(&v11, __sb);
  uint64_t v12 = 0;
  int v13 = -1;
  REContentFeatureExtractor::SaveNegativeModel((uint64_t)&self->_extractor, &v10);
  std::ostream::flush();
  id v4 = NSString;
  std::stringbuf::str();
  if (v9 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  uint64_t v6 = [v4 stringWithUTF8String:p_p];
  if (v9 < 0) {
    operator delete(__p);
  }
  std::ostream::~ostream();
  __sb[0] = v3;
  if (SBYTE7(v16) < 0) {
    operator delete((void *)v15);
  }
  std::streambuf::~streambuf();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end