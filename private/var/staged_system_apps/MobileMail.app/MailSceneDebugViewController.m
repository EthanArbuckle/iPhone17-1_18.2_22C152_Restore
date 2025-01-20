@interface MailSceneDebugViewController
+ (id)title;
- (UITextView)textView;
- (void)_loadDebugInfo;
- (void)selectAll:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MailSceneDebugViewController

+ (id)title
{
  return @"Mail UISceneSessions";
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MailSceneDebugViewController;
  [(MailSceneDebugViewController *)&v6 viewDidLoad];
  v3 = [(MailSceneDebugViewController *)self view];
  id v4 = objc_alloc((Class)UITextView);
  [v3 frame];
  id v5 = [v4 initWithFrame:];
  [v5 setAutoresizingMask:18];
  [v5 setEditable:0];
  [v3 addSubview:v5];
  [(MailSceneDebugViewController *)self setTextView:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MailSceneDebugViewController;
  [(MailSceneDebugViewController *)&v8 viewWillAppear:a3];
  id v4 = +[MailSceneDebugViewController title];
  id v5 = [(MailSceneDebugViewController *)self navigationItem];
  [v5 setTitle:v4];

  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:13 target:self action:"_loadDebugInfo"];
  v7 = [(MailSceneDebugViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MailSceneDebugViewController;
  [(MailSceneDebugViewController *)&v4 viewDidAppear:a3];
  [(MailSceneDebugViewController *)self _loadDebugInfo];
}

- (void)selectAll:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(MailSceneDebugViewController *)self textView];
  [v4 selectAll:v5];
}

- (void)_loadDebugInfo
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  objc_super v4 = [(MailSceneDebugViewController *)self view];
  id v5 = [v4 window];
  id v6 = [v5 windowScene];
  v7 = [v6 session];

  objc_super v8 = [v7 mf_debugDescription];
  [v3 appendFormat:@"Current Scene Session:\n%@\n", v8];

  v9 = +[UIApplication sharedApplication];
  v10 = [v9 openSessions];

  [v3 appendFormat:@"All Scene Sessions (%lu):\n", [v10 count]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) mf_debugDescription];
        [v3 appendFormat:@"%@\n", v15];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  v16 = [(MailSceneDebugViewController *)self textView];
  [v16 setText:v3];
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end