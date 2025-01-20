@interface SFCapsuleCollectionViewItem
- (BOOL)capsuleContentIsValid;
- (BOOL)capsuleIsDetached;
- (SFCapsuleCollectionView)collectionView;
- (SFCapsuleCollectionViewItem)initWithCollectionView:(id)a3;
- (SFCapsuleView)capsuleView;
- (double)capsuleHeightForWidth:(double)a3 defaultHeight:(double)a4 state:(int64_t)a5 index:(int64_t)a6;
- (int64_t)animationCount;
- (void)invalidateCapsuleHeight;
- (void)setAnimationCount:(int64_t)a3;
- (void)setCapsuleContentIsValid:(BOOL)a3;
- (void)setCapsuleIsDetached:(BOOL)a3;
- (void)setCapsuleView:(id)a3;
@end

@implementation SFCapsuleCollectionViewItem

- (double)capsuleHeightForWidth:(double)a3 defaultHeight:(double)a4 state:(int64_t)a5 index:(int64_t)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleView);
  id v12 = objc_loadWeakRetained((id *)&self->_collectionView);
  cachedContentSizesByState = self->_cachedContentSizesByState;
  v14 = [NSNumber numberWithInteger:a5];
  v15 = [(NSMutableDictionary *)cachedContentSizesByState objectForKeyedSubscript:v14];

  if (v15 || ![v12 _suppressingDataSourceCalls])
  {
    v17 = [WeakRetained contentView];
    [v15 CGSizeValue];
    double v19 = v18;
    BOOL v22 = v20 != a3 || v15 == 0;
    if (v17 && v22)
    {
      v23 = [v12 delegate];
      uint64_t v24 = [v12 numberOfItems];
      double v19 = a4;
      if (v24 != a6)
      {
        int64_t v25 = v24;
        double v19 = a4;
        if (objc_opt_respondsToSelector())
        {
          if (v25 >= a6)
          {
            [v23 capsuleCollectionView:v12 heightForItemAtIndex:a6 width:a5 state:a3];
          }
          else
          {
            [WeakRetained bounds];
            double Height = CGRectGetHeight(v33);
          }
          double v19 = Height;
        }
      }
      *(double *)v31 = a3;
      *(double *)&v31[1] = v19;
      v27 = [MEMORY[0x1E4F29238] valueWithBytes:v31 objCType:"{CGSize=dd}"];
      v28 = self->_cachedContentSizesByState;
      v29 = [NSNumber numberWithInteger:a5];
      [(NSMutableDictionary *)v28 setObject:v27 forKeyedSubscript:v29];
    }
    if (v19 > 0.0) {
      a4 = v19;
    }
  }
  else
  {
    [WeakRetained bounds];
    CGFloat v16 = CGRectGetHeight(v32);
    if (v16 != 0.0) {
      a4 = v16;
    }
  }

  return a4;
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (BOOL)capsuleIsDetached
{
  return self->_capsuleIsDetached;
}

- (void)setCapsuleContentIsValid:(BOOL)a3
{
  self->_capsuleContentIsValid = a3;
}

- (void)setCapsuleView:(id)a3
{
}

- (SFCapsuleView)capsuleView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleView);

  return (SFCapsuleView *)WeakRetained;
}

- (void)invalidateCapsuleHeight
{
}

- (SFCapsuleCollectionViewItem)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFCapsuleCollectionViewItem;
  v5 = [(SFCapsuleCollectionViewItem *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedContentSizesByState = v6->_cachedContentSizesByState;
    v6->_cachedContentSizesByState = (NSMutableDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (SFCapsuleCollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (SFCapsuleCollectionView *)WeakRetained;
}

- (void)setCapsuleIsDetached:(BOOL)a3
{
  self->_capsuleIsDetached = a3;
}

- (BOOL)capsuleContentIsValid
{
  return self->_capsuleContentIsValid;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_capsuleView);

  objc_storeStrong((id *)&self->_cachedContentSizesByState, 0);
}

@end