@interface OBSetupAssistantDynamicLayoutController
- (BOOL)enableStickyHeader;
- (NSString)localDetailText;
- (NSString)localTitle;
- (OBSetupAssistantDynamicLayoutController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (OBSetupAssistantDynamicLayoutController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (OBWelcomeController)backingController;
- (UIImage)localImage;
- (UIView)mainContentSubview;
- (UIView)outerContentView;
- (id)buttonTray;
- (id)constraintForLayoutFactory;
- (id)contentView;
- (id)headerView;
- (int64_t)contentViewLayout;
- (void)_relayoutContentSubviewIfNeeded;
- (void)_updateScrollUnderLayout;
- (void)addContentSubView:(id)a3 heightConstraintForLayout:(id)a4;
- (void)resetLayoutTo:(int64_t)a3;
- (void)setBackingController:(id)a3;
- (void)setConstraintForLayoutFactory:(id)a3;
- (void)setEnableStickyHeader:(BOOL)a3;
- (void)setLocalDetailText:(id)a3;
- (void)setLocalImage:(id)a3;
- (void)setLocalTitle:(id)a3;
- (void)setMainContentSubview:(id)a3;
- (void)setOuterContentView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation OBSetupAssistantDynamicLayoutController

- (OBSetupAssistantDynamicLayoutController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  return [(OBSetupAssistantDynamicLayoutController *)self initWithTitle:a3 detailText:a4 icon:a5 contentLayout:2];
}

- (OBSetupAssistantDynamicLayoutController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)OBSetupAssistantDynamicLayoutController;
  v14 = [(OBSetupAssistantDynamicLayoutController *)&v21 initWithNibName:0 bundle:0];
  if (v14)
  {
    v15 = [[OBWelcomeController alloc] initWithTitle:v11 detailText:v12 icon:v13 contentLayout:a6];
    backingController = v14->_backingController;
    v14->_backingController = v15;

    objc_storeStrong((id *)&v14->_localImage, a5);
    objc_storeStrong((id *)&v14->_localTitle, a3);
    objc_storeStrong((id *)&v14->_localDetailText, a4);
    id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    outerContentView = v14->_outerContentView;
    v14->_outerContentView = (UIView *)v18;

    [(UIView *)v14->_outerContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  return v14;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)OBSetupAssistantDynamicLayoutController;
  [(OBSetupAssistantDynamicLayoutController *)&v18 viewDidLoad];
  [(OBSetupAssistantDynamicLayoutController *)self setEdgesForExtendedLayout:0];
  [(OBSetupAssistantDynamicLayoutController *)self setExtendedLayoutIncludesOpaqueBars:1];
  v3 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(OBSetupAssistantDynamicLayoutController *)self view];
  v6 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v7 = [v6 view];
  [v5 addSubview:v7];

  v8 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v9 = [v8 view];
  v10 = [(OBSetupAssistantDynamicLayoutController *)self view];
  objc_msgSend(v9, "ob_pinToEdges:", v10);

  id v11 = [(OBSetupAssistantDynamicLayoutController *)self view];
  id v12 = [(OBSetupAssistantDynamicLayoutController *)self outerContentView];
  [v11 addSubview:v12];

  id v13 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v14 = [v13 bleedView];
  [v14 setHidden:1];

  v15 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v16 = [v15 bleedView];
  [v16 removeFromSuperview];

  id v17 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  [v17 setTemplateType:2];
}

- (void)viewDidLayoutSubviews
{
  [(OBSetupAssistantDynamicLayoutController *)self _updateScrollUnderLayout];
  [(OBSetupAssistantDynamicLayoutController *)self _relayoutContentSubviewIfNeeded];
  v3 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v4 = [v3 view];
  [v4 layoutIfNeeded];

  v5.receiver = self;
  v5.super_class = (Class)OBSetupAssistantDynamicLayoutController;
  [(OBSetupAssistantDynamicLayoutController *)&v5 viewDidLayoutSubviews];
}

- (id)headerView
{
  v2 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v3 = [v2 headerView];

  return v3;
}

- (id)contentView
{
  v2 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v3 = [v2 contentView];

  return v3;
}

- (int64_t)contentViewLayout
{
  v2 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  int64_t v3 = [v2 contentViewLayout];

  return v3;
}

- (id)buttonTray
{
  v2 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  int64_t v3 = [v2 buttonTray];

  return v3;
}

- (void)addContentSubView:(id)a3 heightConstraintForLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBSetupAssistantDynamicLayoutController *)self setMainContentSubview:v7];
  v8 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
  [v8 addSubview:v7];

  [(OBSetupAssistantDynamicLayoutController *)self setConstraintForLayoutFactory:v6];
  v9 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
  objc_msgSend(v7, "ob_pinToEdges:", v9);

  id v11 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
  v10 = [v11 view];
  [v10 setNeedsLayout];
}

