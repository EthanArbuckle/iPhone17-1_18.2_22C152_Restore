@interface RAPMenuQuestion
+ (id)localizedHeaderText;
+ (id)menuForReport:(id)a3 state:(id)a4;
+ (id)menuForReport:(id)a3 state:(id)a4 onlyShowIncidents:(BOOL)a5;
- (BOOL)_isRecursivelyComplete;
- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3;
- (BOOL)isComplete;
- (BOOL)shouldShowIcons;
- (BOOL)shouldShowSubtitles;
- (NSArray)allMenuItems;
- (NSArray)mainMenuItems;
- (NSArray)mainMenuQuestionCategories;
- (NSArray)menuItems;
- (RAPMenuItem)selectedMenuItem;
- (id)_newMenuItemWithFollowUpQuestionCategory:(int64_t)a3;
- (id)followUpQuestionForCategory:(int64_t)a3;
- (id)menuItemForIndexPath:(id)a3;
- (id)menuItemWithFollowUpQuestionCategory:(int64_t)a3;
- (int)analyticTarget;
- (unint64_t)numberOfMenuItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_fillSubmissionParameters:(id)a3;
- (void)removeMenuItemForFollowUpQuestionCategory:(int64_t)a3;
- (void)resetMenu;
- (void)setMenuItems:(id)a3;
- (void)setSelectedMenuItem:(id)a3;
@end

@implementation RAPMenuQuestion

+ (id)localizedHeaderText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Issue Type [Report an Issue]" value:@"localized string not found" table:0];

  return v3;
}

- (int)analyticTarget
{
  return 603;
}

- (void)resetMenu
{
  allMenuItems = self->_allMenuItems;
  self->_allMenuItems = 0;

  menuItems = self->_menuItems;
  self->_menuItems = 0;

  mainMenuItems = self->_mainMenuItems;
  self->_mainMenuItems = 0;
}

- (unint64_t)numberOfSections
{
  v2 = [(RAPMenuQuestion *)self menuItems];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)numberOfMenuItemsInSection:(unint64_t)a3
{
  v4 = [(RAPMenuQuestion *)self menuItems];
  v5 = [v4 objectAtIndexedSubscript:a3];

  id v6 = [v5 count];
  return (unint64_t)v6;
}

- (id)menuItemForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(RAPMenuQuestion *)self menuItems];
  id v6 = [v5 objectAtIndexedSubscript:[v4 section]];

  id v7 = [v4 item];
  v8 = [v6 objectAtIndexedSubscript:v7];

  return v8;
}

- (NSArray)mainMenuItems
{
  mainMenuItems = self->_mainMenuItems;
  if (!mainMenuItems)
  {
    id v4 = +[NSMutableArray array];
    v5 = [(RAPMenuQuestion *)self mainMenuQuestionCategories];
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_1004B5798;
    v13 = &unk_1012EC5A0;
    v14 = self;
    id v15 = v4;
    id v6 = v4;
    [v5 enumerateObjectsUsingBlock:&v10];

    id v7 = [v6 copy:v10, v11, v12, v13, v14];
    v8 = self->_mainMenuItems;
    self->_mainMenuItems = v7;

    mainMenuItems = self->_mainMenuItems;
  }

  return mainMenuItems;
}

- (NSArray)mainMenuQuestionCategories
{
  mainMenuQuestionCategories = self->_mainMenuQuestionCategories;
  if (!mainMenuQuestionCategories)
  {
    self->_mainMenuQuestionCategories = (NSArray *)&__NSArray0__struct;
    mainMenuQuestionCategories = self->_mainMenuQuestionCategories;
  }

  return mainMenuQuestionCategories;
}

- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3
{
  id v4 = [(RAPMenuQuestion *)self mainMenuQuestionCategories];
  v5 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (NSArray)menuItems
{
  if (!self->_menuItems)
  {
    id v3 = [(RAPMenuQuestion *)self mainMenuItems];

    if (v3)
    {
      id v4 = [(RAPMenuQuestion *)self mainMenuItems];
      v10 = v4;
      v5 = +[NSArray arrayWithObjects:&v10 count:1];
      menuItems = self->_menuItems;
      self->_menuItems = v5;

      allMenuItems = self->_allMenuItems;
      self->_allMenuItems = 0;
    }
  }
  v8 = self->_menuItems;

  return v8;
}

- (NSArray)allMenuItems
{
  allMenuItems = self->_allMenuItems;
  if (!allMenuItems)
  {
    id v4 = +[NSMutableArray array];
    v5 = [(RAPMenuQuestion *)self menuItems];
    id v6 = [v5 count];

    if (v6)
    {
      unint64_t v7 = 0;
      do
      {
        v8 = [(RAPMenuQuestion *)self menuItems];
        v9 = [v8 objectAtIndexedSubscript:v7];
        [v4 addObjectsFromArray:v9];

        ++v7;
        v10 = [(RAPMenuQuestion *)self menuItems];
        id v11 = [v10 count];
      }
      while (v7 < (unint64_t)v11);
    }
    v12 = (NSArray *)[v4 copy];
    v13 = self->_allMenuItems;
    self->_allMenuItems = v12;

    allMenuItems = self->_allMenuItems;
  }

  return allMenuItems;
}

+ (id)menuForReport:(id)a3 state:(id)a4
{
  return [a1 menuForReport:a3 state:a4 onlyShowIncidents:0];
}

+ (id)menuForReport:(id)a3 state:(id)a4 onlyShowIncidents:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v5)
  {
    v10 = RAPMainIncidentQuestion;
  }
  else
  {
    id v11 = [v8 reportedPlace];

    if (v11)
    {
      v12 = [RAPPlaceMenuQuestion alloc];
      v13 = [v9 reportedPlace];
      v14 = [(RAPPlaceMenuQuestion *)v12 initWithReport:v7 reportedPlace:v13];

      goto LABEL_7;
    }
    v10 = RAPMainQuestion;
  }
  v14 = (RAPPlaceMenuQuestion *)[[v10 alloc] initWithReport:v7 parentQuestion:0];
LABEL_7:

  return v14;
}

- (BOOL)shouldShowIcons
{
  return 0;
}

- (BOOL)shouldShowSubtitles
{
  return 0;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  return 0;
}

- (id)menuItemWithFollowUpQuestionCategory:(int64_t)a3
{
  menuItemsByKind = self->_menuItemsByKind;
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)menuItemsByKind objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = [(RAPMenuQuestion *)self _newMenuItemWithFollowUpQuestionCategory:a3];
    if (!self->_menuItemsByKind)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v9 = self->_menuItemsByKind;
      self->_menuItemsByKind = v8;
    }
    if (v7)
    {
      v10 = self->_menuItemsByKind;
      id v11 = +[NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v10 setObject:v7 forKeyedSubscript:v11];
    }
  }

  return v7;
}

- (void)removeMenuItemForFollowUpQuestionCategory:(int64_t)a3
{
  menuItemsByKind = self->_menuItemsByKind;
  id v4 = +[NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)menuItemsByKind removeObjectForKey:v4];
}

- (id)_newMenuItemWithFollowUpQuestionCategory:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSelectedMenuItem:(id)a3
{
  BOOL v5 = (RAPMenuItem *)a3;
  if (self->_selectedMenuItem != v5)
  {
    objc_storeStrong((id *)&self->_selectedMenuItem, a3);
    [(RAPQuestion *)self _setComplete:v5 != 0 allowInvokingDidChange:0];
    [(RAPQuestion *)self _didChange];
  }
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPMenuQuestion *)self selectedMenuItem];
  [v5 _fillSubmissionParameters:v4];
}

- (BOOL)isComplete
{
  return self->_selectedMenuItem != 0;
}

- (BOOL)_isRecursivelyComplete
{
  unsigned int v3 = [(RAPMenuItem *)self->_selectedMenuItem _isRecursivelyComplete];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPMenuQuestion;
    LOBYTE(v3) = [(RAPQuestion *)&v5 _isRecursivelyComplete];
  }
  return v3;
}

- (RAPMenuItem)selectedMenuItem
{
  return self->_selectedMenuItem;
}

- (void)setMenuItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMenuItem, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_allMenuItems, 0);
  objc_storeStrong((id *)&self->_menuItemsByKind, 0);
  objc_storeStrong((id *)&self->_mainMenuQuestionCategories, 0);

  objc_storeStrong((id *)&self->_mainMenuItems, 0);
}

@end