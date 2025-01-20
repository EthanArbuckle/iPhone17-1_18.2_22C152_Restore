@interface SFTabViewContainerView
- (BOOL)extendsVisibleRange;
- (CGFloat)contentWidth;
- (CGRect)frameForChildAtIndex:(int64_t)a3;
- (NSIndexSet)visibleChildIndexes;
- (SFTabViewContainerView)init;
- (SFTabViewContainerView)initWithFrame:(CGRect)a3;
- (SFTabViewContainerViewDataSource)dataSource;
- (_NSRange)visibleRangeForContentOffset:(double)a3 nearestIndex:(int64_t *)a4;
- (double)contentOffsetForFractionalIndex:(uint64_t *)a1;
- (int64_t)convertIndex:(int64_t)a3;
- (uint64_t)currentChildIndex;
- (void)installChildViewAtIndex:(uint64_t)a1;
- (void)layoutSubviews;
- (void)reloadData;
- (void)reloadDataWithPostUpdateActions:(id)a3;
- (void)reloadViewsAtIndexes:(id)a3;
- (void)revealChildAtFractionalIndex:(double)a3;
- (void)revealChildAtIndex:(int64_t)a3;
- (void)setContentOffset:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setExtendsVisibleRange:(BOOL)a3;
- (void)uninstallChildViewAtIndex:(int)a3 ignoringDelegateResult:;
- (void)updateVisibleIndexes;
@end

@implementation SFTabViewContainerView

- (SFTabViewContainerView)init
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  v4 = -[SFTabViewContainerView initWithFrame:](self, "initWithFrame:");

  return v4;
}

- (SFTabViewContainerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFTabViewContainerView;
  v3 = -[SFTabViewContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    childIndexToViewMap = v3->_childIndexToViewMap;
    v3->_childIndexToViewMap = v4;

    v3->_visibleRange.location = 0;
    v3->_visibleRange.length = 0;
    v6 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SFTabViewContainerView;
  [(SFTabViewContainerView *)&v5 layoutSubviews];
  childIndexToViewMap = self->_childIndexToViewMap;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SFTabViewContainerView_layoutSubviews__block_invoke;
  v4[3] = &unk_1E54EB4C8;
  v4[4] = self;
  [(NSMutableDictionary *)childIndexToViewMap enumerateKeysAndObjectsUsingBlock:v4];
}

void __40__SFTabViewContainerView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "frameForChildAtIndex:", objc_msgSend(a2, "integerValue"));
  objc_msgSend(v5, "setFrame:");
}

- (void)setDataSource:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained != v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = (void *)[(NSMutableDictionary *)self->_childIndexToViewMap copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:]((uint64_t)self, [*(id *)(*((void *)&v11 + 1) + 8 * v10++) integerValue], 1);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    objc_storeWeak((id *)&self->_dataSource, v4);
    [(SFTabViewContainerView *)self reloadData];
  }
}

- (void)uninstallChildViewAtIndex:(int)a3 ignoringDelegateResult:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v6 = *(void **)(a1 + 416);
    uint64_t v7 = [NSNumber numberWithInteger:a2];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 448));
      if ((a3 & 1) != 0
        || (objc_opt_respondsToSelector() & 1) == 0
        || [WeakRetained containerView:a1 shouldDismantleChildView:v8 atIndex:a2])
      {
        uint64_t v10 = WBS_LOG_CHANNEL_PREFIXTabGroupSwitcher();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          long long v14 = v10;
          v15 = NSStringFromSelector(sel_uninstallChildViewAtIndex_ignoringDelegateResult_);
          uint64_t v16 = @"NO";
          if (a3) {
            uint64_t v16 = @"YES";
          }
          v17 = v16;
          int v18 = 138412802;
          v19 = v15;
          __int16 v20 = 2048;
          uint64_t v21 = a2;
          __int16 v22 = 2112;
          v23 = v17;
          _os_log_debug_impl(&dword_18C354000, v14, OS_LOG_TYPE_DEBUG, "%@%zd (teardown, ignoreDelegate=%@)", (uint8_t *)&v18, 0x20u);
        }
        if (objc_opt_respondsToSelector()) {
          [WeakRetained containerView:a1 dismantleChildView:v8];
        }
        [v8 removeFromSuperview];
        long long v11 = *(void **)(a1 + 416);
        long long v12 = [NSNumber numberWithInteger:a2];
        [v11 setObject:0 forKeyedSubscript:v12];
      }
      else
      {
        long long v13 = WBS_LOG_CHANNEL_PREFIXTabGroupSwitcher();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:](v13, sel_uninstallChildViewAtIndex_ignoringDelegateResult_);
        }
      }
    }
  }
}

