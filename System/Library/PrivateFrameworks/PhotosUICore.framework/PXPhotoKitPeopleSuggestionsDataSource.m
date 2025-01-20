@interface PXPhotoKitPeopleSuggestionsDataSource
- (PXPhotoKitPeopleSuggestionsDataSource)initWithState:(id)a3;
- (PXPhotoKitPeopleSuggestionsDataSourceState)_state;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXPhotoKitPeopleSuggestionsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (PXPhotoKitPeopleSuggestionsDataSourceState)_state
{
  return self->__state;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotoKitPeopleSuggestionsDataSource;
  [(PXSimpleIndexPath *)&v20 indexPathForObjectReference:v6];
  uint64_t v7 = v21;
  if ((void)v21 == *(void *)off_1E5DAAED8)
  {
    if (v6)
    {
      [v6 indexPath];
      if (v17 != v7 && v18 != 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = [v6 itemObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v10 = [(PXPhotoKitPeopleSuggestionsDataSource *)self _state];
          v11 = [v10 people];
          v12 = [v6 itemObject];
          v13 = [v12 person];
          uint64_t v14 = [v11 indexOfObject:v13];

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v21 = (unint64_t)[(PXPhotoKitPeopleSuggestionsDataSource *)self identifier];
            *(void *)&long long v22 = v14;
            *((void *)&v22 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
    }
  }
  long long v15 = v22;
  *(_OWORD *)&retstr->dataSourceIdentifier = v21;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  v4 = [(PXPhotoKitPeopleSuggestionsDataSource *)self _state];
  v5 = v4;
  if (a3->dataSourceIdentifier != *(void *)off_1E5DAAED8
    && a3->item != 0x7FFFFFFFFFFFFFFFLL
    && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [v4 people];
    v10 = [v9 objectAtIndexedSubscript:a3->item];

    v11 = [v5 personSuggestionsByPerson];
    v8 = [v11 objectForKeyedSubscript:v10];

    if (!v8)
    {
      v8 = +[PXPhotoKitPersonSuggestion personSuggestionWithPerson:v10];
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }

  return v8;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(PXPhotoKitPeopleSuggestionsDataSource *)self _state];
  v4 = [v3 people];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (PXPhotoKitPeopleSuggestionsDataSource)initWithState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoKitPeopleSuggestionsDataSource;
  id v6 = [(PXPhotoKitPeopleSuggestionsDataSource *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__state, a3);
  }

  return v7;
}

@end