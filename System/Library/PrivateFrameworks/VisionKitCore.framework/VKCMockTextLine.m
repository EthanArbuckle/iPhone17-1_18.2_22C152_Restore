@interface VKCMockTextLine
- (NSArray)words;
- (NSString)text;
- (VKCMockTextLine)initWithWordsArray:(id)a3 startingIndex:(unint64_t)a4;
- (VKQuad)quad;
- (_NSRange)range;
- (void)loadWordsArrayFromWords:(id)a3 startingIndex:(unint64_t)a4;
- (void)setQuad:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setText:(id)a3;
- (void)setWords:(id)a3;
@end

@implementation VKCMockTextLine

- (VKCMockTextLine)initWithWordsArray:(id)a3 startingIndex:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKCMockTextLine;
  v7 = [(VKCMockTextLine *)&v10 init];
  v8 = v7;
  if (v7) {
    [(VKCMockTextLine *)v7 loadWordsArrayFromWords:v6 startingIndex:a4];
  }

  return v8;
}

- (void)loadWordsArrayFromWords:(id)a3 startingIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __57__VKCMockTextLine_loadWordsArrayFromWords_startingIndex___block_invoke;
  v34[3] = &unk_1E6BF3388;
  id v8 = v7;
  id v35 = v8;
  [v6 enumerateObjectsUsingBlock:v34];
  v9 = (void *)[v8 copy];
  [(VKCMockTextLine *)self setWords:v9];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3010000000;
  v31 = &unk_1DB350762;
  unint64_t v32 = a4;
  uint64_t v33 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__23;
  v26 = __Block_byref_object_dispose__23;
  id v27 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__VKCMockTextLine_loadWordsArrayFromWords_startingIndex___block_invoke_37;
  v17[3] = &unk_1E6BF4258;
  id v11 = v10;
  id v18 = v11;
  v20 = &v28;
  v21 = &v22;
  id v12 = v8;
  id v19 = v12;
  [v12 enumerateObjectsUsingBlock:v17];
  -[VKCMockTextLine setRange:](self, "setRange:", v29[4], v29[5]);
  [(VKCMockTextLine *)self setQuad:v23[5]];
  [(VKCMockTextLine *)self setText:v11];
  v13 = [(VKCMockTextLine *)self text];
  uint64_t v14 = [v13 length];
  [(VKCMockTextLine *)self range];
  uint64_t v16 = v15;

  if (v14 != v16) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.text.length == self.range.length", "-[VKCMockTextLine loadWordsArrayFromWords:startingIndex:]", 0, 0, @"Mock Text is unequal to range length");
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

void __57__VKCMockTextLine_loadWordsArrayFromWords_startingIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[VKCMockTextWord alloc] initWithWordsDictionary:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

void __57__VKCMockTextLine_loadWordsArrayFromWords_startingIndex___block_invoke_37(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v13 = [v5 text];
  [*(id *)(a1 + 32) appendString:v13];
  objc_msgSend(v5, "setRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)+ *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), objc_msgSend(v13, "length"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) += [v13 length];
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v7 = [v5 quad];

  if (v6)
  {
    uint64_t v8 = [v6 quadFromUnionWithQuad:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v7;
    v7 = v12;
  }

  if ([*(id *)(a1 + 40) count] - 1 > a3)
  {
    [*(id *)(a1 + 32) appendString:@" "];
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (NSArray)words
{
  return self->_words;
}

- (void)setWords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end