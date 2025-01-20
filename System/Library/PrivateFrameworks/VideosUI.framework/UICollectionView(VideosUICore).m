@interface UICollectionView(VideosUICore)
+ (id)collectionViewWithFrame:()VideosUICore parentView:collectionViewLayout:;
- (BOOL)vui_isIndexPathValid:()VideosUICore;
- (double)vuiSize;
- (id)_preciseIndexPathsForVisibleItems:()VideosUICore;
- (uint64_t)setVuiContentOffset:()VideosUICore;
- (uint64_t)vuiPreciseIndexPathsForFullyVisibleItems;
- (uint64_t)vuiPreciseIndexPathsForVisibleItems;
- (void)vui_scrollToItemAtIndexPath:()VideosUICore atScrollPosition:animated:;
@end

@implementation UICollectionView(VideosUICore)

+ (id)collectionViewWithFrame:()VideosUICore parentView:collectionViewLayout:
{
  id v14 = a7;
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___UICollectionView_0;
  id v15 = a8;
  id v16 = objc_msgSendSuper2(&v31, sel_alloc);
  v17 = objc_msgSend(v16, "initWithFrame:collectionViewLayout:", v15, a2, a3, a4, a5, v31.receiver, v31.super_class);

  if (v17)
  {
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 addSubview:v17];
    v18 = [v17 topAnchor];
    v19 = [v14 topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [v17 bottomAnchor];
    v22 = [v14 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = [v17 leftAnchor];
    v25 = [v14 leftAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [v17 rightAnchor];
    v28 = [v14 rightAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];
  }
  return v17;
}

- (double)vuiSize
{
  [a1 bounds];
  return v1;
}

- (uint64_t)setVuiContentOffset:()VideosUICore
{
  return objc_msgSend(a1, "setContentOffset:animated:", 0);
}

- (void)vui_scrollToItemAtIndexPath:()VideosUICore atScrollPosition:animated:
{
  id v8 = a3;
  if (objc_msgSend(a1, "vui_isIndexPathValid:")) {
    [a1 scrollToItemAtIndexPath:v8 atScrollPosition:a4 animated:a5];
  }
}

- (uint64_t)vuiPreciseIndexPathsForVisibleItems
{
  return [a1 _preciseIndexPathsForVisibleItems:0];
}

- (uint64_t)vuiPreciseIndexPathsForFullyVisibleItems
{
  return [a1 _preciseIndexPathsForVisibleItems:1];
}

- (id)_preciseIndexPathsForVisibleItems:()VideosUICore
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v46 = [a1 vuiIndexPathsForVisibleItems];
  v5 = [v46 sortedArrayUsingComparator:&__block_literal_global_17];
  v6 = objc_opt_new();
  [a1 contentOffset];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [a1 bounds];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v21 = [a1 cellForItemAtIndexPath:v20];
        v22 = v21;
        if (v21)
        {
          [v21 frame];
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          objc_super v31 = [v22 superview];
          objc_msgSend(a1, "convertRect:fromView:", v31, v24, v26, v28, v30);
          uint64_t v33 = v32;
          uint64_t v35 = v34;
          uint64_t v37 = v36;
          uint64_t v39 = v38;
          uint64_t v40 = v8;
          uint64_t v41 = v10;
          uint64_t v42 = v12;
          uint64_t v43 = v14;
          if (a3)
          {
            if (!CGRectContainsRect(*(CGRect *)&v40, *(CGRect *)&v33)) {
              goto LABEL_12;
            }
LABEL_11:
            [v6 addObject:v20];
          }
          else if (CGRectIntersectsRect(*(CGRect *)&v40, *(CGRect *)&v33))
          {
            goto LABEL_11;
          }
LABEL_12:
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v17);
  }

  v44 = (void *)[v6 copy];
  return v44;
}

- (BOOL)vui_isIndexPathValid:()VideosUICore
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5 >= [a1 numberOfSections])
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v6 = [v4 item];
    BOOL v7 = v6 < objc_msgSend(a1, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
  }

  return v7;
}

@end