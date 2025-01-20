@interface PLSearchSuggestionCandidate
+ (BOOL)supportsSecureCoding;
+ (id)updateCandidates:(id)a3 withTimestampsFromPreviouslyStoredCandidates:(id)a4;
- (BOOL)hasDateFilter;
- (BOOL)hasFirstCategory;
- (BOOL)hasSecondCategory;
- (BOOL)isEqual:(id)a3;
- (PLSearchSuggestionCandidate)initWithCoder:(id)a3;
- (PLSearchSuggestionCandidate)initWithSearchSuggestionTemplate:(id)a3 firstGroup:(id)a4 secondGroup:(id)a5 assetIdsForDateFilter:(__CFArray *)a6 minAssetResultCountPerSuggestion:(unint64_t)a7 styleType:(unint64_t)a8;
- (PLSearchSuggestionTemplate)suggestionTemplate;
- (PSIRankedGroupV2)firstGroup;
- (PSIRankedGroupV2)secondGroup;
- (__CFArray)assetIdsForDateFilter;
- (double)timeSinceLastUsed;
- (float)rankingScore;
- (id)description;
- (id)jsonDictionary;
- (id)populatedTemplateQueryString;
- (id)populatedTemplateQueryStringInLocalization:(id)a3;
- (unint64_t)hash;
- (unint64_t)intersectionCount;
- (unint64_t)minAssetResultCountPerSuggestion;
- (unint64_t)styleType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetIdsForDateFilter:(__CFArray *)a3;
- (void)setIntersectionCount:(unint64_t)a3;
- (void)setMinAssetResultCountPerSuggestion:(unint64_t)a3;
- (void)setRankingScore:(float)a3;
- (void)setTimeSinceLastUsed:(double)a3;
@end

@implementation PLSearchSuggestionCandidate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PLSearchSuggestionCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionCandidatePropertySuggestionTemplate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionCandidatePropertyFirstGroup"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionCandidatePropertySecondGroup"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionCandidatePropertyTimeStamp"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionCandidateStyleType"];

  uint64_t v12 = [v11 unsignedIntegerValue];
  v13 = [(PLSearchSuggestionCandidate *)self initWithSearchSuggestionTemplate:v5 firstGroup:v6 secondGroup:v7 assetIdsForDateFilter:0 minAssetResultCountPerSuggestion:0 styleType:v12];
  [(PLSearchSuggestionCandidate *)v13 setTimeSinceLastUsed:v10];

  return v13;
}

- (void)setTimeSinceLastUsed:(double)a3
{
  self->_timeSinceLastUsed = a3;
}

- (PLSearchSuggestionCandidate)initWithSearchSuggestionTemplate:(id)a3 firstGroup:(id)a4 secondGroup:(id)a5 assetIdsForDateFilter:(__CFArray *)a6 minAssetResultCountPerSuggestion:(unint64_t)a7 styleType:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (a8 == 1)
  {
    if (!v15 || !v16)
    {
      v18 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "Nil template and/or group provided for candidate initializer in non tier 0 locale, unable to initialize candidate";
        goto LABEL_16;
      }
LABEL_17:

      v22 = 0;
      goto LABEL_18;
    }
  }
  else if (!a8 && !v15)
  {
    v18 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Nil template provided for candidate initializer in tier 0 locale, unable to initialize candidate";
LABEL_16:
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v24.receiver = self;
  v24.super_class = (Class)PLSearchSuggestionCandidate;
  v20 = [(PLSearchSuggestionCandidate *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_firstGroup, a4);
    objc_storeStrong((id *)&v21->_suggestionTemplate, a3);
    if (!a8)
    {
      objc_storeStrong((id *)&v21->_secondGroup, a5);
      if (a6) {
        v21->_assetIdsForDateFilter = (__CFArray *)CFRetain(a6);
      }
    }
    v21->_minAssetResultCountPerSuggestion = a7;
    v21->_rankingScore = 9.2234e18;
    v21->_intersectionCount = 0x7FFFFFFFFFFFFFFFLL;
    v21->_styleType = a8;
  }
  self = v21;
  v22 = self;
LABEL_18:

  return v22;
}

- (double)timeSinceLastUsed
{
  return self->_timeSinceLastUsed;
}

- (PLSearchSuggestionTemplate)suggestionTemplate
{
  return self->_suggestionTemplate;
}

- (PSIRankedGroupV2)firstGroup
{
  return self->_firstGroup;
}

- (PSIRankedGroupV2)secondGroup
{
  return self->_secondGroup;
}