- (void)reloadData
{
  int64_t childCount = self->_childCount;
  uint64_t v4 = -[SFTabViewContainerView currentChildIndex](self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SFTabViewContainerView_reloadData__block_invoke;
  v5[3] = &unk_1E54EB4F0;
  v5[4] = self;
  v5[5] = childCount;
  v5[6] = v4;
  [(SFTabViewContainerView *)self reloadDataWithPostUpdateActions:v5];
}

- (uint64_t)currentChildIndex
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (a1[51])
  {
    [a1 contentOffset];
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(a1, "visibleRangeForContentOffset:nearestIndex:", &v4);
    return v4;
  }
  return v2;
}

uint64_t __36__SFTabViewContainerView_reloadData__block_invoke(void *a1, uint64_t a2)
{
  if (a1[5] == *(void *)(a1[4] + 408)) {
    return a1[6];
  }
  return a2;
}

- (void)reloadDataWithPostUpdateActions:(id)a3
{
  v6 = (uint64_t (**)(id, uint64_t))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_int64_t childCount = [WeakRetained numberOfChildrenForContainerView:self];

  self->_visibleRange.location = 0;
  self->_visibleRange.length = 0;
  if (self->_childCount) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v6) {
    uint64_t v5 = v6[2](v6, v5);
  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [(SFTabViewContainerView *)self revealChildAtIndex:v5];
  }
  -[SFTabViewContainerView updateVisibleIndexes]((uint64_t)self);
}

- (void)updateVisibleIndexes
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 424);
    uint64_t v3 = *(void *)(a1 + 432);
    [(id)a1 contentOffset];
    uint64_t v4 = objc_msgSend((id)a1, "visibleRangeForContentOffset:nearestIndex:", 0);
    if (*(unsigned char *)(a1 + 440)) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    uint64_t v7 = !v6;
    if (v6) {
      unint64_t v8 = v5;
    }
    else {
      unint64_t v8 = v5 + 1;
    }
    uint64_t v9 = v4 - v7;
    if (*(unsigned char *)(a1 + 440) && (int64_t)(v9 + v8) < *(void *)(a1 + 408)) {
      ++v8;
    }
    if (v2 != v9 || v3 != v8)
    {
      *(void *)(a1 + 424) = v9;
      *(void *)(a1 + 432) = v8;
      if (v2 < v3 + v2)
      {
        do
        {
          if (v9 > (unint64_t)v2 || v2 - v9 >= v8) {
            -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:](a1, v2, 0);
          }
          ++v2;
          --v3;
        }
        while (v3);
      }
      if (v9 < (uint64_t)(v8 + v9))
      {
        do
        {
          -[SFTabViewContainerView installChildViewAtIndex:](a1, v9++);
          --v8;
        }
        while (v8);
      }
    }
  }
}

- (NSIndexSet)visibleChildIndexes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", self->_visibleRange.location, self->_visibleRange.length);
}

- (void)reloadViewsAtIndexes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(SFTabViewContainerView *)self visibleChildIndexes];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v5 = (void *)[(NSMutableDictionary *)self->_childIndexToViewMap copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:]((uint64_t)self, [*(id *)(*((void *)&v11 + 1) + 8 * v9++) integerValue], 0);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__SFTabViewContainerView_reloadViewsAtIndexes___block_invoke;
  v10[3] = &unk_1E54EA280;
  v10[4] = self;
  [v4 enumerateIndexesUsingBlock:v10];
}

