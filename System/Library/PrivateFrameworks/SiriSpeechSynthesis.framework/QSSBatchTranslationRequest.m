@interface QSSBatchTranslationRequest
- (NSArray)paragraphs;
- (NSString)app_id;
- (NSString)request_id;
- (NSString)session_id;
- (NSString)source_language;
- (NSString)target_language;
- (NSString)task;
- (NSString)url;
- (Offset<siri::speech::schema_fb::BatchTranslationRequest>)addObjectToBuffer:(void *)a3;
- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3;
- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4;
- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)opt_in_status;
@end

@implementation QSSBatchTranslationRequest

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
  v2.var0 = [(QSSBatchTranslationRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__42__QSSBatchTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::BatchTranslationRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  v4 = [(QSSBatchTranslationRequest *)self request_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  HIDWORD(v70) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSBatchTranslationRequest *)self task];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  LODWORD(v70) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(QSSBatchTranslationRequest *)self source_language];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DEBFAF8;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  HIDWORD(v69) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  v16 = [(QSSBatchTranslationRequest *)self target_language];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26DEBFAF8;
  }
  v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  LODWORD(v69) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  v20 = [(QSSBatchTranslationRequest *)self paragraphs];
  unint64_t v21 = [v20 count];
  v22 = a3;
  if (v21)
  {
    if (v21 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v21);
    v25 = &v23[4 * v24];
  }
  else
  {
    v23 = 0;
    v25 = 0;
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v26 = [(QSSBatchTranslationRequest *)self paragraphs];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v73 objects:v77 count:16];
  v71 = self;
  if (v27)
  {
    uint64_t v28 = *(void *)v74;
    v29 = v23;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v74 != v28) {
          objc_enumerationMutation(v26);
        }
        int v31 = objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * i), "addObjectToBuffer:", v22, v69, v70);
        int v32 = v31;
        if (v29 >= v25)
        {
          uint64_t v33 = (v29 - v23) >> 2;
          unint64_t v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v25 - v23) >> 1 > v34) {
            unint64_t v34 = (v25 - v23) >> 1;
          }
          if ((unint64_t)(v25 - v23) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v35 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v35 = v34;
          }
          if (v35) {
            unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v35);
          }
          else {
            uint64_t v36 = 0;
          }
          v37 = (char *)(v35 + 4 * v33);
          *(_DWORD *)v37 = v32;
          v38 = v37 + 4;
          while (v29 != v23)
          {
            int v39 = *((_DWORD *)v29 - 1);
            v29 -= 4;
            *((_DWORD *)v37 - 1) = v39;
            v37 -= 4;
          }
          v25 = (char *)(v35 + 4 * v36);
          if (v23) {
            operator delete(v23);
          }
          v23 = v37;
          v29 = v38;
          v22 = a3;
        }
        else
        {
          *(_DWORD *)v29 = v31;
          v29 += 4;
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v73 objects:v77 count:16];
    }
    while (v27);
  }
  else
  {
    v29 = v23;
  }

  uint64_t v40 = v29 - v23;
  if (v29 == v23) {
    v41 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>> const&)::t;
  }
  else {
    v41 = v23;
  }
  uint64_t v42 = v40 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v40 >> 2, 4uLL);
  if (v23 == v29)
  {
    LODWORD(v42) = 0;
  }
  else
  {
    v43 = v41 - 4;
    uint64_t v44 = v42;
    do
    {
      int v45 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v43[4 * v44]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v45);
      --v44;
    }
    while (v44);
  }
  unsigned int v46 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v42);
  v47 = [(QSSBatchTranslationRequest *)v71 app_id];
  v48 = v47;
  if (!v47) {
    v47 = &stru_26DEBFAF8;
  }
  v49 = (const char *)[(__CFString *)v47 UTF8String];
  size_t v50 = strlen(v49);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v49, v50);

  v52 = [(QSSBatchTranslationRequest *)v71 session_id];
  v53 = v52;
  if (!v52) {
    v52 = &stru_26DEBFAF8;
  }
  v54 = (const char *)[(__CFString *)v52 UTF8String];
  size_t v55 = strlen(v54);
  unsigned int v56 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v54, v55);

  v57 = [(QSSBatchTranslationRequest *)v71 url];
  v58 = v57;
  if (!v57) {
    v57 = &stru_26DEBFAF8;
  }
  v59 = (const char *)[(__CFString *)v57 UTF8String];
  size_t v60 = strlen(v59);
  unsigned int v61 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v59, v60);

  int v62 = [(QSSBatchTranslationRequest *)v71 opt_in_status];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v63 = *((_DWORD *)a3 + 8);
  int v64 = *((_DWORD *)a3 + 12);
  int v65 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, HIDWORD(v70));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, HIDWORD(v69));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v69);
  if (v46)
  {
    int v66 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v46);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v66);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v56);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v61);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v62);
  v67.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v63 - v64 + v65);
  if (v23) {
    operator delete(v23);
  }
  return v67;
}

- (int64_t)opt_in_status
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)url
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)app_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)paragraphs
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"paragraphs"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[12].var0;
      if (v6)
      {
        size_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSBatchTranslationRequest_Paragraph alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"paragraphs"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__52__QSSBatchTranslationRequest_Paragraph_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSString)target_language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)source_language
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)task
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)request_id
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationRequest;
  uint64_t v10 = [(QSSBatchTranslationRequest *)&v30 init];
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
      a4 = (const BatchTranslationRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4
{
  return [(QSSBatchTranslationRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end