@interface PSIQueryToken
+ (BOOL)supportsSecureCoding;
+ (id)personQueryTokensFromSocialGroupQueryToken:(id)a3;
+ (id)stringForMatchType:(unint64_t)a3;
- (BOOL)belongsToSearchText;
- (BOOL)containsMarker;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFilterTypeToken;
- (BOOL)isFullTextToken;
- (BOOL)isTextSearchable;
- (BOOL)scopedSearchEnabled;
- (BOOL)userControlledCategoriesUseWildcard;
- (BOOL)usesWordEmbeddings;
- (NSDictionary)dateAttributes;
- (NSDictionary)debugDictionary;
- (NSIndexSet)searchedCategories;
- (NSMutableSet)assetIds;
- (NSMutableSet)collectionIds;
- (NSString)groupMatchingText;
- (NSString)identifier;
- (NSString)normalizedText;
- (NSString)resolvedText;
- (NSString)suggestionText;
- (NSString)text;
- (NSString)wildcardResolvedText;
- (PSIQueryToken)initWithCoder:(id)a3;
- (PSIQueryToken)initWithIdentifier:(id)a3 userCategory:(unint64_t)a4;
- (PSIQueryToken)initWithIdentifier:(id)a3 userCategory:(unint64_t)a4 searchedCategories:(id)a5;
- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 identifier:(id)a5 userCategory:(unint64_t)a6 searchedCategories:(id)a7 matchType:(unint64_t)a8;
- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 userCategory:(unint64_t)a5 matchType:(unint64_t)a6;
- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 userCategory:(unint64_t)a5 searchedCategories:(id)a6 matchType:(unint64_t)a7;
- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 matchType:(unint64_t)a5;
- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 searchCategories:(id)a5 matchType:(unint64_t)a6 assetCount:(unint64_t)a7 collectionCount:(unint64_t)a8;
- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 searchedCategories:(id)a5 matchType:(unint64_t)a6;
- (PSIQueryToken)parentToken;
- (PSIWordEmbeddingMatch)wordEmbeddingMatch;
- (_NSRange)rangeInSearchText;
- (id)description;
- (id)tokenByWordEmbeddingWithMatch:(id)a3;
- (unint64_t)assetCount;
- (unint64_t)assetCountV2;
- (unint64_t)collectionCount;
- (unint64_t)collectionCountV2;
- (unint64_t)hash;
- (unint64_t)matchType;
- (unint64_t)resultCount;
- (unint64_t)userCategory;
- (void)encodeWithCoder:(id)a3;
- (void)normalizeTextWithTokenizer:(id)a3;
- (void)setAssetCountV2:(unint64_t)a3;
- (void)setAssetIds:(id)a3;
- (void)setBelongsToSearchText:(BOOL)a3;
- (void)setCollectionCountV2:(unint64_t)a3;
- (void)setCollectionIds:(id)a3;
- (void)setDateAttributes:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsFilterTypeToken:(BOOL)a3;
- (void)setIsFullTextToken:(BOOL)a3;
- (void)setNormalizedText:(id)a3;
- (void)setParentToken:(id)a3;
- (void)setRangeInSearchText:(_NSRange)a3;
- (void)setScopedSearchEnabled:(BOOL)a3;
- (void)setSearchedCategories:(id)a3;
- (void)setText:(id)a3;
- (void)setUserCategory:(unint64_t)a3;
- (void)setUserControlledCategoriesUseWildcard:(BOOL)a3;
- (void)setUsesWordEmbeddings:(BOOL)a3;
- (void)setWordEmbeddingMatch:(id)a3;
@end

