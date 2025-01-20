@interface FTGraphemeToPhonemeResponse
- (BOOL)is_pron_guessed;
- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3;
- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4;
- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4 verify:(BOOL)a5;
- (NSArray)aot_token_prons;
- (NSArray)jit_token_prons;
- (NSArray)phonemes;
- (NSString)g2p_model_version;
- (NSString)g2p_version;
- (NSString)phoneset_version;
- (NSString)return_str;
- (NSString)session_id;
- (Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse>)addObjectToBuffer:(void *)a3;
- (id)aot_token_prons_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)jit_token_prons_objectAtIndex:(unint64_t)a3;
- (id)phonemes_objectAtIndex:(unint64_t)a3;
- (int)return_code;
- (unint64_t)aot_token_prons_count;
- (unint64_t)jit_token_prons_count;
- (unint64_t)phonemes_count;
- (void)aot_token_prons_enumerateObjectsUsingBlock:(id)a3;
- (void)jit_token_prons_enumerateObjectsUsingBlock:(id)a3;
- (void)phonemes_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTGraphemeToPhonemeResponse

- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3
{
  return [(FTGraphemeToPhonemeResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTGraphemeToPhonemeResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4
{
  return [(FTGraphemeToPhonemeResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTGraphemeToPhonemeResponse;
  v10 = [(FTGraphemeToPhonemeResponse *)&v26 init];
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
    a4 = (const GraphemeToPhonemeResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::GraphemeToPhonemeResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::GraphemeToPhonemeResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)session_id
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

- (NSString)return_str
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

- (NSArray)phonemes
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__FTGraphemeToPhonemeResponse_phonemes__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTGraphemeToPhonemeResponse *)self phonemes_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"phonemes"];
  }
  return (NSArray *)v3;
}

uint64_t __39__FTGraphemeToPhonemeResponse_phonemes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)phonemes_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xBu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[10].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      unint64_t v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
      uint64_t v7 = [[NSString alloc] initWithBytes:v13 + 1 length:*v13 encoding:4];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)phonemes_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (uint64_t v8 = *(unsigned __int16 *)v7[10].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)phonemes_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[10].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        v10 = &root[v9 + *(unsigned int *)root[v9].var0];
        uint64_t v11 = *(unsigned int *)v10->var0;
        if (v11)
        {
          uint64_t v12 = 4 - 4 * v11;
          uint64_t v13 = 1;
          uint64_t v14 = 8;
          do
          {
            var0 = (unsigned int *)v10[4 * v13].var0;
            v16 = (void *)[[NSString alloc] initWithBytes:&v10[v14 + *var0] length:*(unsigned int *)((char *)var0 + *var0) encoding:4];
            v4[2](v4, v16, v13 - 1, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            uint64_t v18 = v12 + v14;
            ++v13;
            v14 += 4;
          }
          while (v18 != 8);
        }
      }
    }
  }
}

- (BOOL)is_pron_guessed
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)g2p_version
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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

- (NSString)phoneset_version
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

- (NSArray)aot_token_prons
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"aot_token_prons"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__FTGraphemeToPhonemeResponse_aot_token_prons__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTGraphemeToPhonemeResponse *)self aot_token_prons_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"aot_token_prons"];
  }
  return (NSArray *)v3;
}

uint64_t __46__FTGraphemeToPhonemeResponse_aot_token_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)aot_token_prons_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"aot_token_prons"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0x15u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[20].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTokenProns alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)aot_token_prons_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"aot_token_prons"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x15u && (uint64_t v8 = *(unsigned __int16 *)v7[20].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)aot_token_prons_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTokenProns *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"aot_token_prons"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x15u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[20].var0;
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
            int v17 = [[FTTokenProns alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)jit_token_prons
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"jit_token_prons"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__FTGraphemeToPhonemeResponse_jit_token_prons__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTGraphemeToPhonemeResponse *)self jit_token_prons_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"jit_token_prons"];
  }
  return (NSArray *)v3;
}

