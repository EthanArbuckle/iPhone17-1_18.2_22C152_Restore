@interface PRComplicationContainerViewController
- (BOOL)usesEditingLayout;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (PRComplicationContainerViewController)initWithInlineComplicationDescriptor:(id)a3 graphicComplicationDescriptors:(id)a4 graphicComplicationIconLayout:(id)a5 sidebarComplicationDescriptors:(id)a6 sidebarIconLayout:(id)a7;
- (PRComplicationContainerViewControllerDelegate)delegate;
- (PRComplicationDescriptor)inlineComplicationDescriptor;
- (PRInlineComplicationContainerViewController)inlineComplicationContainerViewController;
- (PRWidgetGridViewController)sidebarWidgetGridViewController;
- (PRWidgetGridViewController)widgetGridViewController;
- (int64_t)_locationForViewController:(id)a3;
- (int64_t)focusedElement;
- (void)_updateFocusedWithAnimationSettings:(id)a3;
- (void)inlineComplicationContainerViewController:(id)a3 didEditComplication:(id)a4;
- (void)inlineComplicationContainerViewControllerDidTapAdd:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setFocusedElement:(int64_t)a3;
- (void)setFocusedElement:(int64_t)a3 animated:(BOOL)a4;
- (void)setFocusedElement:(int64_t)a3 animationSettings:(id)a4;
- (void)setInlineComplicationContainerViewController:(id)a3;
- (void)setInlineComplicationDescriptor:(id)a3;
- (void)setSidebarWidgetGridViewController:(id)a3;
- (void)setUsesEditingLayout:(BOOL)a3;
- (void)setUsesEditingLayout:(BOOL)a3 animated:(BOOL)a4;
- (void)setUsesEditingLayout:(BOOL)a3 animationSettings:(id)a4;
- (void)setVibrancyConfiguration:(id)a3;
- (void)setWidgetGridViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)widgetGridModelDidUpdateContent:(id)a3;
- (void)widgetGridViewController:(id)a3 didRequestConfigurationForComplicationDescriptor:(id)a4;
- (void)widgetGridViewController:(id)a3 isAttemptingDragToAddComplication:(id)a4;
- (void)widgetGridViewControllerDidTapBackground:(id)a3;
@end

@implementation PRComplicationContainerViewController

- (PRComplicationContainerViewController)initWithInlineComplicationDescriptor:(id)a3 graphicComplicationDescriptors:(id)a4 graphicComplicationIconLayout:(id)a5 sidebarComplicationDescriptors:(id)a6 sidebarIconLayout:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PRComplicationContainerViewController;
  v17 = [(PRComplicationContainerViewController *)&v29 init];
  if (v17)
  {
    v18 = [[PRInlineComplicationContainerViewController alloc] initWithComplicationDescriptor:v12];
    inlineComplicationContainerViewController = v17->_inlineComplicationContainerViewController;
    v17->_inlineComplicationContainerViewController = v18;

    [(PRInlineComplicationContainerViewController *)v17->_inlineComplicationContainerViewController setDelegate:v17];
    v20 = [[PRWidgetGridModel alloc] initWithComplicationDescriptors:v13 iconLayout:v14 type:0];
    [(PRWidgetGridModel *)v20 setDelegate:v17];
    v21 = [[PRWidgetGridViewController alloc] initWithModel:v20 iconViewProvider:0];
    widgetGridViewController = v17->_widgetGridViewController;
    v17->_widgetGridViewController = v21;

    [(PRWidgetGridViewController *)v17->_widgetGridViewController setRequiresFocusForLaunchRequests:1];
    [(PRWidgetGridViewController *)v17->_widgetGridViewController setDelegate:v17];
    v23 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v24 = [v23 userInterfaceIdiom];

    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v25 = [[PRWidgetGridModel alloc] initWithComplicationDescriptors:v15 iconLayout:v16 type:1];
      [(PRWidgetGridModel *)v25 setDelegate:v17];
      v26 = [[PRWidgetGridViewController alloc] initWithModel:v25 iconViewProvider:0];
      sidebarWidgetGridViewController = v17->_sidebarWidgetGridViewController;
      v17->_sidebarWidgetGridViewController = v26;

      [(PRWidgetGridViewController *)v17->_sidebarWidgetGridViewController setRequiresFocusForLaunchRequests:1];
      [(PRWidgetGridViewController *)v17->_sidebarWidgetGridViewController setDelegate:v17];
    }
  }

  return v17;
}

