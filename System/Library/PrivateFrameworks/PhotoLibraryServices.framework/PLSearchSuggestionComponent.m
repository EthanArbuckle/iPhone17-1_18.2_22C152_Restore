@interface PLSearchSuggestionComponent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)contentString;
- (NSString)lookupIdentifier;
- (NSString)matchedText;
- (PLSearchSuggestionComponent)initWithCoder:(id)a3;
- (PLSearchSuggestionComponent)initWithContentString:(id)a3 groupId:(unint64_t)a4 owningGroupId:(unint64_t)a5 matchedAssetsCount:(unint64_t)a6 matchedCollectionsCount:(unint64_t)a7 indexCategory:(unint64_t)a8 lookupIdentifier:(id)a9 score:(float)a10 suggestionType:(unint64_t)a11 matchedText:(id)a12 matchRangeOfSearchText:(_NSRange)a13;
- (PLSearchSuggestionComponent)initWithGroup:(id)a3 matchedAssetsCount:(unint64_t)a4 matchedCollectionsCount:(unint64_t)a5 suggestionType:(unint64_t)a6 matchedText:(id)a7 matchRangeOfSearchText:(_NSRange)a8;
- (PSIGroup)group;
- (_NSRange)matchRangeOfSearchText;
- (float)score;
- (id)description;
- (unint64_t)hash;
- (unint64_t)indexCategory;
- (unint64_t)matchedAssetsCount;
- (unint64_t)matchedCollectionsCount;
- (unint64_t)psiGroupId;
- (unint64_t)psiOwningGroupId;
- (unint64_t)suggestionType;
- (unint64_t)userCategory;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLSearchSuggestionComponent

- (PLSearchSuggestionComponent)initWithContentString:(id)a3 groupId:(unint64_t)a4 owningGroupId:(unint64_t)a5 matchedAssetsCount:(unint64_t)a6 matchedCollectionsCount:(unint64_t)a7 indexCategory:(unint64_t)a8 lookupIdentifier:(id)a9 score:(float)a10 suggestionType:(unint64_t)a11 matchedText:(id)a12 matchRangeOfSearchText:(_NSRange)a13
{
  id v20 = a3;
  id v21 = a9;
  id v22 = a12;
  if (![v20 length])
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PLSearchSuggestionComponent.m", 19, @"Invalid parameter not satisfying: %@", @"contentString.length > 0" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)PLSearchSuggestionComponent;
  v23 = [(PLSearchSuggestionComponent *)&v31 init];
  if (v23)
  {
    uint64_t v24 = [v20 copy];
    contentString = v23->_contentString;
    v23->_contentString = (NSString *)v24;

    v23->_psiGroupId = a4;
    v23->_psiOwningGroupId = a5;
    v23->_indexCategory = a8;
    uint64_t v26 = [v21 copy];
    lookupIdentifier = v23->_lookupIdentifier;
    v23->_lookupIdentifier = (NSString *)v26;

    v23->_score = a10;
    v23->_suggestionType = a11;
    v23->_matchedAssetsCount = a6;
    v23->_matchedCollectionsCount = a7;
    objc_storeStrong((id *)&v23->_matchedText, a12);
    v23->_matchRangeOfSearchText = a13;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_matchedText, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
}

- (PSIGroup)group
{
  return self->_group;
}

- (float)score
{
  return self->_score;
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (NSString)matchedText
{
  return self->_matchedText;
}

- (_NSRange)matchRangeOfSearchText
{
  NSUInteger length = self->_matchRangeOfSearchText.length;
  NSUInteger location = self->_matchRangeOfSearchText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)psiOwningGroupId
{
  return self->_psiOwningGroupId;
}

- (unint64_t)psiGroupId
{
  return self->_psiGroupId;
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

- (unint64_t)indexCategory
{
  return self->_indexCategory;
}

- (NSString)contentString
{
  return self->_contentString;
}

- (void)encodeWithCoder:(id)a3
{
  contentString = self->_contentString;
  id v14 = a3;
  [v14 encodeObject:contentString forKey:@"PLSearchSuggestionPropertyContentString"];
  v5 = [NSNumber numberWithUnsignedLongLong:self->_psiGroupId];
  [v14 encodeObject:v5 forKey:@"PLSearchSuggestionPropertyPSIGroupId"];

  v6 = [NSNumber numberWithUnsignedLongLong:self->_psiOwningGroupId];
  [v14 encodeObject:v6 forKey:@"PLSearchSuggestionPropertyPSIOwningGroupId"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_indexCategory];
  [v14 encodeObject:v7 forKey:@"PLSearchSuggestionPropertyIndexCategory"];

  v8 = [NSNumber numberWithUnsignedInteger:self->_suggestionType];
  [v14 encodeObject:v8 forKey:@"PLSearchSuggestionPropertySuggestionType"];

  v9 = [NSNumber numberWithUnsignedInteger:self->_matchedAssetsCount];
  [v14 encodeObject:v9 forKey:@"PLSearchSuggestionPropertyMatchedAssetCount"];

  v10 = [NSNumber numberWithUnsignedInteger:self->_matchedCollectionsCount];
  [v14 encodeObject:v10 forKey:@"PLSearchSuggestionPropertyMatchedCollectionCount"];

  [v14 encodeObject:self->_matchedText forKey:@"PLSearchSuggestionPropertyMatchedText"];
  v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_matchRangeOfSearchText.location, self->_matchRangeOfSearchText.length);
  [v14 encodeObject:v11 forKey:@"PLSearchSuggestionPropertyMatchRangeOfSearchText"];

  *(float *)&double v12 = self->_score;
  v13 = [NSNumber numberWithFloat:v12];
  [v14 encodeObject:v13 forKey:@"PLSearchSuggestionPropertyScore"];

  [v14 encodeObject:self->_lookupIdentifier forKey:@"PLSearchSuggestionPropertyLookupIdentifier"];
}

- (PLSearchSuggestionComponent)initWithCoder:(id)a3
{
  id v3 = a3;
  v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyContentString"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyPSIGroupId"];
  uint64_t v27 = [v4 unsignedIntValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyPSIOwningGroupId"];
  uint64_t v26 = [v5 unsignedIntValue];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyIndexCategory"];
  uint64_t v25 = [v6 unsignedIntegerValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertySuggestionType"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyMatchedAssetCount"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyMatchedCollectionCount"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyMatchedText"];
  id v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyMatchRangeOfSearchText"];
  uint64_t v15 = [v14 rangeValue];
  uint64_t v17 = v16;

  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyScore"];
  [v18 floatValue];
  int v20 = v19;

  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionPropertyLookupIdentifier"];

  LODWORD(v22) = v20;
  v23 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](self, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v28, v27, v26, v10, v12, v25, v22, v21, v8, v13, v15, v17);

  return v23;
}

- (id)description
{
  id v3 = PLDebugStringForSearchIndexCategory([(PLSearchSuggestionComponent *)self indexCategory]);
  unint64_t v4 = [(PLSearchSuggestionComponent *)self suggestionType];
  if (v4 - 1 > 3) {
    v5 = @"PLSearchSuggestionTypeNone";
  }
  else {
    v5 = off_1E5869EC8[v4 - 1];
  }
  int v19 = v5;
  v21.NSUInteger location = [(PLSearchSuggestionComponent *)self matchRangeOfSearchText];
  v6 = NSStringFromRange(v21);
  v7 = NSString;
  uint64_t v8 = [(PLSearchSuggestionComponent *)self contentString];
  unint64_t v9 = [(PLSearchSuggestionComponent *)self psiGroupId];
  unint64_t v10 = [(PLSearchSuggestionComponent *)self psiOwningGroupId];
  v11 = [(PLSearchSuggestionComponent *)self lookupIdentifier];
  [(PLSearchSuggestionComponent *)self score];
  double v13 = v12;
  unint64_t v14 = [(PLSearchSuggestionComponent *)self matchedAssetsCount];
  unint64_t v15 = [(PLSearchSuggestionComponent *)self matchedCollectionsCount];
  uint64_t v16 = [(PLSearchSuggestionComponent *)self matchedText];
  uint64_t v17 = [v7 stringWithFormat:@"content string: %@, groupId: %llu, owning groupId: %llu, indexCategory: %@, lookupIdentifier: %@, score: %f, suggestion type: %@, matched asset count: %tu, matched collection count: %tu, matched text: %@, match range of search text: %@", v8, v9, v10, v3, v11, *(void *)&v13, v19, v14, v15, v16, v6];

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLSearchSuggestionComponent *)self psiGroupId];
  unint64_t v4 = [(PLSearchSuggestionComponent *)self matchedText];
  uint64_t v5 = [v4 hash];
  [(PLSearchSuggestionComponent *)self matchRangeOfSearchText];
  unint64_t v7 = v5 ^ v3 ^ v6;
  uint64_t v8 = [(PLSearchSuggestionComponent *)self matchRangeOfSearchText];
  unint64_t v9 = v8 ^ [(PLSearchSuggestionComponent *)self matchedAssetsCount];
  unint64_t v10 = v7 ^ v9 ^ [(PLSearchSuggestionComponent *)self matchedCollectionsCount];
  unint64_t v11 = v10 ^ [(PLSearchSuggestionComponent *)self suggestionType];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(PLSearchSuggestionComponent *)self contentString];
    unint64_t v7 = [v5 contentString];
    int v41 = [v6 isEqualToString:v7];

    unint64_t v40 = [(PLSearchSuggestionComponent *)self psiGroupId];
    uint64_t v39 = [v5 psiGroupId];
    unint64_t v38 = [(PLSearchSuggestionComponent *)self psiOwningGroupId];
    uint64_t v37 = [v5 psiOwningGroupId];
    unint64_t v36 = [(PLSearchSuggestionComponent *)self indexCategory];
    uint64_t v35 = [v5 indexCategory];
    uint64_t v8 = [(PLSearchSuggestionComponent *)self lookupIdentifier];
    unint64_t v9 = [v5 lookupIdentifier];
    if (v8 == v9)
    {
      char v34 = 0;
    }
    else
    {
      unint64_t v10 = [(PLSearchSuggestionComponent *)self lookupIdentifier];
      unint64_t v11 = [v5 lookupIdentifier];
      char v12 = [v10 isEqualToString:v11];

      char v34 = v12 ^ 1;
    }

    [(PLSearchSuggestionComponent *)self score];
    float v15 = v14;
    [v5 score];
    float v17 = v16;
    unint64_t v33 = [(PLSearchSuggestionComponent *)self suggestionType];
    uint64_t v18 = [v5 suggestionType];
    unint64_t v32 = [(PLSearchSuggestionComponent *)self matchedAssetsCount];
    uint64_t v19 = [v5 matchedAssetsCount];
    unint64_t v31 = [(PLSearchSuggestionComponent *)self matchedCollectionsCount];
    uint64_t v20 = [v5 matchedCollectionsCount];
    NSRange v21 = [(PLSearchSuggestionComponent *)self matchedText];
    double v22 = [v5 matchedText];

    uint64_t v23 = [(PLSearchSuggestionComponent *)self matchRangeOfSearchText];
    uint64_t v25 = v24;
    uint64_t v26 = [v5 matchRangeOfSearchText];
    BOOL v13 = 0;
    if (v41
      && v40 == v39
      && v38 == v37
      && v36 == v35
      && (v34 & 1) == 0
      && v15 == v17
      && v33 == v18
      && v32 == v19
      && v31 == v20)
    {
      BOOL v13 = v21 == v22 && v23 == v26 && v25 == v27;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)userCategory
{
  uint64_t v2 = [(PLSearchSuggestionComponent *)self indexCategory];
  return PLSearchUserCategoryForCategory(v2);
}

