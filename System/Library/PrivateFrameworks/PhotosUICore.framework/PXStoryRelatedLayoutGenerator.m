@interface PXStoryRelatedLayoutGenerator
+ (BOOL)isExpectedKeyItemAtIndex:(int64_t)a3;
+ (int64_t)_preferredNumberOfItemsForUserInterfaceIdiom:(int64_t)a3;
+ (int64_t)preferredNumberOfItemsForExtendedTraitCollection:(id)a3;
- (BOOL)isContentScrolledIntoView;
- (CGSize)estimatedSize;
- (CGSize)size;
- (PXStoryRelatedLayoutGenerator)initWithMetrics:(id)a3;
- (UIEdgeInsets)scrollableOutsets;
- (const)_framesForItemInRange:(_NSRange)a3;
- (void)_prepareIfNeeded;
- (void)adjustTargetScrollOffset:(CGPoint *)a3 forVelocity:(CGPoint)a4 currentScrollOffset:(CGPoint)a5 shouldHideContent:(BOOL *)a6;
- (void)dealloc;
- (void)getFrames:(CGRect *)a3 forItemsInRange:(_NSRange)a4;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)invalidate;
@end

@implementation PXStoryRelatedLayoutGenerator

- (void)_prepareIfNeeded
{
  if (!self->_isPrepared)
  {
    [(PXStoryRelatedLayoutGenerator *)self itemCount];
    v4 = [(PXStoryRelatedLayoutGenerator *)self metrics];
    [v4 referenceSize];
    double v6 = v5;
    double v8 = v7;
    [v4 interitemSpacing];
    [v4 margins];
    double v10 = v9;
    double v12 = v11;
    double v15 = v6 - (v13 + v14);
    double v16 = v8 - (v9 + v11);
    switch([v4 layoutMode])
    {
      case 0:
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedLayoutGenerator.m" lineNumber:211 description:@"Code which should be unreachable has been reached"];

        abort();
      case 2:
        if (v15 / 0.75 < v16) {
          double v16 = v15 / 0.75;
        }
        double v17 = v8 - v12 - v10 - v16;
        double v18 = v17 * 0.5;
        BOOL v19 = v17 <= 0.0;
        double v20 = 0.0;
        if (!v19) {
          double v20 = v18;
        }
        objc_msgSend(v4, "scrollOffset", v12 + v20);
        break;
      case 3:
        PXSizeGetAspectRatio();
      default:
        objc_msgSend(v4, "scrollOffset", *(void *)&v12);
        break;
    }
    [v4 offscreenFraction];
    PXClamp();
  }
}

- (const)_framesForItemInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v7 = [(PXStoryRelatedLayoutGenerator *)self itemCount];
  if (location + length > v7)
  {
    unint64_t v9 = v7;
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    double v11 = NSStringFromRange(v12);
    [v10 handleFailureInMethod:a2, self, @"PXStoryRelatedLayoutGenerator.m", 182, @"range %@ out of bounds (0..<%li)", v11, v9 object file lineNumber description];
  }
  [(PXStoryRelatedLayoutGenerator *)self _prepareIfNeeded];
  return &self->_itemFrames[location];
}

- (void)getFrames:(CGRect *)a3 forItemsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  double v6 = -[PXStoryRelatedLayoutGenerator _framesForItemInRange:](self, "_framesForItemInRange:", a4.location, a4.length);
  memcpy(a3, v6, 32 * length);
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  -[PXStoryRelatedLayoutGenerator _framesForItemInRange:](self, "_framesForItemInRange:", a4.location, a4.length);
  if (length) {
    PXRectGetCenter();
  }
}

- (void)adjustTargetScrollOffset:(CGPoint *)a3 forVelocity:(CGPoint)a4 currentScrollOffset:(CGPoint)a5 shouldHideContent:(BOOL *)a6
{
  *a6 = 0;
  CGFloat v6 = 0.0;
  if (a5.x >= 0.0)
  {
    if (a4.x >= 0.0)
    {
      if (a4.x <= 0.0) {
        return;
      }
      p_right = &self->_scrollableOutsets.right;
      goto LABEL_7;
    }
  }
  else if (a4.x <= 0.0)
  {
    *a6 = 1;
    p_right = &self->_scrollableOutsets.left;
LABEL_7:
    CGFloat v6 = *p_right;
  }
  a3->x = v6;
}

- (BOOL)isContentScrolledIntoView
{
  return self->_isContentScrolledIntoView;
}

- (UIEdgeInsets)scrollableOutsets
{
  [(PXStoryRelatedLayoutGenerator *)self _prepareIfNeeded];
  double top = self->_scrollableOutsets.top;
  double left = self->_scrollableOutsets.left;
  double bottom = self->_scrollableOutsets.bottom;
  double right = self->_scrollableOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)size
{
  [(PXStoryRelatedLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedSize
{
  v2 = [(PXStoryRelatedLayoutGenerator *)self metrics];
  [v2 referenceSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedLayoutGenerator;
  [(PXStoryRelatedLayoutGenerator *)&v3 invalidate];
  self->_isPrepared = 0;
}

- (void)dealloc
{
  free(self->_itemFrames);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedLayoutGenerator;
  [(PXStoryRelatedLayoutGenerator *)&v3 dealloc];
}

- (PXStoryRelatedLayoutGenerator)initWithMetrics:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryRelatedLayoutGenerator;
  return [(PXStoryRelatedLayoutGenerator *)&v4 initWithMetrics:a3];
}

+ (BOOL)isExpectedKeyItemAtIndex:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PXStoryRelatedLayoutGenerator_isExpectedKeyItemAtIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isExpectedKeyItemAtIndex__onceToken != -1) {
    dispatch_once(&isExpectedKeyItemAtIndex__onceToken, block);
  }
  if (a3) {
    BOOL v4 = a3 == 3;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = v4;
  if (isExpectedKeyItemAtIndex__numberOfItemsOnCurrentDevice == 6) {
    return v5;
  }
  else {
    return a3 == 0;
  }
}

uint64_t __58__PXStoryRelatedLayoutGenerator_isExpectedKeyItemAtIndex___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  unint64_t v3 = [v2 userInterfaceIdiom];
  if (v3 > 6) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1AB35AFA8[v3];
  }

  uint64_t result = [*(id *)(a1 + 32) _preferredNumberOfItemsForUserInterfaceIdiom:v4];
  isExpectedKeyItemAtIndex__numberOfItemsOnCurrentDevice = result;
  return result;
}

+ (int64_t)_preferredNumberOfItemsForUserInterfaceIdiom:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"PXStoryRelatedLayoutGenerator.m" lineNumber:88 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return qword_1AB35ABE8[a3];
}

+ (int64_t)preferredNumberOfItemsForExtendedTraitCollection:(id)a3
{
  uint64_t v4 = [a3 userInterfaceIdiom];
  return [a1 _preferredNumberOfItemsForUserInterfaceIdiom:v4];
}

@end