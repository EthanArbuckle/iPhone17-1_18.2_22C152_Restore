@interface FTLanguageDetectionResponse
- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3;
- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3 root:(const LanguageDetectionResponse *)a4;
- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3 root:(const LanguageDetectionResponse *)a4 verify:(BOOL)a5;
- (NSArray)predictions;
- (NSString)detected_locale;
- (NSString)return_string;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::LanguageDetectionResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)predictions_objectAtIndex:(unint64_t)a3;
- (int)return_code;
- (unint64_t)predictions_count;
- (void)predictions_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTLanguageDetectionResponse

- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3
{
  return [(FTLanguageDetectionResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTLanguageDetectionResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3 root:(const LanguageDetectionResponse *)a4
{
  return [(FTLanguageDetectionResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3 root:(const LanguageDetectionResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTLanguageDetectionResponse;
  v10 = [(FTLanguageDetectionResponse *)&v26 init];
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
    a4 = (const LanguageDetectionResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::LanguageDetectionResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::LanguageDetectionResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)speech_id
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

- (NSString)session_id
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

- (int)return_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)return_string
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

- (NSString)detected_locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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

- (NSArray)predictions
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"predictions"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__FTLanguageDetectionResponse_predictions__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTLanguageDetectionResponse *)self predictions_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"predictions"];
  }
  return (NSArray *)v3;
}

uint64_t __42__FTLanguageDetectionResponse_predictions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)predictions_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"predictions"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xFu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[14].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTLanguageDetectionPrediction alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)predictions_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"predictions"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (uint64_t v8 = *(unsigned __int16 *)v7[14].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)predictions_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTLanguageDetectionPrediction *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"predictions"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xFu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[14].var0;
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
            uint64_t v17 = [[FTLanguageDetectionPrediction alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::LanguageDetectionResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTLanguageDetectionResponse *)self speech_id];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v9 = [(FTLanguageDetectionResponse *)self session_id];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v50 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  int v49 = [(FTLanguageDetectionResponse *)self return_code];
  uint64_t v13 = [(FTLanguageDetectionResponse *)self return_string];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_270C008E8;
  }
  uint64_t v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int v17 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  int v18 = [(FTLanguageDetectionResponse *)self detected_locale];
  uint64_t v19 = v18;
  if (!v18) {
    int v18 = &stru_270C008E8;
  }
  unsigned __int8 v20 = (const char *)[(__CFString *)v18 UTF8String];
  size_t v21 = strlen(v20);
  int v22 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v20, v21);

  memset(&v56, 0, sizeof(v56));
  long long v23 = [(FTLanguageDetectionResponse *)self predictions];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, [v23 count]);

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v24 = [(FTLanguageDetectionResponse *)self predictions];
  int v47 = v22;
  int v48 = v17;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v24);
        }
        int v28 = [*(id *)(*((void *)&v52 + 1) + 8 * i) addObjectToBuffer:a3];
        int v29 = v28;
        std::vector<int>::pointer end = v56.__end_;
        if (v56.__end_ >= v56.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v56.__begin_;
          int64_t v33 = v56.__end_ - v56.__begin_;
          unint64_t v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v35 = (char *)v56.__end_cap_.__value_ - (char *)v56.__begin_;
          if (((char *)v56.__end_cap_.__value_ - (char *)v56.__begin_) >> 1 > v34) {
            unint64_t v34 = v35 >> 1;
          }
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v36 = v34;
          }
          if (v36)
          {
            v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v56.__end_cap_, v36);
            std::vector<int>::pointer begin = v56.__begin_;
            std::vector<int>::pointer end = v56.__end_;
          }
          else
          {
            v37 = 0;
          }
          v38 = (int *)&v37[4 * v33];
          int *v38 = v29;
          v31 = v38 + 1;
          while (end != begin)
          {
            int v39 = *--end;
            *--v38 = v39;
          }
          v56.__begin_ = v38;
          v56.__end_ = v31;
          v56.__end_cap_.__value_ = (int *)&v37[4 * v36];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v56.__end_ = v28;
          v31 = end + 1;
        }
        v56.__end_ = v31;
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v25);
  }

  if (v56.__end_ == v56.__begin_) {
    std::vector<int>::pointer v40 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>> const&)::t;
  }
  else {
    std::vector<int>::pointer v40 = v56.__begin_;
  }
  int v41 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v40, v56.__end_ - v56.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v42 = *((_DWORD *)a3 + 8);
  int v43 = *((_DWORD *)a3 + 12);
  int v44 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v50);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, v49, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v48);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v47);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v41);
  v45.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v42 - (unsigned __int16)v43 + v44);
  if (v56.__begin_)
  {
    v56.__end_ = v56.__begin_;
    operator delete(v56.__begin_);
  }
  return v45;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTLanguageDetectionResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTLanguageDetectionResponse_flatbuffData__block_invoke(uint64_t a1)
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

@end