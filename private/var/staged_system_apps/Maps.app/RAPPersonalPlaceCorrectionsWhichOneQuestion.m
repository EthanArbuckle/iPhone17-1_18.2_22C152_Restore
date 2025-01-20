@interface RAPPersonalPlaceCorrectionsWhichOneQuestion
- (BOOL)_isRecursivelyComplete;
- (NSString)localizedDescription;
- (NSString)localizedServerControlledDescription;
- (NSString)localizedTitle;
- (RAPPersonalPlaceCorrectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcutType:(int64_t)a5;
- (UIImage)image;
- (int)userAction;
- (int64_t)questionCategory;
- (int64_t)shortcutType;
- (void)_createQuestionsFromShortcuts:(id)a3;
- (void)_fillSubmissionParameters:(id)a3;
- (void)refreshMainMenuItemsWithCallback:(id)a3;
- (void)setLocalizedServerControlledDescription:(id)a3;
@end

@implementation RAPPersonalPlaceCorrectionsWhichOneQuestion

- (RAPPersonalPlaceCorrectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcutType:(int64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RAPPersonalPlaceCorrectionsWhichOneQuestion;
  v9 = [(RAPQuestion *)&v16 initWithReport:v8 parentQuestion:a4];
  v10 = v9;
  if (v9)
  {
    v9->_isRefreshing = 0;
    v9->_shortcutType = a5;
    switch(a5)
    {
      case 0:
      case 1:
      case 6:
        uint64_t v11 = +[NSArray array];
        mainMenuItems = v10->super._mainMenuItems;
        v10->super._mainMenuItems = (NSArray *)v11;
        goto LABEL_8;
      case 2:
        mainMenuItems = [v8 _context];
        uint64_t v13 = [mainMenuItems homeShortcuts];
        goto LABEL_7;
      case 3:
        mainMenuItems = [v8 _context];
        uint64_t v13 = [mainMenuItems workShortcuts];
        goto LABEL_7;
      case 5:
        mainMenuItems = [v8 _context];
        uint64_t v13 = [mainMenuItems schoolShortcuts];
LABEL_7:
        v14 = (void *)v13;
        [(RAPPersonalPlaceCorrectionsWhichOneQuestion *)v10 _createQuestionsFromShortcuts:v13];

LABEL_8:
        break;
      default:
        break;
    }
  }

  return v10;
}

- (void)_createQuestionsFromShortcuts:(id)a3
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
      v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v10);
        v12 = [RAPPersonalPlaceSelectionQuestion alloc];
        uint64_t v13 = [(RAPQuestion *)self report];
        v14 = [(RAPPersonalPlaceSelectionQuestion *)v12 initWithReport:v13 parentQuestion:self shortcut:v11];

        [v5 addObject:v14];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = (NSArray *)[v5 copy];
  mainMenuItems = self->super._mainMenuItems;
  self->super._mainMenuItems = v15;
}

- (void)refreshMainMenuItemsWithCallback:(id)a3
{
  id v4 = a3;
  if (!self->_isRefreshing)
  {
    self->_isRefreshing = 1;
    shortcutType = (void *)self->_shortcutType;
    id v6 = sub_100018584();
    id v7 = [v6 oneFavorites];

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100653E58;
    v8[3] = &unk_1012E71E0;
    v10[1] = shortcutType;
    objc_copyWeak(v10, &location);
    id v9 = v4;
    [v7 loadAllShortcutsWithHandler:v8];

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v10 = a3;
  id v4 = [v10 commonContext];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v10 setCommonContext:v5];
  }
  id v6 = [(RAPMenuQuestion *)self mainMenuItems];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [v10 commonContext];
    [v8 addUserPath:49];
  }
  id v9 = [(RAPMenuQuestion *)self selectedMenuItem];
  [v9 _fillSubmissionParameters:v10];
}

- (UIImage)image
{
  return (UIImage *)sub_100653868(self->_shortcutType);
}

- (NSString)localizedTitle
{
  int64_t shortcutType = self->_shortcutType;
  switch(shortcutType)
  {
    case 5:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"School [Report an Issue]";
      goto LABEL_7;
    case 3:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Work [Report an Issue]";
      goto LABEL_7;
    case 2:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Home [Report an Issue]";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:

  return (NSString *)v6;
}

- (NSString)localizedDescription
{
  int64_t shortcutType = self->_shortcutType;
  switch(shortcutType)
  {
    case 5:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Refine school location on map [Report an Issue]";
      goto LABEL_7;
    case 3:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Refine work location on map [Report an Issue]";
      goto LABEL_7;
    case 2:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Refine home location on map [Report an Issue]";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:

  return (NSString *)v6;
}

- (int64_t)questionCategory
{
  unint64_t v2 = self->_shortcutType - 2;
  if (v2 > 3)
  {
    int64_t v3 = 0;
    int64_t v4 = 0;
  }
  else
  {
    int64_t v3 = qword_100F701C0[v2];
    int64_t v4 = qword_100F701E0[v2];
  }
  if ([(NSArray *)self->super._mainMenuItems count] <= 1) {
    return v3;
  }
  else {
    return v4;
  }
}

- (int)userAction
{
  unint64_t v2 = self->_shortcutType - 2;
  if (v2 > 3) {
    return 17099;
  }
  else {
    return dword_100F70200[v2];
  }
}

- (BOOL)_isRecursivelyComplete
{
  int64_t v3 = [(RAPMenuQuestion *)self selectedMenuItem];
  if ([v3 isComplete])
  {
    v6.receiver = self;
    v6.super_class = (Class)RAPPersonalPlaceCorrectionsWhichOneQuestion;
    BOOL v4 = [(RAPMenuQuestion *)&v6 _isRecursivelyComplete];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
}

- (int64_t)shortcutType
{
  return self->_shortcutType;
}

- (void).cxx_destruct
{
}

@end