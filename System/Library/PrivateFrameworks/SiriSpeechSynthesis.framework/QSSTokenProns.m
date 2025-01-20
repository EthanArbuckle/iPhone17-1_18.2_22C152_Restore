@interface QSSTokenProns
- (NSArray)normalized_prons;
- (NSArray)prons;
- (NSArray)sanitized_sequences;
- (NSString)orthography;
- (Offset<siri::speech::schema_fb::TokenProns>)addObjectToBuffer:(void *)a3;
- (QSSTokenProns)initWithFlatbuffData:(id)a3;
- (QSSTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4;
- (QSSTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTokenProns

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_22B64D0D0;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(QSSTokenProns *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__29__QSSTokenProns_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TokenProns>)addObjectToBuffer:(void *)a3
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  v3 = [(QSSTokenProns *)self orthography];
  v4 = v3;
  if (!v3) {
    v3 = &stru_26DEBFAF8;
  }
  uint64_t v5 = (const char *)[(__CFString *)v3 UTF8String];
  size_t v6 = strlen(v5);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v5, v6);

  long long v7 = [(QSSTokenProns *)self sanitized_sequences];
  unint64_t v8 = [v7 count];
  long long v9 = a3;
  if (v8)
  {
    if (v8 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v8);
    __int16 v12 = &v10[4 * v11];
  }
  else
  {
    uint64_t v10 = 0;
    __int16 v12 = 0;
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v13 = [(QSSTokenProns *)self sanitized_sequences];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v92 objects:v98 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v93;
    v16 = v10;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v93 != v15) {
          objc_enumerationMutation(v13);
        }
        int v18 = [*(id *)(*((void *)&v92 + 1) + 8 * i) addObjectToBuffer:v9];
        int v19 = v18;
        if (v16 >= v12)
        {
          uint64_t v20 = (v16 - v10) >> 2;
          unint64_t v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v12 - v10) >> 1 > v21) {
            unint64_t v21 = (v12 - v10) >> 1;
          }
          if ((unint64_t)(v12 - v10) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v21;
          }
          if (v22) {
            unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v22);
          }
          else {
            uint64_t v23 = 0;
          }
          v24 = (char *)(v22 + 4 * v20);
          *(_DWORD *)v24 = v19;
          v25 = v24 + 4;
          if (v16 == v10)
          {
            long long v9 = a3;
          }
          else
          {
            long long v9 = a3;
            do
            {
              int v26 = *((_DWORD *)v16 - 1);
              v16 -= 4;
              *((_DWORD *)v24 - 1) = v26;
              v24 -= 4;
            }
            while (v16 != v10);
          }
          __int16 v12 = (char *)(v22 + 4 * v23);
          if (v10) {
            operator delete(v10);
          }
          uint64_t v10 = v24;
          v16 = v25;
        }
        else
        {
          *(_DWORD *)v16 = v18;
          v16 += 4;
          long long v9 = a3;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v92 objects:v98 count:16];
    }
    while (v14);
  }
  else
  {
    v16 = v10;
  }

  uint64_t v27 = v16 - v10;
  if (v16 == v10) {
    v28 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>> const&)::t;
  }
  else {
    v28 = v10;
  }
  uint64_t v29 = v27 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v27 >> 2, 4uLL);
  if (v10 == v16)
  {
    LODWORD(v29) = 0;
  }
  else
  {
    v30 = v28 - 4;
    uint64_t v31 = v29;
    do
    {
      int v32 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v30[4 * v31]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v32);
      --v31;
    }
    while (v31);
  }
  unsigned int v77 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v29);
  memset(&v91, 0, sizeof(v91));
  v33 = [(QSSTokenProns *)self prons];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v91, [v33 count]);

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = [(QSSTokenProns *)self prons];
  v34 = a3;
  uint64_t v35 = [obj countByEnumeratingWithState:&v87 objects:v97 count:16];
  begin = v91.__begin_;
  if (v35)
  {
    uint64_t v37 = *(void *)v88;
    value = v91.__end_cap_.__value_;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v88 != v37) {
          objc_enumerationMutation(obj);
        }
        int v40 = [*(id *)(*((void *)&v87 + 1) + 8 * j) addObjectToBuffer:v34];
        int v41 = v40;
        std::vector<int>::pointer end = v91.__end_;
        if (v91.__end_ >= value)
        {
          uint64_t v44 = v91.__end_ - begin;
          unint64_t v45 = v44 + 1;
          if ((unint64_t)(v44 + 1) >> 62)
          {
            v91.__end_cap_.__value_ = value;
            v91.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v45) {
            unint64_t v45 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v46 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v46 = v45;
          }
          if (v46) {
            unint64_t v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v46);
          }
          else {
            uint64_t v47 = 0;
          }
          v48 = (int *)(v46 + 4 * v44);
          int *v48 = v41;
          v43 = v48 + 1;
          while (end != begin)
          {
            int v49 = *--end;
            *--v48 = v49;
          }
          value = (int *)(v46 + 4 * v47);
          v91.__end_ = v43;
          if (begin) {
            operator delete(begin);
          }
          begin = v48;
          v34 = a3;
        }
        else
        {
          *v91.__end_ = v40;
          v43 = end + 1;
        }
        v91.__end_ = v43;
      }
      v91.__end_cap_.__value_ = value;
      v91.__begin_ = begin;
      uint64_t v35 = [obj countByEnumeratingWithState:&v87 objects:v97 count:16];
    }
    while (v35);
  }
  else
  {
    v43 = v91.__end_;
  }

  if (v43 == begin) {
    v50 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>> const&)::t;
  }
  else {
    v50 = begin;
  }
  unsigned int v75 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v50, v43 - begin);
  memset(&v86, 0, sizeof(v86));
  v51 = [(QSSTokenProns *)self normalized_prons];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v86, [v51 count]);

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v52 = [(QSSTokenProns *)self normalized_prons];
  uint64_t v53 = [v52 countByEnumeratingWithState:&v82 objects:v96 count:16];
  v54 = v86.__begin_;
  if (v53)
  {
    id obja = *(id *)v83;
    v55 = v86.__end_cap_.__value_;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(id *)v83 != obja) {
          objc_enumerationMutation(v52);
        }
        int v57 = [*(id *)(*((void *)&v82 + 1) + 8 * k) addObjectToBuffer:a3];
        int v58 = v57;
        std::vector<int>::pointer v59 = v86.__end_;
        if (v86.__end_ >= v55)
        {
          uint64_t v61 = v86.__end_ - v54;
          unint64_t v62 = v61 + 1;
          if ((unint64_t)(v61 + 1) >> 62)
          {
            v86.__end_cap_.__value_ = v55;
            v86.__begin_ = v54;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v55 - (char *)v54) >> 1 > v62) {
            unint64_t v62 = ((char *)v55 - (char *)v54) >> 1;
          }
          if ((unint64_t)((char *)v55 - (char *)v54) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v63 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v63 = v62;
          }
          if (v63) {
            unint64_t v63 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v63);
          }
          else {
            uint64_t v64 = 0;
          }
          v65 = (int *)(v63 + 4 * v61);
          int *v65 = v58;
          v60 = v65 + 1;
          while (v59 != v54)
          {
            int v66 = *--v59;
            *--v65 = v66;
          }
          v55 = (int *)(v63 + 4 * v64);
          v86.__end_ = v60;
          if (v54) {
            operator delete(v54);
          }
          v54 = v65;
        }
        else
        {
          *v86.__end_ = v57;
          v60 = v59 + 1;
        }
        v86.__end_ = v60;
      }
      v86.__end_cap_.__value_ = v55;
      v86.__begin_ = v54;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v82 objects:v96 count:16];
    }
    while (v53);
  }
  else
  {
    v60 = v86.__end_;
  }

  if (v60 == v54) {
    v67 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>> const&)::t;
  }
  else {
    v67 = v54;
  }
  unsigned int v68 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v67, v60 - v54);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v69 = *((_DWORD *)a3 + 8);
  int v70 = *((_DWORD *)a3 + 12);
  int v71 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  if (v77)
  {
    int v72 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v77);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v72);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v75);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v68);
  v73.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v69 - v70 + v71);
  if (v54)
  {
    v86.__end_ = v54;
    operator delete(v54);
  }
  if (v91.__begin_) {
    operator delete(v91.__begin_);
  }
  if (v10) {
    operator delete(v10);
  }
  return v73;
}

- (NSArray)normalized_prons
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_prons"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xBu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[10].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSPronChoice alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"normalized_prons"];
  }
  return (NSArray *)v3;
}

- (NSArray)prons
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prons"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[8].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSPronChoice alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prons"];
  }
  return (NSArray *)v3;
}

- (NSArray)sanitized_sequences
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"sanitized_sequences"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[6].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSTokenProns_SanitizedSequence alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"sanitized_sequences"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__47__QSSTokenProns_SanitizedSequence_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSString)orthography
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTokenProns;
  uint64_t v10 = [(QSSTokenProns *)&v30 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      uint64_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TokenProns *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_16;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      unint64_t v26 = v19;
      long long v27 = xmmword_22B64D0E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::TokenProns *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TokenProns::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          uint64_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  uint64_t v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4
{
  return [(QSSTokenProns *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTokenProns *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTokenProns)initWithFlatbuffData:(id)a3
{
  return [(QSSTokenProns *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end