@interface ShortcutsRowCellProvider
- (NSLayoutConstraint)heightConstraint;
- (ShortcutsRowCellProvider)initWithCollectionView:(id)a3;
- (ShortcutsRowCellProviderDelegate)delegate;
- (SuggestionsDataProvider)suggestionsDataProvider;
- (UICollectionView)collectionView;
- (UITraitCollection)traitCollection;
- (_TtC4Maps20MapsFavoritesManager)favoritesDataProvider;
- (id)_collectionViewLayout;
- (id)_modelAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (void)_buildModels;
- (void)_captureTapActionWithModel:(id)a3;
- (void)_updateBackgroundView;
- (void)_updateContentAnimated:(BOOL)a3;
- (void)_updateHeightConstraint;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)fetchMissingImages;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFavoritesDataProvider:(id)a3;
- (void)setSuggestionsDataProvider:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation ShortcutsRowCellProvider

- (void)setFavoritesDataProvider:(id)a3
{
  v5 = (_TtC4Maps20MapsFavoritesManager *)a3;
  favoritesDataProvider = self->_favoritesDataProvider;
  if (favoritesDataProvider != v5)
  {
    v7 = v5;
    [(MapsFavoritesManager *)favoritesDataProvider unregisterObserver:self];
    objc_storeStrong((id *)&self->_favoritesDataProvider, a3);
    [(MapsFavoritesManager *)self->_favoritesDataProvider registerObserver:self];
    [(ShortcutsRowCellProvider *)self _updateContentAnimated:0];
    v5 = v7;
  }
}

- (id)_collectionViewLayout
{
  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    id v4 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
    [v4 setScrollDirection:1];
    objc_initWeak(&location, self);
    id v5 = objc_alloc((Class)UICollectionViewCompositionalLayout);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005E374;
    v9[3] = &unk_1012EF3A8;
    objc_copyWeak(&v10, &location);
    v6 = (UICollectionViewCompositionalLayout *)[v5 initWithSectionProvider:v9 configuration:v4];
    v7 = self->_collectionViewLayout;
    self->_collectionViewLayout = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

    collectionViewLayout = self->_collectionViewLayout;
  }

  return collectionViewLayout;
}

- (void)setTraitCollection:(id)a3
{
  id v5 = (UITraitCollection *)a3;
  v6 = v5;
  if (self->_traitCollection != v5)
  {
    v8 = v5;
    unsigned __int8 v7 = -[UITraitCollection isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_traitCollection, a3);
      [(ShortcutsRowCellProvider *)self _updateHeightConstraint];
      v6 = v8;
    }
  }
}

- (void)_updateHeightConstraint
{
  +[ShortcutsRowCollectionViewCell cellSizeWithTraitCollection:self->_traitCollection];
  double v4 = v3;
  id v5 = [(UITraitCollection *)self->_traitCollection preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  double v7 = v4 + v4;
  if (!IsAccessibilityCategory) {
    double v7 = v4;
  }
  heightConstraint = self->_heightConstraint;

  [(NSLayoutConstraint *)heightConstraint setConstant:v7];
}

- (ShortcutsRowCellProvider)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ShortcutsRowCellProvider;
  id v5 = [(ShortcutsRowCellProvider *)&v31 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_collectionView, v4);
    [v4 setDelegate:v6];

    v8 = [(ShortcutsRowCellProvider *)v6 _collectionViewLayout];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_collectionView);
    [WeakRetained setCollectionViewLayout:v8];

    id v10 = objc_loadWeakRetained((id *)&v6->_collectionView);
    uint64_t v11 = objc_opt_class();
    v12 = +[ShortcutsRowCollectionViewCell cellReuseIdentifier];
    [v10 registerClass:v11 forCellWithReuseIdentifier:v12];

    id v13 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    id v14 = objc_loadWeakRetained((id *)&v6->_collectionView);
    v15 = sub_10001CBB8(v6);
    v16 = (UICollectionViewDiffableDataSource *)[v13 initWithCollectionView:v14 cellProvider:v15];
    diffableDataSource = v6->_diffableDataSource;
    v6->_diffableDataSource = v16;

    id v18 = objc_loadWeakRetained((id *)&v6->_collectionView);
    v19 = [v18 heightAnchor];
    uint64_t v20 = [v19 constraintEqualToConstant:0.0];
    heightConstraint = v6->_heightConstraint;
    v6->_heightConstraint = (NSLayoutConstraint *)v20;

    v22 = [ShortcutsRowBackgroundView alloc];
    id v23 = objc_loadWeakRetained((id *)&v6->_collectionView);
    v24 = [(ShortcutsRowBackgroundView *)v22 initWithCollectionView:v23];
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = v24;

    v26 = v6->_backgroundView;
    id v27 = objc_loadWeakRetained((id *)&v6->_collectionView);
    [v27 setBackgroundView:v26];

    uint64_t v28 = +[NSDate distantPast];
    lastCellTappedTimestamp = v6->_lastCellTappedTimestamp;
    v6->_lastCellTappedTimestamp = (NSDate *)v28;
  }
  return v6;
}

