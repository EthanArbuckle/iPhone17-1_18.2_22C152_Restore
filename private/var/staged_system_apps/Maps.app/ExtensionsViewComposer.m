@interface ExtensionsViewComposer
+ (void)composeBannerAttributionView:(id)a3 forRideBookingRideStatus:(id)a4;
+ (void)composeBannerView:(id)a3 forRidesharingCurrentRideViewController:(id)a4 rideBookingRideStatus:(id)a5;
+ (void)composeBlankTemplatedBannerView:(id)a3 forRideBookingRideStatus:(id)a4;
+ (void)composeCustomFeedbackHeaderView:(id)a3 forRideBookingRideStatus:(id)a4;
+ (void)composeCustomHeaderView:(id)a3 forRideBookingRequestRideStatus:(id)a4;
+ (void)composeCustomHeaderView:(id)a3 forRideBookingRideStatus:(id)a4;
+ (void)composeFeedbackView:(id)a3 forRideBookingRideStatus:(id)a4 tippingViewDelegate:(id)a5;
+ (void)composeOpenAppView:(id)a3 forRideBookingRequestRideStatus:(id)a4;
+ (void)composeOpenAppView:(id)a3 forRideBookingRideStatus:(id)a4;
+ (void)composePayView:(id)a3 forRideBookingRequestRideStatus:(id)a4;
+ (void)composePrimaryDetailsView:(id)a3 forRideBookingRequestRideStatus:(id)a4;
+ (void)composePrimaryDetailsView:(id)a3 forRideBookingRideStatus:(id)a4 withActionButtons:(id)a5;
+ (void)composeSecondaryDetailsView:(id)a3 forRideBookingRequestRideStatus:(id)a4;
+ (void)composeSecondaryDetailsView:(id)a3 forRideBookingRideStatus:(id)a4;
+ (void)composeTemplatedBannerView:(id)a3 forRideBookingRideStatus:(id)a4;
@end

@implementation ExtensionsViewComposer

+ (void)composePrimaryDetailsView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 appIconImageView];
  v8 = [v5 cardIcon];
  [v7 setImage:v8];

  v9 = [v6 titleLabel];
  v10 = [v5 cardTitle];
  [v9 setText:v10];

  v11 = [v6 subtitleLabel];
  v12 = [v5 cardSubtitle];
  [v11 setText:v12];

  id v14 = [v5 cardFormattedPriceRange];
  v13 = [v5 cardFormattedPriceRangeBadge];

  [v6 setTertiaryText:v14 badge:v13];
}

+ (void)composeSecondaryDetailsView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 disclaimerLabel];
  v8 = [v5 disclaimerMessage];
  [v7 setText:v8];

  v9 = [v6 informationLabel];
  v10 = [v5 appleDisclaimer];
  [v9 setText:v10];

  id v11 = [v5 cardFareLineItems];

  [v6 setDetailEntries:v11];
}

+ (void)composeOpenAppView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v6 = a3;
  id v5 = [a4 openInAppCommandTitle];
  [v6 setOpenAppButtonTitle:v5];

  [v6 setActions:&__NSArray0__struct];
}

+ (void)composePayView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v5 = a3;
  id v9 = [a4 paymentMethod];
  id v6 = [v9 title];
  v7 = [v9 subtitle];
  v8 = [v9 icon];
  [v5 configureForTitle:v6 subtitle:v7 image:v8];
}

+ (void)composeCustomHeaderView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v24 = a3;
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v7 = [PlaceholderWaypointRequest alloc];
  v8 = [v5 origin];
  id v9 = [(PlaceholderWaypointRequest *)v7 initWithCLPlacemark:v8];
  v31[0] = v9;
  v10 = [PlaceholderWaypointRequest alloc];
  id v11 = [v5 destination];
  v12 = [(PlaceholderWaypointRequest *)v10 initWithCLPlacemark:v11];
  v31[1] = v12;
  v13 = +[NSArray arrayWithObjects:v31 count:2];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v13;
  id v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v19 = [WaypointPlaceholder alloc];
        v20 = [v18 waypointName];
        v21 = [(WaypointPlaceholder *)v19 initWithName:v20 displayableMarker:0];

        v22 = [[RoutePlanningWaypointRequest alloc] initWithWaypointPlaceholder:v21 request:v18 preferredNameSource:0];
        v23 = +[SearchFieldItem searchFieldItemWithObject:v22];
        [v6 addObject:v23];
      }
      id v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  [v24 setOverrideWaypoints:v6];
  [v24 updateWaypointsList];
}

