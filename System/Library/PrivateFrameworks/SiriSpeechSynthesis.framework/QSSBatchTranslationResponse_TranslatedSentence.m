@interface QSSBatchTranslationResponse_TranslatedSentence
- (NSArray)n_best_choices;
- (NSString)engine_input;
- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>)addObjectToBuffer:(void *)a3;
- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3;
- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4;
- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4 verify:(BOOL)a5;
- (QSSSpan)source_span;
- (QSSSpan)target_span;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSBatchTranslationResponse_TranslatedSentence

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
  v2.var0 = [(QSSBatchTranslationResponse_TranslatedSentence *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>)addObjectToBuffer:(void *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSBatchTranslationResponse_TranslatedSentence *)self source_span];
  unsigned int v46 = [v5 addObjectToBuffer:a3];

  char v6 = [(QSSBatchTranslationResponse_TranslatedSentence *)self engine_input];
  long long v7 = v6;
  if (!v6) {
    char v6 = &stru_26DEBFAF8;
  }
  long long v8 = (const char *)[(__CFString *)v6 UTF8String];
  size_t v9 = strlen(v8);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v8, v9);

  uint64_t v10 = [(QSSBatchTranslationResponse_TranslatedSentence *)self target_span];
  unsigned int v44 = [v10 addObjectToBuffer:a3];

  uint64_t v11 = [(QSSBatchTranslationResponse_TranslatedSentence *)self n_best_choices];
  unint64_t v12 = [v11 count];
  if (v12)
  {
    if (v12 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v12);
    v15 = &v13[4 * v14];
  }
  else
  {
    uint64_t v13 = 0;
    v15 = 0;
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v16 = [(QSSBatchTranslationResponse_TranslatedSentence *)self n_best_choices];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v49;
    v19 = v13;
    v47 = v16;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v16);
        }
        v21 = a3;
        int v22 = [*(id *)(*((void *)&v48 + 1) + 8 * i) addObjectToBuffer:a3];
        int v23 = v22;
        if (v19 >= v15)
        {
          uint64_t v24 = (v19 - v13) >> 2;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v15 - v13) >> 1 > v25) {
            unint64_t v25 = (v15 - v13) >> 1;
          }
          if ((unint64_t)(v15 - v13) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v25;
          }
          if (v26) {
            unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v26);
          }
          else {
            uint64_t v27 = 0;
          }
          v28 = (char *)(v26 + 4 * v24);
          *(_DWORD *)v28 = v23;
          v29 = v28 + 4;
          a3 = v21;
          while (v19 != v13)
          {
            int v30 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v28 - 1) = v30;
            v28 -= 4;
          }
          v15 = (char *)(v26 + 4 * v27);
          if (v13) {
            operator delete(v13);
          }
          uint64_t v13 = v28;
          v19 = v29;
          v16 = v47;
        }
        else
        {
          *(_DWORD *)v19 = v22;
          v19 += 4;
          a3 = v21;
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v17);
  }
  else
  {
    v19 = v13;
  }

  uint64_t v31 = v19 - v13;
  if (v19 == v13) {
    v32 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>> const&)::t;
  }
  else {
    v32 = v13;
  }
  uint64_t v33 = v31 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v31 >> 2, 4uLL);
  if (v13 == v19)
  {
    LODWORD(v33) = 0;
  }
  else
  {
    v34 = v32 - 4;
    uint64_t v35 = v33;
    do
    {
      int v36 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v34[4 * v35]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v36);
      --v35;
    }
    while (v35);
  }
  unsigned int v37 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v33);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v38 = *((_DWORD *)a3 + 8);
  int v39 = *((_DWORD *)a3 + 12);
  int v40 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v46);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v44);
  if (v37)
  {
    int v41 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v37);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v41);
  }
  v42.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v38 - v39 + v40);
  if (v13) {
    operator delete(v13);
  }
  return v42;
}

- (NSArray)n_best_choices
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_choices"];
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
            unint64_t v12 = [[QSSBatchTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"n_best_choices"];
  }
  return (NSArray *)v3;
}

- (QSSSpan)target_span
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"target_span"];
  if (!v3)
  {
    v4 = [QSSSpan alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(QSSSpan *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"target_span"];
  }
  return v3;
}

- (NSString)engine_input
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSSpan)source_span
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"source_span"];
  if (!v3)
  {
    uint64_t v4 = [QSSSpan alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSSpan *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"source_span"];
  }
  return v3;
}

- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationResponse_TranslatedSentence;
  uint64_t v10 = [(QSSBatchTranslationResponse_TranslatedSentence *)&v30 init];
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
      a4 = (const TranslatedSentence *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          int v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  int v23 = v11;
LABEL_17:

  return v23;
}

- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4
{
  return [(QSSBatchTranslationResponse_TranslatedSentence *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationResponse_TranslatedSentence *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationResponse_TranslatedSentence *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end