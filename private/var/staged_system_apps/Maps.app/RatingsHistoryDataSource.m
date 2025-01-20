@interface RatingsHistoryDataSource
- (RatingsHistoryDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4;
- (SupplementaryElementsDataSourceDelegate)privacyDelegate;
- (double)footerHeightForSection:(int64_t)a3 collectionView:(id)a4;
- (id)_footerLinkText;
- (id)_footerText;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)objectAtIndexPath:(id)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_buildContent;
- (void)_cancelMapItemTicket;
- (void)_fetchMapItemsForReviewedPlaces:(id)a3 completion:(id)a4;
- (void)_fetchReviewedPlaces;
- (void)_loadContent;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)privacyTextTapped;
- (void)setPrivacyDelegate:(id)a3;
@end

@implementation RatingsHistoryDataSource

- (RatingsHistoryDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RatingsHistoryDataSource;
  v4 = [(DataSource *)&v7 initWithCollectionView:a3 updateLocation:a4];
  if (v4)
  {
    v5 = +[UGCReviewedPlaceMapsSync sharedInstance];
    [v5 registerObserver:v4];

    [(RatingsHistoryDataSource *)v4 _fetchReviewedPlaces];
  }
  return v4;
}

- (void)dealloc
{
  [(RatingsHistoryDataSource *)self _cancelMapItemTicket];
  v3.receiver = self;
  v3.super_class = (Class)RatingsHistoryDataSource;
  [(RatingsHistoryDataSource *)&v3 dealloc];
}

- (void)_loadContent
{
  [(RatingsHistoryDataSource *)self _buildContent];
  id v3 = [(DataSource *)self delegate];
  [v3 dataSourceUpdated:self];
}

- (void)_buildContent
{
  id v3 = +[NSMutableArray array];
  v4 = +[NSMutableArray array];
  v5 = +[NSMutableArray array];
  v38 = self;
  id v6 = [(NSArray *)self->_reviewedPlaces copy];
  v39 = +[NSDate date];
  objc_super v7 = +[NSCalendar currentCalendar];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v42;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v41 + 1) + 8 * i);
        v13 = [v12 reviewedPlace];
        v14 = [v13 dateOfLastEdit];

        unsigned __int8 v15 = [v7 isDateInToday:v14];
        v16 = v3;
        if ((v15 & 1) == 0)
        {
          if ([v7 compareDate:v39 toDate:v14 toUnitGranularity:0x2000]) {
            v16 = v5;
          }
          else {
            v16 = v4;
          }
        }
        [v16 addObject:v12];
      }
      id v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v9);
  }

  v17 = +[NSMutableArray array];
  if ([v3 count])
  {
    v18 = objc_alloc_init(RatingsBucketSection);
    id v19 = objc_alloc((Class)NSAttributedString);
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"[Ratings History] Today" value:@"localized string not found" table:0];
    id v22 = [v19 initWithString:v21];
    [(RatingsBucketSection *)v18 setTitle:v22];

    id v23 = [v3 copy];
    [(RatingsBucketSection *)v18 setObjects:v23];

    [v17 addObject:v18];
  }
  if ([v4 count])
  {
    v24 = objc_alloc_init(RatingsBucketSection);
    id v25 = objc_alloc((Class)NSAttributedString);
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"[Ratings History] This Week" value:@"localized string not found" table:0];
    id v28 = [v25 initWithString:v27];
    [(RatingsBucketSection *)v24 setTitle:v28];

    id v29 = [v4 copy];
    [(RatingsBucketSection *)v24 setObjects:v29];

    [v17 addObject:v24];
  }
  if ([v5 count])
  {
    v30 = objc_alloc_init(RatingsBucketSection);
    id v31 = objc_alloc((Class)NSAttributedString);
    v32 = +[NSBundle mainBundle];
    v33 = [v32 localizedStringForKey:@"[Ratings History] Older" value:@"localized string not found" table:0];
    id v34 = [v31 initWithString:v33];
    [(RatingsBucketSection *)v30 setTitle:v34];

    id v35 = [v5 copy];
    [(RatingsBucketSection *)v30 setObjects:v35];

    [v17 addObject:v30];
  }
  v36 = (NSArray *)[v17 copy];
  sections = v38->_sections;
  v38->_sections = v36;
}

