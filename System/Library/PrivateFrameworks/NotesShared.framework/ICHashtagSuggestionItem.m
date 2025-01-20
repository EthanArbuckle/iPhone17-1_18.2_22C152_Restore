@interface ICHashtagSuggestionItem
+ (id)sortedItems:(id)a3 context:(id)a4;
+ (id)sortedSuggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:(id)a3 context:(id)a4;
+ (id)suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastUsedDate;
- (NSString)displayText;
- (NSString)tokenContentIdentifier;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)setDisplayText:(id)a3;
- (void)setLastUsedDate:(id)a3;
- (void)setTokenContentIdentifier:(id)a3;
@end

@implementation ICHashtagSuggestionItem

+ (id)suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v12 = objc_alloc_init(ICHashtagSuggestionItem);
        v13 = [v11 standardizedContent];
        [(ICHashtagSuggestionItem *)v12 setTokenContentIdentifier:v13];

        v14 = [v11 displayText];
        [(ICHashtagSuggestionItem *)v12 setDisplayText:v14];

        [v5 addObject:v12];
        v15 = [(ICHashtagSuggestionItem *)v12 displayText];
        objc_msgSend(v4, "ic_addNonNilObject:", v15);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }
  v26 = v6;

  v16 = +[ICCrossAppHashtagManager hashtagDisplayTextsFromOtherApps];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        if (([v4 containsObject:v21] & 1) == 0)
        {
          v22 = objc_alloc_init(ICHashtagSuggestionItem);
          v23 = +[ICHashtag standardizedHashtagRepresentationForDisplayText:v21];
          [(ICHashtagSuggestionItem *)v22 setTokenContentIdentifier:v23];

          [(ICHashtagSuggestionItem *)v22 setDisplayText:v21];
          [v5 addObject:v22];
          objc_msgSend(v4, "ic_addNonNilObject:", v21);
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }
  v24 = (void *)[v5 copy];

  return v24;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICHashtagSuggestionItem *)self lastUsedDate];
  if (!v5
    || (id v6 = (void *)v5,
        [v4 lastUsedDate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    v12 = [(ICHashtagSuggestionItem *)self lastUsedDate];
    if (v12)
    {
    }
    else
    {
      v13 = [v4 lastUsedDate];

      if (!v13)
      {
        uint64_t v16 = [(ICHashtagSuggestionItem *)self tokenContentIdentifier];
        if (v16)
        {
          uint64_t v17 = (void *)v16;
          uint64_t v18 = [v4 tokenContentIdentifier];

          if (v18)
          {
            uint64_t v8 = [(ICHashtagSuggestionItem *)self tokenContentIdentifier];
            uint64_t v9 = [v4 tokenContentIdentifier];
            goto LABEL_4;
          }
        }
        uint64_t v19 = [(ICHashtagSuggestionItem *)self tokenContentIdentifier];
        if (v19)
        {
        }
        else
        {
          v20 = [v4 tokenContentIdentifier];

          if (!v20)
          {
            int64_t v11 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v14 = [(ICHashtagSuggestionItem *)self tokenContentIdentifier];
LABEL_9:
        uint64_t v8 = (void *)v14;
        if (v14) {
          int64_t v11 = -1;
        }
        else {
          int64_t v11 = 1;
        }
        goto LABEL_12;
      }
    }
    uint64_t v14 = [(ICHashtagSuggestionItem *)self lastUsedDate];
    goto LABEL_9;
  }
  uint64_t v8 = [v4 lastUsedDate];
  uint64_t v9 = [(ICHashtagSuggestionItem *)self lastUsedDate];
LABEL_4:
  v10 = (void *)v9;
  int64_t v11 = [v8 compare:v9];

LABEL_12:
LABEL_13:

  return v11;
}

+ (id)sortedItems:(id)a3 context:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v30 + 1) + 8 * i) tokenContentIdentifier];
        objc_msgSend(v7, "ic_addNonNilObject:", v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [v7 allObjects];
  v15 = +[ICInlineAttachment recentlyUsedDatesForHashtagsStandardizedContents:v14 context:v6];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        v22 = objc_msgSend(v21, "tokenContentIdentifier", (void)v26);
        v23 = [v15 objectForKeyedSubscript:v22];
        [v21 setLastUsedDate:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }

  v24 = [v16 sortedArrayUsingComparator:&__block_literal_global_7];

  return v24;
}

uint64_t __47__ICHashtagSuggestionItem_sortedItems_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)sortedSuggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:(id)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:a3];
  id v8 = [a1 sortedItems:v7 context:v6];

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ICHashtagSuggestionItem *)self tokenContentIdentifier];
  uint64_t v3 = [v2 hash];
  unint64_t v11 = ICHashWithHashKeys(v3, v4, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();
  if (!v5)
  {
LABEL_8:
    char v11 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = [(ICHashtagSuggestionItem *)self tokenContentIdentifier];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [v5 tokenContentIdentifier],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    v12 = [(ICHashtagSuggestionItem *)self tokenContentIdentifier];
    if (v12)
    {
    }
    else
    {
      v13 = [v5 tokenContentIdentifier];

      if (!v13)
      {
        char v11 = 1;
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  uint64_t v9 = [(ICHashtagSuggestionItem *)self tokenContentIdentifier];
  uint64_t v10 = [v5 tokenContentIdentifier];
  char v11 = [v9 isEqualToString:v10];

LABEL_9:
  return v11;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)tokenContentIdentifier
{
  return self->_tokenContentIdentifier;
}

- (void)setTokenContentIdentifier:(id)a3
{
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_tokenContentIdentifier, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end