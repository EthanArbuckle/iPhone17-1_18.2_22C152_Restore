@interface RAPBadRouteSuggestionsQuestion
+ (BOOL)_canDisplayForContext:(id)a3 selection:(id)a4;
- (BOOL)_areAllSuggestionsSelectableInSet:(id)a3;
- (BOOL)_isRecursivelyComplete;
- (BOOL)_routeSuggestionsCanBeSubmitted;
- (BOOL)isComplete;
- (BOOL)noGoodRoutesShown;
- (BOOL)shouldShowCommentQuestion;
- (NSArray)selectableRouteSuggestions;
- (NSSet)selectedRouteSuggestions;
- (NSString)localizedSelectableRoutesPrompt;
- (NSString)localizedTitle;
- (RAPBadRouteSuggestionsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4;
- (RAPCommentQuestion)commentQuestion;
- (int)userAction;
- (int64_t)questionCategory;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setNoGoodRoutesShown:(BOOL)a3;
- (void)setSelectedRouteSuggestions:(id)a3;
@end

@implementation RAPBadRouteSuggestionsQuestion

- (NSString)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Better Route Available [Report a Problem category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (int64_t)questionCategory
{
  return 2;
}

- (int)userAction
{
  return 10102;
}

- (RAPBadRouteSuggestionsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RAPBadRouteSuggestionsQuestion;
  v4 = [(RAPQuestion *)&v8 initWithReport:a3 parentQuestion:a4];
  if (v4)
  {
    uint64_t v5 = +[NSSet set];
    selectedRouteSuggestions = v4->_selectedRouteSuggestions;
    v4->_selectedRouteSuggestions = (NSSet *)v5;
  }
  return v4;
}

+ (BOOL)_canDisplayForContext:(id)a3 selection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 displayedDirectionsPlan];
  objc_super v8 = [v7 displayedRouteSuggestions];
  if ([v8 count])
  {
    v9 = [v5 directionsHistory];
    id v10 = [v9 firstObject];
    BOOL v11 = v10 == v6;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSArray)selectableRouteSuggestions
{
  v2 = [(RAPQuestion *)self report];
  v3 = [v2 _context];
  v4 = [v3 displayedDirectionsPlan];
  id v5 = [v4 displayedRouteSuggestions];

  return (NSArray *)v5;
}

- (BOOL)_areAllSuggestionsSelectableInSet:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(RAPBadRouteSuggestionsQuestion *)self selectableRouteSuggestions];
        LODWORD(v9) = [v10 containsObject:v9];

        if (!v9)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (void)setSelectedRouteSuggestions:(id)a3
{
  if (self->_selectedRouteSuggestions != a3)
  {
    id v4 = (NSSet *)[a3 copy];
    selectedRouteSuggestions = self->_selectedRouteSuggestions;
    self->_selectedRouteSuggestions = v4;

    [(RAPQuestion *)self _didChange];
  }
}

- (BOOL)noGoodRoutesShown
{
  return self->_selectedRouteSuggestions == 0;
}

- (void)setNoGoodRoutesShown:(BOOL)a3
{
  selectedRouteSuggestions = self->_selectedRouteSuggestions;
  if (a3)
  {
    id v5 = 0;
  }
  else
  {
    if (selectedRouteSuggestions) {
      return;
    }
    id v5 = +[NSSet set];
    selectedRouteSuggestions = self->_selectedRouteSuggestions;
  }
  self->_selectedRouteSuggestions = v5;

  [(RAPQuestion *)self _didChange];
}

- (BOOL)_routeSuggestionsCanBeSubmitted
{
  v3 = [(RAPBadRouteSuggestionsQuestion *)self selectedRouteSuggestions];
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(RAPBadRouteSuggestionsQuestion *)self noGoodRoutesShown];
  }

  return v4;
}

