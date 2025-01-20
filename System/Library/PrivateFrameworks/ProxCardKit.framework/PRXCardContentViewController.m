@interface PRXCardContentViewController
+ (Class)contentViewClass;
- (BOOL)allowsPullToDismiss;
- (NSArray)actions;
- (NSAttributedString)attributedSubtitle;
- (NSString)bottomTrayTitle;
- (NSString)subtitle;
- (PRXAction)dismissButtonAction;
- (PRXAction)infoButtonAction;
- (PRXButton)infoButton;
- (PRXCardContentView)contentView;
- (PRXCardContentViewController)initWithContentView:(id)a3;
- (PRXCardContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PRXPullDismissalInteractionDriver)pullDismissalInteractionDriver;
- (UIImageView)bottomTrayImageView;
- (id)addAction:(id)a3;
- (id)bottomTray;
- (id)dismissalConfirmationActionWithTitle:(id)a3 message:(id)a4 confirmButtonTitle:(id)a5 cancelButtonTitle:(id)a6;
- (int64_t)cardStyle;
- (unint64_t)dismissalType;
- (void)_prxCommonInit;
- (void)_updateActionButtons;
- (void)_updateDismisalControls;
- (void)_updateSubtitleLabel;
- (void)_updateTitleLabel;
- (void)hideActivityIndicator;
- (void)loadView;
- (void)removeAction:(id)a3;
- (void)removeBottomTray;
- (void)scrollToBottom;
- (void)setAttributedSubtitle:(id)a3;
- (void)setAuxiliaryButtonWithSymbolName:(id)a3 handler:(id)a4;
- (void)setBottomTrayImageView:(id)a3;
- (void)setBottomTrayTitle:(id)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setDismissButtonAction:(id)a3;
- (void)setDismissalType:(unint64_t)a3;
- (void)setInfoButtonAction:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransitioningSize:(BOOL)a3;
- (void)showActivityIndicatorWithStatus:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePreferredContentSizeForCardWidth:(double)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PRXCardContentViewController

- (PRXCardContentViewController)initWithContentView:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRXCardContentViewController;
  v6 = [(PRXCardContentViewController *)&v13 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    p_contentView = &v6->_contentView;
    objc_storeStrong((id *)&v6->_contentView, a3);
    [(PRXCardContentViewController *)v7 _prxCommonInit];
    if (*p_contentView)
    {
      v9 = [[PRXCardContentWrapperView alloc] initWithContentView:*p_contentView];
      wrapperView = v7->_wrapperView;
      v7->_wrapperView = v9;
    }
    v11 = v7;
  }

  return v7;
}

- (void)_prxCommonInit
{
  actions = self->_actions;
  self->_actions = (NSArray *)MEMORY[0x263EFFA68];

  [(PRXCardContentViewController *)self setModalPresentationStyle:4];
  v4 = [[PRXTransitioningController alloc] initWithPullDismissalProvider:self];
  transitionController = self->_transitionController;
  self->_transitionController = v4;

  [(PRXCardContentViewController *)self setTransitioningDelegate:self->_transitionController];
  [(PRXCardContentViewController *)self setDismissButtonAction:0];
}

- (PRXCardContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PRXCardContentViewController initWithContentView:](self, "initWithContentView:", 0, a4);
}

+ (Class)contentViewClass
{
  return (Class)objc_opt_class();
}

- (PRXCardContentView)contentView
{
  [(PRXCardContentViewController *)self loadViewIfNeeded];
  contentView = self->_contentView;
  return contentView;
}

