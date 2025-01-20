@interface FTSiriTranslationInfo
- (FTRecognitionSausage)raw_sausage;
- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3;
- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4;
- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4 verify:(BOOL)a5;
- (NSArray)itn_alignments;
- (NSArray)post_itn_tokens;
- (NSArray)raw_nbest_choices;
- (NSArray)translation_phrase;
- (NSString)post_itn_recognition;
- (Offset<siri::speech::schema_fb::SiriTranslationInfo>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)itn_alignments_objectAtIndex:(unint64_t)a3;
- (id)post_itn_tokens_objectAtIndex:(unint64_t)a3;
- (id)raw_nbest_choices_objectAtIndex:(unint64_t)a3;
- (id)translation_phrase_objectAtIndex:(unint64_t)a3;
- (unint64_t)itn_alignments_count;
- (unint64_t)post_itn_tokens_count;
- (unint64_t)raw_nbest_choices_count;
- (unint64_t)translation_phrase_count;
- (void)itn_alignments_enumerateObjectsUsingBlock:(id)a3;
- (void)post_itn_tokens_enumerateObjectsUsingBlock:(id)a3;
- (void)raw_nbest_choices_enumerateObjectsUsingBlock:(id)a3;
- (void)translation_phrase_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTSiriTranslationInfo

- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3
{
  return [(FTSiriTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTSiriTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4
{
  return [(FTSiriTranslationInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSiriTranslationInfo;
  v10 = [(FTSiriTranslationInfo *)&v26 init];
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
    a4 = (const SiriTranslationInfo *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SiriTranslationInfo *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::SiriTranslationInfo::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (FTRecognitionSausage)raw_sausage
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_sausage"];
  if (!v3)
  {
    v4 = [FTRecognitionSausage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"raw_sausage"];
  }
  return v3;
}

- (NSArray)raw_nbest_choices
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_nbest_choices"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__FTSiriTranslationInfo_raw_nbest_choices__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTSiriTranslationInfo *)self raw_nbest_choices_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"raw_nbest_choices"];
  }
  return (NSArray *)v3;
}

uint64_t __42__FTSiriTranslationInfo_raw_nbest_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)raw_nbest_choices_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_nbest_choices"];
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
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTRecognitionChoice alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)raw_nbest_choices_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_nbest_choices"];
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

- (void)raw_nbest_choices_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_nbest_choices"];
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
            uint64_t v17 = [[FTRecognitionChoice alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)post_itn_tokens
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_tokens"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__FTSiriTranslationInfo_post_itn_tokens__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTSiriTranslationInfo *)self post_itn_tokens_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"post_itn_tokens"];
  }
  return (NSArray *)v3;
}

uint64_t __40__FTSiriTranslationInfo_post_itn_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)post_itn_tokens_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_tokens"];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = (void *)v7;
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
      uint64_t v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
      uint64_t v7 = [[NSString alloc] initWithBytes:v13 + 1 length:*v13 encoding:4];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)post_itn_tokens_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_tokens"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 9u && (uint64_t v8 = *(unsigned __int16 *)v7[8].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)post_itn_tokens_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_tokens"];
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
            uint64_t v16 = (void *)[[NSString alloc] initWithBytes:&v10[v14 + *var0] length:*(unsigned int *)((char *)var0 + *var0) encoding:4];
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

- (NSString)post_itn_recognition
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)itn_alignments
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"itn_alignments"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__FTSiriTranslationInfo_itn_alignments__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTSiriTranslationInfo *)self itn_alignments_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"itn_alignments"];
  }
  return (NSArray *)v3;
}

uint64_t __39__FTSiriTranslationInfo_itn_alignments__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)itn_alignments_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"itn_alignments"];
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
      id v7 = [[FTItnAlignment alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)itn_alignments_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"itn_alignments"];
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

- (void)itn_alignments_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTItnAlignment *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"itn_alignments"];
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
            int v17 = [[FTItnAlignment alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)translation_phrase
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__FTSiriTranslationInfo_translation_phrase__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTSiriTranslationInfo *)self translation_phrase_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_phrase"];
  }
  return (NSArray *)v3;
}

uint64_t __43__FTSiriTranslationInfo_translation_phrase__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)translation_phrase_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xFu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[14].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTSpan alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)translation_phrase_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
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

