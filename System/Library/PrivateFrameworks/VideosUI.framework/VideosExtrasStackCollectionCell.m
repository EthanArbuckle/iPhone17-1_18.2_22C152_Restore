@interface VideosExtrasStackCollectionCell
- (VideosExtrasGridElementViewController)viewController;
- (VideosExtrasGridSectionHeaderStyle)sectionStyle;
- (VideosExtrasStackTemplateViewController)parentViewController;
- (void)setParentViewController:(id)a3;
- (void)setViewController:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation VideosExtrasStackCollectionCell

- (void)willMoveToSuperview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasStackCollectionCell;
  [(VideosExtrasStackCollectionCell *)&v4 willMoveToSuperview:a3];
  if (self->_needsViewWillAppear)
  {
    [(VideosExtrasGridElementViewController *)self->_viewController viewWillAppear:0];
    self->_needsViewWillAppear = 0;
  }
}

- (void)setViewController:(id)a3
{
  v5 = (VideosExtrasGridElementViewController *)a3;
  p_viewController = (id *)&self->_viewController;
  viewController = self->_viewController;
  v18 = v5;
  if (viewController != v5)
  {
    if (self->_fitConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      viewController = (VideosExtrasGridElementViewController *)*p_viewController;
    }
    v8 = [(VideosExtrasGridElementViewController *)viewController view];
    v9 = [v8 superview];

    if (v9 == self)
    {
      [*p_viewController willMoveToParentViewController:0];
      v10 = [*p_viewController view];
      [v10 removeFromSuperview];

      [*p_viewController removeFromParentViewController];
    }
    if (v18)
    {
      v11 = [(VideosExtrasStackCollectionCell *)self superview];

      if (!v11) {
        self->_needsViewWillAppear = 1;
      }
      v12 = [(VideosExtrasStackCollectionCell *)self parentViewController];
      [v12 addChildViewController:v18];

      v13 = [(VideosExtrasGridElementViewController *)v18 view];
      v14 = [(VideosExtrasStackCollectionCell *)self contentView];
      [v14 addSubview:v13];
      objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v13, v14, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      fitConstraints = self->_fitConstraints;
      self->_fitConstraints = v15;

      [MEMORY[0x1E4F28DC8] activateConstraints:self->_fitConstraints];
      v17 = [(VideosExtrasStackCollectionCell *)self parentViewController];
      [(VideosExtrasGridElementViewController *)v18 didMoveToParentViewController:v17];
    }
    else
    {
      v13 = self->_fitConstraints;
      self->_fitConstraints = 0;
    }

    objc_storeStrong(p_viewController, a3);
  }
}

- (VideosExtrasStackTemplateViewController)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
}

- (VideosExtrasGridElementViewController)viewController
{
  return self->_viewController;
}

- (VideosExtrasGridSectionHeaderStyle)sectionStyle
{
  return self->_sectionStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionStyle, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_fitConstraints, 0);
}

@end