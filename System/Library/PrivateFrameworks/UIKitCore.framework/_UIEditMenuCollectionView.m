@interface _UIEditMenuCollectionView
- (BOOL)_contentOffsetIsAtPagingBoundary:(CGPoint)a3;
- (CGPoint)contentOffsetForPage:(int64_t)a3;
- (NSArray)pages;
- (double)clampedPageForPageProgress:(double)a3;
- (double)currentPage;
- (double)pageProgressForContentOffset:(CGPoint)a3 clamped:(BOOL)a4;
- (double)viewWidthForPageProgress:(double)a3;
- (int64_t)targetPage;
- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4;
- (void)decrementTargetPage;
- (void)incrementTargetPage;
- (void)resetTargetPage;
- (void)scrollToTargetPageAnimated:(BOOL)a3;
- (void)setPages:(id)a3;
- (void)setTargetPage:(int64_t)a3;
@end

@implementation _UIEditMenuCollectionView

- (void)setPages:(id)a3
{
  objc_storeStrong((id *)&self->_pages, a3);
  [(_UIEditMenuCollectionView *)self clampedPageForPageProgress:(double)self->_targetPage];
  self->_targetPage = (uint64_t)v4;
}

- (double)currentPage
{
  [(UIScrollView *)self contentOffset];
  -[_UIEditMenuCollectionView pageProgressForContentOffset:clamped:](self, "pageProgressForContentOffset:clamped:", 0);
  return result;
}

- (double)pageProgressForContentOffset:(CGPoint)a3 clamped:(BOOL)a4
{
  BOOL v4 = a4;
  double x = a3.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v7 = [(_UIEditMenuCollectionView *)self pages];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    double v11 = 0.0;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v7);
      }
      if (x <= 0.0) {
        break;
      }
      v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
      [v13 width];
      double v15 = v14;
      [v13 overlapWidth];
      double v17 = fmin(x, v15 - v16);
      [v13 width];
      double v19 = v18;
      [v13 overlapWidth];
      double v11 = v11 + v17 / (v19 - v20);
      double x = x - v17;
      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    double v11 = 0.0;
  }

  if (v4)
  {
    [(_UIEditMenuCollectionView *)self clampedPageForPageProgress:v11];
    return v21;
  }
  return v11;
}

- (CGPoint)contentOffsetForPage:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v12 = &unk_186D7DBA7;
  long long v13 = *MEMORY[0x1E4F1DAD8];
  pages = self->_pages;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50___UIEditMenuCollectionView_contentOffsetForPage___block_invoke;
  v8[3] = &unk_1E5300400;
  v8[4] = &v9;
  v8[5] = a3;
  [(NSArray *)pages enumerateObjectsUsingBlock:v8];
  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.y = v7;
  result.double x = v6;
  return result;
}

- (double)viewWidthForPageProgress:(double)a3
{
  if (![(NSArray *)self->_pages count]) {
    return 0.0;
  }
  [(_UIEditMenuCollectionView *)self clampedPageForPageProgress:a3];
  double v6 = v5;
  [(NSArray *)self->_pages count];
  [(_UIEditMenuCollectionView *)self clampedPageForPageProgress:floor(v6)];
  uint64_t v8 = (uint64_t)v7;
  [(_UIEditMenuCollectionView *)self clampedPageForPageProgress:(double)((uint64_t)v7 + 1)];
  uint64_t v10 = (uint64_t)v9;
  double v11 = (double)(uint64_t)v9 - v6;
  uint64_t v12 = [(NSArray *)self->_pages objectAtIndex:v8];
  [v12 width];
  double v14 = v13;

  double v15 = [(NSArray *)self->_pages objectAtIndex:v10];
  [v15 width];
  double v17 = v16;

  [(UIView *)self _currentScreenScale];
  UIRoundToScale(v11 * v14 + (1.0 - v11) * v17, v18);
  return result;
}

