@interface RAPSearchResultIncorrectQuestion
+ (id)localizedTitleForResultCount:(unint64_t)a3;
- (NSString)localizedTitle;
- (RAPSearchResultIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 searchResultsCount:(unint64_t)a5;
- (id)localizedPhotosPickerExplanation;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
@end

@implementation RAPSearchResultIncorrectQuestion

+ (id)localizedTitleForResultCount:(unint64_t)a3
{
  v4 = +[NSBundle mainBundle];
  v5 = v4;
  if (a3 == 1) {
    CFStringRef v6 = @"Unexpected Result [Report a Problem category]";
  }
  else {
    CFStringRef v6 = @"Unexpected Results [Report a Problem category]";
  }
  v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  return v7;
}

- (RAPSearchResultIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 searchResultsCount:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)RAPSearchResultIncorrectQuestion;
  CFStringRef v6 = [(RAPCommentQuestion *)&v13 initWithReport:a3 parentQuestion:a4];
  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() localizedTitleForResultCount:a5];
    localizedTitle = v6->_localizedTitle;
    v6->_localizedTitle = (NSString *)v7;

    v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"Submit a Photo [Report a Search Issue photos]" value:@"localized string not found" table:0];
    localizedPhotosPickerExplanation = v6->_localizedPhotosPickerExplanation;
    v6->_localizedPhotosPickerExplanation = (NSString *)v10;
  }
  return v6;
}

- (int64_t)questionCategory
{
  return 10;
}

- (int)analyticTarget
{
  return 1129;
}

- (int)userAction
{
  return 10120;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (id)localizedPhotosPickerExplanation
{
  return self->_localizedPhotosPickerExplanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedPhotosPickerExplanation, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end