- (id)_footerText
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[Ratings History] Your photos are associated with your Apple Account." value:@"localized string not found" table:0];

  return v3;
}

- (id)_footerLinkText
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[Ratings History] See How Your Data is Managed" value:@"localized string not found" table:0];

  return v3;
}

- (double)footerHeightForSection:(int64_t)a3 collectionView:(id)a4
{
  [a4 frame];
  double v7 = v6;
  double height = UILayoutFittingExpandedSize.height;
  id v9 = -[MapsThemeCollectionReusableView initWithFrame:]([UserProfileSectionFooterView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  uint64_t v10 = [(RatingsHistoryDataSource *)self _footerText];
  v11 = [(RatingsHistoryDataSource *)self _footerLinkText];
  id v12 = [v10 stringByAppendingString:v11];

  v13 = [(NSArray *)self->_sections lastObject];
  v14 = [(RatingsHistoryDataSource *)self sectionAtIndex:a3];
  if ([v13 isEqual:v14])
  {
    unsigned __int8 v15 = [UserProfileSectionFooterViewModel alloc];
    id v16 = [objc_alloc((Class)NSAttributedString) initWithString:v12];
    v17 = [(UserProfileSectionFooterViewModel *)v15 initWithContentString:v16];
  }
  else
  {
    v17 = 0;
  }
  [(UserProfileSectionFooterView *)v9 configureWithViewModel:v17];
  LODWORD(v18) = 1148846080;
  LODWORD(v19) = 1132068864;
  -[UserProfileSectionFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v7 + -32.0, height, v18, v19);
  double v21 = v20;

  return v21;
}

- (id)sectionAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    double v6 = 0;
  }
  else
  {
    if ([(NSArray *)self->_sections count] <= a3)
    {
      double v6 = 0;
    }
    else
    {
      double v6 = [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
    }
  }
  return v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[RatingsHistoryDataSource sectionAtIndex:](self, "sectionAtIndex:", [v4 section]);
  double v6 = [v5 objects];
  if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
    || (id v7 = [v4 row], v7 >= objc_msgSend(v6, "count")))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(RatingsHistoryDataSource *)self sectionAtIndex:a4];
  v5 = [v4 objects];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[TwoLineCollectionViewListCell identifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  uint64_t v10 = [(RatingsHistoryDataSource *)self objectAtIndexPath:v6];

  v11 = +[TwoLinesContentViewModelComposer cellModelForRatingsHistory:v10];
  [v9 setViewModel:v11];

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[RatingsHistoryDataSource sectionAtIndex:](self, "sectionAtIndex:", [v10 section]);
  id v12 = [(NSArray *)self->_sections lastObject];
  if ([v9 isEqualToString:UICollectionElementKindSectionHeader])
  {
    v13 = +[SectionHeaderCollectionReusableView reuseIdentifier];
    v14 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v13 forIndexPath:v10];

    unsigned __int8 v15 = +[SectionHeaderCollectionReusableView reuseIdentifier];
    [v14 setAccessibilityIdentifier:v15];

    id v16 = [v11 title];
    v17 = [v16 string];
    [v14 setTitle:v17];

    [v14 setShowsBottomHairline:0];
    [v14 setFirstNonEmptySection:1];
    [v14 setAccessibilityIdentifiersWithBaseString:@"RatingsHistory"];
    [v14 setNeedsLayout];
    [v14 layoutIfNeeded];
  }
  else
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1005A8878;
    v33[3] = &unk_1012F0988;
    id v34 = v8;
    id v35 = v10;
    id v18 = v12;
    id v36 = v18;
    id v19 = v11;
    id v37 = v19;
    v38 = self;
    double v20 = objc_retainBlock(v33);
    if ([v9 isEqualToString:UICollectionElementKindSectionFooter]
      && [v18 isEqual:v19])
    {
      id v32 = objc_alloc_init((Class)NSMutableParagraphStyle);
      [v32 setLineBreakMode:0];
      v42[0] = v32;
      v41[0] = NSParagraphStyleAttributeName;
      v41[1] = NSForegroundColorAttributeName;
      double v21 = +[UIColor secondaryLabelColor];
      v42[1] = v21;
      id v31 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

      NSAttributedStringKey v39 = NSForegroundColorAttributeName;
      id v22 = +[UIColor systemBlueColor];
      v40 = v22;
      v30 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

      id v23 = objc_alloc((Class)NSMutableAttributedString);
      v24 = [(RatingsHistoryDataSource *)self _footerText];
      id v25 = [v23 initWithString:v24 attributes:v31];

      id v26 = objc_alloc((Class)NSMutableAttributedString);
      v27 = [(RatingsHistoryDataSource *)self _footerLinkText];
      id v28 = [v26 initWithString:v27 attributes:v30];

      [v25 appendAttributedString:v28];
      v14 = ((void (*)(void *, id, uint64_t))v20[2])(v20, v25, 1);
    }
    else
    {
      v14 = ((void (*)(void *, void, void))v20[2])(v20, 0, 0);
    }
  }

  return v14;
}

