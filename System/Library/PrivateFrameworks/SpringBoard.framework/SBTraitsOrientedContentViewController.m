@interface SBTraitsOrientedContentViewController
- (BOOL)_canShowWhileLocked;
- (SBTraitsOrientedContentViewControllerView)view;
- (TRAParticipant)containerParticipant;
- (TRAParticipant)contentParticipant;
- (id)actuateAlongsideBlock;
- (void)loadView;
- (void)setActuateAlongsideBlock:(id)a3;
- (void)setContainerParticipant:(id)a3;
- (void)setContentParticipant:(id)a3;
- (void)updateOrientationIfNeeded;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBTraitsOrientedContentViewController

- (SBTraitsOrientedContentViewControllerView)view
{
  v4.receiver = self;
  v4.super_class = (Class)SBTraitsOrientedContentViewController;
  v2 = [(SBTraitsOrientedContentViewController *)&v4 view];
  return (SBTraitsOrientedContentViewControllerView *)v2;
}

- (void)loadView
{
  v3 = [SBTraitsOrientedContentViewControllerView alloc];
  objc_super v4 = -[SBTraitsOrientedContentViewControllerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBTraitsOrientedContentViewController *)self setView:v4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBTraitsOrientedContentViewController;
  -[SBTraitsOrientedContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentParticipant);

  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92__SBTraitsOrientedContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v9[3] = &unk_1E6AF53F8;
    v9[4] = self;
    [v7 animateAlongsideTransition:v9 completion:0];
  }
}

uint64_t __92__SBTraitsOrientedContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrientationIfNeeded];
}

- (void)updateOrientationIfNeeded
{
  p_contentParticipant = &self->_contentParticipant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentParticipant);

  if (!WeakRetained)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  id v16 = objc_loadWeakRetained((id *)p_contentParticipant);
  id v6 = objc_loadWeakRetained((id *)&self->_containerParticipant);
  if (v16)
  {
    id v7 = [(SBTraitsOrientedContentViewController *)self view];
    if (v6)
    {
      uint64_t v8 = objc_msgSend(v6, "sbf_currentOrientation");
    }
    else
    {
      v9 = [(SBTraitsOrientedContentViewController *)self view];
      objc_super v10 = [v9 window];
      uint64_t v8 = [v10 interfaceOrientation];
    }
    uint64_t v11 = objc_msgSend(v16, "sbf_currentOrientation");
    [MEMORY[0x1E4F43058] _synchronizeDrawing];
    [v7 setContainerOrientation:v8];
    [v7 setContentOrientation:v11];
    actuateAlongsideBlock = (void (**)(id, uint64_t, double, double))self->_actuateAlongsideBlock;
    if (actuateAlongsideBlock)
    {
      [v7 contentViewBoundsInReferenceSpace];
      actuateAlongsideBlock[2](actuateAlongsideBlock, v11, v13, v14);
    }
    [v7 setNeedsLayout];
    [v7 layoutIfNeeded];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TRAParticipant)contentParticipant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentParticipant);
  return (TRAParticipant *)WeakRetained;
}

- (void)setContentParticipant:(id)a3
{
}

- (TRAParticipant)containerParticipant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerParticipant);
  return (TRAParticipant *)WeakRetained;
}

- (void)setContainerParticipant:(id)a3
{
}

- (id)actuateAlongsideBlock
{
  return self->_actuateAlongsideBlock;
}

- (void)setActuateAlongsideBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actuateAlongsideBlock, 0);
  objc_destroyWeak((id *)&self->_containerParticipant);
  objc_destroyWeak((id *)&self->_contentParticipant);
}

@end