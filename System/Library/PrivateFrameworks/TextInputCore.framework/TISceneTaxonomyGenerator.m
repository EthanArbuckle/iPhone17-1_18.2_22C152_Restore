@interface TISceneTaxonomyGenerator
- (NLTagger)tagger;
- (NSArray)notSupportingInputModes;
- (NSSet)phrases;
- (NSSet)taxonomyIdentifiers;
- (NSSet)taxonomyIdentifiersAllowListSynonymExclusions;
- (TISceneTaxonomyGenerator)init;
- (id)_extractTokensForStickerComputation:(id)a3;
- (id)_generateQueries:(id)a3 tokenize:(BOOL)a4;
- (id)_generateQueryTokens:(id)a3;
- (id)_generateSearchableQueries:(id)a3 disablePhraseListCheck:(BOOL)a4;
- (id)_generateTokens:(id)a3;
- (id)_generateTokensFromInputString:(id)a3;
- (id)generateSearchableQueriesForText:(id)a3 tokenize:(BOOL)a4 generativeEmojiSearchQueries:(BOOL)a5;
- (void)setNotSupportingInputModes:(id)a3;
@end

@implementation TISceneTaxonomyGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notSupportingInputModes, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_taxonomyIdentifiersAllowListSynonymExclusions, 0);
  objc_storeStrong((id *)&self->_taxonomyIdentifiers, 0);

  objc_storeStrong((id *)&self->_tagger, 0);
}

- (void)setNotSupportingInputModes:(id)a3
{
}

- (NSArray)notSupportingInputModes
{
  return self->_notSupportingInputModes;
}

- (id)_generateSearchableQueries:(id)a3 disablePhraseListCheck:(BOOL)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = v7;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__TISceneTaxonomyGenerator__generateSearchableQueries_disablePhraseListCheck___block_invoke;
    v12[3] = &unk_1E6E2E038;
    BOOL v15 = a4;
    id v9 = v7;
    id v13 = v9;
    v14 = self;
    [v6 enumerateObjectsUsingBlock:v12];
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __78__TISceneTaxonomyGenerator__generateSearchableQueries_disablePhraseListCheck___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    goto LABEL_3;
  }
  v3 = [*(id *)(a1 + 40) phrases];
  v4 = [v9 normalizedQueryString];
  int v5 = [v3 containsObject:v4];

  id v7 = v9;
  if (v5)
  {
LABEL_3:
    uint64_t v6 = [*(id *)(a1 + 32) addObject:v9];
    id v7 = v9;
  }

  return MEMORY[0x1F41817F8](v6, v7);
}

- (id)_generateQueries:(id)a3 tokenize:(BOOL)a4
{
  BOOL v4 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_16;
  }
  id v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v8 = [v6 componentsSeparatedByCharactersInSet:v7];
  id v9 = [v8 lastObject];

  if (([v9 _looksLikeEmailAddress] & 1) == 0 && (objc_msgSend(v9, "_looksLikeURL") & 1) == 0)
  {
    if (v4)
    {
      v11 = [(TISceneTaxonomyGenerator *)self _generateTokensFromInputString:v6];
      if (![v11 count])
      {
        id v10 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v22 = v9;
    }
    else
    {
      v22 = v9;
      v12 = [[TIStickerQuery alloc] initWithQueryString:v6];
      v23[0] = v12;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    }
    id v13 = -[TISceneTaxonomyGenerator _extractTokensForStickerComputation:](self, "_extractTokensForStickerComputation:", v11, v11);
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    if ([v13 count])
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      do
      {
        v16 = objc_msgSend(v13, "subarrayWithRange:", v15, objc_msgSend(v13, "count") + v14);
        v17 = [v16 valueForKey:@"queryString"];
        v18 = [v17 componentsJoinedByString:@" "];

        v19 = [[TIStickerQuery alloc] initWithQueryString:v18];
        [v10 addObject:v19];
        ++v15;

        --v14;
      }
      while (v15 < [v13 count]);
    }

    v11 = v21;
    id v9 = v22;
    goto LABEL_14;
  }
  id v10 = 0;
LABEL_15:

LABEL_16:

  return v10;
}