- (void)resetTargetPage
{
  self->_targetPage = 0;
  -[UICollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)incrementTargetPage
{
  unint64_t targetPage = self->_targetPage;
  if (targetPage < [(NSArray *)self->_pages count] - 1)
  {
    ++self->_targetPage;
    [(_UIEditMenuCollectionView *)self scrollToTargetPageAnimated:1];
  }
}

- (void)decrementTargetPage
{
  int64_t targetPage = self->_targetPage;
  BOOL v3 = targetPage < 1;
  int64_t v4 = targetPage - 1;
  if (!v3)
  {
    self->_int64_t targetPage = v4;
    [(_UIEditMenuCollectionView *)self scrollToTargetPageAnimated:1];
  }
}

- (void)scrollToTargetPageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSArray *)self->_pages count])
  {
    double v5 = [(NSArray *)self->_pages objectAtIndex:self->_targetPage];
    [(_UIEditMenuCollectionView *)self contentOffsetForPage:self->_targetPage];
    double v7 = v6;
    double v9 = v8;

    if (v3)
    {
LABEL_3:
      if (qword_1EB25BEC0 != -1) {
        dispatch_once(&qword_1EB25BEC0, &__block_literal_global_422);
      }
      uint64_t v10 = _MergedGlobals_1_20;
      -[UIScrollView _setContentOffset:animation:](self, "_setContentOffset:animation:", v10, v7, v9);
      return;
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v3) {
      goto LABEL_3;
    }
  }
  -[UICollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v7, v9);
}

- (double)clampedPageForPageProgress:(double)a3
{
  return fmax(fmin(a3, (double)[(NSArray *)self->_pages count] + -1.0), 0.0);
}

- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4
{
  [(UIView *)self bounds];
  double v7 = v6;
  [(UIScrollView *)self _pagingOrigin];
  double v9 = v8;
  unint64_t v10 = [(NSArray *)self->_pages count];
  [(_UIEditMenuCollectionView *)self targetPage];
  [(UIScrollView *)self _pageDecelerationTarget];
  double v12 = v11;
  [(UIScrollView *)self contentOffset];
  -[_UIEditMenuCollectionView pageProgressForContentOffset:clamped:](self, "pageProgressForContentOffset:clamped:", 0);
  double v14 = v13;
  double v15 = [(_UIEditMenuCollectionView *)self pages];
  if (![v15 count])
  {

    goto LABEL_13;
  }
  double v16 = floor(v14);
  if (v16 == v14 && ([(UIScrollView *)self contentOffset], v17 >= v9))
  {

    if (v14 <= (double)v10 + -1.0) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (a3 <= 0.3)
  {
    if (a3 >= -0.3) {
      double v16 = round(v14);
    }
  }
  else
  {
    double v16 = ceil(v14);
  }
  [(_UIEditMenuCollectionView *)self clampedPageForPageProgress:(double)(uint64_t)v16];
  uint64_t v19 = (uint64_t)v18;
  [(_UIEditMenuCollectionView *)self contentOffsetForPage:(uint64_t)v18];
  double v7 = v20;
  double v12 = v21;
  if (!v19)
  {
    [(UIScrollView *)self _firstPageOffset];
    double v7 = v7 + v22;
  }
LABEL_13:
  -[UIScrollView _setPageDecelerationTarget:](self, "_setPageDecelerationTarget:", v7, v12);
}

- (BOOL)_contentOffsetIsAtPagingBoundary:(CGPoint)a3
{
  -[_UIEditMenuCollectionView pageProgressForContentOffset:clamped:](self, "pageProgressForContentOffset:clamped:", 0, a3.x, a3.y);
  return v3 == round(v3);
}

- (NSArray)pages
{
  return self->_pages;
}

- (int64_t)targetPage
{
  return self->_targetPage;
}

- (void)setTargetPage:(int64_t)a3
{
  self->_int64_t targetPage = a3;
}

- (void).cxx_destruct
{
}

@end