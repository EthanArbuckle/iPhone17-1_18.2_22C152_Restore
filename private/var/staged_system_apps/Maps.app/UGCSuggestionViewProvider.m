@interface UGCSuggestionViewProvider
- (BOOL)_canAddPhotos;
- (BOOL)_canRate;
- (BOOL)_hasNearbyPhotos;
- (BOOL)_hasSubmission;
- (BOOL)_hasVisited;
- (BOOL)_isCheckingForVisitAndPhotos;
- (BOOL)_isFavorite;
- (BOOL)_isLoadingSubmission;
- (BOOL)_isNearbyLocation;
- (BOOL)_isPinned;
- (MKMapItem)mapItem;
- (MUARPSuggestionViewModel)suggestionViewModelForWebPlacecard;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (UGCSuggestionViewProvider)initWithMapItem:(id)a3;
- (UGCSuggestionViewProviderDelegate)delegate;
- (UIView)suggestionView;
- (int64_t)_bestContentType;
- (void)_checkForVisitAndPhotosIfNeeded;
- (void)_didTapSuggestionViewWithOverallState:(int64_t)a3;
- (void)_loadSuggestionViewIfNeeded;
- (void)_reevaluateSuggestion;
- (void)_setVisitStartDate:(id)a3 visitEndDate:(id)a4 hasNearbyPhotos:(BOOL)a5;
- (void)_unloadSuggestionView;
- (void)didTapSuggestionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSubmissionStatus:(id)a3;
- (void)suggestionViewDidTapDislike:(id)a3;
- (void)suggestionViewDidTapLike:(id)a3;
@end

@implementation UGCSuggestionViewProvider

- (UGCSuggestionViewProvider)initWithMapItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCSuggestionViewProvider;
  v6 = [(UGCSuggestionViewProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    uint64_t v8 = +[MUPlaceCallToActionAppearance userRecommendedLoadingAppearance];
    submissionStatus = v7->_submissionStatus;
    v7->_submissionStatus = (MUPlaceCallToActionAppearance *)v8;
  }
  return v7;
}

- (void)setSubmissionStatus:(id)a3
{
  id v5 = (MUPlaceCallToActionAppearance *)a3;
  v6 = v5;
  if (self->_submissionStatus != v5)
  {
    uint64_t v8 = v5;
    unsigned __int8 v7 = -[MUPlaceCallToActionAppearance isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      [(UGCSuggestionViewProvider *)self _reevaluateSuggestion];
      v6 = v8;
    }
  }
}

- (void)_unloadSuggestionView
{
  suggestionView = self->_suggestionView;
  self->_suggestionView = 0;
}

