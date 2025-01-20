@interface AutocompleteMutableSection
- (AutocompleteMutableSection)initWithRules:(id)a3 excludingRules:(id)a4 title:(id)a5 isQuerySuggestionsSection:(BOOL)a6 isSectionForClientOnlyResults:(BOOL)a7;
- (BOOL)containsItem:(id)a3;
- (BOOL)enableMapsSuggestServerReranking;
- (BOOL)enforceServerResultsOrder;
- (BOOL)excludingRulesAllowItem:(id)a3;
- (BOOL)isQuerySuggestionsSection;
- (BOOL)isSectionForClientOnlyResults;
- (BOOL)itemIsAllowed:(id)a3 indexInCompletionSections:(id)a4;
- (NSArray)excludingRules;
- (NSArray)rules;
- (NSMutableArray)items;
- (NSMutableArray)poiRelevantItems;
- (NSString)title;
- (void)addItem:(id)a3 poiRelevanceScore:(double)a4;
- (void)prioritizePoiRelevantItems;
- (void)removeItem:(id)a3 poiRelevanceScore:(double)a4;
- (void)resortItemsToEnforceServerResultsOrderIfNeeded;
- (void)setEnableMapsSuggestServerReranking:(BOOL)a3;
- (void)setEnforceServerResultsOrder:(BOOL)a3;
- (void)setExcludingRules:(id)a3;
- (void)setIsQuerySuggestionsSection:(BOOL)a3;
- (void)setIsSectionForClientOnlyResults:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setPoiRelevantItems:(id)a3;
- (void)setRules:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AutocompleteMutableSection

- (AutocompleteMutableSection)initWithRules:(id)a3 excludingRules:(id)a4 title:(id)a5 isQuerySuggestionsSection:(BOOL)a6 isSectionForClientOnlyResults:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)AutocompleteMutableSection;
  v15 = [(AutocompleteMutableSection *)&v27 init];
  if (v15)
  {
    v16 = (NSArray *)[v12 copy];
    rules = v15->_rules;
    v15->_rules = v16;

    v18 = (NSArray *)[v13 copy];
    excludingRules = v15->_excludingRules;
    v15->_excludingRules = v18;

    v20 = (NSString *)[v14 copy];
    title = v15->_title;
    v15->_title = v20;

    v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    items = v15->_items;
    v15->_items = v22;

    v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    poiRelevantItems = v15->_poiRelevantItems;
    v15->_poiRelevantItems = v24;

    v15->_isQuerySuggestionsSection = a6;
    v15->_isSectionForClientOnlyResults = a7;
  }

  return v15;
}

- (BOOL)itemIsAllowed:(id)a3 indexInCompletionSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AutocompleteMutableSection *)self excludingRulesAllowItem:v6])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v8 = [(AutocompleteMutableSection *)self rules];
    id v21 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v21)
    {
      uint64_t v9 = *(void *)v29;
      v23 = v8;
      uint64_t v20 = *(void *)v29;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v8);
          }
          uint64_t v22 = v10;
          v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v12 = [v6 items:v20];
          id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v25;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v25 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if [v17 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem]&& (objc_msgSend(v11, "matchesItemWithSourceType:sourceSubtype:indexInCompletionSections:", objc_msgSend(v17, "sourceType"), objc_msgSend(v17, "sourceSubtype"), v7))
                {

                  goto LABEL_22;
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          if (objc_msgSend(v11, "matchesItemWithSourceType:sourceSubtype:indexInCompletionSections:", objc_msgSend(v6, "sourceType"), objc_msgSend(v6, "sourceSubtype"), v7))
          {
LABEL_22:
            BOOL v18 = 1;
            v8 = v23;
            goto LABEL_24;
          }
          uint64_t v10 = v22 + 1;
          v8 = v23;
          uint64_t v9 = v20;
        }
        while ((id)(v22 + 1) != v21);
        BOOL v18 = 0;
        id v21 = [v23 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
LABEL_24:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)excludingRulesAllowItem:(id)a3
{
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v5 = [(AutocompleteMutableSection *)self excludingRules];
  id v18 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v6 = *(void *)v25;
    id v19 = v4;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v5);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v9 = [v4 items];
        id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v21;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
              if ([v14 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem]
                && (objc_msgSend(v8, "matchesItemWithSourceType:sourceSubtype:indexInCompletionSections:", objc_msgSend(v14, "sourceType"), objc_msgSend(v14, "sourceSubtype"), 0) & 1) != 0)
              {

                BOOL v15 = 0;
                id v4 = v19;
                goto LABEL_20;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        id v4 = v19;
        uint64_t v6 = v17;
      }
      BOOL v15 = 1;
      id v18 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_20:

  return v15;
}

- (void)addItem:(id)a3 poiRelevanceScore:(double)a4
{
  id v7 = a3;
  uint64_t v6 = [(AutocompleteMutableSection *)self items];
  [v6 addObject:v7];

  if (a4 == 1.0) {
    [(NSMutableArray *)self->_poiRelevantItems addObject:v7];
  }
}

