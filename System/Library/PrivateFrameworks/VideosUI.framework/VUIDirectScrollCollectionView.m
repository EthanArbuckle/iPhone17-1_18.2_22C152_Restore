@interface VUIDirectScrollCollectionView
- (BOOL)canBecomeFocused;
- (VUIDirectScrollCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (double)_tapScrollDelta;
- (void)_downArrowAction:(id)a3;
- (void)_upArrowAction:(id)a3;
@end

@implementation VUIDirectScrollCollectionView

- (VUIDirectScrollCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VUIDirectScrollCollectionView;
  v4 = -[VUIDirectScrollCollectionView initWithFrame:collectionViewLayout:](&v13, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v6 = [(VUIDirectScrollCollectionView *)v4 panGestureRecognizer];
    v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:1];
    v14[0] = v7;
    v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:0];
    v14[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [v6 setAllowedTouchTypes:v9];

    [(VUIDirectScrollCollectionView *)v5 setBounces:1];
    [(VUIDirectScrollCollectionView *)v5 setShowsVerticalScrollIndicator:0];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB2258]) initWithTarget:v5 action:sel__downArrowAction_];
    [v10 setAllowedPressTypes:&unk_1F3F3E228];
    [(VUIDirectScrollCollectionView *)v5 addGestureRecognizer:v10];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB2258]) initWithTarget:v5 action:sel__upArrowAction_];
    [v11 setAllowedPressTypes:&unk_1F3F3E240];
    [(VUIDirectScrollCollectionView *)v5 addGestureRecognizer:v11];
  }
  return v5;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_downArrowAction:(id)a3
{
  id v14 = a3;
  if ([v14 state] == 1 || objc_msgSend(v14, "state") == 2)
  {
    [(VUIDirectScrollCollectionView *)self contentOffset];
    double v5 = v4;
    double v7 = v6;
    [(VUIDirectScrollCollectionView *)self contentSize];
    double v9 = v8;
    [(VUIDirectScrollCollectionView *)self bounds];
    double v10 = v9 - CGRectGetHeight(v16);
    [(VUIDirectScrollCollectionView *)self _tapScrollDelta];
    double v12 = v7 + v11;
    if (v10 >= v12) {
      double v13 = v12;
    }
    else {
      double v13 = v10;
    }
    -[VUIDirectScrollCollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v5, v13);
  }
}

- (void)_upArrowAction:(id)a3
{
  id v9 = a3;
  if ([v9 state] == 1 || objc_msgSend(v9, "state") == 2)
  {
    [(VUIDirectScrollCollectionView *)self contentOffset];
    double v5 = v4;
    double v7 = v6;
    [(VUIDirectScrollCollectionView *)self _tapScrollDelta];
    -[VUIDirectScrollCollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v5, fmax(v7 - v8, 0.0));
  }
}

- (double)_tapScrollDelta
{
  v2 = [(VUIDirectScrollCollectionView *)self collectionViewLayout];
  [v2 itemSize];
  double v4 = v3;
  [v2 minimumLineSpacing];
  double v6 = fmax(v4 + v5, 150.0);

  return v6;
}

@end