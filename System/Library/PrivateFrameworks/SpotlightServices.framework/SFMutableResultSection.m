@interface SFMutableResultSection
+ (BOOL)supportsSecureCoding;
+ (id)mutableSectionWithBundleId:(id)a3;
- (BOOL)doNotFold;
- (BOOL)isGlanceCategory;
- (BOOL)pinToTop;
- (BOOL)serialized;
- (NSArray)hiddenExtResults;
- (NSMutableOrderedSet)resultSet;
- (NSNumber)groupId;
- (NSString)groupName;
- (NSString)preMergeBundleIdentifier;
- (NSString)relatedSectionBundleIdentifier;
- (NSString)resultSetIdentifier;
- (NSString)sourceDomain;
- (SFMutableResultSection)initWithCoder:(id)a3;
- (SFMutableResultSection)initWithPrototype:(id)a3;
- (SFMutableResultSection)initWithResultSection:(id)a3;
- (SFMutableResultSection)initWithSection:(id)a3;
- (SPGroupHeadingResult)headerResult;
- (id)copySectionRemovingResults:(id)a3;
- (id)description;
- (id)mutableDeepCopy;
- (id)objectForFeedback;
- (id)objectForFeedbackWithResultsArray:(id)a3;
- (id)results;
- (id)resultsAtIndex:(unint64_t)a3;
- (int)source;
- (unint64_t)indexOfResult:(id)a3;
- (unint64_t)resultsCount;
- (unsigned)domain;
- (void)addHiddenExtResult:(id)a3;
- (void)addResults:(id)a3;
- (void)addResults:(id)a3 atIndex:(unint64_t)a4;
- (void)addResultsFromArray:(id)a3;
- (void)clearResults;
- (void)copyAndSetResults:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)filterUsingPredicate:(id)a3;
- (void)moveResultsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeResults:(id)a3;
- (void)removeResultsAtIndex:(unint64_t)a3;
- (void)removeResultsInArray:(id)a3;
- (void)removeResultsInRange:(_NSRange)a3;
- (void)replaceResultsAtIndex:(unint64_t)a3 withResults:(id)a4;
- (void)setDoNotFold:(BOOL)a3;
- (void)setDomain:(unsigned int)a3;
- (void)setGroupId:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setHeaderResult:(id)a3;
- (void)setHiddenExtResults:(id)a3;
- (void)setIsGlanceCategory:(BOOL)a3;
- (void)setPinToTop:(BOOL)a3;
- (void)setPreMergeBundleIdentifier:(id)a3;
- (void)setRelatedSectionBundleIdentifier:(id)a3;
- (void)setResultSet:(id)a3;
- (void)setResultSetIdentifier:(id)a3;
- (void)setResults:(id)a3;
- (void)setSerialized:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)setSourceDomain:(id)a3;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(id)a3;
- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4;
@end

@implementation SFMutableResultSection

+ (id)mutableSectionWithBundleId:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setBundleIdentifier:v3];

  return v4;
}

- (id)objectForFeedback
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_getAssociatedObject(self, "_feedbackobject");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F9A368]);
    v4 = [(SFResultSection *)self identifier];
    [v3 setIdentifier:v4];

    v5 = [(SFResultSection *)self bundleIdentifier];
    v6 = (void *)[v5 copy];
    [v3 setBundleIdentifier:v6];

    v7 = [(SFResultSection *)self title];
    v8 = (void *)[v7 copy];
    [v3 setTitle:v8];

    v9 = [(SFResultSection *)self subtitle];
    v10 = (void *)[v9 copy];
    [v3 setSubtitle:v10];

    [(SFResultSection *)self rankingScore];
    objc_msgSend(v3, "setRankingScore:");
    objc_msgSend(v3, "setMaxInitiallyVisibleResults:", -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
    objc_msgSend(v3, "setIsInitiallyHidden:", -[SFResultSection isInitiallyHidden](self, "isInitiallyHidden"));
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v12 = [(SFMutableResultSection *)self results];
    v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = [(SFMutableResultSection *)self resultSet];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectForFeedback];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    [v3 setResults:v13];
    objc_setAssociatedObject(self, "_feedbackobject", v3, (void *)1);
  }
  return v3;
}