- (void)_updateContentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v5 = [(MapsFavoritesManager *)self->_favoritesDataProvider shortcutsForMapsHome];
    unsigned __int8 v6 = [v5 isEqual:self->_shortcuts];

    if (v6) {
      return;
    }
    id v7 = [(MapsFavoritesManager *)self->_favoritesDataProvider shortcutsForMapsHome];
    shortcuts = self->_shortcuts;
    self->_shortcuts = v7;

    v9 = self->_cellModels;
    [(ShortcutsRowCellProvider *)self _buildModels];
    objc_initWeak(&location, self);
    id v10 = +[NSDiffableDataSourceSnapshot _maps_singleSectionSnapshotWithIdentifiersForItems:self->_cellModels reloadingChangesFromPreviousItems:v9];
    diffableDataSource = self->_diffableDataSource;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001086FC;
    v20[3] = &unk_1012E6708;
    v12 = &v21;
    objc_copyWeak(&v21, &location);
    [(UICollectionViewDiffableDataSource *)diffableDataSource applySnapshot:v10 animatingDifferences:v3 completion:v20];
  }
  else
  {
    id v13 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider shortcuts];
    unsigned __int8 v14 = [v13 isEqual:self->_shortcuts];

    if (v14) {
      return;
    }
    v15 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider shortcuts];
    shortcutsLegacy = self->_shortcutsLegacy;
    self->_shortcutsLegacy = v15;

    v9 = self->_cellModels;
    [(ShortcutsRowCellProvider *)self _buildModels];
    objc_initWeak(&location, self);
    id v10 = +[NSDiffableDataSourceSnapshot _maps_singleSectionSnapshotWithIdentifiersForItems:self->_cellModels reloadingChangesFromPreviousItems:v9];
    v17 = self->_diffableDataSource;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10096BE00;
    v18[3] = &unk_1012E6708;
    v12 = &v19;
    objc_copyWeak(&v19, &location);
    [(UICollectionViewDiffableDataSource *)v17 applySnapshot:v10 animatingDifferences:v3 completion:v18];
  }
  objc_destroyWeak(v12);

  objc_destroyWeak(&location);
}

- (void)_buildModels
{
  BOOL v3 = +[NSMutableArray array];
  id v4 = +[NSMutableSet set];
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    long long v29 = 0uLL;
    long long v30 = 0uLL;
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    id v5 = self->_shortcuts;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [[SuggestionShortcutsRowCellModel alloc] initWithMapsFavoriteItem:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          uint64_t v11 = sub_1000A4B98(v10);
          if (v11 && ([v4 containsObject:v11] & 1) == 0)
          {
            [v3 addObject:v10];
            [v4 addObject:v11];
          }
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }
  }
  else
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    id v5 = self->_shortcutsLegacy;
    id v12 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v5);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
          v17 = [SuggestionShortcutsRowCellModel alloc];
          id v18 = -[SuggestionShortcutsRowCellModel initWithMapsSuggestionsEntry:](v17, "initWithMapsSuggestionsEntry:", v16, (void)v23);
          id v19 = sub_1000A4B98(v18);
          if (v19 && ([v4 containsObject:v19] & 1) == 0)
          {
            [v3 addObject:v18];
            [v4 addObject:v19];
          }
        }
        id v13 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v13);
    }
  }

  uint64_t v20 = objc_alloc_init(AddShortcutsRowCellModel);
  [v3 addObject:v20];

  id v21 = (NSArray *)[v3 copy];
  cellModels = self->_cellModels;
  self->_cellModels = v21;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = sub_100104194;
  long long v27 = sub_100104948;
  id v28 = 0;
  cellModels = self->_cellModels;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_1000A4B08;
  uint64_t v20 = &unk_101303820;
  id v12 = v10;
  id v21 = v12;
  v22 = &v23;
  [(NSArray *)cellModels enumerateObjectsUsingBlock:&v17];
  id v13 = +[ShortcutsRowCollectionViewCell cellReuseIdentifier];
  uint64_t v14 = [v8 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v9];
  v15 = [(ShortcutsRowCellProvider *)self _modelAtIndexPath:v24[5]];
  [v14 setModel:v15];

  [v14 setAccessibilityIdentifier:@"ShortcutsRowCell"];
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v12 model];
    [v8 fetchImageIfMissing];
  }
  [(NSDate *)self->_lastCellTappedTimestamp timeIntervalSinceNow];
  if (v9 < -1.0)
  {
    id v10 = [(ShortcutsRowCellProvider *)self _modelAtIndexPath:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (+[LibraryUIUtilities isMyPlacesEnabled])
      {
        uint64_t v11 = [v10 entry];
        +[HomeAnalyticsManager captureDisplayActionWithFavorite:v11];
      }
      else
      {
        uint64_t v11 = [v10 entryLegacy];
        +[HomeAnalyticsManager captureDisplayActionWithEntry:v11];
      }
    }
  }
}