void __47__SFTabViewContainerView_reloadViewsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:](*(void *)(a1 + 32), a2, 0);
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(v4 + 424);
  BOOL v7 = a2 >= v5;
  unint64_t v6 = a2 - v5;
  BOOL v7 = !v7 || v6 >= *(void *)(v4 + 432);
  if (!v7)
  {
    -[SFTabViewContainerView installChildViewAtIndex:](v4, a2);
  }
}

- (void)installChildViewAtIndex:(uint64_t)a1
{
  if (a1)
  {
    if (a2 < 0 || *(void *)(a1 + 408) <= a2)
    {
      long long v14 = WBS_LOG_CHANNEL_PREFIXTabGroupSwitcher();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SFTabViewContainerView installChildViewAtIndex:](v14, sel_installChildViewAtIndex_);
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 448));
      unint64_t v5 = [WeakRetained containerView:a1 childViewAtIndex:a2];

      unint64_t v6 = *(void **)(a1 + 416);
      BOOL v7 = [NSNumber numberWithInteger:a2];
      uint64_t v8 = [v6 objectForKeyedSubscript:v7];

      if (v8) {
        BOOL v9 = v8 == v5;
      }
      else {
        BOOL v9 = 0;
      }
      if (!v9)
      {
        -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:](a1, a2, 1);
        uint64_t v10 = (void *)MEMORY[0x1E4FB1EB0];
        uint64_t v15 = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        v17 = __50__SFTabViewContainerView_installChildViewAtIndex___block_invoke;
        int v18 = &unk_1E54EB518;
        uint64_t v19 = a1;
        id v11 = v5;
        id v20 = v11;
        uint64_t v21 = a2;
        __int16 v22 = sel_installChildViewAtIndex_;
        [v10 performWithoutAnimation:&v15];
        long long v12 = *(void **)(a1 + 416);
        long long v13 = objc_msgSend(NSNumber, "numberWithInteger:", a2, v15, v16, v17, v18, v19);
        [v12 setObject:v11 forKeyedSubscript:v13];
      }
    }
  }
}

- (void)setExtendsVisibleRange:(BOOL)a3
{
  if (self->_extendsVisibleRange != a3)
  {
    self->_extendsVisibleRange = a3;
    -[SFTabViewContainerView updateVisibleIndexes]((uint64_t)self);
  }
}

void __50__SFTabViewContainerView_installChildViewAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 416) allKeysForObject:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 firstObject];

  if (!v3
    || ([*(id *)(*(void *)(a1 + 32) + 416) removeObjectForKey:v3],
        [*(id *)(a1 + 40) superview],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = *(void **)(a1 + 32),
        v4,
        v4 != v5))
  {
    [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) frameForChildAtIndex:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");
  unint64_t v6 = WBS_LOG_CHANNEL_PREFIXTabGroupSwitcher();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = *(const char **)(a1 + 56);
    uint64_t v8 = v6;
    BOOL v9 = NSStringFromSelector(v7);
    uint64_t v10 = *(void *)(a1 + 48);
    [*(id *)(a1 + 40) frame];
    id v11 = NSStringFromCGRect(v19);
    int v12 = 138412802;
    long long v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_18C354000, v8, OS_LOG_TYPE_DEBUG, "%@%zd (installed, initial frame %@)", (uint8_t *)&v12, 0x20u);
  }
}

