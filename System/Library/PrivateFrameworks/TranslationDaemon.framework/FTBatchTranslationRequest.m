@interface FTBatchTranslationRequest
- (BOOL)is_partial;
- (FTBatchTranslationRequest)initWithFlatbuffData:(id)a3;
- (FTBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4;
- (FTBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4 verify:(BOOL)a5;
- (FTTranslationOptions)options;
- (NSArray)paragraphs;
- (NSString)app_id;
- (NSString)request_id;
- (NSString)session_id;
- (NSString)source_language;
- (NSString)target_language;
- (NSString)task;
- (NSString)url;
- (Offset<siri::speech::schema_fb::BatchTranslationRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)paragraphs_objectAtIndex:(unint64_t)a3;
- (int64_t)opt_in_status;
- (unint64_t)paragraphs_count;
- (void)paragraphs_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTBatchTranslationRequest

- (FTBatchTranslationRequest)initWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4
{
  return [(FTBatchTranslationRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTBatchTranslationRequest;
  v10 = [(FTBatchTranslationRequest *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const BatchTranslationRequest *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::BatchTranslationRequest *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::BatchTranslationRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)request_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)target_language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)paragraphs
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"paragraphs"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__FTBatchTranslationRequest_paragraphs__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTBatchTranslationRequest *)self paragraphs_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"paragraphs"];
  }
  return (NSArray *)v3;
}

uint64_t __39__FTBatchTranslationRequest_paragraphs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)paragraphs_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"paragraphs"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xDu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[12].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTBatchTranslationRequest_Paragraph alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)paragraphs_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"paragraphs"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (uint64_t v8 = *(unsigned __int16 *)v7[12].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)paragraphs_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTBatchTranslationRequest_Paragraph *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"paragraphs"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xDu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[12].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTBatchTranslationRequest_Paragraph alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (NSString)app_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)url
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (int64_t)opt_in_status
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (FTTranslationOptions)options
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"options"];
  if (!v3)
  {
    uint64_t v4 = [FTTranslationOptions alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x17u && (uint64_t v7 = *(unsigned __int16 *)v6[22].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(FTTranslationOptions *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"options"];
  }
  return v3;
}

- (BOOL)is_partial
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x19u && (uint64_t v4 = *(unsigned __int16 *)v3[24].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(FTBatchTranslationRequest *)self request_id];
  v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_270C008E8;
  }
  uint64_t v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v9 = [(FTBatchTranslationRequest *)self task];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v63 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  uint64_t v13 = [(FTBatchTranslationRequest *)self source_language];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_270C008E8;
  }
  uint64_t v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  uint64_t v17 = [(FTBatchTranslationRequest *)self target_language];
  int v18 = v17;
  if (!v17) {
    uint64_t v17 = &stru_270C008E8;
  }
  uint64_t v19 = (const char *)[(__CFString *)v17 UTF8String];
  size_t v20 = strlen(v19);
  int v61 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  memset(&v71, 0, sizeof(v71));
  v21 = [(FTBatchTranslationRequest *)self paragraphs];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v71, [v21 count]);

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v22 = [(FTBatchTranslationRequest *)self paragraphs];
  v65 = self;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(v22);
        }
        int v26 = [*(id *)(*((void *)&v67 + 1) + 8 * i) addObjectToBuffer:a3];
        int v27 = v26;
        std::vector<int>::pointer end = v71.__end_;
        if (v71.__end_ >= v71.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v71.__begin_;
          int64_t v31 = v71.__end_ - v71.__begin_;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v33 = (char *)v71.__end_cap_.__value_ - (char *)v71.__begin_;
          if (((char *)v71.__end_cap_.__value_ - (char *)v71.__begin_) >> 1 > v32) {
            unint64_t v32 = v33 >> 1;
          }
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v32;
          }
          if (v34)
          {
            v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v71.__end_cap_, v34);
            std::vector<int>::pointer begin = v71.__begin_;
            std::vector<int>::pointer end = v71.__end_;
          }
          else
          {
            v35 = 0;
          }
          v36 = (int *)&v35[4 * v31];
          int *v36 = v27;
          v29 = v36 + 1;
          while (end != begin)
          {
            int v37 = *--end;
            *--v36 = v37;
          }
          v71.__begin_ = v36;
          v71.__end_ = v29;
          v71.__end_cap_.__value_ = (int *)&v35[4 * v34];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v71.__end_ = v26;
          v29 = end + 1;
        }
        v71.__end_ = v29;
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v23);
  }

  if (v71.__end_ == v71.__begin_) {
    std::vector<int>::pointer v38 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>> const&)::t;
  }
  else {
    std::vector<int>::pointer v38 = v71.__begin_;
  }
  int v39 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v38, v71.__end_ - v71.__begin_);
  v40 = [(FTBatchTranslationRequest *)v65 app_id];
  v41 = v40;
  if (!v40) {
    v40 = &stru_270C008E8;
  }
  v42 = (const char *)[(__CFString *)v40 UTF8String];
  size_t v43 = strlen(v42);
  int v44 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42, v43);

  v45 = [(FTBatchTranslationRequest *)v65 session_id];
  v46 = v45;
  if (!v45) {
    v45 = &stru_270C008E8;
  }
  v47 = (const char *)[(__CFString *)v45 UTF8String];
  size_t v48 = strlen(v47);
  int v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v47, v48);

  v50 = [(FTBatchTranslationRequest *)v65 url];
  v51 = v50;
  if (!v50) {
    v50 = &stru_270C008E8;
  }
  v52 = (const char *)[(__CFString *)v50 UTF8String];
  size_t v53 = strlen(v52);
  int v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v52, v53);

  LODWORD(v52) = [(FTBatchTranslationRequest *)v65 opt_in_status];
  v55 = [(FTBatchTranslationRequest *)v65 options];
  int v56 = [v55 addObjectToBuffer:a3];

  int v57 = [(FTBatchTranslationRequest *)v65 is_partial];
  *((unsigned char *)a3 + 70) = 1;
  int v66 = *((_DWORD *)a3 + 8);
  int v58 = *((_DWORD *)a3 + 12);
  LODWORD(v55) = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v63);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v62);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v61);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v39);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v44);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, v54);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 20, (int)v52, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 22, v56);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 24, v57, 0);
  v59.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v66 - (unsigned __int16)v58 + (unsigned __int16)v55);
  if (v71.__begin_)
  {
    v71.__end_ = v71.__begin_;
    operator delete(v71.__begin_);
  }
  return v59;
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTBatchTranslationRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__41__FTBatchTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

uint64_t __43__FTBatchTranslationRequest_Paragraph_span__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

apple::aiml::flatbuffers2::DetachedBuffer *__51__FTBatchTranslationRequest_Paragraph_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

@end