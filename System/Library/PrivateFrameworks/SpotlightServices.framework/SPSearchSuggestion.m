@interface SPSearchSuggestion
+ (id)suggestionsWithData:(id)a3 queryString:(id)a4;
+ (id)suggestionsWithNLPData:(id)a3 queryString:(id)a4;
- (BOOL)hasMultipleResults;
- (BOOL)hasUsedDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShortcut;
- (BOOL)isSingleThread;
- (Class)classForCoder;
- (NSArray)bundleIDs;
- (NSArray)searchEntities;
- (SPSearchSuggestion)initWithNLPData:(id)a3 queryString:(id)a4;
- (SPSearchSuggestion)initWithSuggestion:(id)a3 query:(id)a4 scores:(id)a5 bundleIDs:(id)a6;
- (double)age;
- (double)compositeScore;
- (double)phraseScore;
- (double)prob;
- (double)punishment;
- (float)fieldWeight;
- (id)description;
- (id)suggestionsFeedbackData;
- (int)completionType;
- (int)parentWeight;
- (int)prefixLen;
- (int)rootWeight;
- (int)weight;
- (int64_t)compare:(id)a3;
- (unint64_t)fragments;
- (unint64_t)hash;
- (unint64_t)maxscore;
- (unint64_t)queryCompletionCount;
- (unint64_t)queryFragmentCount;
- (unint64_t)queryLen;
- (void)encodeWithCoder:(id)a3;
- (void)setAge:(double)a3;
- (void)setBundleIDs:(id)a3;
- (void)setCompletionType:(int)a3;
- (void)setCompositeScore:(double)a3;
- (void)setFieldWeight:(float)a3;
- (void)setFragments:(unint64_t)a3;
- (void)setHasMultipleResults:(BOOL)a3;
- (void)setHasUsedDate:(BOOL)a3;
- (void)setIsShortcut:(BOOL)a3;
- (void)setIsSingleThread:(BOOL)a3;
- (void)setMaxscore:(unint64_t)a3;
- (void)setParentWeight:(int)a3;
- (void)setPhraseScore:(double)a3;
- (void)setPrefixLen:(int)a3;
- (void)setProb:(double)a3;
- (void)setPunishment:(double)a3;
- (void)setQueryCompletionCount:(unint64_t)a3;
- (void)setQueryFragmentCount:(unint64_t)a3;
- (void)setQueryLen:(unint64_t)a3;
- (void)setRootWeight:(int)a3;
- (void)setWeight:(int)a3;
@end

@implementation SPSearchSuggestion

+ (id)suggestionsWithData:(id)a3 queryString:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  [v7 bytes];
  v28 = v7;
  [v7 length];
  CFTypeRef cf = (CFTypeRef)_MDPlistBytesCreateTrusted();
  v8 = (void *)_MDPlistBytesCopyPlistAtIndex();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v15, "count", cf) == 23)
        {
          v16 = [v15 objectAtIndexedSubscript:0];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_14;
          }
          v18 = [v15 objectAtIndexedSubscript:22];
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();

          if ((v19 & 1) == 0) {
            goto LABEL_14;
          }
          v20 = [v15 objectAtIndexedSubscript:0];
          v21 = [v15 objectAtIndexedSubscript:22];
          v22 = objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 2);
          v23 = [[SPSearchSuggestion alloc] initWithSuggestion:v20 query:v6 scores:v22 bundleIDs:v21];
          [(SPSearchSuggestion *)v23 setQuery:v6];
          if (v23) {
            [v9 addObject:v23];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }
LABEL_14:

  CFRelease(cf);
  v24 = [v9 allObjects];
  v25 = [v24 sortedArrayUsingSelector:sel_compare_];

  return v25;
}

+ (id)suggestionsWithNLPData:(id)a3 queryString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SPSearchSuggestion alloc] initWithNLPData:v6 queryString:v5];

  return v7;
}