- (unint64_t)styleType
{
  return self->_styleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondGroup, 0);
  objc_storeStrong((id *)&self->_firstGroup, 0);
  objc_storeStrong((id *)&self->_suggestionTemplate, 0);
}

- (void)setMinAssetResultCountPerSuggestion:(unint64_t)a3
{
  self->_minAssetResultCountPerSuggestion = a3;
}

- (unint64_t)minAssetResultCountPerSuggestion
{
  return self->_minAssetResultCountPerSuggestion;
}

- (void)setAssetIdsForDateFilter:(__CFArray *)a3
{
}

- (__CFArray)assetIdsForDateFilter
{
  return self->_assetIdsForDateFilter;
}

- (void)setRankingScore:(float)a3
{
  self->_rankingScore = a3;
}

- (void)setIntersectionCount:(unint64_t)a3
{
  self->_intersectionCount = a3;
}

- (void)dealloc
{
  assetIdsForDateFilter = self->_assetIdsForDateFilter;
  if (assetIdsForDateFilter) {
    CFRelease(assetIdsForDateFilter);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLSearchSuggestionCandidate;
  [(PLSearchSuggestionCandidate *)&v4 dealloc];
}

- (id)jsonDictionary
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PLSearchSuggestionCandidate *)self populatedTemplateQueryString];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v26[0] = @"intersection_count";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLSearchSuggestionCandidate intersectionCount](self, "intersectionCount"));
  v27[0] = v5;
  v26[1] = @"ranking_score";
  v6 = NSNumber;
  [(PLSearchSuggestionCandidate *)self rankingScore];
  v7 = objc_msgSend(v6, "numberWithFloat:");
  v27[1] = v7;
  v26[2] = @"time_last_used";
  v8 = NSNumber;
  [(PLSearchSuggestionCandidate *)self timeSinceLastUsed];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  v27[2] = v9;
  v26[3] = @"style_type";
  double v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLSearchSuggestionCandidate styleType](self, "styleType"));
  v27[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  uint64_t v12 = (void *)[v4 initWithDictionary:v11];

  if (v3)
  {
    v13 = [v3 string];
    [v12 setObject:v13 forKeyedSubscript:@"query_string"];
  }
  v14 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
  id v15 = [v14 suggestionTemplateKey];

  if (v15)
  {
    id v16 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
    id v17 = [v16 suggestionTemplateKey];
    [v12 setObject:v17 forKeyedSubscript:@"suggestion_template"];
  }
  v18 = [(PLSearchSuggestionCandidate *)self firstGroup];

  if (v18)
  {
    v19 = [(PLSearchSuggestionCandidate *)self firstGroup];
    v20 = [v19 jsonDictionary];
    [v12 setObject:v20 forKeyedSubscript:@"first_group"];
  }
  v21 = [(PLSearchSuggestionCandidate *)self secondGroup];

  if (v21)
  {
    v22 = [(PLSearchSuggestionCandidate *)self secondGroup];
    v23 = [v22 jsonDictionary];
    [v12 setObject:v23 forKeyedSubscript:@"second_group"];
  }
  objc_super v24 = (void *)[v12 copy];

  return v24;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_timeSinceLastUsed];
  id v4 = NSString;
  v5 = [(PLSearchSuggestionTemplate *)self->_suggestionTemplate description];
  firstGroup = self->_firstGroup;
  secondGroup = self->_secondGroup;
  [(PLSearchSuggestionCandidate *)self rankingScore];
  double v9 = [v4 stringWithFormat:@"template: %@, first entity: %@, second entity: %@, ranking score: %f, intersection count: %tu, date last used: %@, style type: %tu", v5, firstGroup, secondGroup, v8, self->_intersectionCount, v3, self->_styleType];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  suggestionTemplate = self->_suggestionTemplate;
  id v5 = a3;
  [v5 encodeObject:suggestionTemplate forKey:@"PLSearchSuggestionCandidatePropertySuggestionTemplate"];
  [v5 encodeObject:self->_firstGroup forKey:@"PLSearchSuggestionCandidatePropertyFirstGroup"];
  [v5 encodeObject:self->_secondGroup forKey:@"PLSearchSuggestionCandidatePropertySecondGroup"];
  v6 = [NSNumber numberWithDouble:self->_timeSinceLastUsed];
  [v5 encodeObject:v6 forKey:@"PLSearchSuggestionCandidatePropertyTimeStamp"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_styleType];
  [v5 encodeObject:v7 forKey:@"PLSearchSuggestionCandidateStyleType"];
}

