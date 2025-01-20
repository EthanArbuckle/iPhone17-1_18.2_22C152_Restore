@interface _UISearchBarTextFieldTokenCounter
- (NSIndexSet)tokenCharacterIndexes;
- (_NSRange)characterRangeForSubrangeOfTextAfterLastToken:(_NSRange)a3;
- (_NSRange)characterRangeOfAllTokens;
- (_NSRange)characterRangeOfTextAfterLastToken;
- (_NSRange)subrangeOfTextAfterLastTokenForCharacterRange:(_NSRange)a3;
- (_UISearchBarTextFieldTokenCounter)initWithTextStorage:(id)a3;
- (id)tokenAtCharacterIndex:(unint64_t)a3;
- (unint64_t)characterIndexForInsertingTokenAtIndex:(unint64_t)a3;
- (unint64_t)characterIndexForSelectingOrRemovingTokenAtIndex:(unint64_t)a3;
- (unint64_t)indexOfTokenAtCharacterIndex:(unint64_t)a3;
- (void)_addCharacterIndexesOfTokensInRange:(_NSRange)a3 toIndexSet:(id)a4;
- (void)_handleProcessEditing;
@end

@implementation _UISearchBarTextFieldTokenCounter

- (_NSRange)characterRangeOfTextAfterLastToken
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableIndexSet *)self->_tokenCharacterIndexes count];
  unint64_t v4 = [(NSTextStorage *)self->_textStorage length];
  if (v3)
  {
    uint64_t v5 = [(NSMutableIndexSet *)self->_tokenCharacterIndexes lastIndex] + 1;
    unint64_t v6 = v4 - v3;
    unint64_t v7 = v5 + v4 - v3;
    if (os_variant_has_internal_diagnostics() && v7 > v4)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v13 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = self;
          _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Invalid configuration of UISearchTextField with token following text. See rdar://102647358. %@", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &characterRangeOfTextAfterLastToken___s_category) + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Invalid configuration of UISearchTextField with token following text. See rdar://102647358. %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    if (v7 <= v4)
    {
      unint64_t v4 = v6;
    }
    else
    {
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2020000000;
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v20 = 0x3010000000;
      v21 = &unk_186D7DBA7;
      long long v22 = xmmword_186B93450;
      tokenCharacterIndexes = self->_tokenCharacterIndexes;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __71___UISearchBarTextFieldTokenCounter_characterRangeOfTextAfterLastToken__block_invoke;
      v14[3] = &unk_1E5303E00;
      v14[4] = &v15;
      v14[5] = &buf;
      [(NSMutableIndexSet *)tokenCharacterIndexes enumerateIndexesWithOptions:2 usingBlock:v14];
      uint64_t v9 = *((void *)&buf + 1);
      uint64_t v5 = *(void *)(*((void *)&buf + 1) + 32);
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v5 = 0;
        *(void *)(*((void *)&buf + 1) + 32) = 0;
        unint64_t v4 = v16[3];
        *(void *)(v9 + 40) = v4;
      }
      else
      {
        unint64_t v4 = *(void *)(*((void *)&buf + 1) + 40);
      }
      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v15, 8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  NSUInteger v10 = v5;
  NSUInteger v11 = v4;
  result.length = v11;
  result.location = v10;
  return result;
}

- (NSIndexSet)tokenCharacterIndexes
{
  if ([(NSTextStorage *)self->_textStorage editedMask])
  {
    uint64_t v3 = objc_opt_new();
    -[_UISearchBarTextFieldTokenCounter _addCharacterIndexesOfTokensInRange:toIndexSet:](self, "_addCharacterIndexesOfTokensInRange:toIndexSet:", 0, [(NSTextStorage *)self->_textStorage length], v3);
    unint64_t v4 = (void *)[v3 copy];
  }
  else
  {
    unint64_t v4 = (void *)[(NSMutableIndexSet *)self->_tokenCharacterIndexes copy];
  }
  return (NSIndexSet *)v4;
}

