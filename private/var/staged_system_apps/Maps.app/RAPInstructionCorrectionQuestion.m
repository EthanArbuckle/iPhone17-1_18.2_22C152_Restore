@interface RAPInstructionCorrectionQuestion
- (GEOComposedRouteStep)composedRouteStep;
- (NSData)cellScreenshotImageData;
- (RAPInstructionCorrectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 composedRouteStep:(id)a5 listItem:(id)a6;
- (TransitDirectionsListItem)listItem;
- (id)_commentsPlaceholderText;
- (id)commentsTitle;
- (unint64_t)maximumNumberOfPhotos;
- (void)_fillSubmissionParameters:(id)a3;
- (void)fillIndexesForResponse:(id)a3 problemAticRouteIndex:(id)a4 correction:(id)a5;
- (void)setCellScreenshotImageData:(id)a3;
@end

@implementation RAPInstructionCorrectionQuestion

- (unint64_t)maximumNumberOfPhotos
{
  return 1;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v42 = a3;
  id v4 = [v42 details];
  if (!v4)
  {
    id v4 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [v42 setDetails:v4];
  }
  v5 = [v4 directionsFeedback];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    [v4 setDirectionsFeedback:v6];
  }
  v7 = [v4 directionsFeedback];
  [v7 setCorrectionType:1];

  v8 = [v4 directionsFeedback];
  id v9 = [v8 directionsCorrections];

  if (!v9)
  {
    id v9 = objc_alloc_init((Class)GEORPDirectionsCorrections);
    v10 = [v4 directionsFeedback];
    [v10 setDirectionsCorrections:v9];
  }
  v11 = [v9 instructionCorrections];

  if (!v11)
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    [v9 setInstructionCorrections:v12];
  }
  id v13 = objc_alloc_init((Class)GEORPInstructionCorrection);
  if (v42)
  {
    v14 = [v4 directionsFeedback];
    v15 = [v14 directionsContext];

    if (v15)
    {
      v16 = [v9 problematicRouteIndexs];
      id v17 = [v16 count];

      if (v17 != (id)1) {
        goto LABEL_16;
      }
      v18 = [v4 directionsFeedback];
      v19 = [v18 directionsContext];
      v20 = [v19 directionsResponses];
      v21 = [v20 firstObject];

      v22 = [v9 problematicRouteIndexs];
      v23 = [v22 firstObject];

      [(RAPInstructionCorrectionQuestion *)self fillIndexesForResponse:v21 problemAticRouteIndex:v23 correction:v13];
    }
  }
  v24 = [(RAPCommentQuestion *)self comment];
  [v13 setComments:v24];

  v25 = [(RAPInstructionCorrectionQuestion *)self cellScreenshotImageData];
  v26 = +[UIImage imageWithData:v25];

  v27 = [RAPPhoto alloc];
  v28 = +[NSDate date];
  v29 = [(RAPPhoto *)v27 initWithPhoto:v26 date:v28 location:0];

  v30 = [[RAPPhotoWithMetadata alloc] initWithRAPPhoto:v29 photoType:3];
  v31 = [(RAPPhotoWithMetadata *)v30 photoMetadata];
  v32 = [v31 clientImageUuid];
  [v13 setRouteStepScreenshotImageId:v32];

  v33 = [(RAPQuestion *)self report];
  [v33 addPhotoWithMetadata:v30];

  v34 = [(RAPCommentQuestion *)self photos];
  id v35 = [v34 count];

  if (v35)
  {
    v36 = [(RAPCommentQuestion *)self photos];
    v37 = [v36 firstObject];

    v38 = [[RAPPhotoWithMetadata alloc] initWithRAPPhoto:v37 photoType:4];
    v39 = [(RAPQuestion *)self report];
    [v39 addPhotoWithMetadata:v38];

    v40 = [(RAPPhotoWithMetadata *)v38 photoMetadata];
    v41 = [v40 clientImageUuid];
    [v13 setPhotoId:v41];
  }
  [v9 addInstructionCorrection:v13];

LABEL_16:
}