- (void)translation_phrase_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTSpan *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
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
            int v17 = [[FTSpan alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::SiriTranslationInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(FTSiriTranslationInfo *)self raw_sausage];
  int v93 = [v4 addObjectToBuffer:a3];

  memset(&v115, 0, sizeof(v115));
  unint64_t v5 = [(FTSiriTranslationInfo *)self raw_nbest_choices];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v115, [v5 count]);

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v6 = [(FTSiriTranslationInfo *)self raw_nbest_choices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v111 objects:v119 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v112 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = [*(id *)(*((void *)&v111 + 1) + 8 * i) addObjectToBuffer:a3];
        int v11 = v10;
        std::vector<int>::pointer end = v115.__end_;
        if (v115.__end_ >= v115.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v115.__begin_;
          int64_t v15 = v115.__end_ - v115.__begin_;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v17 = (char *)v115.__end_cap_.__value_ - (char *)v115.__begin_;
          if (((char *)v115.__end_cap_.__value_ - (char *)v115.__begin_) >> 1 > v16) {
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
            uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v115.__end_cap_, v18);
            std::vector<int>::pointer begin = v115.__begin_;
            std::vector<int>::pointer end = v115.__end_;
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
          v115.__begin_ = v20;
          v115.__end_ = v13;
          v115.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v115.__end_ = v10;
          uint64_t v13 = end + 1;
        }
        v115.__end_ = v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v111 objects:v119 count:16];
    }
    while (v7);
  }

  if (v115.__end_ == v115.__begin_) {
    std::vector<int>::pointer v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  }
  else {
    std::vector<int>::pointer v22 = v115.__begin_;
  }
  int v92 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v115.__end_ - v115.__begin_);
  memset(&v110, 0, sizeof(v110));
  long long v23 = [(FTSiriTranslationInfo *)self post_itn_tokens];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v110, [v23 count]);

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v24 = [(FTSiriTranslationInfo *)self post_itn_tokens];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v106 objects:v118 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v107;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v107 != v26) {
          objc_enumerationMutation(v24);
        }
        v28 = (const char *)[*(id *)(*((void *)&v106 + 1) + 8 * j) UTF8String];
        size_t v29 = strlen(v28);
        int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v28, v29);
        int v31 = String;
        std::vector<int>::pointer v32 = v110.__end_;
        if (v110.__end_ >= v110.__end_cap_.__value_)
        {
          std::vector<int>::pointer v34 = v110.__begin_;
          int64_t v35 = v110.__end_ - v110.__begin_;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v37 = (char *)v110.__end_cap_.__value_ - (char *)v110.__begin_;
          if (((char *)v110.__end_cap_.__value_ - (char *)v110.__begin_) >> 1 > v36) {
            unint64_t v36 = v37 >> 1;
          }
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v36;
          }
          if (v38)
          {
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v110.__end_cap_, v38);
            std::vector<int>::pointer v34 = v110.__begin_;
            std::vector<int>::pointer v32 = v110.__end_;
          }
          else
          {
            v39 = 0;
          }
          v40 = (int *)&v39[4 * v35];
          int *v40 = v31;
          v33 = v40 + 1;
          while (v32 != v34)
          {
            int v41 = *--v32;
            *--v40 = v41;
          }
          v110.__begin_ = v40;
          v110.__end_ = v33;
          v110.__end_cap_.__value_ = (int *)&v39[4 * v38];
          if (v34) {
            operator delete(v34);
          }
        }
        else
        {
          *v110.__end_ = String;
          v33 = v32 + 1;
        }
        v110.__end_ = v33;
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v106 objects:v118 count:16];
    }
    while (v25);
  }

  if (v110.__end_ == v110.__begin_) {
    std::vector<int>::pointer v42 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v42 = v110.__begin_;
  }
  int v91 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v42, v110.__end_ - v110.__begin_);
  v43 = [(FTSiriTranslationInfo *)self post_itn_recognition];
  v44 = v43;
  if (!v43) {
    v43 = &stru_270C008E8;
  }
  v45 = (const char *)[(__CFString *)v43 UTF8String];
  size_t v46 = strlen(v45);
  int v90 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v45, v46);

  memset(&v105, 0, sizeof(v105));
  v47 = [(FTSiriTranslationInfo *)self itn_alignments];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v105, [v47 count]);

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v48 = [(FTSiriTranslationInfo *)self itn_alignments];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v101 objects:v117 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v102;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v102 != v50) {
          objc_enumerationMutation(v48);
        }
        int v52 = [*(id *)(*((void *)&v101 + 1) + 8 * k) addObjectToBuffer:a3];
        int v53 = v52;
        std::vector<int>::pointer v54 = v105.__end_;
        if (v105.__end_ >= v105.__end_cap_.__value_)
        {
          std::vector<int>::pointer v56 = v105.__begin_;
          int64_t v57 = v105.__end_ - v105.__begin_;
          unint64_t v58 = v57 + 1;
          if ((unint64_t)(v57 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v59 = (char *)v105.__end_cap_.__value_ - (char *)v105.__begin_;
          if (((char *)v105.__end_cap_.__value_ - (char *)v105.__begin_) >> 1 > v58) {
            unint64_t v58 = v59 >> 1;
          }
          if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v60 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v60 = v58;
          }
          if (v60)
          {
            v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v105.__end_cap_, v60);
            std::vector<int>::pointer v56 = v105.__begin_;
            std::vector<int>::pointer v54 = v105.__end_;
          }
          else
          {
            v61 = 0;
          }
          v62 = (int *)&v61[4 * v57];
          int *v62 = v53;
          v55 = v62 + 1;
          while (v54 != v56)
          {
            int v63 = *--v54;
            *--v62 = v63;
          }
          v105.__begin_ = v62;
          v105.__end_ = v55;
          v105.__end_cap_.__value_ = (int *)&v61[4 * v60];
          if (v56) {
            operator delete(v56);
          }
        }
        else
        {
          *v105.__end_ = v52;
          v55 = v54 + 1;
        }
        v105.__end_ = v55;
      }
      uint64_t v49 = [v48 countByEnumeratingWithState:&v101 objects:v117 count:16];
    }
    while (v49);
  }

  if (v105.__end_ == v105.__begin_) {
    std::vector<int>::pointer v64 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>> const&)::t;
  }
  else {
    std::vector<int>::pointer v64 = v105.__begin_;
  }
  int v65 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v64, v105.__end_ - v105.__begin_);
  memset(&v100, 0, sizeof(v100));
  v66 = [(FTSiriTranslationInfo *)self translation_phrase];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v100, [v66 count]);

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v67 = [(FTSiriTranslationInfo *)self translation_phrase];
  int v95 = v65;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v96 objects:v116 count:16];
  if (v68)
  {
    uint64_t v69 = *(void *)v97;
    do
    {
      for (uint64_t m = 0; m != v68; ++m)
      {
        if (*(void *)v97 != v69) {
          objc_enumerationMutation(v67);
        }
        int v71 = [*(id *)(*((void *)&v96 + 1) + 8 * m) addObjectToBuffer:a3];
        int v72 = v71;
        std::vector<int>::pointer v73 = v100.__end_;
        if (v100.__end_ >= v100.__end_cap_.__value_)
        {
          std::vector<int>::pointer v75 = v100.__begin_;
          int64_t v76 = v100.__end_ - v100.__begin_;
          unint64_t v77 = v76 + 1;
          if ((unint64_t)(v76 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v78 = (char *)v100.__end_cap_.__value_ - (char *)v100.__begin_;
          if (((char *)v100.__end_cap_.__value_ - (char *)v100.__begin_) >> 1 > v77) {
            unint64_t v77 = v78 >> 1;
          }
          if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v79 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v79 = v77;
          }
          if (v79)
          {
            v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v100.__end_cap_, v79);
            std::vector<int>::pointer v75 = v100.__begin_;
            std::vector<int>::pointer v73 = v100.__end_;
          }
          else
          {
            v80 = 0;
          }
          v81 = (int *)&v80[4 * v76];
          int *v81 = v72;
          v74 = v81 + 1;
          while (v73 != v75)
          {
            int v82 = *--v73;
            *--v81 = v82;
          }
          v100.__begin_ = v81;
          v100.__end_ = v74;
          v100.__end_cap_.__value_ = (int *)&v80[4 * v79];
          if (v75) {
            operator delete(v75);
          }
        }
        else
        {
          *v100.__end_ = v71;
          v74 = v73 + 1;
        }
        v100.__end_ = v74;
      }
      uint64_t v68 = [v67 countByEnumeratingWithState:&v96 objects:v116 count:16];
    }
    while (v68);
  }

  if (v100.__end_ == v100.__begin_) {
    std::vector<int>::pointer v83 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Span>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Span>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Span>> const&)::t;
  }
  else {
    std::vector<int>::pointer v83 = v100.__begin_;
  }
  int v84 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v83, v100.__end_ - v100.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v85 = *((_DWORD *)a3 + 8);
  int v86 = *((_DWORD *)a3 + 12);
  int v87 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v93);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v92);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v91);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v90);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v95);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v84);
  v88.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v85 - (unsigned __int16)v86 + v87);
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
  if (v115.__begin_)
  {
    v115.__end_ = v115.__begin_;
    operator delete(v115.__begin_);
  }
  return v88;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTSiriTranslationInfo *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FTSiriTranslationInfo_flatbuffData__block_invoke(uint64_t a1)
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