- (SPSearchSuggestion)initWithSuggestion:(id)a3 query:(id)a4 scores:(id)a5 bundleIDs:(id)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  uint64_t v15 = [v12 count];
  if (v15 != 21)
  {
    v18 = 0;
    uint64_t v19 = 7;
    v20 = v14;
    goto LABEL_20;
  }
  v16 = [v12 objectAtIndexedSubscript:14];
  int v17 = [v16 integerValue];

  v18 = 0;
  uint64_t v19 = 7;
  if (v17 <= 7)
  {
    if (v17 != 3)
    {
      v20 = v14;
      uint64_t v15 = 21;
      if (v17 == 6)
      {
        v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v22 = [v21 localizedStringForKey:@"PHOTOS_SUGGESTION" value:&stru_1F1824018 table:@"SpotlightServices"];
        v20 = [v22 stringByReplacingOccurrencesOfString:@"%@" withString:v14];

        uint64_t v15 = 21;
        v18 = [NSString stringWithFormat:@"(kMDItemContentTypeTree=\"public.image\" && **=\"%@*\"cwd)", v14];
      }
      goto LABEL_20;
    }
    v35 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v36 = [v11 stringByTrimmingCharactersInSet:v35];

    v37 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    [v14 stringByTrimmingCharactersInSet:v37];
    v39 = v38 = v14;

    uint64_t v40 = [NSString stringWithFormat:@"%@ %@", v36, v39];

    v18 = [NSString stringWithFormat:@"(**=\"%@\"cwd && **=\"%@\"cwd)", v36, v39];

    id v14 = v38;
    v20 = (void *)v40;

LABEL_19:
    uint64_t v15 = 21;
    goto LABEL_20;
  }
  if (v17 == 8)
  {
    v18 = 0;
    uint64_t v19 = 2;
    v20 = v14;
    goto LABEL_19;
  }
  v20 = v14;
  uint64_t v15 = 21;
  if (v17 == 22)
  {
    v73 = self;
    id v76 = v11;
    uint64_t v77 = [v14 lowercaseString];

    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v75 = v14;
    v24 = [NSString stringWithFormat:@"**=\"%@\"cwd", v14];
    [v23 addObject:v24];

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v74 = v13;
    id v25 = v13;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v81 objects:v85 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v82 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = NSString;
          long long v31 = [*(id *)(*((void *)&v81 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@" " withString:@"*"];
          long long v32 = [v30 stringWithFormat:@"**=\"%@*\"cwd", v31];
          [v23 addObject:v32];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v81 objects:v85 count:16];
      }
      while (v27);
    }

    v33 = NSString;
    uint64_t v34 = [v23 componentsJoinedByString:@" || "];
    v18 = [v33 stringWithFormat:@"(%@)", v34];

    uint64_t v19 = 7;
    id v11 = v76;
    id v13 = v74;
    id v14 = v75;
    uint64_t v15 = 21;
    v20 = (void *)v77;
    self = v73;
  }
