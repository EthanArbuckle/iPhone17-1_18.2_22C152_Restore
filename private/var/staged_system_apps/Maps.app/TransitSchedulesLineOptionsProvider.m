@interface TransitSchedulesLineOptionsProvider
+ (Class)cellClass;
- (BOOL)allowsCellSelection;
- (NSArray)identifiers;
- (TransitSchedulesLineOptionsProviderDelegate)delegate;
- (void)configureCell:(id)a3 forIndexPath:(id)a4 withIdentifier:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation TransitSchedulesLineOptionsProvider

- (NSArray)identifiers
{
  v2 = +[NSMutableArray array];
  [v2 addObject:@"LineOptionsSectionCellPinIdentifier"];
  v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v4 = [v3 isUsingOfflineMaps];

  if ((v4 & 1) == 0) {
    [v2 addObject:@"LineOptionsSectionCellViewOnMapIdentifier"];
  }
  [v2 addObject:@"LineOptionsSectionCellDirectionsIdentifier"];
  [v2 addObject:@"LineOptionsSectionCellLineInfoIdentifier"];
  id v5 = [v2 copy];

  return (NSArray *)v5;
}

+ (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (!v13) {
      goto LABEL_16;
    }
    objc_initWeak(&location, self);
    if ([v13 isEqualToString:@"LineOptionsSectionCellPinIdentifier"])
    {
      v14 = [(TransitSchedulesLineOptionsProvider *)self delegate];
      unsigned int v15 = [v14 isPinnedTransitLine];

      v16 = +[NSBundle mainBundle];
      if (v15)
      {
        v17 = [v16 localizedStringForKey:@"[Transit Schedules] Unpin Line" value:@"localized string not found" table:0];
        v18 = (id *)&v37;

        v19 = v36;
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        CFStringRef v20 = @"UnpinLine";
        CFStringRef v21 = @"pin.slash.fill";
        v22 = sub_10068E144;
      }
      else
      {
        v17 = [v16 localizedStringForKey:@"[Transit Schedules] Pin line" value:@"localized string not found" table:0];
        v18 = (id *)&v35;

        v19 = v34;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        CFStringRef v20 = @"PinLine";
        CFStringRef v21 = @"pin.fill";
        v22 = sub_10068E1A0;
      }
    }
    else if ([v13 isEqualToString:@"LineOptionsSectionCellViewOnMapIdentifier"])
    {
      v23 = +[NSBundle mainBundle];
      v17 = [v23 localizedStringForKey:@"[Transit Schedules] View on Map" value:@"localized string not found" table:0];
      v18 = (id *)&v33;

      v19 = v32;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      CFStringRef v20 = @"ViewLineOnMap";
      CFStringRef v21 = @"map.fill";
      v22 = sub_10068E1FC;
    }
    else if ([v13 isEqualToString:@"LineOptionsSectionCellDirectionsIdentifier"])
    {
      v24 = +[NSBundle mainBundle];
      v17 = [v24 localizedStringForKey:@"[Transit Schedules] Get Directions" value:@"localized string not found" table:0];
      v18 = (id *)&v31;

      v19 = v30;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      CFStringRef v20 = @"GetDirectionsToStation";
      CFStringRef v21 = @"arrow.triangle.turn.up.right.circle.fill";
      v22 = sub_10068E258;
    }
    else
    {
      if (![v13 isEqualToString:@"LineOptionsSectionCellLineInfoIdentifier"])
      {
        CFStringRef v21 = 0;
        v17 = 0;
        CFStringRef v20 = 0;
        v25 = 0;
        goto LABEL_15;
      }
      v27 = +[NSBundle mainBundle];
      v17 = [v27 localizedStringForKey:@"[Transit Schedules] Line Info" value:@"localized string not found" table:0];
      v18 = (id *)&v29;

      v19 = v28;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      CFStringRef v20 = @"LineInfo";
      CFStringRef v21 = @"info.circle.fill";
      v22 = sub_10068E2B4;
    }
    v19[2] = v22;
    v19[3] = &unk_1012F4058;
    objc_copyWeak(v18, &location);
    v25 = objc_retainBlock(v19);
    objc_destroyWeak(v18);
LABEL_15:
    id v26 = v8;
    [v26 setTitle:v17 symbolName:v21 action:v25 axIdentifierForAction:v20];

    objc_destroyWeak(&location);
LABEL_16:
  }
}

- (BOOL)allowsCellSelection
{
  return 0;
}

- (TransitSchedulesLineOptionsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitSchedulesLineOptionsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end