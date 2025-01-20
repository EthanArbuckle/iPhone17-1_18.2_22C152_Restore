@interface UGCRatingsSectionController
- (BOOL)formInteractionEnabled;
- (NSArray)rowItems;
- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate;
- (UGCRatingsSectionController)initWithRatingsForm:(id)a3 mapItem:(id)a4 analyticsDelegate:(id)a5;
- (UGCSectionControllerDelegate)delegate;
- (id)_mapItemAppleRatings;
- (id)_ratingKeyForAppleRating:(id)a3;
- (id)_ratingKeyForCategory:(id)a3;
- (int64_t)_countAdjustmentForCategory:(id)a3;
- (void)_updateCategoryViewModels;
- (void)handleSuccessfulSubmission;
- (void)ratingCategoryCell:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4;
- (void)ratingCategoryCellChangedState:(int64_t)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFormInteractionEnabled:(BOOL)a3;
@end

@implementation UGCRatingsSectionController

- (UGCRatingsSectionController)initWithRatingsForm:(id)a3 mapItem:(id)a4 analyticsDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UGCRatingsSectionController;
  v12 = [(UGCRatingsSectionController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ratingsForm, a3);
    objc_storeStrong((id *)&v13->_mapItem, a4);
    objc_storeWeak((id *)&v13->_analyticsDelegate, v11);
    [(UGCForm *)v13->_ratingsForm addObserver:v13];
  }

  return v13;
}

- (void)ratingCategoryCell:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4
{
  p_delegate = &self->_delegate;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if ([WeakRetained conformsToProtocol:&OBJC_PROTOCOL___UGCRatingsSectionControllerDelegate])v7 = WeakRetained; {
  else
  }
    v7 = 0;
  id v8 = v7;

  [v8 ratingsSectionController:self presentInformedConsentIfNeededWithCompletion:v9];
}

- (void)ratingCategoryCellChangedState:(int64_t)a3 forKey:(id)a4
{
  id v10 = [(UGCRatingsForm *)self->_ratingsForm categoryForKey:a4];
  [v10 setCurrentState:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained conformsToProtocol:&OBJC_PROTOCOL___UGCRatingsSectionControllerDelegate])v7 = WeakRetained; {
  else
  }
    v7 = 0;
  id v8 = v7;

  id v9 = [v10 localizedTitle];
  [v8 ratingsSectionController:self userActionCapturedForRatingCategoryState:a3 value:v9];
}

- (void)handleSuccessfulSubmission
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(UGCRatingsForm *)self->_ratingsForm allRatingCategories];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 isEdited] && objc_msgSend(v8, "currentState"))
        {
          id v9 = [v8 currentState];
          if (v9 == (id)2) {
            unsigned int v10 = 2144;
          }
          else {
            unsigned int v10 = 17099;
          }
          if (v9 == (id)1) {
            uint64_t v11 = 2143;
          }
          else {
            uint64_t v11 = v10;
          }
          v12 = [(UGCRatingsSectionController *)self analyticsDelegate];
          v13 = [v8 localizedTitle];
          [v12 captureUserAction:v11 withValue:v13];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (NSArray)rowItems
{
  rowItems = self->_rowItems;
  if (!rowItems)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v23 = objc_alloc_init((Class)NSMutableArray);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(UGCRatingsForm *)self->_ratingsForm allRatingCategories];
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
          unsigned int v10 = [(UGCRatingsSectionController *)self _ratingKeyForCategory:v9];
          uint64_t v11 = -[UGCRatingCategoryCell initWithCurrentState:]([UGCRatingCategoryCell alloc], "initWithCurrentState:", [v9 currentState]);
          [(UGCRatingCategoryCell *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
          v12 = [v9 key];
          [(UGCRatingCategoryCell *)v11 setKey:v12];

          [(UGCRatingCategoryCell *)v11 setDelegate:self];
          [(UGCRatingCategoryCell *)v11 setEnabled:self->_formInteractionEnabled];
          v13 = [(UGCRatingsForm *)self->_ratingsForm allRatingCategories];
          long long v14 = [v13 lastObject];
          [(UGCPOIEnrichmentEditorCell *)v11 setShowBottomHairline:v9 != v14];

          [v4 setObject:v11 forKeyedSubscript:v10];
          long long v15 = +[UGCPOIEnrichmentRowItem rowItemWithView:v11 bottomSpacing:0.0];
          [v23 addObject:v15];
        }
        id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v6);
    }

    long long v16 = (NSDictionary *)[v4 copy];
    ratingCells = self->_ratingCells;
    self->_ratingCells = v16;

    [(UGCRatingsSectionController *)self _updateCategoryViewModels];
    v18 = +[UGCPOIEnrichmentGroupedSectionView groupedSectionRowItemWithRowItems:v23 bottomSpacing:16.0];
    v28 = v18;
    v19 = +[NSArray arrayWithObjects:&v28 count:1];
    v20 = self->_rowItems;
    self->_rowItems = v19;

    rowItems = self->_rowItems;
  }

  return rowItems;
}