- (unint64_t)hash
{
  v3 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
  uint64_t v4 = [v3 hash];
  id v5 = [(PLSearchSuggestionCandidate *)self firstGroup];
  uint64_t v6 = [v5 groupId] ^ v4;
  id v7 = [(PLSearchSuggestionCandidate *)self secondGroup];
  uint64_t v8 = [v7 groupId];
  unint64_t v9 = v6 ^ v8 ^ [(PLSearchSuggestionCandidate *)self styleType];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PLSearchSuggestionCandidate *)a3;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(PLSearchSuggestionCandidate *)self styleType];
      if (v6 != [(PLSearchSuggestionCandidate *)v5 styleType]) {
        goto LABEL_9;
      }
      id v7 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
      uint64_t v8 = [(PLSearchSuggestionCandidate *)v5 suggestionTemplate];
      int v9 = [v7 isEqual:v8];

      if (!v9) {
        goto LABEL_9;
      }
      double v10 = [(PLSearchSuggestionCandidate *)self firstGroup];
      uint64_t v11 = [v10 groupId];
      uint64_t v12 = [(PLSearchSuggestionCandidate *)v5 firstGroup];
      uint64_t v13 = [v12 groupId];

      if (v11 == v13)
      {
        v14 = [(PLSearchSuggestionCandidate *)self secondGroup];
        uint64_t v15 = [v14 groupId];
        id v16 = [(PLSearchSuggestionCandidate *)v5 secondGroup];
        BOOL v17 = v15 == [v16 groupId];
      }
      else
      {
LABEL_9:
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (BOOL)hasDateFilter
{
  if ([(PLSearchSuggestionCandidate *)self styleType] == 1) {
    return 0;
  }
  uint64_t v4 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
  BOOL v3 = [v4 templateDateType] != 0;

  return v3;
}

- (BOOL)hasSecondCategory
{
  if ([(PLSearchSuggestionCandidate *)self styleType] == 1)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    uint64_t v4 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
    unint64_t v5 = [v4 templateType];

    return (v5 >> 1) & 1;
  }
  return v3;
}

- (BOOL)hasFirstCategory
{
  unint64_t v3 = [(PLSearchSuggestionCandidate *)self styleType];
  if (v3 != 1)
  {
    uint64_t v4 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
    char v5 = [v4 templateType];

    LOBYTE(v3) = v5 & 1;
  }
  return v3;
}

- (id)populatedTemplateQueryStringInLocalization:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(PLSearchSuggestionCandidate *)self firstGroup];
  unint64_t v6 = [v5 displayString];

  id v7 = [(PLSearchSuggestionCandidate *)self secondGroup];
  uint64_t v8 = [v7 displayString];

  unint64_t v9 = [(PLSearchSuggestionCandidate *)self styleType];
  double v10 = @"SINGLE_ENTITY_KEY";
  if (v9 != 1) {
    double v10 = 0;
  }
  uint64_t v11 = v10;
  if (v4)
  {
    uint64_t v12 = PLPhotoLibraryServicesFrameworkBundle();
    uint64_t v13 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
    v14 = [v13 suggestionTemplateKey];
    uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_1EEB2EB80 table:@"PhotoLibraryServices" localization:v4];
  }
  else
  {
    uint64_t v12 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
    uint64_t v13 = [v12 suggestionTemplateKey];
    uint64_t v15 = PLServicesLocalizedFrameworkString();
  }

  if (v9 != 1 && ![v15 length])
  {
    v20 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v32 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
      v33 = [v32 suggestionTemplateKey];
      *(_DWORD *)buf = 138412290;
      v49 = v33;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Unable to locate template for key: %@.", buf, 0xCu);

LABEL_25:
    }
