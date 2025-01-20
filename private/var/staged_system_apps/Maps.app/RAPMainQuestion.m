@interface RAPMainQuestion
+ (id)localizedHeaderText;
- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3;
- (BOOL)shouldShowIcons;
- (BOOL)shouldShowSubtitles;
- (NSArray)homeWorkMenuItems;
- (NSArray)incidentMenuItems;
- (RAPMenuItem)otherIssueMenuItem;
- (id)_alternateMapViewContext;
- (id)_incidentQuestionsFromLayoutItems:(id)a3;
- (id)_questionsFromLayoutItems:(id)a3;
- (id)followUpQuestionForCategory:(int64_t)a3;
- (id)mainMenuQuestionCategories;
- (id)menuItems;
- (int)analyticTarget;
- (void)_fillSubmissionParameters:(id)a3;
- (void)resetMenu;
- (void)setHomeWorkMenuItems:(id)a3;
- (void)setIncidentMenuItems:(id)a3;
- (void)setOtherIssueMenuItem:(id)a3;
- (void)updateCategoriesFromLayoutManager:(id)a3;
@end

@implementation RAPMainQuestion

- (void)updateCategoriesFromLayoutManager:(id)a3
{
  id v4 = a3;
  v5 = [v4 correctionLayoutItems];
  v6 = [(RAPMainQuestion *)self _questionsFromLayoutItems:v5];
  mainMenuItems = self->super._mainMenuItems;
  self->super._mainMenuItems = v6;

  v8 = [v4 addPlaceLayoutItems];
  v9 = [(RAPMainQuestion *)self _questionsFromLayoutItems:v8];
  homeWorkMenuItems = self->_homeWorkMenuItems;
  self->_homeWorkMenuItems = v9;

  v11 = [v4 incidentLayoutItems];
  v12 = [(RAPMainQuestion *)self _incidentQuestionsFromLayoutItems:v11];
  incidentMenuItems = self->_incidentMenuItems;
  self->_incidentMenuItems = v12;

  v14 = [v4 otherLayoutItems];

  v15 = [(RAPMainQuestion *)self _questionsFromLayoutItems:v14];
  v16 = [v15 firstObject];
  otherIssueMenuItem = self->_otherIssueMenuItem;
  self->_otherIssueMenuItem = v16;

  id v18 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSArray *)self->super._mainMenuItems count]) {
    [v18 addObject:self->super._mainMenuItems];
  }
  if ([(NSArray *)self->_incidentMenuItems count]) {
    [v18 addObject:self->_incidentMenuItems];
  }
  if ([(NSArray *)self->_homeWorkMenuItems count]) {
    [v18 addObject:self->_homeWorkMenuItems];
  }
  if (self->_otherIssueMenuItem)
  {
    v22 = self->_otherIssueMenuItem;
    v19 = +[NSArray arrayWithObjects:&v22 count:1];
    [v18 addObject:v19];
  }
  v20 = (NSArray *)[v18 copy];
  menuItems = self->super._menuItems;
  self->super._menuItems = v20;
}

- (id)_incidentQuestionsFromLayoutItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = [RAPIncidentsQuestion alloc];
        v13 = [(RAPQuestion *)self report];
        v14 = [(RAPIncidentsQuestion *)v12 initWithReport:v13 parentQuestion:self incidentLayoutItem:v11];

        [v5 addObjectIfNotNil:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = [v5 copy];

  return v15;
}

- (id)_questionsFromLayoutItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 fieldType:v17];
        v13 = -[RAPMenuQuestion menuItemWithFollowUpQuestionCategory:](self, "menuItemWithFollowUpQuestionCategory:", [v12 integerValue]);

        v14 = [v11 displayText];
        [v13 setLocalizedServerControlledDescription:v14];

        [v5 addObjectIfNotNil:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = [v5 copy];

  return v15;
}

- (id)mainMenuQuestionCategories
{
  mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  if (!mainMenuQuestionCategories)
  {
    self->super._mainMenuQuestionCategories = (NSArray *)&off_1013AD638;
    mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  }

  return mainMenuQuestionCategories;
}

