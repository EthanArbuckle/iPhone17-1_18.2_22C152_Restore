@interface ICStartupViewController
- (BOOL)didFailToDownloadDeviceList;
- (NSArray)choiceBlocks;
- (NSArray)choiceLabels;
- (UIActivityIndicatorView)activityIndicatorView;
- (id)keyCommands;
- (int64_t)behavior;
- (void)addListItems;
- (void)addListItemsCalculatorCompact:(BOOL)a3;
- (void)addListItemsiOS;
- (void)addListItemsvisionOS;
- (void)applyAccessibilityInfo;
- (void)choiceSelected:(unint64_t)a3;
- (void)continueAction:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setChoiceBlocks:(id)a3;
- (void)setChoiceLabels:(id)a3;
- (void)setupChoiceViews;
- (void)startIndicatorAnimation;
- (void)stopIndicatorAnimation;
- (void)viewDidLoad;
@end

@implementation ICStartupViewController

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)ICStartupViewController;
  [(ICStartupBaseViewController *)&v20 viewDidLoad];
  [(ICStartupViewController *)self addListItems];
  id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(ICStartupViewController *)self setActivityIndicatorView:v3];

  v4 = [(ICStartupViewController *)self activityIndicatorView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(ICStartupViewController *)self view];
  v6 = [(ICStartupViewController *)self activityIndicatorView];
  [v5 addSubview:v6];

  v7 = +[NSMutableArray array];
  v8 = [(ICStartupViewController *)self activityIndicatorView];
  v9 = [v8 bottomAnchor];
  v10 = [(ICStartupViewController *)self view];
  v11 = [v10 layoutMarginsGuide];
  v12 = [v11 bottomAnchor];
  v13 = [v9 constraintEqualToAnchor:v12 constant:-40.0];
  [v7 addObject:v13];

  v14 = [(ICStartupViewController *)self activityIndicatorView];
  v15 = [v14 centerXAnchor];
  v16 = [(ICStartupViewController *)self view];
  v17 = [v16 layoutMarginsGuide];
  v18 = [v17 centerXAnchor];
  v19 = [v15 constraintEqualToAnchor:v18];
  [v7 addObject:v19];

  +[NSLayoutConstraint activateConstraints:v7];
}

- (int64_t)behavior
{
  v2 = [(ICStartupViewController *)self navigationController];
  id v3 = [v2 ic_behavior];

  return (int64_t)v3;
}

- (void)addListItems
{
  if ((id)[(ICStartupViewController *)self behavior] == (id)3)
  {
    [(ICStartupViewController *)self addListItemsvisionOS];
  }
  else if ((id)[(ICStartupViewController *)self behavior] == (id)1)
  {
    uint64_t v5 = +[UIDevice ic_isiPad] ^ 1;
    [(ICStartupViewController *)self addListItemsCalculatorCompact:v5];
  }
  else
  {
    [(ICStartupViewController *)self addListItemsiOS];
  }
}

- (void)addListItemsCalculatorCompact:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Solve Math" value:&stru_10063F3D8 table:0];
  v7 = +[NSBundle mainBundle];
  v8 = v7;
  if (v3) {
    CFStringRef v9 = @"Type math expressions to instantly see results inline in your Math Notes.";
  }
  else {
    CFStringRef v9 = @"Write math expressions with Apple Pencil or type them to instantly see results inline in your Math Notes.";
  }
  v10 = [v7 localizedStringForKey:v9 value:&stru_10063F3D8 table:0];
  v11 = +[UIImage ic_systemImageNamed:@"math.operators"];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v6 description:v10 image:v11];

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"Use Variables" value:&stru_10063F3D8 table:0];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"Assign a value to x, y, or any other word, and easily reference these variables in expressions and equations.", &stru_10063F3D8, 0 value table];
  v16 = +[UIImage ic_systemImageNamed:@"x.squareroot"];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v13 description:v15 image:v16];

  if (!v3)
  {
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"Plot Graphs" value:&stru_10063F3D8 table:0];
    v19 = +[NSBundle mainBundle];
    objc_super v20 = [v19 localizedStringForKey:@"Write or type an equation, plot it on a graph, and adjust variables and values to see your graph update in real time.", &stru_10063F3D8, 0 value table];
    v21 = +[UIImage ic_systemImageNamed:@"chart.xyaxis.line"];
    [(ICStartupViewController *)self addBulletedListItemWithTitle:v18 description:v20 image:v21];
  }
  id v26 = +[NSBundle mainBundle];
  v22 = [v26 localizedStringForKey:@"Math in Your Notes App" value:&stru_10063F3D8 table:0];
  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"Solve math in any note in the Notes app, and access all of your notes from Calculator in the new Math Notes folder.", &stru_10063F3D8, 0 value table];
  v25 = +[UIImage ic_systemImageNamed:@"apple.math.notes"];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v22 description:v24 image:v25];
}