- (_UISearchBarTextFieldTokenCounter)initWithTextStorage:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UISearchBarTextFieldTokenCounter;
  unint64_t v6 = [(_UISearchBarTextFieldTokenCounter *)&v19 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_textStorage, a3);
    uint64_t v8 = objc_opt_new();
    tokenCharacterIndexes = v7->_tokenCharacterIndexes;
    v7->_tokenCharacterIndexes = (NSMutableIndexSet *)v8;

    -[_UISearchBarTextFieldTokenCounter _addCharacterIndexesOfTokensInRange:toIndexSet:](v7, "_addCharacterIndexesOfTokensInRange:toIndexSet:", 0, [v5 length], v7->_tokenCharacterIndexes);
    objc_initWeak(&location, v7);
    NSUInteger v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    NSUInteger v11 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v12 = *(void *)off_1E52D2350;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57___UISearchBarTextFieldTokenCounter_initWithTextStorage___block_invoke;
    v16[3] = &unk_1E52DA728;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = [v10 addObserverForName:v12 object:v5 queue:v11 usingBlock:v16];
    id textStorageObservation = v7->_textStorageObservation;
    v7->_id textStorageObservation = (id)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)_addCharacterIndexesOfTokensInRange:(_NSRange)a3 toIndexSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  textStorage = self->_textStorage;
  uint64_t v9 = *(void *)off_1E52D1F50;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84___UISearchBarTextFieldTokenCounter__addCharacterIndexesOfTokensInRange_toIndexSet___block_invoke;
  v11[3] = &unk_1E52D9A30;
  id v12 = v7;
  id v10 = v7;
  -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v9, location, length, 0, v11);
}

- (void)_handleProcessEditing
{
  if ([(NSTextStorage *)self->_textStorage editedMask])
  {
    [(NSMutableIndexSet *)self->_tokenCharacterIndexes removeAllIndexes];
    uint64_t v3 = [(NSTextStorage *)self->_textStorage length];
    tokenCharacterIndexes = self->_tokenCharacterIndexes;
    -[_UISearchBarTextFieldTokenCounter _addCharacterIndexesOfTokensInRange:toIndexSet:](self, "_addCharacterIndexesOfTokensInRange:toIndexSet:", 0, v3, tokenCharacterIndexes);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCharacterIndexes, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong(&self->_textStorageObservation, 0);
}

- (_NSRange)characterRangeOfAllTokens
{
  NSUInteger v2 = [(NSMutableIndexSet *)self->_tokenCharacterIndexes count];
  NSUInteger v3 = 0;
  result.NSUInteger length = v2;
  result.NSUInteger location = v3;
  return result;
}

- (unint64_t)characterIndexForInsertingTokenAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableIndexSet *)self->_tokenCharacterIndexes count];
  if (v5 + 1 < a3) {
    ThrowRangeException(a3, v5);
  }
  if (a3) {
    return [(_UISearchBarTextFieldTokenCounter *)self characterIndexForSelectingOrRemovingTokenAtIndex:a3 - 1]+ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)characterIndexForSelectingOrRemovingTokenAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableIndexSet *)self->_tokenCharacterIndexes count];
  if (v5 < a3) {
    ThrowRangeException(a3, v5);
  }
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  uint64_t v10 = 0;
  NSUInteger v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  tokenCharacterIndexes = self->_tokenCharacterIndexes;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86___UISearchBarTextFieldTokenCounter_characterIndexForSelectingOrRemovingTokenAtIndex___block_invoke;
  v9[3] = &unk_1E5303DD8;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = v14;
  [(NSMutableIndexSet *)tokenCharacterIndexes enumerateIndexesUsingBlock:v9];
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  return v7;
}

- (_NSRange)subrangeOfTextAfterLastTokenForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = a3.location - [(NSMutableIndexSet *)self->_tokenCharacterIndexes count];
  NSUInteger v5 = length;
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (_NSRange)characterRangeForSubrangeOfTextAfterLastToken:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(NSMutableIndexSet *)self->_tokenCharacterIndexes count];
  unint64_t v7 = [(NSTextStorage *)self->_textStorage length];
  if (v6) {
    location += [(_UISearchBarTextFieldTokenCounter *)self characterIndexForInsertingTokenAtIndex:v6];
  }
  if (location >= v7) {
    NSUInteger v8 = v7;
  }
  else {
    NSUInteger v8 = location;
  }
  if (length >= v7 - v8) {
    NSUInteger v9 = v7 - v8;
  }
  else {
    NSUInteger v9 = length;
  }
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (id)tokenAtCharacterIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSTextStorage *)self->_textStorage attribute:*(void *)off_1E52D1F50 atIndex:a3 effectiveRange:0];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NSUInteger v4 = [v3 token];
  }
  else
  {
    NSUInteger v4 = 0;
  }

  return v4;
}

- (unint64_t)indexOfTokenAtCharacterIndex:(unint64_t)a3
{
  if ((-[NSMutableIndexSet containsIndex:](self->_tokenCharacterIndexes, "containsIndex:") & 1) == 0)
  {
    NSUInteger v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UISearchBarTextFieldTokenCounter.m", 194, @"Asked for token at character index %lu which is not in set %@", a3, self->_tokenCharacterIndexes object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
LABEL_3:
  tokenCharacterIndexes = self->_tokenCharacterIndexes;
  return -[NSMutableIndexSet countOfIndexesInRange:](tokenCharacterIndexes, "countOfIndexesInRange:", 0, a3 - 1);
}

@end