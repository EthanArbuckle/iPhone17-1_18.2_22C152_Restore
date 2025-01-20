@interface RAPRouteHistoryItemTableViewCell
- (id)_destinationTextForEndSearchResult:(id)a3;
- (id)_formattedTimeStringSinceDirectionsWereTaken:(id)a3;
- (void)setHistoryItem:(id)a3;
@end

@implementation RAPRouteHistoryItemTableViewCell

- (void)setHistoryItem:(id)a3
{
  id v4 = a3;
  v5 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8
    && ([v8 historyEntry],
        v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 conformsToProtocol:v5],
        v9,
        v10))
  {
    id v11 = v6;
  }
  else
  {
    id v11 = 0;
  }

  if (v11)
  {
    id v24 = 0;
    id v25 = 0;
    v12 = [v11 historyEntry];
    +[SearchResult newStartWaypointSearchResult:&v25 endWaypointSearchResult:&v24 forRouteHistoryEntry:v12];
    id v13 = v25;
    id v14 = v24;

    v15 = objc_alloc_init(RAPTwoLinesViewModelImpl);
    v16 = [(RAPRouteHistoryItemTableViewCell *)self _destinationTextForEndSearchResult:v14];

    [(RAPTwoLinesViewModelImpl *)v15 setTitle:v16];
    v17 = [(RAPRouteHistoryItemTableViewCell *)self _formattedTimeStringSinceDirectionsWereTaken:v6];
    [(RAPTwoLinesViewModelImpl *)v15 setSubtitle:v17];

    v18 = [v11 historyEntry];
    v19 = (char *)[v18 transportType];

    if ((unint64_t)(v19 - 2) > 3) {
      CFStringRef v20 = @"rp_drive";
    }
    else {
      CFStringRef v20 = *(&off_1012F4A68 + (void)(v19 - 2));
    }
    v21 = +[UIImage imageNamed:v20];
    [(RAPTwoLinesViewModelImpl *)v15 setImage:v21];

    v22 = +[UIColor labelColor];
    v23 = [(RAPTwoLinesMenuTableViewCell *)self leftImageView];
    [v23 setTintColor:v22];

    [(RAPTwoLinesMenuTableViewCell *)self setViewModel:v15];
  }
}

- (id)_destinationTextForEndSearchResult:(id)a3
{
  return [a3 name];
}

- (id)_formattedTimeStringSinceDirectionsWereTaken:(id)a3
{
  id v3 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [v3 timestamp];
  double v6 = v5;

  double v7 = Current - v6;
  if (Current - v6 < 60.0)
  {
    id v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"Just now [DirectionsHistoryItemCell]" value:@"localized string not found" table:0];
LABEL_3:
    unsigned int v10 = (void *)v9;
    goto LABEL_9;
  }
  if (v7 < 86400.0)
  {
    id v8 = +[NSDateComponentsFormatter _maps_stringLongFromTimeInterval:](NSDateComponentsFormatter, "_maps_stringLongFromTimeInterval:");
    id v11 = +[NSBundle mainBundle];
    v12 = v11;
    CFStringRef v13 = @"%@ ago [DirectionsHistoryItemCell]";
LABEL_8:
    v15 = [v11 localizedStringForKey:v13 value:@"localized string not found" table:0];
    unsigned int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v8);

    goto LABEL_9;
  }
  if (v7 < 172800.0)
  {
    id v14 = +[NSDate dateWithTimeIntervalSinceNow:-v7];
    id v8 = +[NSDateFormatter _maps_timeForDate:v14];

    id v11 = +[NSBundle mainBundle];
    v12 = v11;
    CFStringRef v13 = @"Yesterday %@ [DirectionsHistoryItemCell]";
    goto LABEL_8;
  }
  if (v7 >= 604800.0)
  {
    id v8 = +[NSDate dateWithTimeIntervalSinceNow:-v7];
    uint64_t v9 = +[NSDateFormatter _maps_dateStringWithoutYearForDate:v8];
    goto LABEL_3;
  }
  double v17 = -v7;
  v18 = +[NSDate dateWithTimeIntervalSinceNow:-v7];
  id v8 = +[NSDateFormatter _maps_weekdayForDate:v18];

  v19 = +[NSDate dateWithTimeIntervalSinceNow:v17];
  CFStringRef v20 = +[NSDateFormatter _maps_timeForDate:v19];

  unsigned int v10 = +[NSString stringWithFormat:@"%@ %@", v8, v20];

LABEL_9:

  return v10;
}

@end