- (int)analyticTarget
{
  return 603;
}

+ (id)localizedHeaderText
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___RAPMainQuestion;
  v2 = [super localizedHeaderText];

  return v2;
}

- (BOOL)shouldShowIcons
{
  return 1;
}

- (BOOL)shouldShowSubtitles
{
  return 1;
}

- (id)menuItems
{
  menuItems = self->super._menuItems;
  if (!menuItems)
  {
    objc_super v4 = +[NSMutableArray arrayWithCapacity:3];
    id v5 = [(RAPMenuQuestion *)self mainMenuItems];
    [v4 addObject:v5];

    id v6 = [(RAPMainQuestion *)self homeWorkMenuItems];
    if ([v6 count]) {
      [v4 addObject:v6];
    }
    id v7 = [(RAPMainQuestion *)self incidentMenuItems];
    if ([v7 count]) {
      [v4 addObject:v7];
    }
    id v8 = [(RAPMainQuestion *)self otherIssueMenuItem];
    v14 = v8;
    uint64_t v9 = +[NSArray arrayWithObjects:&v14 count:1];
    [v4 addObject:v9];

    v10 = (NSArray *)[v4 copy];
    uint64_t v11 = self->super._menuItems;
    self->super._menuItems = v10;

    allMenuItems = self->super._allMenuItems;
    self->super._allMenuItems = 0;

    menuItems = self->super._menuItems;
  }

  return menuItems;
}

- (NSArray)homeWorkMenuItems
{
  homeWorkMenuItems = self->_homeWorkMenuItems;
  if (!homeWorkMenuItems)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = [(RAPQuestion *)self _context];
    id v6 = [v5 homeShortcuts];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = [(RAPMenuQuestion *)self menuItemWithFollowUpQuestionCategory:16];
      [v4 addObjectIfNotNil:v8];
    }
    uint64_t v9 = [(RAPQuestion *)self _context];
    v10 = [v9 workShortcuts];
    id v11 = [v10 count];

    if (v11)
    {
      v12 = [(RAPMenuQuestion *)self menuItemWithFollowUpQuestionCategory:17];
      [v4 addObjectIfNotNil:v12];
    }
    v13 = [(RAPQuestion *)self _context];
    v14 = [v13 schoolShortcuts];
    id v15 = [v14 count];

    if (v15)
    {
      v16 = [(RAPMenuQuestion *)self menuItemWithFollowUpQuestionCategory:18];
      [v4 addObjectIfNotNil:v16];
    }
    long long v17 = (NSArray *)[v4 copy];
    long long v18 = self->_homeWorkMenuItems;
    self->_homeWorkMenuItems = v17;

    homeWorkMenuItems = self->_homeWorkMenuItems;
  }

  return homeWorkMenuItems;
}

- (NSArray)incidentMenuItems
{
  return self->_incidentMenuItems;
}

- (RAPMenuItem)otherIssueMenuItem
{
  otherIssueMenuItem = self->_otherIssueMenuItem;
  if (!otherIssueMenuItem)
  {
    id v4 = [(RAPMenuQuestion *)self menuItemWithFollowUpQuestionCategory:1];
    id v5 = self->_otherIssueMenuItem;
    self->_otherIssueMenuItem = v4;

    otherIssueMenuItem = self->_otherIssueMenuItem;
  }

  return otherIssueMenuItem;
}

- (void)resetMenu
{
  v5.receiver = self;
  v5.super_class = (Class)RAPMainQuestion;
  [(RAPMenuQuestion *)&v5 resetMenu];
  homeWorkMenuItems = self->_homeWorkMenuItems;
  self->_homeWorkMenuItems = 0;

  otherIssueMenuItem = self->_otherIssueMenuItem;
  self->_otherIssueMenuItem = 0;

  [(RAPQuestion *)self _didChange];
}

- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3
{
  objc_super v5 = [(RAPQuestion *)self report];
  id v6 = [v5 _context];

  if (a3 == 7)
  {
    id v7 = [(RAPQuestion *)self _context];
    unsigned __int8 v8 = +[RAPDirectionsWhichOneQuestion _canDisplayForContext:v7 transportMode:0xFFFFFFFLL];
  }
  else if (a3 == 12)
  {
    if (!sub_100522540())
    {
      unsigned __int8 v8 = 0;
      goto LABEL_8;
    }
    id v7 = [v6 searchesHistory];
    unsigned __int8 v8 = [v7 count] != 0;
  }
  else
  {
    id v7 = [(RAPMainQuestion *)self mainMenuQuestionCategories];
    uint64_t v9 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v8 = [v7 containsObject:v9];
  }
LABEL_8:

  return v8;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 1:
      v14 = RAPProblemNotListedQuestion;
      goto LABEL_10;
    case 7:
      v14 = RAPDirectionsWhichOneQuestion;
      goto LABEL_10;
    case 8:
      v14 = RAPLabelCorrectionsQuestion;
      goto LABEL_10;
    case 12:
      v14 = RAPSearchWhichOneQuestion;
LABEL_10:
      id v15 = [v14 alloc];
      id v6 = [(RAPQuestion *)self report];
      v13 = (RAPPersonalPlaceCorrectionsWhichOneQuestion *)[v15 initWithReport:v6 parentQuestion:self];
      goto LABEL_11;
    case 13:
    case 16:
      objc_super v5 = [RAPPersonalPlaceCorrectionsWhichOneQuestion alloc];
      id v6 = [(RAPQuestion *)self report];
      id v7 = v5;
      unsigned __int8 v8 = v6;
      uint64_t v9 = self;
      uint64_t v10 = 2;
      goto LABEL_5;
    case 14:
    case 17:
      id v11 = [RAPPersonalPlaceCorrectionsWhichOneQuestion alloc];
      id v6 = [(RAPQuestion *)self report];
      id v7 = v11;
      unsigned __int8 v8 = v6;
      uint64_t v9 = self;
      uint64_t v10 = 3;
      goto LABEL_5;
    case 15:
    case 18:
      v12 = [RAPPersonalPlaceCorrectionsWhichOneQuestion alloc];
      id v6 = [(RAPQuestion *)self report];
      id v7 = v12;
      unsigned __int8 v8 = v6;
      uint64_t v9 = self;
      uint64_t v10 = 5;
LABEL_5:
      v13 = [(RAPPersonalPlaceCorrectionsWhichOneQuestion *)v7 initWithReport:v8 parentQuestion:v9 shortcutType:v10];
LABEL_11:
      v3 = v13;

      break;
    default:
      break;
  }

  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v15 = a3;
  id v4 = [(RAPQuestion *)self parentQuestion];
  [v4 _fillSubmissionParameters:v15];

  objc_super v5 = [v15 commonContext];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v15 setCommonContext:v6];
  }
  id v7 = [(RAPQuestion *)self _context];
  unsigned __int8 v8 = [v7 displayedDirectionsPlan];

  if (v8)
  {
    uint64_t v9 = [v15 commonContext];
    uint64_t v10 = v9;
    uint64_t v11 = 17;
  }
  else
  {
    v12 = [(RAPQuestion *)self _context];
    v13 = [v12 currentDirections];

    uint64_t v9 = [v15 commonContext];
    uint64_t v10 = v9;
    if (v13) {
      uint64_t v11 = 16;
    }
    else {
      uint64_t v11 = 2;
    }
  }
  [v9 addUserPath:v11];

  v14 = [(RAPMenuQuestion *)self selectedMenuItem];
  [v14 _fillSubmissionParameters:v15];
}

- (id)_alternateMapViewContext
{
  v2 = [(RAPMenuQuestion *)self selectedMenuItem];
  v3 = [v2 _alternateMapViewContext];

  return v3;
}

- (void)setHomeWorkMenuItems:(id)a3
{
}

- (void)setIncidentMenuItems:(id)a3
{
}

- (void)setOtherIssueMenuItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherIssueMenuItem, 0);
  objc_storeStrong((id *)&self->_incidentMenuItems, 0);
  objc_storeStrong((id *)&self->_homeWorkMenuItems, 0);

  objc_storeStrong((id *)&self->_homeWorkCategories, 0);
}

@end