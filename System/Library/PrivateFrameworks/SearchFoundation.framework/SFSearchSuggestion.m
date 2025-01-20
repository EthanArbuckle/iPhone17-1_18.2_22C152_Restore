@interface SFSearchSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPreviouslyEngaged;
- (BOOL)hasScore;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)previouslyEngaged;
- (NSArray)duplicateSuggestions;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSMutableDictionary)serverFeatures;
- (NSString)bundleIdentifier;
- (NSString)detailText;
- (NSString)fbr;
- (NSString)identifier;
- (NSString)query;
- (NSString)scopedSearchApplicationBundleIdentifier;
- (NSString)suggestion;
- (NSString)topicIdentifier;
- (NSString)utteranceText;
- (SFSearchSuggestion)initWithCoder:(id)a3;
- (SFSearchSuggestion)initWithIdentifier:(id)a3 suggestion:(id)a4 query:(id)a5 score:(double)a6 type:(int)a7;
- (SFSearchSuggestion)initWithProtobuf:(id)a3;
- (SFSearchSuggestion)initWithSuggestion:(id)a3 query:(id)a4 score:(double)a5 type:(int)a6;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDuplicateSuggestions:(id)a3;
- (void)setFbr:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPreviouslyEngaged:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setScopedSearchApplicationBundleIdentifier:(id)a3;
- (void)setScore:(double)a3;
- (void)setServerFeatures:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTopicIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)setUtteranceText:(id)a3;
@end

@implementation SFSearchSuggestion

- (SFSearchSuggestion)initWithProtobuf:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SFSearchSuggestion;
  v5 = [(SFSearchSuggestion *)&v44 init];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = [v4 identifier];
      [(SFSearchSuggestion *)v5 setIdentifier:v7];
    }
    v8 = [v4 suggestion];

    if (v8)
    {
      v9 = [v4 suggestion];
      [(SFSearchSuggestion *)v5 setSuggestion:v9];
    }
    v10 = [v4 query];

    if (v10)
    {
      v11 = [v4 query];
      [(SFSearchSuggestion *)v5 setQuery:v11];
    }
    v12 = [v4 score];

    if (v12)
    {
      v13 = [v4 score];
      [v13 doubleValue];
      -[SFSearchSuggestion setScore:](v5, "setScore:");
    }
    if ([v4 type]) {
      -[SFSearchSuggestion setType:](v5, "setType:", [v4 type]);
    }
    v14 = [v4 duplicateSuggestions];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v16 = [v4 duplicateSuggestions];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[SFSearchSuggestion alloc] initWithProtobuf:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v18);
    }

    [(SFSearchSuggestion *)v5 setDuplicateSuggestions:v15];
    v22 = [v4 topicIdentifier];

    if (v22)
    {
      v23 = [v4 topicIdentifier];
      [(SFSearchSuggestion *)v5 setTopicIdentifier:v23];
    }
    v24 = [v4 bundleIdentifier];

    if (v24)
    {
      v25 = [v4 bundleIdentifier];
      [(SFSearchSuggestion *)v5 setBundleIdentifier:v25];
    }
    if ([v4 previouslyEngaged]) {
      -[SFSearchSuggestion setPreviouslyEngaged:](v5, "setPreviouslyEngaged:", [v4 previouslyEngaged]);
    }
    v26 = [v4 fbr];

    if (v26)
    {
      v27 = [v4 fbr];
      [(SFSearchSuggestion *)v5 setFbr:v27];
    }
    v28 = [v4 scopedSearchApplicationBundleIdentifier];

    if (v28)
    {
      v29 = [v4 scopedSearchApplicationBundleIdentifier];
      [(SFSearchSuggestion *)v5 setScopedSearchApplicationBundleIdentifier:v29];
    }
    v30 = [v4 utteranceText];

    if (v30)
    {
      v31 = [v4 utteranceText];
      [(SFSearchSuggestion *)v5 setUtteranceText:v31];
    }
    v32 = [v4 detailText];

    if (v32)
    {
      v33 = [v4 detailText];
      [(SFSearchSuggestion *)v5 setDetailText:v33];
    }
    v34 = [v4 serverFeatures];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __60__SFSearchSuggestion_ProtobufInitializer__initWithProtobuf___block_invoke;
    v38[3] = &unk_1E5A2E5F8;
    v35 = v5;
    v39 = v35;
    [v34 enumerateKeysAndObjectsUsingBlock:v38];

    v36 = v35;
  }

  return v5;
}

