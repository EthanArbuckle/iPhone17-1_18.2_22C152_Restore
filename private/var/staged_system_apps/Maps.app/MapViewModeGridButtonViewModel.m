@interface MapViewModeGridButtonViewModel
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)selected;
- (MapViewModeGridButtonViewDelegate)delegate;
- (MapViewModeGridButtonViewModel)initWithTitle:(id)a3 image:(id)a4 wideImage:(id)a5 enabled:(BOOL)a6 selected:(BOOL)a7 overflowMenu:(id)a8 delegate:(id)a9 axIdentifier:(id)a10;
- (NSString)axIdentifierForView;
- (NSString)title;
- (UIImage)image;
- (UIImage)wideImage;
- (UIMenu)overflowMenu;
- (unint64_t)hash;
@end

@implementation MapViewModeGridButtonViewModel

- (MapViewModeGridButtonViewModel)initWithTitle:(id)a3 image:(id)a4 wideImage:(id)a5 enabled:(BOOL)a6 selected:(BOOL)a7 overflowMenu:(id)a8 delegate:(id)a9 axIdentifier:(id)a10
{
  id v25 = a3;
  id v24 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)MapViewModeGridButtonViewModel;
  v19 = [(MapViewModeGridButtonViewModel *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_title, a3);
    objc_storeStrong((id *)&v20->_image, a4);
    objc_storeStrong((id *)&v20->_wideImage, a5);
    v20->_enabled = a6;
    v20->_selected = a7;
    objc_storeStrong((id *)&v20->_overflowMenu, a8);
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_axIdentifierForView, a10);
  }

  return v20;
}

- (unint64_t)hash
{
  return [(NSString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MapViewModeGridButtonViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(MapViewModeGridButtonViewModel *)v6 title];
    v8 = v7;
    if (v7 == self->_title || -[NSString isEqual:](v7, "isEqual:"))
    {
      v9 = [(MapViewModeGridButtonViewModel *)v6 image];
      v10 = v9;
      if (v9 == self->_image || -[UIImage isEqual:](v9, "isEqual:"))
      {
        v11 = [(MapViewModeGridButtonViewModel *)v6 wideImage];
        v12 = v11;
        if ((v11 == self->_wideImage || -[UIImage isEqual:](v11, "isEqual:"))
          && self->_enabled == [(MapViewModeGridButtonViewModel *)v6 enabled]
          && self->_selected == [(MapViewModeGridButtonViewModel *)v6 selected])
        {
          v13 = [(MapViewModeGridButtonViewModel *)v6 overflowMenu];
          if (v13 == self->_overflowMenu)
          {
            id v16 = [(MapViewModeGridButtonViewModel *)v6 delegate];
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            if (v16 == WeakRetained) {
              unsigned __int8 v14 = 1;
            }
            else {
              unsigned __int8 v14 = [v16 isEqual:WeakRetained];
            }
          }
          else
          {
            unsigned __int8 v14 = 0;
          }
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)wideImage
{
  return self->_wideImage;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)selected
{
  return self->_selected;
}

- (UIMenu)overflowMenu
{
  return self->_overflowMenu;
}

- (MapViewModeGridButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapViewModeGridButtonViewDelegate *)WeakRetained;
}

- (NSString)axIdentifierForView
{
  return self->_axIdentifierForView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axIdentifierForView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overflowMenu, 0);
  objc_storeStrong((id *)&self->_wideImage, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end