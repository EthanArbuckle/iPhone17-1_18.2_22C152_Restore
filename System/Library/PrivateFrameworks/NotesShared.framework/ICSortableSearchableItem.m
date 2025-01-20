@interface ICSortableSearchableItem
+ (id)sortDescriptorsForRankingStrategy:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrefixMatch;
- (BOOL)needsLazyInitialization;
- (CSSearchableItem)searchableItem;
- (ICRankingQueriesDefinition)rankingQueriesDefinition;
- (ICSortableSearchableItem)initWithSearchableItem:(id)a3 highlightInfo:(id)a4 rankingScore:(double)a5 attachmentUniqueIdentifiers:(id)a6;
- (ICSortableSearchableItem)initWithSearchableItem:(id)a3 searchString:(id)a4 rankingQueriesDefinition:(id)a5 rankingScore:(double)a6 attachmentUniqueIdentifiers:(id)a7 language:(id)a8;
- (NSArray)attachmentUniqueIdentifiers;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDictionary)highlightInfo;
- (NSString)language;
- (NSString)searchString;
- (double)rankingScore;
- (unint64_t)hash;
- (unint64_t)modificationDateBucket;
- (unint64_t)relevanceBitField;
- (unint64_t)searchResultType;
- (void)lazilyInitializeHighlightInfoAndIsPrefixMatchIfNecessary;
- (void)setLanguage:(id)a3;
- (void)setNeedsLazyInitialization:(BOOL)a3;
- (void)setRankingQueriesDefinition:(id)a3;
- (void)setSearchString:(id)a3;
@end

@implementation ICSortableSearchableItem

- (ICSortableSearchableItem)initWithSearchableItem:(id)a3 highlightInfo:(id)a4 rankingScore:(double)a5 attachmentUniqueIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ICSortableSearchableItem;
  v14 = [(ICSortableSearchableItem *)&v24 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchableItem, a3);
    v15->_rankingScore = a5;
    objc_storeStrong((id *)&v15->_attachmentUniqueIdentifiers, a6);
    objc_storeStrong((id *)&v15->_highlightInfo, a4);
    v15->_isPrefixMatch = [MEMORY[0x1E4F1C9E8] highlightInfoContainsPrefixMatch:v12];
    v15->_relevanceBitField = +[ICRankingQueriesDefinition relevanceBitFieldForSearchableItem:v11];
    v15->_modificationDateBucket = +[ICRankingQueriesDefinition modificationDateBucketForSearchableItem:v11];
    v16 = [v11 attributeSet];
    uint64_t v17 = [v16 contentModificationDate];
    modificationDate = v15->_modificationDate;
    v15->_modificationDate = (NSDate *)v17;

    v19 = [v11 attributeSet];
    uint64_t v20 = [v19 contentCreationDate];
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v20;

    v22 = [v11 attributeSet];
    v15->_searchResultType = objc_msgSend(v22, "ic_searchResultType");
  }
  return v15;
}

- (ICSortableSearchableItem)initWithSearchableItem:(id)a3 searchString:(id)a4 rankingQueriesDefinition:(id)a5 rankingScore:(double)a6 attachmentUniqueIdentifiers:(id)a7 language:(id)a8
{
  id v15 = a3;
  id v29 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)ICSortableSearchableItem;
  v19 = [(ICSortableSearchableItem *)&v30 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_searchableItem, a3);
    objc_storeStrong((id *)&v20->_searchString, a4);
    objc_storeStrong((id *)&v20->_rankingQueriesDefinition, a5);
    v20->_rankingScore = a6;
    objc_storeStrong((id *)&v20->_attachmentUniqueIdentifiers, a7);
    objc_storeStrong((id *)&v20->_language, a8);
    v20->_needsLazyInitialization = 1;
    v20->_relevanceBitField = +[ICRankingQueriesDefinition relevanceBitFieldForSearchableItem:v15];
    v20->_modificationDateBucket = +[ICRankingQueriesDefinition modificationDateBucketForSearchableItem:v15];
    v21 = [v15 attributeSet];
    uint64_t v22 = [v21 contentModificationDate];
    modificationDate = v20->_modificationDate;
    v20->_modificationDate = (NSDate *)v22;

    objc_super v24 = [v15 attributeSet];
    uint64_t v25 = [v24 contentCreationDate];
    creationDate = v20->_creationDate;
    v20->_creationDate = (NSDate *)v25;

    v27 = [v15 attributeSet];
    v20->_searchResultType = objc_msgSend(v27, "ic_searchResultType");
  }
  return v20;
}