LABEL_20:
  v80.receiver = self;
  v80.super_class = (Class)SPSearchSuggestion;
  v41 = [(SPSearchSuggestion *)&v80 init];
  v42 = v41;
  if (v41)
  {
    v78 = v20;
    if (v15 == 21)
    {
      v43 = [v12 objectAtIndexedSubscript:0];
      v42->_queryLen = [v43 integerValue];

      v44 = [v12 objectAtIndexedSubscript:1];
      v42->_queryFragmentCount = [v44 integerValue];

      v45 = [v12 objectAtIndexedSubscript:2];
      v42->_queryCompletionCount = [v45 longLongValue];

      v46 = [v12 objectAtIndexedSubscript:3];
      v42->_fragments = [v46 integerValue];

      v47 = [v12 objectAtIndexedSubscript:4];
      [v47 doubleValue];
      v42->_age = v48;

      v49 = [v12 objectAtIndexedSubscript:5];
      [v49 doubleValue];
      v42->_prob = v50;

      v51 = [v12 objectAtIndexedSubscript:6];
      v42->_maxscore = (unint64_t)(double)[v51 longLongValue];

      v52 = [v12 objectAtIndexedSubscript:7];
      v42->_weight = [v52 intValue];

      v53 = [v12 objectAtIndexedSubscript:8];
      v42->_parentWeight = [v53 intValue];

      v54 = [v12 objectAtIndexedSubscript:9];
      v42->_rootWeight = [v54 integerValue];

      v55 = [v12 objectAtIndexedSubscript:10];
      [v55 doubleValue];
      v42->_phraseScore = v56;

      v57 = [v12 objectAtIndexedSubscript:11];
      [v57 doubleValue];
      v42->_punishment = v58;

      v59 = [v12 objectAtIndexedSubscript:12];
      [v59 doubleValue];
      p_compositeScore = &v42->_compositeScore;
      v42->_compositeScore = v61;

      v62 = [v12 objectAtIndexedSubscript:13];
      [v62 floatValue];
      v42->_fieldWeight = v63;

      v64 = [v12 objectAtIndexedSubscript:14];
      v42->_completionType = [v64 integerValue];

      v65 = [v12 objectAtIndexedSubscript:15];
      v42->_prefixLen = [v65 integerValue];

      v66 = [v12 objectAtIndexedSubscript:16];
      v42->_isSingleThread = [v66 integerValue] != 0;

      v67 = [v12 objectAtIndexedSubscript:17];
      v42->_hasUsedDate = [v67 integerValue] != 0;

      v68 = [v12 objectAtIndexedSubscript:18];
      v42->_isShortcut = [v68 integerValue] != 0;

      v69 = [v12 objectAtIndexedSubscript:19];
      v42->_hasMultipleResults = [v69 integerValue] != 0;

      v70 = (void *)[v13 copy];
    }
    else
    {
      v41->_queryLen = 0;
      v41->_queryFragmentCount = 0;
      v41->_queryCompletionCount = 0;
      v41->_fragments = 1;
      v41->_age = 1.0;
      v41->_prob = 0.0;
      v41->_maxscore = 0;
      v41->_weight = 0;
      v41->_parentWeight = 0;
      v41->_rootWeight = 0;
      v41->_phraseScore = 0.0;
      v41->_punishment = 0.0;
      p_compositeScore = &v41->_compositeScore;
      v41->_compositeScore = 1.0;
      v41->_fieldWeight = 0.0;
      v41->_completionType = 1;
      v41->_prefixLen = 0;
      v41->_isSingleThread = 0;
      v41->_hasUsedDate = 0;
      v41->_isShortcut = 0;
      v41->_hasMultipleResults = 0;
      v70 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v42->_bundleIDs, v70);
    if (v15 == 21) {

    }
    objc_storeStrong((id *)&v42->_completion, a3);
    objc_storeStrong((id *)&v42->_spotlightQuery, v18);
    categories = v42->_categories;
    v42->_categories = 0;

    [(SPSearchSuggestion *)v42 setScore:*p_compositeScore];
    v20 = v78;
    [(SPSearchSuggestion *)v42 setSuggestion:v78];
    [(SPSearchSuggestion *)v42 setQuery:v11];
    [(SPSearchSuggestion *)v42 setType:v19];
  }

  return v42;
}

