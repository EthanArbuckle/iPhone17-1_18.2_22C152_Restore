@interface RideBookingRideOptionSection
- (BOOL)applicationSectionIsExpanded;
- (BOOL)isLastRideOptionInSection;
- (NSArray)rideBookingRideOptions;
- (RideBookingOutlineController)parentDataSource;
- (RideBookingRideOption)rideBookingRideOption;
- (RideBookingRideOptionSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4;
- (RideBookingRideOptionSectionDelegate)delegate;
- (RideBookingRideOptionStatus)rideBookingRideOptionStatus;
- (double)estimatedItemHeight;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (int64_t)adjustedSectionOffset;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (unint64_t)rideBookingRideOptionIndex;
- (void)didSelectItemAtIndexPath:(id)a3;
- (void)ridesharingAppActionCollectionViewCellDidPerformAction:(id)a3;
- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4;
- (void)setAdjustedSectionOffset:(int64_t)a3;
- (void)setApplicationSectionIsExpanded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setParentDataSource:(id)a3;
- (void)setRideBookingRideOptionIndex:(unint64_t)a3;
- (void)setRideBookingRideOptionStatus:(id)a3;
- (void)setRideBookingRideOptions:(id)a3;
@end

@implementation RideBookingRideOptionSection

- (RideBookingRideOptionSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RideBookingRideOptionSection;
  return [(RoutePlanningOutlineSection *)&v5 initWithCollectionView:a3 sectionIdentifier:a4];
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 row])
  {
    collectionView = self->super._collectionView;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v4];

    [v8 setDelegate:self];
    if ([(RideBookingRideOptionSection *)self applicationSectionIsExpanded]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100C4B388;
    v19[3] = &unk_1012EA9E0;
    v10 = (id *)v20;
    id v11 = v8;
    v20[0] = v11;
    v20[1] = self;
    v20[2] = v9;
    v12 = v19;
  }
  else
  {
    if (+[UIFont accessibilityTextEnabled]) {
      CFStringRef v13 = @"RideBookingAX";
    }
    else {
      CFStringRef v13 = @"RideBooking";
    }
    v14 = [(UICollectionView *)self->super._collectionView dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v4];

    v15 = [(RideBookingRideOptionSection *)self parentDataSource];
    v16 = [v15 delegate];
    [v14 setDelegate:v16];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100C4B29C;
    v21[3] = &unk_1012E5D58;
    v10 = (id *)v22;
    id v11 = v14;
    v22[0] = v11;
    v22[1] = self;
    v12 = v21;
  }
  +[UIView performWithoutAnimation:v12];
  id v17 = v11;

  return v17;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v4 = [(RideBookingRideOptionSection *)self rideBookingRideOption];

  if (!v4) {
    return 0;
  }
  if (![(RideBookingRideOptionSection *)self applicationSectionIsExpanded]
    && self->_adjustedSectionOffset == 2)
  {
    return 2;
  }
  if ([(RideBookingRideOptionSection *)self isLastRideOptionInSection]) {
    return 2;
  }
  return 1;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (double)estimatedItemHeight
{
  v3 = [(RideBookingRideOptionSection *)self rideBookingRideOption];

  if (v3)
  {
    id v4 = -[RouteOverviewCell initWithFrame:]([RouteOverviewCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(UICollectionView *)self->super._collectionView bounds];
    double Width = CGRectGetWidth(v14);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C4B530;
    v10[3] = &unk_1012E5D58;
    id v11 = v4;
    v12 = self;
    v6 = v4;
    [(RouteOverviewCell *)v6 _maps_compressedSizeForWidth:v10 withBlock:Width];
    double v8 = v7;

    return v8;
  }
  else
  {
    +[RouteOverviewCell minimumRidesharingHeight];
  }
  return result;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RideBookingRideOptionSection;
  double v7 = [(RoutePlanningOutlineSection *)&v12 listLayoutSectionConfigurationAtIndex:a3 layoutEnvironment:v6];
  [v7 setSeparatorStyle:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C4B67C;
  v10[3] = &unk_10131C5A8;
  id v11 = v6;
  id v8 = v6;
  [v7 setSeparatorInsetProvider:v10];

  return v7;
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4 = [(RideBookingRideOptionSection *)self rideBookingRideOption];

  if (v4)
  {
    id v10 = [(RideBookingRideOptionSection *)self parentDataSource];
    objc_super v5 = [v10 delegate];
    id v6 = [(RideBookingRideOptionSection *)self rideBookingRideOption];
    [v5 didSelectRideOption:v6];
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/TableViewDataSources/RideBookingRideOptionSection.m");
      id v9 = [objc_alloc((Class)NSString) initWithFormat:@"No ride option found"];
      *(_DWORD *)buf = 136315394;
      objc_super v12 = v8;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", buf, 0x16u);
    }
  }
}

- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4
{
  id v9 = [(RideBookingRideOptionSection *)self parentDataSource];
  objc_super v5 = [v9 delegate];
  id v6 = [(RideBookingRideOptionSection *)self rideBookingRideOptionStatus];
  double v7 = [v6 application];
  id v8 = [v7 identifier];
  [v5 didSelectFeedbackWithAppIdentifier:v8];
}

- (void)ridesharingAppActionCollectionViewCellDidPerformAction:(id)a3
{
  id v4 = a3;
  id v17 = [v4 status];
  id v5 = [v4 titleType];

  if ((unint64_t)v5 >= 2)
  {
    if (v5 != (id)2) {
      goto LABEL_6;
    }
    id v9 = [(RideBookingRideOptionSection *)self delegate];
    id v10 = [v17 application];
    id v11 = [v10 identifier];
    [v9 didExpandSection:v11];

    objc_super v12 = +[MKMapService sharedService];
    __int16 v13 = [v17 application];
    id v14 = [v13 name];
    [v12 captureUserAction:14008 onTarget:1401 eventValue:v14];

    id v8 = [(RideBookingRideOptionSection *)self parentDataSource];
    v15 = [v8 delegate];
    v16 = [(RideBookingRideOptionSection *)self parentDataSource];
    [v15 dataSourceRequiresReload:v16];
  }
  else
  {
    id v6 = [v17 application];
    double v7 = [v17 userActivity];
    +[RideBookingDataCoordinator openRideBookingApplication:v6 withUserActivity:v7];

    id v8 = +[MKMapService sharedService];
    [v8 captureUserAction:6020 onTarget:304 eventValue:0];
  }

LABEL_6:
}

- (BOOL)isLastRideOptionInSection
{
  adjustedSectionOffset = (char *)self->_adjustedSectionOffset;
  v3 = [(RideBookingRideOptionStatus *)self->_rideBookingRideOptionStatus rideOptions];
  LOBYTE(adjustedSectionOffset) = adjustedSectionOffset == (char *)[v3 count] - 1;

  return (char)adjustedSectionOffset;
}

- (RideBookingRideOption)rideBookingRideOption
{
  unint64_t v3 = [(RideBookingRideOptionSection *)self rideBookingRideOptionIndex];
  id v4 = [(RideBookingRideOptionSection *)self rideBookingRideOptions];
  id v5 = [v4 count];

  if (v3 >= (unint64_t)v5)
  {
    double v7 = 0;
  }
  else
  {
    id v6 = [(RideBookingRideOptionSection *)self rideBookingRideOptions];
    double v7 = [v6 objectAtIndex:[self rideBookingRideOptionIndex]];
  }

  return (RideBookingRideOption *)v7;
}

- (RideBookingOutlineController)parentDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDataSource);

  return (RideBookingOutlineController *)WeakRetained;
}

