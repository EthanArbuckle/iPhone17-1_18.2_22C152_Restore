@interface FTTextToSpeechFeature
- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3;
- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4;
- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5;
- (NSArray)neural_phoneme_sequence;
- (NSArray)normalized_text;
- (NSArray)phoneme_sequence;
- (NSArray)prompts;
- (NSArray)replacement;
- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)neural_phoneme_sequence_objectAtIndex:(unint64_t)a3;
- (id)normalized_text_objectAtIndex:(unint64_t)a3;
- (id)phoneme_sequence_objectAtIndex:(unint64_t)a3;
- (id)prompts_objectAtIndex:(unint64_t)a3;
- (id)replacement_objectAtIndex:(unint64_t)a3;
- (unint64_t)neural_phoneme_sequence_count;
- (unint64_t)normalized_text_count;
- (unint64_t)phoneme_sequence_count;
- (unint64_t)prompts_count;
- (unint64_t)replacement_count;
- (void)neural_phoneme_sequence_enumerateObjectsUsingBlock:(id)a3;
- (void)normalized_text_enumerateObjectsUsingBlock:(id)a3;
- (void)phoneme_sequence_enumerateObjectsUsingBlock:(id)a3;
- (void)prompts_enumerateObjectsUsingBlock:(id)a3;
- (void)replacement_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTextToSpeechFeature

- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechFeature *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechFeature *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4
{
  return [(FTTextToSpeechFeature *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechFeature;
  v10 = [(FTTextToSpeechFeature *)&v26 init];
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
    a4 = (const TextToSpeechFeature *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechFeature *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TextToSpeechFeature::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSArray)normalized_text
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__FTTextToSpeechFeature_normalized_text__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTextToSpeechFeature *)self normalized_text_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"normalized_text"];
  }
  return (NSArray *)v3;
}

uint64_t __40__FTTextToSpeechFeature_normalized_text__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)normalized_text_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
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
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTTSNormalizedText alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)normalized_text_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)normalized_text_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTTSNormalizedText *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
  v6 = v5;
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
            uint64_t v17 = [[FTTTSNormalizedText alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)phoneme_sequence
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__FTTextToSpeechFeature_phoneme_sequence__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTextToSpeechFeature *)self phoneme_sequence_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"phoneme_sequence"];
  }
  return (NSArray *)v3;
}

uint64_t __41__FTTextToSpeechFeature_phoneme_sequence__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)phoneme_sequence_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
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
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTTSPhonemeSequence alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)phoneme_sequence_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)phoneme_sequence_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTTSPhonemeSequence *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[6].var0;
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
            uint64_t v17 = [[FTTTSPhonemeSequence alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)prompts
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__FTTextToSpeechFeature_prompts__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTextToSpeechFeature *)self prompts_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prompts"];
  }
  return (NSArray *)v3;
}

uint64_t __32__FTTextToSpeechFeature_prompts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)prompts_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
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
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTTSPrompts alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)prompts_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 9u && (uint64_t v8 = *(unsigned __int16 *)v7[8].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)prompts_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTTSPrompts *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[8].var0;
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
            uint64_t v17 = [[FTTTSPrompts alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)replacement
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__FTTextToSpeechFeature_replacement__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTextToSpeechFeature *)self replacement_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"replacement"];
  }
  return (NSArray *)v3;
}

uint64_t __36__FTTextToSpeechFeature_replacement__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)replacement_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xBu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[10].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTTSReplacement alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)replacement_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (uint64_t v8 = *(unsigned __int16 *)v7[10].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)replacement_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTTSReplacement *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
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
            uint64_t v17 = [[FTTTSReplacement alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)neural_phoneme_sequence
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__FTTextToSpeechFeature_neural_phoneme_sequence__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTextToSpeechFeature *)self neural_phoneme_sequence_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"neural_phoneme_sequence"];
  }
  return (NSArray *)v3;
}

uint64_t __48__FTTextToSpeechFeature_neural_phoneme_sequence__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)neural_phoneme_sequence_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xDu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[12].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTTSNeuralPhonemeSequence alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)neural_phoneme_sequence_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
  v4 = v3;
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

