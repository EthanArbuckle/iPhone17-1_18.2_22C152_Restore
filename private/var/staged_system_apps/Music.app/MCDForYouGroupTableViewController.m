@interface MCDForYouGroupTableViewController
+ (BOOL)wantsTallCells;
- (MCDForYouGroupTableViewController)initWithLimitedUI:(BOOL)a3 recommendationGroup:(id)a4;
- (MCDForYouGroupTableViewController)initWithLimitedUI:(BOOL)a3 recommendationItem:(id)a4;
- (MPModelObject)recommendation;
- (id)_contentManager;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5;
- (void)setRecommendation:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDForYouGroupTableViewController

- (MCDForYouGroupTableViewController)initWithLimitedUI:(BOOL)a3 recommendationGroup:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCDForYouGroupTableViewController;
  v8 = [(MCDFuseTableViewController *)&v14 initWithLimitedUI:v5];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recommendation, a4);
    if ([v7 groupType] == (id)4)
    {
      v10 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
      id v11 = [v10 userSubscriptionState];

      if (v11 == (id)3) {
        CFStringRef v12 = @"play_it_again";
      }
      else {
        CFStringRef v12 = @"recently_played";
      }
    }
    else
    {
      CFStringRef v12 = @"grouping";
    }
    [(MCDForYouGroupTableViewController *)v9 setPlayActivityFeatureName:v12];
  }

  return v9;
}

- (MCDForYouGroupTableViewController)initWithLimitedUI:(BOOL)a3 recommendationItem:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDForYouGroupTableViewController;
  v8 = [(MCDFuseTableViewController *)&v11 initWithLimitedUI:v5];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recommendation, a4);
    [(MCDForYouGroupTableViewController *)v9 setPlayActivityFeatureName:@"grouping"];
  }

  return v9;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)MCDForYouGroupTableViewController;
  [(MCDFuseTableViewController *)&v23 viewDidLoad];
  v3 = [(MCDForYouGroupTableViewController *)self recommendation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v5 = [(MCDForYouGroupTableViewController *)self recommendation];
  if (isKindOfClass)
  {
    v6 = 0;
  }
  else
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    if (v7)
    {
      v6 = [(MCDForYouGroupTableViewController *)self recommendation];
    }
    else
    {
      v6 = 0;
    }
    BOOL v5 = 0;
  }
  BOOL v8 = [v5 groupType] == (id)4;
  uint64_t v9 = [v5 title];
  v10 = (void *)v9;
  if (v8)
  {
    if (v9)
    {
LABEL_9:
      [(MCDForYouGroupTableViewController *)self setTitle:v9];
      goto LABEL_17;
    }
    objc_super v11 = [v6 title];
    if (v11)
    {
      [(MCDForYouGroupTableViewController *)self setTitle:v11];
    }
    else
    {
      v13 = +[NSBundle mainBundle];
      objc_super v14 = [v13 localizedStringForKey:@"Recently Played" value:&stru_101023248 table:0];
      [(MCDForYouGroupTableViewController *)self setTitle:v14];
    }
  }
  else
  {
    if (v9) {
      goto LABEL_9;
    }
    CFStringRef v12 = [v6 title];
    [(MCDForYouGroupTableViewController *)self setTitle:v12];
  }
LABEL_17:

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v15 = (void (*)(void))off_1010D6C60;
  v27 = off_1010D6C60;
  if (!off_1010D6C60)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v29 = sub_1000896C4;
    v30 = &unk_100FC34A0;
    v31 = &v24;
    sub_1000896C4((uint64_t)&buf);
    v15 = (void (*)(void))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v15)
  {
    sub_100D691B8();
    __break(1u);
  }
  v16 = v15();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(MCDForYouGroupTableViewController *)self title];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Loading For You group view, title: %@", (uint8_t *)&buf, 0xCu);
  }
  objc_initWeak((id *)&buf, self);
  objc_copyWeak(&v22, (id *)&buf);
  id v18 = v5;
  id v21 = v18;
  v19 = [(MCDFuseTableViewController *)self contentManager];
  [v19 setTableCellConfigurationBlock:&v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)&buf);
}

+ (BOOL)wantsTallCells
{
  return 1;
}

- (id)_contentManager
{
  v3 = [(MCDForYouGroupTableViewController *)self recommendation];
  v4 = objc_opt_new();
  [v4 appendSection:v3];
  BOOL v5 = [MCDForYouGroupContentManager alloc];
  v6 = [[MCDForYouDataSource alloc] initWithRecommendationGroup:v3];
  char v7 = [(MCDFuseTableViewController *)self playbackManager];
  BOOL v8 = [(MCDTableViewController *)self limitedUI];
  id v9 = [v4 copy];
  v10 = [(MCDForYouContentManager *)v5 initWithDataSource:v6 delegate:self viewController:self playbackManager:v7 limitedUI:v8 contentResults:v9];

  return v10;
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6 = a4;
  if ([v6 itemType] == (id)4)
  {
    char v7 = [MCDForYouGroupTableViewController alloc];
    BOOL v8 = [(MCDTableViewController *)self limitedUI];
    id v9 = [v6 subgroup];
    v10 = [(MCDForYouGroupTableViewController *)v7 initWithLimitedUI:v8 recommendationGroup:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MPModelObject)recommendation
{
  return self->_recommendation;
}

- (void)setRecommendation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end