- (void)_loadSuggestionViewIfNeeded
{
  if (!self->_suggestionView && self->_contentType)
  {
    v6 = objc_alloc_init(UGCSuggestionViewModel);
    [(UGCSuggestionViewModel *)v6 setContentType:self->_contentType];
    visitEndDate = self->_visitEndDate;
    if (!visitEndDate) {
      visitEndDate = self->_visitStartDate;
    }
    [(UGCSuggestionViewModel *)v6 setVisitDate:visitEndDate];
    v4 = -[UGCSuggestionView initWithFrame:]([UGCSuggestionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    suggestionView = self->_suggestionView;
    self->_suggestionView = v4;

    [(UGCSuggestionView *)self->_suggestionView setViewModel:v6];
    [(UGCSuggestionView *)self->_suggestionView setDelegate:self];
  }
}

- (UIView)suggestionView
{
  [(UGCSuggestionViewProvider *)self _loadSuggestionViewIfNeeded];
  suggestionView = self->_suggestionView;

  return (UIView *)suggestionView;
}

- (MUARPSuggestionViewModel)suggestionViewModelForWebPlacecard
{
  [(UGCSuggestionViewProvider *)self _loadSuggestionViewIfNeeded];
  v3 = [(UGCSuggestionView *)self->_suggestionView viewModel];
  id v4 = [v3 contentType];

  id v5 = &stru_101324E70;
  id v6 = 0;
  unsigned __int8 v7 = &stru_101324E70;
  switch((unint64_t)v4)
  {
    case 0uLL:
      goto LABEL_12;
    case 1uLL:
      uint64_t v8 = +[NSBundle mainBundle];
      unsigned __int8 v7 = [v8 localizedStringForKey:@"[UGC Web Placecard] Add Your Photos to Maps" value:@"localized string not found" table:0];

      v9 = +[NSBundle mainBundle];
      id v10 = v9;
      CFStringRef v11 = @"[UGC Web Placecard] You took photos here";
      goto LABEL_9;
    case 2uLL:
      v12 = +[NSBundle mainBundle];
      unsigned __int8 v7 = [v12 localizedStringForKey:@"[UGC Web Placecard] Rate This Place" value:@"localized string not found" table:0];

      v9 = +[NSBundle mainBundle];
      id v10 = v9;
      CFStringRef v11 = @"[UGC Web Placecard] In your Favorites";
      goto LABEL_9;
    case 3uLL:
      v13 = +[NSBundle mainBundle];
      unsigned __int8 v7 = [v13 localizedStringForKey:@"[UGC Web Placecard] Rate This Place" value:@"localized string not found" table:0];

      v9 = +[NSBundle mainBundle];
      id v10 = v9;
      CFStringRef v11 = @"[UGC Web Placecard] It’s pinned.";
      goto LABEL_9;
    case 4uLL:
      v14 = [(UGCSuggestionView *)self->_suggestionView viewModel];
      id v6 = [v14 visitDate];

      if (v6)
      {
        id v10 = objc_alloc_init((Class)NSRelativeDateTimeFormatter);
        [v10 setDateTimeStyle:1];
        [v10 setUnitsStyle:0];
        [v10 setFormattingContext:1];
        v15 = [(UGCSuggestionView *)self->_suggestionView viewModel];
        v16 = [v15 visitDate];
        v17 = +[NSDate date];
        v18 = [v10 localizedStringForDate:v16 relativeToDate:v17];

        v19 = +[NSBundle mainBundle];
        unsigned __int8 v7 = [v19 localizedStringForKey:@"[UGC Web Placecard] Rate This Place" value:@"localized string not found" table:0];

        v20 = +[NSBundle mainBundle];
        v21 = [v20 localizedStringForKey:@"[UGC Web Placecard] Visited" value:@"localized string not found" table:0];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v18);
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_11:
        id v23 = objc_alloc((Class)MUARPSuggestionViewModel);
        v24 = [(UGCSuggestionView *)self->_suggestionView viewModel];
        BOOL v25 = (char *)[v24 contentType] - 2 < (char *)4;
        v26 = [(UGCSuggestionView *)self->_suggestionView viewModel];
        id v6 = [v23 initWithTitle:v7 subtitle:v5 isRatingSuggestion:v25 isPhotoSuggestion:[v26 contentType] == (id)1];
      }
      else
      {
        unsigned __int8 v7 = &stru_101324E70;
      }
LABEL_12:

      return (MUARPSuggestionViewModel *)v6;
    case 5uLL:
      v22 = +[NSBundle mainBundle];
      unsigned __int8 v7 = [v22 localizedStringForKey:@"[UGC Web Placecard] Rate This Place" value:@"localized string not found" table:0];

      v9 = +[NSBundle mainBundle];
      id v10 = v9;
      CFStringRef v11 = @"[UGC Web Placecard] You’re nearby";
LABEL_9:
      id v5 = [v9 localizedStringForKey:v11 value:@"localized string not found" table:0];
      goto LABEL_10;
    default:
      unsigned __int8 v7 = &stru_101324E70;
      goto LABEL_11;
  }
}

- (void)_reevaluateSuggestion
{
  if (![(UGCSuggestionViewProvider *)self _canAddPhotos]
    && ![(UGCSuggestionViewProvider *)self _canRate])
  {
    id v6 = sub_100577714();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      mapItem = self->_mapItem;
      int v8 = 138412290;
      v9[0] = mapItem;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Skipping generation of placecard suggestion for map item: %@", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_9;
  }
  [(UGCSuggestionViewProvider *)self _checkForVisitAndPhotosIfNeeded];
  int64_t v3 = [(UGCSuggestionViewProvider *)self _bestContentType];
  id v4 = sub_100577714();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = self->_mapItem;
    int v8 = 67109378;
    LODWORD(v9[0]) = v3;
    WORD2(v9[0]) = 2112;
    *(void *)((char *)v9 + 6) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Determined best placecard suggestion as %d for map item: %@", (uint8_t *)&v8, 0x12u);
  }

  if (v3 != self->_contentType)
  {
    [(UGCSuggestionViewProvider *)self _unloadSuggestionView];
    self->_contentType = v3;
    [(UGCSuggestionViewProvider *)self _loadSuggestionViewIfNeeded];
    id v6 = [(UGCSuggestionViewProvider *)self delegate];
    [v6 suggestionViewProviderDidUpdateView:self];
LABEL_9:
  }
}