@implementation PSIQueryToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAttributes, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_assetIds, 0);
  objc_storeStrong((id *)&self->_wordEmbeddingMatch, 0);
  objc_storeStrong((id *)&self->_normalizedText, 0);
  objc_storeStrong((id *)&self->_parentToken, 0);
  objc_storeStrong((id *)&self->_searchedCategories, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (PSIQueryToken)initWithIdentifier:(id)a3 userCategory:(unint64_t)a4
{
  id v6 = a3;
  v7 = PLSearchedCategoriesForUserCategory(a4);
  v8 = [(PSIQueryToken *)self initWithIdentifier:v6 userCategory:a4 searchedCategories:v7];

  return v8;
}

- (PSIQueryToken)initWithIdentifier:(id)a3 userCategory:(unint64_t)a4 searchedCategories:(id)a5
{
  v5 = [(PSIQueryToken *)self initWithText:0 normalizedText:0 identifier:a3 userCategory:a4 searchedCategories:a5 matchType:2];
  id v6 = v5;
  if (v5) {
    [(PSIQueryToken *)v5 setUserControlledCategoriesUseWildcard:0];
  }
  return v6;
}

- (void)setUserControlledCategoriesUseWildcard:(BOOL)a3
{
  self->_userControlledCategoriesUseWildcard = a3;
}

- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 identifier:(id)a5 userCategory:(unint64_t)a6 searchedCategories:(id)a7 matchType:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PSIQueryToken;
  v18 = [(PSIQueryToken *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    text = v18->_text;
    v18->_text = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    normalizedText = v18->_normalizedText;
    v18->_normalizedText = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v23;

    if ([v17 count])
    {
      uint64_t v25 = [v17 copy];
      searchedCategories = v18->_searchedCategories;
      v18->_searchedCategories = (NSIndexSet *)v25;
    }
    else
    {
      searchedCategories = v18->_searchedCategories;
      v18->_searchedCategories = 0;
    }

    v18->_userCategory = a6;
    v18->_matchType = a8;
    v18->_userControlledCategoriesUseWildcard = 1;
  }

  return v18;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PSIQueryToken)parentToken
{
  return self->_parentToken;
}

- (BOOL)isTextSearchable
{
  v2 = [(PSIQueryToken *)self text];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)containsMarker
{
  v2 = [(PSIQueryToken *)self identifier];
  char v3 = [v2 containsString:@","];

  return v3;
}

- (void)setDateAttributes:(id)a3
{
}

- (NSDictionary)dateAttributes
{
  return self->_dateAttributes;
}

- (void)setCollectionIds:(id)a3
{
}

- (NSMutableSet)collectionIds
{
  return self->_collectionIds;
}

- (void)setAssetIds:(id)a3
{
}

- (NSMutableSet)assetIds
{
  return self->_assetIds;
}

- (void)setBelongsToSearchText:(BOOL)a3
{
  self->_belongsToSearchText = a3;
}

- (BOOL)belongsToSearchText
{
  return self->_belongsToSearchText;
}

- (void)setIsFullTextToken:(BOOL)a3
{
  self->_isFullTextToken = a3;
}

- (BOOL)isFullTextToken
{
  return self->_isFullTextToken;
}

- (void)setWordEmbeddingMatch:(id)a3
{
}

- (PSIWordEmbeddingMatch)wordEmbeddingMatch
{
  return self->_wordEmbeddingMatch;
}

- (void)setNormalizedText:(id)a3
{
}

- (NSString)normalizedText
{
  return self->_normalizedText;
}

- (void)setCollectionCountV2:(unint64_t)a3
{
  self->_collectionCountV2 = a3;
}

- (unint64_t)collectionCountV2
{
  return self->_collectionCountV2;
}

- (void)setAssetCountV2:(unint64_t)a3
{
  self->_assetCountV2 = a3;
}

- (unint64_t)assetCountV2
{
  return self->_assetCountV2;
}

- (void)setScopedSearchEnabled:(BOOL)a3
{
  self->_scopedSearchEnabled = a3;
}

- (BOOL)scopedSearchEnabled
{
  return self->_scopedSearchEnabled;
}

- (void)setParentToken:(id)a3
{
}

- (void)setRangeInSearchText:(_NSRange)a3
{
  self->_rangeInSearchText = a3;
}

- (_NSRange)rangeInSearchText
{
  NSUInteger length = self->_rangeInSearchText.length;
  NSUInteger location = self->_rangeInSearchText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setIsFilterTypeToken:(BOOL)a3
{
  self->_isFilterTypeToken = a3;
}

- (BOOL)isFilterTypeToken
{
  return self->_isFilterTypeToken;
}

- (void)setUsesWordEmbeddings:(BOOL)a3
{
  self->_usesWordEmbeddings = a3;
}

- (BOOL)usesWordEmbeddings
{
  return self->_usesWordEmbeddings;
}

- (BOOL)userControlledCategoriesUseWildcard
{
  return self->_userControlledCategoriesUseWildcard;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (void)setUserCategory:(unint64_t)a3
{
  self->_userCategory = a3;
}

- (unint64_t)userCategory
{
  return self->_userCategory;
}

- (void)setSearchedCategories:(id)a3
{
}

- (NSIndexSet)searchedCategories
{
  return self->_searchedCategories;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setText:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v6 = a3;
  [v6 encodeObject:text forKey:@"text"];
  [v6 encodeObject:self->_normalizedText forKey:@"normalizedText"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  [v6 encodeObject:self->_searchedCategories forKey:@"searchedCategories"];
  [v6 encodeInteger:self->_matchType forKey:@"matchType"];
  [v6 encodeBool:self->_userControlledCategoriesUseWildcard forKey:@"userControlledCategoriesUseWildcard"];
  [v6 encodeBool:self->_usesWordEmbeddings forKey:@"usesWordEmbeddings"];
  [v6 encodeObject:self->_wordEmbeddingMatch forKey:@"wordEmbeddingMatch"];
  [v6 encodeBool:self->_isFullTextToken forKey:@"isFullTextToken"];
  [v6 encodeBool:self->_belongsToSearchText forKey:@"belongsToSearchText"];
  v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_rangeInSearchText.location, self->_rangeInSearchText.length);
  [v6 encodeObject:v5 forKey:@"rangeInSearchText"];

  [v6 encodeObject:self->_parentToken forKey:@"parentToken"];
  [v6 encodeInteger:self->_userCategory forKey:@"userCategory"];
}

- (PSIQueryToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PSIQueryToken;
  v5 = [(PSIQueryToken *)&v25 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    uint64_t v7 = [v6 copy];
    text = v5->_text;
    v5->_text = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"normalizedText"];
    uint64_t v10 = [v9 copy];
    normalizedText = v5->_normalizedText;
    v5->_normalizedText = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v13 = [v12 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchedCategories"];
    uint64_t v16 = [v15 copy];
    searchedCategories = v5->_searchedCategories;
    v5->_searchedCategories = (NSIndexSet *)v16;

    v5->_matchType = [v4 decodeIntegerForKey:@"matchType"];
    v5->_userControlledCategoriesUseWildcard = [v4 decodeBoolForKey:@"userControlledCategoriesUseWildcard"];
    v5->_usesWordEmbeddings = [v4 decodeBoolForKey:@"usesWordEmbeddings"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wordEmbeddingMatch"];
    wordEmbeddingMatch = v5->_wordEmbeddingMatch;
    v5->_wordEmbeddingMatch = (PSIWordEmbeddingMatch *)v18;

    v5->_isFullTextToken = [v4 decodeBoolForKey:@"isFullTextToken"];
    v5->_belongsToSearchText = [v4 decodeBoolForKey:@"belongsToSearchText"];
    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rangeInSearchText"];
    v5->_rangeInSearchText.NSUInteger location = [v20 rangeValue];
    v5->_rangeInSearchText.NSUInteger length = v21;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentToken"];
    parentToken = v5->_parentToken;
    v5->_parentToken = (PSIQueryToken *)v22;

    v5->_userCategory = [v4 decodeIntegerForKey:@"userCategory"];
  }

  return v5;
}

- (NSString)suggestionText
{
  if ([(PSIQueryToken *)self userCategory] == 1
    || [(PSIQueryToken *)self userCategory] == 6)
  {
    char v3 = PLServicesLocalizedFrameworkString();
    id v6 = [(PSIQueryToken *)self text];
    id v4 = PFStringWithValidatedFormat();
  }
  else
  {
    id v4 = [(PSIQueryToken *)self text];
  }
  return (NSString *)v4;
}

- (NSDictionary)debugDictionary
{
  v33[13] = *MEMORY[0x1E4F143B8];
  v32[0] = @"class";
  char v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  text = (__CFString *)self->_text;
  identifier = (__CFString *)self->_identifier;
  if (!text) {
    text = @"nil";
  }
  v33[0] = v4;
  v33[1] = text;
  v32[1] = @"text";
  v32[2] = @"normalizedText";
  normalizedText = (__CFString *)self->_normalizedText;
  if (!normalizedText) {
    normalizedText = @"nil";
  }
  if (!identifier) {
    identifier = @"nil";
  }
  v33[2] = normalizedText;
  v33[3] = identifier;
  v32[3] = @"identifier";
  v32[4] = @"userCategory";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_userCategory, v4);
  v33[4] = v8;
  v32[5] = @"searchedCategories";
  v9 = self->_searchedCategories;
  uint64_t v10 = objc_opt_new();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __32__PSIQueryToken_debugDictionary__block_invoke_3;
  v30[3] = &unk_1E58739B0;
  id v31 = v10;
  id v11 = v10;
  [(NSIndexSet *)v9 enumerateIndexesUsingBlock:v30];

  v12 = (__CFString *)[v11 copy];
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = @"nil";
  }
  v33[5] = v13;
  v32[6] = @"matchType";
  uint64_t v14 = [(id)objc_opt_class() stringForMatchType:self->_matchType];
  id v15 = (void *)v14;
  if (self->_userControlledCategoriesUseWildcard) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  v33[6] = v14;
  v33[7] = v16;
  v32[7] = @"userControlledCategoriesUseWildcard";
  v32[8] = @"useWordEmbeddings";
  if (self->_usesWordEmbeddings) {
    id v17 = @"YES";
  }
  else {
    id v17 = @"NO";
  }
  v33[8] = v17;
  v32[9] = @"isTextSearchable";
  uint64_t v18 = v17;
  uint64_t v19 = v16;
  if ([(PSIQueryToken *)self isTextSearchable]) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  v33[9] = v20;
  v32[10] = @"groupMatchingText";
  NSUInteger v21 = v20;
  uint64_t v22 = [(PSIQueryToken *)self groupMatchingText];
  uint64_t v23 = (void *)v22;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = @"nil";
  }
  v33[10] = v24;
  v32[11] = @"assetIdsCount";
  objc_super v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](self->_assetIds, "count"));
  v33[11] = v25;
  v32[12] = @"collectionIdCount";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](self->_collectionIds, "count"));
  v33[12] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:13];

  return (NSDictionary *)v27;
}