- (void)invalidate
{
  [(PRInlineComplicationContainerViewController *)self->_inlineComplicationContainerViewController invalidate];
  [(PRWidgetGridViewController *)self->_widgetGridViewController invalidate];
  sidebarWidgetGridViewController = self->_sidebarWidgetGridViewController;
  [(PRWidgetGridViewController *)sidebarWidgetGridViewController invalidate];
}

- (void)loadView
{
  v3 = objc_alloc_init(PRSubviewHitTestingView);
  [(PRComplicationContainerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PRComplicationContainerViewController;
  [(PRComplicationContainerViewController *)&v3 viewDidLoad];
  [(PRComplicationContainerViewController *)self bs_addChildViewController:self->_inlineComplicationContainerViewController];
  [(PRComplicationContainerViewController *)self bs_addChildViewController:self->_widgetGridViewController];
  [(PRComplicationContainerViewController *)self bs_addChildViewController:self->_sidebarWidgetGridViewController];
}

- (void)viewDidLayoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)PRComplicationContainerViewController;
  [(PRComplicationContainerViewController *)&v58 viewDidLayoutSubviews];
  objc_super v3 = [(PRComplicationContainerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [[PREditorElementLayoutController alloc] initWithTraitEnvironment:self];
  id v13 = v12;
  if (self->_usesEditingLayout)
  {
    -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v12, "frameForElements:variant:withBoundingRect:", 4, 2, v5, v7, v9, v11);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v13, "frameForElements:variant:withBoundingRect:", 8, 2, v5, v7, v9, v11);
    double v56 = v23;
    double v57 = v22;
    double v54 = v25;
    double v55 = v24;
    -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v13, "frameForElements:variant:withBoundingRect:", 16, 2, v5, v7, v9, v11);
  }
  else
  {
    -[PREditorElementLayoutController frameForElements:withBoundingRect:](v12, "frameForElements:withBoundingRect:", 4, v5, v7, v9, v11);
    double v15 = v30;
    double v17 = v31;
    double v19 = v32;
    double v21 = v33;
    -[PREditorElementLayoutController frameForElements:withBoundingRect:](v13, "frameForElements:withBoundingRect:", 8, v5, v7, v9, v11);
    double v56 = v35;
    double v57 = v34;
    double v54 = v37;
    double v55 = v36;
    -[PREditorElementLayoutController frameForElements:withBoundingRect:](v13, "frameForElements:withBoundingRect:", 16, v5, v7, v9, v11);
  }
  double v38 = v26;
  double v39 = v27;
  double v40 = v28;
  double v41 = v29;
  v42 = [(PRInlineComplicationContainerViewController *)self->_inlineComplicationContainerViewController view];
  objc_msgSend(v42, "setFrame:", v15, v17, v19, v21);

  v43 = NSString;
  v44 = [(PRComplicationContainerViewController *)self inlineComplicationDescriptor];
  v45 = [v44 widget];
  v46 = [v45 extensionBundleIdentifier];
  v47 = [(PRComplicationContainerViewController *)self inlineComplicationDescriptor];
  v48 = [v47 widget];
  v49 = [v48 kind];
  v50 = [v43 stringWithFormat:@"%@:%@", v46, v49];

  v51 = [(PRInlineComplicationContainerViewController *)self->_inlineComplicationContainerViewController view];
  [v51 setAccessibilityIdentifier:v50];

  v52 = [(PRWidgetGridViewController *)self->_widgetGridViewController view];
  objc_msgSend(v52, "setFrame:", v57, v56, v55, v54);

  v53 = [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController view];
  objc_msgSend(v53, "setFrame:", v38, v39, v40, v41);
}

- (PRComplicationDescriptor)inlineComplicationDescriptor
{
  return [(PRInlineComplicationContainerViewController *)self->_inlineComplicationContainerViewController complicationDescriptor];
}

- (void)setInlineComplicationDescriptor:(id)a3
{
}

- (void)setUsesEditingLayout:(BOOL)a3
{
}

- (void)setUsesEditingLayout:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    uint64_t v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.25];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(PRComplicationContainerViewController *)self setUsesEditingLayout:v4 animationSettings:v6];
}

- (void)setUsesEditingLayout:(BOOL)a3 animationSettings:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_usesEditingLayout != v4)
  {
    self->_usesEditingLayout = v4;
    id v7 = [(PRComplicationContainerViewController *)self viewIfLoaded];
    double v8 = v7;
    if (v7)
    {
      double v9 = (void *)MEMORY[0x1E4F4F898];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __80__PRComplicationContainerViewController_setUsesEditingLayout_animationSettings___block_invoke;
      v10[3] = &unk_1E54DAFB8;
      id v11 = v7;
      [v9 animateWithSettings:v6 actions:v10];
    }
  }
}

