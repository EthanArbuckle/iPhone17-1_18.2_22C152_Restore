@interface OPTTSTextToSpeechRequestContext
- (NSArray)context_info;
- (NSString)dialog_identifier;
- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4;
- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechRequestContext>)addObjectToBuffer:(void *)a3;
- (id)context_info_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)context_info_count;
- (void)context_info_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation OPTTSTextToSpeechRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_19CEE1A10;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSTextToSpeechRequestContext *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__47__OPTTSTextToSpeechRequestContext_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequestContext>)addObjectToBuffer:(void *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v38 = 0;
  v39 = 0;
  unint64_t v40 = 0;
  uint64_t v5 = [(OPTTSTextToSpeechRequestContext *)self context_info];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v38, [v5 count]);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(OPTTSTextToSpeechRequestContext *)self context_info];
  uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  v32 = self;
  long long v7 = v38;
  if (v6)
  {
    uint64_t v8 = *(void *)v35;
    unint64_t v9 = v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "addObjectToBuffer:", a3, v32);
        int v12 = v11;
        uint64_t v13 = v39;
        if ((unint64_t)v39 >= v9)
        {
          uint64_t v15 = (v39 - v7) >> 2;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
          {
            v38 = v7;
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v9 - (void)v7) >> 1 > v16) {
            unint64_t v16 = (uint64_t)(v9 - (void)v7) >> 1;
          }
          if (v9 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v17);
          }
          else {
            uint64_t v18 = 0;
          }
          v19 = (_DWORD *)(v17 + 4 * v15);
          _DWORD *v19 = v12;
          v14 = (char *)(v19 + 1);
          while (v13 != v7)
          {
            int v20 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *--v19 = v20;
          }
          unint64_t v9 = v17 + 4 * v18;
          v39 = v14;
          if (v7) {
            operator delete(v7);
          }
          long long v7 = v19;
        }
        else
        {
          *(_DWORD *)v39 = v11;
          v14 = v13 + 4;
        }
        v39 = v14;
      }
      unint64_t v40 = v9;
      v38 = v7;
      uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v6);
  }
  else
  {
    v14 = v39;
  }

  if (v14 == v7) {
    v21 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>> const&)::t;
  }
  else {
    v21 = v7;
  }
  unsigned int v22 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v21, (v14 - v7) >> 2);
  v23 = [(OPTTSTextToSpeechRequestContext *)v32 dialog_identifier];
  v24 = v23;
  if (!v23) {
    v23 = &stru_1EEE20510;
  }
  v25 = (const char *)[(__CFString *)v23 UTF8String];
  size_t v26 = strlen(v25);
  LODWORD(v25) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25, v26);

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v27 = *((_DWORD *)a3 + 8);
  int v28 = *((_DWORD *)a3 + 12);
  int v29 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v22);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v25);
  v30.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27 - v28 + v29);
  if (v7)
  {
    v39 = v7;
    operator delete(v7);
  }
  return v30;
}

- (NSString)dialog_identifier
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (void)context_info_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, OPTTSTextToSpeechRequest_ContextInfoEntry *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[4].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            unint64_t v16 = [[OPTTSTextToSpeechRequest_ContextInfoEntry alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
            v4[2](v4, v16, v14, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            ++v14;
            v13 += 4;
            uint64_t v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }
}

- (unint64_t)context_info_count
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    long long v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)context_info_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      long long v7 = [[OPTTSTextToSpeechRequest_ContextInfoEntry alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)context_info
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__OPTTSTextToSpeechRequestContext_context_info__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTextToSpeechRequestContext *)self context_info_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"context_info"];
  }
  return (NSArray *)v3;
}

uint64_t __47__OPTTSTextToSpeechRequestContext_context_info__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechRequestContext;
  uint64_t v10 = [(OPTTSTextToSpeechRequestContext *)&v26 init];
  if (!v10) {
    goto LABEL_14;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_15;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    uint64_t v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechRequestContext *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_14;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_15;
  }
  uint64_t v17 = [*p_data bytes];
  unint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_19CEE1A20;
  uint64_t v24 = 0;
  char v25 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  unsigned __int8 v19 = (siri::speech::schema_fb::TextToSpeechRequestContext *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::TextToSpeechRequestContext::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
  {
LABEL_15:
    int v20 = 0;
  }
  else
  {
LABEL_14:
    int v20 = v10;
  }

  return v20;
}

- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4
{
  return [(OPTTSTextToSpeechRequestContext *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestContext *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestContext *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end