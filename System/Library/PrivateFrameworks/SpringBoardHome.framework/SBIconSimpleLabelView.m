@interface SBIconSimpleLabelView
- (SBIconLabelImageParameters)imageParameters;
- (SBIconView)iconView;
- (void)setIconView:(id)a3;
- (void)updateIconLabelWithSettings:(id)a3 imageParameters:(id)a4;
@end

@implementation SBIconSimpleLabelView

- (void)updateIconLabelWithSettings:(id)a3 imageParameters:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    v6 = [(SBIconSimpleLabelView *)self image];
    v7 = [v6 parameters];
    v8 = v7;
    if (!v6 || ([v7 isEqual:v5] & 1) == 0)
    {
      v9 = [(SBIconSimpleLabelView *)self iconView];
      v10 = v9;
      if (v9)
      {
        v11 = [v9 labelImageWithParameters:v5];
      }
      else
      {
        v11 = 0;
      }
      [(SBIconSimpleLabelView *)self setImage:v11];
    }
    if ([v5 isColorspaceGrayscale])
    {
      v12 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
      id v13 = [v5 textColor];
      objc_msgSend(v12, "setValue:forKey:", objc_msgSend(v13, "CGColor"), @"inputColor");

      v14 = [(SBIconSimpleLabelView *)self layer];
      v17[0] = v12;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [v14 setFilters:v15];
    }
    else
    {
      v16 = [(SBIconSimpleLabelView *)self layer];
      [v16 setFilters:0];
    }
  }
  else
  {
    [(SBIconSimpleLabelView *)self setImage:0];
  }
}

- (SBIconLabelImageParameters)imageParameters
{
  v2 = [(SBIconSimpleLabelView *)self image];
  v3 = [v2 parameters];

  return (SBIconLabelImageParameters *)v3;
}

- (SBIconView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  return (SBIconView *)WeakRetained;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end