- (int64_t)_bestContentType
{
  if ([(UGCSuggestionViewProvider *)self _isLoadingSubmission]
    || [(UGCSuggestionViewProvider *)self _hasSubmission]
    || [(UGCSuggestionViewProvider *)self _isCheckingForVisitAndPhotos])
  {
    return 0;
  }
  if ([(UGCSuggestionViewProvider *)self _canAddPhotos]
    && [(UGCSuggestionViewProvider *)self _hasNearbyPhotos])
  {
    return 1;
  }
  if (![(UGCSuggestionViewProvider *)self _canRate]) {
    return 0;
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    if ([(UGCSuggestionViewProvider *)self _isPinned]) {
      return 3;
    }
  }
  else if ([(UGCSuggestionViewProvider *)self _isFavorite])
  {
    return 2;
  }
  if ([(UGCSuggestionViewProvider *)self _hasVisited]) {
    return 4;
  }
  if (![(UGCSuggestionViewProvider *)self _isNearbyLocation]) {
    return 0;
  }
  else {
    return 5;
  }
}

- (void)_checkForVisitAndPhotosIfNeeded
{
  if (!self->_isCheckingForVisitAndPhotos && !self->_didCheckForVisitAndPhotos)
  {
    int64_t v3 = sub_100577714();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      mapItem = self->_mapItem;
      *(_DWORD *)buf = 138412290;
      v21 = mapItem;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Checking for visit and photos at map item: %@", buf, 0xCu);
    }

    self->_isCheckingForVisitAndPhotos = 1;
    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100567E80;
    v18[3] = &unk_1012EF250;
    objc_copyWeak(&v19, (id *)buf);
    id v5 = objc_retainBlock(v18);
    id v6 = self->_mapItem;
    unsigned __int8 v7 = [(UGCSuggestionViewProvider *)self _canAddPhotos];
    uint64_t UInteger = GEOConfigGetUInteger();
    v9 = sub_100018584();
    id v10 = [v9 oneUser];
    CFStringRef v11 = [(MKMapItem *)v6 _geoMapItem];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100567FC0;
    v14[3] = &unk_1012EF2A0;
    v12 = v5;
    id v16 = v12;
    unsigned __int8 v17 = v7;
    v13 = v6;
    v15 = v13;
    [v10 mostRecentVisitWithinDistance:v11 ofMapItem:v14 handler:(double)(unint64_t)UInteger];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_setVisitStartDate:(id)a3 visitEndDate:(id)a4 hasNearbyPhotos:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  if (self->_isCheckingForVisitAndPhotos && !self->_didCheckForVisitAndPhotos)
  {
    CFStringRef v11 = sub_100577714();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v9 | v10) {
        v12 = @"YES";
      }
      else {
        v12 = @"NO";
      }
      v13 = v12;
      if (v5) {
        v14 = @"YES";
      }
      else {
        v14 = @"NO";
      }
      v15 = v14;
      mapItem = self->_mapItem;
      int v17 = 138412802;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = mapItem;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Completed placecard suggestion analysis: has visit (%@), has nearby photos (%@), map item: %@", (uint8_t *)&v17, 0x20u);
    }
    *(_WORD *)&self->_isCheckingForVisitAndPhotos = 256;
    objc_storeStrong((id *)&self->_visitStartDate, a3);
    objc_storeStrong((id *)&self->_visitEndDate, a4);
    self->_hasNearbyPhotos = v5;
    [(UGCSuggestionViewProvider *)self _reevaluateSuggestion];
  }
}

