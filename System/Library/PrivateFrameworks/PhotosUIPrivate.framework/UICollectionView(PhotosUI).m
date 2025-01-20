@interface UICollectionView(PhotosUI)
- (id)next:()PhotosUI indexPathFromIndexPath:;
- (uint64_t)pu_scrollToItemAtIndexPath:()PhotosUI atScrollPosition:animated:;
- (uint64_t)pu_scrollToRect:()PhotosUI atScrollPosition:animated:;
- (void)pu_animateUpdateOfCollectionViewSubview:()PhotosUI animations:completion:;
@end

@implementation UICollectionView(PhotosUI)

- (void)pu_animateUpdateOfCollectionViewSubview:()PhotosUI animations:completion:
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  [v8 bounds];
  objc_msgSend(a1, "convertRect:fromView:", v8);
  v11 = objc_msgSend(a1, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
  v12 = [a1 backgroundColor];
  [v11 setBackgroundColor:v12];

  [v8 bounds];
  objc_msgSend(v11, "setFrame:");
  if (v9) {
    v9[2](v9);
  }
  [v8 addSubview:v11];
  v13 = (void *)MEMORY[0x1E4FB1EB0];
  double v14 = *MEMORY[0x1E4FB2E08];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__UICollectionView_PhotosUI__pu_animateUpdateOfCollectionViewSubview_animations_completion___block_invoke;
  v20[3] = &unk_1E5F2ED10;
  id v21 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__UICollectionView_PhotosUI__pu_animateUpdateOfCollectionViewSubview_animations_completion___block_invoke_2;
  v17[3] = &unk_1E5F2E930;
  id v18 = v21;
  id v19 = v10;
  id v15 = v10;
  id v16 = v21;
  [v13 animateWithDuration:v20 animations:v17 completion:v14];
}

- (id)next:()PhotosUI indexPathFromIndexPath:
{
  id v6 = a4;
  v20 = v6;
  if (a3)
  {
    v7 = v6;
    if (a3 < 0) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = 1;
    }
    uint64_t v9 = objc_msgSend(a1, "numberOfSections", v6);
    uint64_t v10 = [v7 section];
    uint64_t v11 = [v7 item];
    v12 = 0;
    if ((v10 & 0x8000000000000000) == 0 && v10 < v9)
    {
      v12 = 0;
      uint64_t v13 = v11 + v8;
      if (a3 >= 0) {
        uint64_t v14 = a3;
      }
      else {
        uint64_t v14 = -a3;
      }
      do
      {
        id v15 = a1;
        uint64_t v16 = [a1 numberOfItemsInSection:v10];
        if (v13 == 0x8000000000000000) {
          uint64_t v13 = (v16 - 1) & (a3 >> 63);
        }
        if ((v13 & 0x8000000000000000) == 0)
        {
          uint64_t v17 = v16;
          do
          {
            if (v13 >= v17) {
              break;
            }
            if (v14 == 1)
            {
              uint64_t v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:v10];

              v12 = (void *)v18;
            }
            if (!--v14) {
              break;
            }
            v13 += v8;
          }
          while ((v13 & 0x8000000000000000) == 0);
        }
        if (!v14) {
          break;
        }
        v10 += v8;
        if (v10 < 0) {
          break;
        }
        uint64_t v13 = 0x8000000000000000;
        a1 = v15;
      }
      while (v10 < v9);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (uint64_t)pu_scrollToItemAtIndexPath:()PhotosUI atScrollPosition:animated:
{
  uint64_t v8 = objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:");
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  return objc_msgSend(a1, "pu_scrollToRect:atScrollPosition:animated:", a4, a5, v10, v12, v14, v16);
}

- (uint64_t)pu_scrollToRect:()PhotosUI atScrollPosition:animated:
{
  [a1 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v44 = v19;
  CGFloat v45 = v20;
  [a1 contentInset];
  double v23 = v22;
  double v42 = v25;
  double v43 = v24;
  if ((a7 & 8) != 0)
  {
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    double v31 = CGRectGetMinX(v48) - v23;
  }
  else
  {
    double v26 = v21;
    CGFloat v27 = a2;
    CGFloat v28 = a3;
    CGFloat v29 = a4;
    CGFloat v30 = a5;
    if ((a7 & 0x20) != 0)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v27);
      v49.origin.x = v16;
      v49.origin.y = v18;
      v49.size.width = v44;
      v49.size.height = v45;
      double v31 = MaxX - (CGRectGetWidth(v49) - v26);
    }
    else
    {
      double MidX = CGRectGetMidX(*(CGRect *)&v27);
      v47.origin.x = v16;
      v47.origin.y = v18;
      v47.size.width = v44;
      v47.size.height = v45;
      double v31 = MidX + (v23 + CGRectGetWidth(v47) - v26) * -0.5;
    }
  }
  CGFloat v33 = a2;
  CGFloat v34 = a3;
  CGFloat v35 = a4;
  CGFloat v36 = a5;
  if (a7)
  {
    double v38 = CGRectGetMinY(*(CGRect *)&v33) - v43;
  }
  else if ((a7 & 4) != 0)
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)&v33);
    v51.origin.x = v16;
    v51.origin.y = v18;
    v51.size.width = v44;
    v51.size.height = v45;
    double v38 = MaxY - (CGRectGetHeight(v51) - v42);
  }
  else
  {
    double MidY = CGRectGetMidY(*(CGRect *)&v33);
    v50.origin.x = v16;
    v50.origin.y = v18;
    v50.size.width = v44;
    v50.size.height = v45;
    double v38 = MidY + (v43 + CGRectGetHeight(v50) - v42) * -0.5;
  }
  return objc_msgSend(a1, "px_scrollToContentOffset:animated:", a8, v31, v38);
}

@end