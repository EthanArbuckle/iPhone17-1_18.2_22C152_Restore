@interface _SBIconGridImageWrapperView
- (SBFolderIconImageView)folderIconImageView;
- (_SBFolderPageElement)element;
- (void)positionAtRow:(unint64_t)a3;
- (void)reposition;
- (void)setElement:(id)a3;
- (void)setFolderIconImageView:(id)a3;
@end

@implementation _SBIconGridImageWrapperView

- (void)reposition
{
  v3 = [(_SBIconGridImageWrapperView *)self element];

  if (v3)
  {
    v4 = [(_SBIconGridImageWrapperView *)self element];
    id v16 = [v4 gridImage];

    [v16 size];
    double v6 = v5;
    v7 = [v16 listLayout];
    v8 = objc_opt_class();
    v9 = [(_SBIconGridImageWrapperView *)self element];
    objc_msgSend(v8, "rectAtIndex:inLayout:maxCount:", objc_msgSend(v9, "firstVisibleMiniIconIndex"), v7, objc_msgSend(v16, "numberOfCells"));
    double v11 = v10;

    [(id)objc_opt_class() sizeForLayout:v7];
    double v12 = fmax(fmin(v11 / v6, 1.0), 0.0);
    double v14 = fmax(fmin(v13 / v6, 1.0), 0.0);
    v15 = [(_SBIconGridImageWrapperView *)self layer];
    objc_msgSend(v15, "setContentsRect:", 0.0, v12, 1.0, v14);
  }
}

- (_SBFolderPageElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  double v5 = (_SBFolderPageElement *)a3;
  if (self->_element != v5)
  {
    double v10 = v5;
    objc_storeStrong((id *)&self->_element, a3);
    double v6 = [(_SBFolderPageElement *)v10 gridImage];
    if (!v6)
    {
      if ([(_SBFolderPageElement *)v10 isGridImagePossible])
      {
        v7 = [(_SBIconGridImageWrapperView *)self folderIconImageView];
        [v7 fulfillGridImageForPageElement:v10];
        double v6 = [(_SBFolderPageElement *)v10 gridImage];
      }
      else
      {
        double v6 = 0;
      }
    }
    [(_SBIconGridImageWrapperView *)self setImage:v6];
    [v6 size];
    -[_SBIconGridImageWrapperView setBounds:](self, "setBounds:", 0.0, 0.0, v8, v9);
    [(_SBIconGridImageWrapperView *)self reposition];
  }
  MEMORY[0x1F4181820]();
}

- (SBFolderIconImageView)folderIconImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIconImageView);
  return (SBFolderIconImageView *)WeakRetained;
}

- (void)setFolderIconImageView:(id)a3
{
}

- (void)positionAtRow:(unint64_t)a3
{
  double v5 = [(_SBIconGridImageWrapperView *)self element];
  [v5 setVisibleRow:a3];

  [(_SBIconGridImageWrapperView *)self reposition];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_folderIconImageView);
  objc_storeStrong((id *)&self->_element, 0);
}

@end