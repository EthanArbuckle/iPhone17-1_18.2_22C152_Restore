@interface UIMoreListCellLayoutManager
- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4;
- (double)setWidestImageWidthFromViewControllers:(id)a3;
- (void)layoutSubviewsOfCell:(id)a3;
@end

@implementation UIMoreListCellLayoutManager

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4 = a3;
  v5 = [v4 imageView];
  [v5 setContentMode:4];

  v6.receiver = self;
  v6.super_class = (Class)UIMoreListCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v6 layoutSubviewsOfCell:v4];
}

- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIMoreListCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v21 standardLayoutImageViewFrameForCell:v6 forSizing:v4];
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double widestImageWidth = self->_widestImageWidth;
  if (widestImageWidth <= 0.00000011920929)
  {
    double widestImageWidth = v7;
  }
  else if ((v6[28] & 0x80000) != 0)
  {
    v15 = [v6 contentView];
    [v15 bounds];
    CGFloat v16 = CGRectGetMaxX(v22) + -15.0;
    v23.origin.x = v9;
    v23.origin.y = v11;
    v23.size.width = widestImageWidth;
    v23.size.height = v13;
    double v9 = v16 - CGRectGetWidth(v23);
  }
  else
  {
    double v9 = 15.0;
  }

  double v17 = v9;
  double v18 = v11;
  double v19 = widestImageWidth;
  double v20 = v13;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)setWidestImageWidthFromViewControllers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_double widestImageWidth = 0.0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v10 = __UIMoreListImageForViewController(0, v9, 0);
        CGFloat v11 = v10;
        if (v10)
        {
          double widestImageWidth = self->_widestImageWidth;
          [v10 size];
          if (widestImageWidth >= v13) {
            double v13 = widestImageWidth;
          }
          self->_double widestImageWidth = v13;
        }
        v14 = __UIMoreListImageForViewController(0, v9, 1);

        if (v14)
        {
          double v15 = self->_widestImageWidth;
          [v14 size];
          if (v15 >= v16) {
            double v16 = v15;
          }
          self->_double widestImageWidth = v16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  double v17 = self->_widestImageWidth;

  return v17;
}

@end