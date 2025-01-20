@interface RAPStationClosureQuestion
- (BOOL)_isRecursivelyComplete;
- (id)commentQuestion;
- (id)localizedTitle;
- (id)selectableIssues;
- (int)analyticTarget;
- (void)_fillSubmissionParameters:(id)a3;
@end

@implementation RAPStationClosureQuestion

- (id)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Station Closed [Report an Issue category]" value:@"localized string not found" table:0];

  return v3;
}

- (int)analyticTarget
{
  return 1111;
}

- (id)selectableIssues
{
  selectableIssues = self->super._selectableIssues;
  if (!selectableIssues)
  {
    v4 = [RAPPlaceClosureIssue alloc];
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"Closed Permanently [Report an Issue]" value:@"localized string not found" table:0];
    id v7 = [(RAPPlaceClosureIssue *)v4 _initWithKind:0 localizedName:v6];
    v15[0] = v7;
    v8 = [RAPPlaceClosureIssue alloc];
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"Closed Temporarily [Report an Issue]" value:@"localized string not found" table:0];
    id v11 = [(RAPPlaceClosureIssue *)v8 _initWithKind:1 localizedName:v10];
    v15[1] = v11;
    v12 = +[NSArray arrayWithObjects:v15 count:2];
    v13 = self->super._selectableIssues;
    self->super._selectableIssues = v12;

    selectableIssues = self->super._selectableIssues;
  }

  return selectableIssues;
}

- (id)commentQuestion
{
  commentQuestion = self->super._commentQuestion;
  if (!commentQuestion)
  {
    v4 = [RAPCommentQuestion alloc];
    v5 = [(RAPQuestion *)self report];
    v6 = +[RAPCommentQuestion _localizedInformationTitle];
    id v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Tell us more about this station closure" value:@"localized string not found" table:0];
    v9 = [(RAPCommentQuestion *)v4 initWithReport:v5 parentQuestion:self title:v6 placeholderText:v8 emphasis:2];
    v10 = self->super._commentQuestion;
    self->super._commentQuestion = v9;

    commentQuestion = self->super._commentQuestion;
  }

  return commentQuestion;
}

- (BOOL)_isRecursivelyComplete
{
  v5.receiver = self;
  v5.super_class = (Class)RAPStationClosureQuestion;
  BOOL v3 = [(RAPQuestion *)&v5 _isRecursivelyComplete];
  if (v3) {
    LOBYTE(v3) = [(RAPQuestion *)self->super._commentQuestion _isRecursivelyComplete];
  }
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v20 = a3;
  [(RAPPlaceClosureQuestion *)self _setupSubmissionParameters:v20];
  v4 = [v20 details];
  objc_super v5 = [v4 transitPoiFeedback];

  if (!v5)
  {
    v6 = objc_opt_new();
    id v7 = [v20 details];
    [v7 setTransitPoiFeedback:v6];
  }
  v8 = [v20 details];
  v9 = [v8 transitPoiFeedback];
  v10 = [v9 corrections];

  if (!v10)
  {
    id v11 = objc_opt_new();
    v12 = [v20 details];
    v13 = [v12 transitPoiFeedback];
    [v13 setCorrections:v11];
  }
  v14 = [v20 details];
  v15 = [v14 transitPoiFeedback];
  [v15 setCorrectionType:1];

  v16 = [v20 details];
  v17 = [v16 transitPoiFeedback];
  v18 = [v17 corrections];
  v19 = [(RAPPlaceClosureQuestion *)self _geoBusinessHours];
  [v18 addBusinessHours:v19];
}

@end