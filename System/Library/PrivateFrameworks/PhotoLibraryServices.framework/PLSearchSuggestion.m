@interface PLSearchSuggestion
- (BOOL)isEqual:(id)a3;
- (NSArray)suggestionComponents;
- (NSString)contentString;
- (NSString)matchedText;
- (PLSearchSuggestion)initWithContentString:(id)a3 categoriesType:(unint64_t)a4 suggestionType:(unint64_t)a5 matchedAssetsCount:(unint64_t)a6 matchedCollectionsCount:(unint64_t)a7 matchedText:(id)a8 matchRangeOfSearchText:(_NSRange)a9 suggestionComponents:(id)a10;
- (_NSRange)matchRangeOfSearchText;
- (float)score;
- (id)description;
- (unint64_t)categoriesType;
- (unint64_t)hash;
- (unint64_t)matchedAssetsCount;
- (unint64_t)matchedCollectionsCount;
- (unint64_t)suggestionType;
@end

@implementation PLSearchSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionComponents, 0);
  objc_storeStrong((id *)&self->_matchedText, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
}

- (NSArray)suggestionComponents
{
  return self->_suggestionComponents;
}

- (_NSRange)matchRangeOfSearchText
{
  NSUInteger length = self->_matchRangeOfSearchText.length;
  NSUInteger location = self->_matchRangeOfSearchText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)matchedText
{
  return self->_matchedText;
}

- (unint64_t)matchedCollectionsCount
{
  return self->_matchedCollectionsCount;
}

- (unint64_t)matchedAssetsCount
{
  return self->_matchedAssetsCount;
}

- (unint64_t)suggestionType
{
  return self->_suggestionType;
}

- (unint64_t)categoriesType
{
  return self->_categoriesType;
}

- (NSString)contentString
{
  return self->_contentString;
}

- (id)description
{
  unint64_t v3 = [(PLSearchSuggestion *)self categoriesType];
  if (v3 - 1 > 0x28) {
    v4 = @"PLSearchSuggestionCategoriesTypeUndefined";
  }
  else {
    v4 = off_1E586DC20[v3 - 1];
  }
  v5 = v4;
  unint64_t v6 = [(PLSearchSuggestion *)self suggestionType];
  if (v6 - 1 > 3) {
    v7 = @"PLSearchSuggestionTypeNone";
  }
  else {
    v7 = off_1E5869EC8[v6 - 1];
  }
  v8 = v7;
  v21.NSUInteger location = [(PLSearchSuggestion *)self matchRangeOfSearchText];
  v9 = NSStringFromRange(v21);
  v10 = NSString;
  v11 = [(PLSearchSuggestion *)self contentString];
  unint64_t v12 = [(PLSearchSuggestion *)self matchedAssetsCount];
  unint64_t v13 = [(PLSearchSuggestion *)self matchedCollectionsCount];
  v14 = [(PLSearchSuggestion *)self matchedText];
  [(PLSearchSuggestion *)self score];
  double v16 = v15;
  v17 = [(PLSearchSuggestion *)self suggestionComponents];
  v18 = [v10 stringWithFormat:@"content string: %@, categories type: %@, suggestion type: %@, matched assets count: %tu, matched collections count: %tu, match text: %@, match range of search text: %@, score: %f, suggestion components: %@", v11, v5, v8, v12, v13, v14, v9, *(void *)&v16, v17];

  return v18;
}