- (id)objectForFeedbackWithResultsArray:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_getAssociatedObject(self, "_feedbackobject");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F9A368]);
    v6 = [(SFResultSection *)self identifier];
    [v5 setIdentifier:v6];

    v7 = [(SFResultSection *)self bundleIdentifier];
    v8 = (void *)[v7 copy];
    [v5 setBundleIdentifier:v8];

    v9 = [(SFResultSection *)self title];
    v10 = (void *)[v9 copy];
    [v5 setTitle:v10];

    id v11 = [(SFResultSection *)self subtitle];
    v12 = (void *)[v11 copy];
    [v5 setSubtitle:v12];

    [(SFResultSection *)self rankingScore];
    objc_msgSend(v5, "setRankingScore:");
    objc_msgSend(v5, "setMaxInitiallyVisibleResults:", -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v13, "addObject:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    [v5 setResults:v13];
    objc_setAssociatedObject(self, "_feedbackobject", v5, (void *)1);
  }
  return v5;
}

- (void)addHiddenExtResult:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_hiddenExtResults)
  {
    id v5 = [MEMORY[0x1E4F1C978] array];
    hiddenExtResults = self->_hiddenExtResults;
    self->_hiddenExtResults = v5;
  }
  if (v4)
  {
    v7 = self->_hiddenExtResults;
    v11[0] = v4;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = [(NSArray *)v7 arrayByAddingObjectsFromArray:v8];
    v10 = self->_hiddenExtResults;
    self->_hiddenExtResults = v9;
  }
}

- (NSArray)hiddenExtResults
{
  hiddenExtResults = self->_hiddenExtResults;
  if (!hiddenExtResults)
  {
    id v4 = [MEMORY[0x1E4F1C978] array];
    id v5 = self->_hiddenExtResults;
    self->_hiddenExtResults = v4;

    hiddenExtResults = self->_hiddenExtResults;
  }
  return hiddenExtResults;
}

- (id)description
{
  id v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)SFMutableResultSection;
  id v4 = [(SFMutableResultSection *)&v12 description];
  id v5 = [(SFResultSection *)self bundleIdentifier];
  v6 = [(SFResultSection *)self title];
  unint64_t v7 = [(SFMutableResultSection *)self resultsCount];
  BOOL v8 = [(SFResultSection *)self isInitiallyHidden];
  v9 = "no";
  if (v8) {
    v9 = "yes";
  }
  v10 = [v3 stringWithFormat:@"%@ %@ %@ -- Result count:%ld Hidden: %s", v4, v5, v6, v7, v9];

  return v10;
}

- (SFMutableResultSection)initWithSection:(id)a3
{
  id v4 = a3;
  id v5 = (SFMutableResultSection *)objc_opt_new();
  v6 = [v4 results];
  [(SFMutableResultSection *)v5 setResults:v6];

  -[SFResultSection setMaxInitiallyVisibleResults:](v5, "setMaxInitiallyVisibleResults:", [v4 maxInitiallyVisibleResults]);
  unint64_t v7 = [v4 identifier];
  [(SFResultSection *)v5 setIdentifier:v7];

  BOOL v8 = [v4 bundleIdentifier];
  [(SFResultSection *)v5 setBundleIdentifier:v8];

  v9 = [v4 title];
  [(SFResultSection *)v5 setTitle:v9];

  v10 = [v4 subtitle];
  [(SFResultSection *)v5 setSubtitle:v10];

  id v11 = [v4 moreText];
  [(SFResultSection *)v5 setMoreText:v11];

  [v4 rankingScore];
  -[SFResultSection setRankingScore:](v5, "setRankingScore:");
  -[SFResultSection setIsInitiallyHidden:](v5, "setIsInitiallyHidden:", [v4 isInitiallyHidden]);
  objc_super v12 = [v4 button];
  [(SFResultSection *)v5 setButton:v12];

  v13 = (void *)MEMORY[0x1E4F1CA70];
  id v14 = [v4 results];
  uint64_t v15 = [v13 orderedSetWithArray:v14];
  resultSet = self->_resultSet;
  self->_resultSet = v15;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SFMutableResultSection setDomain:](v5, "setDomain:", [v4 domain]);
  }

  return v5;
}

