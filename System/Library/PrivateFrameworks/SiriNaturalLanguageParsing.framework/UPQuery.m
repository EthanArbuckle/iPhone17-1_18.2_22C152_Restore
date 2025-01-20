@interface UPQuery
+ (id)tokenDescription:(id)a3;
- (NSArray)spans;
- (NSArray)tokens;
- (NSDictionary)embeddingsByToken;
- (NSString)utterance;
- (NSUUID)uuid;
- (SIRINLUSystemDialogAct)dialogAct;
- (UPQuery)initWithProtobufQuery:(id)a3 error:(id *)a4;
- (UPQuery)initWithUtterance:(id)a3 tokens:(id)a4 embeddingsByToken:(id)a5 spans:(id)a6 dialogAct:(id)a7;
- (id)_buildEmbeddingsDictionaryWithNonWhitespaceTokens:(id)a3 nonWhitespaceTokenIndexes:(id)a4 embeddings:(id)a5 error:(id *)a6;
- (id)_buildTokenListWithTokenChain:(id)a3 nonWhitespaceTokenIndexes:(id)a4;
- (id)_createDialogActWithProtobufQuery:(id)a3;
- (id)_getNonWhitespaceTokenIndexes:(id)a3;
- (id)buildSpansListWithProtobufQuery:(id)a3 nonWhitespaceTokenIndexes:(id)a4 error:(id *)a5;
- (id)description;
@end

@implementation UPQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogAct, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_embeddingsByToken, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (SIRINLUSystemDialogAct)dialogAct
{
  return (SIRINLUSystemDialogAct *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)spans
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)embeddingsByToken
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)utterance
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v24 = [MEMORY[0x1E4F1CA48] array];
  v23 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(UPQuery *)self tokens];
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v25)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v5 = [(id)objc_opt_class() tokenDescription:v4];
        [v24 addObject:v5];
        v6 = [(UPQuery *)self embeddingsByToken];
        v7 = [v6 objectForKeyedSubscript:v4];

        v8 = NSStringFromSelector(sel_description);
        v9 = [v7 valueForKey:v8];
        v10 = NSString;
        v11 = [v9 componentsJoinedByString:@", "];
        v12 = [v10 stringWithFormat:@"[%@]", v11];

        v13 = [NSString stringWithFormat:@"%@ => %@", v5, v12];
        [v23 addObject:v13];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v25);
  }

  v14 = NSString;
  v15 = [(UPQuery *)self utterance];
  v16 = [v24 componentsJoinedByString:@", "];
  v17 = [v23 componentsJoinedByString:@"\n"];
  v18 = [(UPQuery *)self spans];
  v19 = [v14 stringWithFormat:@"{UPQuery\n  utterance: %@\n  tokens: %@\n  embeddingsByToken:\n%@\n  spans:\n%@\n}", v15, v16, v17, v18];

  return v19;
}

- (id)_createDialogActWithProtobufQuery:(id)a3
{
  id v3 = a3;
  if (![v3 hasTurnInput]) {
    goto LABEL_12;
  }
  uint64_t v4 = [v3 turnInput];
  if (([v4 hasTurnContext] & 1) == 0) {
    goto LABEL_11;
  }
  v5 = [v3 turnInput];
  v6 = [v5 turnContext];
  if (([v6 hasNlContext] & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  v7 = [v3 turnInput];
  v8 = [v7 turnContext];
  v9 = [v8 nlContext];
  v10 = [v9 systemDialogActs];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
LABEL_12:
    uint64_t v22 = 0;
    goto LABEL_13;
  }
  v12 = [v3 turnInput];
  v13 = [v12 turnContext];
  v14 = [v13 nlContext];
  unint64_t v15 = [v14 systemDialogActsCount];

  if (v15 >= 2)
  {
    v16 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1C8DA9000, v16, OS_LOG_TYPE_ERROR, "Multiple SystemDialogActs specified in context but UaaP can only handle one - using the first one", v24, 2u);
    }
  }
  v17 = [v3 turnInput];
  v18 = [v17 turnContext];
  v19 = [v18 nlContext];
  v20 = [v19 systemDialogActs];
  v21 = [v20 firstObject];

  uint64_t v22 = [MEMORY[0x1E4FA2B08] convertSystemDialogAct:v21];

LABEL_13:
  return v22;
}

- (id)buildSpansListWithProtobufQuery:(id)a3 nonWhitespaceTokenIndexes:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "matchingSpansCount"));
  if ([v7 matchingSpansCount])
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [UPSpan alloc];
      v12 = [v7 matchingSpansAtIndex:v10];
      id v19 = 0;
      v13 = [(UPSpan *)v11 initWithProtobufSpan:v12 nonWhitespaceTokenIndexes:v8 error:&v19];
      id v14 = v19;

      if (!v13) {
        break;
      }
      [v9 addObject:v13];

      if ([v7 matchingSpansCount] <= (unint64_t)++v10) {
        goto LABEL_5;
      }
    }
    v16 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = [v14 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_1C8DA9000, v16, OS_LOG_TYPE_ERROR, "Hit error when converting protobuf span to UPSpan: %@", buf, 0xCu);
    }
    if (a5) {
      *a5 = v14;
    }

    id v15 = 0;
  }
  else
  {
LABEL_5:
    id v15 = v9;
  }

  return v15;
}

