@interface RAPPlaceClosureQuestion
- (BOOL)isComplete;
- (NSArray)selectableIssues;
- (NSString)localizedSelectableIssueLabel;
- (NSString)localizedTitle;
- (RAPCommentQuestion)commentQuestion;
- (RAPPlaceClosureIssue)selectedIssue;
- (id)_geoBusinessHours;
- (int)analyticTarget;
- (int)closureTypeAction;
- (int)userAction;
- (int64_t)questionCategory;
- (void)_captureAnalytics;
- (void)_fillSubmissionParameters:(id)a3;
- (void)_setupSubmissionParameters:(id)a3;
- (void)setSelectedIssue:(id)a3;
@end

@implementation RAPPlaceClosureQuestion

- (NSString)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Place Closed [Report an Issue category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSString)localizedSelectableIssueLabel
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Issue [Report an Issue]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (int)analyticTarget
{
  return 1143;
}

- (int64_t)questionCategory
{
  return 9;
}

- (NSArray)selectableIssues
{
  selectableIssues = self->_selectableIssues;
  if (!selectableIssues)
  {
    v4 = [RAPPlaceClosureIssue alloc];
    v18 = +[NSBundle mainBundle];
    v5 = [v18 localizedStringForKey:@"Closed Permanently [Report an Issue]" value:@"localized string not found" table:0];
    id v6 = [(RAPPlaceClosureIssue *)v4 _initWithKind:0 localizedName:v5];
    v19[0] = v6;
    v7 = [RAPPlaceClosureIssue alloc];
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Closed Temporarily [Report an Issue]" value:@"localized string not found" table:0];
    id v10 = [(RAPPlaceClosureIssue *)v7 _initWithKind:1 localizedName:v9];
    v19[1] = v10;
    v11 = [RAPPlaceClosureIssue alloc];
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"Hours Changed [Report an Issue]" value:@"localized string not found" table:0];
    id v14 = [(RAPPlaceClosureIssue *)v11 _initWithKind:2 localizedName:v13];
    v19[2] = v14;
    v15 = +[NSArray arrayWithObjects:v19 count:3];
    v16 = self->_selectableIssues;
    self->_selectableIssues = v15;

    selectableIssues = self->_selectableIssues;
  }

  return selectableIssues;
}

- (void)setSelectedIssue:(id)a3
{
  v11 = (RAPPlaceClosureIssue *)a3;
  if (self->_selectedIssue != v11)
  {
    objc_storeStrong((id *)&self->_selectedIssue, a3);
    id v5 = [(RAPPlaceClosureIssue *)v11 kind];
    commentQuestion = self->_commentQuestion;
    v7 = +[NSBundle mainBundle];
    v8 = v7;
    if (v5 == (id)2) {
      CFStringRef v9 = @"Tell us more about the new hours";
    }
    else {
      CFStringRef v9 = @"Tell us more about this closure";
    }
    id v10 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];
    [(RAPCommentQuestion *)commentQuestion _setPlaceholderText:v10];

    [(RAPQuestion *)self _didChange];
    [(RAPPlaceClosureQuestion *)self _captureAnalytics];
  }
}

- (void)_captureAnalytics
{
  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:[self closureTypeAction] onTarget:[self analyticTarget] eventValue:0];
}

- (int)closureTypeAction
{
  v2 = [(RAPPlaceClosureQuestion *)self selectedIssue];
  id v3 = [v2 kind];

  if (v3 == (id)1) {
    int v4 = 10135;
  }
  else {
    int v4 = 10134;
  }
  if (v3 == (id)2) {
    return 10136;
  }
  else {
    return v4;
  }
}

- (RAPCommentQuestion)commentQuestion
{
  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    int v4 = [RAPCommentQuestion alloc];
    id v5 = [(RAPQuestion *)self report];
    id v6 = +[RAPCommentQuestion _localizedOptionalInformationTitle];
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Tell us more about this closure" value:@"localized string not found" table:0];
    CFStringRef v9 = [(RAPCommentQuestion *)v4 initWithReport:v5 parentQuestion:self title:v6 placeholderText:v8 emphasis:5];
    id v10 = self->_commentQuestion;
    self->_commentQuestion = v9;

    commentQuestion = self->_commentQuestion;
  }

  return commentQuestion;
}

- (BOOL)isComplete
{
  v2 = [(RAPPlaceClosureQuestion *)self selectedIssue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v12 = a3;
  [(RAPPlaceClosureQuestion *)self _setupSubmissionParameters:v12];
  int v4 = [v12 details];
  id v5 = [v4 poiFeedback];

  if (!v5)
  {
    id v5 = objc_alloc_init((Class)GEORPPoiFeedback);
    id v6 = [v12 details];
    [v6 setPoiFeedback:v5];
  }
  v7 = [v5 corrections];

  if (!v7)
  {
    v8 = objc_opt_new();
    [v5 setCorrections:v8];
  }
  [v5 setCorrectionType:2];
  CFStringRef v9 = [v5 corrections];
  id v10 = [(RAPPlaceClosureQuestion *)self _geoBusinessHours];
  [v9 addBusinessHours:v10];

  v11 = [(RAPPlaceClosureQuestion *)self commentQuestion];
  [v11 _fillSubmissionParameters:v12];
}

- (void)_setupSubmissionParameters:(id)a3
{
  id v10 = a3;
  int v4 = [v10 commonContext];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v10 setCommonContext:v5];
  }
  id v6 = [v10 commonContext];
  [v6 addUserPath:9];

  v7 = [v10 details];

  if (!v7)
  {
    v8 = objc_opt_new();
    [v10 setDetails:v8];
  }
  CFStringRef v9 = [(RAPPlaceClosureQuestion *)self commentQuestion];
  [v9 _fillSubmissionParameters:v10];
}

- (id)_geoBusinessHours
{
  id v3 = objc_alloc_init((Class)GEORPFeedbackBusinessHours);
  int v4 = [(RAPPlaceClosureQuestion *)self selectedIssue];
  id v5 = [v4 kind];

  if ((unint64_t)v5 <= 2) {
    [v3 setHoursType:(4 - v5)];
  }

  return v3;
}

- (int)userAction
{
  return 10133;
}

- (RAPPlaceClosureIssue)selectedIssue
{
  return self->_selectedIssue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIssue, 0);
  objc_storeStrong((id *)&self->_selectableIssues, 0);

  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end