@interface UIAccessibilityHUDItem
+ (id)HUDItemForBarButtonItem:(id)a3 atPoint:(CGPoint)a4 inView:(id)a5 isBackButton:(BOOL)a6;
+ (id)HUDItemForTabBarItem:(id)a3;
- (BOOL)disabledAppearance;
- (BOOL)flattenImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)scaleImage;
- (NSString)title;
- (UIAccessibilityHUDItem)initWithCustomView:(id)a3;
- (UIAccessibilityHUDItem)initWithTitle:(id)a3 image:(id)a4 imageInsets:(UIEdgeInsets)a5;
- (UIAccessibilityHUDItem)initWithTitle:(id)a3 image:(id)a4 imageInsets:(UIEdgeInsets)a5 scaleImage:(BOOL)a6;
- (UIEdgeInsets)imageInsets;
- (UIImage)image;
- (UIView)customView;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)customUserInterfaceStyle;
- (unint64_t)hash;
- (void)setCustomUserInterfaceStyle:(int64_t)a3;
- (void)setCustomView:(id)a3;
- (void)setDisabledAppearance:(BOOL)a3;
- (void)setFlattenImage:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setScaleImage:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIAccessibilityHUDItem

- (UIAccessibilityHUDItem)initWithTitle:(id)a3 image:(id)a4 imageInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityHUDItem;
  v13 = [(UIAccessibilityHUDItem *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(UIAccessibilityHUDItem *)v13 setFlattenImage:1];
    [(UIAccessibilityHUDItem *)v14 setTitle:v11];
    [(UIAccessibilityHUDItem *)v14 setImage:v12];
    -[UIAccessibilityHUDItem setImageInsets:](v14, "setImageInsets:", top, left, bottom, right);
  }

  return v14;
}

- (UIAccessibilityHUDItem)initWithTitle:(id)a3 image:(id)a4 imageInsets:(UIEdgeInsets)a5 scaleImage:(BOOL)a6
{
  BOOL v6 = a6;
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UIAccessibilityHUDItem;
  v15 = [(UIAccessibilityHUDItem *)&v18 init];
  objc_super v16 = v15;
  if (v15)
  {
    [(UIAccessibilityHUDItem *)v15 setFlattenImage:1];
    [(UIAccessibilityHUDItem *)v16 setTitle:v13];
    [(UIAccessibilityHUDItem *)v16 setImage:v14];
    -[UIAccessibilityHUDItem setImageInsets:](v16, "setImageInsets:", top, left, bottom, right);
    [(UIAccessibilityHUDItem *)v16 setScaleImage:v6];
  }

  return v16;
}

- (UIAccessibilityHUDItem)initWithCustomView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIAccessibilityHUDItem;
  v5 = [(UIAccessibilityHUDItem *)&v8 init];
  BOOL v6 = v5;
  if (v5) {
    [(UIAccessibilityHUDItem *)v5 setCustomView:v4];
  }

  return v6;
}

+ (id)HUDItemForTabBarItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 _internalTitle];
  BOOL v6 = [v4 _internalLargeContentSizeImage];
  if (v6)
  {
    id v7 = objc_alloc((Class)a1);
    [v4 largeContentSizeImageInsets];
    objc_super v8 = objc_msgSend(v7, "initWithTitle:image:imageInsets:", v5, v6);
  }
  else
  {
    v9 = [v4 _internalTemplateImage];
    objc_super v8 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:image:imageInsets:scaleImage:", v5, v9, 1, 0.0, 0.0, 0.0, 0.0);
  }
  return v8;
}

