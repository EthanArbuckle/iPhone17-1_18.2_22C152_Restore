@interface BKLibraryBookshelfCoverView
+ (Class)layerClass;
- (BKLibraryBookshelfCoverView)initWithFrame:(CGRect)a3;
- (BOOL)accessibilityIgnoresInvertColors;
- (id)_ancestorCell;
@end

@implementation BKLibraryBookshelfCoverView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BKLibraryBookshelfCoverView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCoverView;
  return -[BKLibraryBookshelfCoverView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_ancestorCell
{
  v2 = [(BKLibraryBookshelfCoverView *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end