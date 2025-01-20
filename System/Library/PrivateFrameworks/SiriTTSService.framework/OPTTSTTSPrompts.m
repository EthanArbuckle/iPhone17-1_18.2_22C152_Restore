@interface OPTTSTTSPrompts
- (NSArray)prompts;
- (NSData)prompts_v2;
- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3;
- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4;
- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TTSPrompts>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)prompts_objectAtIndex:(unint64_t)a3;
- (unint64_t)prompts_count;
- (void)prompts_enumerateObjectsUsingBlock:(id)a3;
- (void)prompts_v2:(id)a3;
@end

@implementation OPTTSTTSPrompts

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
  v2.var0 = [(OPTTSTTSPrompts *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__31__OPTTSTTSPrompts_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TTSPrompts>)addObjectToBuffer:(void *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v44 = 0;
  v45 = 0;
  unint64_t v46 = 0;
  v3 = [(OPTTSTTSPrompts *)self prompts];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v44, [v3 count]);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v4 = [(OPTTSTTSPrompts *)self prompts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v40 objects:v47 count:16];
  char v6 = v4;
  long long v7 = v44;
  if (v5)
  {
    uint64_t v8 = *(void *)v41;
    unint64_t v9 = v46;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (const char *)[*(id *)(*((void *)&v40 + 1) + 8 * i) UTF8String];
        size_t v12 = strlen(v11);
        int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);
        int v14 = String;
        v15 = v45;
        if ((unint64_t)v45 >= v9)
        {
          uint64_t v17 = (v45 - v7) >> 2;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
          {
            v44 = v7;
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v9 - (void)v7) >> 1 > v18) {
            unint64_t v18 = (uint64_t)(v9 - (void)v7) >> 1;
          }
          if (v9 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          if (v19) {
            unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v19);
          }
          else {
            uint64_t v20 = 0;
          }
          v21 = (_DWORD *)(v19 + 4 * v17);
          _DWORD *v21 = v14;
          v16 = (char *)(v21 + 1);
          while (v15 != v7)
          {
            int v22 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *--v21 = v22;
          }
          unint64_t v9 = v19 + 4 * v20;
          v45 = v16;
          if (v7) {
            operator delete(v7);
          }
          long long v7 = v21;
        }
        else
        {
          *(_DWORD *)v45 = String;
          v16 = v15 + 4;
        }
        v45 = v16;
      }
      unint64_t v46 = v9;
      v44 = v7;
      uint64_t v5 = [v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v5);
  }
  else
  {
    v16 = v45;
  }

  if (v16 == v7) {
    v23 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    v23 = v7;
  }
  unsigned int v24 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v23, (v16 - v7) >> 2);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3812000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = &unk_19CF11BD2;
  int v39 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __37__OPTTSTTSPrompts_addObjectToBuffer___block_invoke;
  v32[3] = &unk_1E59202B8;
  v32[4] = &v33;
  v32[5] = a3;
  [(OPTTSTTSPrompts *)self prompts_v2:v32];
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v25 = *((_DWORD *)a3 + 8);
  int v26 = *((_DWORD *)a3 + 12);
  int v27 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v24);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, *((_DWORD *)v34 + 12));
  v28.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25 - v26 + v27);
  _Block_object_dispose(&v33, 8);
  if (v7)
  {
    v45 = v7;
    operator delete(v7);
  }
  return v28;
}

uint64_t __37__OPTTSTTSPrompts_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (void)prompts_v2:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 6].var0;
  if (*(_WORD *)root[-v6 + 6].var0)
  {
    uint64_t v8 = *(unsigned int *)root[v7].var0;
    unint64_t v9 = &root[v7 + v8];
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0;
    uint64_t v8 = *(unsigned int *)root->var0;
  }
  id v10 = v4;
  (*((void (**)(id, const TTSPrompts *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (NSData)prompts_v2
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
  return (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (void)prompts_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
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
        id v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            v16 = (void *)[[NSString alloc] initWithBytes:&v13[*(unsigned int *)v13->var0 + 4] length:*(unsigned int *)v13[*(unsigned int *)v13->var0].var0 encoding:4];
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

- (unint64_t)prompts_count
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)prompts_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = (void *)v7;
    goto LABEL_9;
  }
  root = self->_root;
  id v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      var0 = (unsigned int *)v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0].var0;
      uint64_t v7 = [[NSString alloc] initWithBytes:var0 + 1 length:*var0 encoding:4];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)prompts
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26__OPTTSTTSPrompts_prompts__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTTSPrompts *)self prompts_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prompts"];
  }
  return (NSArray *)v3;
}

uint64_t __26__OPTTSTTSPrompts_prompts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTTSPrompts;
  id v10 = [(OPTTSTTSPrompts *)&v26 init];
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
    a4 = (const TTSPrompts *)v12 + *v12;
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
  unsigned __int8 v19 = (siri::speech::schema_fb::TTSPrompts *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TTSPrompts::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    uint64_t v20 = 0;
  else {
LABEL_14:
  }
    uint64_t v20 = v10;

  return v20;
}

- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4
{
  return [(OPTTSTTSPrompts *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTTSPrompts *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTTSPrompts *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end