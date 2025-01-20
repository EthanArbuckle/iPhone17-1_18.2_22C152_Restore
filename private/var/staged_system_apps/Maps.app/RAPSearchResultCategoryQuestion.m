@interface RAPSearchResultCategoryQuestion
+ (id)localizedHeaderText;
- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3;
- (RAPSearchResultCategoryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 search:(id)a5;
- (RAPUserSearch)selectedValue;
- (id)followUpQuestionForCategory:(int64_t)a3;
- (id)mainMenuQuestionCategories;
- (id)selectedPlace;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
- (void)resetCachedMenuItems;
@end

@implementation RAPSearchResultCategoryQuestion

- (RAPSearchResultCategoryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 search:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPSearchResultCategoryQuestion;
  v10 = [(RAPQuestion *)&v13 initWithReport:a3 parentQuestion:v8];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_selectedValue, a5);
    [v8 addObserver:v11 changeHandler:&stru_1012E8E90];
  }

  return v11;
}

+ (id)localizedHeaderText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Search issue [Report a Problem prompt]" value:@"localized string not found" table:0];

  return v3;
}

- (int)analyticTarget
{
  return 1128;
}

- (int)userAction
{
  return 10120;
}

- (int64_t)questionCategory
{
  return 10;
}

- (void)resetCachedMenuItems
{
  [(RAPMenuQuestion *)self removeMenuItemForFollowUpQuestionCategory:10];
  [(RAPMenuQuestion *)self removeMenuItemForFollowUpQuestionCategory:9];

  [(RAPMenuQuestion *)self resetMenu];
}

- (id)mainMenuQuestionCategories
{
  mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  if (!mainMenuQuestionCategories)
  {
    self->super._mainMenuQuestionCategories = (NSArray *)&off_1013AD548;
    mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  }

  return mainMenuQuestionCategories;
}

- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3
{
  v5 = [(RAPQuestion *)self parentQuestion];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 selectedValue];

  if (v8)
  {
    if (a3 == 9)
    {
      v12 = [v7 selectedValue];
      id v13 = [v12 searchResultsCount];

      unsigned __int8 v11 = v13 == (id)1;
    }
    else if (a3 == 10)
    {
      id v9 = [v7 selectedValue];
      id v10 = [v9 searchResultsCount];

      unsigned __int8 v11 = v10 != 0;
    }
    else
    {
      v14 = [(RAPSearchResultCategoryQuestion *)self mainMenuQuestionCategories];
      v15 = +[NSNumber numberWithInteger:a3];
      unsigned __int8 v11 = [v14 containsObject:v15];
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      unsigned __int8 v11 = [RAPProblemNotListedQuestion alloc];
      id v8 = [(RAPQuestion *)self report];
      v12 = +[NSBundle mainBundle];
      id v13 = [v12 localizedStringForKey:@"Other [Report an Issue subcategory]" value:@"localized string not found" table:0];
      id v10 = [(RAPProblemNotListedQuestion *)v11 initWithReport:v8 parentQuestion:self localizedTitle:v13];

LABEL_10:
      goto LABEL_12;
    case 9:
      v14 = [RAPPlaceClosureQuestion alloc];
      id v8 = [(RAPQuestion *)self report];
      id v10 = [(RAPQuestion *)v14 initWithReport:v8 parentQuestion:self];
      goto LABEL_10;
    case 10:
      v4 = [(RAPQuestion *)self parentQuestion];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
      id v6 = v5;

      id v7 = [RAPSearchResultIncorrectQuestion alloc];
      id v8 = [(RAPQuestion *)self report];
      id v9 = [v6 selectedValue];

      id v10 = -[RAPSearchResultIncorrectQuestion initWithReport:parentQuestion:searchResultsCount:](v7, "initWithReport:parentQuestion:searchResultsCount:", v8, self, [v9 searchResultsCount]);
      goto LABEL_10;
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)selectedPlace
{
  v2 = [(RAPQuestion *)self parentQuestion];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  v5 = [v4 selectedValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 geoMapItemForSearchResultAtIndex:0];

  id v9 = [[SearchResult alloc] initWithGEOMapItem:v8];

  return v9;
}

- (RAPUserSearch)selectedValue
{
  return self->_selectedValue;
}

- (void).cxx_destruct
{
}

@end