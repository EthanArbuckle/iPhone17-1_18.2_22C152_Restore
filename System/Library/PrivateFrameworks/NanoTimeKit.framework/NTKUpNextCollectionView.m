@interface NTKUpNextCollectionView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation NTKUpNextCollectionView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)NTKUpNextCollectionView;
  -[NTKUpNextCollectionView hitTest:withEvent:](&v39, sel_hitTest_withEvent_, v7, x, y);
  v8 = (NTKUpNextCollectionView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  BOOL v10 = v8 == self || v8 == 0;
  if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = v9;
  }
  else
  {
    id v32 = v7;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v12 = [(NTKUpNextCollectionView *)self collectionViewLayout];
    v13 = objc_msgSend(v12, "layoutAttributesForElementsInRect:", x, y, 1.0, 1.0);

    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v16 = 0;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v19 computedFrame];
            v44.origin.double x = v20;
            v44.origin.double y = v21;
            v44.size.width = v22;
            v44.size.height = v23;
            v43.size.width = 1.0;
            v43.size.height = 1.0;
            v43.origin.double x = x;
            v43.origin.double y = y;
            if (CGRectIntersectsRect(v43, v44))
            {
              [v19 alpha];
              if (fabs(v24) >= 0.00000011920929 && ![v19 representedElementCategory])
              {
                if (!v16
                  || (!v19 ? (v34 = 0.0, double v25 = 0.0) : ([v19 transform3D], double v25 = v34),
                      [v16 transform3D],
                      v25 > v33))
                {
                  id v26 = v19;

                  v16 = v26;
                }
              }
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    v27 = [v16 indexPath];
    uint64_t v28 = [(NTKUpNextCollectionView *)self cellForItemAtIndexPath:v27];
    v29 = (void *)v28;
    if (v28) {
      v30 = (NTKUpNextCollectionView *)v28;
    }
    else {
      v30 = self;
    }
    v11 = v30;

    id v7 = v32;
  }

  return v11;
}

@end