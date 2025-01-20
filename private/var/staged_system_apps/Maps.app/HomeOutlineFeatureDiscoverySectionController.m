@interface HomeOutlineFeatureDiscoverySectionController
- (BOOL)persistsExpansions;
- (HomeOutlineFeatureDiscoverySectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4;
- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel;
- (NSArray)dataProviders;
- (NSArray)itemSnapshots;
- (SuggestionsDataProvider)suggestionsDataProvider;
- (id)contextMenuForSnapshot:(id)a3;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
@end

@implementation HomeOutlineFeatureDiscoverySectionController

- (HomeOutlineFeatureDiscoverySectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeOutlineFeatureDiscoverySectionController;
  v8 = [(HomeOutlineSectionController *)&v12 initWithConfiguration:a3];
  if (v8)
  {
    v9 = objc_alloc_init(FeatureDiscoveryDataProvider);
    featureDiscoveryDataProvider = v8->_featureDiscoveryDataProvider;
    v8->_featureDiscoveryDataProvider = v9;

    objc_storeStrong((id *)&v8->_suggestionsDataProvider, a4);
  }

  return v8;
}

- (NSArray)dataProviders
{
  suggestionsDataProvider = self->_suggestionsDataProvider;
  v5[0] = self->_featureDiscoveryDataProvider;
  v5[1] = suggestionsDataProvider;
  v3 = +[NSArray arrayWithObjects:v5 count:2];

  return (NSArray *)v3;
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  v2 = [[SectionHeaderBasicOutlineCellModel alloc] initWithTitle:&stru_101324E70];

  return (MapsUIDiffableDataSourceViewModel *)v2;
}

- (NSArray)itemSnapshots
{
  v3 = [(FeatureDiscoveryDataProvider *)self->_featureDiscoveryDataProvider features];
  v4 = [(HomeOutlineSectionController *)self configuration];
  v5 = [v4 sectionIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A92A40;
  v8[3] = &unk_1012E61D0;
  v8[4] = self;
  v6 = +[HomeOutlineSectionBuilder itemSnapshotsWithItems:v3 sectionIdentifier:v5 sectionExpanded:[(HomeOutlineSectionController *)self expanded] itemIdentifierBlock:v8 viewModelBlock:&stru_1013160C0 childItemsBlock:&stru_1013160E0 expandedBlock:&stru_101316100];

  return (NSArray *)v6;
}

- (id)contextMenuForSnapshot:(id)a3
{
  return 0;
}

- (BOOL)persistsExpansions
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(HomeOutlineSectionController *)self delegate];
  id v10 = [v7 sectionController:self nodeSnapshotAtIndexPath:v6];

  v8 = [v10 viewModel];
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0 && v8)
  {
    v9 = [v10 viewModel];
    [v9 markAsDisplayed];
  }
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);

  objc_storeStrong((id *)&self->_featureDiscoveryDataProvider, 0);
}

@end