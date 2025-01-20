@interface SBHIconLibraryQuery
+ (BOOL)string:(id)a3 matchesSearchString:(id)a4;
- (BOOL)_hasSearchString;
- (BOOL)isEqual:(id)a3;
- (NSArray)markedTextArray;
- (NSPredicate)predicate;
- (NSString)keyboardLanguageHint;
- (NSString)searchString;
- (SBHIconLibraryQuery)init;
- (SBHIconLibraryQuery)initWithMarkedTextSearchString:(id)a3 markedTextRange:(id)a4 markedTextArray:(id)a5;
- (SBHIconLibraryQuery)initWithSearchString:(id)a3;
- (UITextRange)markedTextRange;
- (id)_composeComparator:(id)a3 andComparator:(id)a4;
- (id)aToZComparator;
- (id)comparator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)prefixComparator;
- (unint64_t)hash;
- (void)setKeyboardLanguageHint:(id)a3;
@end

@implementation SBHIconLibraryQuery

- (SBHIconLibraryQuery)initWithSearchString:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHIconLibraryQuery;
  v5 = [(SBHIconLibraryQuery *)&v13 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v7 = _SBHIconLibraryQueryCanonicalizedString(v4, @" ", v6);
    uint64_t v8 = [v7 copy];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    queryId = v5->_queryId;
    v5->_queryId = (NSUUID *)v10;
  }
  return v5;
}

- (SBHIconLibraryQuery)initWithMarkedTextSearchString:(id)a3 markedTextRange:(id)a4 markedTextArray:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBHIconLibraryQuery;
  v11 = [(SBHIconLibraryQuery *)&v23 init];
  v12 = v11;
  if (v11)
  {
    if (v11->_markedTextRange || v11->_markedTextArray)
    {
      uint64_t v13 = [v9 copy];
      markedTextRange = v12->_markedTextRange;
      v12->_markedTextRange = (UITextRange *)v13;

      uint64_t v15 = [v10 copy];
      markedTextArray = v12->_markedTextArray;
      v12->_markedTextArray = (NSArray *)v15;

      uint64_t v17 = [v8 copy];
      searchString = v12->_searchString;
      v12->_searchString = (NSString *)v17;
    }
    else
    {
      searchString = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v20 = _SBHIconLibraryQueryCanonicalizedString(v8, @" ", searchString);
      uint64_t v21 = [v20 copy];
      v22 = v12->_searchString;
      v12->_searchString = (NSString *)v21;
    }
  }

  return v12;
}

- (SBHIconLibraryQuery)init
{
  return 0;
}

- (NSPredicate)predicate
{
  predicate = self->_predicate;
  if (!predicate)
  {
    objc_initWeak(&location, self);
    BOOL v4 = [(SBHIconLibraryQuery *)self _hasSearchString];
    v5 = (void *)MEMORY[0x1E4F28F60];
    if (v4)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __32__SBHIconLibraryQuery_predicate__block_invoke;
      v11[3] = &unk_1E6AB3290;
      objc_copyWeak(&v12, &location);
      v6 = [v5 predicateWithBlock:v11];
      v7 = self->_predicate;
      self->_predicate = v6;

      objc_destroyWeak(&v12);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
      id v9 = self->_predicate;
      self->_predicate = v8;
    }
    objc_destroyWeak(&location);
    predicate = self->_predicate;
  }
  return predicate;
}

uint64_t __32__SBHIconLibraryQuery_predicate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained[3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v3, "iconLibraryQueryingFilterStrings", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([(id)objc_opt_class() string:*(void *)(*((void *)&v11 + 1) + 8 * i) matchesSearchString:v5])
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)string:(id)a3 matchesSearchString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 localizedCaseInsensitiveContainsString:v6];
  if ((v7 & 1) != 0
    || (__50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke(v7, v5),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        __50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke((uint64_t)v8, v6),
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 localizedCaseInsensitiveContainsString:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    char v11 = 1;
  }
  else
  {
    long long v12 = [MEMORY[0x1E4F28E58] punctuationCharacterSet];
    long long v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    [v12 formUnionWithCharacterSet:v13];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke_2;
    aBlock[3] = &unk_1E6AB32B8;
    id v20 = v12;
    id v14 = v12;
    uint64_t v15 = (void (**)(void *, id))_Block_copy(aBlock);
    uint64_t v16 = v15[2](v15, v5);
    uint64_t v17 = v15[2](v15, v6);
    char v11 = [v16 localizedCaseInsensitiveContainsString:v17];
  }
  return v11;
}

id __50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28B88];
  id v3 = a2;
  BOOL v4 = [v2 whitespaceAndNewlineCharacterSet];
  id v5 = _SBHIconLibraryQueryCanonicalizedString(v3, &stru_1F2FA0300, v4);

  return v5;
}

id __50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  return _SBHIconLibraryQueryCanonicalizedString(a2, &stru_1F2FA0300, *(void **)(a1 + 32));
}

