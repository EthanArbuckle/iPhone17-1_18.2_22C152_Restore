@interface QSSGraphemeToPhonemeResponse
- (BOOL)is_pron_guessed;
- (NSArray)aot_token_prons;
- (NSArray)jit_token_prons;
- (NSArray)phonemes;
- (NSString)g2p_model_version;
- (NSString)g2p_version;
- (NSString)phoneset_version;
- (NSString)return_str;
- (NSString)session_id;
- (Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse>)addObjectToBuffer:(void *)a3;
- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3;
- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4;
- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSGraphemeToPhonemeResponse

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
  v2.var0 = [(QSSGraphemeToPhonemeResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__44__QSSGraphemeToPhonemeResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  v3 = [(QSSGraphemeToPhonemeResponse *)self session_id];
  v4 = v3;
  if (!v3) {
    v3 = &stru_26DEBFAF8;
  }
  uint64_t v5 = (const char *)[(__CFString *)v3 UTF8String];
  size_t v6 = strlen(v5);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v5, v6);

  int v93 = [(QSSGraphemeToPhonemeResponse *)self return_code];
  long long v7 = [(QSSGraphemeToPhonemeResponse *)self return_str];
  long long v8 = v7;
  if (!v7) {
    long long v7 = &stru_26DEBFAF8;
  }
  long long v9 = (const char *)[(__CFString *)v7 UTF8String];
  size_t v10 = strlen(v9);
  LODWORD(v9) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v9, v10);

  memset(&v111, 0, sizeof(v111));
  uint64_t v11 = [(QSSGraphemeToPhonemeResponse *)self phonemes];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v111, [v11 count]);

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  __int16 v12 = [(QSSGraphemeToPhonemeResponse *)self phonemes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v107 objects:v114 count:16];
  v14 = v12;
  unsigned int v92 = v9;
  begin = v111.__begin_;
  if (v13)
  {
    uint64_t v16 = *(void *)v108;
    value = v111.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v108 != v16) {
          objc_enumerationMutation(v14);
        }
        v19 = (const char *)[*(id *)(*((void *)&v107 + 1) + 8 * i) UTF8String];
        size_t v20 = strlen(v19);
        int v21 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v19, v20);
        int v22 = v21;
        std::vector<int>::pointer end = v111.__end_;
        if (v111.__end_ >= value)
        {
          uint64_t v25 = v111.__end_ - begin;
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62)
          {
            v111.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v26) {
            unint64_t v26 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
          }
          else {
            uint64_t v28 = 0;
          }
          v29 = (int *)(v27 + 4 * v25);
          int *v29 = v22;
          v24 = v29 + 1;
          while (end != begin)
          {
            int v30 = *--end;
            *--v29 = v30;
          }
          value = (int *)(v27 + 4 * v28);
          v111.__end_ = v24;
          if (begin) {
            operator delete(begin);
          }
          begin = v29;
        }
        else
        {
          *v111.__end_ = v21;
          v24 = end + 1;
        }
        v111.__end_ = v24;
      }
      v111.__end_cap_.__value_ = value;
      v111.__begin_ = begin;
      uint64_t v13 = [v14 countByEnumeratingWithState:&v107 objects:v114 count:16];
    }
    while (v13);
  }
  else
  {
    v24 = v111.__end_;
  }

  if (v24 == begin) {
    v31 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v31 = begin;
  }
  unsigned int v91 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v31, v24 - begin);
  int v90 = [(QSSGraphemeToPhonemeResponse *)self is_pron_guessed];
  v32 = [(QSSGraphemeToPhonemeResponse *)self g2p_version];
  v33 = v32;
  if (!v32) {
    v32 = &stru_26DEBFAF8;
  }
  v34 = (const char *)[(__CFString *)v32 UTF8String];
  size_t v35 = strlen(v34);
  unsigned int v89 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v34, v35);

  v36 = [(QSSGraphemeToPhonemeResponse *)self g2p_model_version];
  v37 = v36;
  if (!v36) {
    v36 = &stru_26DEBFAF8;
  }
  v38 = (const char *)[(__CFString *)v36 UTF8String];
  size_t v39 = strlen(v38);
  unsigned int v88 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v38, v39);

  v40 = [(QSSGraphemeToPhonemeResponse *)self phoneset_version];
  v41 = v40;
  if (!v40) {
    v40 = &stru_26DEBFAF8;
  }
  v42 = (const char *)[(__CFString *)v40 UTF8String];
  size_t v43 = strlen(v42);
  unsigned int v87 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v42, v43);

  memset(&v106, 0, sizeof(v106));
  v44 = [(QSSGraphemeToPhonemeResponse *)self aot_token_prons];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v106, [v44 count]);

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v45 = [(QSSGraphemeToPhonemeResponse *)self aot_token_prons];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v102 objects:v113 count:16];
  v47 = v106.__begin_;
  if (v46)
  {
    uint64_t v48 = *(void *)v103;
    v49 = v106.__end_cap_.__value_;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v103 != v48) {
          objc_enumerationMutation(v45);
        }
        int v51 = [*(id *)(*((void *)&v102 + 1) + 8 * j) addObjectToBuffer:a3];
        int v52 = v51;
        std::vector<int>::pointer v53 = v106.__end_;
        if (v106.__end_ >= v49)
        {
          uint64_t v55 = v106.__end_ - v47;
          unint64_t v56 = v55 + 1;
          if ((unint64_t)(v55 + 1) >> 62)
          {
            v106.__begin_ = v47;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v49 - (char *)v47) >> 1 > v56) {
            unint64_t v56 = ((char *)v49 - (char *)v47) >> 1;
          }
          if ((unint64_t)((char *)v49 - (char *)v47) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v57 = v56;
          }
          if (v57) {
            unint64_t v57 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v57);
          }
          else {
            uint64_t v58 = 0;
          }
          v59 = (int *)(v57 + 4 * v55);
          int *v59 = v52;
          v54 = v59 + 1;
          while (v53 != v47)
          {
            int v60 = *--v53;
            *--v59 = v60;
          }
          v49 = (int *)(v57 + 4 * v58);
          v106.__end_ = v54;
          if (v47) {
            operator delete(v47);
          }
          v47 = v59;
        }
        else
        {
          *v106.__end_ = v51;
          v54 = v53 + 1;
        }
        v106.__end_ = v54;
      }
      v106.__end_cap_.__value_ = v49;
      v106.__begin_ = v47;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v102 objects:v113 count:16];
    }
    while (v46);
  }
  else
  {
    v54 = v106.__end_;
  }

  if (v54 == v47) {
    v61 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>> const&)::t;
  }
  else {
    v61 = v47;
  }
  unsigned int v86 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v61, v54 - v47);
  memset(&v101, 0, sizeof(v101));
  v62 = [(QSSGraphemeToPhonemeResponse *)self jit_token_prons];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v101, [v62 count]);

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v63 = [(QSSGraphemeToPhonemeResponse *)self jit_token_prons];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v97 objects:v112 count:16];
  v65 = v101.__begin_;
  if (v64)
  {
    uint64_t v66 = *(void *)v98;
    v67 = v101.__end_cap_.__value_;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v98 != v66) {
          objc_enumerationMutation(v63);
        }
        int v69 = [*(id *)(*((void *)&v97 + 1) + 8 * k) addObjectToBuffer:a3];
        int v70 = v69;
        std::vector<int>::pointer v71 = v101.__end_;
        if (v101.__end_ >= v67)
        {
          uint64_t v73 = v101.__end_ - v65;
          unint64_t v74 = v73 + 1;
          if ((unint64_t)(v73 + 1) >> 62)
          {
            v101.__begin_ = v65;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v67 - (char *)v65) >> 1 > v74) {
            unint64_t v74 = ((char *)v67 - (char *)v65) >> 1;
          }
          if ((unint64_t)((char *)v67 - (char *)v65) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v75 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v75 = v74;
          }
          if (v75) {
            unint64_t v75 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v75);
          }
          else {
            uint64_t v76 = 0;
          }
          v77 = (int *)(v75 + 4 * v73);
          int *v77 = v70;
          v72 = v77 + 1;
          while (v71 != v65)
          {
            int v78 = *--v71;
            *--v77 = v78;
          }
          v67 = (int *)(v75 + 4 * v76);
          v101.__end_ = v72;
          if (v65) {
            operator delete(v65);
          }
          v65 = v77;
        }
        else
        {
          *v101.__end_ = v69;
          v72 = v71 + 1;
        }
        v101.__end_ = v72;
      }
      v101.__end_cap_.__value_ = v67;
      v101.__begin_ = v65;
      uint64_t v64 = [v63 countByEnumeratingWithState:&v97 objects:v112 count:16];
    }
    while (v64);
  }
  else
  {
    v72 = v101.__end_;
  }

  if (v72 == v65) {
    v79 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>> const&)::t;
  }
  else {
    v79 = v65;
  }
  unsigned int v80 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v79, v72 - v65);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v81 = *((_DWORD *)a3 + 8);
  int v82 = *((_DWORD *)a3 + 12);
  int v83 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v93);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v92);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v91);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 12, v90);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v89);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v88);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v87);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v86);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v80);
  v84.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v81 - v82 + v83);
  if (v65)
  {
    v101.__end_ = v65;
    operator delete(v65);
  }
  if (v106.__begin_) {
    operator delete(v106.__begin_);
  }
  if (v111.__begin_) {
    operator delete(v111.__begin_);
  }
  return v84;
}