- (void)addListItemsiOS
{
  BOOL v3 = +[UIColor whiteColor];
  v30[0] = v3;
  uint64_t v4 = +[UIColor systemBlueColor];
  v30[1] = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:v30 count:2];
  v6 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v5];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Add Almost Anything" value:&stru_10063F3D8 table:0];
  CFStringRef v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Capture documents, audio, photos, and more for a richer Notes experience.", &stru_10063F3D8, 0 value table];
  v11 = +[UIImage imageNamed:@"ios_firstlaunch_welcome_1"];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v8 description:v10 image:v11];

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"Note to Self, or with Anyone", &stru_10063F3D8, 0 value table];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"Invite others to view or make changes to a note." value:&stru_10063F3D8 table:0];
  v16 = +[UIImage systemImageNamed:@"person.crop.circle.fill" withConfiguration:v6];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v13 description:v15 image:v16];

  if (+[UIDevice ic_isiPad])
  {
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"Sketch Your Thoughts" value:&stru_10063F3D8 table:0];
    v19 = +[NSBundle mainBundle];
    objc_super v20 = [v19 localizedStringForKey:@"Draw using your finger or the Apple Pencil." value:&stru_10063F3D8 table:0];
    v21 = +[UIImage imageNamed:@"ios_firstlaunch_welcome_3"];
    [(ICStartupViewController *)self addBulletedListItemWithTitle:v18 description:v20 image:v21];
  }
  v22 = +[NSBundle mainBundle];
  v23 = [v22 localizedStringForKey:@"Create Quick Notes Anywhere" value:&stru_10063F3D8 table:0];
  unsigned int v24 = +[UIDevice ic_isiPad];
  v25 = +[NSBundle mainBundle];
  id v26 = v25;
  if (v24) {
    CFStringRef v27 = @"Just swipe up from the bottom right corner with your Apple Pencil to start a note when you’re outside the app.";
  }
  else {
    CFStringRef v27 = @"Create new Quick Notes in any app from the Share menu.";
  }
  v28 = [v25 localizedStringForKey:v27 value:&stru_10063F3D8 table:0];
  v29 = +[UIImage ic_systemImageNamed:@"quicknote"];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v23 description:v28 image:v29];
}

