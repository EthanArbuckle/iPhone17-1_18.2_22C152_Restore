@interface HomeCollectionSortItem
- (BOOL)isEqual:(id)a3;
- (CollectionHandler)collection;
- (HomeCollectionSortItem)initWithCollection:(id)a3 delegate:(id)a4;
- (HomeCollectionSortItemDelegate)delegate;
- (NSString)_maps_diffableDataSourceIdentifier;
- (id)_sortTypes;
- (id)_titleForCollectionSortType:(int64_t)a3;
- (id)cellModelWithBackgroundModel:(id)a3;
- (unint64_t)hash;
- (void)smallDropDownOutlineCell:(id)a3 didSelectItemAtIndex:(int64_t)a4;
@end

@implementation HomeCollectionSortItem

- (HomeCollectionSortItem)initWithCollection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeCollectionSortItem;
  v9 = [(HomeCollectionSortItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)[(CollectionHandler *)self->_collection hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HomeCollectionSortItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(HomeCollectionSortItem *)v6 collection];
    id v8 = v7;
    if (v7 == self->_collection || -[CollectionHandler isEqual:](v7, "isEqual:"))
    {
      id v9 = [(HomeCollectionSortItem *)v6 delegate];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (v9 == WeakRetained) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = [v9 isEqual:WeakRetained];
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return (NSString *)@"SortBy";
}

- (id)cellModelWithBackgroundModel:(id)a3
{
  id v4 = a3;
  v5 = [(HomeCollectionSortItem *)self _sortTypes];
  v6 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = -[HomeCollectionSortItem _titleForCollectionSortType:](self, "_titleForCollectionSortType:", [*(id *)(*((void *)&v18 + 1) + 8 * i) integerValue]);
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v13 = [SmallDropDownOutlineCellModel alloc];
  v14 = [(HomeCollectionSortItem *)self _titleForCollectionSortType:[(CollectionHandler *)self->_collection sortType]];
  v15 = +[NSNumber numberWithInteger:[(CollectionHandler *)self->_collection sortType]];
  v16 = -[SmallDropDownOutlineCellModel initWithButtonTitle:dropDownTitles:selectedIndex:delegate:backgroundModel:](v13, "initWithButtonTitle:dropDownTitles:selectedIndex:delegate:backgroundModel:", v14, v6, [v7 indexOfObject:v15], self, v4);

  return v16;
}

- (id)_titleForCollectionSortType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[Collection] Header Name";
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_8;
      }
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[Collection] Header Distance";
    }
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"[Collection] Header Date Added";
  }
  v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

LABEL_8:

  return v3;
}

- (id)_sortTypes
{
  v3 = +[NSMutableArray array];
  [v3 addObject:&off_1013A76F0];
  if ((id)[(CollectionHandler *)self->_collection contentType] == (id)1)
  {
    id v4 = +[MKLocationManager sharedLocationManager];
    unsigned int v5 = [v4 isAuthorizedForPreciseLocation];

    if (v5) {
      [v3 addObject:&off_1013A7708];
    }
  }
  if ((id)[(CollectionHandler *)self->_collection handlerType] != (id)3) {
    [v3 addObject:&off_1013A7720];
  }
  id v6 = [v3 copy];

  return v6;
}

- (void)smallDropDownOutlineCell:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  id v6 = [(HomeCollectionSortItem *)self _sortTypes];
  if ((a4 & 0x8000000000000000) == 0)
  {
    id v11 = v6;
    BOOL v7 = (uint64_t)[v6 count] <= a4;
    id v6 = v11;
    if (!v7)
    {
      id v8 = [v11 objectAtIndexedSubscript:a4];
      id v9 = [v8 integerValue];

      uint64_t v10 = [(HomeCollectionSortItem *)self delegate];
      [v10 collectionSortItem:self didSelectSortType:v9];

      id v6 = v11;
    }
  }
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (HomeCollectionSortItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HomeCollectionSortItemDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end