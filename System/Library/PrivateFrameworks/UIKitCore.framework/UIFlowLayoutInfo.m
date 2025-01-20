@interface UIFlowLayoutInfo
@end

@implementation UIFlowLayoutInfo

void __32___UIFlowLayoutInfo_invalidate___block_invoke(uint64_t a1)
{
}

void __51___UIFlowLayoutInfo_setSizes_forItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x1E4F28D58];
  id v6 = a2;
  uint64_t v7 = [a3 integerValue];
  uint64_t v8 = [v6 integerValue];

  v9 = [v5 indexPathForItem:v7 inSection:v8];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 104);
  id WeakRetained = objc_loadWeakRetained((id *)(v10 + 120));
  uint64_t v13 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(WeakRetained, "_sectionArrayIndexForIndexPath:", v9));

  id v14 = v9;
  id v49 = v14;
  if (v13)
  {
    unint64_t v15 = [v14 item];
    if (v15 < *(void *)(v13 + 272) + *(void *)(v13 + 264))
    {
      unint64_t v16 = v15;
      do
      {
        v17 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v16, objc_msgSend(v49, "section"));
        -[_UIFlowLayoutSection addInvalidatedIndexPath:](v13, (uint64_t)v17);

        ++v16;
      }
      while (v16 < *(void *)(v13 + 272) + *(void *)(v13 + 264));
    }
    uint64_t v18 = objc_msgSend(*(id *)(v13 + 96), "objectAtIndexedSubscript:", objc_msgSend(v49, "item"));
    v19 = (void *)v18;
    if (v18)
    {
      v20 = objc_loadWeakRetained((id *)(v18 + 24));
      if (v20)
      {
        v21 = v20;
        uint64_t v22 = [*(id *)(v13 + 104) indexOfObject:v20];
        if (v22 >= 1)
        {
          uint64_t v23 = [*(id *)(v13 + 104) objectAtIndexedSubscript:v22 - 1];

          uint64_t v24 = [v49 item];
          if (v23) {
            v25 = *(void **)(v23 + 40);
          }
          else {
            v25 = 0;
          }
          for (uint64_t i = v24 - [v25 count]; i < objc_msgSend(v49, "item"); ++i)
          {
            v27 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", i, objc_msgSend(v49, "section"));
            -[_UIFlowLayoutSection addInvalidatedIndexPath:](v13, (uint64_t)v27);
          }
          v21 = (void *)v23;
        }
        CGFloat v29 = *(double *)(v13 + 16);
        CGFloat v28 = *(double *)(v13 + 24);
        double v30 = *(double *)(v13 + 32);
        double v31 = *(double *)(v13 + 40);
        v32 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v13 + 144));
        if (v32 && (int v33 = v32[97], v32, v33))
        {
          if (v21)
          {
            uint64_t v34 = v21[9];
            uint64_t v35 = v21[10];
            uint64_t v36 = v21[11];
            uint64_t v37 = v21[12];
          }
          else
          {
            uint64_t v35 = 0;
            uint64_t v36 = 0;
            uint64_t v37 = 0;
            uint64_t v34 = 0;
          }
          double MinX = CGRectGetMinX(*(CGRect *)&v34);
          v51.origin.x = v29;
          v51.origin.y = v28;
          v51.size.width = v30;
          v51.size.height = v31;
          double v39 = MinX - CGRectGetMinX(v51);
          v52.origin.x = v29;
          v52.origin.y = v28;
          v52.size.width = v39;
          v52.size.height = v31;
          double v30 = v30 - CGRectGetWidth(v52);
          v53.origin.x = v29;
          v53.origin.y = v28;
          v53.size.width = v39;
          v53.size.height = v31;
          CGFloat MaxX = CGRectGetMaxX(v53);
          CGFloat MaxY = v28;
          double v42 = v31;
        }
        else
        {
          if (v21)
          {
            uint64_t v43 = v21[9];
            uint64_t v44 = v21[10];
            uint64_t v45 = v21[11];
            uint64_t v46 = v21[12];
          }
          else
          {
            uint64_t v44 = 0;
            uint64_t v45 = 0;
            uint64_t v46 = 0;
            uint64_t v43 = 0;
          }
          double MinY = CGRectGetMinY(*(CGRect *)&v43);
          v54.origin.x = v29;
          v54.origin.y = v28;
          v54.size.width = v30;
          v54.size.height = v31;
          CGFloat v48 = MinY - CGRectGetMinY(v54);
          v55.origin.x = v29;
          v55.origin.y = v28;
          v55.size.width = v30;
          v55.size.height = v48;
          double v42 = v31 - CGRectGetHeight(v55);
          v56.origin.x = v29;
          v56.origin.y = v28;
          v56.size.width = v30;
          v56.size.height = v48;
          CGFloat MaxY = CGRectGetMaxY(v56);
          CGFloat MaxX = v29;
          double v31 = v48;
          double v39 = v30;
        }
        *(CGFloat *)(v13 + 16) = v29;
        *(CGFloat *)(v13 + 24) = v28;
        *(double *)(v13 + 32) = v39;
        *(double *)(v13 + 40) = v31;
        -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](v13, [v49 section], 0, 0, MaxX, MaxY, v30, v42);
      }
    }
  }
}

void __48___UIFlowLayoutInfo_setSize_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_block_invoke_2___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = NSNumber;
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = v2;
    id v6 = [v3 numberWithInteger:v4];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    v9 = [v8 collectionView];
    int v10 = 138412802;
    v11 = v6;
    __int16 v12 = 2112;
    id v13 = WeakRetained;
    __int16 v14 = 2112;
    unint64_t v15 = v9;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Warning: sizing information will be ignored since the section referenced %@ does not currently exist. layout=%@; c"
      "ollectionView=%@",
      (uint8_t *)&v10,
      0x20u);
  }
}

@end