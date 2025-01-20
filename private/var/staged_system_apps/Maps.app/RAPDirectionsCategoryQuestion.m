@interface RAPDirectionsCategoryQuestion
+ (id)localizedHeaderText;
- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3;
- (BOOL)shouldShowBetterRouteAvailable;
- (RAPDirectionsCategoryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 directions:(id)a5;
- (RAPMenuItem)betterRouteAvailableMenuItem;
- (RAPUserDirectionRequest)selectedValue;
- (id)followUpQuestionForCategory:(int64_t)a3;
- (id)mainMenuQuestionCategories;
- (int)analyticTarget;
- (int64_t)questionCategory;
- (void)resetBadRouteSuggestionsQuestion;
@end

@implementation RAPDirectionsCategoryQuestion

- (RAPDirectionsCategoryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 directions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPDirectionsCategoryQuestion;
  v10 = [(RAPQuestion *)&v13 initWithReport:a3 parentQuestion:v8];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_selectedValue, a5);
    [v8 addObserver:v11 changeHandler:&stru_1012F8E08];
  }

  return v11;
}

+ (id)localizedHeaderText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Issue with [Report a Problem prompt]" value:@"localized string not found" table:0];

  return v3;
}

- (int)analyticTarget
{
  return 1100;
}

- (int64_t)questionCategory
{
  return 5;
}

- (void)resetBadRouteSuggestionsQuestion
{
  betterRouteAvailableMenuItem = self->_betterRouteAvailableMenuItem;
  self->_betterRouteAvailableMenuItem = 0;
}

- (id)mainMenuQuestionCategories
{
  mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  if (!mainMenuQuestionCategories)
  {
    self->super._mainMenuQuestionCategories = (NSArray *)&off_1013ADFC8;
    mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  }

  return mainMenuQuestionCategories;
}

- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3
{
  selectedValue = self->_selectedValue;
  if (!selectedValue) {
    return (char)selectedValue;
  }
  if (a3 == 4)
  {
    LOBYTE(selectedValue) = [(RAPUserDirectionRequest *)selectedValue requestedTransportType] != 1;
    return (char)selectedValue;
  }
  if (a3 == 3)
  {
    LODWORD(selectedValue) = sub_1005228DC();
    if (!selectedValue) {
      return (char)selectedValue;
    }
LABEL_10:
    v6 = [(RAPDirectionsCategoryQuestion *)self mainMenuQuestionCategories];
    v7 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v8 = [v6 containsObject:v7];

    LOBYTE(selectedValue) = v8;
    return (char)selectedValue;
  }
  if (a3 != 2) {
    goto LABEL_10;
  }

  LOBYTE(selectedValue) = [(RAPDirectionsCategoryQuestion *)self shouldShowBetterRouteAvailable];
  return (char)selectedValue;
}

- (BOOL)shouldShowBetterRouteAvailable
{
  v2 = self;
  v3 = [(RAPQuestion *)self _context];
  LOBYTE(v2) = +[RAPBadRouteSuggestionsQuestion _canDisplayForContext:v3 selection:v2->_selectedValue];

  return (char)v2;
}

- (RAPMenuItem)betterRouteAvailableMenuItem
{
  betterRouteAvailableMenuItem = self->_betterRouteAvailableMenuItem;
  if (!betterRouteAvailableMenuItem)
  {
    v4 = [(RAPMenuQuestion *)self menuItemWithFollowUpQuestionCategory:2];
    v5 = self->_betterRouteAvailableMenuItem;
    self->_betterRouteAvailableMenuItem = v4;

    betterRouteAvailableMenuItem = self->_betterRouteAvailableMenuItem;
  }

  return betterRouteAvailableMenuItem;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 1:
      v5 = [RAPProblemNotListedQuestion alloc];
      v6 = [(RAPQuestion *)self report];
      v7 = +[NSBundle mainBundle];
      unsigned __int8 v8 = [v7 localizedStringForKey:@"Other [Report an Issue subcategory]" value:@"localized string not found" table:0];
      v3 = [(RAPProblemNotListedQuestion *)v5 initWithReport:v6 parentQuestion:self localizedTitle:v8];

      goto LABEL_10;
    case 2:
      id v9 = RAPBadRouteSuggestionsQuestion;
      goto LABEL_5;
    case 3:
      id v9 = RAPArrivalTimeIncorrectQuestion;
LABEL_5:
      id v10 = [v9 alloc];
      v6 = [(RAPQuestion *)self report];
      v11 = (RAPDirectionInstructionsIncorrectQuestion *)[v10 initWithReport:v6 parentQuestion:self];
      goto LABEL_12;
    case 4:
      v12 = [(RAPQuestion *)self parentQuestion];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v13 = v12;
      }
      else {
        objc_super v13 = 0;
      }
      id v14 = v13;

      v6 = [v14 routeFromRecording];

      [v6 pointAt:[v6 pointCount] - 1];
      CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v15, v16);
      v18 = [RAPArrivalEntryPointIncorrectQuestion alloc];
      v7 = [(RAPQuestion *)self report];
      v3 = -[RAPArrivalEntryPointIncorrectQuestion initWithReport:parentQuestion:arrivalPoint:](v18, "initWithReport:parentQuestion:arrivalPoint:", v7, self, v17.latitude, v17.longitude);
LABEL_10:

      goto LABEL_13;
    case 6:
      v19 = [RAPDirectionInstructionsIncorrectQuestion alloc];
      v6 = [(RAPQuestion *)self report];
      v11 = [(RAPDirectionInstructionsIncorrectQuestion *)v19 initWithReport:v6 parentQuestion:self direction:self->_selectedValue];
LABEL_12:
      v3 = (RAPProblemNotListedQuestion *)v11;
LABEL_13:

      break;
    default:
      break;
  }

  return v3;
}

- (RAPUserDirectionRequest)selectedValue
{
  return self->_selectedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betterRouteAvailableMenuItem, 0);

  objc_storeStrong((id *)&self->_selectedValue, 0);
}

@end