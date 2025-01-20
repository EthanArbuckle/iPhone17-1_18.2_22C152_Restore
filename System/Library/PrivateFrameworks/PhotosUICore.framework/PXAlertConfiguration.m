@interface PXAlertConfiguration
- (NSMutableArray)actions;
- (NSString)message;
- (NSString)title;
- (PXAlertConfiguration)init;
- (PXAlertConfiguration)initWithError:(id)a3;
- (UIPopoverPresentationControllerSourceItem)sourceItem;
- (UIViewController)contentViewController;
- (UIViewController)headerContentViewController;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (void)addActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5;
- (void)addActions:(id)a3;
- (void)configureForError:(id)a3;
- (void)configureForPlaceholder:(id)a3;
- (void)featureNotEnabledWithDocumentationURLString:(id)a3;
- (void)notImplementedWithTrackingRadar:(int64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setHeaderContentViewController:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXAlertConfiguration

- (void)configureForPlaceholder:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  [(PXAlertConfiguration *)self setTitle:v5];

  v6 = [v4 subtitle];
  [(PXAlertConfiguration *)self setMessage:v6];

  v7 = [v4 fallbackActionTitle];
  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PXAlertConfiguration_PXPlaceholder__configureForPlaceholder___block_invoke;
    v8[3] = &unk_1E5DD36F8;
    id v9 = v4;
    [(PXAlertConfiguration *)self addActionWithTitle:v7 style:0 action:v8];
  }
  [(PXAlertConfiguration *)self addActionWithTitle:@"OK" style:1 action:0];
}

uint64_t __63__PXAlertConfiguration_PXPlaceholder__configureForPlaceholder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performFallbackAction];
}

- (void)featureNotEnabledWithDocumentationURLString:(id)a3
{
  id v4 = +[PXPlaceholder featureNotEnabledWithDocumentationURLString:a3];
  [(PXAlertConfiguration *)self configureForPlaceholder:v4];
}

- (void)notImplementedWithTrackingRadar:(int64_t)a3
{
  id v4 = +[PXPlaceholder featureNotImplementedWithTrackingRadar:a3];
  [(PXAlertConfiguration *)self configureForPlaceholder:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_headerContentViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_sourceItem);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setHeaderContentViewController:(id)a3
{
}

- (UIViewController)headerContentViewController
{
  return self->_headerContentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setSourceItem:(id)a3
{
}

- (UIPopoverPresentationControllerSourceItem)sourceItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceItem);
  return (UIPopoverPresentationControllerSourceItem *)WeakRetained;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PXAlertConfiguration *)self title];
  [v4 setTitle:v5];

  v6 = [(PXAlertConfiguration *)self message];
  [v4 setMessage:v6];

  v7 = [v4 actions];
  v8 = [(PXAlertConfiguration *)self actions];
  [v7 setArray:v8];

  objc_msgSend(v4, "setStyle:", -[PXAlertConfiguration style](self, "style"));
  id v9 = [(PXAlertConfiguration *)self sourceItem];
  [v4 setSourceItem:v9];

  v10 = [(PXAlertConfiguration *)self contentViewController];
  [v4 setContentViewController:v10];

  v11 = [(PXAlertConfiguration *)self headerContentViewController];
  [v4 setHeaderContentViewController:v11];

  v12 = [(PXAlertConfiguration *)self completionHandler];
  [v4 setCompletionHandler:v12];

  return v4;
}

- (PXAlertConfiguration)initWithError:(id)a3
{
  id v4 = a3;
  v5 = [(PXAlertConfiguration *)self init];
  [(PXAlertConfiguration *)v5 configureForError:v4];

  return v5;
}

- (void)configureForError:(id)a3
{
  id v4 = a3;
  v5 = [v4 localizedFailureReason];
  if (v5)
  {
    [(PXAlertConfiguration *)self setTitle:v5];
  }
  else
  {
    v6 = [v4 localizedDescription];
    [(PXAlertConfiguration *)self setTitle:v6];
  }
  v7 = [v4 localizedRecoverySuggestion];
  [(PXAlertConfiguration *)self setMessage:v7];

  v8 = [v4 localizedRecoveryOptions];
  id v9 = [v4 recoveryAttempter];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__PXAlertConfiguration_configureForError___block_invoke;
  v13[3] = &unk_1E5DC1940;
  v13[4] = self;
  id v14 = v9;
  id v15 = v4;
  id v10 = v4;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v13];
  v12 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  [(PXAlertConfiguration *)self addActionWithTitle:v12 style:1 action:0];
}

void __42__PXAlertConfiguration_configureForError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PXAlertConfiguration_configureForError___block_invoke_2;
  v7[3] = &unk_1E5DD0D90;
  v6 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = a3;
  [v6 addActionWithTitle:a2 style:0 action:v7];
}

uint64_t __42__PXAlertConfiguration_configureForError___block_invoke_2(void *a1)
{
  char v2 = objc_opt_respondsToSelector();
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  if (v2)
  {
    return [v3 attemptRecoveryFromError:v4 optionIndex:v5 delegate:0 didRecoverSelector:0 contextInfo:0];
  }
  else
  {
    return [v3 attemptRecoveryFromError:v4 optionIndex:v5];
  }
}

- (void)addActions:(id)a3
{
}

- (void)addActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  actions = self->_actions;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [[PXAlertAction alloc] initWithTitle:v9 style:a4 action:v8];

  [(NSMutableArray *)actions addObject:v10];
}

- (PXAlertConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXAlertConfiguration;
  char v2 = [(PXAlertConfiguration *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v2->_actions;
    v2->_actions = v3;

    v2->_style = 1;
  }
  return v2;
}

@end