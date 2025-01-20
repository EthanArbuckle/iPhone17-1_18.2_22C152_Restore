@interface _SFPBSearchSuggestion
- (BOOL)getServerFeatures:(double *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)previouslyEngaged;
- (BOOL)readFrom:(id)a3;
- (NSArray)duplicateSuggestions;
- (NSData)jsonData;
- (NSDictionary)serverFeatures;
- (NSString)bundleIdentifier;
- (NSString)detailText;
- (NSString)fbr;
- (NSString)identifier;
- (NSString)query;
- (NSString)scopedSearchApplicationBundleIdentifier;
- (NSString)suggestion;
- (NSString)topicIdentifier;
- (NSString)utteranceText;
- (_SFPBGraphicalFloat)score;
- (_SFPBSearchSuggestion)initWithDictionary:(id)a3;
- (_SFPBSearchSuggestion)initWithFacade:(id)a3;
- (_SFPBSearchSuggestion)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)duplicateSuggestionsAtIndex:(unint64_t)a3;
- (int)type;
- (unint64_t)duplicateSuggestionsCount;
- (unint64_t)hash;
- (void)addDuplicateSuggestions:(id)a3;
- (void)clearDuplicateSuggestions;
- (void)setBundleIdentifier:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDuplicateSuggestions:(id)a3;
- (void)setFbr:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPreviouslyEngaged:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setScopedSearchApplicationBundleIdentifier:(id)a3;
- (void)setScore:(id)a3;
- (void)setServerFeatures:(double)a3 forKey:(id)a4;
- (void)setServerFeatures:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTopicIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)setUtteranceText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSearchSuggestion

- (_SFPBSearchSuggestion)initWithFacade:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBSearchSuggestion *)self init];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = [v4 identifier];
      [(_SFPBSearchSuggestion *)v5 setIdentifier:v7];
    }
    v8 = [v4 suggestion];

    if (v8)
    {
      v9 = [v4 suggestion];
      [(_SFPBSearchSuggestion *)v5 setSuggestion:v9];
    }
    v10 = [v4 query];

    if (v10)
    {
      v11 = [v4 query];
      [(_SFPBSearchSuggestion *)v5 setQuery:v11];
    }
    if ([v4 hasScore])
    {
      v12 = [_SFPBGraphicalFloat alloc];
      [v4 score];
      v13 = -[_SFPBGraphicalFloat initWithCGFloat:](v12, "initWithCGFloat:");
      [(_SFPBSearchSuggestion *)v5 setScore:v13];
    }
    if ([v4 hasType]) {
      -[_SFPBSearchSuggestion setType:](v5, "setType:", [v4 type]);
    }
    v14 = [v4 duplicateSuggestions];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v16 = [v4 duplicateSuggestions];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBSearchSuggestion alloc] initWithFacade:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v18);
    }

    [(_SFPBSearchSuggestion *)v5 setDuplicateSuggestions:v15];
    v22 = [v4 topicIdentifier];

    if (v22)
    {
      v23 = [v4 topicIdentifier];
      [(_SFPBSearchSuggestion *)v5 setTopicIdentifier:v23];
    }
    v24 = [v4 bundleIdentifier];

    if (v24)
    {
      v25 = [v4 bundleIdentifier];
      [(_SFPBSearchSuggestion *)v5 setBundleIdentifier:v25];
    }
    if ([v4 hasPreviouslyEngaged]) {
      -[_SFPBSearchSuggestion setPreviouslyEngaged:](v5, "setPreviouslyEngaged:", [v4 previouslyEngaged]);
    }
    v26 = [v4 fbr];

    if (v26)
    {
      v27 = [v4 fbr];
      [(_SFPBSearchSuggestion *)v5 setFbr:v27];
    }
    v28 = [v4 scopedSearchApplicationBundleIdentifier];

    if (v28)
    {
      v29 = [v4 scopedSearchApplicationBundleIdentifier];
      [(_SFPBSearchSuggestion *)v5 setScopedSearchApplicationBundleIdentifier:v29];
    }
    v30 = [v4 utteranceText];

    if (v30)
    {
      v31 = [v4 utteranceText];
      [(_SFPBSearchSuggestion *)v5 setUtteranceText:v31];
    }
    v32 = [v4 detailText];

    if (v32)
    {
      v33 = [v4 detailText];
      [(_SFPBSearchSuggestion *)v5 setDetailText:v33];
    }
    v34 = [v4 serverFeatures];
    v35 = v34;
    if (v34)
    {
      v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
    }
    else
    {
      v36 = 0;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v37 = v35;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v47 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          v43 = objc_msgSend(v37, "objectForKey:", v42, (void)v46);
          if (v43) {
            [v36 setObject:v43 forKey:v42];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v39);
    }

    [(_SFPBSearchSuggestion *)v5 setServerFeatures:v36];
    v44 = v5;
  }
  return v5;
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
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (NSString)scopedSearchApplicationBundleIdentifier
{
  return self->_scopedSearchApplicationBundleIdentifier;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (BOOL)previouslyEngaged
{
  return self->_previouslyEngaged;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (NSArray)duplicateSuggestions
{
  return self->_duplicateSuggestions;
}

- (int)type
{
  return self->_type;
}

- (_SFPBGraphicalFloat)score
{
  return self->_score;
}

- (NSString)query
{
  return self->_query;
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_SFPBSearchSuggestion)initWithDictionary:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)_SFPBSearchSuggestion;
  v5 = [(_SFPBSearchSuggestion *)&v73 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    v64 = v6;
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBSearchSuggestion *)v5 setIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"suggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBSearchSuggestion *)v5 setSuggestion:v9];
    }
    v58 = v8;
    v10 = [v4 objectForKeyedSubscript:@"query"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBSearchSuggestion *)v5 setQuery:v11];
    }
    v57 = v10;
    v12 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v12];
      [(_SFPBSearchSuggestion *)v5 setScore:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v63 = v14;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSearchSuggestion setType:](v5, "setType:", [v14 intValue]);
    }
    id v15 = [v4 objectForKeyedSubscript:@"duplicateSuggestions"];
    objc_opt_class();
    v62 = v15;
    uint64_t v56 = v12;
    if (objc_opt_isKindOfClass())
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v70 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v69 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = [[_SFPBSearchSuggestion alloc] initWithDictionary:v21];
              [(_SFPBSearchSuggestion *)v5 addDuplicateSuggestions:v22];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v69 objects:v75 count:16];
        }
        while (v18);
      }
    }
    v23 = [v4 objectForKeyedSubscript:@"topicIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = (void *)[v23 copy];
      [(_SFPBSearchSuggestion *)v5 setTopicIdentifier:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = (void *)[v25 copy];
      [(_SFPBSearchSuggestion *)v5 setBundleIdentifier:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"previouslyEngaged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSearchSuggestion setPreviouslyEngaged:](v5, "setPreviouslyEngaged:", [v27 BOOLValue]);
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"fbr"];
    objc_opt_class();
    v61 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      v29 = v23;
      v30 = (void *)[v61 copy];
      [(_SFPBSearchSuggestion *)v5 setFbr:v30];

      v23 = v29;
    }
    uint64_t v31 = [v4 objectForKeyedSubscript:@"scopedSearchApplicationBundleIdentifier"];
    objc_opt_class();
    v60 = (void *)v31;
    if (objc_opt_isKindOfClass())
    {
      v32 = v25;
      v33 = (void *)[v60 copy];
      [(_SFPBSearchSuggestion *)v5 setScopedSearchApplicationBundleIdentifier:v33];

      v25 = v32;
    }
    v34 = [v4 objectForKeyedSubscript:@"utteranceText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v35 = [v34 copy];
      v36 = v34;
      id v37 = v27;
      uint64_t v38 = (void *)v35;
      [(_SFPBSearchSuggestion *)v5 setUtteranceText:v35];

      v27 = v37;
      v34 = v36;
    }
    uint64_t v39 = [v4 objectForKeyedSubscript:@"detailText"];
    objc_opt_class();
    v59 = v39;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v40 = (void *)[v39 copy];
      [(_SFPBSearchSuggestion *)v5 setDetailText:v40];
    }
    v41 = [v4 objectForKeyedSubscript:@"serverFeatures"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v53 = v34;
      v54 = v27;
      v55 = v25;
      uint64_t v42 = [MEMORY[0x1E4F1CA60] dictionary];
      serverFeatures = v5->_serverFeatures;
      v5->_serverFeatures = (NSDictionary *)v42;

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v44 = v41;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v66 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void *)(*((void *)&v65 + 1) + 8 * j);
            long long v50 = [v44 objectForKeyedSubscript:v49];
            [(NSDictionary *)v5->_serverFeatures setObject:v50 forKey:v49];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v65 objects:v74 count:16];
        }
        while (v46);
      }

      v12 = v56;
      v27 = v54;
      v25 = v55;
      v34 = v53;
    }
    long long v51 = v5;
  }
  return v5;
}