- (id)_buildEmbeddingsDictionaryWithNonWhitespaceTokens:(id)a3 nonWhitespaceTokenIndexes:(id)a4 embeddings:(id)a5 error:(id *)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 count];
  if (v12 == [v10 count])
  {
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    int v36 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v25 = 0;
    long long v26 = &v25;
    uint64_t v27 = 0x3032000000;
    long long v28 = __Block_byref_object_copy_;
    long long v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __104__UPQuery__buildEmbeddingsDictionaryWithNonWhitespaceTokens_nonWhitespaceTokenIndexes_embeddings_error___block_invoke;
    v18[3] = &unk_1E6580758;
    id v19 = v9;
    uint64_t v22 = v35;
    id v20 = v11;
    v23 = &v25;
    v24 = &v31;
    id v14 = v13;
    id v21 = v14;
    [v10 enumerateIndexesUsingBlock:v18];
    if (*((unsigned char *)v32 + 24))
    {
      id v15 = 0;
      if (a6) {
        *a6 = (id) v26[5];
      }
    }
    else
    {
      id v15 = v14;
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v35, 8);
  }
  else
  {
    if (!a6)
    {
      id v15 = 0;
      goto LABEL_11;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38[0] = @"Count of nonWhitespaceTokens does not match nonWhitespaceTokenIndexes";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v16 errorWithDomain:@"com.apple.uaapcustomluframework" code:10 userInfo:v14];
    id v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v15;
}

void __104__UPQuery__buildEmbeddingsDictionaryWithNonWhitespaceTokens_nonWhitespaceTokenIndexes_embeddings_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  v6 = [UPEmbedding alloc];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = [(UPEmbedding *)v6 initWithProtobufEmbeddings:v7 forTokenAt:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v10];
    [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v5];
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)_buildTokenListWithTokenChain:(id)a3 nonWhitespaceTokenIndexes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __67__UPQuery__buildTokenListWithTokenChain_nonWhitespaceTokenIndexes___block_invoke;
  v13 = &unk_1E6580730;
  id v7 = v5;
  id v14 = v7;
  id v15 = &v16;
  [v6 enumerateIndexesUsingBlock:&v10];
  uint64_t v8 = objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __67__UPQuery__buildTokenListWithTokenChain_nonWhitespaceTokenIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) tokensAtIndex:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
}

- (id)_getNonWhitespaceTokenIndexes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 tokensCount];
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v7 = [v3 tokensAtIndex:i];
      if (([v7 isWhitespace] & 1) == 0) {
        [v5 addIndex:i];
      }
    }
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndexSet:v5];

  return v8;
}

- (UPQuery)initWithProtobufQuery:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 hasTokenChain])
  {
    id v7 = [v6 tokenChain];
    uint64_t v27 = [(UPQuery *)self _getNonWhitespaceTokenIndexes:v7];
    long long v28 = -[UPQuery _buildTokenListWithTokenChain:nonWhitespaceTokenIndexes:](self, "_buildTokenListWithTokenChain:nonWhitespaceTokenIndexes:", v7);
    uint64_t v8 = [MEMORY[0x1E4F28E78] string];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v9 = [v7 tokens];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v31 + 1) + 8 * i) value];
          [v8 appendString:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v11);
    }

    if ([v6 hasEmbeddings])
    {
      id v15 = [v6 embeddings];
      id v30 = 0;
      uint64_t v16 = (void *)v27;
      v17 = [(UPQuery *)self _buildEmbeddingsDictionaryWithNonWhitespaceTokens:v28 nonWhitespaceTokenIndexes:v27 embeddings:v15 error:&v30];
      id v18 = v30;

      if (v17)
      {
        id v29 = 0;
        id v19 = [(UPQuery *)self buildSpansListWithProtobufQuery:v6 nonWhitespaceTokenIndexes:v27 error:&v29];
        id v20 = v29;
        long long v26 = v20;
        if (v19)
        {
          id v21 = [(UPQuery *)self _createDialogActWithProtobufQuery:v6];
          self = [(UPQuery *)self initWithUtterance:v8 tokens:v28 embeddingsByToken:v17 spans:v19 dialogAct:v21];

          uint64_t v22 = self;
        }
        else
        {
          uint64_t v22 = 0;
          if (v20) {
            *a4 = v20;
          }
        }
      }
      else
      {
        uint64_t v22 = 0;
        if (a4) {
          *a4 = v18;
        }
      }
    }
    else
    {
      uint64_t v16 = (void *)v27;
      if (!a4)
      {
        uint64_t v22 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      int v36 = @"Request has no embeddings";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      [v24 errorWithDomain:@"com.apple.uaapcustomluframework" code:10 userInfo:v18];
      uint64_t v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_27;
  }
  if (a4)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = @"Request has no token chain";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    [v23 errorWithDomain:@"com.apple.uaapcustomluframework" code:10 userInfo:v7];
    uint64_t v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v22 = 0;
LABEL_29:

  return v22;
}

- (UPQuery)initWithUtterance:(id)a3 tokens:(id)a4 embeddingsByToken:(id)a5 spans:(id)a6 dialogAct:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)UPQuery;
  v17 = [(UPQuery *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
    uuid = v17->_uuid;
    v17->_uuid = (NSUUID *)v18;

    uint64_t v20 = [v12 copy];
    utterance = v17->_utterance;
    v17->_utterance = (NSString *)v20;

    objc_storeStrong((id *)&v17->_tokens, a4);
    objc_storeStrong((id *)&v17->_embeddingsByToken, a5);
    objc_storeStrong((id *)&v17->_dialogAct, a7);
    objc_storeStrong((id *)&v17->_spans, a6);
  }

  return v17;
}

+ (id)tokenDescription:(id)a3
{
  id v3 = a3;
  if ([v3 hasBegin])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v3, "begin"));
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = @"(missing)";
  }
  if ([v3 hasEnd])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v3, "end"));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"(missing)";
  }
  if ([v3 hasValue])
  {
    id v6 = [v3 value];
  }
  else
  {
    id v6 = @"(missing)";
  }
  id v7 = [NSString stringWithFormat:@"{Token begin=%@, end=%@, value='%@'}", v4, v5, v6];

  return v7;
}

@end