- (void)addListItemsvisionOS
{
  BOOL v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"Add Almost Anything" value:&stru_10063F3D8 table:0];
  uint64_t v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Capture documents, audio, photos, and more for a richer Notes experience.", &stru_10063F3D8, 0 value table];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v4 description:v6 symbolName:@"note.text"];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Fast, Powerful Collaboration", &stru_10063F3D8, 0 value table];
  CFStringRef v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Invite others to view or make changes to a note." value:&stru_10063F3D8 table:0];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v8 description:v10 symbolName:@"person.crop.circle.fill"];

  id v24 = +[UIButtonConfiguration plainButtonConfiguration];
  [v24 setButtonSize:1];
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"Go to Settings…" value:&stru_10063F3D8 table:0];
  [v24 setTitle:v12];

  [v24 setContentInsets:2.0, 0.0, 2.0, 0.0];
  v13 = +[UIColor ICTintColor];
  [v24 setBaseForegroundColor:v13];

  v14 = +[UIAction actionWithHandler:&stru_100626618];
  v15 = +[OBBulletedListItemLinkButton buttonWithConfiguration:v24 primaryAction:v14];
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"Make Quick Edits" value:&stru_10063F3D8 table:0];
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"Pair a supported keyboard, trackpad, or mouse for even faster editing.", &stru_10063F3D8, 0 value table];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v17 description:v19 symbolName:@"keyboard" linkButton:v15];

  objc_super v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"And Lots More…" value:&stru_10063F3D8 table:0];
  v22 = +[NSBundle mainBundle];
  v23 = [v22 localizedStringForKey:@"Using tools like checklists, tables, locked notes, and text formatting.", &stru_10063F3D8, 0 value table];
  [(ICStartupViewController *)self addBulletedListItemWithTitle:v21 description:v23 symbolName:@"sparkles"];
}

- (void)choiceSelected:(unint64_t)a3
{
  uint64_t v5 = [(ICStartupViewController *)self choiceBlocks];
  id v6 = [v5 count];

  if ((unint64_t)v6 > a3)
  {
    v7 = [(ICStartupViewController *)self choiceBlocks];
    v8 = [v7 objectAtIndexedSubscript:a3];

    v8[2]();
  }
}

- (id)keyCommands
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Continue" value:&stru_10063F3D8 table:0];

  uint64_t v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"continueAction:" input:@"\r" modifierFlags:0 propertyList:0];
  [v4 setWantsPriorityOverSystemBehavior:1];
  v7 = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return v5;
}

- (void)continueAction:(id)a3
{
  id v3 = [(ICStartupBaseViewController *)self startupNavigationController];
  [v3 continueAction];
}

