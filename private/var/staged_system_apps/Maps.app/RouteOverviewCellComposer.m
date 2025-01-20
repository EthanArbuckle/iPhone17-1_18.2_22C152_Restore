@interface RouteOverviewCellComposer
+ (void)configureCell:(id)a3 forRideBookingRideOption:(id)a4;
+ (void)configureCell:(id)a3 forRoute:(id)a4 isMac:(BOOL)a5 automaticSharingContacts:(id)a6 dataCoordinator:(id)a7;
@end

@implementation RouteOverviewCellComposer

+ (void)configureCell:(id)a3 forRoute:(id)a4 isMac:(BOOL)a5 automaticSharingContacts:(id)a6 dataCoordinator:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = +[RouteOverviewCell primaryLabelFontProvider];
  v15 = v14[2]();
  v16 = +[RouteOverviewStringProvider primaryTextForRoute:v11 font:v15];
  v17 = [v10 primaryLabel];
  [v17 setAttributedText:v16];

  v18 = [v10 primaryLabel];
  v19 = [v18 attributedText];
  v20 = [v19 string];
  v21 = [v10 primaryLabel];
  [v21 setAccessibilityIdentifier:v20];

  v22 = +[RouteOverviewCell secondaryLabelFontProvider];
  v23 = v22[2]();
  v24 = +[RouteOverviewStringProvider secondaryMultiPartTextForRoute:v11 font:v23];

  v25 = [v10 secondaryLabel];
  [v25 setMultiPartString:v24];

  v26 = [v24 attributedString];
  v27 = [v26 string];
  v28 = [v10 secondaryLabel];
  [v28 setAccessibilityLabel:v27];

  v91 = v24;
  v29 = [v24 attributedString];
  v30 = [v29 string];
  v31 = [v10 secondaryLabel];
  [v31 setAccessibilityIdentifier:v30];

  v32 = [v11 planningDescriptionString];
  if (!v32 || [v11 transportType] == 1)
  {

LABEL_4:
    [v10 setRouteDescritptionLabelVisible:0];
    goto LABEL_5;
  }
  unsigned __int8 v51 = [v11 isWalkingOnlyTransitRoute];

  if (v51) {
    goto LABEL_4;
  }
  [v10 setRouteDescritptionLabelVisible:1];
  v52 = +[RouteOverviewCell secondaryLabelFontProvider];
  v53 = v52[2]();
  v54 = +[RouteOverviewStringProvider routeDescriptionTextForRoute:v11 font:v53];

  v55 = [v10 routeDescriptionLabel];
  [v55 setMultiPartString:v54];

LABEL_5:
  [v10 setTertiaryLabelVisible:0];
  v33 = +[RouteOverviewStringProvider artworkDataForRoute:v11];
  id v34 = [v33 count];
  if (v34)
  {
    v35 = [v10 artworkList];
    [v35 setArtworkData:v33];
  }
  [v10 setArtworkListVisible:v34 != 0];
  v36 = [v11 elevationProfile];
  v37 = [v10 elevationGraphView];
  [v11 distance];
  [v37 setElevationProfile:v36];

  [v10 setElevationGraphViewVisible:v36 != 0];
  v38 = [v11 advisories];
  v39 = +[RouteAdvisoryViewModel viewModelsForAdvisories:v38];

  v90 = v33;
  if ([v12 count] && MSPSharedTripSharingAvailable())
  {
    v87 = v36;
    id v89 = [v39 mutableCopy];
    v40 = +[GEOFeatureStyleAttributes shareETAAdvisoryStyleAttributes];
    v41 = [v10 traitCollection];
    [v41 displayScale];
    v88 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v40, 0, 0);

    id v85 = v13;
    id v86 = v12;
    if ([v12 count] == (id)1)
    {
      v42 = [v12 firstObject];
      uint64_t v43 = [v42 contact];

      v44 = (void *)v43;
      v45 = +[CNContactFormatter stringFromContact:v43 style:1000];
      if (!v45)
      {
        id v82 = objc_alloc((Class)NSAttributedString);
        v83 = +[NSBundle mainBundle];
        v84 = [v83 localizedStringForKey:@"[Share ETA] Automatic Sharing Unknown Indication" value:@"localized string not found" table:0];
        id v50 = [v82 initWithString:v84];

        v47 = [v50 string];
        id v63 = [v47 length];
        id v61 = 0;
        goto LABEL_16;
      }
      v46 = +[NSBundle mainBundle];
      v47 = [v46 localizedStringForKey:@"[Share ETA] Automatic Sharing Singular Indication" value:@"localized string not found" table:0];

      id v48 = objc_alloc((Class)NSAttributedString);
      v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v45);
      id v50 = [v48 initWithString:v49];
    }
    else
    {
      v56 = +[NSBundle mainBundle];
      v44 = [v56 localizedStringForKey:@"[Share ETA] Automatic Sharing Plural Indication, Button Portion", @"localized string not found", 0 value table];

      v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v44, [v12 count]);
      v57 = +[NSBundle mainBundle];
      v47 = [v57 localizedStringForKey:@"[Share ETA] Automatic Sharing Plural Indication, Advisory", @"localized string not found", 0 value table];

      id v58 = objc_alloc((Class)NSAttributedString);
      v59 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v45);
      id v50 = [v58 initWithString:v59];
    }
    v60 = [v50 string];
    id v61 = [v60 rangeOfString:v45];
    id v63 = v62;