- (BOOL)_isRecursivelyComplete
{
  v3 = [(RAPBadRouteSuggestionsQuestion *)self commentQuestion];
  if ([v3 _isRecursivelyComplete])
  {
    v6.receiver = self;
    v6.super_class = (Class)RAPBadRouteSuggestionsQuestion;
    BOOL v4 = [(RAPQuestion *)&v6 _isRecursivelyComplete];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isComplete
{
  return [(RAPBadRouteSuggestionsQuestion *)self _routeSuggestionsCanBeSubmitted];
}

- (BOOL)shouldShowCommentQuestion
{
  return [(RAPBadRouteSuggestionsQuestion *)self _routeSuggestionsCanBeSubmitted];
}

- (RAPCommentQuestion)commentQuestion
{
  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    BOOL v4 = [RAPCommentQuestion alloc];
    id v5 = [(RAPQuestion *)self report];
    objc_super v6 = +[RAPCommentQuestion _localizedInformationTitle];
    uint64_t v7 = +[NSBundle mainBundle];
    objc_super v8 = [v7 localizedStringForKey:@"Tell us more about the better route" value:@"localized string not found" table:0];
    uint64_t v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"Take a photo to help Apple verify the better route." value:@"localized string not found" table:0];
    BOOL v11 = [(RAPCommentQuestion *)v4 initWithReport:v5 parentQuestion:self title:v6 placeholderText:v8 emphasis:0 localizedPhotosPickerExplanation:v10];
    v12 = self->_commentQuestion;
    self->_commentQuestion = v11;

    commentQuestion = self->_commentQuestion;
  }

  return commentQuestion;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  [v4 setType:8];
  id v5 = [v4 commonContext];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v4 setCommonContext:v6];
  }
  uint64_t v7 = [v4 commonContext];
  [v7 addUserPath:44];

  objc_super v8 = [(RAPQuestion *)self report];
  uint64_t v9 = [(RAPQuestion *)self report];
  id v10 = [v9 _context];
  BOOL v11 = [v10 displayedDirectionsPlan];
  v12 = [v11 recording];
  [v4 addDirectionsContextWithReport:v8 recording:v12];

  id v13 = [v4 details];
  if (!v13)
  {
    id v13 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [v4 setDetails:v13];
  }
  id v14 = [v13 directionsFeedback];
  if (!v14)
  {
    id v14 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    [v13 setDirectionsFeedback:v14];
  }
  v34 = v13;
  v35 = v4;
  [v14 setCorrectionType:4];
  id v15 = [v14 directionsContext];
  if (!v15)
  {
    id v15 = objc_alloc_init((Class)GEORPDirectionsFeedbackContext);
    [v14 setDirectionsContext:v15];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(RAPBadRouteSuggestionsQuestion *)self selectedRouteSuggestions];
  id v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        v21 = self;
        v22 = [(RAPQuestion *)self report];
        v23 = [v22 _context];
        v24 = [v23 displayedDirectionsPlan];
        unsigned int v25 = [v24 getRoutesIndex:&v37 directionsResponseIndex:&v38 forRouteSuggestion:v20];

        if (v25)
        {
          id v26 = objc_alloc_init((Class)GEORPSuggestedRouteIndex);
          [v26 setDirectionsResponseIndex:v38];
          [v26 setDirectionsResponseSuggestedRoutesIndex:v37];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = [v20 rideSelections];
            [v26 setRideSelections:v27];
          }
          v28 = [v14 directionsCorrections];

          if (!v28)
          {
            id v29 = objc_alloc_init((Class)GEORPDirectionsCorrections);
            [v14 setDirectionsCorrections:v29];
          }
          v30 = [v14 directionsCorrections];
          [v30 addProblematicRouteIndex:v26];
        }
        self = v21;
      }
      id v17 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v17);
  }

  if ([(RAPBadRouteSuggestionsQuestion *)self noGoodRoutesShown])
  {
    id v31 = [v14 directionsCorrections];
    if (!v31)
    {
      id v31 = objc_alloc_init((Class)GEORPDirectionsCorrections);
      [v14 setDirectionsCorrections:v31];
    }
    [v31 setNoGoodRoutesShown:1];
  }
  v32 = [(RAPBadRouteSuggestionsQuestion *)self commentQuestion];
  [v32 _fillSubmissionParameters:v35];
}

- (NSString)localizedSelectableRoutesPrompt
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Route [Report a Problem]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSSet)selectedRouteSuggestions
{
  return self->_selectedRouteSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentQuestion, 0);

  objc_storeStrong((id *)&self->_selectedRouteSuggestions, 0);
}

@end