void __32__PSIQueryToken_debugDictionary__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@.%p\n", v5, self];

  [v6 appendFormat:@" text:%@\n", self->_text];
  [v6 appendFormat:@" normalizedText:%@\n", self->_normalizedText];
  [v6 appendFormat:@" identifier:%@\n", self->_identifier];
  if ([(PSIQueryToken *)self isFilterTypeToken]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  [v6 appendFormat:@" isFilterTypeToken:%@", v7];
  objc_msgSend(v6, "appendFormat:", @" userCategory:%lu\n", self->_userCategory);
  [v6 appendFormat:@" searchedCategories: %@\n", self->_searchedCategories];
  v8 = [(id)objc_opt_class() stringForMatchType:self->_matchType];
  [v6 appendFormat:@" matchType:%@\n", v8];

  if ([(PSIQueryToken *)self userControlledCategoriesUseWildcard]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v6 appendFormat:@" userControlledCategoriesUseWildcard:%@\n", v9];
  if (self->_usesWordEmbeddings) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  [v6 appendFormat:@" useWordEmbeddings:%@\n", v10];
  if ([(PSIQueryToken *)self isTextSearchable]) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  [v6 appendFormat:@" isTextSearchable:%@\n", v11];
  v12 = [(PSIQueryToken *)self groupMatchingText];
  [v6 appendFormat:@" groupMatchingText:%@\n", v12];

  objc_msgSend(v6, "appendFormat:", @" assetIdsCount:%lu\n", -[NSMutableSet count](self->_assetIds, "count"));
  objc_msgSend(v6, "appendFormat:", @" collectionIdCount:%lu\n", -[NSMutableSet count](self->_collectionIds, "count"));
  [v6 appendFormat:@">\n"];
  return v6;
}

