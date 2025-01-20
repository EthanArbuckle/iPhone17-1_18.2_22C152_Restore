@interface MapsSuggestionsMeCard
- (BOOL)_maps_canAddShortcutForMapItem:(id)a3;
- (id)_maps_shortcutForMapItem:(id)a3;
- (id)_maps_shortcutForMapItem:(id)a3 fromShortcuts:(id)a4;
- (id)_maps_shortcutForSuggestionsEntry:(id)a3;
- (id)_maps_shortcutIncludingHiddenForMapItem:(id)a3;
- (id)_maps_shortcutOrderedEntries:(id)a3;
- (int64_t)_maps_firstValidMoveIndex;
@end

@implementation MapsSuggestionsMeCard

- (id)_maps_shortcutForSuggestionsEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 shortcutIdentifier];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(MapsSuggestionsMeCard *)self shortcutsForAll];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (sub_10097ABE4(v10, v4))
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_maps_shortcutForMapItem:(id)a3
{
  id v4 = a3;
  v5 = [(MapsSuggestionsMeCard *)self shortcutsForAll];
  v6 = [(MapsSuggestionsMeCard *)self _maps_shortcutForMapItem:v4 fromShortcuts:v5];

  return v6;
}

- (id)_maps_shortcutIncludingHiddenForMapItem:(id)a3
{
  id v4 = a3;
  v5 = [(MapsSuggestionsMeCard *)self shortcutsForAllIncludingHidden];
  v6 = [(MapsSuggestionsMeCard *)self _maps_shortcutForMapItem:v4 fromShortcuts:v5];

  return v6;
}

- (id)_maps_shortcutForMapItem:(id)a3 fromShortcuts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isCurrentLocation])
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = [v5 _geoMapItem];
    if (v8)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v6;
      id v7 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        id v18 = v6;
        uint64_t v10 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v9);
            }
            long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            uint64_t v13 = [v12 geoMapItem];
            if (v13)
            {
              long long v14 = (void *)v13;
              long long v15 = [v12 geoMapItem];
              char IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();

              if (IsEqualToMapItemForPurpose)
              {
                id v7 = v12;
                goto LABEL_16;
              }
            }
          }
          id v7 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v7) {
            continue;
          }
          break;
        }
LABEL_16:
        id v6 = v18;
      }
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)_maps_shortcutOrderedEntries:(id)a3
{
  id v19 = a3;
  id v4 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(MapsSuggestionsMeCard *)self shortcutsForAll];
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v19;
        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
              if (sub_10097ABE4(v9, v15)) {
                [v4 addObject:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v12);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  id v16 = [v4 copy];

  return v16;
}

- (BOOL)_maps_canAddShortcutForMapItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 isCurrentLocation] & 1) == 0)
  {
    uint64_t v7 = [(MapsSuggestionsMeCard *)self _maps_shortcutForMapItem:v5];

    BOOL v6 = v7 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_maps_firstValidMoveIndex
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(MapsSuggestionsMeCard *)self shortcutsForAll];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      int64_t v8 = (int64_t)v4 + v5;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v9 = (unint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * (void)v7) type];
        if (v9 > 5 || ((1 << v9) & 0x2C) == 0)
        {
          int64_t v8 = (int64_t)v7 + v5;
          goto LABEL_15;
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      int64_t v5 = v8;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v8 = 0;
  }
LABEL_15:

  return v8;
}

@end