- (void)loadView
{
  v3 = (void *)[(id)objc_opt_class() contentViewClass];
  if (([v3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF488];
    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    objc_super v13 = NSStringFromClass(v12);
    v14 = [v11 stringWithFormat:@"-[%@ contentViewClass] must return a subclass of PRXCardContentView", v13];
    id v15 = [v9 exceptionWithName:v10 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  if (!self->_contentView)
  {
    v4 = (PRXCardContentView *)[objc_alloc((Class)v3) initWithCardStyle:0];
    contentView = self->_contentView;
    self->_contentView = v4;

    v6 = [[PRXCardContentWrapperView alloc] initWithContentView:self->_contentView];
    wrapperView = self->_wrapperView;
    self->_wrapperView = v6;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = (void *)MEMORY[0x263EFF940];
    uint64_t v17 = *MEMORY[0x263EFF488];
    v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = NSStringFromClass((Class)v3);
    v22 = [v18 stringWithFormat:@"%@'s contentView must be a %@", v20, v21];
    id v23 = [v16 exceptionWithName:v17 reason:v22 userInfo:0];

    objc_exception_throw(v23);
  }
  v8 = self->_wrapperView;
  [(PRXCardContentViewController *)self setView:v8];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PRXCardContentViewController;
  [(PRXCardContentViewController *)&v3 viewDidLoad];
  [(PRXCardContentViewController *)self _updateTitleLabel];
  [(PRXCardContentViewController *)self _updateSubtitleLabel];
  [(PRXCardContentViewController *)self _updateDismisalControls];
  [(PRXCardContentViewController *)self _updateActionButtons];
}

- (void)updatePreferredContentSizeForCardWidth:(double)a3
{
  id v5 = [(PRXCardContentViewController *)self contentView];
  [v5 updateTitleTextViewExclusionPathsForCardWidth:a3];

  v6 = [(PRXCardContentViewController *)self view];
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v7, v8);
  double v10 = v9;
  double v12 = v11;

  -[PRXCardContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PRXCardContentViewController;
  [(PRXCardContentViewController *)&v15 viewDidLayoutSubviews];
  if (!self->_transitioningSize)
  {
    objc_super v3 = [(PRXCardContentViewController *)self contentView];
    [(PRXCardContentView *)self->_contentView bounds];
    [v3 updateTitleTextViewExclusionPathsForCardWidth:CGRectGetWidth(v16)];

    v4 = [(PRXCardContentViewController *)self view];
    [(PRXCardContentView *)self->_contentView bounds];
    CGFloat Width = CGRectGetWidth(v17);
    LODWORD(v6) = 1148846080;
    LODWORD(v7) = 1112014848;
    objc_msgSend(v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v6, v7);
    double v9 = v8;
    double v11 = v10;

    [(PRXCardContentViewController *)self preferredContentSize];
    if (v9 != v13 || v11 != v12) {
      -[PRXCardContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v11);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PRXCardContentViewController;
  id v7 = a4;
  -[PRXCardContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  self->_transitioningSize = 1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__PRXCardContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_264418280;
  v9[4] = self;
  [v7 animateAlongsideTransition:0 completion:v9];

  double v8 = [(PRXCardContentViewController *)self contentView];
  [v8 updateTitleTextViewExclusionPathsForCardWidth:width];
}

uint64_t __83__PRXCardContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 984) = 0;
  return result;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
}

- (void)setTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRXCardContentViewController;
  [(PRXCardContentViewController *)&v4 setTitle:a3];
  [(PRXCardContentViewController *)self _updateTitleLabel];
}

- (void)_updateTitleLabel
{
  if ([(PRXCardContentViewController *)self isViewLoaded])
  {
    id v7 = [(PRXCardContentViewController *)self title];
    uint64_t v3 = [v7 length];
    contentView = self->_contentView;
    if (v3)
    {
      id v5 = [(PRXCardContentView *)contentView titleTextView];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v6 = +[PRXTextView textViewWithStyle:0];

        [(PRXCardContentView *)self->_contentView setTitleView:v6];
        id v5 = (void *)v6;
      }
      [v5 setTitleText:v7];
    }
    else
    {
      [(PRXCardContentView *)contentView setTitleView:0];
    }
    [(PRXCardContentWrapperView *)self->_wrapperView setTitle:v7];
  }
}

- (void)setSubtitle:(id)a3
{
  objc_super v4 = (NSString *)a3;
  subtitle = self->_subtitle;
  if (subtitle != v4)
  {
    double v9 = v4;
    subtitle = (NSString *)[(NSString *)subtitle isEqualToString:v4];
    objc_super v4 = v9;
    if ((subtitle & 1) == 0)
    {
      uint64_t v6 = (NSString *)[(NSString *)v9 copy];
      id v7 = self->_subtitle;
      self->_subtitle = v6;

      if (v9) {
        double v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];
      }
      else {
        double v8 = 0;
      }
      [(PRXCardContentViewController *)self setAttributedSubtitle:v8];

      objc_super v4 = v9;
    }
  }
  MEMORY[0x270F9A758](subtitle, v4);
}

- (void)_updateSubtitleLabel
{
  if ([(PRXCardContentViewController *)self isViewLoaded])
  {
    NSUInteger v3 = [(NSAttributedString *)self->_attributedSubtitle length];
    contentView = self->_contentView;
    if (v3)
    {
      id v5 = [(PRXCardContentView *)contentView subtitleLabel];
      if (!v5)
      {
        id v6 = +[PRXLabel labelWithStyle:1];
        [(PRXCardContentView *)self->_contentView setSubtitleLabel:v6];
        id v5 = v6;
      }
      id v7 = v5;
      [v5 setAttributedText:self->_attributedSubtitle];
    }
    else
    {
      [(PRXCardContentView *)contentView setSubtitleLabel:0];
    }
  }
}

- (void)setAttributedSubtitle:(id)a3
{
  id v4 = a3;
  uint64_t attributedSubtitle = (uint64_t)self->_attributedSubtitle;
  if ((id)attributedSubtitle != v4)
  {
    double v8 = v4;
    uint64_t attributedSubtitle = [(id)attributedSubtitle isEqual:v4];
    id v4 = v8;
    if ((attributedSubtitle & 1) == 0)
    {
      id v6 = (NSAttributedString *)[v8 copy];
      id v7 = self->_attributedSubtitle;
      self->_uint64_t attributedSubtitle = v6;

      uint64_t attributedSubtitle = [(PRXCardContentViewController *)self _updateSubtitleLabel];
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](attributedSubtitle, v4);
}

- (void)setBottomTrayTitle:(id)a3
{
  id v4 = a3;
  [(PRXCardContentViewController *)self loadViewIfNeeded];
  id v5 = (NSString *)[v4 copy];
  bottomTrayTitle = self->_bottomTrayTitle;
  self->_bottomTrayTitle = v5;

  id v7 = [(PRXCardContentWrapperView *)self->_wrapperView bottomTray];
  [v7 setTitle:v4];
}

- (UIImageView)bottomTrayImageView
{
  v2 = [(PRXCardContentWrapperView *)self->_wrapperView bottomTray];
  NSUInteger v3 = [v2 imageView];

  return (UIImageView *)v3;
}

- (void)setBottomTrayImageView:(id)a3
{
  id v4 = a3;
  [(PRXCardContentViewController *)self loadViewIfNeeded];
  id v5 = [(PRXCardContentWrapperView *)self->_wrapperView bottomTray];
  [v5 setImageView:v4];
}

- (void)scrollToBottom
{
  NSUInteger v3 = [(PRXCardContentViewController *)self view];
  [v3 layoutIfNeeded];

  [(PRXCardContentWrapperView *)self->_wrapperView scrollToBottom];
  self->_shouldAutoScrollToBottom = 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRXCardContentViewController;
  [(PRXCardContentViewController *)&v4 traitCollectionDidChange:a3];
  if (self->_shouldAutoScrollToBottom) {
    [(PRXCardContentViewController *)self scrollToBottom];
  }
}

- (void)setDismissalType:(unint64_t)a3
{
  if (self->_dismissalType != a3)
  {
    self->_dismissalType = a3;
    [(PRXCardContentViewController *)self _updateDismisalControls];
  }
}

- (void)setDismissButtonAction:(id)a3
{
  objc_super v4 = (PRXAction *)a3;
  if (!v4 || self->_dismissButtonAction != v4)
  {
    double v8 = v4;
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = +[PRXAction defaultDismissalActionForViewController:self];
    }
    dismissButtonAction = self->_dismissButtonAction;
    self->_dismissButtonAction = v5;

    id v7 = [(PRXCardContentView *)self->_contentView dismissButton];
    [(PRXAction *)self->_dismissButtonAction setButton:v7];

    objc_super v4 = v8;
  }
}

- (void)_updateDismisalControls
{
  if ([(PRXCardContentViewController *)self isViewLoaded])
  {
    if (self->_dismissalType)
    {
      id v4 = +[PRXButton buttonWithProximityType:2];
      [(PRXAction *)self->_dismissButtonAction setButton:v4];
      [(PRXCardContentView *)self->_contentView setDismissButton:v4];
    }
    else
    {
      contentView = self->_contentView;
      [(PRXCardContentView *)contentView setDismissButton:0];
    }
  }
}

- (id)dismissalConfirmationActionWithTitle:(id)a3 message:(id)a4 confirmButtonTitle:(id)a5 cancelButtonTitle:(id)a6
{
  return +[PRXAction dismissalConfirmationActionForViewController:self withTitle:a3 message:a4 confirmButtonTitle:a5 cancelButtonTitle:a6];
}

- (id)addAction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NSArray *)self->_actions mutableCopy];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
  }
  double v8 = v7;

  [v8 addObject:v4];
  double v9 = (NSArray *)[v8 copy];
  actions = self->_actions;
  self->_actions = v9;

  [(PRXCardContentViewController *)self _updateActionButtons];
  return v4;
}