- (id)tokenByWordEmbeddingWithMatch:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithText:self->_text normalizedText:self->_normalizedText identifier:self->_identifier userCategory:self->_userCategory searchedCategories:self->_searchedCategories matchType:2];
  [v5 setUsesWordEmbeddings:self->_usesWordEmbeddings];
  [v5 setWordEmbeddingMatch:v4];

  return v5;
}

- (NSString)wildcardResolvedText
{
  if (self->_userControlledCategoriesUseWildcard) {
    goto LABEL_2;
  }
  unint64_t matchType = self->_matchType;
  if (matchType - 1 < 2)
  {
    v5 = [(PSIQueryToken *)self resolvedText];
    v2 = [v5 stringByAppendingString:@"*"];
  }
  else
  {
    if (matchType == 3)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v6 = 0;
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Should not be calling wildcardResolvedText on matchType DateFilter", v6, 2u);
      }
    }
    else if (!matchType)
    {
LABEL_2:
      v2 = [(PSIQueryToken *)self resolvedText];
      goto LABEL_3;
    }
    v2 = 0;
  }
LABEL_3:
  return (NSString *)v2;
}

- (NSString)groupMatchingText
{
  text = [(PSIWordEmbeddingMatch *)self->_wordEmbeddingMatch word];
  id v4 = text;
  if (!text) {
    text = self->_text;
  }
  v5 = text;

  return v5;
}

