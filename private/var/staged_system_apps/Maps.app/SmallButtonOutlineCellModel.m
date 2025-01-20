@interface SmallButtonOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (NSString)title;
- (SmallButtonOutlineCellDelegate)delegate;
- (SmallButtonOutlineCellModel)initWithStyle:(int64_t)a3 title:(id)a4 image:(id)a5 hoverImage:(id)a6 delegate:(id)a7;
- (UICollectionViewCellRegistration)cellRegistration;
- (UIImage)hoverImage;
- (UIImage)image;
- (int64_t)style;
- (unint64_t)hash;
@end

@implementation SmallButtonOutlineCellModel

- (SmallButtonOutlineCellModel)initWithStyle:(int64_t)a3 title:(id)a4 image:(id)a5 hoverImage:(id)a6 delegate:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SmallButtonOutlineCellModel;
  v16 = [(SmallButtonOutlineCellModel *)&v21 init];
  v17 = v16;
  if (v16)
  {
    v16->_style = a3;
    v18 = (NSString *)[v12 copy];
    title = v17->_title;
    v17->_title = v18;

    objc_storeStrong((id *)&v17->_image, a5);
    objc_storeStrong((id *)&v17->_hoverImage, a6);
    objc_storeWeak((id *)&v17->_delegate, v15);
  }

  return v17;
}

- (unint64_t)hash
{
  int64_t style = self->_style;
  return [(NSString *)self->_title hash] ^ style;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SmallButtonOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if ([(SmallButtonOutlineCellModel *)v6 style] == self->_style)
    {
      v7 = [(SmallButtonOutlineCellModel *)v6 title];
      v8 = v7;
      if (v7 == self->_title || -[NSString isEqual:](v7, "isEqual:"))
      {
        v9 = [(SmallButtonOutlineCellModel *)v6 image];
        v10 = v9;
        if (v9 == self->_image || -[UIImage isEqual:](v9, "isEqual:"))
        {
          v11 = [(SmallButtonOutlineCellModel *)v6 hoverImage];
          id v12 = v11;
          if (v11 == self->_hoverImage || -[UIImage isEqual:](v11, "isEqual:"))
          {
            id v13 = [(SmallButtonOutlineCellModel *)v6 delegate];
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            if (v13 == WeakRetained) {
              unsigned __int8 v15 = 1;
            }
            else {
              unsigned __int8 v15 = [v13 isEqual:WeakRetained];
            }
          }
          else
          {
            unsigned __int8 v15 = 0;
          }
        }
        else
        {
          unsigned __int8 v15 = 0;
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[SmallButtonOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(SmallButtonOutlineCellModel *)self isEqual:a3];
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)hoverImage
{
  return self->_hoverImage;
}

- (SmallButtonOutlineCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SmallButtonOutlineCellDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hoverImage, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end