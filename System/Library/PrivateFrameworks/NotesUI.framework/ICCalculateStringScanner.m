@interface ICCalculateStringScanner
- (ICCalculateStringScanner)initWithTextStorage:(id)a3;
- (ICTTTextStorage)textStorage;
- (id)offsetsForInlineAttachment:(id)a3;
- (id)replacementForAttachment:(id)a3;
- (id)scanStringforRange:(_NSRange)a3;
- (void)setTextStorage:(id)a3;
@end

@implementation ICCalculateStringScanner

void __47__ICCalculateStringScanner_scanStringforRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  objc_opt_class();
  v9 = ICDynamicCast();
  v10 = v9;
  if (v9 && ([v9 attachment], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    v13 = [*(id *)(a1 + 32) replacementForAttachment:v11];
    if (v13)
    {
      v14 = [*(id *)(a1 + 32) offsetsForInlineAttachment:v12];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "replaceCharactersInRange:withString:", a3 - *(void *)(a1 + 64) + *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a4, v13);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __47__ICCalculateStringScanner_scanStringforRange___block_invoke_2;
      v34[3] = &unk_1E5FDBA78;
      v34[4] = *(void *)(a1 + 40);
      long long v35 = *(_OWORD *)(a1 + 64);
      v15 = objc_msgSend(v14, "ic_map:", v34);
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v15];
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16 - a4 + [v13 length];
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F83230];
    uint64_t v18 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F83230]];
    if (v18
      && (v19 = (void *)v18,
          [v7 objectForKeyedSubscript:*v17],
          v20 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = [v20 integerValue],
          v20,
          v19,
          v21 >= 1))
    {
      uint64_t v32 = a3 - *(void *)(a1 + 64) + *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      v22 = [*(id *)(a1 + 32) textStorage];
      v23 = [v22 string];
      uint64_t v24 = objc_msgSend(v23, "substringWithRange:", a3, a4);

      v33 = (void *)v24;
      v25 = (void *)[[NSString alloc] initWithFormat:@"^(%@)", v24];
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v25 length])
      {
        unint64_t v27 = 0;
        do
        {
          v28 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - *(void *)(a1 + 64)];
          [v26 addObject:v28];

          ++v27;
        }
        while ([v25 length] > v27);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v26];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "replaceCharactersInRange:withString:", v32, a4, v25);
      uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v29 - a4 + [v25 length];
    }
    else
    {
      for (id i = objc_alloc_init(MEMORY[0x1E4F1CA48]); a4; --a4)
      {
        v31 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - *(void *)(a1 + 64)];
        [i addObject:v31];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:i];
    }
  }
}

- (id)scanStringforRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__40;
  v25 = __Block_byref_object_dispose__40;
  v6 = [(ICCalculateStringScanner *)self textStorage];
  id v7 = [v6 string];
  v8 = objc_msgSend(v7, "substringWithRange:", location, length);
  id v26 = (id)[v8 mutableCopy];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__40;
  v19 = __Block_byref_object_dispose__40;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v9 = [(ICCalculateStringScanner *)self textStorage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__ICCalculateStringScanner_scanStringforRange___block_invoke;
  v13[3] = &unk_1E5FDBAA0;
  v13[8] = location;
  v13[9] = length;
  v13[4] = self;
  v13[5] = v14;
  v13[6] = &v21;
  v13[7] = &v15;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v13);

  id v10 = objc_alloc(MEMORY[0x1E4F837F0]);
  uint64_t v11 = (void *)[v10 initWithFirstObject:v22[5] secondObject:v16[5]];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (ICTTTextStorage)textStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
  return (ICTTTextStorage *)WeakRetained;
}

- (void)setTextStorage:(id)a3
{
}

- (ICCalculateStringScanner)initWithTextStorage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCalculateStringScanner;
  v5 = [(ICCalculateStringScanner *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICCalculateStringScanner *)v5 setTextStorage:v4];
  }

  return v6;
}

- (void).cxx_destruct
{
}

uint64_t __47__ICCalculateStringScanner_scanStringforRange___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = v3 + (int)[a2 intValue] - *(void *)(a1 + 40);
  return [v2 numberWithInteger:v4];
}

- (id)replacementForAttachment:(id)a3
{
  id v3 = a3;
  if ([v3 isCalculateResultAttachment])
  {
    uint64_t v4 = @"=? ";
  }
  else if ([v3 isCalculateGraphExpressionAttachment])
  {
    id v5 = [NSString alloc];
    v6 = [v3 displayText];
    id v7 = objc_msgSend(v6, "ic_trailingTrimmedString");
    uint64_t v4 = (__CFString *)[v5 initWithFormat:@" %@", v7];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)offsetsForInlineAttachment:(id)a3
{
  id v4 = a3;
  if ([v4 isCalculateResultAttachment])
  {
    id v5 = &unk_1F09A3F80;
  }
  else if ([v4 isCalculateGraphExpressionAttachment])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [(ICCalculateStringScanner *)self replacementForAttachment:v4];
    if ([v6 length])
    {
      unint64_t v7 = 0;
      do
      {
        [v5 addObject:&unk_1F09A4310];
        ++v7;
      }
      while ([v6 length] > v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end