- (SPSearchSuggestion)initWithNLPData:(id)a3 queryString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"suggestion"];
  v9 = [v7 objectForKeyedSubscript:@"query"];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"tokenCount"];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = &unk_1F1861100;
  }
  id v13 = v12;

  uint64_t v14 = [v7 objectForKeyedSubscript:@"attributeCount"];
  uint64_t v15 = (void *)v14;
  if (v14) {
    v16 = (void *)v14;
  }
  else {
    v16 = &unk_1F1861100;
  }
  id v17 = v16;

  uint64_t v18 = [v7 objectForKeyedSubscript:@"categories"];
  uint64_t v19 = (void *)v18;
  v20 = (void *)MEMORY[0x1E4F1CC08];
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = (void *)MEMORY[0x1E4F1CC08];
  }
  id obj = v21;
  id v30 = v21;

  v22 = [v7 objectForKeyedSubscript:@"terms"];

  if (v22) {
    id v23 = v22;
  }
  else {
    id v23 = v20;
  }
  id v24 = v23;

  v31.receiver = self;
  v31.super_class = (Class)SPSearchSuggestion;
  id v25 = [(SPSearchSuggestion *)&v31 init];
  if (v25)
  {
    v25->_queryLen = [v6 length];
    v25->_queryFragmentCount = (int)[v13 intValue];
    v25->_queryCompletionCount = 20;
    v25->_fragments = [v17 integerValue];
    v25->_age = 0.0;
    v25->_prob = 0.0;
    v25->_maxscore = 0;
    v25->_weight = 0;
    v25->_parentWeight = 0;
    v25->_rootWeight = 0;
    v25->_phraseScore = 0.0;
    v25->_punishment = 0.0;
    v25->_compositeScore = 1.79769313e308;
    v25->_fieldWeight = 0.0;
    v25->_completionType = 5;
    v25->_prefixLen = 0;
    v25->_isSingleThread = 0;
    v25->_hasUsedDate = 0;
    v25->_isShortcut = 0;
    v25->_hasMultipleResults = 0;
    bundleIDs = v25->_bundleIDs;
    v25->_bundleIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    completion = v25->_completion;
    v25->_completion = 0;

    objc_storeStrong((id *)&v25->_categories, obj);
    objc_storeStrong((id *)&v25->_terms, v23);
    objc_storeStrong((id *)&v25->_spotlightQuery, v9);
    [(SPSearchSuggestion *)v25 setSuggestion:v8];
    [(SPSearchSuggestion *)v25 setQuery:v6];
    [(SPSearchSuggestion *)v25 setType:15];
  }

  return v25;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SPSearchSuggestion;
  id v4 = a3;
  [(SPSearchSuggestion *)&v12 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_queryLen), @"queryLen", v12.receiver, v12.super_class);
  [v4 encodeInt:LODWORD(self->_queryFragmentCount) forKey:@"queryFragmentCount"];
  [v4 encodeInt64:self->_queryCompletionCount forKey:@"queryCompletionCount"];
  [v4 encodeInt:LODWORD(self->_fragments) forKey:@"fragments"];
  [v4 encodeDouble:@"age" forKey:self->_age];
  [v4 encodeDouble:@"prob" forKey:self->_prob];
  [v4 encodeInt64:self->_maxscore forKey:@"maxscore"];
  [v4 encodeInt:self->_weight forKey:@"weight"];
  [v4 encodeInt:self->_parentWeight forKey:@"parentWeight"];
  [v4 encodeInt:self->_rootWeight forKey:@"rootWeight"];
  [v4 encodeDouble:@"phraseScore" forKey:self->_phraseScore];
  [v4 encodeDouble:@"punishment" forKey:self->_punishment];
  [v4 encodeDouble:@"compositeScore" forKey:self->_compositeScore];
  [v4 encodeInt:self->_completionType forKey:@"completionType"];
  [v4 encodeInt:self->_prefixLen forKey:@"prefixLen"];
  *(float *)&double v5 = self->_fieldWeight;
  [v4 encodeFloat:@"fieldWeight" forKey:v5];
  [v4 encodeBool:self->_isSingleThread forKey:@"isSingleThread"];
  [v4 encodeBool:self->_hasUsedDate forKey:@"hasUsedDate"];
  [v4 encodeBool:self->_isShortcut forKey:@"isShortcut"];
  [v4 encodeBool:self->_hasMultipleResults forKey:@"hasMultipleResults"];
  if (self->_bundleIDs) {
    bundleIDs = self->_bundleIDs;
  }
  else {
    bundleIDs = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [v4 encodeObject:bundleIDs forKey:@"bundleIDs"];
  if (self->_completion) {
    completion = (__CFString *)self->_completion;
  }
  else {
    completion = &stru_1F1824018;
  }
  [v4 encodeObject:completion forKey:@"completion"];
  if (self->_spotlightQuery) {
    spotlightQuery = (__CFString *)self->_spotlightQuery;
  }
  else {
    spotlightQuery = &stru_1F1824018;
  }
  [v4 encodeObject:spotlightQuery forKey:@"spotlightQuery"];
  v9 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  if (self->_categories) {
    categories = self->_categories;
  }
  else {
    categories = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  [v4 encodeObject:categories forKey:@"categories"];
  if (self->_terms) {
    terms = self->_terms;
  }
  else {
    terms = v9;
  }
  [v4 encodeObject:terms forKey:@"terms"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SPSearchSuggestion *)self suggestion];
    id v7 = [v5 suggestion];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SPSearchSuggestion *)self query];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPSearchSuggestion *)self suggestion];
  id v6 = [(SPSearchSuggestion *)self suggestion];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p> \"%@\" len:%ld fragments:%ld max_score:%llu age:%g weight:%d pweight:%d rweight:%d c_score:%g type:%d pfx_len:%d st:%d phrase_score:%g field_weight:%f hasUsed:%d isShortcut:%d", v4, self, v5, objc_msgSend(v6, "length"), self->_fragments, self->_maxscore, *(void *)&self->_age, self->_weight, self->_parentWeight, self->_rootWeight, *(void *)&self->_compositeScore, self->_completionType, self->_prefixLen, self->_isSingleThread, *(void *)&self->_phraseScore, self->_fieldWeight,
    self->_hasUsedDate,
  id v7 = self->_isShortcut);

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if ((int)[v4 completionType] > self->_completionType) {
    goto LABEL_2;
  }
  if ((int)[v4 completionType] < self->_completionType
    || ([v4 compositeScore], v6 > self->_compositeScore))
  {
LABEL_5:
    int64_t v5 = -1;
    goto LABEL_6;
  }
  [v4 compositeScore];
  if (v8 < self->_compositeScore) {
    goto LABEL_2;
  }
  if ([v4 isShortcut] && !self->_isShortcut) {
    goto LABEL_5;
  }
  if (self->_isShortcut > [v4 isShortcut])
  {
LABEL_2:
    int64_t v5 = 1;
    goto LABEL_6;
  }
  if (([v4 hasUsedDate] & 1) == 0 && !self->_hasUsedDate)
  {
    [v4 age];
    if (v11 < self->_age) {
      goto LABEL_5;
    }
    [v4 age];
    if (v12 <= self->_age)
    {
      if ([v4 maxscore] > self->_maxscore) {
        goto LABEL_5;
      }
      if ([v4 maxscore] >= self->_maxscore)
      {
        if ((int)[v4 weight] < self->_weight) {
          goto LABEL_5;
        }
        if ((int)[v4 weight] <= self->_weight)
        {
          if ([v4 fragments] < self->_fragments) {
            goto LABEL_5;
          }
          if ([v4 fragments] <= self->_fragments)
          {
            id v13 = [v4 suggestion];
            unint64_t v14 = [v13 length];
            uint64_t v15 = [(SPSearchSuggestion *)self suggestion];
            unint64_t v16 = [v15 length];

            if (v14 >= v16)
            {
              id v17 = [v4 suggestion];
              unint64_t v18 = [v17 length];
              uint64_t v19 = [(SPSearchSuggestion *)self suggestion];
              int64_t v5 = v18 > [v19 length];

              goto LABEL_6;
            }
            goto LABEL_5;
          }
        }
      }
    }
    goto LABEL_2;
  }
  if ([v4 hasUsedDate] && self->_hasUsedDate)
  {
    [v4 age];
    if (v9 >= self->_age)
    {
      [v4 age];
      int64_t v5 = v10 > self->_age;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ([v4 hasUsedDate]) {
    int64_t v5 = -1;
  }
  else {
    int64_t v5 = 1;
  }
LABEL_6:

  return v5;
}

- (id)suggestionsFeedbackData
{
  v40[22] = *MEMORY[0x1E4F143B8];
  v39[0] = @"queryLen";
  unint64_t v3 = SSRoundDouble(4, (double)[(SPSearchSuggestion *)self queryLen]);
  v40[0] = v3;
  v39[1] = @"queryFragmentCount";
  id v4 = SSRoundDouble(4, (double)[(SPSearchSuggestion *)self queryFragmentCount]);
  v40[1] = v4;
  v39[2] = @"queryCompletionCount";
  int64_t v5 = SSRoundUInt64([(SPSearchSuggestion *)self queryCompletionCount]);
  v40[2] = v5;
  v39[3] = @"len";
  double v6 = [(SPSearchSuggestion *)self suggestion];
  id v7 = SSRoundDouble(4, (double)(unint64_t)[v6 length]);
  v40[3] = v7;
  v39[4] = @"fragments";
  double v8 = SSRoundDouble(4, (double)[(SPSearchSuggestion *)self fragments]);
  v40[4] = v8;
  v39[5] = @"age";
  [(SPSearchSuggestion *)self age];
  double v10 = SSRoundDouble(4, v9);
  v40[5] = v10;
  v39[6] = @"prob";
  [(SPSearchSuggestion *)self prob];
  double v12 = SSRoundDouble(2, v11);
  v40[6] = v12;
  v39[7] = @"maxscore";
  v38 = SSRoundUInt64([(SPSearchSuggestion *)self maxscore]);
  v40[7] = v38;
  v39[8] = @"weight";
  v37 = SSRoundDouble(4, (double)[(SPSearchSuggestion *)self weight]);
  v40[8] = v37;
  v39[9] = @"parentWeight";
  v36 = SSRoundDouble(4, (double)[(SPSearchSuggestion *)self parentWeight]);
  v40[9] = v36;
  v39[10] = @"rootWeight";
  v35 = SSRoundDouble(4, (double)[(SPSearchSuggestion *)self rootWeight]);
  v40[10] = v35;
  v39[11] = @"phraseScore";
  [(SPSearchSuggestion *)self phraseScore];
  uint64_t v34 = SSRoundDouble(4, v13);
  v40[11] = v34;
  v39[12] = @"punishment";
  [(SPSearchSuggestion *)self punishment];
  v33 = SSRoundDouble(4, v14);
  v40[12] = v33;
  v39[13] = @"compositeScore";
  [(SPSearchSuggestion *)self compositeScore];
  double v16 = v15;
  double v17 = 0.0;
  if (v16 != 1.79769313e308) {
    [(SPSearchSuggestion *)self compositeScore];
  }
  long long v32 = SSRoundDouble(4, v17);
  v40[13] = v32;
  v39[14] = @"completionType";
  objc_super v31 = SSRoundDouble(4, (double)[(SPSearchSuggestion *)self completionType]);
  v40[14] = v31;
  v39[15] = @"prefixLen";
  id v30 = SSRoundDouble(4, (double)[(SPSearchSuggestion *)self prefixLen]);
  v40[15] = v30;
  v39[16] = @"fieldWeight";
  [(SPSearchSuggestion *)self fieldWeight];
  long long v29 = SSRoundDouble(4, v18);
  v40[16] = v29;
  v39[17] = @"isSingleThread";
  if ([(SPSearchSuggestion *)self isSingleThread]) {
    uint64_t v19 = &unk_1F1861118;
  }
  else {
    uint64_t v19 = &unk_1F1861100;
  }
  v40[17] = v19;
  v39[18] = @"hasUsedDate";
  if ([(SPSearchSuggestion *)self hasUsedDate]) {
    v20 = &unk_1F1861118;
  }
  else {
    v20 = &unk_1F1861100;
  }
  v40[18] = v20;
  v39[19] = @"isShortcut";
  if ([(SPSearchSuggestion *)self isShortcut]) {
    v21 = &unk_1F1861118;
  }
  else {
    v21 = &unk_1F1861100;
  }
  v40[19] = v21;
  v39[20] = @"hasMultipleResults";
  if ([(SPSearchSuggestion *)self hasMultipleResults]) {
    v22 = &unk_1F1861118;
  }
  else {
    v22 = &unk_1F1861100;
  }
  v40[20] = v22;
  v39[21] = @"bundleIDs";
  uint64_t v23 = [(SPSearchSuggestion *)self bundleIDs];
  id v24 = (void *)v23;
  uint64_t v25 = MEMORY[0x1E4F1CBF0];
  if (v23) {
    uint64_t v25 = v23;
  }
  v40[21] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:22];

  uint64_t v27 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v26 options:2 error:0];

  return v27;
}