void __60__SFSearchSuggestion_ProtobufInitializer__initWithProtobuf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 serverFeatures];
  [v7 setObject:v5 forKey:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_utteranceText, 0);
  objc_storeStrong((id *)&self->_scopedSearchApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
  objc_storeStrong((id *)&self->_duplicateSuggestions, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setServerFeatures:(id)a3
{
}

- (NSMutableDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void)setDetailText:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setUtteranceText:(id)a3
{
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (void)setScopedSearchApplicationBundleIdentifier:(id)a3
{
}

- (NSString)scopedSearchApplicationBundleIdentifier
{
  return self->_scopedSearchApplicationBundleIdentifier;
}

- (void)setFbr:(id)a3
{
}

- (NSString)fbr
{
  return self->_fbr;
}

- (BOOL)previouslyEngaged
{
  return self->_previouslyEngaged;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setTopicIdentifier:(id)a3
{
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (void)setDuplicateSuggestions:(id)a3
{
}

- (NSArray)duplicateSuggestions
{
  return self->_duplicateSuggestions;
}

- (int)type
{
  return self->_type;
}

- (double)score
{
  return self->_score;
}

- (void)setQuery:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setSuggestion:(id)a3
{
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  v31 = [(SFSearchSuggestion *)self identifier];
  uint64_t v3 = [v31 hash];
  v30 = [(SFSearchSuggestion *)self suggestion];
  uint64_t v28 = [v30 hash] ^ v3;
  v29 = [(SFSearchSuggestion *)self query];
  uint64_t v26 = [v29 hash];
  [(SFSearchSuggestion *)self score];
  double v5 = -v4;
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  long double v6 = round(v5);
  unint64_t v24 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  uint64_t v23 = [(SFSearchSuggestion *)self type];
  v27 = [(SFSearchSuggestion *)self duplicateSuggestions];
  uint64_t v22 = [v27 hash];
  v25 = [(SFSearchSuggestion *)self topicIdentifier];
  uint64_t v21 = [v25 hash];
  id v7 = [(SFSearchSuggestion *)self bundleIdentifier];
  uint64_t v20 = [v7 hash];
  uint64_t v19 = [(SFSearchSuggestion *)self previouslyEngaged];
  v8 = [(SFSearchSuggestion *)self fbr];
  uint64_t v9 = [v8 hash];
  v10 = [(SFSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
  uint64_t v11 = [v10 hash];
  v12 = [(SFSearchSuggestion *)self utteranceText];
  uint64_t v13 = [v12 hash];
  v14 = [(SFSearchSuggestion *)self detailText];
  uint64_t v15 = [v14 hash];
  v16 = [(SFSearchSuggestion *)self serverFeatures];
  unint64_t v17 = v28 ^ v26 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v9 ^ v11 ^ v13 ^ v15 ^ [v16 hash] ^ v24;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  long double v6 = (SFSearchSuggestion *)a3;
  if (self == v6)
  {
    char v16 = 1;
    goto LABEL_80;
  }
  if (![(SFSearchSuggestion *)v6 isMemberOfClass:objc_opt_class()])
  {
    char v16 = 0;
    goto LABEL_80;
  }
  id v7 = v6;
  v8 = [(SFSearchSuggestion *)self identifier];
  id v103 = [(SFSearchSuggestion *)v7 identifier];
  id v104 = v8;
  int v101 = v103 != 0;
  int v102 = v8 == 0;
  if (v102 == v101)
  {
    memset(v100, 0, sizeof(v100));
    int v10 = 0;
    memset(v99, 0, sizeof(v99));
    uint64_t v98 = 0;
    int v11 = 0;
    memset(v105, 0, sizeof(v105));
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    goto LABEL_15;
  }
  uint64_t v3 = [(SFSearchSuggestion *)self identifier];
  uint64_t v4 = v3 != 0;
  v97 = (void *)v3;
  if (!v3
    || ([(SFSearchSuggestion *)self identifier],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [(SFSearchSuggestion *)v7 identifier],
        v93 = objc_claimAutoreleasedReturnValue(),
        v94 = v9,
        objc_msgSend(v9, "isEqual:")))
  {
    v96 = [(SFSearchSuggestion *)self suggestion];
    v95 = [(SFSearchSuggestion *)v7 suggestion];
    HIDWORD(v100[3]) = v3 != 0;
    if ((v96 == 0) == (v95 != 0))
    {
      *(void *)((char *)v100 + 4) = 0;
      LODWORD(v100[0]) = 0;
      int v10 = 0;
      memset(v99, 0, sizeof(v99));
      uint64_t v98 = 0;
      int v11 = 0;
      memset(v105, 0, sizeof(v105));
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(_OWORD *)((char *)&v100[1] + 4) = 1uLL;
      goto LABEL_15;
    }
    uint64_t v17 = [(SFSearchSuggestion *)self suggestion];
    HIDWORD(v105[2]) = v17 != 0;
    v92 = (void *)v17;
    if (v17)
    {
      uint64_t v18 = [(SFSearchSuggestion *)self suggestion];
      v88 = [(SFSearchSuggestion *)v7 suggestion];
      v89 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        v100[0] = 0;
        *(void *)((char *)&v100[2] + 4) = 0;
        int v10 = 0;
        memset(v99, 0, sizeof(v99));
        uint64_t v98 = 0;
        int v11 = 0;
        int v12 = 0;
        memset(v105, 0, 20);
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        LODWORD(v100[2]) = 0;
        v100[1] = 0x100000001;
        HIDWORD(v105[2]) = 1;
        goto LABEL_15;
      }
    }
    v91 = [(SFSearchSuggestion *)self query];
    v90 = [(SFSearchSuggestion *)v7 query];
    if ((v91 == 0) == (v90 != 0))
    {
      *(void *)((char *)&v100[2] + 4) = 0;
      int v10 = 0;
      memset(v99, 0, sizeof(v99));
      uint64_t v98 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v105, 0, 20);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      LODWORD(v100[2]) = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000000;
      goto LABEL_15;
    }
    uint64_t v24 = [(SFSearchSuggestion *)self query];
    BOOL v25 = v24 != 0;
    v87 = (void *)v24;
    if (v24)
    {
      uint64_t v26 = [(SFSearchSuggestion *)self query];
      v27 = v7;
      uint64_t v28 = (void *)v26;
      uint64_t v46 = v27;
      v85 = [(SFSearchSuggestion *)v27 query];
      v86 = v28;
      if (!objc_msgSend(v28, "isEqual:"))
      {
        v100[2] = 0;
        int v10 = 0;
        memset(v99, 0, 32);
        uint64_t v98 = 0;
        int v11 = 0;
        int v12 = 0;
        memset(v105, 0, 20);
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        v100[1] = 0x100000001;
        v100[0] = 0x100000000;
        *(_DWORD *)&v99[32] = 1;
        LODWORD(v100[3]) = 1;
        goto LABEL_94;
      }
      id v7 = v46;
    }
    [(SFSearchSuggestion *)self score];
    double v30 = v29;
    [(SFSearchSuggestion *)v7 score];
    LODWORD(v100[3]) = v25;
    if (vabdd_f64(v30, v31) >= 2.22044605e-16
      || (uint64_t v3 = [(SFSearchSuggestion *)self type], v3 != [(SFSearchSuggestion *)v7 type]))
    {
      v100[2] = 0;
      int v10 = 0;
      memset(v99, 0, 32);
      uint64_t v98 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v105, 0, 20);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000000;
      *(_DWORD *)&v99[32] = 1;
      goto LABEL_15;
    }
    v84 = [(SFSearchSuggestion *)self duplicateSuggestions];
    v83 = [(SFSearchSuggestion *)v7 duplicateSuggestions];
    if ((v84 == 0) == (v83 != 0))
    {
      v100[2] = 0;
      int v10 = 0;
      memset(v99, 0, 28);
      uint64_t v98 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v105, 0, 20);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000000;
      *(void *)&v99[28] = 0x100000001;
      goto LABEL_15;
    }
    uint64_t v32 = [(SFSearchSuggestion *)self duplicateSuggestions];
    uint64_t v3 = v32 != 0;
    v82 = (void *)v32;
    if (v32)
    {
      v33 = [(SFSearchSuggestion *)self duplicateSuggestions];
      v78 = [(SFSearchSuggestion *)v7 duplicateSuggestions];
      v79 = v33;
      if (!objc_msgSend(v33, "isEqual:"))
      {
        int v10 = 0;
        memset(v99, 0, 28);
        uint64_t v98 = 0;
        int v11 = 0;
        int v12 = 0;
        memset(v105, 0, 20);
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        v100[2] = 0x100000000;
        v100[1] = 0x100000001;
        *(void *)&v99[28] = 0x100000001;
        v100[0] = 0x100000001;
        goto LABEL_15;
      }
    }
    v81 = [(SFSearchSuggestion *)self topicIdentifier];
    v80 = [(SFSearchSuggestion *)v7 topicIdentifier];
    HIDWORD(v100[2]) = v3;
    if ((v81 == 0) == (v80 != 0))
    {
      memset(v99, 0, 28);
      uint64_t v98 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v105, 0, 20);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)((char *)&v100[1] + 4) = 1;
      LODWORD(v100[1]) = 1;
      *(void *)&v99[28] = 0x100000001;
      v100[0] = 0x100000001;
      int v10 = 1;
      goto LABEL_15;
    }
    uint64_t v34 = [(SFSearchSuggestion *)self topicIdentifier];
    BOOL v35 = v34 != 0;
    v77 = (void *)v34;
    if (v34)
    {
      uint64_t v3 = [(SFSearchSuggestion *)self topicIdentifier];
      v73 = [(SFSearchSuggestion *)v7 topicIdentifier];
      v74 = (void *)v3;
      if (!objc_msgSend((id)v3, "isEqual:"))
      {
        memset(v99, 0, 24);
        uint64_t v98 = 0;
        int v11 = 0;
        int v12 = 0;
        memset(v105, 0, 20);
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        v100[1] = 0x100000001;
        v100[0] = 0x100000001;
        *(void *)&v99[28] = 0x100000001;
        int v10 = 1;
        *(_DWORD *)&v99[24] = 1;
        LODWORD(v100[2]) = 1;
        goto LABEL_15;
      }
      LODWORD(v100[2]) = v35;
    }
    else
    {
      LODWORD(v100[2]) = 0;
    }
    v76 = [(SFSearchSuggestion *)self bundleIdentifier];
    v75 = [(SFSearchSuggestion *)v7 bundleIdentifier];
    if ((v76 == 0) == (v75 != 0))
    {
      memset(&v99[4], 0, 20);
      uint64_t v98 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v105, 0, 20);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000001;
      *(void *)&v99[28] = 0x100000001;
      int v10 = 1;
      *(_DWORD *)&v99[24] = 1;
      *(_DWORD *)v99 = 1;
      goto LABEL_15;
    }
    uint64_t v36 = [(SFSearchSuggestion *)self bundleIdentifier];
    LODWORD(v105[2]) = v36 != 0;
    v72 = (void *)v36;
    if (v36)
    {
      v37 = [(SFSearchSuggestion *)self bundleIdentifier];
      v70 = [(SFSearchSuggestion *)v7 bundleIdentifier];
      v71 = v37;
      if (!objc_msgSend(v37, "isEqual:"))
      {
        uint64_t v98 = 0;
        *(void *)&v99[16] = 0;
        v105[0] = 0;
        v105[1] = 0;
        int v11 = 0;
        *(void *)&v99[8] = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        v100[1] = 0x100000001;
        v100[0] = 0x100000001;
        *(void *)&v99[28] = 0x100000001;
        int v10 = 1;
        *(_DWORD *)&v99[24] = 1;
        *(void *)v99 = 0x100000001;
        LODWORD(v105[2]) = 1;
        goto LABEL_15;
      }
    }
    uint64_t v3 = [(SFSearchSuggestion *)self previouslyEngaged];
    if (v3 != [(SFSearchSuggestion *)v7 previouslyEngaged])
    {
      uint64_t v98 = 0;
      *(void *)&v99[16] = 0;
      v105[0] = 0;
      v105[1] = 0;
      int v11 = 0;
      *(void *)&v99[8] = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000001;
      *(void *)&v99[28] = 0x100000001;
      int v10 = 1;
      *(_DWORD *)&v99[24] = 1;
      *(void *)v99 = 0x100000001;
      goto LABEL_15;
    }
    v69 = [(SFSearchSuggestion *)self fbr];
    uint64_t v46 = v7;
    v68 = [(SFSearchSuggestion *)v7 fbr];
    if ((v69 == 0) == (v68 != 0))
    {
      *(void *)&v99[16] = 0;
      v105[0] = 0;
      v105[1] = 0;
      int v11 = 0;
      *(void *)&v99[8] = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000001;
      *(void *)&v99[28] = 0x100000001;
      int v10 = 1;
      *(_DWORD *)&v99[24] = 1;
      *(void *)v99 = 0x100000001;
      uint64_t v98 = 0x100000000;
    }
    else
    {
      uint64_t v38 = [(SFSearchSuggestion *)self fbr];
      HIDWORD(v105[1]) = v38 != 0;
      v67 = (void *)v38;
      if (!v38
        || ([(SFSearchSuggestion *)self fbr],
            v39 = objc_claimAutoreleasedReturnValue(),
            [(SFSearchSuggestion *)v46 fbr],
            v63 = objc_claimAutoreleasedReturnValue(),
            v64 = v39,
            objc_msgSend(v39, "isEqual:")))
      {
        v66 = [(SFSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
        v65 = [(SFSearchSuggestion *)v46 scopedSearchApplicationBundleIdentifier];
        if ((v66 == 0) == (v65 != 0))
        {
          *(void *)&v99[8] = 0;
          *(void *)((char *)v105 + 4) = 0;
          int v12 = 0;
          LODWORD(v105[0]) = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          char v16 = 0;
          v100[1] = 0x100000001;
          v100[0] = 0x100000001;
          *(void *)&v99[28] = 0x100000001;
          int v10 = 1;
          *(_DWORD *)&v99[24] = 1;
          *(void *)v99 = 0x100000001;
          uint64_t v98 = 0x100000000;
          *(void *)&v99[16] = 1;
          int v11 = 1;
        }
        else
        {
          uint64_t v40 = [(SFSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
          LODWORD(v105[1]) = v40 != 0;
          v62 = (void *)v40;
          if (!v40
            || (-[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier"), long long v41 = objc_claimAutoreleasedReturnValue(), -[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](v46, "scopedSearchApplicationBundleIdentifier"), v58 = objc_claimAutoreleasedReturnValue(), v59 = v41, objc_msgSend(v41, "isEqual:")))
          {
            v61 = [(SFSearchSuggestion *)self utteranceText];
            v60 = [(SFSearchSuggestion *)v46 utteranceText];
            if ((v61 == 0) == (v60 != 0))
            {
              v105[0] = 0;
              int v12 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              char v16 = 0;
              v100[1] = 0x100000001;
              v100[0] = 0x100000001;
              *(void *)&v99[28] = 0x100000001;
              int v10 = 1;
              *(_DWORD *)&v99[24] = 1;
              *(void *)v99 = 0x100000001;
              *(void *)&v99[16] = 1;
              int v11 = 1;
              *(void *)&v99[8] = 1;
              uint64_t v98 = 0x100000001;
            }
            else
            {
              uint64_t v42 = [(SFSearchSuggestion *)self utteranceText];
              HIDWORD(v105[0]) = v42 != 0;
              v57 = (void *)v42;
              if (!v42
                || ([(SFSearchSuggestion *)self utteranceText],
                    long long v43 = objc_claimAutoreleasedReturnValue(),
                    [(SFSearchSuggestion *)v46 utteranceText],
                    v53 = objc_claimAutoreleasedReturnValue(),
                    v54 = v43,
                    objc_msgSend(v43, "isEqual:")))
              {
                v56 = [(SFSearchSuggestion *)self detailText];
                v55 = [(SFSearchSuggestion *)v46 detailText];
                if ((v56 == 0) == (v55 != 0))
                {
                  int v12 = 0;
                  LODWORD(v105[0]) = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  char v16 = 0;
                  v100[1] = 0x100000001;
                  v100[0] = 0x100000001;
                  *(void *)&v99[28] = 0x100000001;
                  int v10 = 1;
                  *(_DWORD *)&v99[24] = 1;
                  *(void *)v99 = 0x100000001;
                  uint64_t v98 = 0x100000001;
                  *(void *)&v99[16] = 0x100000001;
                  int v11 = 1;
                  *(void *)&v99[8] = 0x100000001;
                }
                else
                {
                  uint64_t v44 = [(SFSearchSuggestion *)self detailText];
                  LODWORD(v105[0]) = v44 != 0;
                  v52 = (void *)v44;
                  if (!v44
                    || ([(SFSearchSuggestion *)self detailText],
                        v45 = objc_claimAutoreleasedReturnValue(),
                        [(SFSearchSuggestion *)v46 detailText],
                        v48 = objc_claimAutoreleasedReturnValue(),
                        v49 = v45,
                        objc_msgSend(v45, "isEqual:")))
                  {
                    v51 = [(SFSearchSuggestion *)self serverFeatures];
                    v50 = [(SFSearchSuggestion *)v46 serverFeatures];
                    if ((v51 == 0) == (v50 != 0))
                    {
                      int v14 = 0;
                      int v15 = 0;
                      char v16 = 0;
                      v100[1] = 0x100000001;
                      v100[0] = 0x100000001;
                      *(void *)&v99[28] = 0x100000001;
                      int v10 = 1;
                      *(_DWORD *)&v99[24] = 1;
                      *(void *)v99 = 0x100000001;
                      uint64_t v98 = 0x100000001;
                      *(void *)&v99[16] = 0x100000001;
                      int v11 = 1;
                      *(void *)&v99[8] = 0x100000001;
                      int v12 = 1;
                      int v13 = 1;
                    }
                    else
                    {
                      v47 = [(SFSearchSuggestion *)self serverFeatures];
                      if (v47)
                      {
                        uint64_t v3 = [(SFSearchSuggestion *)self serverFeatures];
                        id v7 = v46;
                        uint64_t v4 = [(SFSearchSuggestion *)v46 serverFeatures];
                        char v16 = [(id)v3 isEqual:v4];
                        int v15 = 1;
                        v100[1] = 0x100000001;
                        v100[0] = 0x100000001;
                        *(void *)&v99[28] = 0x100000001;
                        int v10 = 1;
                        *(_DWORD *)&v99[24] = 1;
                        *(void *)v99 = 0x100000001;
                        uint64_t v98 = 0x100000001;
                        *(void *)&v99[16] = 0x100000001;
                        int v11 = 1;
                        *(void *)&v99[8] = 0x100000001;
                        int v12 = 1;
                        int v13 = 1;
                        int v14 = 1;
                        goto LABEL_15;
                      }
                      v47 = 0;
                      int v15 = 0;
                      v100[1] = 0x100000001;
                      v100[0] = 0x100000001;
                      *(void *)&v99[28] = 0x100000001;
                      int v10 = 1;
                      *(_DWORD *)&v99[24] = 1;
                      *(void *)v99 = 0x100000001;
                      uint64_t v98 = 0x100000001;
                      *(void *)&v99[16] = 0x100000001;
                      int v11 = 1;
                      *(void *)&v99[8] = 0x100000001;
                      int v12 = 1;
                      int v13 = 1;
                      int v14 = 1;
                      char v16 = 1;
                    }
                  }
                  else
                  {
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    char v16 = 0;
                    v100[1] = 0x100000001;
                    v100[0] = 0x100000001;
                    *(void *)&v99[28] = 0x100000001;
                    int v10 = 1;
                    *(_DWORD *)&v99[24] = 1;
                    *(void *)v99 = 0x100000001;
                    uint64_t v98 = 0x100000001;
                    *(void *)&v99[16] = 0x100000001;
                    int v11 = 1;
                    *(void *)&v99[8] = 0x100000001;
                    int v12 = 1;
                    LODWORD(v105[0]) = 1;
                  }
                }
              }
              else
              {
                int v12 = 0;
                v105[0] = 0x100000000;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                char v16 = 0;
                v100[1] = 0x100000001;
                v100[0] = 0x100000001;
                *(void *)&v99[28] = 0x100000001;
                int v10 = 1;
                *(_DWORD *)&v99[24] = 1;
                *(void *)v99 = 0x100000001;
                uint64_t v98 = 0x100000001;
                *(void *)&v99[16] = 0x100000001;
                int v11 = 1;
                *(void *)&v99[8] = 1;
              }
            }
          }
          else
          {
            v105[0] = 0;
            int v12 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            char v16 = 0;
            v100[1] = 0x100000001;
            v100[0] = 0x100000001;
            *(void *)&v99[28] = 0x100000001;
            int v10 = 1;
            *(_DWORD *)&v99[24] = 1;
            *(void *)v99 = 0x100000001;
            uint64_t v98 = 0x100000000;
            *(void *)&v99[16] = 1;
            int v11 = 1;
            *(void *)&v99[8] = 1;
            LODWORD(v105[1]) = 1;
          }
        }
      }
      else
      {
        int v11 = 0;
        *(void *)&v99[8] = 0;
        *(void *)((char *)v105 + 4) = 0;
        int v12 = 0;
        LODWORD(v105[0]) = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        v100[1] = 0x100000001;
        v100[0] = 0x100000001;
        *(void *)&v99[28] = 0x100000001;
        int v10 = 1;
        *(_DWORD *)&v99[24] = 1;
        *(void *)v99 = 0x100000001;
        uint64_t v98 = 0x100000000;
        *(void *)&v99[16] = 1;
        HIDWORD(v105[1]) = 1;
      }
    }
LABEL_94:
    id v7 = v46;
    goto LABEL_15;
  }
  memset(v100, 0, 28);
  int v10 = 0;
  memset(v99, 0, sizeof(v99));
  uint64_t v98 = 0;
  int v11 = 0;
  memset(v105, 0, sizeof(v105));
  int v12 = 0;
  int v13 = 0;
  int v14 = 0;
  int v15 = 0;
  char v16 = 0;
  HIDWORD(v100[3]) = 1;
LABEL_15:
  if (v15)
  {
    int v19 = v10;
    int v20 = v12;
    int v21 = v13;
    int v22 = v14;

    int v14 = v22;
    int v13 = v21;
    int v12 = v20;
    int v10 = v19;
  }
  if (v14) {

  }
  if (v13)
  {
  }
  if (LODWORD(v105[0]))
  {
  }
  if (v12) {

  }
  if (*(_DWORD *)&v99[12])
  {
  }
  if (HIDWORD(v105[0]))
  {
  }
  if (*(_DWORD *)&v99[20]) {

  }
  if (v98)
  {
  }
  if (LODWORD(v105[1]))
  {
  }
  if (*(_DWORD *)&v99[8]) {

  }
  if (v11)
  {
  }
  if (HIDWORD(v105[1]))
  {
  }
  if (*(_DWORD *)&v99[16]) {

  }
  if (HIDWORD(v98))
  {
  }
  if (LODWORD(v105[2]))
  {
  }
  if (*(_DWORD *)&v99[4]) {

  }
  if (*(_DWORD *)v99)
  {
  }
  if (LODWORD(v100[2]))
  {
  }
  if (*(_DWORD *)&v99[24]) {

  }
  if (v10)
  {
  }
  if (HIDWORD(v100[2]))
  {
  }
  if (LODWORD(v100[0])) {

  }
  if (*(_DWORD *)&v99[28])
  {
  }
  if (LODWORD(v100[3]))
  {
  }
  if (*(_DWORD *)&v99[32]) {

  }
  if (HIDWORD(v100[0]))
  {
  }
  if (HIDWORD(v105[2]))
  {
  }
  if (LODWORD(v100[1])) {

  }
  if (HIDWORD(v100[1]))
  {
  }
  if (HIDWORD(v100[3]))
  {
  }
  if (v102 != v101) {

  }
LABEL_80:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  double v5 = [(SFSearchSuggestion *)self identifier];
  long double v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  id v7 = [(SFSearchSuggestion *)self suggestion];
  v8 = (void *)[v7 copy];
  [v4 setSuggestion:v8];

  uint64_t v9 = [(SFSearchSuggestion *)self query];
  int v10 = (void *)[v9 copy];
  [v4 setQuery:v10];

  [(SFSearchSuggestion *)self score];
  objc_msgSend(v4, "setScore:");
  objc_msgSend(v4, "setType:", -[SFSearchSuggestion type](self, "type"));
  int v11 = [(SFSearchSuggestion *)self duplicateSuggestions];
  int v12 = (void *)[v11 copy];
  [v4 setDuplicateSuggestions:v12];

  int v13 = [(SFSearchSuggestion *)self topicIdentifier];
  int v14 = (void *)[v13 copy];
  [v4 setTopicIdentifier:v14];

  int v15 = [(SFSearchSuggestion *)self bundleIdentifier];
  char v16 = (void *)[v15 copy];
  [v4 setBundleIdentifier:v16];

  objc_msgSend(v4, "setPreviouslyEngaged:", -[SFSearchSuggestion previouslyEngaged](self, "previouslyEngaged"));
  uint64_t v17 = [(SFSearchSuggestion *)self fbr];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setFbr:v18];

  int v19 = [(SFSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
  int v20 = (void *)[v19 copy];
  [v4 setScopedSearchApplicationBundleIdentifier:v20];

  int v21 = [(SFSearchSuggestion *)self utteranceText];
  int v22 = (void *)[v21 copy];
  [v4 setUtteranceText:v22];

  uint64_t v23 = [(SFSearchSuggestion *)self detailText];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setDetailText:v24];

  BOOL v25 = [(SFSearchSuggestion *)self serverFeatures];
  uint64_t v26 = (void *)[v25 copy];
  [v4 setServerFeatures:v26];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSearchSuggestion alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBSearchSuggestion *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSearchSuggestion alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBSearchSuggestion *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long double v6 = [[_SFPBSearchSuggestion alloc] initWithFacade:self];
  double v5 = [(_SFPBSearchSuggestion *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFSearchSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  long double v6 = [[_SFPBSearchSuggestion alloc] initWithData:v5];
  id v7 = [(SFSearchSuggestion *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasPreviouslyEngaged
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPreviouslyEngaged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_previouslyEngaged = a3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_score = a3;
}

- (SFSearchSuggestion)initWithSuggestion:(id)a3 query:(id)a4 score:(double)a5 type:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  int v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a4;
  id v12 = a3;
  int v13 = [v10 UUID];
  int v14 = [v13 UUIDString];
  int v15 = [(SFSearchSuggestion *)self initWithIdentifier:v14 suggestion:v12 query:v11 score:v6 type:a5];

  return v15;
}

- (SFSearchSuggestion)initWithIdentifier:(id)a3 suggestion:(id)a4 query:(id)a5 score:(double)a6 type:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFSearchSuggestion;
  int v15 = [(SFSearchSuggestion *)&v19 init];
  char v16 = v15;
  if (v15)
  {
    [(SFSearchSuggestion *)v15 setIdentifier:v12];
    [(SFSearchSuggestion *)v16 setSuggestion:v13];
    [(SFSearchSuggestion *)v16 setQuery:v14];
    [(SFSearchSuggestion *)v16 setScore:a6];
    [(SFSearchSuggestion *)v16 setType:v7];
    uint64_t v17 = v16;
  }

  return v16;
}

@end