- (void)removeItem:(id)a3 poiRelevanceScore:(double)a4
{
  id v7 = a3;
  uint64_t v6 = [(AutocompleteMutableSection *)self items];
  [v6 removeObject:v7];

  if (a4 == 1.0) {
    [(NSMutableArray *)self->_poiRelevantItems removeObject:v7];
  }
}

- (BOOL)containsItem:(id)a3
{
  id v4 = a3;
  v5 = [(AutocompleteMutableSection *)self items];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)resortItemsToEnforceServerResultsOrderIfNeeded
{
  if ([(AutocompleteMutableSection *)self enforceServerResultsOrder])
  {
    v3 = [(AutocompleteMutableSection *)self items];
    id v4 = [v3 count];

    if ((unint64_t)v4 < 2)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 0;
      unint64_t v6 = 1;
      do
      {
        id v7 = [(AutocompleteMutableSection *)self items];
        v8 = [v7 objectAtIndexedSubscript:v6];

        if ([v8 hasServerItemIndex])
        {
          id v9 = [v8 serverSectionIndex];
          id v10 = [v8 serverItemIndexInSection];
          unint64_t v11 = 0;
          do
          {
            uint64_t v12 = [(AutocompleteMutableSection *)self items];
            id v13 = [v12 objectAtIndexedSubscript:v11];

            if ([v13 hasServerItemIndex]
              && (v9 < [v13 serverSectionIndex]
               || v9 == [v13 serverSectionIndex] && v10 < objc_msgSend(v13, "serverItemIndexInSection")))
            {
              id v14 = [(AutocompleteMutableSection *)self items];
              [v14 removeObjectAtIndex:v6];

              BOOL v15 = [(AutocompleteMutableSection *)self items];
              [v15 insertObject:v8 atIndex:v11];

              ++v5;
              unint64_t v11 = v6;
            }

            ++v11;
          }
          while (v11 < v6);
        }

        ++v6;
        v16 = [(AutocompleteMutableSection *)self items];
        id v17 = [v16 count];
      }
      while (v6 < (unint64_t)v17);
    }
    if ([(AutocompleteMutableSection *)self enableMapsSuggestServerReranking]) {
      [(AutocompleteMutableSection *)self prioritizePoiRelevantItems];
    }
    id v18 = sub_100109E50();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [(AutocompleteMutableSection *)self title];
      int v20 = 138412546;
      long long v21 = v19;
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Enforcing AC server order for section title=\"%@\": moved %lu item(s) to match server order", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)prioritizePoiRelevantItems
{
  id v17 = [(AutocompleteMutableSection *)self items];
  if ((unint64_t)[v17 count] >= 2)
  {
    id v3 = [(NSMutableArray *)self->_poiRelevantItems count];

    if (v3)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v4 = self->_poiRelevantItems;
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v19;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v19 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            id v10 = [(AutocompleteMutableSection *)self items];
            [v10 removeObject:v9];
          }
          id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v6);
      }

      [(NSMutableArray *)self->_poiRelevantItems sortWithOptions:16 usingComparator:&stru_1012FFDD0];
      unint64_t v11 = [(AutocompleteMutableSection *)self items];
      poiRelevantItems = self->_poiRelevantItems;
      id v13 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, [(NSMutableArray *)poiRelevantItems count]);
      [v11 insertObjects:poiRelevantItems atIndexes:v13];

      id v14 = sub_100109E50();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        BOOL v15 = [(AutocompleteMutableSection *)self title];
        id v16 = [(NSMutableArray *)self->_poiRelevantItems count];
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v15;
        __int16 v24 = 2048;
        id v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Enforcing AC server result reorder for section title=\"%@\": moved %lu item(s) to prioritize maps suggestions poi relevant items", buf, 0x16u);
      }
    }
  }
  else
  {
  }
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isQuerySuggestionsSection
{
  return self->_isQuerySuggestionsSection;
}

- (void)setIsQuerySuggestionsSection:(BOOL)a3
{
  self->_isQuerySuggestionsSection = a3;
}

- (BOOL)isSectionForClientOnlyResults
{
  return self->_isSectionForClientOnlyResults;
}

- (void)setIsSectionForClientOnlyResults:(BOOL)a3
{
  self->_isSectionForClientOnlyResults = a3;
}

- (BOOL)enforceServerResultsOrder
{
  return self->_enforceServerResultsOrder;
}

- (void)setEnforceServerResultsOrder:(BOOL)a3
{
  self->_enforceServerResultsOrder = a3;
}

- (BOOL)enableMapsSuggestServerReranking
{
  return self->_enableMapsSuggestServerReranking;
}

- (void)setEnableMapsSuggestServerReranking:(BOOL)a3
{
  self->_enableMapsSuggestServerReranking = a3;
}

- (NSArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
}

- (NSArray)excludingRules
{
  return self->_excludingRules;
}

- (void)setExcludingRules:(id)a3
{
}

- (NSMutableArray)poiRelevantItems
{
  return self->_poiRelevantItems;
}

- (void)setPoiRelevantItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiRelevantItems, 0);
  objc_storeStrong((id *)&self->_excludingRules, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end