- (CGRect)frameForChildAtIndex:(int64_t)a3
{
  [(SFTabViewContainerView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = [(SFTabViewContainerView *)self convertIndex:a3];
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  CGFloat v14 = CGRectGetWidth(v20) * (double)v13;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  CGFloat Width = CGRectGetWidth(v21);
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  double Height = CGRectGetHeight(v22);
  double v17 = 0.0;
  double v18 = v14;
  double v19 = Width;
  result.size.height = Height;
  result.size.width = v19;
  result.origin.y = v17;
  result.origin.x = v18;
  return result;
}

- (CGFloat)contentWidth
{
  if (!a1) {
    return 0.0;
  }
  [a1 bounds];
  return CGRectGetWidth(v3) * (double)a1[51];
}

- (void)setContentOffset:(double)a3
{
  [(SFTabViewContainerView *)self contentOffset];
  if (!_SFEqualWithEpsilon(v5, a3, 0.01))
  {
    [(SFTabViewContainerView *)self bounds];
    [(SFTabViewContainerView *)self setBounds:a3];
    -[SFTabViewContainerView updateVisibleIndexes]((uint64_t)self);
  }
}

- (double)contentOffsetForFractionalIndex:(uint64_t *)a1
{
  if (!a1) {
    return 0.0;
  }
  [a1 bounds];
  double Width = CGRectGetWidth(v6);
  if ((objc_msgSend(a1, "_sf_usesLeftToRightLayout") & 1) == 0) {
    a2 = (double)a1[51] + -1.0 - a2;
  }
  return Width * a2;
}

- (int64_t)convertIndex:(int64_t)a3
{
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && self->_childCount)
  {
    if ([(UIView *)self _sf_usesLeftToRightLayout]) {
      return a3;
    }
    else {
      return self->_childCount + ~a3;
    }
  }
  return result;
}

- (_NSRange)visibleRangeForContentOffset:(double)a3 nearestIndex:(int64_t *)a4
{
  [(SFTabViewContainerView *)self bounds];
  double Width = CGRectGetWidth(v19);
  double v8 = fmax(fmin(-[SFTabViewContainerView contentWidth]((uint64_t *)self) - Width, a3), 0.0) / Width;
  unint64_t v9 = vcvtmd_s64_f64(v8);
  unint64_t v10 = vcvtpd_s64_f64(v8);
  double v11 = (double)(uint64_t)floor(v8);
  BOOL v12 = _SFEqualWithEpsilon(v8, v11, 0.01);
  if (a4)
  {
    if (v8 - v11 > 0.5) {
      unint64_t v13 = v10;
    }
    else {
      unint64_t v13 = v9;
    }
    *a4 = -[SFTabViewContainerView convertIndex:](self, "convertIndex:", v13, v8 - v11);
  }
  int64_t v14 = [(SFTabViewContainerView *)self convertIndex:v9];
  if (v14 >= [(SFTabViewContainerView *)self convertIndex:v10]) {
    unint64_t v15 = v10;
  }
  else {
    unint64_t v15 = v9;
  }
  NSUInteger v16 = [(SFTabViewContainerView *)self convertIndex:v15];
  if (v12) {
    NSUInteger v17 = 1;
  }
  else {
    NSUInteger v17 = 2;
  }
  result.length = v17;
  result.location = v16;
  return result;
}

- (void)revealChildAtIndex:(int64_t)a3
{
  double v4 = -[SFTabViewContainerView contentOffsetForFractionalIndex:]((uint64_t *)self, (double)a3);

  [(SFTabViewContainerView *)self setContentOffset:v4];
}

- (void)revealChildAtFractionalIndex:(double)a3
{
  double v4 = -[SFTabViewContainerView contentOffsetForFractionalIndex:]((uint64_t *)self, a3);

  [(SFTabViewContainerView *)self setContentOffset:v4];
}

- (SFTabViewContainerViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SFTabViewContainerViewDataSource *)WeakRetained;
}

- (BOOL)extendsVisibleRange
{
  return self->_extendsVisibleRange;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_childIndexToViewMap, 0);
}

- (void)uninstallChildViewAtIndex:(void *)a1 ignoringDelegateResult:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  double v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_18C354000, v5, v6, "%@%zd (skipped)", v7, v8, v9, v10, v11);
}

- (void)installChildViewAtIndex:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  double v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_18C354000, v5, v6, "%@%zd (return, index out of bounds)", v7, v8, v9, v10, v11);
}

@end