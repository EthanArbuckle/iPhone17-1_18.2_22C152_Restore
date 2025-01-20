@interface ICNoteSearchCollectionView
- (id)attachmentSectionForLayoutEnvironment:(id)a3;
- (id)createLayout;
- (int64_t)keyboardDismissMode;
- (int64_t)noteListSectionHeaderModeForSectionIndex:(unint64_t)a3;
- (void)setHeaderOfSectionLayout:(id)a3;
@end

@implementation ICNoteSearchCollectionView

- (int64_t)keyboardDismissMode
{
  return 1;
}

- (void)setHeaderOfSectionLayout:(id)a3
{
  id v4 = a3;
  v5 = [(ICNoteBrowseCollectionView *)self headerLayoutItemWithEstimatedHeight:50.0];
  if (+[UIDevice ic_isVision]
    && ![(ICNoteBrowseCollectionView *)self noteContainerViewMode])
  {
    [v4 contentInsets];
    [v5 setContentInsets:];
  }
  v7 = v5;
  v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 setBoundarySupplementaryItems:v6];
}

- (id)createLayout
{
  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_1000BFF68;
  v9 = &unk_100627A80;
  objc_copyWeak(&v10, &location);
  v2 = objc_retainBlock(&v6);
  id v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  id v4 = [v3 initWithSectionProvider:v2, v6, v7, v8, v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

- (int64_t)noteListSectionHeaderModeForSectionIndex:(unint64_t)a3
{
  v5 = [(ICCollectionView *)self diffableDataSource];
  v6 = [v5 snapshot];
  uint64_t v7 = [v6 sectionIdentifiers];
  v8 = [v7 objectAtIndexedSubscript:a3];

  if (v8 == @"ICNoteSearchDataSourceSuggestionsSectionIdentifier")
  {
    int64_t v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICNoteSearchCollectionView;
    int64_t v9 = [(ICNoteBrowseCollectionView *)&v11 noteListSectionHeaderModeForSectionIndex:a3];
  }

  return v9;
}

- (id)attachmentSectionForLayoutEnvironment:(id)a3
{
  id v4 = a3;
  +[ICSearchAttachmentResultsCollectionViewCell itemSize];
  double v6 = v5;
  uint64_t v7 = [v4 container];

  [v7 effectiveContentSize];
  double v9 = v8;

  double v10 = fmax(ceil(v9 / 450.0), 1.0);
  double v11 = 16.0 / v9;
  if ((unint64_t)v10 <= 1) {
    double v11 = 0.0;
  }
  uint64_t v12 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0 / (double)(unint64_t)v10 - v11];
  v38 = +[NSCollectionLayoutDimension estimatedDimension:v6];
  v39 = (void *)v12;
  v37 = +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v12);
  v13 = +[NSCollectionLayoutItem itemWithLayoutSize:"itemWithLayoutSize:"];
  v14 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v15 = +[NSCollectionLayoutDimension estimatedDimension:v6];
  v16 = +[NSCollectionLayoutSize sizeWithWidthDimension:v14 heightDimension:v15];
  v41 = v13;
  v17 = +[NSArray arrayWithObjects:&v41 count:1];
  v18 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v16 subitems:v17];

  v19 = +[NSCollectionLayoutSpacing flexibleSpacing:16.0];
  [v18 setInterItemSpacing:v19];

  v20 = +[NSCollectionLayoutSection sectionWithGroup:v18];
  [v20 setInterGroupSpacing:16.0];
  v21 = [(ICNoteBrowseCollectionView *)self headerLayoutItemWithEstimatedHeight:50.0];
  v40 = v21;
  v22 = +[NSArray arrayWithObjects:&v40 count:1];
  [v20 setBoundarySupplementaryItems:v22];

  v23 = [(ICCollectionView *)self viewControllerManager];
  id v24 = [v23 behavior];

  if (v24 != (id)1)
  {
    [v20 contentInsets];
    double v26 = v25;
    double v28 = v27;
    [(ICNoteSearchCollectionView *)self directionalLayoutMargins];
    double v30 = v29;
    [(ICNoteSearchCollectionView *)self ic_directionalSafeAreaInsets];
    double v32 = v30 - v31;
    [(ICNoteSearchCollectionView *)self directionalLayoutMargins];
    double v34 = v33;
    [(ICNoteSearchCollectionView *)self ic_directionalSafeAreaInsets];
    [v20 setContentInsets:v26, v32, v28, v34 - v35];
  }

  return v20;
}

@end