- (void)neural_phoneme_sequence_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTTSNeuralPhonemeSequence *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
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
            uint64_t v17 = [[FTTTSNeuralPhonemeSequence alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  memset(&v131, 0, sizeof(v131));
  unint64_t v5 = [(FTTextToSpeechFeature *)self normalized_text];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v131, [v5 count]);

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  v6 = [(FTTextToSpeechFeature *)self normalized_text];
  v105 = self;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v127 objects:v136 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v128;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v128 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = [*(id *)(*((void *)&v127 + 1) + 8 * i) addObjectToBuffer:a3];
        int v11 = v10;
        std::vector<int>::pointer end = v131.__end_;
        if (v131.__end_ >= v131.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v131.__begin_;
          int64_t v15 = v131.__end_ - v131.__begin_;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v17 = (char *)v131.__end_cap_.__value_ - (char *)v131.__begin_;
          if (((char *)v131.__end_cap_.__value_ - (char *)v131.__begin_) >> 1 > v16) {
            unint64_t v16 = v17 >> 1;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v131.__end_cap_, v18);
            std::vector<int>::pointer begin = v131.__begin_;
            std::vector<int>::pointer end = v131.__end_;
          }
          else
          {
            uint64_t v19 = 0;
          }
          unsigned __int8 v20 = (int *)&v19[4 * v15];
          int *v20 = v11;
          uint64_t v13 = v20 + 1;
          while (end != begin)
          {
            int v21 = *--end;
            *--unsigned __int8 v20 = v21;
          }
          v131.__begin_ = v20;
          v131.__end_ = v13;
          v131.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v131.__end_ = v10;
          uint64_t v13 = end + 1;
        }
        v131.__end_ = v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v127 objects:v136 count:16];
    }
    while (v7);
  }

  if (v131.__end_ == v131.__begin_) {
    std::vector<int>::pointer v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>> const&)::t;
  }
  else {
    std::vector<int>::pointer v22 = v131.__begin_;
  }
  int v104 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v131.__end_ - v131.__begin_);
  memset(&v126, 0, sizeof(v126));
  long long v23 = [(FTTextToSpeechFeature *)v105 phoneme_sequence];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v126, [v23 count]);

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  uint64_t v24 = [(FTTextToSpeechFeature *)v105 phoneme_sequence];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v122 objects:v135 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v123;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v123 != v26) {
          objc_enumerationMutation(v24);
        }
        int v28 = [*(id *)(*((void *)&v122 + 1) + 8 * j) addObjectToBuffer:a3];
        int v29 = v28;
        std::vector<int>::pointer v30 = v126.__end_;
        if (v126.__end_ >= v126.__end_cap_.__value_)
        {
          std::vector<int>::pointer v32 = v126.__begin_;
          int64_t v33 = v126.__end_ - v126.__begin_;
          unint64_t v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v35 = (char *)v126.__end_cap_.__value_ - (char *)v126.__begin_;
          if (((char *)v126.__end_cap_.__value_ - (char *)v126.__begin_) >> 1 > v34) {
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
            v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v126.__end_cap_, v36);
            std::vector<int>::pointer v32 = v126.__begin_;
            std::vector<int>::pointer v30 = v126.__end_;
          }
          else
          {
            v37 = 0;
          }
          v38 = (int *)&v37[4 * v33];
          int *v38 = v29;
          v31 = v38 + 1;
          while (v30 != v32)
          {
            int v39 = *--v30;
            *--v38 = v39;
          }
          v126.__begin_ = v38;
          v126.__end_ = v31;
          v126.__end_cap_.__value_ = (int *)&v37[4 * v36];
          if (v32) {
            operator delete(v32);
          }
        }
        else
        {
          *v126.__end_ = v28;
          v31 = v30 + 1;
        }
        v126.__end_ = v31;
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v122 objects:v135 count:16];
    }
    while (v25);
  }

  if (v126.__end_ == v126.__begin_) {
    std::vector<int>::pointer v40 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>> const&)::t;
  }
  else {
    std::vector<int>::pointer v40 = v126.__begin_;
  }
  int v103 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v40, v126.__end_ - v126.__begin_);
  memset(&v121, 0, sizeof(v121));
  v41 = [(FTTextToSpeechFeature *)v105 prompts];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v121, [v41 count]);

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v42 = [(FTTextToSpeechFeature *)v105 prompts];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v117 objects:v134 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v118;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v118 != v44) {
          objc_enumerationMutation(v42);
        }
        int v46 = [*(id *)(*((void *)&v117 + 1) + 8 * k) addObjectToBuffer:a3];
        int v47 = v46;
        std::vector<int>::pointer v48 = v121.__end_;
        if (v121.__end_ >= v121.__end_cap_.__value_)
        {
          std::vector<int>::pointer v50 = v121.__begin_;
          int64_t v51 = v121.__end_ - v121.__begin_;
          unint64_t v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v53 = (char *)v121.__end_cap_.__value_ - (char *)v121.__begin_;
          if (((char *)v121.__end_cap_.__value_ - (char *)v121.__begin_) >> 1 > v52) {
            unint64_t v52 = v53 >> 1;
          }
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v54 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v54 = v52;
          }
          if (v54)
          {
            v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v121.__end_cap_, v54);
            std::vector<int>::pointer v50 = v121.__begin_;
            std::vector<int>::pointer v48 = v121.__end_;
          }
          else
          {
            v55 = 0;
          }
          v56 = (int *)&v55[4 * v51];
          int *v56 = v47;
          v49 = v56 + 1;
          while (v48 != v50)
          {
            int v57 = *--v48;
            *--v56 = v57;
          }
          v121.__begin_ = v56;
          v121.__end_ = v49;
          v121.__end_cap_.__value_ = (int *)&v55[4 * v54];
          if (v50) {
            operator delete(v50);
          }
        }
        else
        {
          *v121.__end_ = v46;
          v49 = v48 + 1;
        }
        v121.__end_ = v49;
      }
      uint64_t v43 = [v42 countByEnumeratingWithState:&v117 objects:v134 count:16];
    }
    while (v43);
  }

  if (v121.__end_ == v121.__begin_) {
    std::vector<int>::pointer v58 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>> const&)::t;
  }
  else {
    std::vector<int>::pointer v58 = v121.__begin_;
  }
  int v102 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v58, v121.__end_ - v121.__begin_);
  memset(&v116, 0, sizeof(v116));
  v59 = [(FTTextToSpeechFeature *)v105 replacement];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v116, [v59 count]);

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v60 = [(FTTextToSpeechFeature *)v105 replacement];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v112 objects:v133 count:16];
  if (v61)
  {
    uint64_t v62 = *(void *)v113;
    do
    {
      for (uint64_t m = 0; m != v61; ++m)
      {
        if (*(void *)v113 != v62) {
          objc_enumerationMutation(v60);
        }
        int v64 = [*(id *)(*((void *)&v112 + 1) + 8 * m) addObjectToBuffer:a3];
        int v65 = v64;
        std::vector<int>::pointer v66 = v116.__end_;
        if (v116.__end_ >= v116.__end_cap_.__value_)
        {
          std::vector<int>::pointer v68 = v116.__begin_;
          int64_t v69 = v116.__end_ - v116.__begin_;
          unint64_t v70 = v69 + 1;
          if ((unint64_t)(v69 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v71 = (char *)v116.__end_cap_.__value_ - (char *)v116.__begin_;
          if (((char *)v116.__end_cap_.__value_ - (char *)v116.__begin_) >> 1 > v70) {
            unint64_t v70 = v71 >> 1;
          }
          if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v72 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v72 = v70;
          }
          if (v72)
          {
            v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v116.__end_cap_, v72);
            std::vector<int>::pointer v68 = v116.__begin_;
            std::vector<int>::pointer v66 = v116.__end_;
          }
          else
          {
            v73 = 0;
          }
          v74 = (int *)&v73[4 * v69];
          int *v74 = v65;
          v67 = v74 + 1;
          while (v66 != v68)
          {
            int v75 = *--v66;
            *--v74 = v75;
          }
          v116.__begin_ = v74;
          v116.__end_ = v67;
          v116.__end_cap_.__value_ = (int *)&v73[4 * v72];
          if (v68) {
            operator delete(v68);
          }
        }
        else
        {
          *v116.__end_ = v64;
          v67 = v66 + 1;
        }
        v116.__end_ = v67;
      }
      uint64_t v61 = [v60 countByEnumeratingWithState:&v112 objects:v133 count:16];
    }
    while (v61);
  }

  if (v116.__end_ == v116.__begin_) {
    std::vector<int>::pointer v76 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>> const&)::t;
  }
  else {
    std::vector<int>::pointer v76 = v116.__begin_;
  }
  int v77 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v76, v116.__end_ - v116.__begin_);
  memset(&v111, 0, sizeof(v111));
  v78 = [(FTTextToSpeechFeature *)v105 neural_phoneme_sequence];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v111, [v78 count]);

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v79 = [(FTTextToSpeechFeature *)v105 neural_phoneme_sequence];
  int v106 = v77;
  uint64_t v80 = [v79 countByEnumeratingWithState:&v107 objects:v132 count:16];
  if (v80)
  {
    uint64_t v81 = *(void *)v108;
    do
    {
      for (uint64_t n = 0; n != v80; ++n)
      {
        if (*(void *)v108 != v81) {
          objc_enumerationMutation(v79);
        }
        int v83 = [*(id *)(*((void *)&v107 + 1) + 8 * n) addObjectToBuffer:a3];
        int v84 = v83;
        std::vector<int>::pointer v85 = v111.__end_;
        if (v111.__end_ >= v111.__end_cap_.__value_)
        {
          std::vector<int>::pointer v87 = v111.__begin_;
          int64_t v88 = v111.__end_ - v111.__begin_;
          unint64_t v89 = v88 + 1;
          if ((unint64_t)(v88 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v90 = (char *)v111.__end_cap_.__value_ - (char *)v111.__begin_;
          if (((char *)v111.__end_cap_.__value_ - (char *)v111.__begin_) >> 1 > v89) {
            unint64_t v89 = v90 >> 1;
          }
          if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v91 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v91 = v89;
          }
          if (v91)
          {
            v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v111.__end_cap_, v91);
            std::vector<int>::pointer v87 = v111.__begin_;
            std::vector<int>::pointer v85 = v111.__end_;
          }
          else
          {
            v92 = 0;
          }
          v93 = (int *)&v92[4 * v88];
          int *v93 = v84;
          v86 = v93 + 1;
          while (v85 != v87)
          {
            int v94 = *--v85;
            *--v93 = v94;
          }
          v111.__begin_ = v93;
          v111.__end_ = v86;
          v111.__end_cap_.__value_ = (int *)&v92[4 * v91];
          if (v87) {
            operator delete(v87);
          }
        }
        else
        {
          *v111.__end_ = v83;
          v86 = v85 + 1;
        }
        v111.__end_ = v86;
      }
      uint64_t v80 = [v79 countByEnumeratingWithState:&v107 objects:v132 count:16];
    }
    while (v80);
  }

  if (v111.__end_ == v111.__begin_) {
    std::vector<int>::pointer v95 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>> const&)::t;
  }
  else {
    std::vector<int>::pointer v95 = v111.__begin_;
  }
  int v96 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v95, v111.__end_ - v111.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v97 = *((_DWORD *)a3 + 8);
  int v98 = *((_DWORD *)a3 + 12);
  int v99 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v104);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v103);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v102);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v106);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v96);
  v100.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v97 - (unsigned __int16)v98 + v99);
  if (v111.__begin_)
  {
    v111.__end_ = v111.__begin_;
    operator delete(v111.__begin_);
  }
  if (v116.__begin_)
  {
    v116.__end_ = v116.__begin_;
    operator delete(v116.__begin_);
  }
  if (v121.__begin_)
  {
    v121.__end_ = v121.__begin_;
    operator delete(v121.__begin_);
  }
  if (v126.__begin_)
  {
    v126.__end_ = v126.__begin_;
    operator delete(v126.__begin_);
  }
  if (v131.__begin_)
  {
    v131.__end_ = v131.__begin_;
    operator delete(v131.__begin_);
  }
  return v100;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTextToSpeechFeature *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FTTextToSpeechFeature_flatbuffData__block_invoke(uint64_t a1)
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