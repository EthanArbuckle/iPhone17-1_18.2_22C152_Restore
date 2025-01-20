@interface FTRecognitionResult
- (FTRecognitionResult)initWithFlatbuffData:(id)a3;
- (FTRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4;
- (FTRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4 verify:(BOOL)a5;
- (FTRecognitionSausage)post_itn;
- (FTRecognitionSausage)pre_itn;
- (NSArray)choice_alignments;
- (NSArray)post_itn_nbest_choices;
- (NSArray)pre_itn_nbest_choices;
- (NSArray)pre_itn_token_to_post_itn_char_alignment;
- (Offset<siri::speech::schema_fb::RecognitionResult>)addObjectToBuffer:(void *)a3;
- (id)choice_alignments_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)post_itn_nbest_choices_objectAtIndex:(unint64_t)a3;
- (id)pre_itn_nbest_choices_objectAtIndex:(unint64_t)a3;
- (id)pre_itn_token_to_post_itn_char_alignment_objectAtIndex:(unint64_t)a3;
- (unint64_t)choice_alignments_count;
- (unint64_t)post_itn_nbest_choices_count;
- (unint64_t)pre_itn_nbest_choices_count;
- (unint64_t)pre_itn_token_to_post_itn_char_alignment_count;
- (void)choice_alignments_enumerateObjectsUsingBlock:(id)a3;
- (void)post_itn_nbest_choices_enumerateObjectsUsingBlock:(id)a3;
- (void)pre_itn_nbest_choices_enumerateObjectsUsingBlock:(id)a3;
- (void)pre_itn_token_to_post_itn_char_alignment_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTRecognitionResult

- (FTRecognitionResult)initWithFlatbuffData:(id)a3
{
  return [(FTRecognitionResult *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTRecognitionResult *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4
{
  return [(FTRecognitionResult *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTRecognitionResult;
  v10 = [(FTRecognitionResult *)&v26 init];
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
    a4 = (const RecognitionResult *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::RecognitionResult *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::RecognitionResult::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (FTRecognitionSausage)pre_itn
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn"];
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
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pre_itn"];
  }
  return v3;
}

- (FTRecognitionSausage)post_itn
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn"];
  if (!v3)
  {
    v4 = [FTRecognitionSausage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"post_itn"];
  }
  return v3;
}

- (NSArray)pre_itn_nbest_choices
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_nbest_choices"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__FTRecognitionResult_pre_itn_nbest_choices__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRecognitionResult *)self pre_itn_nbest_choices_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pre_itn_nbest_choices"];
  }
  return (NSArray *)v3;
}

uint64_t __44__FTRecognitionResult_pre_itn_nbest_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)pre_itn_nbest_choices_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_nbest_choices"];
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
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
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

- (unint64_t)pre_itn_nbest_choices_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_nbest_choices"];
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

- (void)pre_itn_nbest_choices_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_nbest_choices"];
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

- (NSArray)post_itn_nbest_choices
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_nbest_choices"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__FTRecognitionResult_post_itn_nbest_choices__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRecognitionResult *)self post_itn_nbest_choices_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"post_itn_nbest_choices"];
  }
  return (NSArray *)v3;
}

uint64_t __45__FTRecognitionResult_post_itn_nbest_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)post_itn_nbest_choices_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_nbest_choices"];
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
      id v7 = [[FTRecognitionChoice alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)post_itn_nbest_choices_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_nbest_choices"];
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

- (void)post_itn_nbest_choices_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_nbest_choices"];
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

- (NSArray)pre_itn_token_to_post_itn_char_alignment
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__FTRecognitionResult_pre_itn_token_to_post_itn_char_alignment__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRecognitionResult *)self pre_itn_token_to_post_itn_char_alignment_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
  }
  return (NSArray *)v3;
}

uint64_t __63__FTRecognitionResult_pre_itn_token_to_post_itn_char_alignment__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)pre_itn_token_to_post_itn_char_alignment_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
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

- (unint64_t)pre_itn_token_to_post_itn_char_alignment_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
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

- (void)pre_itn_token_to_post_itn_char_alignment_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTItnAlignment *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
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
            uint64_t v17 = [[FTItnAlignment alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)choice_alignments
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"choice_alignments"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__FTRecognitionResult_choice_alignments__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRecognitionResult *)self choice_alignments_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"choice_alignments"];
  }
  return (NSArray *)v3;
}

uint64_t __40__FTRecognitionResult_choice_alignments__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)choice_alignments_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"choice_alignments"];
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
      id v7 = [[FTChoiceAlignment alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)choice_alignments_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"choice_alignments"];
  v4 = v3;
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