- (PLSearchSuggestionComponent)initWithGroup:(id)a3 matchedAssetsCount:(unint64_t)a4 matchedCollectionsCount:(unint64_t)a5 suggestionType:(unint64_t)a6 matchedText:(id)a7 matchRangeOfSearchText:(_NSRange)a8
{
  unint64_t v11 = (PSIGroup *)a3;
  id v12 = a7;
  if (!v11)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLSearchSuggestionComponent.m", 42, @"Invalid parameter not satisfying: %@", @"group" object file lineNumber description];
  }
  BOOL v13 = [(PSIGroup *)v11 contentString];
  uint64_t v14 = [v13 length];

  if (!v14)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLSearchSuggestionComponent.m", 43, @"Invalid parameter not satisfying: %@", @"group.contentString.length > 0" object file lineNumber description];
  }
  float v15 = [(PSIGroup *)v11 contentString];
  uint64_t v16 = [(PSIGroup *)v11 groupId];
  uint64_t v17 = [(PSIGroup *)v11 owningGroupId];
  uint64_t v18 = [(PSIGroup *)v11 category];
  uint64_t v19 = [(PSIGroup *)v11 lookupIdentifier];
  [(PSIGroup *)v11 score];
  *(float *)&double v20 = v20;
  NSRange v21 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](self, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v15, v16, v17, a4, a5, v18, v20, v19, a6, v12, a8.location, a8.length);

  group = v21->_group;
  v21->_group = v11;

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end