uint64_t __46__FTGraphemeToPhonemeResponse_jit_token_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)jit_token_prons_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"jit_token_prons"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0x17u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[22].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTokenProns alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)jit_token_prons_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"jit_token_prons"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x17u && (uint64_t v8 = *(unsigned __int16 *)v7[22].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)jit_token_prons_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTokenProns *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"jit_token_prons"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x17u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[22].var0;
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
            int v17 = [[FTTokenProns alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(FTGraphemeToPhonemeResponse *)self session_id];
  unint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = &stru_270C008E8;
  }
  v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6, v7);

  int v93 = [(FTGraphemeToPhonemeResponse *)self return_code];
  uint64_t v8 = [(FTGraphemeToPhonemeResponse *)self return_str];
  uint64_t v9 = v8;
  if (!v8) {
    uint64_t v8 = &stru_270C008E8;
  }
  v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  int v92 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10, v11);

  memset(&v110, 0, sizeof(v110));
  uint64_t v12 = [(FTGraphemeToPhonemeResponse *)self phonemes];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v110, [v12 count]);

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v13 = [(FTGraphemeToPhonemeResponse *)self phonemes];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v106 objects:v113 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v107 != v15) {
          objc_enumerationMutation(v13);
        }
        int v17 = (const char *)[*(id *)(*((void *)&v106 + 1) + 8 * i) UTF8String];
        size_t v18 = strlen(v17);
        int v19 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v17, v18);
        int v20 = v19;
        std::vector<int>::pointer end = v110.__end_;
        if (v110.__end_ >= v110.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v110.__begin_;
          int64_t v24 = v110.__end_ - v110.__begin_;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v26 = (char *)v110.__end_cap_.__value_ - (char *)v110.__begin_;
          if (((char *)v110.__end_cap_.__value_ - (char *)v110.__begin_) >> 1 > v25) {
            unint64_t v25 = v26 >> 1;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v110.__end_cap_, v27);
            std::vector<int>::pointer begin = v110.__begin_;
            std::vector<int>::pointer end = v110.__end_;
          }
          else
          {
            v28 = 0;
          }
          v29 = (int *)&v28[4 * v24];
          int *v29 = v20;
          v22 = v29 + 1;
          while (end != begin)
          {
            int v30 = *--end;
            *--v29 = v30;
          }
          v110.__begin_ = v29;
          v110.__end_ = v22;
          v110.__end_cap_.__value_ = (int *)&v28[4 * v27];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v110.__end_ = v19;
          v22 = end + 1;
        }
        v110.__end_ = v22;
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v106 objects:v113 count:16];
    }
    while (v14);
  }

  if (v110.__end_ == v110.__begin_) {
    std::vector<int>::pointer v31 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v31 = v110.__begin_;
  }
  int v91 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v31, v110.__end_ - v110.__begin_);
  int v90 = [(FTGraphemeToPhonemeResponse *)self is_pron_guessed];
  v32 = [(FTGraphemeToPhonemeResponse *)self g2p_version];
  v33 = v32;
  if (!v32) {
    v32 = &stru_270C008E8;
  }
  v34 = (const char *)[(__CFString *)v32 UTF8String];
  size_t v35 = strlen(v34);
  int v89 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v34, v35);

  v36 = [(FTGraphemeToPhonemeResponse *)self g2p_model_version];
  v37 = v36;
  if (!v36) {
    v36 = &stru_270C008E8;
  }
  v38 = (const char *)[(__CFString *)v36 UTF8String];
  size_t v39 = strlen(v38);
  int v88 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v38, v39);

  v40 = [(FTGraphemeToPhonemeResponse *)self phoneset_version];
  v41 = v40;
  if (!v40) {
    v40 = &stru_270C008E8;
  }
  v42 = (const char *)[(__CFString *)v40 UTF8String];
  size_t v43 = strlen(v42);
  int v87 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42, v43);

  memset(&v105, 0, sizeof(v105));
  v44 = [(FTGraphemeToPhonemeResponse *)self aot_token_prons];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v105, [v44 count]);

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v45 = [(FTGraphemeToPhonemeResponse *)self aot_token_prons];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v101 objects:v112 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v102 != v47) {
          objc_enumerationMutation(v45);
        }
        int v49 = [*(id *)(*((void *)&v101 + 1) + 8 * j) addObjectToBuffer:a3];
        int v50 = v49;
        std::vector<int>::pointer v51 = v105.__end_;
        if (v105.__end_ >= v105.__end_cap_.__value_)
        {
          std::vector<int>::pointer v53 = v105.__begin_;
          int64_t v54 = v105.__end_ - v105.__begin_;
          unint64_t v55 = v54 + 1;
          if ((unint64_t)(v54 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v56 = (char *)v105.__end_cap_.__value_ - (char *)v105.__begin_;
          if (((char *)v105.__end_cap_.__value_ - (char *)v105.__begin_) >> 1 > v55) {
            unint64_t v55 = v56 >> 1;
          }
          if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v57 = v55;
          }
          if (v57)
          {
            v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v105.__end_cap_, v57);
            std::vector<int>::pointer v53 = v105.__begin_;
            std::vector<int>::pointer v51 = v105.__end_;
          }
          else
          {
            v58 = 0;
          }
          v59 = (int *)&v58[4 * v54];
          int *v59 = v50;
          v52 = v59 + 1;
          while (v51 != v53)
          {
            int v60 = *--v51;
            *--v59 = v60;
          }
          v105.__begin_ = v59;
          v105.__end_ = v52;
          v105.__end_cap_.__value_ = (int *)&v58[4 * v57];
          if (v53) {
            operator delete(v53);
          }
        }
        else
        {
          *v105.__end_ = v49;
          v52 = v51 + 1;
        }
        v105.__end_ = v52;
      }
      uint64_t v46 = [v45 countByEnumeratingWithState:&v101 objects:v112 count:16];
    }
    while (v46);
  }

  if (v105.__end_ == v105.__begin_) {
    std::vector<int>::pointer v61 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>> const&)::t;
  }
  else {
    std::vector<int>::pointer v61 = v105.__begin_;
  }
  int v86 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v61, v105.__end_ - v105.__begin_);
  memset(&v100, 0, sizeof(v100));
  v62 = [(FTGraphemeToPhonemeResponse *)self jit_token_prons];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v100, [v62 count]);

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v63 = [(FTGraphemeToPhonemeResponse *)self jit_token_prons];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v96 objects:v111 count:16];
  if (v64)
  {
    uint64_t v65 = *(void *)v97;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v97 != v65) {
          objc_enumerationMutation(v63);
        }
        int v67 = [*(id *)(*((void *)&v96 + 1) + 8 * k) addObjectToBuffer:a3];
        int v68 = v67;
        std::vector<int>::pointer v69 = v100.__end_;
        if (v100.__end_ >= v100.__end_cap_.__value_)
        {
          std::vector<int>::pointer v71 = v100.__begin_;
          int64_t v72 = v100.__end_ - v100.__begin_;
          unint64_t v73 = v72 + 1;
          if ((unint64_t)(v72 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v74 = (char *)v100.__end_cap_.__value_ - (char *)v100.__begin_;
          if (((char *)v100.__end_cap_.__value_ - (char *)v100.__begin_) >> 1 > v73) {
            unint64_t v73 = v74 >> 1;
          }
          if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v75 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v75 = v73;
          }
          if (v75)
          {
            v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v100.__end_cap_, v75);
            std::vector<int>::pointer v71 = v100.__begin_;
            std::vector<int>::pointer v69 = v100.__end_;
          }
          else
          {
            v76 = 0;
          }
          v77 = (int *)&v76[4 * v72];
          int *v77 = v68;
          v70 = v77 + 1;
          while (v69 != v71)
          {
            int v78 = *--v69;
            *--v77 = v78;
          }
          v100.__begin_ = v77;
          v100.__end_ = v70;
          v100.__end_cap_.__value_ = (int *)&v76[4 * v75];
          if (v71) {
            operator delete(v71);
          }
        }
        else
        {
          *v100.__end_ = v67;
          v70 = v69 + 1;
        }
        v100.__end_ = v70;
      }
      uint64_t v64 = [v63 countByEnumeratingWithState:&v96 objects:v111 count:16];
    }
    while (v64);
  }

  if (v100.__end_ == v100.__begin_) {
    std::vector<int>::pointer v79 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>> const&)::t;
  }
  else {
    std::vector<int>::pointer v79 = v100.__begin_;
  }
  int v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v79, v100.__end_ - v100.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v81 = *((_DWORD *)a3 + 8);
  int v82 = *((_DWORD *)a3 + 12);
  int v83 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 6, v93, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v92);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v91);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 12, v90, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v89);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, v88);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, v87);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 20, v86);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 22, v80);
  v84.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v81 - (unsigned __int16)v82 + v83);
  if (v100.__begin_)
  {
    v100.__end_ = v100.__begin_;
    operator delete(v100.__begin_);
  }
  if (v105.__begin_)
  {
    v105.__end_ = v105.__begin_;
    operator delete(v105.__begin_);
  }
  if (v110.__begin_)
  {
    v110.__end_ = v110.__begin_;
    operator delete(v110.__begin_);
  }
  return v84;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTGraphemeToPhonemeResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTGraphemeToPhonemeResponse_flatbuffData__block_invoke(uint64_t a1)
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