LABEL_26:
    v22 = 0;
    goto LABEL_54;
  }
  id v16 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
  int v17 = [v16 isDateOnlyTemplate];

  v18 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
  int v19 = [(__CFString *)v18 isMeTemplate];

  v47 = v15;
  if (v9 != 1)
  {
    if ([(PLSearchSuggestionCandidate *)self hasFirstCategory]
      && [(PLSearchSuggestionCandidate *)self hasSecondCategory])
    {
      if (v19)
      {
        v27 = [(PLSearchSuggestionCandidate *)self firstGroup];
        int v28 = [v27 isMePerson];

        if (v28)
        {
          v45 = v8;
        }
        else
        {
          v37 = [(PLSearchSuggestionCandidate *)self secondGroup];
          int v38 = [v37 isMePerson];

          if (!v38)
          {
            v20 = 0;
LABEL_45:
            if ([v20 length])
            {
              v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20];
              v39 = [(PLSearchSuggestionCandidate *)self firstGroup];
              v21 = v6;
              uint64_t v40 = [v20 rangeOfString:v6];
              v18 = @"PLSearchQueryRankedGroupAttribute";
              objc_msgSend(v22, "addAttribute:value:range:", @"PLSearchQueryRankedGroupAttribute", v39, v40, v41);

              objc_super v24 = [(PLSearchSuggestionCandidate *)self secondGroup];
              v23 = v8;
              uint64_t v30 = [v20 rangeOfString:v8];
              v31 = v22;
              goto LABEL_22;
            }
            goto LABEL_47;
          }
          v45 = v6;
        }
LABEL_44:
        v20 = PFStringWithValidatedFormat();
        goto LABEL_45;
      }
      if ([(__CFString *)v6 length] && [(__CFString *)v8 length])
      {
        v45 = v6;
        v46 = v8;
        goto LABEL_44;
      }
      v20 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v32 = [(PLSearchSuggestionCandidate *)self description];
        *(_DWORD *)buf = 138412290;
        v49 = v32;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Unable to populate template with mutliple categories: %@.", buf, 0xCu);
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    if ([(PLSearchSuggestionCandidate *)self hasFirstCategory])
    {
      v18 = v6;
      if ([(__CFString *)v6 length])
      {
        v23 = v8;
        v20 = PFStringWithValidatedFormat();
        if ([v20 length])
        {
          v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20];
          objc_super v24 = [(PLSearchSuggestionCandidate *)self firstGroup];
          v25 = v20;
          v21 = v18;
          v26 = v18;
          goto LABEL_21;
        }
        v21 = v18;
LABEL_48:
        v22 = 0;
        goto LABEL_49;
      }
      v21 = v6;
      v23 = v8;
      v34 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [(PLSearchSuggestionCandidate *)self description];
        *(_DWORD *)buf = 138412290;
        v49 = v35;
        v36 = "Unable to populate template with single category: %@.";
        goto LABEL_34;
      }
    }
    else
    {
      v21 = v6;
      v23 = v8;
      if (v17)
      {
        v20 = v47;
        if ([v20 length])
        {
          v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20];
          goto LABEL_49;
        }
        goto LABEL_48;
      }
      v34 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [(PLSearchSuggestionCandidate *)self description];
        *(_DWORD *)buf = 138412290;
        v49 = v35;
        v36 = "Unable to populate invalid template: %@.";
LABEL_34:
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
      }
    }

    v22 = 0;
    v20 = 0;
    goto LABEL_49;
  }
  v20 = v6;
  if (![v20 length])
  {
LABEL_47:
    v21 = v6;
    v23 = v8;
    goto LABEL_48;
  }
  v21 = v6;
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20];
  v23 = v8;
  if ([(PLSearchSuggestionCandidate *)self hasFirstCategory])
  {
    objc_super v24 = [(PLSearchSuggestionCandidate *)self firstGroup];
    v25 = v20;
    v26 = v20;
LABEL_21:
    uint64_t v30 = [v25 rangeOfString:v26];
    v31 = v22;
LABEL_22:
    objc_msgSend(v31, "addAttribute:value:range:", @"PLSearchQueryRankedGroupAttribute", v24, v30, v29);
  }
LABEL_49:
  uint64_t v42 = [(__CFString *)v11 length];
  v43 = v11;
  if (!v42)
  {
    v18 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
    v43 = [(__CFString *)v18 suggestionTemplateKey];
  }
  objc_msgSend(v22, "addAttribute:value:range:", @"PLSearchQueryTemplateTypeAttribute", v43, 0, objc_msgSend(v22, "length"));
  if (!v42)
  {
  }
  uint64_t v8 = v23;
  unint64_t v6 = v21;
  uint64_t v15 = v47;
LABEL_54:

  return v22;
}

- (id)populatedTemplateQueryString
{
  return [(PLSearchSuggestionCandidate *)self populatedTemplateQueryStringInLocalization:0];
}

