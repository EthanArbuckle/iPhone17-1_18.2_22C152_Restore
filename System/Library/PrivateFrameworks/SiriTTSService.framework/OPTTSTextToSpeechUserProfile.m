@interface OPTTSTextToSpeechUserProfile
- (NSArray)resources;
- (OPTTSTextToSpeechUserProfile)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechUserProfile)initWithFlatbuffData:(id)a3 root:(const TextToSpeechUserProfile *)a4;
- (OPTTSTextToSpeechUserProfile)initWithFlatbuffData:(id)a3 root:(const TextToSpeechUserProfile *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechUserProfile>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)resources_objectAtIndex:(unint64_t)a3;
- (unint64_t)resources_count;
- (void)resources_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation OPTTSTextToSpeechUserProfile

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
  v2.var0 = [(OPTTSTextToSpeechUserProfile *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__44__OPTTSTextToSpeechUserProfile_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechUserProfile>)addObjectToBuffer:(void *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(OPTTSTextToSpeechUserProfile *)self resources];
  unint64_t v6 = [v5 count];
  if (v6)
  {
    if (v6 >> 62) {
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    }
    long long v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v6);
    long long v9 = &v7[4 * v8];
  }
  else
  {
    long long v7 = 0;
    long long v9 = 0;
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v10 = [(OPTTSTextToSpeechUserProfile *)self resources];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    uint64_t v13 = v7;
    v37 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        int v15 = [*(id *)(*((void *)&v38 + 1) + 8 * i) addObjectToBuffer:a3];
        int v16 = v15;
        if (v13 >= v9)
        {
          uint64_t v17 = (v13 - v7) >> 2;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((v9 - v7) >> 1 > v18) {
            unint64_t v18 = (v9 - v7) >> 1;
          }
          if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFFCLL) {
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
          v21 = (char *)(v19 + 4 * v17);
          *(_DWORD *)v21 = v16;
          v22 = v21 + 4;
          while (v13 != v7)
          {
            int v23 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v21 - 1) = v23;
            v21 -= 4;
          }
          long long v9 = (char *)(v19 + 4 * v20);
          if (v7) {
            operator delete(v7);
          }
          long long v7 = v21;
          uint64_t v13 = v22;
          uint64_t v10 = v37;
        }
        else
        {
          *(_DWORD *)uint64_t v13 = v15;
          v13 += 4;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v13 = v7;
  }

  uint64_t v24 = v13 - v7;
  if (v13 == v7) {
    v25 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechVoiceResource>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechVoiceResource>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechVoiceResource>> const&)::t;
  }
  else {
    v25 = v7;
  }
  uint64_t v26 = v24 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    v27 = v25 - 4;
    uint64_t v28 = v26;
    do
    {
      int v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v27[4 * v28]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v29);
      --v28;
    }
    while (v28);
  }
  unsigned int v30 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v26);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v31 = *((void *)a3 + 5);
  uint64_t v32 = *((void *)a3 + 6);
  uint64_t v33 = *((void *)a3 + 4);
  if (v30)
  {
    int v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v30);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v34);
  }
  v35.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v33 - (int)v32 + (int)v31);
  if (v7) {
    operator delete(v7);
  }
  return v35;
}

- (void)resources_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, OPTTSTextToSpeechVoiceResource *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"resources"];
  unint64_t v6 = v5;
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
            int v16 = [[OPTTSTextToSpeechVoiceResource alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
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

- (unint64_t)resources_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"resources"];
  v4 = v3;
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

- (id)resources_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"resources"];
  unint64_t v6 = v5;
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
      long long v7 = [[OPTTSTextToSpeechVoiceResource alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)resources
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"resources"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__OPTTSTextToSpeechUserProfile_resources__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTextToSpeechUserProfile *)self resources_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"resources"];
  }
  return (NSArray *)v3;
}

uint64_t __41__OPTTSTextToSpeechUserProfile_resources__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (OPTTSTextToSpeechUserProfile)initWithFlatbuffData:(id)a3 root:(const TextToSpeechUserProfile *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechUserProfile;
  uint64_t v10 = [(OPTTSTextToSpeechUserProfile *)&v26 init];
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
    a4 = (const TextToSpeechUserProfile *)v12 + *v12;
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
  unsigned __int8 v19 = (siri::speech::schema_fb::TextToSpeechUserProfile *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TextToSpeechUserProfile::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    uint64_t v20 = 0;
  else {
LABEL_14:
  }
    uint64_t v20 = v10;

  return v20;
}

- (OPTTSTextToSpeechUserProfile)initWithFlatbuffData:(id)a3 root:(const TextToSpeechUserProfile *)a4
{
  return [(OPTTSTextToSpeechUserProfile *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechUserProfile *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechUserProfile)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechUserProfile *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end