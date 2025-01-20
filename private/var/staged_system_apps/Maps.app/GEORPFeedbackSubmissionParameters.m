@interface GEORPFeedbackSubmissionParameters
- (BOOL)isDirectionsFeedback;
- (BOOL)isPOIEnrichment;
- (BOOL)isPersonalizedMapsFeedback;
- (BOOL)isTransitFeedback;
- (id)stringForFeedbackType:(int)a3;
- (unint64_t)logDiscardTriggerType;
- (void)addDirectionsContextWithReport:(id)a3 recording:(id)a4;
- (void)appendImageIdToPoiEnrichment:(id)a3 withPhotoMetadata:(id)a4;
- (void)appendServerImageId:(id)a3 withMatchingPhoto:(id)a4;
- (void)insertDirectionStepCommentId:(id)a3 withMatchingPhoto:(id)a4;
- (void)insertDirectionStepImageId:(id)a3 withMatchingPhoto:(id)a4;
- (void)insertImageIdIntoCommonCorrections:(id)a3;
- (void)insertImageIdIntoLookAroundContext:(id)a3;
- (void)insertImageIdIntoMapViewContext:(id)a3;
- (void)insertOverviewDirectionsImageId:(id)a3;
- (void)setFeedbackType;
- (void)updatePOIEnrichmentWithCloudKitReceipts:(id)a3;
@end

@implementation GEORPFeedbackSubmissionParameters

- (void)addDirectionsContextWithReport:(id)a3 recording:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(GEORPFeedbackSubmissionParameters *)self details];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [(GEORPFeedbackSubmissionParameters *)self setDetails:v9];
  }
  v10 = [(GEORPFeedbackSubmissionParameters *)self details];
  v11 = [v10 directionsFeedback];

  if (!v11)
  {
    id v12 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    v13 = [(GEORPFeedbackSubmissionParameters *)self details];
    [v13 setDirectionsFeedback:v12];
  }
  v14 = [(GEORPFeedbackSubmissionParameters *)self details];
  v15 = [v14 directionsFeedback];
  id v16 = [v15 directionsContext];

  if (!v16)
  {
    id v16 = objc_alloc_init((Class)GEORPDirectionsFeedbackContext);
    v17 = [(GEORPFeedbackSubmissionParameters *)self details];
    v18 = [v17 directionsFeedback];
    [v18 setDirectionsContext:v16];
  }
  v19 = [v7 directionsRequests];
  [v16 setDirectionsRequests:v19];

  v20 = [v7 directionsResponses];
  [v16 setDirectionsResponses:v20];

  v21 = [(GEORPFeedbackSubmissionParameters *)self details];
  v22 = [v21 directionsFeedback];
  id v23 = [v22 directionsCorrections];

  if (!v23)
  {
    id v23 = objc_alloc_init((Class)GEORPDirectionsCorrections);
    v24 = [(GEORPFeedbackSubmissionParameters *)self details];
    v25 = [v24 directionsFeedback];
    [v25 setDirectionsCorrections:v23];
  }
  v26 = [v7 directionsResponseID];
  [v23 setDirectionsResponseId:v26];

  v27 = [RAPPhoto alloc];
  v28 = [v7 overviewScreenshotImageData];
  v29 = +[UIImage imageWithData:v28];
  v30 = +[NSDate date];
  v31 = [(RAPPhoto *)v27 initWithPhoto:v29 date:v30 location:0];

  v32 = [(RAPPhoto *)v31 photo];

  if (v32)
  {
    v33 = [[RAPPhotoWithMetadata alloc] initWithRAPPhoto:v31 photoType:2];
    [v6 addPhotoWithMetadata:v33];
  }
  v58 = v31;
  v59 = v6;
  id v34 = objc_alloc((Class)GEORPPlaceInfo);
  v35 = [v7 startWaypointCorrectedSearchTemplate];
  id v36 = [v34 initWithCorrectedSearch:v35];

  [v36 clearSessionId];
  id v37 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
  v38 = [v36 placeRequest];
  [v37 setPlaceRequest:v38];

  v39 = [v36 placeResponse];
  [v37 setPlaceResponse:v39];

  id v40 = objc_alloc((Class)GEORPPlaceInfo);
  v41 = [v7 endWaypointCorrectedSearchTemplate];
  id v42 = [v40 initWithCorrectedSearch:v41];

  [v42 clearSessionId];
  id v43 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
  v44 = [v42 placeRequest];
  [v43 setPlaceRequest:v44];

  v45 = [v42 placeResponse];
  [v43 setPlaceResponse:v45];

  v60[0] = v37;
  v60[1] = v43;
  v46 = +[NSArray arrayWithObjects:v60 count:2];
  id v47 = [v46 mutableCopy];
  [v16 setDirectionsWaypointPlaceInfos:v47];

  v48 = [v7 startWaypoint];
  if (v48)
  {
    id v49 = [objc_alloc((Class)GEORPUserSearchInput) initWithRAPUserSearchInput:v48];
    [v16 setStartWaypoint:v49];
  }
  v50 = [v7 endWaypoint];
  if (v50)
  {
    id v51 = [objc_alloc((Class)GEORPUserSearchInput) initWithRAPUserSearchInput:v50];
    [v16 setEndWaypoint:v51];
  }
  if (v7
    && [v7 hasSelectedDirectionsResponseIndex]
    && [v7 hasSelectedSuggestedRouteIndexInDirectionsResponse]
    && ![v23 problematicRouteIndexsCount])
  {
    id v52 = objc_alloc_init((Class)GEORPSuggestedRouteIndex);
    [v52 setDirectionsResponseIndex:[v7 selectedDirectionsResponseIndex]];
    v57 = v52;
    [v52 setDirectionsResponseSuggestedRoutesIndex:[v7 selectedSuggestedRouteIndexInDirectionsResponse]];
    v55 = [v7 directionsResponses];
    v53 = [v55 objectAtIndexedSubscript:[v7 selectedDirectionsResponseIndex]];

    v56 = v53;
    v54 = [v53 suggestedRoutes];

    if (v54) {
      [v57 setClusteredRouteRideSelections:[v7 clusteredRouteRideSelections] count:[v7 clusteredRouteRideSelectionsCount]];
    }
    [v23 addProblematicRouteIndex:v57];
  }
}

