@interface PSIRankedGroupV2
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMePerson;
- (NSString)contentString;
- (NSString)displayString;
- (NSString)lookupIdentifier;
- (PLSearchSuggestionComponent)suggestionComponent;
- (PSIRankedGroupV2)initWithCoder:(id)a3;
- (PSIRankedGroupV2)initWithGroup:(id)a3 displayString:(id)a4 isMePerson:(BOOL)a5;
- (__CFArray)groupAssetIds;
- (float)graphRankingScore;
- (float)rankingScore;
- (id)description;
- (id)jsonDictionary;
- (unint64_t)assetCount;
- (unint64_t)groupId;
- (unint64_t)hash;
- (unint64_t)searchIndexingCategory;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setGraphRankingScore:(float)a3;
- (void)setRankingScore:(float)a3;
@end

@implementation PSIRankedGroupV2

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSIRankedGroupV2)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSIRankedGroupPropertyContentString"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSIRankedGroupPropertyDisplayString"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSIRankedGroupPropertyGroupId"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSIRankedGroupPropertySearchIndexingCategory"];
  __int16 v10 = [v9 unsignedIntegerValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSIRankedGroupPropertySearchLookupIdentifier"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSIRankedGroupPropertyGroupScore"];
  [v12 doubleValue];
  double v14 = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSIRankedGroupPropertyIsMePerson"];

  uint64_t v16 = [v15 BOOLValue];
  v17 = [[PSIGroup alloc] initWithContentString:v5 normalizedString:v5 lookupIdentifier:v11 category:v10 groupId:v8 owningGroupId:0 score:v14];
  v18 = [(PSIRankedGroupV2 *)self initWithGroup:v17 displayString:v6 isMePerson:v16];

  return v18;
}

- (PSIRankedGroupV2)initWithGroup:(id)a3 displayString:(id)a4 isMePerson:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)PSIRankedGroupV2;
  __int16 v10 = [(PSIRankedGroupV2 *)&v33 init];
  if (!v10)
  {
LABEL_14:
    double v14 = v10;
    goto LABEL_15;
  }
  v11 = [v8 contentString];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    if (v5)
    {
      uint64_t v13 = PLServicesLocalizedFrameworkString();
    }
    else if ([v9 length])
    {
      uint64_t v13 = [v9 copy];
    }
    else
    {
      uint64_t v13 = [v8 contentString];
    }
    displayString = v10->_displayString;
    v10->_displayString = (NSString *)v13;

    uint64_t v16 = [v8 contentString];
    contentString = v10->_contentString;
    v10->_contentString = (NSString *)v16;

    v10->_groupId = [v8 groupId];
    v10->_searchIndexingCategory = (int)[v8 category];
    uint64_t v18 = [v8 lookupIdentifier];
    lookupIdentifier = v10->_lookupIdentifier;
    v10->_lookupIdentifier = (NSString *)v18;

    [v8 score];
    *(float *)&double v20 = v20;
    v10->_graphRankingScore = *(float *)&v20;
    v10->_isMePerson = v5;
    CFIndex Count = [v8 assetIds];
    if (Count) {
      CFIndex Count = CFArrayGetCount((CFArrayRef)[v8 assetIds]);
    }
    v10->_assetCFIndex Count = Count;
    CFArrayRef Copy = (CFArrayRef)[v8 assetIds];
    if (Copy) {
      CFArrayRef Copy = CFArrayCreateCopy(0, (CFArrayRef)[v8 assetIds]);
    }
    v10->_groupAssetIds = Copy;
    v10->_rankingScore = 9.2234e18;
    v23 = [PLSearchSuggestionComponent alloc];
    v24 = [v8 contentString];
    uint64_t v25 = [v8 groupId];
    uint64_t v26 = [v8 owningGroupId];
    assetCFIndex Count = v10->_assetCount;
    uint64_t v28 = (int)[v8 category];
    v29 = [v8 lookupIdentifier];
    [(PSIRankedGroupV2 *)v10 rankingScore];
    uint64_t v30 = [(PLSearchSuggestionComponent *)v23 initWithContentString:v24 groupId:v25 owningGroupId:v26 matchedAssetsCount:assetCount matchedCollectionsCount:0 indexCategory:v28 lookupIdentifier:v29 score:4 suggestionType:0 matchedText:0x7FFFFFFFFFFFFFFFLL matchRangeOfSearchText:0];
    suggestionComponent = v10->_suggestionComponent;
    v10->_suggestionComponent = (PLSearchSuggestionComponent *)v30;

    goto LABEL_14;
  }
  double v14 = 0;
LABEL_15:

  return v14;
}