- (id)_generateTokensFromInputString:(id)a3
{
  id v4 = a3;
  int v5 = [(TISceneTaxonomyGenerator *)self phrases];

  if (v5)
  {
    id v6 = [(TISceneTaxonomyGenerator *)self _generateQueryTokens:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_extractTokensForStickerComputation:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    if ((unint64_t)[v5 count] >= 9)
    {
      uint64_t v6 = objc_msgSend(v5, "subarrayWithRange:", objc_msgSend(v5, "count") - 8, 8);

      id v5 = (id)v6;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_generateTokens:(id)a3
{
  id v4 = a3;
  id v5 = [(TISceneTaxonomyGenerator *)self tagger];
  [v5 setString:v4];

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [(TISceneTaxonomyGenerator *)self tagger];
  uint64_t v8 = [v4 length];
  uint64_t v9 = *MEMORY[0x1E4F38880];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__TISceneTaxonomyGenerator__generateTokens___block_invoke;
  v15[3] = &unk_1E6E2E010;
  id v16 = v4;
  id v10 = v6;
  id v17 = v10;
  id v11 = v4;
  objc_msgSend(v7, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v8, 0, v9, 6, v15);

  v12 = v17;
  id v13 = v10;

  return v13;
}

void __44__TISceneTaxonomyGenerator__generateTokens___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [v5 localizedLowercaseString];
    id v4 = [v3 decomposedStringWithCanonicalMapping];
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (id)_generateQueryTokens:(id)a3
{
  id v4 = a3;
  id v5 = [(TISceneTaxonomyGenerator *)self tagger];
  [v5 setString:v4];

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [(TISceneTaxonomyGenerator *)self tagger];
  uint64_t v8 = [v4 length];
  uint64_t v9 = *MEMORY[0x1E4F38880];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__TISceneTaxonomyGenerator__generateQueryTokens___block_invoke;
  v15[3] = &unk_1E6E2E010;
  id v16 = v4;
  id v10 = v6;
  id v17 = v10;
  id v11 = v4;
  objc_msgSend(v7, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v8, 0, v9, 6, v15);

  v12 = v17;
  id v13 = v10;

  return v13;
}

void __49__TISceneTaxonomyGenerator__generateQueryTokens___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [[TIStickerQuery alloc] initWithQueryString:v4];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)generateSearchableQueriesForText:(id)a3 tokenize:(BOOL)a4 generativeEmojiSearchQueries:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![v8 length]) {
    goto LABEL_10;
  }
  if (_os_feature_enabled_impl()) {
    goto LABEL_6;
  }
  notSupportingInputModes = self->_notSupportingInputModes;
  id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v11 = [v10 languageCode];
  LODWORD(notSupportingInputModes) = [(NSArray *)notSupportingInputModes containsObject:v11];

  if (!notSupportingInputModes)
  {
LABEL_6:
    id v17 = [(TISceneTaxonomyGenerator *)self phrases];

    if (v17)
    {
      v18 = [(TISceneTaxonomyGenerator *)self _generateQueries:v8 tokenize:v6];
      v19 = [(TISceneTaxonomyGenerator *)self _generateSearchableQueries:v18 disablePhraseListCheck:v5];

      goto LABEL_11;
    }
    v12 = UnicodeScalar.__ivar_initializer();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s Localized phrases haven't be set", "-[TISceneTaxonomyGenerator generateSearchableQueriesForText:tokenize:generativeEmojiSearchQueries:]");
    *(_DWORD *)buf = 138412290;
    v22 = v16;
    _os_log_error_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    goto LABEL_15;
  }
  v12 = UnicodeScalar.__ivar_initializer();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = NSString;
    uint64_t v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    unint64_t v15 = [v14 languageCode];
    id v16 = [v13 stringWithFormat:@"%s The locale %@ is not supported.", "-[TISceneTaxonomyGenerator generateSearchableQueriesForText:tokenize:generativeEmojiSearchQueries:]", v15];
    *(_DWORD *)buf = 138412290;
    v22 = v16;
    _os_log_error_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

LABEL_15:
  }
LABEL_9:

LABEL_10:
  v19 = 0;
LABEL_11:

  return v19;
}

- (NSSet)phrases
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  phrases = self->_phrases;
  if (phrases)
  {
LABEL_31:
    v31 = phrases;
    goto LABEL_32;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F8CD60]) initWithLatestTaxonomy];
  if (v39)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    BOOL v5 = [(TISceneTaxonomyGenerator *)self taxonomyIdentifiersAllowListSynonymExclusions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v49 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          objc_msgSend(v39, "nodeRefForSceneClassId:", objc_msgSend(v10, "unsignedIntValue"));
          id v11 = PFSceneTaxonomyNodeLocalizedLabel();
          if (v11)
          {
            v12 = [(TISceneTaxonomyGenerator *)self _generateTokens:v11];
            id v13 = [v12 componentsJoinedByString:@" "];
            [v4 setObject:v10 forKey:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v7);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = [(TISceneTaxonomyGenerator *)self taxonomyIdentifiers];
    uint64_t v35 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v45 != v34) {
            objc_enumerationMutation(obj);
          }
          unint64_t v15 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          objc_msgSend(v39, "nodeRefForSceneClassId:", objc_msgSend(v15, "unsignedIntValue"));
          id v16 = PFSceneTaxonomyNodeLocalizedLabel();
          if (v16)
          {
            id v17 = [(TISceneTaxonomyGenerator *)self _generateTokens:v16];
            v18 = [v17 componentsJoinedByString:@" "];
            [v4 setObject:v15 forKey:v18];
          }
          v19 = PFSceneTaxonomyNodeLocalizedSynonyms();
          if ([v19 count])
          {
            v37 = v16;
            uint64_t v38 = j;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            v36 = v19;
            id v20 = v19;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v41;
              do
              {
                for (uint64_t k = 0; k != v22; ++k)
                {
                  if (*(void *)v41 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = [(TISceneTaxonomyGenerator *)self _generateTokens:*(void *)(*((void *)&v40 + 1) + 8 * k)];
                  v26 = [v25 componentsJoinedByString:@" "];
                  [v4 setObject:v15 forKey:v26];
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v52 count:16];
              }
              while (v22);
            }

            id v16 = v37;
            uint64_t j = v38;
            v19 = v36;
          }
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v35);
    }

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    v28 = [v4 allKeys];
    v29 = [v27 setWithArray:v28];
    v30 = self->_phrases;
    self->_phrases = v29;

    phrases = self->_phrases;
    goto LABEL_31;
  }

  v31 = 0;
