@interface ListInteractionSession
- (ListInteractionSession)initWithObjects:(id)a3 forType:(int)a4 startDate:(id)a5 proactiveStartTimes:(id)a6;
- (NSArray)items;
- (NSDictionary)proactiveItems;
- (id)description;
- (int)listType;
- (void)updateWithSelection:(id)a3;
- (void)updateWithTableView:(id)a3;
@end

@implementation ListInteractionSession

- (ListInteractionSession)initWithObjects:(id)a3 forType:(int)a4 startDate:(id)a5 proactiveStartTimes:(id)a6
{
  id v10 = a3;
  id v60 = a5;
  id v62 = a6;
  if (![v10 count])
  {
    v54 = 0;
    goto LABEL_56;
  }
  v71.receiver = self;
  v71.super_class = (Class)ListInteractionSession;
  v11 = [(ListInteractionSession *)&v71 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_54;
  }
  v11->_resultsItemsInitialized = 0;
  v56 = v11;
  v11->_listType = a4;
  v59 = +[NSMutableDictionary dictionary];
  v58 = +[NSDate date];
  uint64_t v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v57 = v10;
  id v14 = v10;
  v15 = (void *)v13;
  id obj = v14;
  id v16 = [v14 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (!v16) {
    goto LABEL_53;
  }
  id v17 = v16;
  uint64_t v61 = 0;
  uint64_t v18 = *(void *)v68;
  uint64_t v19 = a4 - 2;
  unsigned int v66 = (0x3Bu >> (a4 - 2)) & 1;
  v63 = (void *)v13;
  uint64_t v64 = v19;
  do
  {
    v20 = 0;
    do
    {
      if (*(void *)v68 != v18) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v20);
      id v22 = objc_alloc_init((Class)GEOListResultItem);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v21;
        if ([v23 _hasMUID]) {
          [v22 setBusinessId:[v23 _muid]];
        }
        uint64_t v24 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v21;
          id v25 = objc_alloc_init((Class)GEOProactiveItem);
          [v25 setProactiveItemType:[v23 proactiveItemType]];
          [v25 setVisible:0];
          [v25 setShared:0];
          [v25 setEdited:0];
          [v25 setDeleted:0];
          [v25 setTapped:0];
          v26 = [v23 uniqueIdentifier];
          id v27 = [v62 objectForKeyedSubscript:v26];

          if (!v27)
          {
            v28 = [v23 uniqueIdentifier];
            [v62 setObject:v58 forKeyedSubscript:v28];

            v15 = v63;
            id v27 = v58;
          }
          [v27 timeIntervalSinceDate:v60];
          [v25 setTimeSinceStart:(int)(v29 * 1000.0)];
          v30 = +[NSNumber numberWithUnsignedInteger:(char *)v20 + v61];
          [v59 setObject:v25 forKeyedSubscript:v30];

          uint64_t v24 = 3;
        }
        else
        {
          id v31 = v21;
          v32 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
          objc_opt_class();
          id v33 = v31;
          if (objc_opt_isKindOfClass()) {
            v34 = v33;
          }
          else {
            v34 = 0;
          }
          id v35 = v34;

          if (v35)
          {
            v36 = [v35 historyEntry];
            unsigned int v37 = [v36 conformsToProtocol:v32];

            if (v37) {
              id v38 = v33;
            }
            else {
              id v38 = 0;
            }
            v15 = v63;
          }
          else
          {
            id v38 = 0;
          }

          if (v38)
          {
            id v39 = v33;
            v40 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
            objc_opt_class();
            id v41 = v39;
            if (objc_opt_isKindOfClass()) {
              v42 = v41;
            }
            else {
              v42 = 0;
            }
            id v43 = v42;

            if (v43
              && ([v43 historyEntry],
                  v44 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v45 = [v44 conformsToProtocol:v40],
                  v44,
                  v45))
            {
              id v23 = v41;
            }
            else
            {
              id v23 = 0;
            }

            v46 = [v23 historyEntry];
            v47 = [v46 geoMapItem];
            v48 = +[MKMapItem _itemWithGeoMapItem:v47];

            if ([v48 _hasMUID]) {
              [v22 setBusinessId:[v48 _muid]];
            }

            uint64_t v24 = 2;
            v15 = v63;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = [v33 mapItem];
              if ([v23 _hasMUID]) {
                [v22 setBusinessId:[v23 _muid]];
              }
              uint64_t v24 = 2;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v24 = 2;
                uint64_t v19 = v64;
                goto LABEL_46;
              }
              id v23 = [v33 mapItem];
              if ([v23 _hasMUID]) {
                [v22 setBusinessId:[v23 _muid]];
              }
              uint64_t v24 = 1;
            }
          }
        }
        uint64_t v19 = v64;
      }