- (float)rankingScore
{
  float result = self->_rankingScore;
  if (result == 9.2234e18)
  {
    if ([(PSIRankedGroupV2 *)self assetCount])
    {
      +[PLScopedSearchSuggestionGeneration initialSuggestionScoreForIndexCategory:[(PSIRankedGroupV2 *)self searchIndexingCategory]];
      double v5 = v4;
      [(PSIRankedGroupV2 *)self graphRankingScore];
      float result = v5 + v6;
    }
    else
    {
      float result = 0.0;
    }
    self->_rankingScore = result;
  }
  return result;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (unint64_t)searchIndexingCategory
{
  return self->_searchIndexingCategory;
}

- (BOOL)isMePerson
{
  return self->_isMePerson;
}

- (float)graphRankingScore
{
  return self->_graphRankingScore;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (NSString)contentString
{
  return self->_contentString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionComponent, 0);
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

- (void)setGraphRankingScore:(float)a3
{
  self->_graphRankingScore = a3;
}

- (__CFArray)groupAssetIds
{
  return self->_groupAssetIds;
}

- (PLSearchSuggestionComponent)suggestionComponent
{
  return self->_suggestionComponent;
}

- (void)setRankingScore:(float)a3
{
  self->_rankingScore = a3;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (void)dealloc
{
  groupAssetIds = self->_groupAssetIds;
  if (groupAssetIds) {
    CFRelease(groupAssetIds);
  }
  v4.receiver = self;
  v4.super_class = (Class)PSIRankedGroupV2;
  [(PSIRankedGroupV2 *)&v4 dealloc];
}

- (id)jsonDictionary
{
  v22[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PSIRankedGroupV2 *)self isMePerson];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v21[0] = @"content_string";
  double v20 = [(PSIRankedGroupV2 *)self contentString];
  v22[0] = v20;
  v21[1] = @"display_string";
  double v5 = [(PSIRankedGroupV2 *)self displayString];
  v22[1] = v5;
  v21[2] = @"group_id";
  float v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PSIRankedGroupV2 groupId](self, "groupId"));
  v22[2] = v6;
  v21[3] = @"index_category";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PSIRankedGroupV2 searchIndexingCategory](self, "searchIndexingCategory"));
  v22[3] = v7;
  v21[4] = @"graph_ranking_score";
  id v8 = NSNumber;
  [(PSIRankedGroupV2 *)self graphRankingScore];
  id v9 = objc_msgSend(v8, "numberWithFloat:");
  v22[4] = v9;
  v21[5] = @"is_me_person";
  __int16 v10 = [NSNumber numberWithUnsignedInteger:v3];
  v22[5] = v10;
  v21[6] = @"asset_count";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PSIRankedGroupV2 assetCount](self, "assetCount"));
  v22[6] = v11;
  v21[7] = @"overall_ranking_score";
  uint64_t v12 = NSNumber;
  [(PSIRankedGroupV2 *)self rankingScore];
  uint64_t v13 = objc_msgSend(v12, "numberWithFloat:");
  v22[7] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:8];
  v15 = (void *)[v4 initWithDictionary:v14];

  uint64_t v16 = [(PSIRankedGroupV2 *)self lookupIdentifier];

  if (v16)
  {
    v17 = [(PSIRankedGroupV2 *)self lookupIdentifier];
    [v15 setObject:v17 forKeyedSubscript:@"lookup_identifier"];
  }
  uint64_t v18 = (void *)[v15 copy];

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  contentString = self->_contentString;
  id v5 = a3;
  [v5 encodeObject:contentString forKey:@"PSIRankedGroupPropertyContentString"];
  [v5 encodeObject:self->_displayString forKey:@"PSIRankedGroupPropertyDisplayString"];
  float v6 = [NSNumber numberWithUnsignedLongLong:self->_groupId];
  [v5 encodeObject:v6 forKey:@"PSIRankedGroupPropertyGroupId"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_searchIndexingCategory];
  [v5 encodeObject:v7 forKey:@"PSIRankedGroupPropertySearchIndexingCategory"];

  [v5 encodeObject:self->_lookupIdentifier forKey:@"PSIRankedGroupPropertySearchLookupIdentifier"];
  id v8 = [NSNumber numberWithDouble:self->_graphRankingScore];
  [v5 encodeObject:v8 forKey:@"PSIRankedGroupPropertyGroupScore"];

  id v9 = [NSNumber numberWithBool:self->_isMePerson];
  [v5 encodeObject:v9 forKey:@"PSIRankedGroupPropertyIsMePerson"];

  id v10 = [NSNumber numberWithUnsignedInteger:self->_assetCount];
  [v5 encodeObject:v10 forKey:@"PSIRankedGroupPropertyAssetCount"];
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)PSIRankedGroupV2;
  uint64_t v3 = [(PSIRankedGroupV2 *)&v13 description];
  unint64_t groupId = self->_groupId;
  displayString = self->_displayString;
  contentString = self->_contentString;
  unint64_t searchIndexingCategory = self->_searchIndexingCategory;
  lookupIdentifier = self->_lookupIdentifier;
  double graphRankingScore = self->_graphRankingScore;
  [(PSIRankedGroupV2 *)self rankingScore];
  v11 = [v3 stringByAppendingFormat:@"content string: %@, display string: %@, groupId: %llu, group indexing category: %tu, lookupIdentifier:%@, graph ranking score:%f, ranking score: %f, nAssetIds: %tu", contentString, displayString, groupId, searchIndexingCategory, lookupIdentifier, *(void *)&graphRankingScore, v10, self->_assetCount];

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PSIRankedGroupV2 *)self isMePerson];
  return [(PSIRankedGroupV2 *)self assetCount] ^ v3 ^ self->_groupId;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PSIRankedGroupV2 *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(PSIRankedGroupV2 *)self groupId];
      if (v6 == [(PSIRankedGroupV2 *)v5 groupId]
        && (unint64_t v7 = [(PSIRankedGroupV2 *)self assetCount],
            v7 == [(PSIRankedGroupV2 *)v5 assetCount]))
      {
        id v8 = [(PSIRankedGroupV2 *)self suggestionComponent];
        id v9 = [(PSIRankedGroupV2 *)v5 suggestionComponent];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

@end