- (float)rankingScore
{
  float result = self->_rankingScore;
  if (result == 9.2234e18)
  {
    float v4 = (float)[(PLSearchSuggestionCandidate *)self intersectionCount];
    unint64_t v5 = [(PLSearchSuggestionCandidate *)self minAssetResultCountPerSuggestion];
    double v6 = 1.0;
    if (v4 < (float)v5)
    {
      if (v5) {
        double v6 = (float)(v4 / (float)v5);
      }
      else {
        double v6 = 0.0;
      }
    }
    if ([(PLSearchSuggestionCandidate *)self hasFirstCategory]
      && [(PLSearchSuggestionCandidate *)self hasSecondCategory])
    {
      id v7 = [(PLSearchSuggestionCandidate *)self firstGroup];
      [v7 rankingScore];
      double v9 = v8 * 0.25 + v6 * 0.5;
      double v10 = [(PLSearchSuggestionCandidate *)self secondGroup];
      [v10 rankingScore];
      float v12 = v9 + v11 * 0.25;
      self->_rankingScore = v12;
    }
    else
    {
      if (![(PLSearchSuggestionCandidate *)self hasFirstCategory]) {
        goto LABEL_12;
      }
      id v7 = [(PLSearchSuggestionCandidate *)self firstGroup];
      [v7 rankingScore];
      float v14 = v13 * 0.5 + v6 * 0.5;
      self->_rankingScore = v14;
    }

LABEL_12:
    uint64_t v15 = [(PLSearchSuggestionCandidate *)self suggestionTemplate];
    char v16 = [v15 isDateOnlyTemplate];

    if (v16)
    {
      +[PLScopedSearchSuggestionGeneration initialSuggestionScoreForIndexCategory:1102];
      float result = v17;
      self->_rankingScore = result;
    }
    else
    {
      return self->_rankingScore;
    }
  }
  return result;
}

- (unint64_t)intersectionCount
{
  unint64_t result = self->_intersectionCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    float v4 = [(PLSearchSuggestionCandidate *)self firstGroup];
    CFArrayRef v5 = (const __CFArray *)[v4 groupAssetIds];

    double v6 = [(PLSearchSuggestionCandidate *)self secondGroup];
    uint64_t v7 = [v6 groupAssetIds];

    float v8 = [(PLSearchSuggestionCandidate *)self assetIdsForDateFilter];
    CFTypeRef cf = 0;
    if ([(PLSearchSuggestionCandidate *)self hasFirstCategory]
      && [(PLSearchSuggestionCandidate *)self hasSecondCategory])
    {
      CFArrayRef Copy = 0;
      if (v5) {
        CFArrayRef Copy = CFArrayCreateCopy(0, v5);
      }
      CFTypeRef cf = Copy;
      +[PLScopedSearchUtilities intersectSortedArray:&cf withOtherSortedArray:v7 intersectionLimit:500];
    }
    else if ([(PLSearchSuggestionCandidate *)self hasFirstCategory])
    {
      CFArrayRef v10 = 0;
      if (v5) {
        CFArrayRef v10 = CFArrayCreateCopy(0, v5);
      }
      CFTypeRef cf = v10;
    }
    BOOL v11 = [(PLSearchSuggestionCandidate *)self hasDateFilter];
    unint64_t result = (unint64_t)cf;
    if (v11)
    {
      if (cf)
      {
        +[PLScopedSearchUtilities intersectSortedArray:&cf withOtherSortedArray:v8 intersectionLimit:500];
        unint64_t result = (unint64_t)cf;
        goto LABEL_18;
      }
      if (v8)
      {
        unint64_t result = (unint64_t)v8;
LABEL_18:
        unint64_t result = CFArrayGetCount((CFArrayRef)result);
        CFTypeRef v12 = cf;
        self->_intersectionCount = result;
        if (v12)
        {
          CFRelease(v12);
          return self->_intersectionCount;
        }
        return result;
      }
      unint64_t result = 0;
    }
    else if (cf)
    {
      goto LABEL_18;
    }
    self->_intersectionCount = 0;
  }
  return result;
}

+ (id)updateCandidates:(id)a3 withTimestampsFromPreviouslyStoredCandidates:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v6 count])
  {
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)MEMORY[0x1E4F1CBF0];
    }
LABEL_24:
    id v19 = v7;
    goto LABEL_26;
  }
  if ([v5 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v21 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      obuint64_t j = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          CFTypeRef v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v13 = v6;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v24 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                if (objc_msgSend(v12, "isEqual:", v18, v21))
                {
                  [v18 timeSinceLastUsed];
                  objc_msgSend(v12, "setTimeSinceLastUsed:");
                  goto LABEL_18;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
LABEL_18:
        }
        id v7 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    id v5 = v21;
    goto LABEL_24;
  }
  id v19 = (id)MEMORY[0x1E4F1CBF0];
LABEL_26:

  return v19;
}

@end