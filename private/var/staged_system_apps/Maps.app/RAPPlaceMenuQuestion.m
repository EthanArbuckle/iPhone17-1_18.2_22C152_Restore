@interface RAPPlaceMenuQuestion
- (BOOL)shouldLoadClaimThisBusiness;
- (MKMapItem)snippetMapItem;
- (RAPPlace)reportedPlace;
- (RAPPlaceMenuQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 reportedPlace:(id)a5;
- (RAPPlaceMenuQuestion)initWithReport:(id)a3 reportedPlace:(id)a4;
- (id)_alternateMapViewContext;
- (id)followUpQuestionForCategory:(int64_t)a3;
- (id)mainMenuItems;
- (int)analyticTarget;
- (int64_t)snippetStyle;
- (void)_fillSubmissionParameters:(id)a3;
@end

@implementation RAPPlaceMenuQuestion

- (RAPPlaceMenuQuestion)initWithReport:(id)a3 reportedPlace:(id)a4
{
  return [(RAPPlaceMenuQuestion *)self initWithReport:a3 parentQuestion:0 reportedPlace:a4];
}

- (RAPPlaceMenuQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 reportedPlace:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPPlaceMenuQuestion;
  v10 = [(RAPQuestion *)&v13 initWithReport:a3 parentQuestion:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_reportedPlace, a5);
  }

  return v11;
}

- (int)analyticTarget
{
  return 1138;
}

- (id)mainMenuItems
{
  mainMenuItems = self->super._mainMenuItems;
  if (!mainMenuItems)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = (NSArray *)[v4 copy];
    v6 = self->super._mainMenuItems;
    self->super._mainMenuItems = v5;

    mainMenuItems = self->super._mainMenuItems;
  }

  return mainMenuItems;
}

- (id)_alternateMapViewContext
{
  v2 = [(RAPMenuQuestion *)self selectedMenuItem];
  v3 = [v2 _alternateMapViewContext];

  return v3;
}

- (BOOL)shouldLoadClaimThisBusiness
{
  return 1;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 commonContext];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v4 setCommonContext:v6];
  }
  v7 = [v4 commonContext];
  [v7 addUserPath:1];

  v8.receiver = self;
  v8.super_class = (Class)RAPPlaceMenuQuestion;
  [(RAPMenuQuestion *)&v8 _fillSubmissionParameters:v4];
}

- (int64_t)snippetStyle
{
  v2 = [(RAPPlaceMenuQuestion *)self reportedPlace];

  return v2 != 0;
}

- (MKMapItem)snippetMapItem
{
  v2 = [(RAPPlaceMenuQuestion *)self reportedPlace];
  v3 = [v2 mapItem];

  return (MKMapItem *)v3;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = RAPProblemNotListedQuestion;
    goto LABEL_5;
  }
  if (a3 == 9)
  {
    id v4 = RAPPlaceClosureQuestion;
LABEL_5:
    id v5 = [v4 alloc];
    id v6 = [(RAPQuestion *)self report];
    id v7 = [v5 initWithReport:v6 parentQuestion:self];

    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (RAPPlace)reportedPlace
{
  return self->_reportedPlace;
}

- (void).cxx_destruct
{
}

@end