- (NSArray)searchEntities
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (self->_spotlightQuery)
  {
    unint64_t v3 = [(SPSearchSuggestion *)self suggestion];
    spotlightQuery = self->_spotlightQuery;
    int64_t v5 = [(SPSearchSuggestion *)self bundleIDs];
    double v6 = +[SPSearchEntity searchEntityWithSearchString:v3 spotlightQueryString:spotlightQuery preferredBundleIDs:v5];
  }
  else
  {
    id v7 = [(SPSearchSuggestion *)self suggestion];
    double v8 = objc_msgSend(v7, "substringFromIndex:", -[SPSearchSuggestion prefixLen](self, "prefixLen"));
    unint64_t v3 = SSEscapedStringForSearchQuery(v8);

    int64_t v5 = [(SPSearchSuggestion *)self suggestion];
    double v9 = [NSString stringWithFormat:@"**=\"%@\"cwd || _kMDItemLaunchString=\"%@\"cwd", v3, v3];
    double v10 = [(SPSearchSuggestion *)self bundleIDs];
    double v6 = +[SPSearchEntity searchEntityWithSearchString:v5 spotlightQueryString:v9 preferredBundleIDs:v10];
  }
  v13[0] = v6;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return (NSArray *)v11;
}

- (unint64_t)queryLen
{
  return self->_queryLen;
}

