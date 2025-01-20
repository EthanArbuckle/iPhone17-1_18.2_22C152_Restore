@interface QSSTranslationResponse_TranslationPhrase
- (BOOL)low_confidence;
- (NSArray)spans;
- (NSArray)translated_tokens;
- (NSString)meta_info;
- (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3;
- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3;
- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4;
- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5;
- (float)confidence;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTranslationResponse_TranslationPhrase

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
  v2.var0 = [(QSSTranslationResponse_TranslationPhrase *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

- (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  [(QSSTranslationResponse_TranslationPhrase *)self confidence];
  float v6 = v5;
  v63 = self;
  long long v7 = [(QSSTranslationResponse_TranslationPhrase *)self translated_tokens];
  unint64_t v8 = [v7 count];
  if (v8)
  {
    if (v8 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    long long v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v8);
    uint64_t v11 = &v9[4 * v10];
  }
  else
  {
    long long v9 = 0;
    uint64_t v11 = 0;
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  __int16 v12 = [(QSSTranslationResponse_TranslationPhrase *)v63 translated_tokens];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v71 objects:v76 count:16];
  v65 = a3;
  if (v13)
  {
    uint64_t v14 = *(void *)v72;
    v15 = v9;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v72 != v14) {
          objc_enumerationMutation(v12);
        }
        int v17 = [*(id *)(*((void *)&v71 + 1) + 8 * i) addObjectToBuffer:a3];
        int v18 = v17;
        if (v15 >= v11)
        {
          uint64_t v19 = (v15 - v9) >> 2;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v11 - v9) >> 1 > v20) {
            unint64_t v20 = (v11 - v9) >> 1;
          }
          if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21) {
            unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v21);
          }
          else {
            uint64_t v22 = 0;
          }
          v23 = (char *)(v21 + 4 * v19);
          *(_DWORD *)v23 = v18;
          v24 = v23 + 4;
          while (v15 != v9)
          {
            int v25 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v25;
            v23 -= 4;
          }
          uint64_t v11 = (char *)(v21 + 4 * v22);
          if (v9) {
            operator delete(v9);
          }
          long long v9 = v23;
          v15 = v24;
          a3 = v65;
        }
        else
        {
          *(_DWORD *)v15 = v17;
          v15 += 4;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v13);
  }
  else
  {
    v15 = v9;
  }

  uint64_t v26 = v15 - v9;
  if (v15 == v9) {
    v27 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>> const&)::t;
  }
  else {
    v27 = v9;
  }
  uint64_t v28 = v26 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v26 >> 2, 4uLL);
  if (v9 == v15)
  {
    LODWORD(v28) = 0;
  }
  else
  {
    v29 = v27 - 4;
    uint64_t v30 = v28;
    do
    {
      int v31 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v29[4 * v30]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v31);
      --v30;
    }
    while (v30);
  }
  HIDWORD(v62) = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v28);
  v32 = [(QSSTranslationResponse_TranslationPhrase *)v63 meta_info];
  v33 = v32;
  if (!v32) {
    v32 = &stru_26DEBFAF8;
  }
  v34 = (const char *)[(__CFString *)v32 UTF8String];
  size_t v35 = strlen(v34);
  int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v34, v35);

  memset(&v70, 0, sizeof(v70));
  v37 = [(QSSTranslationResponse_TranslationPhrase *)v63 spans];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v70, [v37 count]);

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v38 = [(QSSTranslationResponse_TranslationPhrase *)v63 spans];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v66 objects:v75 count:16];
  LODWORD(v62) = String;
  begin = v70.__begin_;
  if (v39)
  {
    uint64_t v64 = *(void *)v67;
    value = v70.__end_cap_.__value_;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v67 != v64) {
          objc_enumerationMutation(v38);
        }
        int v43 = objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * j), "addObjectToBuffer:", v65, v62);
        int v44 = v43;
        std::vector<int>::pointer end = v70.__end_;
        if (v70.__end_ >= value)
        {
          uint64_t v47 = v70.__end_ - begin;
          unint64_t v48 = v47 + 1;
          if ((unint64_t)(v47 + 1) >> 62)
          {
            v70.__end_cap_.__value_ = value;
            v70.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v48) {
            unint64_t v48 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v49 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v49 = v48;
          }
          if (v49) {
            unint64_t v49 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v49);
          }
          else {
            uint64_t v50 = 0;
          }
          v51 = (int *)(v49 + 4 * v47);
          int *v51 = v44;
          v46 = v51 + 1;
          while (end != begin)
          {
            int v52 = *--end;
            *--v51 = v52;
          }
          value = (int *)(v49 + 4 * v50);
          v70.__end_ = v46;
          if (begin) {
            operator delete(begin);
          }
          begin = v51;
        }
        else
        {
          *v70.__end_ = v43;
          v46 = end + 1;
        }
        v70.__end_ = v46;
      }
      v70.__end_cap_.__value_ = value;
      v70.__begin_ = begin;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v39);
  }
  else
  {
    v46 = v70.__end_;
  }

  if (v46 == begin) {
    v53 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  }
  else {
    v53 = begin;
  }
  unsigned int v54 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)v65, (uint64_t)v53, v46 - begin);
  int v55 = [(QSSTranslationResponse_TranslationPhrase *)v63 low_confidence];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v65);
  *((unsigned char *)v65 + 70) = 1;
  int v56 = *((_DWORD *)v65 + 8);
  int v57 = *((_DWORD *)v65 + 12);
  int v58 = *((_DWORD *)v65 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)v65, 4, v6);
  if (HIDWORD(v62))
  {
    int v59 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v65, HIDWORD(v62));
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v65, 6, v59);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v65, 8, v62);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v65, 10, v54);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)v65, 12, v55);
  v60.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v65, v56 - v57 + v58);
  if (begin)
  {
    v70.__end_ = begin;
    operator delete(begin);
  }
  if (v9) {
    operator delete(v9);
  }
  return v60;
}

- (BOOL)low_confidence
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)spans
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    float v5 = &root[-*(int *)root->var0];
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
            __int16 v12 = [[QSSRepeatedSpan alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"spans"];
  }
  return (NSArray *)v3;
}

- (NSString)meta_info
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

- (NSArray)translated_tokens
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_tokens"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
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
            __int16 v12 = [[QSSTranslationResponse_TranslationToken alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translated_tokens"];
  }
  return (NSArray *)v3;
}

- (float)confidence
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTranslationResponse_TranslationPhrase;
  uint64_t v10 = [(QSSTranslationResponse_TranslationPhrase *)&v30 init];
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
      a4 = (const TranslationPhrase *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TranslationResponse_::TranslationPhrase *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TranslationResponse_::TranslationPhrase::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4
{
  return [(QSSTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3
{
  return [(QSSTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end