- (void)setParentDataSource:(id)a3
{
}

- (RideBookingRideOptionSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RideBookingRideOptionSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)rideBookingRideOptionIndex
{
  return self->_rideBookingRideOptionIndex;
}

- (void)setRideBookingRideOptionIndex:(unint64_t)a3
{
  self->_rideBookingRideOptionIndex = a3;
}

- (NSArray)rideBookingRideOptions
{
  return self->_rideBookingRideOptions;
}

- (void)setRideBookingRideOptions:(id)a3
{
}

- (RideBookingRideOptionStatus)rideBookingRideOptionStatus
{
  return self->_rideBookingRideOptionStatus;
}

- (void)setRideBookingRideOptionStatus:(id)a3
{
}

- (int64_t)adjustedSectionOffset
{
  return self->_adjustedSectionOffset;
}

- (void)setAdjustedSectionOffset:(int64_t)a3
{
  self->_adjustedSectionOffset = a3;
}

- (BOOL)applicationSectionIsExpanded
{
  return self->_applicationSectionIsExpanded;
}

- (void)setApplicationSectionIsExpanded:(BOOL)a3
{
  self->_applicationSectionIsExpanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideBookingRideOptionStatus, 0);
  objc_storeStrong((id *)&self->_rideBookingRideOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_parentDataSource);
}

@end