- (void)setEnableStickyHeader:(BOOL)a3
{
  self->_enableStickyHeader = a3;
  [(OBSetupAssistantDynamicLayoutController *)self _updateScrollUnderLayout];
}

- (void)resetLayoutTo:(int64_t)a3
{
  if ([(OBSetupAssistantDynamicLayoutController *)self contentViewLayout] != a3)
  {
    objc_super v5 = [OBWelcomeController alloc];
    id v6 = [(OBSetupAssistantDynamicLayoutController *)self localTitle];
    id v7 = [(OBSetupAssistantDynamicLayoutController *)self localDetailText];
    v8 = [(OBSetupAssistantDynamicLayoutController *)self localImage];
    v26 = [(OBWelcomeController *)v5 initWithTitle:v6 detailText:v7 icon:v8 contentLayout:a3];

    v9 = [(OBWelcomeController *)v26 view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(OBWelcomeController *)v26 contentView];
    [v10 setBackgroundColor:0];

    id v11 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
    [v11 setTemplateType:2];

    id v12 = [(OBSetupAssistantDynamicLayoutController *)self view];
    id v13 = [(OBWelcomeController *)v26 view];
    v14 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
    v15 = [v14 view];
    [v12 insertSubview:v13 belowSubview:v15];

    v16 = [(OBWelcomeController *)v26 view];
    id v17 = [(OBSetupAssistantDynamicLayoutController *)self view];
    objc_msgSend(v16, "ob_pinToEdges:", v17);

    objc_super v18 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    [v18 removeFromSuperview];

    v19 = [(OBWelcomeController *)v26 contentView];
    v20 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    [v19 addSubview:v20];

    objc_super v21 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    v22 = [(OBWelcomeController *)v26 contentView];
    objc_msgSend(v21, "ob_pinToEdges:", v22);

    [(OBSetupAssistantDynamicLayoutController *)self _updateScrollUnderLayout];
    v23 = [(OBSetupAssistantDynamicLayoutController *)self backingController];
    v24 = [v23 view];
    [v24 removeFromSuperview];

    [(OBSetupAssistantDynamicLayoutController *)self setBackingController:v26];
    [(OBSetupAssistantDynamicLayoutController *)self _relayoutContentSubviewIfNeeded];
    v25 = [(OBSetupAssistantDynamicLayoutController *)self view];
    [v25 setNeedsLayout];
  }
}