- (void)_updateCategoryViewModels
{
  if (self->_ratingCells)
  {
    v3 = [(UGCRatingsSectionController *)self _mapItemAppleRatings];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [(UGCRatingsForm *)self->_ratingsForm allRatingCategories];
    id v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v4) {
      goto LABEL_18;
    }
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = [(UGCRatingsSectionController *)self _ratingKeyForCategory:v8];
        int64_t v10 = [(UGCRatingsSectionController *)self _countAdjustmentForCategory:v8];
        if (v3)
        {
          int64_t v11 = v10;
          if (v9)
          {
            uint64_t v12 = [v3 objectForKeyedSubscript:v9];
            if (v12)
            {
              v13 = (void *)v12;
              id v14 = [objc_alloc((Class)MUAppleCategoryRatingViewModel) initWithAppleRating:v12 clientCountAdjustment:v11];

              if (v14) {
                goto LABEL_14;
              }
            }
          }
          id v15 = objc_alloc((Class)MUUnratedCategoryRatingViewModel);
          long long v16 = [v8 localizedTitle];
          id v17 = [v15 initWithCategoryTitle:v16 clientCountAdjustment:v11];
        }
        else
        {
          id v18 = objc_alloc((Class)MUTitleOnlyCategoryRatingViewModel);
          long long v16 = [v8 localizedTitle];
          id v17 = [v18 initWithCategoryTitle:v16];
        }
        id v14 = v17;

LABEL_14:
        v19 = [(NSDictionary *)self->_ratingCells objectForKeyedSubscript:v9];

        if (v19)
        {
          v20 = [(NSDictionary *)self->_ratingCells objectForKeyedSubscript:v9];
          [v20 setAppleRatingViewModel:v14];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v5)
      {
LABEL_18:

        return;
      }
    }
  }
}

- (id)_ratingKeyForCategory:(id)a3
{
  id v3 = a3;
  if ([v3 ratingType] == (id)1)
  {
    id v4 = &stru_101324E70;
  }
  else
  {
    id v4 = [v3 localizedTitle];
  }

  return v4;
}

- (id)_ratingKeyForAppleRating:(id)a3
{
  id v3 = a3;
  if ([v3 ratingType])
  {
    id v4 = [v3 localizedTitle];
  }
  else
  {
    id v4 = &stru_101324E70;
  }

  return v4;
}

- (int64_t)_countAdjustmentForCategory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 initialState];
  id v5 = [v3 currentState];

  if (v5) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = -1;
  }
  if (v4) {
    return v6;
  }
  else {
    return v5 != 0;
  }
}

- (id)_mapItemAppleRatings
{
  if (!MapsFeature_IsEnabled_SydneyARP()) {
    goto LABEL_4;
  }
  id v3 = [(MKMapItem *)self->_mapItem _geoMapItem];
  if ([v3 _hasUserRatingScore])
  {
    id v4 = [(MKMapItem *)self->_mapItem _geoMapItem];
    unsigned int v5 = [v4 _hasAppleRatings];

    if (!v5)
    {
LABEL_4:
      id v6 = 0;
      goto LABEL_16;
    }
  }
  else
  {
  }
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [(MKMapItem *)self->_mapItem _geoMapItem];
  id v9 = [v8 _appleRatings];

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v15 = [(UGCRatingsSectionController *)self _ratingKeyForAppleRating:v14];
        if (v15) {
          [v7 setObject:v14 forKeyedSubscript:v15];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v6 = [v7 copy];
LABEL_16:

  return v6;
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  if (self->_formInteractionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_formInteractionEnabled = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NSDictionary *)self->_ratingCells allValues];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setEnabled:v3];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (UGCSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (UGCPOIEnrichmentAnalyticsDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rowItems, 0);
  objc_storeStrong((id *)&self->_ratingCells, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_ratingsForm, 0);
}

@end