- (SFMutableResultSection)initWithResultSection:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFMutableResultSection;
  id v5 = [(SFResultSection *)&v17 init];
  if (v5)
  {
    v6 = [v4 results];
    unint64_t v7 = [v4 bundleIdentifier];
    if (![v7 length])
    {
      BOOL v8 = [v6 firstObject];
      uint64_t v9 = [v8 applicationBundleIdentifier];

      unint64_t v7 = (void *)v9;
    }
    [(SFResultSection *)v5 setBundleIdentifier:v7];
    v10 = [v4 title];
    [(SFResultSection *)v5 setTitle:v10];

    id v11 = [v4 subtitle];
    [(SFResultSection *)v5 setSubtitle:v11];

    objc_super v12 = [v4 moreText];
    [(SFResultSection *)v5 setMoreText:v12];

    v13 = [v4 button];
    [(SFResultSection *)v5 setButton:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SFMutableResultSection setDomain:](v5, "setDomain:", [v4 domain]);
    }
    uint64_t v14 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v6];
    resultSet = v5->_resultSet;
    v5->_resultSet = (NSMutableOrderedSet *)v14;
  }
  return v5;
}

- (SFMutableResultSection)initWithPrototype:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFMutableResultSection;
  id v5 = [(SFResultSection *)&v17 init];
  if (v5)
  {
    -[SFResultSection setMaxInitiallyVisibleResults:](v5, "setMaxInitiallyVisibleResults:", [v4 maxInitiallyVisibleResults]);
    v6 = [v4 identifier];
    [(SFResultSection *)v5 setIdentifier:v6];

    unint64_t v7 = [v4 bundleIdentifier];
    [(SFResultSection *)v5 setBundleIdentifier:v7];

    BOOL v8 = [v4 title];
    [(SFResultSection *)v5 setTitle:v8];

    uint64_t v9 = [v4 subtitle];
    [(SFResultSection *)v5 setSubtitle:v9];

    v10 = [v4 moreText];
    [(SFResultSection *)v5 setMoreText:v10];

    [v4 rankingScore];
    -[SFResultSection setRankingScore:](v5, "setRankingScore:");
    id v11 = [v4 button];
    [(SFResultSection *)v5 setButton:v11];

    uint64_t v12 = [v4 groupName];
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v12;

    uint64_t v14 = [v4 groupId];
    groupId = v5->_groupId;
    v5->_groupId = (NSNumber *)v14;

    v5->_doNotFold = [v4 doNotFold];
    v5->_domain = [v4 domain];
    v5->_pinToTop = [v4 pinToTop];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableDeepCopy
{
  id v3 = objc_opt_new();
  objc_msgSend(v3, "setMaxInitiallyVisibleResults:", -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
  id v4 = [(SFResultSection *)self identifier];
  [v3 setIdentifier:v4];

  id v5 = [(SFResultSection *)self bundleIdentifier];
  [v3 setBundleIdentifier:v5];

  v6 = [(SFResultSection *)self title];
  [v3 setTitle:v6];

  unint64_t v7 = [(SFResultSection *)self subtitle];
  [v3 setSubtitle:v7];

  BOOL v8 = [(SFResultSection *)self moreText];
  [v3 setMoreText:v8];

  [(SFResultSection *)self rankingScore];
  objc_msgSend(v3, "setRankingScore:");
  uint64_t v9 = [(SFMutableResultSection *)self groupId];
  [v3 setGroupId:v9];

  objc_msgSend(v3, "setDomain:", -[SFMutableResultSection domain](self, "domain"));
  v10 = [(SFMutableResultSection *)self groupName];
  [v3 setGroupName:v10];

  objc_msgSend(v3, "setDoNotFold:", -[SFMutableResultSection doNotFold](self, "doNotFold"));
  objc_msgSend(v3, "setPinToTop:", -[SFMutableResultSection pinToTop](self, "pinToTop"));
  id v11 = [(SFMutableResultSection *)self headerResult];
  [v3 setHeaderResult:v11];

  uint64_t v12 = [(SFResultSection *)self button];
  [v3 setButton:v12];

  objc_msgSend(v3, "setIsInitiallyHidden:", -[SFResultSection isInitiallyHidden](self, "isInitiallyHidden"));
  v13 = [(SFMutableResultSection *)self resultSet];
  if ([v13 count])
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithOrderedSet:v13 copyItems:1];
    [v3 setResultSet:v14];
  }
  return v3;
}

