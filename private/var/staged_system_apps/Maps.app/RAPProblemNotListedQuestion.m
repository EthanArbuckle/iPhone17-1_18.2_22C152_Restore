@interface RAPProblemNotListedQuestion
- (NSString)localizedDescription;
- (NSString)localizedServerControlledDescription;
- (NSString)localizedTitle;
- (RAPProblemNotListedQuestion)initWithReport:(id)a3 parentQuestion:(id)a4;
- (RAPProblemNotListedQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 localizedTitle:(id)a5;
- (UIImage)image;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setLocalizedServerControlledDescription:(id)a3;
@end

@implementation RAPProblemNotListedQuestion

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Other Issue description [Report an Issue category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (UIImage)image
{
  v2 = +[UIColor systemBlueColor];
  v10[0] = v2;
  v3 = +[UIColor systemLightGrayColor];
  v10[1] = v3;
  v4 = +[NSArray arrayWithObjects:v10 count:2];
  v5 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v4];
  v6 = +[UIImage systemImageNamed:@"ellipsis.circle.fill" withConfiguration:v5];

  v7 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:26.0];
  v8 = [v6 imageByApplyingSymbolConfiguration:v7];

  return (UIImage *)v8;
}

- (int64_t)questionCategory
{
  return 1;
}

- (int)analyticTarget
{
  return 1135;
}

- (RAPProblemNotListedQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 localizedTitle:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"Information [Report a Problem]" value:@"localized string not found" table:0];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"Describe the issue [Report an Issue]" value:@"localized string not found" table:0];
  v18.receiver = self;
  v18.super_class = (Class)RAPProblemNotListedQuestion;
  v16 = [(RAPCommentQuestion *)&v18 initWithReport:v11 parentQuestion:v10 title:v13 placeholderText:v15 emphasis:2];

  if (v16) {
    objc_storeStrong((id *)&v16->_localizedTitle, a5);
  }

  return v16;
}

- (RAPProblemNotListedQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"Other Issue [Report an Issue category]" value:@"localized string not found" table:0];
  id v10 = [(RAPProblemNotListedQuestion *)self initWithReport:v7 parentQuestion:v6 localizedTitle:v9];

  return v10;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  [v4 setFeedbackType];
  v5.receiver = self;
  v5.super_class = (Class)RAPProblemNotListedQuestion;
  [(RAPCommentQuestion *)&v5 _fillSubmissionParameters:v4];
}

- (int)userAction
{
  return 10124;
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

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end