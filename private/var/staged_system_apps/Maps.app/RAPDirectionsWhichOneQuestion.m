@interface RAPDirectionsWhichOneQuestion
+ (BOOL)_canDisplayForContext:(id)a3 transportMode:(unint64_t)a4;
+ (id)localizedTransitTitle;
- (BOOL)_followupQuestionsAreDirectionsRelated;
- (BOOL)_isRecursivelyComplete;
- (BOOL)isComplete;
- (GEOComposedRoute)routeFromRecording;
- (NSArray)selectableDirectionsRequests;
- (NSString)localizedDescription;
- (NSString)localizedSelectDirectionsRequestPrompt;
- (NSString)localizedServerControlledDescription;
- (NSString)localizedTitle;
- (RAPDirectionsCategoryQuestion)followUpQuestion;
- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4;
- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 selectableDirectionRequests:(id)a5;
- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 transportType:(unint64_t)a5;
- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 transportType:(unint64_t)a5 selectableRequests:(id)a6;
- (RAPUserDirectionRequest)selectedValue;
- (UIImage)image;
- (id)_alternateAuxiliaryControlsRecording;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setLocalizedServerControlledDescription:(id)a3;
- (void)setSelectedValue:(id)a3;
@end

@implementation RAPDirectionsWhichOneQuestion

- (NSString)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Navigation [Report a Problem category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

+ (id)localizedTransitTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"bad directions [Report a Problem category]" value:@"localized string not found" table:0];

  return v3;
}

- (NSString)localizedDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Navigation description [Report an Issue category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (UIImage)image
{
  return +[UIImage imageNamed:@"recentroute"];
}

- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  return [(RAPDirectionsWhichOneQuestion *)self initWithReport:a3 parentQuestion:a4 transportType:0xFFFFFFFLL selectableRequests:0];
}

- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 transportType:(unint64_t)a5
{
  return [(RAPDirectionsWhichOneQuestion *)self initWithReport:a3 parentQuestion:a4 transportType:a5 selectableRequests:0];
}

- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 transportType:(unint64_t)a5 selectableRequests:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RAPDirectionsWhichOneQuestion;
  v12 = [(RAPQuestion *)&v15 initWithReport:a3 parentQuestion:v10];
  v13 = v12;
  if (v12)
  {
    v12->_isInitialQuestion = v10 == 0;
    v12->_transportType = a5;
    objc_storeStrong((id *)&v12->_selectableDirectionsRequests, a6);
  }

  return v13;
}

- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 selectableDirectionRequests:(id)a5
{
  return [(RAPDirectionsWhichOneQuestion *)self initWithReport:a3 parentQuestion:a4 transportType:0xFFFFFFFLL selectableRequests:a5];
}

- (int64_t)questionCategory
{
  return 7;
}

- (int)analyticTarget
{
  return 1100;
}