- (void)_updateScrollUnderLayout
{
  v48[4] = *MEMORY[0x1E4F143B8];
  id v45 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
  [v45 bounds];
  if (v3 < 1.0)
  {
    v4 = v45;
LABEL_3:

    return;
  }
  int64_t v5 = [(OBSetupAssistantDynamicLayoutController *)self contentViewLayout];

  if (v5 != 1) {
    return;
  }
  BOOL v6 = [(OBSetupAssistantDynamicLayoutController *)self enableStickyHeader];
  id v7 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
  v8 = [v7 superview];
  v9 = [(OBSetupAssistantDynamicLayoutController *)self outerContentView];

  if (!v6)
  {
    if (v8 != v9) {
      return;
    }
    v29 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    [v29 removeFromSuperview];

    v30 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
    v31 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    [v30 addSubview:v31];

    id v47 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    v32 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
    objc_msgSend(v47, "ob_pinToEdges:", v32);

    v4 = v47;
    goto LABEL_3;
  }
  if (v8 != v9)
  {
    v36 = (void *)MEMORY[0x1E4F28DC8];
    id v46 = [(OBSetupAssistantDynamicLayoutController *)self outerContentView];
    v43 = [v46 topAnchor];
    v44 = [(OBSetupAssistantDynamicLayoutController *)self view];
    v42 = [v44 topAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v48[0] = v41;
    v40 = [(OBSetupAssistantDynamicLayoutController *)self outerContentView];
    v38 = [v40 leadingAnchor];
    v39 = [(OBSetupAssistantDynamicLayoutController *)self view];
    v37 = [v39 leadingAnchor];
    v35 = [v38 constraintEqualToAnchor:v37];
    v48[1] = v35;
    v34 = [(OBSetupAssistantDynamicLayoutController *)self outerContentView];
    v33 = [v34 trailingAnchor];
    v10 = [(OBSetupAssistantDynamicLayoutController *)self view];
    id v11 = [v10 trailingAnchor];
    id v12 = [v33 constraintEqualToAnchor:v11];
    v48[2] = v12;
    id v13 = [(OBSetupAssistantDynamicLayoutController *)self outerContentView];
    v14 = [v13 heightAnchor];
    v15 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
    v16 = [v15 heightAnchor];
    id v17 = [v14 constraintEqualToAnchor:v16];
    v48[3] = v17;
    objc_super v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    [v36 activateConstraints:v18];

    v19 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];

    if (!v19)
    {
      v20 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
      objc_super v21 = [v20 subviews];
      v22 = [v21 firstObject];
      [(OBSetupAssistantDynamicLayoutController *)self setMainContentSubview:v22];

      v23 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
      [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    v24 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    [v24 removeFromSuperview];

    v25 = [(OBSetupAssistantDynamicLayoutController *)self outerContentView];
    v26 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    [v25 addSubview:v26];

    v27 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    v28 = [(OBSetupAssistantDynamicLayoutController *)self outerContentView];
    objc_msgSend(v27, "ob_pinToEdges:", v28);
  }
}

- (void)_relayoutContentSubviewIfNeeded
{
  if ([(OBSetupAssistantDynamicLayoutController *)self contentViewLayout] != 1)
  {
    double v3 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    [v3 removeFromSuperview];

    v4 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
    int64_t v5 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    [v4 addSubview:v5];

    BOOL v6 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
    id v7 = [(OBSetupAssistantDynamicLayoutController *)self mainContentSubview];
    objc_msgSend(v6, "ob_pinToEdges:", v7);

    id v11 = [(OBSetupAssistantDynamicLayoutController *)self constraintForLayoutFactory];
    int64_t v8 = [(OBSetupAssistantDynamicLayoutController *)self contentViewLayout];
    v9 = [(OBSetupAssistantDynamicLayoutController *)self contentView];
    v10 = v11[2](v11, v8, v9);
    [v10 setActive:1];
  }
}

- (BOOL)enableStickyHeader
{
  return self->_enableStickyHeader;
}

- (OBWelcomeController)backingController
{
  return self->_backingController;
}

- (void)setBackingController:(id)a3
{
}

- (id)constraintForLayoutFactory
{
  return self->_constraintForLayoutFactory;
}

- (void)setConstraintForLayoutFactory:(id)a3
{
}

- (UIView)mainContentSubview
{
  return self->_mainContentSubview;
}

- (void)setMainContentSubview:(id)a3
{
}

- (UIView)outerContentView
{
  return self->_outerContentView;
}

- (void)setOuterContentView:(id)a3
{
}

- (NSString)localTitle
{
  return self->_localTitle;
}

- (void)setLocalTitle:(id)a3
{
}

- (NSString)localDetailText
{
  return self->_localDetailText;
}

- (void)setLocalDetailText:(id)a3
{
}

- (UIImage)localImage
{
  return self->_localImage;
}

- (void)setLocalImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localImage, 0);
  objc_storeStrong((id *)&self->_localDetailText, 0);
  objc_storeStrong((id *)&self->_localTitle, 0);
  objc_storeStrong((id *)&self->_outerContentView, 0);
  objc_storeStrong((id *)&self->_mainContentSubview, 0);
  objc_storeStrong(&self->_constraintForLayoutFactory, 0);
  objc_storeStrong((id *)&self->_backingController, 0);
}

@end