- (void)lazilyInitializeHighlightInfoAndIsPrefixMatchIfNecessary
{
  if (self->_needsLazyInitialization)
  {
    v3 = [(ICSortableSearchableItem *)self rankingQueriesDefinition];
    v4 = [(ICSortableSearchableItem *)self searchableItem];
    v5 = [v3 highlightInfoForSearchableItem:v4];

    if (!v5 || ![(NSDictionary *)v5 count])
    {
      v6 = (void *)MEMORY[0x1E4F1C9E8];
      v7 = [(ICSortableSearchableItem *)self searchString];
      v8 = [(ICSortableSearchableItem *)self language];
      uint64_t v9 = [v6 highlightInfoForSearchStringWithPrefixMatchInAllFields:v7 language:v8];

      v5 = (NSDictionary *)v9;
    }
    highlightInfo = self->_highlightInfo;
    self->_highlightInfo = v5;
    id v11 = v5;

    LOBYTE(highlightInfo) = [MEMORY[0x1E4F1C9E8] highlightInfoContainsPrefixMatch:v11];
    self->_isPrefixMatch = (char)highlightInfo;
    self->_needsLazyInitialization = 0;
  }
}

- (NSDictionary)highlightInfo
{
  [(ICSortableSearchableItem *)self lazilyInitializeHighlightInfoAndIsPrefixMatchIfNecessary];
  highlightInfo = self->_highlightInfo;
  return highlightInfo;
}

- (BOOL)isPrefixMatch
{
  return self->_isPrefixMatch;
}

- (unint64_t)hash
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICSortableSearchableItem *)self attachmentUniqueIdentifiers];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = [v6 hash];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v7 = ICHashWithObject(*(void **)(*((void *)&v36 + 1) + 8 * i)) - v7 + 32 * v7;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v10);
    }

    v35 = [(ICSortableSearchableItem *)self searchableItem];
    char v34 = [v35 hash];
    id v13 = [(ICSortableSearchableItem *)self highlightInfo];
    v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    uint64_t v16 = [v15 hash];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v17 = v13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          v23 = [v17 objectForKeyedSubscript:v22];
          uint64_t v24 = ICHashWithObject(v22);
          uint64_t v16 = ICHashWithObject(v23) + v16 - v24 + 32 * v24;
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v19);
    }

    [(ICSortableSearchableItem *)self relevanceBitField];
    [(ICSortableSearchableItem *)self isPrefixMatch];
    [(ICSortableSearchableItem *)self modificationDateBucket];
    uint64_t v25 = [(ICSortableSearchableItem *)self modificationDate];
    [v25 hash];
    v26 = [(ICSortableSearchableItem *)self creationDate];
    [v26 hash];
    [(ICSortableSearchableItem *)self searchResultType];
    self->_hash = ICHashWithHashKeys(v7, v27, v28, v29, v30, v31, v32, v33, v34);

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v37.receiver = self;
  v37.super_class = (Class)ICSortableSearchableItem;
  id v4 = a3;
  unsigned int v5 = [(ICSortableSearchableItem *)&v37 isEqual:v4];
  objc_opt_class();
  v6 = ICDynamicCast();

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    goto LABEL_37;
  }
  id v8 = [(ICSortableSearchableItem *)self searchableItem];
  uint64_t v9 = [v6 searchableItem];
  int v10 = [v8 isEqual:v9];

  if (!v10) {
    goto LABEL_37;
  }
  uint64_t v11 = [(ICSortableSearchableItem *)self highlightInfo];
  id v12 = [v6 highlightInfo];
  int v13 = [v11 isEqualToDictionary:v12];

  if (!v13) {
    goto LABEL_37;
  }
  v14 = [(ICSortableSearchableItem *)self attachmentUniqueIdentifiers];
  id v15 = [v6 attachmentUniqueIdentifiers];
  if ([v14 isEqualToArray:v15])
  {
  }
  else
  {
    uint64_t v16 = [(ICSortableSearchableItem *)self attachmentUniqueIdentifiers];
    id v17 = [v6 attachmentUniqueIdentifiers];

    if (v16 != v17) {
      goto LABEL_37;
    }
  }
  unint64_t v18 = [(ICSortableSearchableItem *)self relevanceBitField];
  if (v18 != [v6 relevanceBitField]) {
    goto LABEL_37;
  }
  int v19 = [(ICSortableSearchableItem *)self isPrefixMatch];
  if (v19 != [v6 isPrefixMatch]) {
    goto LABEL_37;
  }
  unint64_t v20 = [(ICSortableSearchableItem *)self modificationDateBucket];
  if (v20 != [v6 modificationDateBucket]) {
    goto LABEL_37;
  }
  v21 = [(ICSortableSearchableItem *)self modificationDate];
  uint64_t v22 = [v6 modificationDate];
  v23 = (void *)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v21) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v21;
  }
  unint64_t v25 = v24;
  if (v23 == v22) {
    v26 = 0;
  }
  else {
    v26 = v22;
  }
  unint64_t v27 = v26;
  if (v25 | v27)
  {
    uint64_t v28 = (void *)v27;
    if (!v25 || !v27)
    {
LABEL_36:

      goto LABEL_37;
    }
    char v29 = [(id)v25 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  v21 = [(ICSortableSearchableItem *)self creationDate];
  uint64_t v22 = [v6 creationDate];
  if (v23 == v21) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v21;
  }
  unint64_t v25 = v30;
  if (v23 == v22) {
    uint64_t v31 = 0;
  }
  else {
    uint64_t v31 = v22;
  }
  unint64_t v32 = v31;
  if (!(v25 | v32))
  {

LABEL_40:
    unint64_t v36 = [(ICSortableSearchableItem *)self searchResultType];
    BOOL v34 = v36 == [v6 searchResultType];
    goto LABEL_38;
  }
  uint64_t v28 = (void *)v32;
  if (!v25 || !v32) {
    goto LABEL_36;
  }
  char v33 = [(id)v25 isEqual:v32];

  if (v33) {
    goto LABEL_40;
  }
LABEL_37:
  BOOL v34 = 0;
LABEL_38:

  return v34;
}

