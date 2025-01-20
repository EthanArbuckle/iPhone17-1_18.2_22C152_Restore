@interface RKEventIdentification
- ($A8567127CD1317684890FBE2DC5448B6)topClassification;
- (NSArray)tokenSequences;
- (RKEventIdentification)initWithOwnedTokenSequences:(id)a3 probabilities:(float *)a4;
- (id)description;
- (void)dealloc;
- (void)enumerateClassifiedTokens:(id)a3;
- (void)enumerateTopKClassificationsForEachString:(unint64_t)a3 block:(id)a4;
- (void)getTopKClassifications:(unint64_t)a3 block:(id)a4;
@end

@implementation RKEventIdentification

- (RKEventIdentification)initWithOwnedTokenSequences:(id)a3 probabilities:(float *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RKEventIdentification;
  v8 = [(RKEventIdentification *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tokenSequences, a3);
    v9->_probabilities = a4;
  }

  return v9;
}

- (void)dealloc
{
  free(self->_probabilities);
  v3.receiver = self;
  v3.super_class = (Class)RKEventIdentification;
  [(RKEventIdentification *)&v3 dealloc];
}

- (void)enumerateClassifiedTokens:(id)a3
{
  v4 = (void (**)(id, void *, float *, unsigned __int8 *))a3;
  unint64_t v5 = 0;
  probabilities = self->_probabilities;
  while (v5 < [(NSArray *)self->_tokenSequences count])
  {
    id v7 = [(NSArray *)self->_tokenSequences objectAtIndex:v5];
    unint64_t v8 = [v7 count];

    if (v8 >= kMaxSequenceLength) {
      unint64_t v9 = kMaxSequenceLength;
    }
    else {
      unint64_t v9 = v8;
    }
    if (v9)
    {
      uint64_t v10 = 0;
      do
      {
        objc_super v11 = [(NSArray *)self->_tokenSequences objectAtIndex:v5];
        v12 = [v11 objectAtIndexedSubscript:v10];

        uint64_t v13 = [v12 location];
        uint64_t v14 = [v12 length];
        unsigned __int8 v16 = 0;
        v15[0] = v5;
        v15[1] = v13;
        v15[2] = v14;
        v4[2](v4, v15, probabilities, &v16);
        LODWORD(v13) = v16;

        if (v13) {
          goto LABEL_11;
        }
        probabilities += 5;
      }
      while (v9 != ++v10);
    }
    ++v5;
  }
LABEL_11:
}

- (void)enumerateTopKClassificationsForEachString:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, id *))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v14 = self;
  uint64_t v13 = self->_tokenSequences;
  uint64_t v7 = [(NSArray *)v13 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v13);
        }
        unint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) count];
        if (v11 >= kMaxSequenceLength) {
          uint64_t v12 = kMaxSequenceLength;
        }
        else {
          uint64_t v12 = v11;
        }
        findTopKClassifications(&(&v13)[-2 * a3], a3, (uint64_t)v14->_probabilities, v8, v12);
        v6[2](v6, (id *)&(&v13)[-2 * a3]);
        v8 += v12;
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSArray *)v13 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)getTopKClassifications:(unint64_t)a3 block:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, _OWORD *))a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_tokenSequences;
  uint64_t v8 = 0;
  uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "count", (void)v14);
        if (kMaxSequenceLength >= v12) {
          int v13 = v12;
        }
        else {
          int v13 = kMaxSequenceLength;
        }
        v8 += v13;
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  findTopKClassifications(&v14 - a3, a3, (uint64_t)self->_probabilities, 0, v8);
  v6[2](v6, &v14 - a3);
}

- ($A8567127CD1317684890FBE2DC5448B6)topClassification
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x4012000000;
  uint64_t v10 = __Block_byref_object_copy__82;
  unint64_t v11 = __Block_byref_object_dispose__83;
  int v12 = "";
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__RKEventIdentification_topClassification__block_invoke;
  v6[3] = &unk_2642D2AA8;
  v6[4] = &v7;
  [(RKEventIdentification *)self getTopKClassifications:1 block:v6];
  unint64_t v2 = v8[6];
  uint64_t v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  unint64_t v4 = v2;
  uint64_t v5 = v3;
  result.var1 = *(float *)&v5;
  result.var0 = v4;
  return result;
}

__n128 __42__RKEventIdentification_topClassification__block_invoke(uint64_t a1, __n128 *a2)
{
  __n128 result = *a2;
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *a2;
  return result;
}

- (id)description
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__3;
  uint64_t v9 = __Block_byref_object_dispose__3;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__RKEventIdentification_description__block_invoke;
  v4[3] = &unk_2642D2AD0;
  v4[4] = self;
  v4[5] = &v5;
  [(RKEventIdentification *)self getTopKClassifications:2 block:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __36__RKEventIdentification_description__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [NSString alloc];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  if (*(void *)a2 > 4uLL) {
    uint64_t v7 = @"INVALID";
  }
  else {
    uint64_t v7 = off_2642D2B10[*(void *)a2];
  }
  unint64_t v8 = *(void *)(a2 + 16);
  if (v8 > 4) {
    uint64_t v9 = @"INVALID";
  }
  else {
    uint64_t v9 = off_2642D2B10[v8];
  }
  id v13 = (id)v6;
  uint64_t v10 = [v4 initWithFormat:@"[%@ %@=%0.2f, %@=%0.2f]", v6, v7, *(float *)(a2 + 8), v9, *(float *)(a2 + 24)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (NSArray)tokenSequences
{
  return self->_tokenSequences;
}

- (void).cxx_destruct
{
}

@end