+ (void)composeBannerView:(id)a3 forRidesharingCurrentRideViewController:(id)a4 rideBookingRideStatus:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 _remoteViewController];
  id v11 = [v9 getRideStatusIntentResponse];
  if (!v11)
  {
    id v11 = [v9 requestRideIntentResponse];
  }
  id v12 = objc_alloc((Class)INInteraction);
  v13 = objc_opt_new();
  id v14 = [v12 initWithIntent:v13 response:v11];

  [v10 configureWithInteraction:v14 context:1 completion:&stru_101313110];
  if (v10)
  {
    id v15 = [v10 parentViewController];

    if (!v15)
    {
      [v10 beginAppearanceTransition:1 animated:0];
      [v8 addChildViewController:v10];
      uint64_t v16 = [v10 view];
      [v7 setRemoteView:v16];

      [v10 didMoveToParentViewController:v8];
      [v10 endAppearanceTransition];
    }
  }
  else
  {
    id v27 = v14;
    long long v28 = v11;
    id v29 = v9;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v17 = [v8 childViewControllers];
    id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v23 = v22;
          }
          else {
            v23 = 0;
          }
          id v24 = v23;
          if ([v24 isViewLoaded])
          {
            v25 = [v24 view];
            long long v26 = [v7 remoteView];

            if (v25 == v26)
            {
              [v24 beginAppearanceTransition:0 animated:0];
              [v24 willMoveToParentViewController:0];
              [v7 setRemoteView:0];
              [v24 removeFromParentViewController];
              [v24 endAppearanceTransition];

              goto LABEL_20;
            }
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    id v9 = v29;
    id v14 = v27;
    id v11 = v28;
  }
}

+ (void)composeBlankTemplatedBannerView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v4 = a3;
  [v4 setAppIcon:0];
  id v5 = [v4 primaryLabel];
  [v5 setText:&stru_101324E70];

  id v6 = [v4 secondaryLabel];

  [v6 setText:&stru_101324E70];
}

+ (void)composeTemplatedBannerView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 templatedViewAppIcon];
  [v6 setAppIcon:v7];

  id v8 = [v5 templatedViewTitle];
  id v9 = [v6 primaryLabel];
  [v9 setText:v8];

  id v11 = [v5 templatedViewSubtitle];

  v10 = [v6 secondaryLabel];

  [v10 setText:v11];
}

+ (void)composeBannerAttributionView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5 = a4;
  id v7 = [a3 attributionLabel];
  id v6 = [v5 bannerAttributionTitle];

  [v7 setText:v6];
}

+ (void)composeFeedbackView:(id)a3 forRideBookingRideStatus:(id)a4 tippingViewDelegate:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 tippingOptions];
  [v19 setTippingOptions:v9];

  v10 = [v7 driverImage];
  [v19 configureHeaderImage:v10];

  [v19 setShowRatingOptions:[v7 shouldShowRatingOptions]];
  [v19 configureTippingViewWithDelegate:v8];

  id v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"Ridesharing submit default" value:@"localized string not found" table:0];

  if ([v7 shouldShowRatingOptions])
  {
    v13 = +[NSBundle mainBundle];
    uint64_t v14 = [v13 localizedStringForKey:@"Ridesharing submit rating" value:@"localized string not found" table:0];

    id v12 = (void *)v14;
  }
  if ([v7 shouldShowTippingOptions])
  {
    id v15 = +[NSBundle mainBundle];
    uint64_t v16 = [v15 localizedStringForKey:@"Ridesharing submit tip" value:@"localized string not found" table:0];

    id v12 = (void *)v16;
  }
  if ([v7 shouldShowRatingOptions]
    && [v7 shouldShowTippingOptions])
  {
    v17 = +[NSBundle mainBundle];
    uint64_t v18 = [v17 localizedStringForKey:@"Ridesharing submit rating and tip" value:@"localized string not found" table:0];

    id v12 = (void *)v18;
  }
  [v19 configureSubmitButtonTitle:v12];
}

+ (void)composePrimaryDetailsView:(id)a3 forRideBookingRideStatus:(id)a4 withActionButtons:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v17 = a3;
  id v9 = [v17 appIconImageView];
  v10 = [v8 cardIcon];
  [v9 setImage:v10];

  id v11 = [v17 titleLabel];
  id v12 = [v8 cardTitle];
  [v11 setText:v12];

  v13 = [v17 subtitleLabel];
  uint64_t v14 = [v8 cardSubtitle];
  [v13 setText:v14];

  id v15 = [v8 cardTertiaryTitle];
  uint64_t v16 = [v8 cardFormattedPriceRangeBadge];

  [v17 setTertiaryText:v15 badge:v16];
  [v17 configureWithActionButtons:v7];
}

+ (void)composeSecondaryDetailsView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 informationLabel];
  id v8 = [v5 cardDisclaimer];
  [v7 setText:v8];

  id v9 = [v5 cardFareLineItems];

  [v6 setDetailEntries:v9];
}

+ (void)composeOpenAppView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 openInAppCommandTitle];
  [v6 setOpenAppButtonTitle:v7];

  id v8 = [v5 cardActions];

  [v6 setActions:v8];
}

+ (void)composeCustomHeaderView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  id v7 = [v5 pickupLocation];
  id v8 = [v7 _geoMapItem];
  id v9 = +[SearchFieldItem searchFieldItemWithObject:v8];

  [v14 addObject:v9];
  v10 = [v5 dropoffLocation];

  id v11 = [v10 _geoMapItem];
  id v12 = +[SearchFieldItem searchFieldItemWithObject:v11];

  [v14 addObject:v12];
  id v13 = [v14 copy];
  [v6 setOverrideWaypoints:v13];

  [v6 updateWaypointsList];
}

+ (void)composeCustomFeedbackHeaderView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 templatedViewTitle];
  [v6 setTitle:v7];

  id v8 = [v5 templatedViewSubtitle];

  [v6 setSubtitle:v8];
}

@end