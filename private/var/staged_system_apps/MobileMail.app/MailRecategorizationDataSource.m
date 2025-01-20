@interface MailRecategorizationDataSource
- (MFTriageInteractionDelegate)delegate;
- (MailRecategorizationDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)collectionViewDataSource;
- (UICollectionViewSupplementaryRegistration)autoCategorizationFooterRegistration;
- (UICollectionViewSupplementaryRegistration)manualCategorizationFooterRegistration;
- (UICollectionViewSupplementaryRegistration)manualCategorizationHeaderRegistration;
- (id)_configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5;
- (id)cardActionAtIndexPath:(id)a3;
- (void)_configureReusableSupplementaryViewForSenderDisplayName:(id)a3 bucket:(int64_t)a4;
- (void)reloadDataSource;
- (void)setAutoCategorizationFooterRegistration:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManualCategorizationFooterRegistration:(id)a3;
- (void)setManualCategorizationHeaderRegistration:(id)a3;
- (void)updateDataSourceWithMessageListItem:(id)a3 completion:(id)a4;
@end

@implementation MailRecategorizationDataSource

- (MailRecategorizationDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MailRecategorizationDataSource;
  v9 = [(MailRecategorizationDataSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collectionView, a3);
    v11 = (UICollectionViewDiffableDataSource *)[objc_alloc((Class)UICollectionViewDiffableDataSource) initWithCollectionView:v7 cellProvider:v8];
    collectionViewDataSource = v10->_collectionViewDataSource;
    v10->_collectionViewDataSource = v11;
  }
  return v10;
}

- (void)updateDataSourceWithMessageListItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)MSMessageListItemSelection);
  id v57 = v6;
  v9 = +[NSArray arrayWithObjects:&v57 count:1];
  id v38 = [v8 initWithMessageListItems:v9];

  v10 = [v6 senderList];
  v39 = [v10 firstObject];

  v11 = [v39 emailAddressValue];
  v37 = [v11 simpleAddress];

  if (v39)
  {
    id v12 = v39;
    v13 = [v12 emailAddressValue];
    objc_super v14 = [v13 em_displayableString];
    v15 = v14;
    if (v14)
    {
      CFStringRef v16 = v14;
    }
    else
    {
      v17 = [v13 simpleAddress];
      v18 = v17;
      if (v17)
      {
        CFStringRef v19 = v17;
      }
      else
      {
        CFStringRef v19 = [v12 stringValue];
      }
      CFStringRef v16 = v19;
    }
  }
  else
  {
    CFStringRef v16 = &stru_100619928;
  }
  v20 = [v6 category];
  [v20 type];
  uint64_t v21 = MUIBucketFromEMCategoryType();

  v22 = (__CFString *)v16;
  [(MailRecategorizationDataSource *)self _configureReusableSupplementaryViewForSenderDisplayName:v16 bucket:v21];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10011BBA4;
  v49[3] = &unk_1006089B8;
  id v36 = v38;
  id v50 = v36;
  id v23 = v37;
  id v51 = v23;
  v24 = v22;
  v52 = v24;
  id v35 = v6;
  id v53 = v35;
  v54 = self;
  id v25 = v7;
  id v55 = v25;
  v26 = objc_retainBlock(v49);
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  v28 = ((void (*)(void *, void))v26[2])(v26, 0);
  v56 = v28;
  v29 = +[NSArray arrayWithObjects:&v56 count:1];
  [v27 setObject:v29 forKeyedSubscript:&off_10062A938];

  v30 = +[NSMutableArray array];
  v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472;
  v45 = sub_10011BD04;
  v46 = &unk_1006089E0;
  v31 = v26;
  id v48 = v31;
  id v32 = v30;
  id v47 = v32;
  MUIBucketEnumerateAllBuckets();
  [v27 setObject:v32 forKeyedSubscript:&off_10062A950];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10011BD78;
  v40[3] = &unk_100604668;
  v40[4] = self;
  v41 = &off_10062B408;
  id v33 = v27;
  id v42 = v33;
  v34 = +[EFScheduler mainThreadScheduler];
  [v34 performBlock:v40];
}

- (void)reloadDataSource
{
  v3 = [(MailRecategorizationDataSource *)self collectionViewDataSource];
  id v6 = [v3 snapshot];

  v4 = [v6 sectionIdentifiers];
  [v6 reloadSectionsWithIdentifiers:v4];

  v5 = [(MailRecategorizationDataSource *)self collectionViewDataSource];
  [v5 applySnapshot:v6 animatingDifferences:0];
}

- (void)_configureReusableSupplementaryViewForSenderDisplayName:(id)a3 bucket:(int64_t)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  v5 = [(MailRecategorizationDataSource *)self collectionViewDataSource];
  [v5 setSupplementaryViewProvider:&v9];

  id v6 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:UICollectionElementKindSectionHeader configurationHandler:&stru_100608A20];
  [(MailRecategorizationDataSource *)self setAutoCategorizationFooterRegistration:v6];

  id v7 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:UICollectionElementKindSectionHeader configurationHandler:&stru_100608A40];
  [(MailRecategorizationDataSource *)self setManualCategorizationHeaderRegistration:v7];

  id v8 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:UICollectionElementKindSectionHeader configurationHandler:&stru_100608A60];
  [(MailRecategorizationDataSource *)self setManualCategorizationFooterRegistration:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:UICollectionElementKindSectionHeader])
  {
    v11 = [(MailRecategorizationDataSource *)self manualCategorizationHeaderRegistration];
    uint64_t v12 = [v8 dequeueConfiguredReusableSupplementaryViewWithRegistration:v11 forIndexPath:v10];
  }
  else
  {
    if (![v9 isEqualToString:UICollectionElementKindSectionFooter])
    {
      v13 = 0;
      goto LABEL_10;
    }
    if ([v10 section]) {
      [(MailRecategorizationDataSource *)self manualCategorizationFooterRegistration];
    }
    else {
    v11 = [(MailRecategorizationDataSource *)self autoCategorizationFooterRegistration];
    }
    uint64_t v12 = [v8 dequeueConfiguredReusableSupplementaryViewWithRegistration:v11 forIndexPath:v10];
  }
  v13 = (void *)v12;

LABEL_10:

  return v13;
}

- (id)cardActionAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MailRecategorizationDataSource *)self collectionViewDataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  return v6;
}

- (MFTriageInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTriageInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)autoCategorizationFooterRegistration
{
  return self->_autoCategorizationFooterRegistration;
}

- (void)setAutoCategorizationFooterRegistration:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)manualCategorizationFooterRegistration
{
  return self->_manualCategorizationFooterRegistration;
}

- (void)setManualCategorizationFooterRegistration:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)manualCategorizationHeaderRegistration
{
  return self->_manualCategorizationHeaderRegistration;
}

- (void)setManualCategorizationHeaderRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manualCategorizationHeaderRegistration, 0);
  objc_storeStrong((id *)&self->_manualCategorizationFooterRegistration, 0);
  objc_storeStrong((id *)&self->_autoCategorizationFooterRegistration, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end