LABEL_46:
      if (v19 <= 5 && v66) {
        uint64_t v24 = dword_100F6FF50[v19];
      }
      [v22 setResultType:v24];
      [v15 addObject:v22];

      v20 = (char *)v20 + 1;
    }
    while (v17 != v20);
    id v49 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    id v17 = v49;
    v61 += (uint64_t)v20;
  }
  while (v49);
LABEL_53:

  v50 = (NSArray *)[v15 copy];
  v12 = v56;
  items = v56->_items;
  v56->_items = v50;

  v52 = (NSDictionary *)[v59 copy];
  proactiveItems = v56->_proactiveItems;
  v56->_proactiveItems = v52;

  id v10 = v57;
LABEL_54:
  self = v12;
  v54 = self;
LABEL_56:

  return v54;
}

- (void)updateWithSelection:(id)a3
{
  id v6 = a3;
  if (((unint64_t)[v6 row] & 0x8000000000000000) == 0)
  {
    id v4 = [v6 row];
    if (v4 < (id)[(NSArray *)self->_items count])
    {
      v5 = -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", [v6 row]);
      [v5 setTappedCount:[v5 tappedCount] + 1];
    }
  }
}

- (void)updateWithTableView:(id)a3
{
  id v4 = [a3 indexPathsForVisibleRows];
  v5 = +[NSMutableIndexSet indexSet];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 row];
        if (v12 < (id)[(NSArray *)self->_items count])
        {
          [v5 addIndex:[v11 row]];
          uint64_t v13 = -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", [v11 row]);
          id v14 = v13;
          if (self->_resultsItemsInitialized) {
            [v13 setEventuallyVisible:1];
          }
          else {
            [v13 setInitiallyVisible:1];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  proactiveItems = self->_proactiveItems;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1005E8CE8;
  v17[3] = &unk_1012F1A90;
  id v18 = v5;
  id v16 = v5;
  [(NSDictionary *)proactiveItems enumerateKeysAndObjectsUsingBlock:v17];
  self->_resultsItemsInitialized = 1;
}

- (id)description
{
  uint64_t listType = self->_listType;
  if (listType >= 0xD)
  {
    id v4 = +[NSString stringWithFormat:@"(unknown: %i)", listType];
  }
  else
  {
    id v4 = off_1012F1B40[listType];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = self->_items;
  id v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      id v8 = 0;
      uint64_t v9 = v4;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        id v11 = [v10 resultType];
        if (v11 >= 4)
        {
          id v12 = +[NSString stringWithFormat:@"(unknown: %i)", v11];
        }
        else
        {
          id v12 = off_1012F1BA8[(int)v11];
        }
        if ([v10 initiallyVisible]) {
          CFStringRef v13 = @"YES";
        }
        else {
          CFStringRef v13 = @"NO";
        }
        if ([v10 eventuallyVisible]) {
          CFStringRef v14 = @"YES";
        }
        else {
          CFStringRef v14 = @"NO";
        }
        -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", @"\nListSession %@ initVisible %@ eventVisible %@ tap %d", v12, v13, v14, [v10 tappedCount]);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        id v8 = (char *)v8 + 1;
        uint64_t v9 = v4;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (NSDictionary)proactiveItems
{
  return self->_proactiveItems;
}

- (NSArray)items
{
  return self->_items;
}

- (int)listType
{
  return self->_listType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_proactiveItems, 0);
}

@end