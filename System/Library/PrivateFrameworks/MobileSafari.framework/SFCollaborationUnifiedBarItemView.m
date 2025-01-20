@interface SFCollaborationUnifiedBarItemView
- (_SWCollaborationButtonView)collaborationButton;
- (double)preferredWidth;
- (void)setCollaborationButton:(id)a3;
@end

@implementation SFCollaborationUnifiedBarItemView

- (void)setCollaborationButton:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v5 = (_SWCollaborationButtonView *)a3;
  collaborationButton = self->_collaborationButton;
  if (collaborationButton != v5)
  {
    [(_SWCollaborationButtonView *)collaborationButton removeFromSuperview];
    objc_storeStrong((id *)&self->_collaborationButton, a3);
    if (v5)
    {
      [(_SWCollaborationButtonView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      v7 = [(SFUnifiedBarItemView *)self contentView];
      [v7 addSubview:v5];
      v15 = (void *)MEMORY[0x1E4F28DC8];
      v8 = [(_SWCollaborationButtonView *)v5 centerXAnchor];
      v9 = [v7 centerXAnchor];
      v10 = [v8 constraintEqualToAnchor:v9];
      v16[0] = v10;
      v11 = [(_SWCollaborationButtonView *)v5 centerYAnchor];
      v12 = [v7 centerYAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v16[1] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      [v15 activateConstraints:v14];

      [(SFCollaborationUnifiedBarItemView *)self setPointerStyleProvider:&__block_literal_global_51];
    }
  }
}

id __60__SFCollaborationUnifiedBarItemView_setCollaborationButton___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4FB1AE8];
  v5 = (void *)MEMORY[0x1E4FB1AE0];
  id v6 = a3;
  v7 = objc_msgSend(v5, "sf_shapeForToolbarButton:", a2);
  v8 = [v4 styleWithEffect:v6 shape:v7];

  return v8;
}

- (double)preferredWidth
{
  -[_SWCollaborationButtonView systemLayoutSizeFittingSize:](self->_collaborationButton, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  return result;
}

- (_SWCollaborationButtonView)collaborationButton
{
  return self->_collaborationButton;
}

- (void).cxx_destruct
{
}

@end