- (void)removeAction:(id)a3
{
  actions = self->_actions;
  id v5 = a3;
  id v6 = (void *)[(NSArray *)actions mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
  }
  id v11 = v8;

  [v11 removeObject:v5];
  double v9 = (NSArray *)[v11 copy];
  objc_super v10 = self->_actions;
  self->_actions = v9;

  [(PRXCardContentViewController *)self _updateActionButtons];
}

- (void)_updateActionButtons
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(PRXCardContentViewController *)self isViewLoaded])
  {
    NSUInteger v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_actions, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    CGRect v16 = self;
    obj = self->_actions;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v8, "style", v16);
          uint64_t v10 = 5;
          if (v9 != 2) {
            uint64_t v10 = 1;
          }
          if (v9 == 1) {
            uint64_t v11 = 0;
          }
          else {
            uint64_t v11 = v10;
          }
          uint64_t v12 = [v8 usesLegacyStyling];
          double v13 = [v8 customColors];
          v14 = +[PRXButton buttonWithProximityType:v11 usesLegacyStyling:v12 usingCustomColors:v13];

          [v8 setButton:v14];
          [v3 addObject:v14];
        }
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v5);
    }

    objc_super v15 = [(PRXCardContentWrapperView *)v16->_wrapperView bottomTray];
    [v15 setActionButtons:v3];
  }
}

