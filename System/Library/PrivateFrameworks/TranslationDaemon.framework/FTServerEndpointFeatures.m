@interface FTServerEndpointFeatures
- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3;
- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4;
- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4 verify:(BOOL)a5;
- (NSArray)pause_counts;
- (NSString)speech_id;
- (NSString)task_name;
- (Offset<siri::speech::schema_fb::ServerEndpointFeatures>)addObjectToBuffer:(void *)a3;
- (double)eos_likelihood;
- (double)silence_posterior;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)pause_counts_objectAtIndex:(unint64_t)a3;
- (int)num_of_words;
- (int)processed_audio_duration_ms;
- (int)trailing_silence_duration;
- (unint64_t)pause_counts_count;
- (void)pause_counts_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTServerEndpointFeatures

- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3
{
  return [(FTServerEndpointFeatures *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTServerEndpointFeatures *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4
{
  return [(FTServerEndpointFeatures *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTServerEndpointFeatures;
  v10 = [(FTServerEndpointFeatures *)&v26 init];
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
    a4 = (const ServerEndpointFeatures *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ServerEndpointFeatures *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::ServerEndpointFeatures::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (int)processed_audio_duration_ms
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (int)num_of_words
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (int)trailing_silence_duration
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (double)eos_likelihood
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (NSArray)pause_counts
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pause_counts"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__FTServerEndpointFeatures_pause_counts__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTServerEndpointFeatures *)self pause_counts_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pause_counts"];
  }
  return (NSArray *)v3;
}

uint64_t __40__FTServerEndpointFeatures_pause_counts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)pause_counts_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pause_counts"];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xDu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[12].var0;
    if (v11)
    {
      uint64_t v7 = [NSNumber numberWithInt:*(unsigned int *)root[4 * a3 + 4 + v11 + *(unsigned int *)root[v11].var0].var0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)pause_counts_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pause_counts"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (uint64_t v8 = *(unsigned __int16 *)v7[12].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)pause_counts_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pause_counts"];
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
        unsigned __int8 v18 = 0;
        uint64_t v10 = *(unsigned int *)root[v9].var0;
        uint64_t v11 = *(unsigned int *)root[v9 + v10].var0;
        if (v11)
        {
          uint64_t v12 = 0;
          uint64_t v13 = 4 * v11 - 4;
          uint64_t v14 = (uint64_t)&root[v9 + 4 + v10];
          do
          {
            v15 = [NSNumber numberWithInt:*(unsigned int *)(v14 + 4 * v12)];
            v4[2](v4, v15, v12, &v18);
            int v16 = v18;

            ++v12;
            if (v16) {
              BOOL v17 = 1;
            }
            else {
              BOOL v17 = v13 == 0;
            }
            v13 -= 4;
          }
          while (!v17);
        }
      }
    }
  }
}

- (double)silence_posterior
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xFu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[14].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (NSString)task_name
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)speech_id
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (Offset<siri::speech::schema_fb::ServerEndpointFeatures>)addObjectToBuffer:(void *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  int v5 = [(FTServerEndpointFeatures *)self processed_audio_duration_ms];
  int v45 = [(FTServerEndpointFeatures *)self num_of_words];
  int v43 = [(FTServerEndpointFeatures *)self trailing_silence_duration];
  [(FTServerEndpointFeatures *)self eos_likelihood];
  double v7 = v6;
  memset(&v50, 0, sizeof(v50));
  uint64_t v8 = [(FTServerEndpointFeatures *)self pause_counts];
  int v44 = v5;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v50, [v8 count]);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v9 = [(FTServerEndpointFeatures *)self pause_counts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = [*(id *)(*((void *)&v46 + 1) + 8 * i) intValue];
        int v14 = v13;
        std::vector<int>::pointer end = v50.__end_;
        if (v50.__end_ >= v50.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v50.__begin_;
          int64_t v18 = v50.__end_ - v50.__begin_;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v20 = (char *)v50.__end_cap_.__value_ - (char *)v50.__begin_;
          if (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 1 > v19) {
            unint64_t v19 = v20 >> 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v19;
          }
          if (v21)
          {
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v50.__end_cap_, v21);
            std::vector<int>::pointer begin = v50.__begin_;
            std::vector<int>::pointer end = v50.__end_;
          }
          else
          {
            v22 = 0;
          }
          long long v23 = (int *)&v22[4 * v18];
          *long long v23 = v14;
          int v16 = v23 + 1;
          while (end != begin)
          {
            int v24 = *--end;
            *--long long v23 = v24;
          }
          v50.__begin_ = v23;
          v50.__end_ = v16;
          v50.__end_cap_.__value_ = (int *)&v22[4 * v21];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v50.__end_ = v13;
          int v16 = end + 1;
        }
        v50.__end_ = v16;
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v10);
  }

  if (v50.__end_ == v50.__begin_) {
    char v25 = (const unsigned __int8 *)&apple::aiml::flatbuffers2::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  }
  else {
    char v25 = (const unsigned __int8 *)v50.__begin_;
  }
  int v26 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<int>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25, v50.__end_ - v50.__begin_);
  [(FTServerEndpointFeatures *)self silence_posterior];
  double v28 = v27;
  v29 = [(FTServerEndpointFeatures *)self task_name];
  v30 = v29;
  if (!v29) {
    v29 = &stru_270C008E8;
  }
  v31 = (const char *)[(__CFString *)v29 UTF8String];
  size_t v32 = strlen(v31);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v31, v32);

  v34 = [(FTServerEndpointFeatures *)self speech_id];
  v35 = v34;
  if (!v34) {
    v34 = &stru_270C008E8;
  }
  v36 = (const char *)[(__CFString *)v34 UTF8String];
  size_t v37 = strlen(v36);
  LODWORD(v36) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v36, v37);

  *((unsigned char *)a3 + 70) = 1;
  int v38 = *((_DWORD *)a3 + 8);
  int v39 = *((_DWORD *)a3 + 12);
  int v40 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 4, v44, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 6, v45, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, v43, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>(a3, 10, v7, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v26);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>(a3, 14, v28, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, (int)v36);
  v41.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v38 - (unsigned __int16)v39 + v40);
  if (v50.__begin_)
  {
    v50.__end_ = v50.__begin_;
    operator delete(v50.__begin_);
  }
  return v41;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTServerEndpointFeatures *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__40__FTServerEndpointFeatures_flatbuffData__block_invoke(uint64_t a1)
{
  double result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
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