- (void)choice_alignments_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTChoiceAlignment *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"choice_alignments"];
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
            uint64_t v17 = [[FTChoiceAlignment alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::RecognitionResult>)addObjectToBuffer:(void *)a3
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTRecognitionResult *)self pre_itn];
  int v89 = [v5 addObjectToBuffer:a3];

  v6 = [(FTRecognitionResult *)self post_itn];
  int v88 = [v6 addObjectToBuffer:a3];

  memset(&v111, 0, sizeof(v111));
  id v7 = [(FTRecognitionResult *)self pre_itn_nbest_choices];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v111, [v7 count]);

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v8 = [(FTRecognitionResult *)self pre_itn_nbest_choices];
  v90 = self;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v107 objects:v115 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v108 != v10) {
          objc_enumerationMutation(v8);
        }
        int v12 = [*(id *)(*((void *)&v107 + 1) + 8 * i) addObjectToBuffer:a3];
        int v13 = v12;
        std::vector<int>::pointer end = v111.__end_;
        if (v111.__end_ >= v111.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v111.__begin_;
          int64_t v17 = v111.__end_ - v111.__begin_;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v19 = (char *)v111.__end_cap_.__value_ - (char *)v111.__begin_;
          if (((char *)v111.__end_cap_.__value_ - (char *)v111.__begin_) >> 1 > v18) {
            unint64_t v18 = v19 >> 1;
          }
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v18;
          }
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v111.__end_cap_, v20);
            std::vector<int>::pointer begin = v111.__begin_;
            std::vector<int>::pointer end = v111.__end_;
          }
          else
          {
            v21 = 0;
          }
          v22 = (int *)&v21[4 * v17];
          int *v22 = v13;
          uint64_t v15 = v22 + 1;
          while (end != begin)
          {
            int v23 = *--end;
            *--v22 = v23;
          }
          v111.__begin_ = v22;
          v111.__end_ = v15;
          v111.__end_cap_.__value_ = (int *)&v21[4 * v20];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v111.__end_ = v12;
          uint64_t v15 = end + 1;
        }
        v111.__end_ = v15;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v107 objects:v115 count:16];
    }
    while (v9);
  }

  if (v111.__end_ == v111.__begin_) {
    std::vector<int>::pointer v24 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  }
  else {
    std::vector<int>::pointer v24 = v111.__begin_;
  }
  int v87 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v24, v111.__end_ - v111.__begin_);
  memset(&v106, 0, sizeof(v106));
  char v25 = [(FTRecognitionResult *)self post_itn_nbest_choices];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v106, [v25 count]);

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  objc_super v26 = [(FTRecognitionResult *)self post_itn_nbest_choices];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v102 objects:v114 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v103;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v103 != v28) {
          objc_enumerationMutation(v26);
        }
        int v30 = [*(id *)(*((void *)&v102 + 1) + 8 * j) addObjectToBuffer:a3];
        int v31 = v30;
        std::vector<int>::pointer v32 = v106.__end_;
        if (v106.__end_ >= v106.__end_cap_.__value_)
        {
          std::vector<int>::pointer v34 = v106.__begin_;
          int64_t v35 = v106.__end_ - v106.__begin_;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v37 = (char *)v106.__end_cap_.__value_ - (char *)v106.__begin_;
          if (((char *)v106.__end_cap_.__value_ - (char *)v106.__begin_) >> 1 > v36) {
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
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v106.__end_cap_, v38);
            std::vector<int>::pointer v34 = v106.__begin_;
            std::vector<int>::pointer v32 = v106.__end_;
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
          v106.__begin_ = v40;
          v106.__end_ = v33;
          v106.__end_cap_.__value_ = (int *)&v39[4 * v38];
          if (v34) {
            operator delete(v34);
          }
        }
        else
        {
          *v106.__end_ = v30;
          v33 = v32 + 1;
        }
        v106.__end_ = v33;
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v102 objects:v114 count:16];
    }
    while (v27);
  }

  if (v106.__end_ == v106.__begin_) {
    std::vector<int>::pointer v42 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  }
  else {
    std::vector<int>::pointer v42 = v106.__begin_;
  }
  int v86 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v42, v106.__end_ - v106.__begin_);
  memset(&v101, 0, sizeof(v101));
  v43 = [(FTRecognitionResult *)v90 pre_itn_token_to_post_itn_char_alignment];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v101, [v43 count]);

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v44 = [(FTRecognitionResult *)v90 pre_itn_token_to_post_itn_char_alignment];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v97 objects:v113 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v98;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v98 != v46) {
          objc_enumerationMutation(v44);
        }
        int v48 = [*(id *)(*((void *)&v97 + 1) + 8 * k) addObjectToBuffer:a3];
        int v49 = v48;
        std::vector<int>::pointer v50 = v101.__end_;
        if (v101.__end_ >= v101.__end_cap_.__value_)
        {
          std::vector<int>::pointer v52 = v101.__begin_;
          int64_t v53 = v101.__end_ - v101.__begin_;
          unint64_t v54 = v53 + 1;
          if ((unint64_t)(v53 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v55 = (char *)v101.__end_cap_.__value_ - (char *)v101.__begin_;
          if (((char *)v101.__end_cap_.__value_ - (char *)v101.__begin_) >> 1 > v54) {
            unint64_t v54 = v55 >> 1;
          }
          if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v56 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v56 = v54;
          }
          if (v56)
          {
            v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v101.__end_cap_, v56);
            std::vector<int>::pointer v52 = v101.__begin_;
            std::vector<int>::pointer v50 = v101.__end_;
          }
          else
          {
            v57 = 0;
          }
          v58 = (int *)&v57[4 * v53];
          int *v58 = v49;
          v51 = v58 + 1;
          while (v50 != v52)
          {
            int v59 = *--v50;
            *--v58 = v59;
          }
          v101.__begin_ = v58;
          v101.__end_ = v51;
          v101.__end_cap_.__value_ = (int *)&v57[4 * v56];
          if (v52) {
            operator delete(v52);
          }
        }
        else
        {
          *v101.__end_ = v48;
          v51 = v50 + 1;
        }
        v101.__end_ = v51;
      }
      uint64_t v45 = [v44 countByEnumeratingWithState:&v97 objects:v113 count:16];
    }
    while (v45);
  }

  if (v101.__end_ == v101.__begin_) {
    std::vector<int>::pointer v60 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>> const&)::t;
  }
  else {
    std::vector<int>::pointer v60 = v101.__begin_;
  }
  int v61 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v60, v101.__end_ - v101.__begin_);
  memset(&v96, 0, sizeof(v96));
  v62 = [(FTRecognitionResult *)v90 choice_alignments];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v96, [v62 count]);

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v63 = [(FTRecognitionResult *)v90 choice_alignments];
  int v91 = v61;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v92 objects:v112 count:16];
  if (v64)
  {
    uint64_t v65 = *(void *)v93;
    do
    {
      for (uint64_t m = 0; m != v64; ++m)
      {
        if (*(void *)v93 != v65) {
          objc_enumerationMutation(v63);
        }
        int v67 = [*(id *)(*((void *)&v92 + 1) + 8 * m) addObjectToBuffer:a3];
        int v68 = v67;
        std::vector<int>::pointer v69 = v96.__end_;
        if (v96.__end_ >= v96.__end_cap_.__value_)
        {
          std::vector<int>::pointer v71 = v96.__begin_;
          int64_t v72 = v96.__end_ - v96.__begin_;
          unint64_t v73 = v72 + 1;
          if ((unint64_t)(v72 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v74 = (char *)v96.__end_cap_.__value_ - (char *)v96.__begin_;
          if (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 1 > v73) {
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
            v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v96.__end_cap_, v75);
            std::vector<int>::pointer v71 = v96.__begin_;
            std::vector<int>::pointer v69 = v96.__end_;
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
          v96.__begin_ = v77;
          v96.__end_ = v70;
          v96.__end_cap_.__value_ = (int *)&v76[4 * v75];
          if (v71) {
            operator delete(v71);
          }
        }
        else
        {
          *v96.__end_ = v67;
          v70 = v69 + 1;
        }
        v96.__end_ = v70;
      }
      uint64_t v64 = [v63 countByEnumeratingWithState:&v92 objects:v112 count:16];
    }
    while (v64);
  }

  if (v96.__end_ == v96.__begin_) {
    std::vector<int>::pointer v79 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ChoiceAlignment>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ChoiceAlignment>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ChoiceAlignment>> const&)::t;
  }
  else {
    std::vector<int>::pointer v79 = v96.__begin_;
  }
  int v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v79, v96.__end_ - v96.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v81 = *((_DWORD *)a3 + 8);
  int v82 = *((_DWORD *)a3 + 12);
  int v83 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v89);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v88);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v87);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v86);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v91);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v80);
  v84.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v81 - (unsigned __int16)v82 + v83);
  if (v96.__begin_)
  {
    v96.__end_ = v96.__begin_;
    operator delete(v96.__begin_);
  }
  if (v101.__begin_)
  {
    v101.__end_ = v101.__begin_;
    operator delete(v101.__begin_);
  }
  if (v106.__begin_)
  {
    v106.__end_ = v106.__begin_;
    operator delete(v106.__begin_);
  }
  if (v111.__begin_)
  {
    v111.__end_ = v111.__begin_;
    operator delete(v111.__begin_);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTRecognitionResult *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__35__FTRecognitionResult_flatbuffData__block_invoke(uint64_t a1)
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