- (void)setFeedbackType
{
  if ([(GEORPFeedbackSubmissionParameters *)self hasDetails])
  {
    v3 = [(GEORPFeedbackSubmissionParameters *)self details];
    unsigned __int8 v4 = [v3 hasPoiFeedback];

    if (v4)
    {
      uint64_t v5 = 2;
    }
    else
    {
      id v6 = [(GEORPFeedbackSubmissionParameters *)self details];
      unsigned __int8 v7 = [v6 hasTransitPoiFeedback];

      if (v7)
      {
        uint64_t v5 = 3;
      }
      else
      {
        v8 = [(GEORPFeedbackSubmissionParameters *)self details];
        unsigned __int8 v9 = [v8 hasTileFeedback];

        if (v9)
        {
          uint64_t v5 = 5;
        }
        else
        {
          v10 = [(GEORPFeedbackSubmissionParameters *)self details];
          unsigned __int8 v11 = [v10 hasSearchFeedback];

          if (v11)
          {
            uint64_t v5 = 6;
          }
          else
          {
            id v12 = [(GEORPFeedbackSubmissionParameters *)self details];
            unsigned __int8 v13 = [v12 hasDirectionsFeedback];

            if (v13)
            {
              uint64_t v5 = 8;
            }
            else
            {
              v14 = [(GEORPFeedbackSubmissionParameters *)self details];
              unsigned __int8 v15 = [v14 hasAddressPointFeedback];

              if (v15)
              {
                uint64_t v5 = 4;
              }
              else
              {
                id v16 = [(GEORPFeedbackSubmissionParameters *)self details];
                unsigned __int8 v17 = [v16 hasGroundViewFeedback];

                if (v17)
                {
                  uint64_t v5 = 9;
                }
                else
                {
                  v18 = [(GEORPFeedbackSubmissionParameters *)self details];
                  unsigned __int8 v19 = [v18 hasMerchantLookupFeedback];

                  if (v19)
                  {
                    uint64_t v5 = 7;
                  }
                  else
                  {
                    v20 = [(GEORPFeedbackSubmissionParameters *)self details];
                    unsigned __int8 v21 = [v20 hasPoiEnrichmentUpdate];

                    if (v21)
                    {
                      uint64_t v5 = 10;
                    }
                    else
                    {
                      v22 = [(GEORPFeedbackSubmissionParameters *)self details];
                      unsigned __int8 v23 = [v22 hasIncidentFeedback];

                      if (v23)
                      {
                        uint64_t v5 = 11;
                      }
                      else
                      {
                        v24 = [(GEORPFeedbackSubmissionParameters *)self details];
                        unsigned __int8 v25 = [v24 hasPoiImageFeedback];

                        if (v25)
                        {
                          uint64_t v5 = 13;
                        }
                        else
                        {
                          v26 = [(GEORPFeedbackSubmissionParameters *)self details];
                          unsigned __int8 v27 = [v26 hasCuratedCollectionFeedback];

                          if (v27)
                          {
                            uint64_t v5 = 12;
                          }
                          else
                          {
                            v28 = [(GEORPFeedbackSubmissionParameters *)self details];
                            unsigned __int8 v29 = [v28 hasAddMapFeedback];

                            if (v29)
                            {
                              uint64_t v5 = 15;
                            }
                            else
                            {
                              v30 = [(GEORPFeedbackSubmissionParameters *)self details];
                              unsigned __int8 v31 = [v30 hasStreetFeedback];

                              if (v31)
                              {
                                uint64_t v5 = 17;
                              }
                              else
                              {
                                v32 = [(GEORPFeedbackSubmissionParameters *)self details];
                                unsigned __int8 v33 = [v32 hasLocalityFeedback];

                                if (v33)
                                {
                                  uint64_t v5 = 16;
                                }
                                else
                                {
                                  id v34 = [(GEORPFeedbackSubmissionParameters *)self details];
                                  unsigned int v35 = [v34 hasRapUserResponseFeedback];

                                  if (v35) {
                                    uint64_t v5 = 21;
                                  }
                                  else {
                                    uint64_t v5 = 0;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  [(GEORPFeedbackSubmissionParameters *)self setType:v5];
}

- (id)stringForFeedbackType:(int)a3
{
  switch(a3)
  {
    case 0:
    case 5:
    case 6:
    case 7:
    case 10:
    case 11:
    case 14:
    case 18:
    case 19:
    case 20:
    case 21:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Other Issue";
      goto LABEL_3;
    case 1:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Map Issue";
      goto LABEL_3;
    case 2:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Place Issue";
      goto LABEL_3;
    case 3:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Transit Issue";
      goto LABEL_3;
    case 4:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Address Issue";
      goto LABEL_3;
    case 8:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Directions Issue";
      goto LABEL_3;
    case 9:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Look Around Issue";
      goto LABEL_3;
    case 12:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Guide Issue";
      goto LABEL_3;
    case 13:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Photo Issue";
      goto LABEL_3;
    case 15:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Missing Feature";
      goto LABEL_3;
    case 16:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Locality Issue";
      goto LABEL_3;
    case 17:
      unsigned __int8 v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Street Issue";
LABEL_3:
      v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return v3;
}

- (unint64_t)logDiscardTriggerType
{
  unsigned int v2 = [(GEORPFeedbackSubmissionParameters *)self type] - 2;
  if (v2 > 0x13) {
    return 0;
  }
  else {
    return qword_100F6FD00[v2];
  }
}

- (void)insertDirectionStepImageId:(id)a3 withMatchingPhoto:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(GEORPFeedbackSubmissionParameters *)self details];
  unsigned __int8 v9 = [v8 directionsFeedback];
  v10 = [v9 directionsCorrections];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned __int8 v23 = v10;
  unsigned __int8 v11 = [v10 instructionCorrections];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    id v22 = v6;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unsigned __int8 v17 = [v16 routeStepScreenshotImageId];
        v18 = [v7 photoMetadata];
        unsigned __int8 v19 = [v18 clientImageUuid];
        unsigned int v20 = [v17 isEqualToString:v19];

        if (v20)
        {
          unsigned __int8 v21 = v16;
          id v6 = v22;
          [v21 setRouteStepScreenshotImageId:v22];
          goto LABEL_11;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v6 = v22;
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)insertDirectionStepCommentId:(id)a3 withMatchingPhoto:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(GEORPFeedbackSubmissionParameters *)self details];
  unsigned __int8 v9 = [v8 directionsFeedback];
  v10 = [v9 directionsCorrections];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned __int8 v23 = v10;
  unsigned __int8 v11 = [v10 instructionCorrections];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    id v22 = v6;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unsigned __int8 v17 = [v16 photoId];
        v18 = [v7 photoMetadata];
        unsigned __int8 v19 = [v18 clientImageUuid];
        unsigned int v20 = [v17 isEqualToString:v19];

        if (v20)
        {
          unsigned __int8 v21 = v16;
          id v6 = v22;
          [v21 setPhotoId:v22];
          goto LABEL_11;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v6 = v22;
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)insertOverviewDirectionsImageId:(id)a3
{
  id v14 = a3;
  unsigned __int8 v4 = [(GEORPFeedbackSubmissionParameters *)self details];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [(GEORPFeedbackSubmissionParameters *)self setDetails:v5];
  }
  id v6 = [(GEORPFeedbackSubmissionParameters *)self details];
  id v7 = [v6 directionsFeedback];

  if (!v7)
  {
    id v7 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    v8 = [(GEORPFeedbackSubmissionParameters *)self details];
    [v8 setDirectionsFeedback:v7];
  }
  unsigned __int8 v9 = [(GEORPFeedbackSubmissionParameters *)self details];
  v10 = [v9 directionsFeedback];
  id v11 = [v10 directionsCorrections];

  if (!v11)
  {
    id v11 = objc_alloc_init((Class)GEORPDirectionsCorrections);
    id v12 = [(GEORPFeedbackSubmissionParameters *)self details];
    id v13 = [v12 directionsFeedback];
    [v13 setDirectionsCorrections:v11];
  }
  [v11 setOverviewScreenshotImageId:v14];
}

- (void)insertImageIdIntoMapViewContext:(id)a3
{
  id v4 = a3;
  id v5 = [(GEORPFeedbackSubmissionParameters *)self commonContext];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [(GEORPFeedbackSubmissionParameters *)self setCommonContext:v6];
  }
  id v7 = [(GEORPFeedbackSubmissionParameters *)self commonContext];
  v8 = [v7 mapLocation];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)GEORPMapLocation);
    v10 = [(GEORPFeedbackSubmissionParameters *)self commonContext];
    [v10 setMapLocation:v9];
  }
  id v12 = [(GEORPFeedbackSubmissionParameters *)self commonContext];
  id v11 = [v12 mapLocation];
  [v11 setMapScreenshotId:v4];
}

- (void)insertImageIdIntoCommonCorrections:(id)a3
{
  id v4 = a3;
  id v5 = [(GEORPFeedbackSubmissionParameters *)self commonCorrections];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)GEORPFeedbackCommonCorrections);
    [(GEORPFeedbackSubmissionParameters *)self setCommonCorrections:v6];
  }
  id v7 = [(GEORPFeedbackSubmissionParameters *)self commonCorrections];
  [v7 addImageId:v4];
}

- (void)insertImageIdIntoLookAroundContext:(id)a3
{
  id v4 = a3;
  id v5 = [(GEORPFeedbackSubmissionParameters *)self details];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [(GEORPFeedbackSubmissionParameters *)self setDetails:v6];
  }
  id v7 = [(GEORPFeedbackSubmissionParameters *)self details];
  v8 = [v7 groundViewFeedback];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)GEORPGroundViewFeedback);
    v10 = [(GEORPFeedbackSubmissionParameters *)self details];
    [v10 setGroundViewFeedback:v9];
  }
  id v11 = [(GEORPFeedbackSubmissionParameters *)self details];
  id v12 = [v11 groundViewFeedback];
  id v13 = [v12 groundViewContext];

  if (!v13)
  {
    id v14 = objc_alloc_init((Class)GEORPGroundViewFeedbackContext);
    unsigned __int8 v15 = [(GEORPFeedbackSubmissionParameters *)self details];
    id v16 = [v15 groundViewFeedback];
    [v16 setGroundViewContext:v14];
  }
  id v19 = [(GEORPFeedbackSubmissionParameters *)self details];
  unsigned __int8 v17 = [v19 groundViewFeedback];
  v18 = [v17 groundViewContext];
  [v18 setImageId:v4];
}

- (BOOL)isDirectionsFeedback
{
  return [(GEORPFeedbackSubmissionParameters *)self type] == 8;
}

- (BOOL)isTransitFeedback
{
  return [(GEORPFeedbackSubmissionParameters *)self type] == 3;
}

- (BOOL)isPersonalizedMapsFeedback
{
  if ([(GEORPFeedbackSubmissionParameters *)self type] != 4) {
    return 0;
  }
  v3 = [(GEORPFeedbackSubmissionParameters *)self details];
  id v4 = [v3 addressPointFeedback];
  unsigned __int8 v5 = [v4 hasPersonalizedMaps];

  return v5;
}

- (void)appendServerImageId:(id)a3 withMatchingPhoto:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  switch((unint64_t)[v6 photoType])
  {
    case 0uLL:
      [(GEORPFeedbackSubmissionParameters *)self insertImageIdIntoMapViewContext:v8];
      break;
    case 1uLL:
      [(GEORPFeedbackSubmissionParameters *)self insertImageIdIntoCommonCorrections:v8];
      break;
    case 2uLL:
      [(GEORPFeedbackSubmissionParameters *)self insertOverviewDirectionsImageId:v8];
      break;
    case 3uLL:
      [(GEORPFeedbackSubmissionParameters *)self insertDirectionStepImageId:v8 withMatchingPhoto:v6];
      break;
    case 4uLL:
      [(GEORPFeedbackSubmissionParameters *)self insertDirectionStepCommentId:v8 withMatchingPhoto:v6];
      break;
    case 5uLL:
      [(GEORPFeedbackSubmissionParameters *)self insertImageIdIntoLookAroundContext:v8];
      break;
    case 6uLL:
      id v7 = [v6 photoMetadata];
      [(GEORPFeedbackSubmissionParameters *)self appendImageIdToPoiEnrichment:v8 withPhotoMetadata:v7];

      break;
    default:
      break;
  }
}

- (void)appendImageIdToPoiEnrichment:(id)a3 withPhotoMetadata:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(GEORPFeedbackSubmissionParameters *)self details];

  if (!v7)
  {
    id v8 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [(GEORPFeedbackSubmissionParameters *)self setDetails:v8];
  }
  id v9 = [(GEORPFeedbackSubmissionParameters *)self details];
  v10 = [v9 poiEnrichmentUpdate];

  if (!v10)
  {
    id v11 = objc_alloc_init((Class)GEORPPoiEnrichmentUpdate);
    id v12 = [(GEORPFeedbackSubmissionParameters *)self details];
    [v12 setPoiEnrichmentUpdate:v11];
  }
  id v13 = +[GEORPImageUpdate newImageUpdateWithImageId:v16 photoMetadata:v6];
  id v14 = [(GEORPFeedbackSubmissionParameters *)self details];
  unsigned __int8 v15 = [v14 poiEnrichmentUpdate];
  [v15 addImageUpdate:v13];
}

- (void)updatePOIEnrichmentWithCloudKitReceipts:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(GEORPFeedbackSubmissionParameters *)self details];
  id v6 = [v5 poiEnrichmentUpdate];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v14 = [v13 comparisonIdentifier];
          [v7 setObject:v13 forKey:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v10);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unsigned __int8 v15 = [(GEORPFeedbackSubmissionParameters *)self details];
    id v16 = [v15 poiEnrichmentUpdate];
    unsigned __int8 v17 = [v16 imageUpdates];

    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
          if ([v22 action] == 1)
          {
            unsigned __int8 v23 = [v22 comparisonIdentifier];
            long long v24 = [v7 objectForKey:v23];

            long long v25 = [v24 uploadResponse];
            [v22 setUploadResponse:v25];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v19);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: enrichment != ((void *)0)", buf, 2u);
  }
}

- (BOOL)isPOIEnrichment
{
  return [(GEORPFeedbackSubmissionParameters *)self type] == 10;
}

@end