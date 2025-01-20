@interface FTTranslationResponse
- (BOOL)final_message;
- (FTTranslationResponse)initWithFlatbuffData:(id)a3;
- (FTTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4;
- (FTTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4 verify:(BOOL)a5;
- (NSArray)alternative_descriptions;
- (NSArray)engine_output;
- (NSArray)n_best_translated_phrases;
- (NSString)engine_input;
- (NSString)request_id;
- (NSString)return_string;
- (NSString)sequence_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::TranslationResponse>)addObjectToBuffer:(void *)a3;
- (id)alternative_descriptions_objectAtIndex:(unint64_t)a3;
- (id)engine_output_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)n_best_translated_phrases_objectAtIndex:(unint64_t)a3;
- (int)return_code;
- (unint64_t)alternative_descriptions_count;
- (unint64_t)engine_output_count;
- (unint64_t)n_best_translated_phrases_count;
- (void)alternative_descriptions_enumerateObjectsUsingBlock:(id)a3;
- (void)engine_output_enumerateObjectsUsingBlock:(id)a3;
- (void)n_best_translated_phrases_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTranslationResponse

id __89__FTTranslationResponse_TranslationPhrase_TranslationDaemonAdditions__lt_formattedString__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 token];
  int v4 = objc_msgSend(v2, "add_space_after");

  if (v4) {
    v5 = @" ";
  }
  else {
    v5 = &stru_270C008E8;
  }
  v6 = [v3 stringByAppendingString:v5];

  return v6;
}

- (FTTranslationResponse)initWithFlatbuffData:(id)a3
{
  return [(FTTranslationResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTranslationResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4
{
  return [(FTTranslationResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationResponse;
  v10 = [(FTTranslationResponse *)&v26 init];
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
    a4 = (const TranslationResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TranslationResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
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

- (NSString)request_id
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

- (NSArray)n_best_translated_phrases
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__FTTranslationResponse_n_best_translated_phrases__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationResponse *)self n_best_translated_phrases_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"n_best_translated_phrases"];
  }
  return (NSArray *)v3;
}

uint64_t __50__FTTranslationResponse_n_best_translated_phrases__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)n_best_translated_phrases_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
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
      id v7 = [[FTTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)n_best_translated_phrases_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
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

- (void)n_best_translated_phrases_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
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
            uint64_t v17 = [[FTTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSString)engine_input
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

- (NSArray)engine_output
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"engine_output"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__FTTranslationResponse_engine_output__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationResponse *)self engine_output_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"engine_output"];
  }
  return (NSArray *)v3;
}

uint64_t __38__FTTranslationResponse_engine_output__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)engine_output_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"engine_output"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0x11u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[16].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)engine_output_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"engine_output"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x11u && (uint64_t v8 = *(unsigned __int16 *)v7[16].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)engine_output_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"engine_output"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x11u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[16].var0;
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
            uint64_t v17 = [[FTTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSString)sequence_id
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

- (BOOL)final_message
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)alternative_descriptions
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__FTTranslationResponse_alternative_descriptions__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationResponse *)self alternative_descriptions_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"alternative_descriptions"];
  }
  return (NSArray *)v3;
}