LABEL_32:

  return v31;
}

- (NSSet)taxonomyIdentifiersAllowListSynonymExclusions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  taxonomyIdentifiersAllowListSynonymExclusions = self->_taxonomyIdentifiersAllowListSynonymExclusions;
  if (!taxonomyIdentifiersAllowListSynonymExclusions)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    BOOL v5 = TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions();
    uint64_t v6 = (NSSet *)[v4 initWithArray:v5];
    uint64_t v7 = self->_taxonomyIdentifiersAllowListSynonymExclusions;
    self->_taxonomyIdentifiersAllowListSynonymExclusions = v6;

    taxonomyIdentifiersAllowListSynonymExclusions = self->_taxonomyIdentifiersAllowListSynonymExclusions;
    if (!taxonomyIdentifiersAllowListSynonymExclusions)
    {
      uint64_t v8 = UnicodeScalar.__ivar_initializer();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s StickerTaxonomyIdentifiersAllowListSynonymExclusions file does not have any identifiers. All the taxonomy should extend allow-list with their synonyms", "-[TISceneTaxonomyGenerator taxonomyIdentifiersAllowListSynonymExclusions]");
        *(_DWORD *)buf = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      taxonomyIdentifiersAllowListSynonymExclusions = self->_taxonomyIdentifiersAllowListSynonymExclusions;
    }
  }

  return taxonomyIdentifiersAllowListSynonymExclusions;
}

- (NSSet)taxonomyIdentifiers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  taxonomyIdentifiers = self->_taxonomyIdentifiers;
  if (!taxonomyIdentifiers)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
    BOOL v5 = TIGetStickerTaxonomyIdentifiers();
    uint64_t v6 = (void *)[v4 initWithArray:v5];

    uint64_t v7 = [(TISceneTaxonomyGenerator *)self taxonomyIdentifiersAllowListSynonymExclusions];
    [v6 minusSet:v7];

    uint64_t v8 = (NSSet *)[v6 copy];
    uint64_t v9 = self->_taxonomyIdentifiers;
    self->_taxonomyIdentifiers = v8;

    taxonomyIdentifiers = self->_taxonomyIdentifiers;
    if (!taxonomyIdentifiers)
    {
      id v10 = UnicodeScalar.__ivar_initializer();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s No taxonomy identifiers available", "-[TISceneTaxonomyGenerator taxonomyIdentifiers]");
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v11;
        _os_log_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      taxonomyIdentifiers = self->_taxonomyIdentifiers;
    }
  }

  return taxonomyIdentifiers;
}

- (NLTagger)tagger
{
  v9[1] = *MEMORY[0x1E4F143B8];
  tagger = self->_tagger;
  if (!tagger)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F388F0]);
    v9[0] = *MEMORY[0x1E4F38880];
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v6 = (NLTagger *)[v4 initWithTagSchemes:v5];
    uint64_t v7 = self->_tagger;
    self->_tagger = v6;

    tagger = self->_tagger;
  }

  return tagger;
}

- (TISceneTaxonomyGenerator)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)TISceneTaxonomyGenerator;
  v2 = [(TISceneTaxonomyGenerator *)&v13 init];
  if (v2)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      notSupportingInputModes = v2->_notSupportingInputModes;
      v2->_notSupportingInputModes = (NSArray *)&unk_1F3FA7970;

      id v4 = v2->_notSupportingInputModes;
      BOOL v5 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v6 = [v5 languageCode];
      LODWORD(v4) = [(NSArray *)v4 containsObject:v6];

      if (v4)
      {
        uint64_t v7 = UnicodeScalar.__ivar_initializer();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = NSString;
          id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
          id v11 = [v10 languageCode];
          v12 = [v9 stringWithFormat:@"%s The locale %@ is not supported. Sticker Suggestion would be disabled.", "-[TISceneTaxonomyGenerator init]", v11];
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v12;
          _os_log_error_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  return v2;
}

@end