- (id)_modelAtIndexPath:(id)a3
{
  id v4 = a3;
  if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
    || (id v5 = [v4 row], v5 >= (id)-[NSArray count](self->_cellModels, "count")))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_cellModels, "objectAtIndexedSubscript:", [v4 row]);
  }

  return v6;
}

- (void)fetchMissingImages
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_cellModels;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) fetchImageIfMissing:(void)v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)_updateBackgroundView
{
}

- (void)setSuggestionsDataProvider:(id)a3
{
  uint64_t v5 = (SuggestionsDataProvider *)a3;
  suggestionsDataProvider = self->_suggestionsDataProvider;
  if (suggestionsDataProvider != v5)
  {
    long long v9 = v5;
    long long v7 = [(SuggestionsDataProvider *)suggestionsDataProvider observers];
    [v7 unregisterObserver:self];

    objc_storeStrong((id *)&self->_suggestionsDataProvider, a3);
    long long v8 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider observers];
    [v8 registerObserver:self];

    [(ShortcutsRowCellProvider *)self _updateContentAnimated:0];
    uint64_t v5 = v9;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  long long v7 = [(ShortcutsRowCellProvider *)self _modelAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    unsigned int v9 = +[LibraryUIUtilities isMyPlacesEnabled];
    long long v10 = [(ShortcutsRowCellProvider *)self delegate];
    if (v9)
    {
      uint64_t v11 = [v8 entry];
      [v10 shortcutsRowCellProvider:self openFavorite:v11];
    }
    else
    {
      uint64_t v11 = [v8 entryLegacy];
      [v10 shortcutsRowCellProvider:self openShortcut:v11];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v8 = [(ShortcutsRowCellProvider *)self delegate];
    [v8 shortcutsRowCellProviderAddNewShortcut:self];
  }

LABEL_9:
  [v14 deselectItemAtIndexPath:v6 animated:1];
  [(ShortcutsRowCellProvider *)self _captureTapActionWithModel:v7];
  id v12 = +[NSDate date];
  lastCellTappedTimestamp = self->_lastCellTappedTimestamp;
  self->_lastCellTappedTimestamp = v12;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = [a4 firstObject:a3, a5.x, a5.y];
  long long v7 = [(ShortcutsRowCellProvider *)self _modelAtIndexPath:v6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    id v9 = 0;
    uint64_t v11 = 0;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  id v8 = v7;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v9 = [v8 entry];
    unsigned __int8 v10 = [v9 isShortcutForSetup];

    if (v10) {
      goto LABEL_8;
    }
LABEL_6:
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10096C14C;
    v13[3] = &unk_101303848;
    v13[4] = self;
    id v9 = v9;
    id v14 = v9;
    uint64_t v11 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v13];

    goto LABEL_9;
  }

  id v9 = 0;
LABEL_8:
  uint64_t v11 = 0;
LABEL_9:

  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v5 = [a3 cellForItemAtIndexPath:a5, a4];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)UIPreviewParameters);
    [v5 bounds];
    long long v7 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
    [v6 setVisiblePath:v7];

    id v8 = [objc_alloc((Class)UITargetedPreview) initWithView:v5 parameters:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_captureTapActionWithModel:(id)a3
{
  id v5 = a3;
  +[GEOAPPortal captureUserAction:2007 target:8 value:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v5;
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id v4 = [v3 entry];
      +[HomeAnalyticsManager captureTapActionWithFavorite:v4];
    }
    else
    {
      id v4 = [v3 entryLegacy];
      +[HomeAnalyticsManager captureTapActionWithEntry:v4];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      +[GEOAPPortal captureUserAction:2044 target:8 value:0];
    }
  }
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (ShortcutsRowCellProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ShortcutsRowCellProviderDelegate *)WeakRetained;
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (_TtC4Maps20MapsFavoritesManager)favoritesDataProvider
{
  return self->_favoritesDataProvider;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_favoritesDataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_lastCellTappedTimestamp, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_cellModels, 0);
  objc_storeStrong((id *)&self->_shortcutsLegacy, 0);
  objc_storeStrong((id *)&self->_shortcuts, 0);

  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end