- (unint64_t)hash
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PLSearchSuggestion *)self contentString];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(PLSearchSuggestion *)self categoriesType];
  unint64_t v6 = v5 ^ [(PLSearchSuggestion *)self suggestionType] ^ v4;
  unint64_t v7 = [(PLSearchSuggestion *)self matchedAssetsCount];
  unint64_t v8 = v7 ^ [(PLSearchSuggestion *)self matchedCollectionsCount];
  v9 = [(PLSearchSuggestion *)self matchedText];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  [(PLSearchSuggestion *)self matchRangeOfSearchText];
  unint64_t v12 = v10 ^ v11 ^ [(PLSearchSuggestion *)self matchRangeOfSearchText];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v13 = [(PLSearchSuggestion *)self suggestionComponents];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        v12 ^= [*(id *)(*((void *)&v19 + 1) + 8 * v17++) hash];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(PLSearchSuggestion *)self contentString];
    unint64_t v7 = [v5 contentString];
    char v36 = [v6 isEqualToString:v7];

    unint64_t v35 = [(PLSearchSuggestion *)self categoriesType];
    uint64_t v34 = [v5 categoriesType];
    unint64_t v33 = [(PLSearchSuggestion *)self suggestionType];
    uint64_t v32 = [v5 suggestionType];
    unint64_t v31 = [(PLSearchSuggestion *)self matchedAssetsCount];
    uint64_t v30 = [v5 matchedAssetsCount];
    unint64_t v29 = [(PLSearchSuggestion *)self matchedCollectionsCount];
    uint64_t v8 = [v5 matchedCollectionsCount];
    v9 = [(PLSearchSuggestion *)self matchedText];
    uint64_t v10 = [v5 matchedText];
    char v11 = [v9 isEqualToString:v10];

    uint64_t v12 = [(PLSearchSuggestion *)self matchRangeOfSearchText];
    uint64_t v14 = v13;
    uint64_t v15 = [v5 matchRangeOfSearchText];
    uint64_t v17 = v16;
    [(PLSearchSuggestion *)self score];
    float v19 = v18;
    [v5 score];
    float v21 = v20;
    long long v22 = [(PLSearchSuggestion *)self suggestionComponents];
    v23 = [v5 suggestionComponents];

    char v24 = [v22 isEqualToArray:v23];
    char v25 = v36;
    if (v35 != v34) {
      char v25 = 0;
    }
    if (v33 != v32) {
      char v25 = 0;
    }
    if (v31 != v30) {
      char v25 = 0;
    }
    if (v29 != v8) {
      char v25 = 0;
    }
    char v26 = v25 & v11;
    if (v12 != v15) {
      char v26 = 0;
    }
    if (v14 != v17) {
      char v26 = 0;
    }
    if (v19 != v21) {
      char v26 = 0;
    }
    char v27 = v26 & v24;
  }
  else
  {
    char v27 = 0;
  }

  return v27;
}

- (float)score
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v3 = [(PLSearchSuggestion *)self suggestionComponents];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    float v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) score];
        float v7 = v7 + v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }

  uint64_t v10 = [(PLSearchSuggestion *)self suggestionComponents];
  unint64_t v11 = [v10 count];

  return v7 / (float)v11;
}

- (PLSearchSuggestion)initWithContentString:(id)a3 categoriesType:(unint64_t)a4 suggestionType:(unint64_t)a5 matchedAssetsCount:(unint64_t)a6 matchedCollectionsCount:(unint64_t)a7 matchedText:(id)a8 matchRangeOfSearchText:(_NSRange)a9 suggestionComponents:(id)a10
{
  id v17 = a3;
  id v18 = a8;
  id v19 = a10;
  if (![v17 length])
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLSearchSuggestion.m", 15, @"Invalid parameter not satisfying: %@", @"contentString.length > 0" object file lineNumber description];
  }
  if (![v19 count])
  {
    unint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PLSearchSuggestion.m", 16, @"Invalid parameter not satisfying: %@", @"suggestionComponents.count > 0" object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)PLSearchSuggestion;
  float v20 = [(PLSearchSuggestion *)&v30 init];
  if (v20)
  {
    uint64_t v21 = [v17 copy];
    contentString = v20->_contentString;
    v20->_contentString = (NSString *)v21;

    v20->_categoriesType = a4;
    v20->_suggestionType = a5;
    v20->_matchedAssetsCount = a6;
    v20->_matchedCollectionsCount = a7;
    uint64_t v23 = [v18 copy];
    matchedText = v20->_matchedText;
    v20->_matchedText = (NSString *)v23;

    v20->_matchRangeOfSearchText = a9;
    uint64_t v25 = [v19 copy];
    suggestionComponents = v20->_suggestionComponents;
    v20->_suggestionComponents = (NSArray *)v25;
  }
  return v20;
}

@end