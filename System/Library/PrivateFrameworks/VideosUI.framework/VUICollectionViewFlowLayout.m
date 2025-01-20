@interface VUICollectionViewFlowLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)isHeterogeneous;
- (VUICollectionViewFlowLayout)init;
- (double)contentHeightThatFitsItemCount:(int64_t)a3 expectedWidth:(double)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (int64_t)developmentLayoutDirection;
- (void)setHeterogeneous:(BOOL)a3;
@end

@implementation VUICollectionViewFlowLayout

- (VUICollectionViewFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUICollectionViewFlowLayout;
  v2 = [(UICollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UICollectionViewFlowLayout *)v2 setSectionInsetReference:0];
  }
  return v3;
}

- (double)contentHeightThatFitsItemCount:(int64_t)a3 expectedWidth:(double)a4
{
  v7 = [(VUICollectionViewFlowLayout *)self collectionView];
  uint64_t v8 = [v7 numberOfSections];
  [(UICollectionViewFlowLayout *)self itemSize];
  double v40 = v9;
  double v11 = v10;
  [(UICollectionViewFlowLayout *)self sectionInset];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  double v21 = v20;
  [(UICollectionViewFlowLayout *)self minimumLineSpacing];
  double v23 = v22;
  if ([(UICollectionViewFlowLayout *)self scrollDirection] == 1)
  {
    double v24 = v17 + v13 + v11 * (double)a3 + v21 * (double)(a3 - 1);
  }
  else
  {
    double v39 = v19;
    if (a3 > 0 || (double v24 = 0.0, a4 > 0.0))
    {
      if (!a3)
      {
        if ([(VUICollectionViewFlowLayout *)self isHeterogeneous]) {
          a3 = 0;
        }
        else {
          a3 = (uint64_t)((v21 + a4 - v15 - v39) / (v40 + v21));
        }
      }
      v25 = objc_msgSend(v7, "delegate", *(void *)&v39);
      if (a3)
      {
        if (v8 < 1)
        {
          double v24 = 0.0;
        }
        else
        {
          uint64_t v26 = 0;
          double v24 = 0.0;
          do
          {
            uint64_t v27 = [v7 numberOfItemsInSection:v26];
            double v24 = v24 + v17 + v13 + v11 * (double)((a3 - 1 + v27) / a3) + v23 * (double)((a3 - 1 + v27) / a3 - 1);
            ++v26;
          }
          while (v8 != v26);
        }
      }
      else
      {
        double v24 = 0.0;
        if ((objc_opt_respondsToSelector() & 1) != 0 && v8 >= 1)
        {
          uint64_t v28 = 0;
          double v29 = v13 + v17;
          do
          {
            double v24 = v29 + v24;
            uint64_t v30 = [v7 numberOfItemsInSection:v28];
            if (v30 >= 1)
            {
              uint64_t v31 = v30;
              uint64_t v32 = 0;
              do
              {
                double v33 = a4;
                while (1)
                {
                  v34 = [MEMORY[0x1E4F28D58] indexPathForItem:v32 inSection:v28];
                  [v25 collectionView:v7 layout:self sizeForItemAtIndexPath:v34];
                  if (v33 < v35)
                  {
                    uint64_t v36 = v33 == a4;
                    goto LABEL_26;
                  }
                  double v33 = v33 - (v21 + v35);
                  if (v33 < 0.0) {
                    break;
                  }

                  if (++v32 >= v31) {
                    goto LABEL_27;
                  }
                }
                uint64_t v36 = 1;
LABEL_26:
                v32 += v36;

LABEL_27:
                double v37 = -0.0;
                if (v32 < v31) {
                  double v37 = v23;
                }
                double v24 = v11 + v24 + v37;
              }
              while (v32 < v31);
            }
            ++v28;
          }
          while (v28 != v8);
        }
      }
    }
  }

  return v24;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)VUICollectionViewFlowLayout;
  double v10 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v20, sel_invalidationContextForBoundsChange_);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v11 = [(UICollectionViewFlowLayout *)self scrollDirection];
    if (v11)
    {
      if ([(UICollectionViewFlowLayout *)self scrollDirection] != 1) {
        goto LABEL_12;
      }
    }
    else
    {
      v3 = [(VUICollectionViewFlowLayout *)self collectionView];
      [v3 bounds];
      if (v14 != x)
      {
LABEL_10:

        goto LABEL_11;
      }
      v4 = [(VUICollectionViewFlowLayout *)self collectionView];
      [v4 bounds];
      if (v15 != width)
      {
LABEL_9:

        goto LABEL_10;
      }
      if ([(UICollectionViewFlowLayout *)self scrollDirection] != 1)
      {

        goto LABEL_12;
      }
    }
    double v12 = [(VUICollectionViewFlowLayout *)self collectionView];
    [v12 bounds];
    if (v13 != y)
    {

      if (v11)
      {
LABEL_11:
        [v10 setInvalidateFlowLayoutDelegateMetrics:1];
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    double v17 = [(VUICollectionViewFlowLayout *)self collectionView];
    [v17 bounds];
    double v19 = v18;

    if (!v11)
    {
    }
    if (v19 != height) {
      goto LABEL_11;
    }
  }
LABEL_12:
  return v10;
}

- (int64_t)developmentLayoutDirection
{
  return 0;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (BOOL)isHeterogeneous
{
  return self->_heterogeneous;
}

- (void)setHeterogeneous:(BOOL)a3
{
  self->_heterogeneous = a3;
}

@end