+ (id)HUDItemForBarButtonItem:(id)a3 atPoint:(CGPoint)a4 inView:(id)a5 isBackButton:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [v11 _resolvedLargeContentSizeTitle];
  uint64_t v42 = 0;
  if ([v11 isSystemItem])
  {
    BarButtonItemResolveSystemImage([v11 systemItem], (void **)&v42, 0, 0);
    uint64_t v14 = v42;
  }
  else
  {
    uint64_t v42 = [v11 largeContentSizeImage];
    if (v42)
    {
      [v11 largeContentSizeImageInsets];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      uint64_t v23 = 0;
      if (!v6) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
    uint64_t v14 = [v11 image];
    uint64_t v42 = v14;
  }
  if (v13 | v14)
  {
    double v22 = 0.0;
    uint64_t v23 = 1;
    double v20 = 0.0;
    double v18 = 0.0;
    double v16 = 0.0;
    if (!v6) {
      goto LABEL_20;
    }
  }
  else
  {
    v24 = [v11 customView];
    v25 = [v11 customView];
    objc_msgSend(v25, "convertPoint:fromView:", v12, x, y);
    v26 = objc_msgSend(v24, "_largeContentViewerItemAtPoint:");

    if (v26)
    {
      uint64_t v13 = [v26 largeContentTitle];
      uint64_t v27 = [v26 largeContentImage];
      v28 = (void *)v42;
      uint64_t v42 = v27;

      [v26 largeContentImageInsets];
      double v16 = v29;
      double v18 = v30;
      double v20 = v31;
      double v22 = v32;
      uint64_t v23 = [v26 scalesLargeContentImage];
    }
    else
    {
      uint64_t v13 = 0;
      double v22 = 0.0;
      uint64_t v23 = 1;
      double v20 = 0.0;
      double v18 = 0.0;
      double v16 = 0.0;
    }

    if (!v6) {
      goto LABEL_20;
    }
  }
LABEL_14:
  if (!v42)
  {
    v33 = +[_UIBarButtonItemData standardBackButtonData];
    uint64_t v34 = [v33 backIndicatorImage];
    v35 = (void *)v42;
    uint64_t v42 = v34;

    double v22 = 0.0;
    uint64_t v23 = 1;
    double v20 = 0.0;
    double v18 = 0.0;
    double v16 = 0.0;
  }
  if (![(id)v13 length])
  {
    v36 = [v11 _backButtonAlternateTitles];
    v37 = [v36 firstObject];

    if ([v37 length])
    {
      uint64_t v13 = (uint64_t)v37;
    }
    else
    {
      uint64_t v13 = _UINSLocalizedStringWithDefaultValue(@"Back", @"Back");
    }
  }
LABEL_20:
  v38 = (void *)(v13 | v42);
  if (v13 | v42)
  {
    id v39 = objc_alloc((Class)a1);
    v40 = objc_msgSend(v39, "initWithTitle:image:imageInsets:scaleImage:", v13, v42, v23, v16, v18, v20, v22);
    objc_msgSend(v40, "setDisabledAppearance:", objc_msgSend(v11, "isEnabled") ^ 1);
    v38 = (void *)v42;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(UIAccessibilityHUDItem *)self title];
  BOOL v6 = [(UIAccessibilityHUDItem *)self image];
  [(UIAccessibilityHUDItem *)self imageInsets];
  id v11 = objc_msgSend(v4, "initWithTitle:image:imageInsets:scaleImage:", v5, v6, -[UIAccessibilityHUDItem scaleImage](self, "scaleImage"), v7, v8, v9, v10);

  objc_msgSend(v11, "setFlattenImage:", -[UIAccessibilityHUDItem flattenImage](self, "flattenImage"));
  objc_msgSend(v11, "setDisabledAppearance:", -[UIAccessibilityHUDItem disabledAppearance](self, "disabledAppearance"));
  id v12 = [(UIAccessibilityHUDItem *)self customView];
  [v11 setCustomView:v12];

  objc_msgSend(v11, "setCustomUserInterfaceStyle:", -[UIAccessibilityHUDItem customUserInterfaceStyle](self, "customUserInterfaceStyle"));
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [v5 title];
    double v7 = [(UIAccessibilityHUDItem *)self title];
    id v8 = v6;
    id v9 = v7;
    double v10 = v9;
    if (v8 == v9)
    {
      int v11 = 0;
    }
    else
    {
      int v11 = 1;
      if (v8 && v9) {
        int v11 = [v8 isEqual:v9] ^ 1;
      }
    }
    int v29 = v11;

    uint64_t v13 = [v5 image];
    uint64_t v14 = [(UIAccessibilityHUDItem *)self image];
    id v15 = v13;
    id v16 = v14;
    double v17 = v16;
    if (v15 == v16)
    {
      int v18 = 0;
    }
    else
    {
      int v18 = 1;
      if (v15 && v16) {
        int v18 = [v15 isEqual:v16] ^ 1;
      }
    }
    int v28 = v18;

    double v19 = [v5 customView];
    double v20 = [(UIAccessibilityHUDItem *)self customView];

    int v21 = [v5 disabledAppearance];
    BOOL v22 = [(UIAccessibilityHUDItem *)self disabledAppearance];
    char v23 = [v5 flattenImage];
    BOOL v24 = [(UIAccessibilityHUDItem *)self flattenImage];
    uint64_t v25 = [v5 customUserInterfaceStyle];
    int64_t v26 = [(UIAccessibilityHUDItem *)self customUserInterfaceStyle];
    BOOL v12 = 0;
    if (((v29 | v28) & 1) == 0 && v19 == v20 && ((v21 ^ v22) & 1) == 0) {
      BOOL v12 = (v25 == v26) & ~(v23 ^ v24);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(UIAccessibilityHUDItem *)self title];
  uint64_t v4 = [v3 hash];
  id v5 = [(UIAccessibilityHUDItem *)self image];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(UIAccessibilityHUDItem *)self customView];
  unint64_t v8 = v6 ^ v7;

  return v8;
}

- (BOOL)disabledAppearance
{
  return self->_disabledAppearance;
}

- (void)setDisabledAppearance:(BOOL)a3
{
  self->_disabledAppearance = a3;
}

- (BOOL)flattenImage
{
  return self->_flattenImage;
}

- (void)setFlattenImage:(BOOL)a3
{
  self->_flattenImage = a3;
}

- (BOOL)scaleImage
{
  return self->_scaleImage;
}

- (void)setScaleImage:(BOOL)a3
{
  self->_scaleImage = a3;
}

- (int64_t)customUserInterfaceStyle
{
  return self->_customUserInterfaceStyle;
}

- (void)setCustomUserInterfaceStyle:(int64_t)a3
{
  self->_customUserInterfaceStyle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIEdgeInsets)imageInsets
{
  double top = self->_imageInsets.top;
  double left = self->_imageInsets.left;
  double bottom = self->_imageInsets.bottom;
  double right = self->_imageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  self->_imageInsets = a3;
}

- (UIView)customView
{
  return self->_customView;
}

- (void)setCustomView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end