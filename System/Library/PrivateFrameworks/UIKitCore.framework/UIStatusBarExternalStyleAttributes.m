@interface UIStatusBarExternalStyleAttributes
- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4;
- (Class)foregroundStyleClass;
- (double)heightForMetrics:(int64_t)a3;
- (id)backgroundImageName;
- (int64_t)idiom;
- (int64_t)tapButtonType;
@end

@implementation UIStatusBarExternalStyleAttributes

- (int64_t)idiom
{
  return 3;
}

- (double)heightForMetrics:(int64_t)a3
{
  return 44.0;
}

- (id)backgroundImageName
{
  return 0;
}

- (Class)foregroundStyleClass
{
  if ([(UIStatusBarStyleAttributes *)self style] != 401
    && [(UIStatusBarStyleAttributes *)self style] != 402)
  {
    [(UIStatusBarStyleAttributes *)self style];
  }
  v3 = objc_opt_class();
  return (Class)v3;
}

- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v4 == 46) {
    goto LABEL_5;
  }
  if (v4 != 48)
  {
    if (v4 == 47 && [(UIStatusBarStyleAttributes *)self style] == 402) {
      goto LABEL_5;
    }
LABEL_7:
    v9.receiver = self;
    v9.super_class = (Class)UIStatusBarExternalStyleAttributes;
    BOOL v7 = [(UIStatusBarStyleAttributes *)&v9 shouldShowInternalItemType:v4 withScreenCapabilities:v6];
    goto LABEL_8;
  }
  if ([(UIStatusBarStyleAttributes *)self style] != 403) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (int64_t)tapButtonType
{
  if ([(UIStatusBarStyleAttributes *)self style] == 402) {
    return 2;
  }
  if ([(UIStatusBarStyleAttributes *)self style] == 403) {
    return 3;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarExternalStyleAttributes;
  return [(UIStatusBarStyleAttributes *)&v4 tapButtonType];
}

@end