- (void)setQueryLen:(unint64_t)a3
{
  self->_queryLen = a3;
}

- (unint64_t)queryFragmentCount
{
  return self->_queryFragmentCount;
}

- (void)setQueryFragmentCount:(unint64_t)a3
{
  self->_queryFragmentCount = a3;
}

- (unint64_t)queryCompletionCount
{
  return self->_queryCompletionCount;
}

- (void)setQueryCompletionCount:(unint64_t)a3
{
  self->_queryCompletionCount = a3;
}

- (unint64_t)fragments
{
  return self->_fragments;
}

- (void)setFragments:(unint64_t)a3
{
  self->_fragments = a3;
}

- (double)age
{
  return self->_age;
}

- (void)setAge:(double)a3
{
  self->_age = a3;
}

- (double)prob
{
  return self->_prob;
}

- (void)setProb:(double)a3
{
  self->_prob = a3;
}

- (unint64_t)maxscore
{
  return self->_maxscore;
}

- (void)setMaxscore:(unint64_t)a3
{
  self->_maxscore = a3;
}

- (int)weight
{
  return self->_weight;
}

- (void)setWeight:(int)a3
{
  self->_weight = a3;
}

- (int)parentWeight
{
  return self->_parentWeight;
}

- (void)setParentWeight:(int)a3
{
  self->_parentWeight = a3;
}

