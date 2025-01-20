@interface _SBIconGridLiveWrapperView
- (SBFolderIconImageView)folderIconImageView;
- (_SBFolderPageElement)element;
- (void)layoutSubviews;
- (void)positionAtRow:(unint64_t)a3;
- (void)setElement:(id)a3;
- (void)setFolderIconImageView:(id)a3;
@end

@implementation _SBIconGridLiveWrapperView

- (void)setElement:(id)a3
{
  v5 = (_SBFolderPageElement *)a3;
  element = self->_element;
  if (element != v5)
  {
    v11 = v5;
    v7 = [(_SBFolderPageElement *)element gridLayer];
    [v7 removeFromSuperlayer];
    objc_storeStrong((id *)&self->_element, a3);
    v8 = [(_SBFolderPageElement *)v11 gridLayer];
    if (v8
      || [(_SBFolderPageElement *)v11 isGridImagePossible]
      && ([(_SBIconGridLiveWrapperView *)self folderIconImageView],
          v10 = objc_claimAutoreleasedReturnValue(),
          [v10 fulfillGridLayerForPageElement:v11],
          [(_SBFolderPageElement *)v11 gridLayer],
          v8 = objc_claimAutoreleasedReturnValue(),
          v10,
          v8))
    {
      [v8 bounds];
      -[_SBIconGridLiveWrapperView setBounds:](self, "setBounds:");
      v9 = [(_SBIconGridLiveWrapperView *)self layer];
      [v9 addSublayer:v8];
    }
    [(_SBIconGridLiveWrapperView *)self setNeedsLayout];

    v5 = v11;
  }
}

- (SBFolderIconImageView)folderIconImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIconImageView);
  return (SBFolderIconImageView *)WeakRetained;
}

- (void)layoutSubviews
{
  id v4 = [(_SBIconGridLiveWrapperView *)self element];
  v3 = [v4 gridLayer];
  [(_SBIconGridLiveWrapperView *)self bounds];
  UIRectGetCenter();
  objc_msgSend(v3, "setPosition:");
}

- (_SBFolderPageElement)element
{
  return self->_element;
}

- (void)positionAtRow:(unint64_t)a3
{
  id v4 = [(_SBIconGridLiveWrapperView *)self element];
  [v4 setVisibleRow:a3];
}

- (void)setFolderIconImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_folderIconImageView);
  objc_storeStrong((id *)&self->_element, 0);
}

@end