- (id)aToZComparator
{
  return &__block_literal_global_11_0;
}

uint64_t __37__SBHIconLibraryQuery_aToZComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 iconLibraryQueryingAlphaSortString];
  id v6 = [v4 iconLibraryQueryingAlphaSortString];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)prefixComparator
{
  v2 = (void *)[(NSString *)self->_searchString copy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__SBHIconLibraryQuery_prefixComparator__block_invoke;
  aBlock[3] = &unk_1E6AB32E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = _Block_copy(aBlock);

  return v4;
}

uint64_t __39__SBHIconLibraryQuery_prefixComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 iconLibraryQueryingAlphaSortString];
  id v7 = [v5 iconLibraryQueryingAlphaSortString];

  uint64_t v8 = [v6 localizedStandardRangeOfString:*(void *)(a1 + 32)];
  int v9 = (v8 == 0) ^ ([v7 localizedStandardRangeOfString:*(void *)(a1 + 32)] != 0);
  uint64_t v10 = -1;
  if (v8) {
    uint64_t v10 = 1;
  }
  if (v9) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }

  return v11;
}

- (id)_composeComparator:(id)a3 andComparator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__SBHIconLibraryQuery__composeComparator_andComparator___block_invoke;
  v11[3] = &unk_1E6AB3308;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  int v9 = _Block_copy(v11);

  return v9;
}

uint64_t __56__SBHIconLibraryQuery__composeComparator_andComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!v7) {
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v7;
}

- (id)comparator
{
  id v3 = [(SBHIconLibraryQuery *)self aToZComparator];
  if ([(SBHIconLibraryQuery *)self _hasSearchString])
  {
    id v4 = [(SBHIconLibraryQuery *)self prefixComparator];
    uint64_t v5 = [(SBHIconLibraryQuery *)self _composeComparator:v4 andComparator:v3];

    id v3 = (void *)v5;
  }
  id v6 = _Block_copy(v3);

  return v6;
}

- (BOOL)_hasSearchString
{
  return [(NSString *)self->_searchString length] != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = [(SBHIconLibraryQuery *)self searchString];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __31__SBHIconLibraryQuery_isEqual___block_invoke;
  v28[3] = &unk_1E6AB3330;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v28];

  int v9 = [(SBHIconLibraryQuery *)self keyboardLanguageHint];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __31__SBHIconLibraryQuery_isEqual___block_invoke_2;
  v26[3] = &unk_1E6AB3330;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendString:v9 counterpart:v26];

  id v12 = [(SBHIconLibraryQuery *)self markedTextRange];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __31__SBHIconLibraryQuery_isEqual___block_invoke_3;
  v24[3] = &unk_1E6AB3358;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendObject:v12 counterpart:v24];

  uint64_t v15 = [(SBHIconLibraryQuery *)self markedTextArray];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __31__SBHIconLibraryQuery_isEqual___block_invoke_4;
  v22 = &unk_1E6AB3358;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendObject:v15 counterpart:&v19];

  LOBYTE(v15) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);
  return (char)v15;
}

uint64_t __31__SBHIconLibraryQuery_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) searchString];
}

uint64_t __31__SBHIconLibraryQuery_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyboardLanguageHint];
}

uint64_t __31__SBHIconLibraryQuery_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) markedTextRange];
}

uint64_t __31__SBHIconLibraryQuery_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) markedTextArray];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(SBHIconLibraryQuery *)self searchString];
  id v5 = (id)[v3 appendString:v4];

  id v6 = [(SBHIconLibraryQuery *)self keyboardLanguageHint];
  id v7 = (id)[v3 appendString:v6];

  id v8 = [(SBHIconLibraryQuery *)self markedTextRange];
  id v9 = (id)[v3 appendObject:v8];

  id v10 = [(SBHIconLibraryQuery *)self markedTextArray];
  id v11 = (id)[v3 appendObject:v10];

  unint64_t v12 = [v3 hash];
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMarkedTextSearchString:self->_searchString markedTextRange:self->_markedTextRange markedTextArray:self->_markedTextArray];
  id v5 = [(SBHIconLibraryQuery *)self keyboardLanguageHint];
  [v4 setKeyboardLanguageHint:v5];

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_queryId withName:@"queryId"];
  id v5 = (id)[v3 appendObject:self->_markedTextRange withName:@"markedTextRange"];
  id v6 = (id)[v3 appendObject:self->_markedTextArray withName:@"markedTextArray"];
  id v7 = [v3 build];

  return v7;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)keyboardLanguageHint
{
  return self->_keyboardLanguageHint;
}

- (void)setKeyboardLanguageHint:(id)a3
{
}

- (UITextRange)markedTextRange
{
  return self->_markedTextRange;
}

- (NSArray)markedTextArray
{
  return self->_markedTextArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedTextArray, 0);
  objc_storeStrong((id *)&self->_markedTextRange, 0);
  objc_storeStrong((id *)&self->_keyboardLanguageHint, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_queryId, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end