- (int)rootWeight
{
  return self->_rootWeight;
}

- (void)setRootWeight:(int)a3
{
  self->_rootWeight = a3;
}

- (double)phraseScore
{
  return self->_phraseScore;
}

- (void)setPhraseScore:(double)a3
{
  self->_phraseScore = a3;
}

- (double)punishment
{
  return self->_punishment;
}

- (void)setPunishment:(double)a3
{
  self->_punishment = a3;
}

- (double)compositeScore
{
  return self->_compositeScore;
}

- (void)setCompositeScore:(double)a3
{
  self->_compositeScore = a3;
}

- (int)completionType
{
  return self->_completionType;
}

- (void)setCompletionType:(int)a3
{
  self->_completionType = a3;
}

- (int)prefixLen
{
  return self->_prefixLen;
}

- (void)setPrefixLen:(int)a3
{
  self->_prefixLen = a3;
}

- (float)fieldWeight
{
  return self->_fieldWeight;
}

- (void)setFieldWeight:(float)a3
{
  self->_fieldWeight = a3;
}

- (BOOL)isSingleThread
{
  return self->_isSingleThread;
}

- (void)setIsSingleThread:(BOOL)a3
{
  self->_isSingleThread = a3;
}

- (BOOL)hasUsedDate
{
  return self->_hasUsedDate;
}

- (void)setHasUsedDate:(BOOL)a3
{
  self->_hasUsedDate = a3;
}

- (BOOL)isShortcut
{
  return self->_isShortcut;
}

- (void)setIsShortcut:(BOOL)a3
{
  self->_isShortcut = a3;
}

- (BOOL)hasMultipleResults
{
  return self->_hasMultipleResults;
}

- (void)setHasMultipleResults:(BOOL)a3
{
  self->_hasMultipleResults = a3;
}

- (NSArray)bundleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_terms, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_spotlightQuery, 0);
  objc_storeStrong((id *)&self->_completion, 0);
}

@end