+ (id)sortDescriptorsForRankingStrategy:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"searchResultType" ascending:1];
      unsigned int v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"isPrefixMatch" ascending:0];
      v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDateBucket" ascending:1];
      BOOL v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rankingScore" ascending:0];
      id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"relevanceBitField" ascending:0];
      id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:0];
      int v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
      v14 = objc_msgSend(v11, "initWithObjects:", v4, v5, v6, v7, v8, v12, v13, 0);

LABEL_8:
      goto LABEL_10;
    case 1uLL:
      id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"searchResultType" ascending:1];
      unsigned int v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"isPrefixMatch" ascending:0];
      v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rankingScore" ascending:0];
      BOOL v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"relevanceBitField" ascending:0];
      id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:0];
      uint64_t v9 = (void *)MEMORY[0x1E4F29008];
      int v10 = @"creationDate";
      goto LABEL_7;
    case 0uLL:
      id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"searchResultType" ascending:1];
      unsigned int v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"isPrefixMatch" ascending:0];
      v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:0];
      BOOL v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
      id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rankingScore" ascending:0];
      uint64_t v9 = (void *)MEMORY[0x1E4F29008];
      int v10 = @"relevanceBitField";
LABEL_7:
      id v12 = [v9 sortDescriptorWithKey:v10 ascending:0];
      v14 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, v12, 0);
      goto LABEL_8;
  }
  v14 = 0;
LABEL_10:
  return v14;
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (NSArray)attachmentUniqueIdentifiers
{
  return self->_attachmentUniqueIdentifiers;
}

- (unint64_t)relevanceBitField
{
  return self->_relevanceBitField;
}

- (unint64_t)modificationDateBucket
{
  return self->_modificationDateBucket;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (unint64_t)searchResultType
{
  return self->_searchResultType;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (ICRankingQueriesDefinition)rankingQueriesDefinition
{
  return self->_rankingQueriesDefinition;
}

- (void)setRankingQueriesDefinition:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)needsLazyInitialization
{
  return self->_needsLazyInitialization;
}

- (void)setNeedsLazyInitialization:(BOOL)a3
{
  self->_needsLazyInitialization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_rankingQueriesDefinition, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_attachmentUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
  objc_storeStrong((id *)&self->_highlightInfo, 0);
}

@end