- (void)setupChoiceViews
{
  id v3 = [(ICStartupBaseViewController *)self startupNavigationController];
  id v4 = [v3 getStartupMigrationType];

  objc_initWeak(&location, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10005B7CC;
  v43[3] = &unk_100625938;
  id v24 = &v44;
  objc_copyWeak(&v44, &location);
  uint64_t v5 = objc_retainBlock(v43);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10005B854;
  v41[3] = &unk_100625938;
  id v26 = &v42;
  objc_copyWeak(&v42, &location);
  v28 = objc_retainBlock(v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10005B8AC;
  v39[3] = &unk_100625938;
  CFStringRef v27 = &v40;
  objc_copyWeak(&v40, &location);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10005B904;
  v36[3] = &unk_100626640;
  id v6 = objc_retainBlock(v39);
  id v37 = v6;
  v7 = v5;
  id v38 = v7;
  v36[4] = self;
  v30 = objc_retainBlock(v36);
  v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472;
  v33 = sub_10005BB90;
  v34 = &unk_100625938;
  objc_copyWeak(&v35, &location);
  v29 = objc_retainBlock(&v31);
  id v8 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v8 setAlignment:1];
  CFStringRef v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Continue" value:&stru_10063F3D8 table:0];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"Upgrade Now" value:&stru_10063F3D8 table:0];

  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Upgrade Notes" value:&stru_10063F3D8 table:0];

  switch((unint64_t)v4)
  {
    case 0uLL:
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICStartupViewController setupChoiceViews]", 1, 0, @"Undefined startup migration type", &v44, &v42, &v40, v28, v29, v30, v31, v32, v33, v34);
      break;
    case 1uLL:
      v59 = v10;
      v19 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1, &v44, &v42, &v40, v28, v29, v30, v31, v32, v33, v34);
      [(ICStartupViewController *)self setChoiceLabels:v19];

      v16 = objc_retainBlock(v6);
      v58 = v16;
      v17 = +[NSArray arrayWithObjects:&v58 count:1];
      [(ICStartupViewController *)self setChoiceBlocks:v17];
      goto LABEL_10;
    case 2uLL:
      v53 = v10;
      objc_super v20 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1, &v44, &v42, &v40, v28, v29, v30, v31, v32, v33, v34);
      [(ICStartupViewController *)self setChoiceLabels:v20];

      v16 = objc_retainBlock(v7);
      v52 = v16;
      v17 = +[NSArray arrayWithObjects:&v52 count:1];
      [(ICStartupViewController *)self setChoiceBlocks:v17];
      goto LABEL_10;
    case 3uLL:
    case 4uLL:
      v51 = v14;
      v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1, &v44, &v42, &v40, v28, v29, v30, v31, v32, v33, v34);
      [(ICStartupViewController *)self setChoiceLabels:v15];

      v16 = objc_retainBlock(v7);
      v50 = v16;
      v17 = +[NSArray arrayWithObjects:&v50 count:1];
      [(ICStartupViewController *)self setChoiceBlocks:v17];
      goto LABEL_10;
    case 5uLL:
      v49 = v10;
      v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1, &v44, &v42, &v40);
      [(ICStartupViewController *)self setChoiceLabels:v21];

      v16 = objc_retainBlock(v28);
      v48 = v16;
      v17 = +[NSArray arrayWithObjects:&v48 count:1];
      [(ICStartupViewController *)self setChoiceBlocks:v17];
      goto LABEL_10;
    case 6uLL:
    case 7uLL:
      v55 = v12;
      v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1, &v44, &v42, &v40, v28, v29);
      [(ICStartupViewController *)self setChoiceLabels:v18];

      v16 = objc_retainBlock(v30);
      v54 = v16;
      v17 = +[NSArray arrayWithObjects:&v54 count:1];
      [(ICStartupViewController *)self setChoiceBlocks:v17];
      goto LABEL_10;
    case 8uLL:
      v47 = v14;
      v22 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1, &v44, &v42, &v40, v28);
      [(ICStartupViewController *)self setChoiceLabels:v22];

      v16 = objc_retainBlock(v29);
      v46 = v16;
      v17 = +[NSArray arrayWithObjects:&v46 count:1];
      [(ICStartupViewController *)self setChoiceBlocks:v17];
      goto LABEL_10;
    case 9uLL:
      v57 = v10;
      v23 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1, &v44, &v42, &v40, v28);
      [(ICStartupViewController *)self setChoiceLabels:v23];

      v16 = objc_retainBlock(v29);
      v56 = v16;
      v17 = +[NSArray arrayWithObjects:&v56 count:1];
      [(ICStartupViewController *)self setChoiceBlocks:v17];
LABEL_10:

      break;
    default:
      break;
  }
  [(ICStartupBaseViewController *)self choicesUpdated];

  objc_destroyWeak(&v35);
  objc_destroyWeak(v27);

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

- (BOOL)didFailToDownloadDeviceList
{
  v2 = [(ICStartupBaseViewController *)self startupNavigationController];
  id v3 = [v2 primaryAccountDevices];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)startIndicatorAnimation
{
  [(ICStartupBaseViewController *)self hideChoices];
  id v3 = [(ICStartupViewController *)self activityIndicatorView];
  [v3 startAnimating];
}

- (void)stopIndicatorAnimation
{
  [(ICStartupViewController *)self setupChoiceViews];
  id v3 = [(ICStartupViewController *)self activityIndicatorView];
  [v3 stopAnimating];
}

- (void)applyAccessibilityInfo
{
  id v2 = [(ICStartupViewController *)self view];
  [v2 setAccessibilityViewIsModal:1];
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return *(UIActivityIndicatorView **)(&self->super + 1);
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (NSArray)choiceLabels
{
  return *(NSArray **)((char *)&self->_activityIndicatorView + 1);
}

- (void)setChoiceLabels:(id)a3
{
}

- (NSArray)choiceBlocks
{
  return *(NSArray **)((char *)&self->_choiceLabels + 1);
}

- (void)setChoiceBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_choiceLabels + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);

  objc_storeStrong((id *)(&self->super + 1), 0);
}

@end