uint64_t __49__FTTranslationResponse_alternative_descriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)alternative_descriptions_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
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
      id v7 = [[FTMTAlternativeDescription alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)alternative_descriptions_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
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

- (void)alternative_descriptions_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTMTAlternativeDescription *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
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
            uint64_t v17 = [[FTMTAlternativeDescription alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::TranslationResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTTranslationResponse *)self speech_id];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v9 = [(FTTranslationResponse *)self request_id];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v92 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  int v91 = [(FTTranslationResponse *)self return_code];
  uint64_t v13 = [(FTTranslationResponse *)self return_string];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_270C008E8;
  }
  uint64_t v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int v90 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  memset(&v110, 0, sizeof(v110));
  uint64_t v17 = [(FTTranslationResponse *)self n_best_translated_phrases];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v110, [v17 count]);

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  int v18 = [(FTTranslationResponse *)self n_best_translated_phrases];
  v94 = self;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v106 objects:v113 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v107 != v20) {
          objc_enumerationMutation(v18);
        }
        int v22 = [*(id *)(*((void *)&v106 + 1) + 8 * i) addObjectToBuffer:a3];
        int v23 = v22;
        std::vector<int>::pointer end = v110.__end_;
        if (v110.__end_ >= v110.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v110.__begin_;
          int64_t v27 = v110.__end_ - v110.__begin_;
          unint64_t v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v29 = (char *)v110.__end_cap_.__value_ - (char *)v110.__begin_;
          if (((char *)v110.__end_cap_.__value_ - (char *)v110.__begin_) >> 1 > v28) {
            unint64_t v28 = v29 >> 1;
          }
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v28;
          }
          if (v30)
          {
            v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v110.__end_cap_, v30);
            std::vector<int>::pointer begin = v110.__begin_;
            std::vector<int>::pointer end = v110.__end_;
          }
          else
          {
            v31 = 0;
          }
          v32 = (int *)&v31[4 * v27];
          int *v32 = v23;
          char v25 = v32 + 1;
          while (end != begin)
          {
            int v33 = *--end;
            *--v32 = v33;
          }
          v110.__begin_ = v32;
          v110.__end_ = v25;
          v110.__end_cap_.__value_ = (int *)&v31[4 * v30];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v110.__end_ = v22;
          char v25 = end + 1;
        }
        v110.__end_ = v25;
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v106 objects:v113 count:16];
    }
    while (v19);
  }

  if (v110.__end_ == v110.__begin_) {
    std::vector<int>::pointer v34 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>> const&)::t;
  }
  else {
    std::vector<int>::pointer v34 = v110.__begin_;
  }
  int v89 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v34, v110.__end_ - v110.__begin_);
  v35 = [(FTTranslationResponse *)v94 engine_input];
  v36 = v35;
  if (!v35) {
    v35 = &stru_270C008E8;
  }
  v37 = (const char *)[(__CFString *)v35 UTF8String];
  size_t v38 = strlen(v37);
  int v88 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v37, v38);

  memset(&v105, 0, sizeof(v105));
  v39 = [(FTTranslationResponse *)v94 engine_output];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v105, [v39 count]);

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v40 = [(FTTranslationResponse *)v94 engine_output];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v101 objects:v112 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v102 != v42) {
          objc_enumerationMutation(v40);
        }
        int v44 = [*(id *)(*((void *)&v101 + 1) + 8 * j) addObjectToBuffer:a3];
        int v45 = v44;
        std::vector<int>::pointer v46 = v105.__end_;
        if (v105.__end_ >= v105.__end_cap_.__value_)
        {
          std::vector<int>::pointer v48 = v105.__begin_;
          int64_t v49 = v105.__end_ - v105.__begin_;
          unint64_t v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v51 = (char *)v105.__end_cap_.__value_ - (char *)v105.__begin_;
          if (((char *)v105.__end_cap_.__value_ - (char *)v105.__begin_) >> 1 > v50) {
            unint64_t v50 = v51 >> 1;
          }
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v52 = v50;
          }
          if (v52)
          {
            v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v105.__end_cap_, v52);
            std::vector<int>::pointer v48 = v105.__begin_;
            std::vector<int>::pointer v46 = v105.__end_;
          }
          else
          {
            v53 = 0;
          }
          v54 = (int *)&v53[4 * v49];
          int *v54 = v45;
          v47 = v54 + 1;
          while (v46 != v48)
          {
            int v55 = *--v46;
            *--v54 = v55;
          }
          v105.__begin_ = v54;
          v105.__end_ = v47;
          v105.__end_cap_.__value_ = (int *)&v53[4 * v52];
          if (v48) {
            operator delete(v48);
          }
        }
        else
        {
          *v105.__end_ = v44;
          v47 = v46 + 1;
        }
        v105.__end_ = v47;
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v101 objects:v112 count:16];
    }
    while (v41);
  }

  if (v105.__end_ == v105.__begin_) {
    std::vector<int>::pointer v56 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>> const&)::t;
  }
  else {
    std::vector<int>::pointer v56 = v105.__begin_;
  }
  int v57 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v56, v105.__end_ - v105.__begin_);
  v58 = [(FTTranslationResponse *)v94 sequence_id];
  v59 = v58;
  if (!v58) {
    v58 = &stru_270C008E8;
  }
  v60 = (const char *)[(__CFString *)v58 UTF8String];
  size_t v61 = strlen(v60);
  int v87 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v60, v61);

  int v86 = [(FTTranslationResponse *)v94 final_message];
  memset(&v100, 0, sizeof(v100));
  v62 = [(FTTranslationResponse *)v94 alternative_descriptions];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v100, [v62 count]);

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v63 = [(FTTranslationResponse *)v94 alternative_descriptions];
  int v95 = v57;
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
    std::vector<int>::pointer v79 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>> const&)::t;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v92);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, v91, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v90);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v89);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v88);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, v95);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, v87);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 20, v86, 0);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTranslationResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FTTranslationResponse_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__54__FTTranslationResponse_TranslationToken_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

uint64_t __60__FTTranslationResponse_TranslationPhrase_translated_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __48__FTTranslationResponse_TranslationPhrase_spans__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

apple::aiml::flatbuffers2::DetachedBuffer *__55__FTTranslationResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
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