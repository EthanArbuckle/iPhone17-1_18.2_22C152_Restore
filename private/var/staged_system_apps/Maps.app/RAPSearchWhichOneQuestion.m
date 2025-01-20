@interface RAPSearchWhichOneQuestion
- (BOOL)_hasSearchRelatedFollowupQuestion;
- (BOOL)_isRecursivelyComplete;
- (BOOL)isComplete;
- (NSArray)selectableSearches;
- (NSString)localizedDescription;
- (NSString)localizedSelectSearchRequestPrompt;
- (NSString)localizedServerControlledDescription;
- (NSString)localizedTitle;
- (RAPMenu)followUpQuestion;
- (RAPUserSearch)selectedValue;
- (UIImage)image;
- (id)_alternateAuxiliaryControlsRecording;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setLocalizedServerControlledDescription:(id)a3;
- (void)setSelectedValue:(id)a3;
@end

@implementation RAPSearchWhichOneQuestion

- (NSString)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Search [Report a Problem category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSString)localizedDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Search issue description [Report an Issue category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (UIImage)image
{
  return +[UIImage imageNamed:@"search"];
}

- (int64_t)questionCategory
{
  return 12;
}

- (int)analyticTarget
{
  return 1128;
}

- (NSString)localizedSelectSearchRequestPrompt
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Result [Report a Problem prompt]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSArray)selectableSearches
{
  selectableSearches = self->_selectableSearches;
  if (!selectableSearches)
  {
    v4 = [(RAPQuestion *)self report];
    v5 = [v4 _context];
    v6 = [v5 searchesHistory];

    if ((unint64_t)[v6 count] >= 6)
    {
      uint64_t v7 = [v6 subarrayWithRange:0, 5];

      v6 = (void *)v7;
    }
    v8 = (NSArray *)[v6 copy];
    v9 = self->_selectableSearches;
    self->_selectableSearches = v8;

    selectableSearches = self->_selectableSearches;
  }

  return selectableSearches;
}

- (void)setSelectedValue:(id)a3
{
  v5 = (RAPUserSearch *)a3;
  if (self->_selectedValue != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedValue, a3);
    [(RAPQuestion *)self _didChange];
    v5 = v6;
  }
}

- (RAPMenu)followUpQuestion
{
  followUpQuestion = self->_followUpQuestion;
  if (!followUpQuestion)
  {
    v4 = [RAPSearchResultCategoryQuestion alloc];
    v5 = [(RAPQuestion *)self report];
    v6 = [(RAPSearchResultCategoryQuestion *)v4 initWithReport:v5 parentQuestion:self search:self->_selectedValue];
    uint64_t v7 = self->_followUpQuestion;
    self->_followUpQuestion = v6;

    followUpQuestion = self->_followUpQuestion;
  }

  return followUpQuestion;
}

- (BOOL)isComplete
{
  return self->_selectedValue != 0;
}

- (BOOL)_isRecursivelyComplete
{
  unsigned int v3 = [(RAPMenu *)self->_followUpQuestion _isRecursivelyComplete];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPSearchWhichOneQuestion;
    LOBYTE(v3) = [(RAPQuestion *)&v5 _isRecursivelyComplete];
  }
  return v3;
}

- (id)_alternateAuxiliaryControlsRecording
{
  v2 = [(RAPSearchWhichOneQuestion *)self selectedValue];
  unsigned int v3 = [v2 auxiliaryControlsRecording];

  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v39 = a3;
  v4 = [v39 commonContext];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v39 setCommonContext:v5];
  }
  if ([(RAPSearchWhichOneQuestion *)self _hasSearchRelatedFollowupQuestion])
  {
    id v6 = objc_alloc_init((Class)GEORPCorrectedSearch);
    uint64_t v7 = [(RAPSearchWhichOneQuestion *)self selectedValue];
    [v7 applyToCorrectedSearch:v6];
    v8 = [v39 details];

    if (!v8)
    {
      id v9 = objc_alloc_init((Class)GEORPFeedbackDetails);
      [v39 setDetails:v9];
    }
    v10 = [v39 details];
    v11 = [v10 searchFeedback];

    if (!v11)
    {
      id v12 = objc_alloc_init((Class)GEORPSearchFeedback);
      v13 = [v39 details];
      [v13 setSearchFeedback:v12];
    }
    v14 = [v39 details];
    v15 = [v14 searchFeedback];
    id v16 = [v15 context];

    if (!v16)
    {
      id v16 = objc_alloc_init((Class)GEORPSearchFeedbackContext);
      v17 = [v39 details];
      v18 = [v17 searchFeedback];
      [v18 setContext:v16];
    }
    v19 = [v16 requestContext];

    if (!v19)
    {
      id v20 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
      [v16 setRequestContext:v20];
    }
    v21 = [v6 placeRequest];
    v22 = [v16 requestContext];
    [v22 setPlaceRequest:v21];

    v23 = [v6 placeResponse];
    v24 = [v16 requestContext];
    [v24 setPlaceResponse:v23];

    v25 = [(RAPMenu *)self->_followUpQuestion selectedMenuItem];
    id v26 = [v25 questionCategory];

    if (v26 == (id)1) {
      unsigned int v27 = 7;
    }
    else {
      unsigned int v27 = 0;
    }
    if (v26 == (id)10) {
      uint64_t v28 = 6;
    }
    else {
      uint64_t v28 = v27;
    }
    v29 = [v39 details];
    v30 = [v29 searchFeedback];
    v31 = [v30 corrections];

    if (!v31)
    {
      id v32 = objc_alloc_init((Class)GEORPSearchFeedbackCorrections);
      v33 = [v39 details];
      v34 = [v33 searchFeedback];
      [v34 setCorrections:v32];
    }
    v35 = [v39 details];
    v36 = [v35 searchFeedback];
    v37 = [v36 corrections];
    [v37 setCorrectionType:v28];
  }
  v38 = [v39 commonContext];
  [v38 addUserPath:11];

  [(RAPMenu *)self->_followUpQuestion _fillSubmissionParameters:v39];
}

- (BOOL)_hasSearchRelatedFollowupQuestion
{
  v2 = [(RAPMenu *)self->_followUpQuestion selectedMenuItem];
  id v3 = [v2 questionCategory];

  return v3 == (id)10 || v3 == (id)1;
}

- (int)userAction
{
  return 10120;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
}

- (RAPUserSearch)selectedValue
{
  return self->_selectedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedValue, 0);
  objc_storeStrong((id *)&self->_selectableSearches, 0);
  objc_storeStrong((id *)&self->_localizedServerControlledDescription, 0);

  objc_storeStrong((id *)&self->_followUpQuestion, 0);
}

@end