LABEL_16:
    objc_initWeak(&location, v10);
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_1006663A4;
    v92[3] = &unk_1012E6708;
    objc_copyWeak(&v93, &location);
    v64 = +[RouteAdvisoryViewModel viewModelWithText:buttonRange:image:handler:](RouteAdvisoryViewModel, "viewModelWithText:buttonRange:image:handler:", v50, v61, v63, v88, v92);
    [v89 addObject:v64];

    v36 = v87;
    id v65 = [v89 copy];

    objc_destroyWeak(&v93);
    objc_destroyWeak(&location);

    v39 = v65;
    id v13 = v85;
    id v12 = v86;
  }
  v66 = [v10 advisoriesView];
  v67 = [v10 _maps_mapsSceneDelegate];
  v68 = [v67 appCoordinator];
  v69 = [v68 baseActionCoordinator];
  [v66 setAdvisories:v39 coordinator:v69];

  v70 = [v10 advisoriesView];
  [v10 setAdvisoriesViewVisible:[v70 isVisible]];

  [v10 setPrimaryLabelCompanionImage:0];
  v71 = [v11 origin];
  if ([v71 isCurrentLocation])
  {
    v72 = +[GEOCountryConfiguration sharedConfiguration];
    if ([v72 currentCountrySupportsNavigation])
    {
      v73 = [v13 timing];
      if ([v73 isDepartNow]) {
        uint64_t v74 = 1;
      }
      else {
        uint64_t v74 = 3;
      }
      [v10 setButtonVisibility:v74];
    }
    else
    {
      [v10 setButtonVisibility:3];
    }
    v75 = v90;
  }
  else
  {
    [v10 setButtonVisibility:3];
    v75 = v90;
  }

  +[RouteOverviewCell minimumHeight];
  double v77 = v76;
  v78 = [v10 minimumHeightConstraint];
  [v78 constant];
  double v80 = v79;

  if (v80 != v77)
  {
    v81 = [v10 minimumHeightConstraint];
    [v81 setConstant:v77];
  }
  [v10 setGoButtonProgressVisible:0];
  [v10 setGoButtonProgress:0.0];
  [v10 layoutIfNeeded];
}

+ (void)configureCell:(id)a3 forRideBookingRideOption:(id)a4
{
  id v47 = a3;
  id v5 = a4;
  v6 = [v5 name];
  v7 = [v47 primaryLabel];
  [v7 setText:v6];

  v8 = [v5 name];
  v9 = [v47 primaryLabel];
  [v9 setAccessibilityLabel:v8];

  id v10 = [v5 name];
  id v11 = [v47 primaryLabel];
  [v11 setAccessibilityIdentifier:v10];

  id v12 = [v5 detailedDescription];
  id v13 = [v47 secondaryLabel];
  [v13 setText:v12];

  v14 = [v5 detailedDescription];
  v15 = [v47 secondaryLabel];
  [v15 setAccessibilityLabel:v14];

  v16 = [v5 detailedDescription];
  v17 = [v47 secondaryLabel];
  [v17 setAccessibilityIdentifier:v16];

  v18 = +[RouteOverviewCell tertiaryLabelBoldFont];
  v19 = +[UIColor labelColor];
  v20 = [v47 tertiaryLabel];
  [v20 setTextColor:v19];

  v21 = [v47 tertiaryLabel];
  [v21 setFont:v18];

  id v22 = objc_alloc((Class)NSAttributedString);
  v23 = [v5 priceRange];
  id v24 = [v22 initWithString:v23];

  v25 = [v5 specialPricingBadge];
  v26 = [v24 _maps_attributedStringByAppendingRidesharingSpecialPricingBadge:v25 representativeContentFont:v18];
  v27 = [v47 tertiaryLabel];
  [v27 setAttributedText:v26];

  v28 = [v47 tertiaryLabel];
  v29 = [v28 attributedText];
  v30 = [v29 string];
  v31 = [v47 tertiaryLabel];
  [v31 setAccessibilityLabel:v30];

  v32 = [v47 tertiaryLabel];
  v33 = [v32 attributedText];
  id v34 = [v33 string];
  v35 = [v47 tertiaryLabel];
  [v35 setAccessibilityIdentifier:v34];

  v36 = [v5 iconImage];
  [v47 setPrimaryLabelCompanionImage:v36];

  [v47 setButtonVisibility:2];
  v37 = [v5 selectionCommandTitle];

  [v47 setBookButtonTitle:v37];
  v38 = [v47 elevationGraphView];
  [v38 setElevationProfile:0 routeLength:0.0];

  [v47 setTertiaryLabelVisible:1];
  [v47 setArtworkListVisible:0];
  [v47 setDetailsButtonVisible:0];
  [v47 setElevationGraphViewVisible:0];
  [v47 setAdvisoriesViewVisible:0];
  v39 = [v47 minimumHeightConstraint];
  [v39 constant];
  double v41 = v40;
  +[RouteOverviewCell minimumRidesharingHeight];
  double v43 = vabdd_f64(v41, v42);

  if (v43 > 2.22044605e-16)
  {
    +[RouteOverviewCell minimumRidesharingHeight];
    double v45 = v44;
    v46 = [v47 minimumHeightConstraint];
    [v46 setConstant:v45];
  }
  [v47 setGoButtonProgressVisible:0];
  [v47 setGoButtonProgress:0.0];
}

@end