- (id)copySectionRemovingResults:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  objc_msgSend(v5, "setMaxInitiallyVisibleResults:", -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
  v6 = [(SFResultSection *)self identifier];
  [v5 setIdentifier:v6];

  unint64_t v7 = [(SFResultSection *)self bundleIdentifier];
  [v5 setBundleIdentifier:v7];

  BOOL v8 = [(SFResultSection *)self title];
  [v5 setTitle:v8];

  uint64_t v9 = [(SFResultSection *)self subtitle];
  [v5 setSubtitle:v9];

  v10 = [(SFResultSection *)self moreText];
  [v5 setMoreText:v10];

  [(SFResultSection *)self rankingScore];
  objc_msgSend(v5, "setRankingScore:");
  id v11 = [(SFMutableResultSection *)self groupId];
  [v5 setGroupId:v11];

  objc_msgSend(v5, "setDomain:", -[SFMutableResultSection domain](self, "domain"));
  uint64_t v12 = [(SFMutableResultSection *)self groupName];
  [v5 setGroupName:v12];

  objc_msgSend(v5, "setDoNotFold:", -[SFMutableResultSection doNotFold](self, "doNotFold"));
  objc_msgSend(v5, "setPinToTop:", -[SFMutableResultSection pinToTop](self, "pinToTop"));
  v13 = [(SFMutableResultSection *)self headerResult];
  [v5 setHeaderResult:v13];

  uint64_t v14 = [(SFResultSection *)self button];
  [v5 setButton:v14];

  uint64_t v15 = [(SFMutableResultSection *)self resultSet];
  if ([v15 count])
  {
    uint64_t v16 = (void *)[v15 mutableCopy];

    [v16 minusOrderedSet:v4];
    [v5 setResultSet:v16];
    uint64_t v15 = v16;
  }

  return v5;
}

- (SFMutableResultSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFMutableResultSection;
  id v5 = [(SFResultSection *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    BOOL v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_resultSet"];
    resultSet = v5->_resultSet;
    v5->_resultSet = (NSMutableOrderedSet *)v9;

    v5->_doNotFold = [v4 decodeBoolForKey:@"_doNotFold"];
    v5->_domain = [v4 decodeInt32ForKey:@"_domain"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_rsbid"];
    relatedSectionBundleIdentifier = v5->_relatedSectionBundleIdentifier;
    v5->_relatedSectionBundleIdentifier = (NSString *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_button_command"];
    uint64_t v14 = [(SFResultSection *)v5 button];
    [v14 setCommand:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFMutableResultSection;
  id v4 = a3;
  [(SFResultSection *)&v8 setResults:0];
  v7.receiver = self;
  v7.super_class = (Class)SFMutableResultSection;
  [(SFResultSection *)&v7 encodeWithCoder:v4];
  [v4 encodeBool:self->_doNotFold forKey:@"_doNotFold"];
  [v4 encodeObject:self->_resultSet forKey:@"_resultSet"];
  [v4 encodeInt32:self->_domain forKey:@"_domain"];
  [v4 encodeObject:self->_relatedSectionBundleIdentifier forKey:@"_rsbid"];
  id v5 = [(SFResultSection *)self button];
  v6 = [v5 command];
  [v4 encodeObject:v6 forKey:@"_button_command"];
}

- (void)setResults:(id)a3
{
  self->_resultSet = [MEMORY[0x1E4F1CA70] orderedSetWithArray:a3];
  MEMORY[0x1F41817F8]();
}

- (void)copyAndSetResults:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = objc_alloc((Class)objc_opt_class());
        v13 = objc_msgSend(v12, "initWithResult:", v11, (void)v14);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(SFMutableResultSection *)self setResults:v5];
}

- (id)results
{
  return (id)[(NSMutableOrderedSet *)self->_resultSet array];
}

- (void)clearResults
{
}

- (void)addResultsFromArray:(id)a3
{
  id v4 = a3;
  resultSet = self->_resultSet;
  id v8 = v4;
  if (!resultSet)
  {
    id v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v7 = self->_resultSet;
    self->_resultSet = v6;

    id v4 = v8;
    resultSet = self->_resultSet;
  }
  [(NSMutableOrderedSet *)resultSet addObjectsFromArray:v4];
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_resultSet)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  resultSet = self->_resultSet;
  self->_resultSet = v5;

  if (v7) {
LABEL_3:
  }
    [(NSMutableOrderedSet *)self->_resultSet addObject:v7];
LABEL_4:
  MEMORY[0x1F41817F8]();
}

- (void)addResults:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  resultSet = self->_resultSet;
  id v10 = v6;
  if (!resultSet)
  {
    id v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v9 = self->_resultSet;
    self->_resultSet = v8;

    id v6 = v10;
    resultSet = self->_resultSet;
  }
  [(NSMutableOrderedSet *)resultSet insertObject:v6 atIndex:a4];
}

- (unint64_t)resultsCount
{
  return [(NSMutableOrderedSet *)self->_resultSet count];
}

- (unint64_t)indexOfResult:(id)a3
{
  return [(NSMutableOrderedSet *)self->_resultSet indexOfObject:a3];
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableOrderedSet *)self->_resultSet objectAtIndex:a3];
}