+ (BOOL)_canDisplayForContext:(id)a3 transportMode:(unint64_t)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [a3 directionsHistory];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 recording];
        if (v11)
        {
          v12 = (void *)v11;
          unsigned int v13 = [v10 requestedTransportType];
          uint64_t v14 = v13 > 5 ? 1 : qword_100F721A8[v13];
          unint64_t v15 = v14 & a4;

          if (v15)
          {
            BOOL v16 = 1;
            goto LABEL_15;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (NSString)localizedSelectDirectionsRequestPrompt
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Route [Report a Problem prompt]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSArray)selectableDirectionsRequests
{
  selectableDirectionsRequests = self->_selectableDirectionsRequests;
  if (!selectableDirectionsRequests)
  {
    v4 = [(RAPQuestion *)self report];
    v5 = [v4 _context];

    id v6 = +[NSMutableArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = [v5 directionsHistory];
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        unsigned int v13 = [v12 recording];

        if (v13)
        {
          unint64_t transportType = self->_transportType;
          unsigned int v15 = [v12 requestedTransportType];
          if (v15 > 5) {
            uint64_t v16 = 1;
          }
          else {
            uint64_t v16 = qword_100F721A8[v15];
          }
          if ((v16 & transportType) != 0) {
            [v6 addObject:v12];
          }
          if ((unint64_t)[v6 count] > 0xE) {
            break;
          }
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v17 = (NSArray *)[v6 copy];
    long long v18 = self->_selectableDirectionsRequests;
    self->_selectableDirectionsRequests = v17;

    selectableDirectionsRequests = self->_selectableDirectionsRequests;
  }

  return selectableDirectionsRequests;
}

- (void)setSelectedValue:(id)a3
{
  v5 = (RAPUserDirectionRequest *)a3;
  if (self->_selectedValue != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_selectedValue, a3);
    followUpQuestion = self->_followUpQuestion;
    self->_followUpQuestion = 0;

    route = self->_route;
    self->_route = 0;

    [(RAPQuestion *)self _didChange];
    v5 = v8;
  }
}

- (GEOComposedRoute)routeFromRecording
{
  if (self->_selectedValue) {
    v2 = self->_route;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (BOOL)isComplete
{
  return self->_selectedValue != 0;
}

- (BOOL)_isRecursivelyComplete
{
  BOOL v3 = [(RAPMenuQuestion *)self->_followUpQuestion _isRecursivelyComplete];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPDirectionsWhichOneQuestion;
    LOBYTE(v3) = [(RAPQuestion *)&v5 _isRecursivelyComplete];
  }
  return v3;
}

- (RAPDirectionsCategoryQuestion)followUpQuestion
{
  followUpQuestion = self->_followUpQuestion;
  if (!followUpQuestion)
  {
    v4 = [RAPDirectionsCategoryQuestion alloc];
    objc_super v5 = [(RAPQuestion *)self report];
    id v6 = [(RAPDirectionsCategoryQuestion *)v4 initWithReport:v5 parentQuestion:self directions:self->_selectedValue];
    id v7 = self->_followUpQuestion;
    self->_followUpQuestion = v6;

    followUpQuestion = self->_followUpQuestion;
  }

  return followUpQuestion;
}

- (id)_alternateAuxiliaryControlsRecording
{
  v2 = [(RAPDirectionsWhichOneQuestion *)self selectedValue];
  BOOL v3 = [v2 recording];

  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v30 = a3;
  id v4 = [v30 commonContext];
  if (!v4)
  {
    id v4 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v30 setCommonContext:v4];
  }
  if (self->_isInitialQuestion)
  {
    objc_super v5 = [(RAPQuestion *)self _context];
    id v6 = [v5 displayedDirectionsPlan];

    if (v6) {
      [v4 addUserPath:55];
    }
  }
  [v4 addUserPath:14];
  id v7 = [v30 details];

  if (!v7)
  {
    id v8 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [v30 setDetails:v8];
  }
  if ([(RAPDirectionsWhichOneQuestion *)self _followupQuestionsAreDirectionsRelated])
  {
    [v30 setType:8];
    id v9 = [(RAPQuestion *)self report];
    uint64_t v10 = [(RAPDirectionsWhichOneQuestion *)self selectedValue];
    uint64_t v11 = [v10 recording];
    [v30 addDirectionsContextWithReport:v9 recording:v11];

    v12 = [v30 details];
    unsigned int v13 = [v12 directionsFeedback];

    if (!v13)
    {
      id v14 = objc_alloc_init((Class)GEORPDirectionsFeedback);
      unsigned int v15 = [v30 details];
      [v15 setDirectionsFeedback:v14];
    }
    uint64_t v16 = [v30 details];
    v17 = [v16 directionsFeedback];
    [v17 setCorrectionType:3];
  }
  else
  {
    id v18 = objc_alloc_init((Class)GEORPTransitPoiFeedback);
    long long v19 = [v30 details];
    [v19 setTransitPoiFeedback:v18];

    long long v20 = [(RAPDirectionsWhichOneQuestion *)self selectedValue];
    long long v21 = [v20 recording];
    long long v22 = [v21 directionsRequests];
    long long v23 = [v30 details];
    v24 = [v23 transitPoiFeedback];
    [v24 setDirectionsRequests:v22];

    v25 = [(RAPDirectionsWhichOneQuestion *)self selectedValue];
    v26 = [v25 recording];
    v27 = [v26 directionsResponses];
    v28 = [v30 details];
    v29 = [v28 transitPoiFeedback];
    [v29 setDirectionsResponses:v27];

    [v30 setType:3];
  }
  [(RAPMenuQuestion *)self->_followUpQuestion _fillSubmissionParameters:v30];
}

- (BOOL)_followupQuestionsAreDirectionsRelated
{
  v2 = [(RAPMenuQuestion *)self->_followUpQuestion selectedMenuItem];
  BOOL v3 = (char *)[v2 questionCategory];

  return (unint64_t)(v3 - 1) < 7;
}

- (int)userAction
{
  return 10117;
}

- (RAPUserDirectionRequest)selectedValue
{
  return self->_selectedValue;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedServerControlledDescription, 0);
  objc_storeStrong((id *)&self->_selectedValue, 0);
  objc_storeStrong((id *)&self->_selectableDirectionsRequests, 0);
  objc_storeStrong((id *)&self->_followUpQuestion, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end