- (void)showActivityIndicatorWithStatus:(id)a3
{
  id v10 = a3;
  [(PRXCardContentViewController *)self loadViewIfNeeded];
  if ([v10 length])
  {
    uint64_t v4 = objc_alloc_init(PRXActivityStatusView);
    uint64_t v5 = [(PRXActivityStatusView *)v4 statusLabel];
    [v5 setText:v10];

    uint64_t v6 = [(PRXActivityStatusView *)v4 activityIndicator];
    [v6 startAnimating];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F1C3D8]);
    if ([(PRXCardContentViewController *)self cardStyle] == 1) {
      uint64_t v8 = 100;
    }
    else {
      uint64_t v8 = 101;
    }
    uint64_t v4 = (PRXActivityStatusView *)[v7 initWithActivityIndicatorStyle:v8];
    [(PRXActivityStatusView *)v4 startAnimating];
  }
  uint64_t v9 = [(PRXCardContentWrapperView *)self->_wrapperView bottomTray];
  [v9 setActivityIndicator:v4];
}

- (void)hideActivityIndicator
{
  id v2 = [(PRXCardContentWrapperView *)self->_wrapperView bottomTray];
  [v2 setActivityIndicator:0];
}

- (PRXAction)infoButtonAction
{
  return [(PRXCardContentWrapperView *)self->_wrapperView infoButtonAction];
}

- (void)setInfoButtonAction:(id)a3
{
  id v4 = a3;
  [(PRXCardContentViewController *)self loadViewIfNeeded];
  [(PRXCardContentWrapperView *)self->_wrapperView setInfoButtonAction:v4];
}

- (PRXButton)infoButton
{
  id v2 = [(PRXCardContentWrapperView *)self->_wrapperView infoButtonAction];
  NSUInteger v3 = [v2 button];

  return (PRXButton *)v3;
}

- (void)setAuxiliaryButtonWithSymbolName:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PRXCardContentViewController *)self loadViewIfNeeded];
  [(PRXCardContentWrapperView *)self->_wrapperView setAuxiliaryButtonWithSymbolName:v7 handler:v6];
}

- (id)bottomTray
{
  [(PRXCardContentViewController *)self loadViewIfNeeded];
  wrapperView = self->_wrapperView;
  return [(PRXCardContentWrapperView *)wrapperView bottomTray];
}

- (void)removeBottomTray
{
}

- (int64_t)cardStyle
{
  return [(PRXCardContentView *)self->_contentView cardStyle];
}

- (BOOL)allowsPullToDismiss
{
  return (LOBYTE(self->_dismissalType) >> 1) & 1;
}

- (void)setTransitioningSize:(BOOL)a3
{
  self->_transitioningSize = a3;
}

- (PRXPullDismissalInteractionDriver)pullDismissalInteractionDriver
{
  return self->_pullDismissalInteractionDriver;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (NSString)bottomTrayTitle
{
  return self->_bottomTrayTitle;
}

- (unint64_t)dismissalType
{
  return self->_dismissalType;
}

- (PRXAction)dismissButtonAction
{
  return self->_dismissButtonAction;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_dismissButtonAction, 0);
  objc_storeStrong((id *)&self->_bottomTrayTitle, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_pullDismissalInteractionDriver, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
}

@end