- (void)removeResultsAtIndex:(unint64_t)a3
{
}

- (void)removeResults:(id)a3
{
}

- (void)removeResultsInRange:(_NSRange)a3
{
}

- (void)removeResultsInArray:(id)a3
{
}

- (void)replaceResultsAtIndex:(unint64_t)a3 withResults:(id)a4
{
}

- (void)moveResultsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
}

- (void)filterUsingPredicate:(id)a3
{
}

- (void)sortUsingComparator:(id)a3
{
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
}

- (void)setHiddenExtResults:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSNumber)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
}

- (NSMutableOrderedSet)resultSet
{
  return self->_resultSet;
}

- (void)setResultSet:(id)a3
{
}

- (SPGroupHeadingResult)headerResult
{
  return self->_headerResult;
}

- (void)setHeaderResult:(id)a3
{
}

- (BOOL)doNotFold
{
  return self->_doNotFold;
}

- (void)setDoNotFold:(BOOL)a3
{
  self->_doNotFold = a3;
}

- (unsigned)domain
{
  return self->_domain;
}

- (void)setDomain:(unsigned int)a3
{
  self->_domain = a3;
}

- (BOOL)pinToTop
{
  return self->_pinToTop;
}

- (void)setPinToTop:(BOOL)a3
{
  self->_pinToTop = a3;
}

- (NSString)relatedSectionBundleIdentifier
{
  return self->_relatedSectionBundleIdentifier;
}

- (void)setRelatedSectionBundleIdentifier:(id)a3
{
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (NSString)sourceDomain
{
  return self->_sourceDomain;
}

- (void)setSourceDomain:(id)a3
{
}

- (NSString)resultSetIdentifier
{
  return self->_resultSetIdentifier;
}

- (void)setResultSetIdentifier:(id)a3
{
}

- (BOOL)serialized
{
  return self->_serialized;
}

- (void)setSerialized:(BOOL)a3
{
  self->_serialized = a3;
}

- (BOOL)isGlanceCategory
{
  return self->_isGlanceCategory;
}

- (void)setIsGlanceCategory:(BOOL)a3
{
  self->_isGlanceCategory = a3;
}

- (NSString)preMergeBundleIdentifier
{
  return self->_preMergeBundleIdentifier;
}

- (void)setPreMergeBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preMergeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_resultSetIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceDomain, 0);
  objc_storeStrong((id *)&self->_relatedSectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_headerResult, 0);
  objc_storeStrong((id *)&self->_resultSet, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_hiddenExtResults, 0);
}

@end