- (void)fillIndexesForResponse:(id)a3 problemAticRouteIndex:(id)a4 correction:(id)a5
{
  id v34 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v34 suggestedRoutes];
  if (v10
    && (v11 = (void *)v10,
        unsigned int v12 = [v8 directionsResponseSuggestedRoutesIndex],
        [v34 suggestedRoutes],
        id v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 count],
        v13,
        v11,
        (unint64_t)v14 > v12))
  {
    v15 = [v34 suggestedRoutes];
    v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v8, "directionsResponseSuggestedRoutesIndex"));

    int64_t v17 = [(TransitDirectionsListItem *)self->_listItem type];
    v18 = [v16 steps];
    v19 = v18;
    if (!v17)
    {
      [v9 setRouteStepIndex:[v18 indexOfObjectPassingTest:&stru_101315D48]];
LABEL_15:

      goto LABEL_16;
    }
    v20 = [(GEOComposedRouteStep *)self->_composedRouteStep transitStep];
    id v21 = [v19 indexOfObject:v20];

    if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v9 setRouteStepIndex:v21];
      v22 = [(GEOComposedRouteStep *)self->_composedRouteStep transitStep];
      unsigned int v23 = [v22 maneuverType];

      v24 = [(GEOComposedRouteStep *)self->_composedRouteStep transitStep];
      unsigned int v25 = [v24 hasWalkingIndex];

      v26 = [(TransitDirectionsListItem *)self->_listItem parentItem];

      if (v23 == 2 && v25 && (([v16 isWalkingOnlyRoute] & 1) != 0 || v26))
      {
        v27 = [v34 decoderData];
        v28 = [(GEOComposedRouteStep *)self->_composedRouteStep transitStep];
        v19 = [v27 walkingAtIndex:[v28 walkingIndex]];

        v29 = [v19 steps];
        v30 = [(GEOComposedRouteStep *)self->_composedRouteStep geoStep];
        id v31 = [v29 indexOfObject:v30];

        if (v31 != (id)0x7FFFFFFFFFFFFFFFLL) {
          [v9 setRouteStepSubstepIndex:v31];
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
    v16 = [(GEOComposedRouteStep *)self->_composedRouteStep composedRoute];
    unsigned int v32 = [v8 directionsResponseSuggestedRoutesIndex];
    if ([v16 indexInResponse] == (id)v32)
    {
      id v33 = [(GEOComposedRouteStep *)self->_composedRouteStep stepIndex];
      if (v33 != (id)0x7FFFFFFFFFFFFFFFLL) {
        [v9 setRouteStepIndex:v33];
      }
    }
  }
LABEL_16:
}

- (void)setCellScreenshotImageData:(id)a3
{
  if (self->_cellScreenshotImageData != a3)
  {
    id v4 = (NSData *)[a3 copy];
    cellScreenshotImageData = self->_cellScreenshotImageData;
    self->_cellScreenshotImageData = v4;
  }
}

- (id)commentsTitle
{
  return +[RAPCommentQuestion _localizedMoreInformationTitle];
}

- (id)_commentsPlaceholderText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Tell us more about this direction" value:@"localized string not found" table:0];

  return v3;
}

- (RAPInstructionCorrectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 composedRouteStep:(id)a5 listItem:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(RAPInstructionCorrectionQuestion *)self _commentsPlaceholderText];
  v18.receiver = self;
  v18.super_class = (Class)RAPInstructionCorrectionQuestion;
  v16 = [(RAPCommentQuestion *)&v18 initWithReport:v14 parentQuestion:v13 title:0 placeholderText:v15 emphasis:2];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_listItem, a6);
    objc_storeStrong((id *)&v16->_composedRouteStep, a5);
  }

  return v16;
}

- (NSData)cellScreenshotImageData
{
  return self->_cellScreenshotImageData;
}

- (GEOComposedRouteStep)composedRouteStep
{
  return self->_composedRouteStep;
}

- (TransitDirectionsListItem)listItem
{
  return self->_listItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItem, 0);
  objc_storeStrong((id *)&self->_composedRouteStep, 0);

  objc_storeStrong((id *)&self->_cellScreenshotImageData, 0);
}

@end