- (_SFPBSearchSuggestion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSearchSuggestion *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSearchSuggestion *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_bundleIdentifier)
  {
    id v4 = [(_SFPBSearchSuggestion *)self bundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleIdentifier"];
  }
  if (self->_detailText)
  {
    v6 = [(_SFPBSearchSuggestion *)self detailText];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"detailText"];
  }
  if ([(NSArray *)self->_duplicateSuggestions count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v9 = self->_duplicateSuggestions;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            id v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"duplicateSuggestions"];
  }
  if (self->_fbr)
  {
    id v16 = [(_SFPBSearchSuggestion *)self fbr];
    uint64_t v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"fbr"];
  }
  if (self->_identifier)
  {
    uint64_t v18 = [(_SFPBSearchSuggestion *)self identifier];
    uint64_t v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"identifier"];
  }
  if (self->_previouslyEngaged)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSearchSuggestion previouslyEngaged](self, "previouslyEngaged"));
    [v3 setObject:v20 forKeyedSubscript:@"previouslyEngaged"];
  }
  if (self->_query)
  {
    uint64_t v21 = [(_SFPBSearchSuggestion *)self query];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"query"];
  }
  if (self->_scopedSearchApplicationBundleIdentifier)
  {
    v23 = [(_SFPBSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"scopedSearchApplicationBundleIdentifier"];
  }
  if (self->_score)
  {
    v25 = [(_SFPBSearchSuggestion *)self score];
    v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"score"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"score"];
    }
  }
  uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v29 = self->_serverFeatures;
  uint64_t v30 = [(NSDictionary *)v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        uint64_t v35 = [(NSDictionary *)self->_serverFeatures objectForKeyedSubscript:v34];
        [v28 setObject:v35 forKeyedSubscript:v34];
      }
      uint64_t v31 = [(NSDictionary *)v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v31);
  }

  [v3 setObject:v28 forKeyedSubscript:@"serverFeatures"];
  if (self->_suggestion)
  {
    v36 = [(_SFPBSearchSuggestion *)self suggestion];
    id v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"suggestion"];
  }
  if (self->_topicIdentifier)
  {
    uint64_t v38 = [(_SFPBSearchSuggestion *)self topicIdentifier];
    uint64_t v39 = (void *)[v38 copy];
    [v3 setObject:v39 forKeyedSubscript:@"topicIdentifier"];
  }
  if (self->_type)
  {
    uint64_t v40 = [(_SFPBSearchSuggestion *)self type];
    if (v40 >= 0x11)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v40);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E5A2EED0[v40];
    }
    [v3 setObject:v41 forKeyedSubscript:@"type"];
  }
  if (self->_utteranceText)
  {
    uint64_t v42 = [(_SFPBSearchSuggestion *)self utteranceText];
    v43 = (void *)[v42 copy];
    [v3 setObject:v43 forKeyedSubscript:@"utteranceText"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_suggestion hash];
  NSUInteger v5 = [(NSString *)self->_query hash];
  unint64_t v6 = [(_SFPBGraphicalFloat *)self->_score hash];
  uint64_t v7 = 2654435761 * self->_type;
  uint64_t v8 = [(NSArray *)self->_duplicateSuggestions hash];
  NSUInteger v9 = [(NSString *)self->_topicIdentifier hash];
  NSUInteger v10 = [(NSString *)self->_bundleIdentifier hash];
  if (self->_previouslyEngaged) {
    uint64_t v11 = 2654435761;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7;
  NSUInteger v13 = v10 ^ v11 ^ [(NSString *)self->_fbr hash];
  NSUInteger v14 = v13 ^ [(NSString *)self->_scopedSearchApplicationBundleIdentifier hash];
  NSUInteger v15 = v12 ^ v14 ^ [(NSString *)self->_utteranceText hash];
  NSUInteger v16 = [(NSString *)self->_detailText hash];
  return v15 ^ v16 ^ [(NSDictionary *)self->_serverFeatures hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_64;
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self identifier];
  unint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v7 = [(_SFPBSearchSuggestion *)self identifier];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBSearchSuggestion *)self identifier];
    NSUInteger v10 = [v4 identifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self suggestion];
  unint64_t v6 = [v4 suggestion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v12 = [(_SFPBSearchSuggestion *)self suggestion];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    NSUInteger v14 = [(_SFPBSearchSuggestion *)self suggestion];
    NSUInteger v15 = [v4 suggestion];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self query];
  unint64_t v6 = [v4 query];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v17 = [(_SFPBSearchSuggestion *)self query];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBSearchSuggestion *)self query];
    v20 = [v4 query];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self score];
  unint64_t v6 = [v4 score];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v22 = [(_SFPBSearchSuggestion *)self score];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBSearchSuggestion *)self score];
    v25 = [v4 score];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_64;
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self duplicateSuggestions];
  unint64_t v6 = [v4 duplicateSuggestions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v28 = [(_SFPBSearchSuggestion *)self duplicateSuggestions];
  if (v28)
  {
    v29 = (void *)v28;
    uint64_t v30 = [(_SFPBSearchSuggestion *)self duplicateSuggestions];
    uint64_t v31 = [v4 duplicateSuggestions];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self topicIdentifier];
  unint64_t v6 = [v4 topicIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v33 = [(_SFPBSearchSuggestion *)self topicIdentifier];
  if (v33)
  {
    uint64_t v34 = (void *)v33;
    uint64_t v35 = [(_SFPBSearchSuggestion *)self topicIdentifier];
    v36 = [v4 topicIdentifier];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self bundleIdentifier];
  unint64_t v6 = [v4 bundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v38 = [(_SFPBSearchSuggestion *)self bundleIdentifier];
  if (v38)
  {
    uint64_t v39 = (void *)v38;
    uint64_t v40 = [(_SFPBSearchSuggestion *)self bundleIdentifier];
    v41 = [v4 bundleIdentifier];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  int previouslyEngaged = self->_previouslyEngaged;
  if (previouslyEngaged != [v4 previouslyEngaged]) {
    goto LABEL_64;
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self fbr];
  unint64_t v6 = [v4 fbr];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v44 = [(_SFPBSearchSuggestion *)self fbr];
  if (v44)
  {
    long long v45 = (void *)v44;
    long long v46 = [(_SFPBSearchSuggestion *)self fbr];
    long long v47 = [v4 fbr];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
  unint64_t v6 = [v4 scopedSearchApplicationBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v49 = [(_SFPBSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
  if (v49)
  {
    long long v50 = (void *)v49;
    long long v51 = [(_SFPBSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
    long long v52 = [v4 scopedSearchApplicationBundleIdentifier];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self utteranceText];
  unint64_t v6 = [v4 utteranceText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v54 = [(_SFPBSearchSuggestion *)self utteranceText];
  if (v54)
  {
    uint64_t v55 = (void *)v54;
    uint64_t v56 = [(_SFPBSearchSuggestion *)self utteranceText];
    v57 = [v4 utteranceText];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self detailText];
  unint64_t v6 = [v4 detailText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v59 = [(_SFPBSearchSuggestion *)self detailText];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [(_SFPBSearchSuggestion *)self detailText];
    v62 = [v4 detailText];
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self serverFeatures];
  unint64_t v6 = [v4 serverFeatures];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_63:

    goto LABEL_64;
  }
  uint64_t v64 = [(_SFPBSearchSuggestion *)self serverFeatures];
  if (!v64)
  {

LABEL_67:
    BOOL v69 = 1;
    goto LABEL_65;
  }
  long long v65 = (void *)v64;
  long long v66 = [(_SFPBSearchSuggestion *)self serverFeatures];
  long long v67 = [v4 serverFeatures];
  char v68 = [v66 isEqual:v67];

  if (v68) {
    goto LABEL_67;
  }
LABEL_64:
  BOOL v69 = 0;
LABEL_65:

  return v69;
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBSearchSuggestion *)self identifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  unint64_t v6 = [(_SFPBSearchSuggestion *)self suggestion];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBSearchSuggestion *)self query];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  uint64_t v8 = [(_SFPBSearchSuggestion *)self score];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBSearchSuggestion *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v9 = [(_SFPBSearchSuggestion *)self duplicateSuggestions];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  NSUInteger v14 = [(_SFPBSearchSuggestion *)self topicIdentifier];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v15 = [(_SFPBSearchSuggestion *)self bundleIdentifier];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBSearchSuggestion *)self previouslyEngaged]) {
    PBDataWriterWriteBOOLField();
  }
  int v16 = [(_SFPBSearchSuggestion *)self fbr];
  if (v16) {
    PBDataWriterWriteStringField();
  }

  uint64_t v17 = [(_SFPBSearchSuggestion *)self scopedSearchApplicationBundleIdentifier];
  if (v17) {
    PBDataWriterWriteStringField();
  }

  uint64_t v18 = [(_SFPBSearchSuggestion *)self utteranceText];
  if (v18) {
    PBDataWriterWriteStringField();
  }

  uint64_t v19 = [(_SFPBSearchSuggestion *)self detailText];
  if (v19) {
    PBDataWriterWriteStringField();
  }

  v20 = [(_SFPBSearchSuggestion *)self serverFeatures];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v21 = self->_serverFeatures;
  uint64_t v22 = [(NSDictionary *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        PBDataWriterPlaceMark();
        PBDataWriterWriteStringField();
        v27 = [v20 objectForKeyedSubscript:v26];
        [v27 doubleValue];
        PBDataWriterWriteDoubleField();

        PBDataWriterRecallMark();
      }
      uint64_t v23 = [(NSDictionary *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSearchSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)setServerFeatures:(double)a3 forKey:(id)a4
{
  id v10 = a4;
  serverFeatures = self->_serverFeatures;
  if (!serverFeatures)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = self->_serverFeatures;
    self->_serverFeatures = v7;

    serverFeatures = self->_serverFeatures;
  }
  NSUInteger v9 = [NSNumber numberWithDouble:a3];
  [(NSDictionary *)serverFeatures setObject:v9 forKey:v10];
}

- (BOOL)getServerFeatures:(double *)a3 forKey:(id)a4
{
  NSUInteger v5 = [(NSDictionary *)self->_serverFeatures objectForKeyedSubscript:a4];
  unint64_t v6 = v5;
  if (a3 && v5)
  {
    [v5 doubleValue];
    *(void *)a3 = v7;
  }

  return v6 != 0;
}

- (void)setServerFeatures:(id)a3
{
  self->_serverFeatures = (NSDictionary *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDetailText:(id)a3
{
  self->_detailText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setUtteranceText:(id)a3
{
  self->_utteranceText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setScopedSearchApplicationBundleIdentifier:(id)a3
{
  self->_scopedSearchApplicationBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setFbr:(id)a3
{
  self->_fbr = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPreviouslyEngaged:(BOOL)a3
{
  self->_int previouslyEngaged = a3;
}

- (void)setBundleIdentifier:(id)a3
{
  self->_bundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTopicIdentifier:(id)a3
{
  self->_topicIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)duplicateSuggestionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_duplicateSuggestions objectAtIndexedSubscript:a3];
}

- (unint64_t)duplicateSuggestionsCount
{
  return [(NSArray *)self->_duplicateSuggestions count];
}

- (void)addDuplicateSuggestions:(id)a3
{
  id v4 = a3;
  duplicateSuggestions = self->_duplicateSuggestions;
  id v8 = v4;
  if (!duplicateSuggestions)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_duplicateSuggestions;
    self->_duplicateSuggestions = v6;

    id v4 = v8;
    duplicateSuggestions = self->_duplicateSuggestions;
  }
  [(NSArray *)duplicateSuggestions addObject:v4];
}

- (void)clearDuplicateSuggestions
{
}

- (void)setDuplicateSuggestions:(id)a3
{
  self->_duplicateSuggestions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

- (void)setScore:(id)a3
{
}

- (void)setQuery:(id)a3
{
  self->_query = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSuggestion:(id)a3
{
  self->_suggestion = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end