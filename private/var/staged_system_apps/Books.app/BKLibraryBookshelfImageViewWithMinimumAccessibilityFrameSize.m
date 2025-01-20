@interface BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize
+ (double)accessibilityAcceptableMinimumSizeForDimension;
- (BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize)initWithFrame:(CGRect)a3;
- (CGRect)accessibilityFrame;
- (double)accessibilityFrameMinimumHeight;
- (double)accessibilityFrameMinimumWidth;
- (void)setAccessibilityFrameMinimumHeight:(double)a3;
- (void)setAccessibilityFrameMinimumWidth:(double)a3;
@end

@implementation BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize

+ (double)accessibilityAcceptableMinimumSizeForDimension
{
  return 44.0;
}

- (BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize;
  v3 = -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityAcceptableMinimumSizeForDimension];
    -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize setAccessibilityFrameMinimumWidth:](v3, "setAccessibilityFrameMinimumWidth:");
    +[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityAcceptableMinimumSizeForDimension];
    -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize setAccessibilityFrameMinimumHeight:](v3, "setAccessibilityFrameMinimumHeight:");
  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  v18.receiver = self;
  v18.super_class = (Class)BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize;
  [(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)&v18 accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)self accessibilityFrameMinimumHeight];
  double v12 = v11 - v10;
  if (v12 <= 0.0) {
    double v13 = 0.0;
  }
  else {
    double v13 = v12 * 0.5;
  }
  [(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)self accessibilityFrameMinimumWidth];
  double v15 = v14 - v8;
  if (v15 <= 0.0) {
    double v16 = 0.0;
  }
  else {
    double v16 = v15 * 0.5;
  }
  CGFloat v17 = -v16;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  return CGRectInset(v19, v17, -v13);
}

- (double)accessibilityFrameMinimumHeight
{
  return self->_accessibilityFrameMinimumHeight;
}

- (void)setAccessibilityFrameMinimumHeight:(double)a3
{
  self->_accessibilityFrameMinimumHeight = a3;
}

- (double)accessibilityFrameMinimumWidth
{
  return self->_accessibilityFrameMinimumWidth;
}

- (void)setAccessibilityFrameMinimumWidth:(double)a3
{
  self->_accessibilityFrameMinimumWidth = a3;
}

@end