- (unint64_t)resultCount
{
  unint64_t v3 = [(PSIQueryToken *)self assetCount];
  unint64_t result = [(PSIQueryToken *)self collectionCount];
  if (v3) {
    return v3;
  }
  return result;
}

- (unint64_t)collectionCount
{
  if ([(PSIQueryToken *)self scopedSearchEnabled])
  {
    return [(PSIQueryToken *)self collectionCountV2];
  }
  else
  {
    collectionIds = self->_collectionIds;
    return [(NSMutableSet *)collectionIds count];
  }
}

- (unint64_t)assetCount
{
  if ([(PSIQueryToken *)self scopedSearchEnabled])
  {
    return [(PSIQueryToken *)self assetCountV2];
  }
  else
  {
    assetIds = self->_assetIds;
    return [(NSMutableSet *)assetIds count];
  }
}

- (NSString)resolvedText
{
  unint64_t matchType = self->_matchType;
  if (matchType
    && self->_userControlledCategoriesUseWildcard
    && PLUserControlledCategoriesIntersectsSearchedCategories(self->_searchedCategories))
  {
    unint64_t matchType = 0;
  }
  normalizedText = self->_normalizedText;
  return (NSString *)+[PSITokenizer fts5StringFromString:normalizedText forMatchType:matchType];
}

- (void)normalizeTextWithTokenizer:(id)a3
{
  id v4 = a3;
  id v6 = [(PSIQueryToken *)self text];
  v5 = [v4 normalizeString:v6];

  [(PSIQueryToken *)self setNormalizedText:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  text = self->_text;
  id v6 = [v4 text];
  char v7 = [text isEqualToString:v6];
  if ((v7 & 1) == 0)
  {
    identifier = self->_identifier;
    text = [v4 identifier];
    if (![(NSString *)identifier isEqualToString:text])
    {
      char v13 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  searchedCategories = self->_searchedCategories;
  uint64_t v10 = [v4 searchedCategories];
  if (searchedCategories == v10)
  {
    char v13 = 1;
  }
  else
  {
    id v11 = self->_searchedCategories;
    v12 = [v4 searchedCategories];
    char v13 = [(NSIndexSet *)v11 isEqualToIndexSet:v12];
  }
  if ((v7 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_10:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  return v4 ^ [(NSIndexSet *)self->_searchedCategories hash] ^ self->_userCategory;
}

- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 searchCategories:(id)a5 matchType:(unint64_t)a6 assetCount:(unint64_t)a7 collectionCount:(unint64_t)a8
{
  unint64_t result = [(PSIQueryToken *)self initWithText:a3 normalizedText:0 identifier:0 userCategory:a4 searchedCategories:a5 matchType:a6];
  if (result)
  {
    result->_scopedSearchEnabled = 1;
    result->_assetCountV2 = a7;
    result->_collectionCountV2 = a8;
  }
  return result;
}

- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 userCategory:(unint64_t)a5 searchedCategories:(id)a6 matchType:(unint64_t)a7
{
  return [(PSIQueryToken *)self initWithText:a3 normalizedText:a4 identifier:0 userCategory:a5 searchedCategories:a6 matchType:a7];
}

- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 userCategory:(unint64_t)a5 matchType:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = PLSearchedCategoriesForUserCategory(a5);
  char v13 = [(PSIQueryToken *)self initWithText:v11 normalizedText:v10 identifier:0 userCategory:a5 searchedCategories:v12 matchType:a6];

  return v13;
}

- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 searchedCategories:(id)a5 matchType:(unint64_t)a6
{
  return [(PSIQueryToken *)self initWithText:a3 normalizedText:0 identifier:0 userCategory:a4 searchedCategories:a5 matchType:a6];
}

- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 matchType:(unint64_t)a5
{
  id v8 = a3;
  v9 = PLSearchedCategoriesForUserCategory(a4);
  id v10 = [(PSIQueryToken *)self initWithText:v8 normalizedText:0 identifier:0 userCategory:a4 searchedCategories:v9 matchType:a5];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringForMatchType:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return *(&off_1E58703C8 + a3);
  }
}

+ (id)personQueryTokensFromSocialGroupQueryToken:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [a3 identifier];
  NSUInteger v4 = [v3 componentsSeparatedByString:@","];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [PSIQueryToken alloc];
        char v13 = -[PSIQueryToken initWithIdentifier:userCategory:](v12, "initWithIdentifier:userCategory:", v11, 1, (void)v15);
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

@end