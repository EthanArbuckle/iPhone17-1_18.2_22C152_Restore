@interface VideosExtrasTemplateViewController
+ (id)templateViewControllerWithDocument:(id)a3 options:(id)a4 context:(id)a5;
- (BOOL)shouldUpdateByReplacingViewControllerWithTemplate:(id)a3;
- (BOOL)showsPlaceholder;
- (IKAppDocument)document;
- (VideosExtrasContext)context;
- (VideosExtrasTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5;
- (void)_showPlaceholder;
- (void)_startBackgroundAudio;
- (void)configureBackgroundWithElements:(id)a3;
- (void)dealloc;
- (void)documentDidFail:(id)a3 withError:(id)a4;
- (void)documentDidUpdate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VideosExtrasTemplateViewController

- (VideosExtrasTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VideosExtrasTemplateViewController;
  v12 = [(VideosExtrasElementViewController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_options, a4);
    objc_storeStrong((id *)&v13->_document, a3);
    [(IKAppDocument *)v13->_document setDelegate:v13];
    objc_storeWeak((id *)&v13->_context, v11);
    [(IKAppDocument *)v13->_document onLoad];
  }

  return v13;
}

- (void)dealloc
{
  [(IKAppDocument *)self->_document onUnload];
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasTemplateViewController;
  [(VideosExtrasElementViewController *)&v3 dealloc];
}

- (BOOL)showsPlaceholder
{
  return 1;
}

- (void)_showPlaceholder
{
  id v3 = [(VideosExtrasTemplateViewController *)self view];
  v2 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setBackgroundColor:v2];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v5 viewDidLoad];
  id v3 = [(VideosExtrasTemplateViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setBackgroundColor:v4];

  if ([(VideosExtrasTemplateViewController *)self showsPlaceholder]) {
    [(VideosExtrasTemplateViewController *)self _showPlaceholder];
  }
  [(VideosExtrasTemplateViewController *)self documentDidUpdate:self->_document];
}

- (void)_startBackgroundAudio
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 applicationState];

  if (v4 != 2)
  {
    objc_super v5 = [(VideosExtrasTemplateViewController *)self document];
    v6 = [v5 templateElement];

    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = [v6 performSelector:sel_background withObject:0];
      if (v7)
      {
        v8 = [(VideosExtrasTemplateViewController *)self context];
        id v9 = [v7 audio];

        if (v9)
        {
          id v10 = [v7 audio];
          v12[0] = v10;
          id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
          [v8 extrasRequestsMediaPlayback:v11 isBackground:1];
        }
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v5 viewDidAppear:a3];
  [(VideosExtrasTemplateViewController *)self _startBackgroundAudio];
  uint64_t v4 = [(VideosExtrasTemplateViewController *)self document];
  [v4 onAppear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v5 viewDidDisappear:a3];
  uint64_t v4 = [(VideosExtrasTemplateViewController *)self document];
  [v4 onDisappear];
}

- (void)documentDidUpdate:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 templateElement];
  BOOL v5 = [(VideosExtrasTemplateViewController *)self shouldUpdateByReplacingViewControllerWithTemplate:v4];

  if (v5)
  {
    v6 = objc_opt_class();
    options = self->_options;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    displayedTemplate = [v6 templateViewControllerWithDocument:v12 options:options context:WeakRetained];

    if (!displayedTemplate) {
      goto LABEL_6;
    }
    id v10 = [(VideosExtrasTemplateViewController *)self navigationController];
    objc_msgSend(v10, "_VideosExtras_replaceViewController:withViewController:animated:", self, displayedTemplate, 0);
  }
  else
  {
    id v11 = [v12 templateElement];
    displayedTemplate = self->_displayedTemplate;
    self->_displayedTemplate = v11;
  }

LABEL_6:
}

- (void)documentDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4FB1418];
  id v9 = [v7 localizedDescription];
  id v10 = [v7 localizedDescription];
  id v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

  objc_initWeak(&location, v11);
  id v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = +[VUILocalizationManager sharedInstance];
  v14 = [v13 localizedStringForKey:@"CANCEL"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __64__VideosExtrasTemplateViewController_documentDidFail_withError___block_invoke;
  v19 = &unk_1E6DF5380;
  objc_copyWeak(&v20, &location);
  objc_super v15 = [v12 actionWithTitle:v14 style:1 handler:&v16];
  objc_msgSend(v11, "addAction:", v15, v16, v17, v18, v19);

  [(VideosExtrasTemplateViewController *)self presentViewController:v11 animated:1 completion:0];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __64__VideosExtrasTemplateViewController_documentDidFail_withError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained parentViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)shouldUpdateByReplacingViewControllerWithTemplate:(id)a3
{
  displayedTemplate = self->_displayedTemplate;
  if (displayedTemplate) {
    BOOL v4 = displayedTemplate == a3;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (void)configureBackgroundWithElements:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VideosExtrasTemplateViewController;
  [(VideosExtrasElementViewController *)&v20 configureBackgroundWithElements:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = objc_msgSend(v10, "audio", (void)v16);
          if (v11)
          {
            id v12 = (void *)v11;
            id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
            v14 = [v10 audio];
            v21 = v14;
            objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
            [WeakRetained extrasRequestsMediaPlayback:v15 isBackground:1];

            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

+ (id)templateViewControllerWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (templateViewControllerWithDocument_options_context__onceToken != -1) {
    dispatch_once(&templateViewControllerWithDocument_options_context__onceToken, &__block_literal_global_19);
  }
  uint64_t v11 = [v8 templateElement];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v13 = [v8 templateElement];
    v14 = [v13 items];

    if ([v14 count]) {
      [v10 extrasRequestsMediaPlayback:v14 isBackground:0];
    }

    objc_super v15 = 0;
  }
  else
  {
    long long v16 = (void *)templateViewControllerWithDocument_options_context__templateMap;
    long long v17 = [v8 templateElement];
    long long v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    objc_super v20 = (objc_class *)(id)[v16 objectForKey:v19];

    if (v20) {
      v21 = v20;
    }
    else {
      v21 = (objc_class *)a1;
    }
    objc_super v15 = (void *)[[v21 alloc] initWithDocument:v8 options:v9 context:v10];
  }

  return v15;
}

void __89__VideosExtrasTemplateViewController_templateViewControllerWithDocument_options_context___block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"IKGalleryTemplate";
  v3[0] = objc_opt_class();
  v2[1] = @"IKListTemplate";
  v3[1] = objc_opt_class();
  v2[2] = @"IKMainTemplate";
  v3[2] = objc_opt_class();
  v2[3] = @"IKShowcaseTemplate";
  v3[3] = objc_opt_class();
  v2[4] = @"IKSlideshowElement";
  v3[4] = objc_opt_class();
  v2[5] = @"IKStackTemplate";
  v3[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)templateViewControllerWithDocument_options_context__templateMap;
  templateViewControllerWithDocument_options_context__templateMap = v0;
}

- (IKAppDocument)document
{
  return self->_document;
}

- (VideosExtrasContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (VideosExtrasContext *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_displayedTemplate, 0);
}

@end