uint64_t __80__PRComplicationContainerViewController_setUsesEditingLayout_animationSettings___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)setFocusedElement:(int64_t)a3
{
}

- (void)setFocusedElement:(int64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    uint64_t v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(PRComplicationContainerViewController *)self setFocusedElement:a3 animationSettings:v6];
}

- (void)setFocusedElement:(int64_t)a3 animationSettings:(id)a4
{
  if (self->_focusedElement != a3)
  {
    self->_focusedElement = a3;
    [(PRComplicationContainerViewController *)self _updateFocusedWithAnimationSettings:a4];
  }
}

- (void)setVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
  id v5 = a3;
  [(PRWidgetGridViewController *)self->_widgetGridViewController setVibrancyConfiguration:v5];
  [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController setVibrancyConfiguration:v5];
  [(PRInlineComplicationContainerViewController *)self->_inlineComplicationContainerViewController setVibrancyConfiguration:v5];
}

- (void)_updateFocusedWithAnimationSettings:(id)a3
{
  inlineComplicationContainerViewController = self->_inlineComplicationContainerViewController;
  BOOL v5 = self->_focusedElement == 1;
  id v6 = a3;
  [(PRInlineComplicationContainerViewController *)inlineComplicationContainerViewController setFocused:v5 animationSettings:v6];
  [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController setFocused:self->_focusedElement == 3 animationSettings:v6];
  [(PRWidgetGridViewController *)self->_widgetGridViewController setFocused:self->_focusedElement == 2 animationSettings:v6];
}

- (void)inlineComplicationContainerViewControllerDidTapAdd:(id)a3
{
  id v4 = [(PRComplicationContainerViewController *)self delegate];
  [v4 complicationContainerViewControllerDidTapInlineGallery:self];
}

- (void)inlineComplicationContainerViewController:(id)a3 didEditComplication:(id)a4
{
  id v5 = a4;
  id v6 = [(PRComplicationContainerViewController *)self delegate];
  [v6 complicationContainerViewController:self didEditComplication:v5];
}

- (void)widgetGridModelDidUpdateContent:(id)a3
{
  sidebarWidgetGridViewController = self->_sidebarWidgetGridViewController;
  id v5 = a3;
  id v6 = [(PRWidgetGridViewController *)sidebarWidgetGridViewController model];

  id v7 = [(PRComplicationContainerViewController *)self delegate];
  [v7 complicationContainerViewController:self didUpdateModelContentForLocation:v6 == v5];
}

- (void)widgetGridViewController:(id)a3 didRequestConfigurationForComplicationDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = [(PRComplicationContainerViewController *)self delegate];
  [v6 complicationContainerViewController:self didEditComplication:v5];
}

- (void)widgetGridViewControllerDidTapBackground:(id)a3
{
  id v4 = a3;
  id v6 = [(PRComplicationContainerViewController *)self delegate];
  int64_t v5 = [(PRComplicationContainerViewController *)self _locationForViewController:v4];

  [v6 complicationContainerViewControllerDidTapAdd:self forLocation:v5];
}

- (void)widgetGridViewController:(id)a3 isAttemptingDragToAddComplication:(id)a4
{
  id v5 = a4;
  id v6 = [(PRComplicationContainerViewController *)self delegate];
  [v6 complicationContainerViewController:self isAttemptingDragToAddComplication:v5];
}

- (int64_t)_locationForViewController:(id)a3
{
  return self->_sidebarWidgetGridViewController == a3;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (PRInlineComplicationContainerViewController)inlineComplicationContainerViewController
{
  return self->_inlineComplicationContainerViewController;
}

- (void)setInlineComplicationContainerViewController:(id)a3
{
}

- (PRWidgetGridViewController)widgetGridViewController
{
  return self->_widgetGridViewController;
}

- (void)setWidgetGridViewController:(id)a3
{
}

- (PRWidgetGridViewController)sidebarWidgetGridViewController
{
  return self->_sidebarWidgetGridViewController;
}

- (void)setSidebarWidgetGridViewController:(id)a3
{
}

- (PRComplicationContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRComplicationContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (int64_t)focusedElement
{
  return self->_focusedElement;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sidebarWidgetGridViewController, 0);
  objc_storeStrong((id *)&self->_widgetGridViewController, 0);
  objc_storeStrong((id *)&self->_inlineComplicationContainerViewController, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
}

@end