- (void)privacyTextTapped
{
  id v2 = [(RatingsHistoryDataSource *)self privacyDelegate];
  [v2 didTapOnPrivacyText];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(RatingsHistoryDataSource *)self objectAtIndexPath:v6];
  id v8 = [(DataSource *)self delegate];
  [v8 dataSource:self itemTapped:v9];

  [v7 deselectItemAtIndexPath:v6 animated:1];
}

- (void)_fetchReviewedPlaces
{
  id v4 = sub_100011FD4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005A8C34;
  v8[3] = &unk_1012E9BD0;
  objc_copyWeak(&v9, (id *)buf);
  +[UGCReviewedPlaceManager fetchAllHistoryObjectsFromStorageWithCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_fetchMapItemsForReviewedPlaces:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_100011FD4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    __int16 v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    long long v43 = v11;
    __int16 v44 = 2112;
    v45 = v12;
    __int16 v46 = 1024;
    unsigned int v47 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@, # reviewed places = %d", buf, 0x1Cu);
  }
  [(RatingsHistoryDataSource *)self _cancelMapItemTicket];
  if ([v7 count])
  {
    id v29 = self;
    v30 = v8;
    v13 = +[NSMutableArray array];
    v14 = +[NSMutableDictionary dictionary];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v31 = v7;
    id obj = v7;
    id v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      double v18 = MKCoordinateInvalid[0];
      double v19 = MKCoordinateInvalid[1];
      do
      {
        double v20 = 0;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(obj);
          }
          double v21 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v20);
          id v22 = [objc_alloc((Class)MKMapItemIdentifier) initWithMUID:[v21 muid] resultProviderID:0 coordinate:v18 v19];
          [v13 addObject:v22];
          id v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v21 muid]);
          [v14 setObject:v21 forKeyedSubscript:v23];

          double v20 = (char *)v20 + 1;
        }
        while (v16 != v20);
        id v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v16);
    }

    v24 = +[MKMapService sharedService];
    uint64_t v25 = [v24 ticketForIdentifiers:v13 traits:0];
    mapItemTicket = v29->_mapItemTicket;
    v29->_mapItemTicket = (MKMapServiceTicket *)v25;

    v27 = v29->_mapItemTicket;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1005A9104;
    v33[3] = &unk_1012F09D8;
    id v34 = obj;
    id v35 = v14;
    id v8 = v30;
    id v36 = v30;
    id v28 = v14;
    [(MKMapServiceTicket *)v27 submitWithHandler:v33 networkActivity:0];

    id v7 = v31;
  }
  else
  {
    (*((void (**)(id, void *))v8 + 2))(v8, &__NSArray0__struct);
  }
}

- (void)_cancelMapItemTicket
{
  mapItemTicket = self->_mapItemTicket;
  if (mapItemTicket)
  {
    [(MKMapServiceTicket *)mapItemTicket cancel];
    id v4 = self->_mapItemTicket;
    self->_mapItemTicket = 0;
  }
}

- (SupplementaryElementsDataSourceDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);

  return (SupplementaryElementsDataSourceDelegate *)WeakRetained;
}

- (void)setPrivacyDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_storeStrong((id *)&self->_mapItemTicket, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_reviewedPlaces, 0);
}

@end