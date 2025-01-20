@interface PXUIFlattenedAssetBadgeView
- (BOOL)isOpaque;
- (void)_setBackgroundImage:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNeedsLayout;
@end

@implementation PXUIFlattenedAssetBadgeView

- (void).cxx_destruct
{
}

- (void)_setBackgroundImage:(id)a3
{
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXUIFlattenedAssetBadgeView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  CurrentContext = UIGraphicsGetCurrentContext();
  v21.origin.CGFloat x = v9;
  v21.origin.CGFloat y = v11;
  v21.size.CGFloat width = v13;
  v21.size.CGFloat height = v15;
  CGContextClearRect(CurrentContext, v21);
  -[UIImage drawInRect:](self->_backgroundImage, "drawInRect:", v9, v11, v13, v15);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PXUIFlattenedAssetBadgeView_drawRect___block_invoke;
  aBlock[3] = &__block_descriptor_64_e34_v16__0___PXUIAssetBadgeImageView_8l;
  *(CGFloat *)&aBlock[4] = x;
  *(CGFloat *)&aBlock[5] = y;
  *(CGFloat *)&aBlock[6] = width;
  *(CGFloat *)&aBlock[7] = height;
  v17 = (void (**)(void *, _PXUIAssetBadgeImageView *))_Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __40__PXUIFlattenedAssetBadgeView_drawRect___block_invoke_2;
  v19[3] = &__block_descriptor_64_e17_v16__0__UILabel_8l;
  *(CGFloat *)&v19[4] = x;
  *(CGFloat *)&v19[5] = y;
  *(CGFloat *)&v19[6] = width;
  *(CGFloat *)&v19[7] = height;
  v18 = (void (**)(void *, UILabel *))_Block_copy(v19);
  v17[2](v17, self->super._bottomLeadingImageView);
  v17[2](v17, self->super._bottomTrailingImageView);
  v18[2](v18, self->super._bottomLabel);
}

void __40__PXUIFlattenedAssetBadgeView_drawRect___block_invoke(CGRect *a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    double v13 = v3;
    char v5 = [v3 isHidden];
    v4 = v13;
    if ((v5 & 1) == 0)
    {
      [v13 frame];
      double x = v15.origin.x;
      double y = v15.origin.y;
      double width = v15.size.width;
      double height = v15.size.height;
      BOOL v10 = CGRectIntersectsRect(v15, a1[1]);
      v4 = v13;
      if (v10)
      {
        double v11 = [v13 image];
        [v13 alpha];
        objc_msgSend(v11, "drawInRect:blendMode:alpha:", 0, x, y, width, height, v12);

        v4 = v13;
      }
    }
  }
}

void __40__PXUIFlattenedAssetBadgeView_drawRect___block_invoke_2(CGRect *a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    double v11 = v3;
    char v5 = [v3 isHidden];
    v4 = v11;
    if ((v5 & 1) == 0)
    {
      [v11 frame];
      double x = v13.origin.x;
      double y = v13.origin.y;
      double width = v13.size.width;
      double height = v13.size.height;
      BOOL v10 = CGRectIntersectsRect(v13, a1[1]);
      v4 = v11;
      if (v10)
      {
        objc_msgSend(v11, "drawTextInRect:", x, y, width, height);
        v4 = v11;
      }
    }
  }
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)PXUIFlattenedAssetBadgeView;
  [(PXUIFlattenedAssetBadgeView *)&v3 setNeedsLayout];
  [(PXUIFlattenedAssetBadgeView *)self setNeedsDisplay];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXUIFlattenedAssetBadgeView *)self frame];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)PXUIFlattenedAssetBadgeView;
    -[PXUIAssetBadgeView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    [(PXUIFlattenedAssetBadgeView *)self setNeedsDisplay];
  }
}

- (BOOL)isOpaque
{
  return 0;
}

@end