- (BOOL)_isLoadingSubmission
{
  return [(MUPlaceCallToActionAppearance *)self->_submissionStatus type] == (id)5;
}

- (BOOL)_hasSubmission
{
  return [(MUPlaceCallToActionAppearance *)self->_submissionStatus type] == (id)4;
}

- (BOOL)_canAddPhotos
{
  return +[MKPOIEnrichmentAvailibility shouldShowPhotosCallToActionForMapItem:self->_mapItem];
}

- (BOOL)_canRate
{
  return +[MKPOIEnrichmentAvailibility shouldShowRatingsCallToActionForMapItem:self->_mapItem];
}

- (BOOL)_isCheckingForVisitAndPhotos
{
  return self->_isCheckingForVisitAndPhotos;
}

- (BOOL)_hasNearbyPhotos
{
  return self->_hasNearbyPhotos;
}

- (BOOL)_isPinned
{
  v2 = self;
  int64_t v3 = [(UGCSuggestionViewProvider *)self delegate];
  LOBYTE(v2) = [v3 suggestionViewProviderIsPlacePinned:v2];

  return (char)v2;
}

- (BOOL)_isFavorite
{
  int64_t v3 = +[ShortcutManager sharedManager];
  id v4 = [v3 meCard];

  BOOL v5 = [v4 _maps_shortcutIncludingHiddenForMapItem:self->_mapItem];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)_hasVisited
{
  return self->_visitStartDate || self->_visitEndDate != 0;
}

- (BOOL)_isNearbyLocation
{
  int64_t v3 = +[MKLocationManager sharedLocationManager];
  if ([v3 isAuthorizedForPreciseLocation])
  {
    id v4 = [v3 lastLocation];
    if (v4)
    {
      [(MKMapItem *)self->_mapItem _coordinate];
      BOOL v7 = 0;
      if (v6 >= -180.0 && v6 <= 180.0 && v5 >= -90.0 && v5 <= 90.0)
      {
        id v8 = objc_alloc((Class)CLLocation);
        [(MKMapItem *)self->_mapItem _coordinate];
        double v10 = v9;
        [(MKMapItem *)self->_mapItem _coordinate];
        id v11 = [v8 initWithLatitude:v10];
        GEOConfigGetDouble();
        double v13 = v12;
        [v4 distanceFromLocation:v11];
        BOOL v7 = v14 < v13;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_didTapSuggestionViewWithOverallState:(int64_t)a3
{
  int64_t contentType = self->_contentType;
  if ((unint64_t)(contentType - 2) >= 4)
  {
    if (contentType != 1) {
      return;
    }
    id v6 = [(UGCSuggestionViewProvider *)self delegate];
    [v6 suggestionViewProviderDidSelectAddPhotos:self];
  }
  else
  {
    id v6 = [(UGCSuggestionViewProvider *)self delegate];
    [v6 suggestionViewProviderDidSelectRateThisPlace:self overallState:a3];
  }
}

- (void)didTapSuggestionView:(id)a3
{
}

- (void)suggestionViewDidTapLike:(id)a3
{
}

- (void)suggestionViewDidTapDislike:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (UGCSuggestionViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCSuggestionViewProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_visitEndDate, 0);

  objc_storeStrong((id *)&self->_visitStartDate, 0);
}

@end