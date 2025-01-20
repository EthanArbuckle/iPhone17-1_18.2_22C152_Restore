@interface RAPArrivalTimeIncorrectQuestion
- (NSString)localizedTitle;
- (RAPArrivalTimeIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
- (void)_fillSubmissionParameters:(id)a3;
@end

@implementation RAPArrivalTimeIncorrectQuestion

- (NSString)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Estimated Time of Arrival [Report an Issue category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (RAPArrivalTimeIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Information [Report a Problem]" value:@"localized string not found" table:0];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Tell us more about how the arrival time was incorrect [Report an Issue]" value:@"localized string not found" table:0];
  v14.receiver = self;
  v14.super_class = (Class)RAPArrivalTimeIncorrectQuestion;
  v12 = [(RAPCommentQuestion *)&v14 initWithReport:v7 parentQuestion:v6 title:v9 placeholderText:v11 emphasis:3];

  return v12;
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
  id v7 = [v4 commonContext];
  [v7 addUserPath:45];

  [v4 setType:8];
  v8 = [v4 details];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [v4 setDetails:v9];
  }
  v10 = [v4 details];
  v11 = [v10 directionsFeedback];

  if (!v11)
  {
    id v12 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    v13 = [v4 details];
    [v13 setDirectionsFeedback:v12];
  }
  objc_super v14 = [v4 details];
  v15 = [v14 directionsFeedback];
  [v15 setCorrectionType:5];

  v16.receiver = self;
  v16.super_class = (Class)RAPArrivalTimeIncorrectQuestion;
  [(RAPCommentQuestion *)&v16 _fillSubmissionParameters:v4];
}

- (int)analyticTarget
{
  return 1104;
}

- (int)userAction
{
  return 10104;
}

- (int64_t)questionCategory
{
  return 3;
}

@end