- (NSArray)jit_token_prons
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"jit_token_prons"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x17u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[22].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        size_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSTokenProns alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"jit_token_prons"];
  }
  return (NSArray *)v3;
}

- (NSArray)aot_token_prons
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"aot_token_prons"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x15u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[20].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        size_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSTokenProns alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"aot_token_prons"];
  }
  return (NSArray *)v3;
}

- (NSString)phoneset_version
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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

- (NSString)g2p_model_version
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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

- (NSString)g2p_version
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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

- (BOOL)is_pron_guessed
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)phonemes
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xBu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[10].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        size_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = (void *)[[NSString alloc] initWithBytes:&v10[*(unsigned int *)v10->var0 + 4] length:*(unsigned int *)v10[*(unsigned int *)v10->var0].var0 encoding:4];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"phonemes"];
  }
  return (NSArray *)v3;
}

- (NSString)return_str
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (int)return_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)session_id
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

- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v54.receiver = self;
  v54.super_class = (Class)QSSGraphemeToPhonemeResponse;
  size_t v10 = [(QSSGraphemeToPhonemeResponse *)&v54 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_81;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_82;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const GraphemeToPhonemeResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_80;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_82;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v49 = v18;
  unint64_t v50 = v19;
  long long v51 = xmmword_22B64D0E0;
  uint64_t v52 = 0;
  char v53 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_80;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v49, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 4u))
  {
    goto LABEL_82;
  }
  int v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v23)) {
    goto LABEL_82;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v25 = *v24;
  if (v25 >= 7 && v24[3] && (v50 < 5 || v50 - 4 < (unint64_t)root + v24[3] - v49)) {
    goto LABEL_82;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 8u)) {
    goto LABEL_82;
  }
  unint64_t v26 = v25 >= 9 && v24[4] ? (const unsigned __int8 *)root + v24[4] + *(unsigned int *)((char *)root + v24[4]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0xAu))
  {
    goto LABEL_82;
  }
  unint64_t v27 = 0;
  uint64_t v28 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v28) >= 0xBu)
  {
    if (!*(_WORD *)((char *)root - v28 + 10)) {
      goto LABEL_35;
    }
    if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v49, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v28 + 10)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v28 + 10)), 4uLL, 0))goto LABEL_82; {
    unint64_t v27 = 0;
    }
    uint64_t v28 = *(int *)root;
    if (*(unsigned __int16 *)((char *)root - v28) >= 0xBu)
    {
LABEL_35:
      uint64_t v29 = *(unsigned __int16 *)((char *)root - v28 + 10);
      if (v29) {
        unint64_t v27 = (_DWORD *)((char *)root + v29 + *(unsigned int *)((char *)root + v29));
      }
      else {
        unint64_t v27 = 0;
      }
    }
  }
  if (!flatbuffers::Verifier::VerifyVectorOfStrings((flatbuffers::Verifier *)&v49, v27)) {
    goto LABEL_82;
  }
  int v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v31 = *v30;
  if (v31 >= 0xD && v30[6] && (v50 < 2 || v50 - 1 < (unint64_t)root + v30[6] - v49)) {
    goto LABEL_82;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0xEu)) {
    goto LABEL_82;
  }
  v32 = v31 >= 0xF && v30[7] ? (const unsigned __int8 *)root + v30[7] + *(unsigned int *)((char *)root + v30[7]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v32)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0x10u))
  {
    goto LABEL_82;
  }
  v33 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v33 >= 0x11u && (uint64_t v34 = v33[8]) != 0) {
    size_t v35 = (const unsigned __int8 *)root + v34 + *(unsigned int *)((char *)root + v34);
  }
  else {
    size_t v35 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v35)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0x12u))
  {
    goto LABEL_82;
  }
  v36 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v36 >= 0x13u && (uint64_t v37 = v36[9]) != 0) {
    v38 = (const unsigned __int8 *)root + v37 + *(unsigned int *)((char *)root + v37);
  }
  else {
    v38 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v38)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0x14u))
  {
    goto LABEL_82;
  }
  size_t v39 = 0;
  uint64_t v40 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v40) >= 0x15u)
  {
    if (!*(_WORD *)((char *)root - v40 + 20)) {
      goto LABEL_67;
    }
    if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v49, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v40 + 20)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v40 + 20)), 4uLL, 0))goto LABEL_82; {
    size_t v39 = 0;
    }
    uint64_t v40 = *(int *)root;
    if (*(unsigned __int16 *)((char *)root - v40) >= 0x15u)
    {
LABEL_67:
      uint64_t v41 = *(unsigned __int16 *)((char *)root - v40 + 20);
      if (v41) {
        size_t v39 = (_DWORD *)((char *)root + v41 + *(unsigned int *)((char *)root + v41));
      }
      else {
        size_t v39 = 0;
      }
    }
  }
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TokenProns>((flatbuffers::Verifier *)&v49, v39)|| !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0x16u))
  {
    goto LABEL_82;
  }
  v42 = 0;
  uint64_t v43 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v43) >= 0x17u)
  {
    if (!*(_WORD *)((char *)root - v43 + 22))
    {
LABEL_76:
      uint64_t v44 = *(unsigned __int16 *)((char *)root - v43 + 22);
      if (v44) {
        v42 = (_DWORD *)((char *)root + v44 + *(unsigned int *)((char *)root + v44));
      }
      else {
        v42 = 0;
      }
      goto LABEL_79;
    }
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v49, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v43 + 22)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v43 + 22)), 4uLL, 0))
    {
      v42 = 0;
      uint64_t v43 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v43) < 0x17u) {
        goto LABEL_79;
      }
      goto LABEL_76;
    }
LABEL_82:
    v47 = 0;
    goto LABEL_83;
  }
LABEL_79:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TokenProns>((flatbuffers::Verifier *)&v49, v42))goto LABEL_82; {
LABEL_80:
  }
  uint64_t v45 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v49);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v45;

LABEL_81:
  v47 = v11;
LABEL_83:

  return v47;
}

- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4
{
  return [(QSSGraphemeToPhonemeResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSGraphemeToPhonemeResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSGraphemeToPhonemeResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end