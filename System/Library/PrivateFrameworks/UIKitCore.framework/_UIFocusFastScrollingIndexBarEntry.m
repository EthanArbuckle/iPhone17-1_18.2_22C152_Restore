@interface _UIFocusFastScrollingIndexBarEntry
+ (_UIFocusFastScrollingIndexBarEntry)entryWithTitle:(id)a3 contentOffset:(CGPoint)a4;
+ (_UIFocusFastScrollingIndexBarEntry)entryWithTitle:(id)a3 generator:(id)a4;
+ (id)placeholderEntryWithEntryBefore:(id)a3 after:(id)a4;
- (BOOL)isPlaceholder;
- (CGPoint)contentOffset;
- (NSIndexPath)targetFocusedIndexPath;
- (NSString)title;
- (_UIFocusFastScrollingIndexBarEntry)initWithTitle:(id)a3 contentOffset:(CGPoint)a4;
- (_UIFocusFastScrollingIndexBarEntry)initWithTitle:(id)a3 generator:(id)a4;
- (id)description;
- (void)setTargetFocusedIndexPath:(id)a3;
@end

@implementation _UIFocusFastScrollingIndexBarEntry

+ (_UIFocusFastScrollingIndexBarEntry)entryWithTitle:(id)a3 contentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:contentOffset:", v7, x, y);

  return (_UIFocusFastScrollingIndexBarEntry *)v8;
}

- (_UIFocusFastScrollingIndexBarEntry)initWithTitle:(id)a3 contentOffset:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusFastScrollingIndexBarEntry;
  v8 = [(_UIFocusFastScrollingIndexBarEntry *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v8->_hasCachedContentOffset = 1;
    v8->_cachedContentOffset.CGFloat x = x;
    v8->_cachedContentOffset.CGFloat y = y;
  }

  return v8;
}

+ (_UIFocusFastScrollingIndexBarEntry)entryWithTitle:(id)a3 generator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 generator:v6];

  return (_UIFocusFastScrollingIndexBarEntry *)v8;
}

- (_UIFocusFastScrollingIndexBarEntry)initWithTitle:(id)a3 generator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIFocusFastScrollingIndexBarEntry;
  v8 = [(_UIFocusFastScrollingIndexBarEntry *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    id contentOffsetGenerator = v8->_contentOffsetGenerator;
    v8->_id contentOffsetGenerator = (id)v11;

    v8->_cachedContentOffset = (CGPoint)_UIFocusFastScrollingIndexBarEntryContentOffsetNone;
  }

  return v8;
}

+ (id)placeholderEntryWithEntryBefore:(id)a3 after:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v8[8] = 1;
  uint64_t v9 = (void *)*((void *)v8 + 5);
  *((void *)v8 + 5) = @"•";

  *((_OWORD *)v8 + 1) = _UIFocusFastScrollingIndexBarEntryContentOffsetNone;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76___UIFocusFastScrollingIndexBarEntry_placeholderEntryWithEntryBefore_after___block_invoke;
  v15[3] = &unk_1E52EE9A8;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  objc_super v12 = _Block_copy(v15);
  v13 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v12;

  return v8;
}

- (CGPoint)contentOffset
{
  if (self->_hasCachedContentOffset)
  {
    p_cachedContentOffset = &self->_cachedContentOffset;
    p_double y = &self->_cachedContentOffset.y;
  }
  else
  {
    id contentOffsetGenerator = (double (**)(id, SEL))self->_contentOffsetGenerator;
    if (contentOffsetGenerator)
    {
      double x = contentOffsetGenerator[2](contentOffsetGenerator, a2);
      self->_cachedContentOffset.double x = x;
      self->_cachedContentOffset.double y = y;
    }
    else
    {
      double x = self->_cachedContentOffset.x;
      double y = self->_cachedContentOffset.y;
    }
    BOOL v8 = x != INFINITY;
    if (y != INFINITY) {
      BOOL v8 = 1;
    }
    self->_hasCachedContentOffset = v8;
    p_cachedContentOffset = (CGPoint *)MEMORY[0x1E4F1DAD8];
    p_double y = (CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v8)
    {
      id v9 = self->_contentOffsetGenerator;
      self->_id contentOffsetGenerator = 0;

      if (self->_hasCachedContentOffset)
      {
        p_cachedContentOffset = &self->_cachedContentOffset;
        p_double y = &self->_cachedContentOffset.y;
      }
    }
  }
  double v10 = *p_y;
  double v11 = p_cachedContentOffset->x;
  result.double y = v10;
  result.double x = v11;
  return result;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p title = \"%@\"", v5, self, self->_title];;

  if (self->_hasCachedContentOffset)
  {
    NSStringFromCGPoint(self->_cachedContentOffset);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = @"unresolved";
  }
  [v6 appendFormat:@"; contentOffset = %@", v7];
  if (self->_targetFocusedIndexPath) {
    [v6 appendFormat:@"; indexPath = %@", self->_targetFocusedIndexPath];
  }
  if (self->_isPlaceholder) {
    [v6 appendString:@"; isPlaceholder = YES"];
  }
  [v6 appendString:@">"];
  BOOL v8 = (void *)[v6 copy];

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSIndexPath)targetFocusedIndexPath
{
  return self->_targetFocusedIndexPath;
}

- (void)setTargetFocusedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_contentOffsetGenerator, 0);
}

@end