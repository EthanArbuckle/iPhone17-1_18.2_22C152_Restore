@interface _TVCollectionViewFlowLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)isHeterogeneous;
- (_TVCollectionViewFlowLayout)init;
- (double)contentHeightThatFitsItemCount:(int64_t)a3 expectedWidth:(double)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (int64_t)developmentLayoutDirection;
- (void)setHeterogeneous:(BOOL)a3;
@end

@implementation _TVCollectionViewFlowLayout

- (_TVCollectionViewFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)_TVCollectionViewFlowLayout;
  v2 = [(UICollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UICollectionViewFlowLayout *)v2 setSectionInsetReference:0];
  }
  return v3;
}

- (double)contentHeightThatFitsItemCount:(int64_t)a3 expectedWidth:(double)a4
{
  v7 = [(_TVCollectionViewFlowLayout *)self collectionView];
  uint64_t v8 = [v7 numberOfSections];
  [(UICollectionViewFlowLayout *)self itemSize];
  double v10 = v9;
  double v12 = v11;
  [(UICollectionViewFlowLayout *)self sectionInset];
  double v14 = v13;
  double v43 = v15;
  double v17 = v16;
  double v19 = v18;
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  double v21 = v20;
  [(UICollectionViewFlowLayout *)self minimumLineSpacing];
  double v23 = v22;
  if ([(UICollectionViewFlowLayout *)self scrollDirection] == 1)
  {
    double v24 = v17 + v14 + v12 * (double)a3 + v21 * (double)(a3 - 1);
  }
  else
  {
    double v42 = v10;
    double v24 = 0.0;
    if (a3 > 0 || a4 > 0.0)
    {
      if (a3
        || ![(_TVCollectionViewFlowLayout *)self isHeterogeneous]
        && (a3 = (uint64_t)((v21 + a4 - v43 - v19) / (v42 + v21))) != 0)
      {
        if (v8 >= 1)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            uint64_t v26 = objc_msgSend(v7, "numberOfItemsInSection:", i, *(void *)&v42);
            double v24 = v24 + v17 + v14 + v12 * (double)((a3 - 1 + v26) / a3) + v23 * (double)((a3 - 1 + v26) / a3 - 1);
          }
        }
      }
      else
      {
        v27 = objc_msgSend(v7, "delegate", *(void *)&v42);
        char v28 = objc_opt_respondsToSelector();

        if ((v28 & 1) != 0 && v8 >= 1)
        {
          uint64_t v29 = 0;
          double v30 = v14 + v17;
          do
          {
            double v24 = v30 + v24;
            uint64_t v31 = [v7 numberOfItemsInSection:v29];
            if (v31 >= 1)
            {
              uint64_t v32 = v31;
              uint64_t v33 = 0;
              do
              {
                double v34 = a4;
                while (1)
                {
                  v35 = [MEMORY[0x263F088C8] indexPathForItem:v33 inSection:v29];
                  v36 = [v7 delegate];
                  [v36 collectionView:v7 layout:self sizeForItemAtIndexPath:v35];
                  double v38 = v37;

                  if (v34 < v38)
                  {
                    uint64_t v39 = v34 == a4;
                    goto LABEL_24;
                  }
                  double v34 = v34 - (v21 + v38);
                  if (v34 < 0.0) {
                    break;
                  }

                  if (++v33 >= v32) {
                    goto LABEL_25;
                  }
                }
                uint64_t v39 = 1;
LABEL_24:
                v33 += v39;

LABEL_25:
                double v40 = -0.0;
                if (v33 < v32) {
                  double v40 = v23;
                }
                double v24 = v12 + v24 + v40;
              }
              while (v33 < v32);
            }
            ++v29;
          }
          while (v29 != v8);
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
  v20.super_class = (Class)_TVCollectionViewFlowLayout;
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
      v3 = [(_TVCollectionViewFlowLayout *)self collectionView];
      [v3 bounds];
      if (v14 != x)
      {
LABEL_10:

        goto LABEL_11;
      }
      v4 = [(_TVCollectionViewFlowLayout *)self collectionView];
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
    double v12 = [(_TVCollectionViewFlowLayout *)self collectionView];
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
    double v17 = [(_TVCollectionViewFlowLayout *)self collectionView];
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