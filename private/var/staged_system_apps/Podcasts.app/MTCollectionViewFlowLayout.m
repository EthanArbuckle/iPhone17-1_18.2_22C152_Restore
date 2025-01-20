@interface MTCollectionViewFlowLayout
+ (Class)layoutAttributesClass;
- (BOOL)updateAttributes:(id)a3 forIndexPath:(id)a4;
- (MTCollectionViewFlowLayout)init;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)superLayoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)updateAttributes:(id)a3 withTopAlignmentGuide:(double)a4 andLastYOrigin:(double)a5;
- (void)updateCachedLayoutAttributesForElementsInRect:(id)a3;
- (void)updateCellPresentationAttributes:(id)a3;
@end

@implementation MTCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (MTCollectionViewFlowLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTCollectionViewFlowLayout;
  v2 = [(MTCollectionViewFlowLayout *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MTBaseCollectionViewFlowLayout *)v2 setNumberOfColumns:1];
    v7[0] = UIFlowLayoutCommonRowHorizontalAlignmentKey;
    v7[1] = UIFlowLayoutLastRowHorizontalAlignmentKey;
    v8[0] = &off_1005797A0;
    v8[1] = &off_1005797A0;
    v7[2] = UIFlowLayoutRowVerticalAlignmentKey;
    v8[2] = &off_1005797B8;
    v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    [(MTCollectionViewFlowLayout *)v3 _setRowAlignmentsOptions:v4];

    [(MTCollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:kMTCollectionViewInterItemSpacing];
    [(MTCollectionViewFlowLayout *)v3 setMinimumLineSpacing:kMTCollectionViewInterLineSpacing];
    -[MTCollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", kMTCollectionViewVerticalSectionInset, 0.0, kMTCollectionViewVerticalSectionInset, 0.0);
  }
  return v3;
}

- (BOOL)updateAttributes:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 item];
  v9 = [(MTCollectionViewFlowLayout *)self collectionView];
  id v10 = [v9 numberOfItemsInSection:[v7 section]];

  if (v8 >= v10) {
    goto LABEL_26;
  }
  unint64_t v11 = (unint64_t)[v7 row];
  unint64_t v12 = v11 / [(MTBaseCollectionViewFlowLayout *)self numberOfColumns];
  unint64_t v13 = (unint64_t)[v7 row];
  unint64_t v70 = v13 % [(MTBaseCollectionViewFlowLayout *)self numberOfColumns];
  [v6 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  unint64_t v22 = [(MTBaseCollectionViewFlowLayout *)self numberOfColumns];
  id v71 = v10;
  id v69 = v8;
  unint64_t v68 = v12;
  if ([(MTBaseCollectionViewFlowLayout *)self numberOfColumns])
  {
    unint64_t v23 = 0;
    do
    {
      v24 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v23 + v22 * v12, [v7 section]);
      id v25 = [v24 item];
      v26 = [(MTCollectionViewFlowLayout *)self collectionView];
      id v27 = [v26 numberOfItemsInSection:[v7 section]];

      if (v25 < v27 && [v24 compare:v7])
      {
        v73.receiver = self;
        v73.super_class = (Class)MTCollectionViewFlowLayout;
        v28 = [(MTCollectionViewFlowLayout *)&v73 layoutAttributesForItemAtIndexPath:v24];
        [v28 frame];
        if (v29 < v17) {
          double v17 = v29;
        }
      }
      ++v23;
    }
    while (v23 < [(MTBaseCollectionViewFlowLayout *)self numberOfColumns]);
  }
  if (v70)
  {
    id v8 = v69;
  }
  else
  {
    v30 = [(MTCollectionViewFlowLayout *)self collectionView];
    v31 = (char *)[v30 numberOfItemsInSection:[v7 section]] - 1;
    v32 = (char *)[v7 row];

    id v8 = v69;
    if (v31 == v32)
    {
      v33 = [(MTCollectionViewFlowLayout *)self collectionView];
      [v33 bounds];
      double Width = CGRectGetWidth(v74);

      [v6 frame];
      double v35 = CGRectGetWidth(v75);
      double v36 = Width - v35 * (double)[(MTBaseCollectionViewFlowLayout *)self numberOfColumns];
      [(MTCollectionViewFlowLayout *)self minimumInteritemSpacing];
      double v15 = (v36 - v37 * (double)([(MTBaseCollectionViewFlowLayout *)self numberOfColumns] - 1)) * 0.5;
    }
  }
  [v6 setFrame:v15, v17, v19, v21];
  [v6 setZIndex:1];
  id v38 = [v7 section];
  v39 = [(MTBaseCollectionViewFlowLayout *)self expandedIndexPath];
  if (v38 != [v39 section])
  {
LABEL_24:
    id v10 = v71;
    goto LABEL_25;
  }
  v40 = [(MTBaseCollectionViewFlowLayout *)self expandedIndexPath];
  id v41 = [v40 compare:v7];

  id v10 = v71;
  if (!v41) {
    goto LABEL_26;
  }
  id v42 = v8;
  v43 = [(MTBaseCollectionViewFlowLayout *)self expandedIndexPath];
  unint64_t v44 = (unint64_t)[v43 row];
  unint64_t v45 = v44 / [(MTBaseCollectionViewFlowLayout *)self numberOfColumns];

  v46 = [(MTBaseCollectionViewFlowLayout *)self expandedIndexPath];
  unint64_t v47 = (unint64_t)[v46 row];
  unint64_t v48 = v47 % [(MTBaseCollectionViewFlowLayout *)self numberOfColumns];

  BOOL v49 = v68 > v45;
  if (v68 != v45)
  {
    id v8 = v42;
    id v10 = v71;
    if (!v49 || v48 == v70) {
      goto LABEL_26;
    }
    v39 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (unsigned char *)[v7 row]- (unsigned char *)-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"), objc_msgSend(v7, "section"));
    v58 = [(MTCollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v39];
    [v6 frame];
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    [v58 frame];
    double MaxY = CGRectGetMaxY(v76);
    [(MTCollectionViewFlowLayout *)self minimumLineSpacing];
    [v6 setFrame:v60 MaxY + v66 v62 v64];

    goto LABEL_24;
  }
  id v10 = v71;
  id v8 = v42;
  if (v48 != v70)
  {
    v50 = [(MTBaseCollectionViewFlowLayout *)self expandedIndexPath];
    id v51 = [v50 row];
    v52 = [(MTCollectionViewFlowLayout *)self collectionView];
    id v53 = [v52 numberOfItemsInSection:[v7 section]];

    BOOL v54 = v51 >= v53;
    id v10 = v71;
    if (!v54)
    {
      v55 = [(MTBaseCollectionViewFlowLayout *)self expandedIndexPath];
      v72.receiver = self;
      v72.super_class = (Class)MTCollectionViewFlowLayout;
      v39 = [(MTCollectionViewFlowLayout *)&v72 layoutAttributesForItemAtIndexPath:v55];

      id v10 = v71;
      [v6 frame];
      double v57 = v56;
      [v39 frame];
      [v6 setFrame:v57];
LABEL_25:
    }
  }
LABEL_26:

  return v8 < v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MTCollectionViewFlowLayout;
  v5 = [(MTCollectionViewFlowLayout *)&v7 layoutAttributesForItemAtIndexPath:v4];
  if ([(MTBaseCollectionViewFlowLayout *)self numberOfColumns] < 2) {
    [v5 setZIndex:1];
  }
  else {
    [(MTCollectionViewFlowLayout *)self updateAttributes:v5 forIndexPath:v4];
  }
  [(MTCollectionViewFlowLayout *)self updateCellPresentationAttributes:v5];

  return v5;
}

- (id)superLayoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MTCollectionViewFlowLayout;
  id v8 = [(MTCollectionViewFlowLayout *)&v10 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];

  return v8;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"MTUnplayedBackgroundCollectionReusableViewKind"])
  {
    id v8 = [(MTCollectionViewFlowLayout *)self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:v7];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double Width = v13;
    double Height = v15;
    double v17 = +[MTCollectionViewFlowLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"MTUnplayedBackgroundCollectionReusableViewKind" withIndexPath:v7];
    [v17 setZIndex:0];
    double v18 = [(MTCollectionViewFlowLayout *)self collectionView];
    double v19 = [v18 refreshControl];
    double v20 = v19;
    if (v19)
    {
      [v19 frame];
      double Height = CGRectGetHeight(v32);
      [v20 frame];
      double Width = CGRectGetWidth(v33);
    }
    [v17 setFrame:v10, v12, Width, Height];
  }
  else
  {
    id v8 = [(MTCollectionViewFlowLayout *)self superLayoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
    if (v8)
    {
      [(MTBaseCollectionViewFlowLayout *)self appliedYOffset];
      double v22 = v21;
      unint64_t v23 = [(MTCollectionViewFlowLayout *)self collectionView];
      v24 = (char *)[v23 numberOfSections] - 1;

      if ([v7 section] == v24)
      {
        double v25 = 1.79769313e308;
      }
      else
      {
        v26 = +[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", (char *)[v7 section] + 1);
        id v27 = [(MTCollectionViewFlowLayout *)self superLayoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v26];
        v28 = v27;
        if (v27)
        {
          [v27 frame];
          double v25 = v29;
        }
        else
        {
          double v25 = 1.79769313e308;
        }
      }
      [(MTCollectionViewFlowLayout *)self updateAttributes:v8 withTopAlignmentGuide:v22 andLastYOrigin:v25];
      id v8 = v8;
      double v17 = v8;
    }
    else
    {
      double v17 = 0;
    }
  }

  return v17;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v80.receiver = self;
  v80.super_class = (Class)MTCollectionViewFlowLayout;
  double v66 = [(MTCollectionViewFlowLayout *)&v80 layoutAttributesForElementsInRect:"layoutAttributesForElementsInRect:"];
  id v8 = [(MTCollectionViewFlowLayout *)self collectionView];
  BOOL v9 = [v8 numberOfSections] == 0;

  if (v9)
  {
    double v64 = v66;
    id v63 = v66;
  }
  else
  {
    id v10 = [v66 mutableCopy];
    if ([(MTBaseCollectionViewFlowLayout *)self numberOfColumns] >= 2)
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v76 objects:v83 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v77;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v77 != v13) {
              objc_enumerationMutation(v11);
            }
            double v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            double v16 = [v15 representedElementKind];
            BOOL v17 = v16 == 0;

            if (v17)
            {
              double v18 = [v15 indexPath];
              [(MTCollectionViewFlowLayout *)self updateAttributes:v15 forIndexPath:v18];
            }
          }
          id v12 = [v11 countByEnumeratingWithState:&v76 objects:v83 count:16];
        }
        while (v12);
      }
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v19 = v10;
    id v20 = [v19 countByEnumeratingWithState:&v72 objects:v82 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v73;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v73 != v21) {
            objc_enumerationMutation(v19);
          }
          unint64_t v23 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
          v24 = [v23 representedElementKind];
          BOOL v25 = v24 == 0;

          if (v25) {
            [(MTCollectionViewFlowLayout *)self updateCellPresentationAttributes:v23];
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v72 objects:v82 count:16];
      }
      while (v20);
    }

    v26 = [(MTBaseCollectionViewFlowLayout *)self expandedIndexPath];
    if (v26)
    {
      BOOL v27 = [(MTBaseCollectionViewFlowLayout *)self numberOfColumns] > 1;

      if (v27)
      {
        v28 = [(MTBaseCollectionViewFlowLayout *)self expandedIndexPath];
        unint64_t v29 = (unint64_t)[v28 row];
        unint64_t v30 = [(MTBaseCollectionViewFlowLayout *)self numberOfColumns];

        v31 = [v19 lastObject];
        CGRect v32 = [v31 indexPath];
        CGRect v33 = [(MTCollectionViewFlowLayout *)self collectionView];
        v34 = [v33 numberOfItemsInSection:[v32 section]];

        unint64_t v35 = (unint64_t)[v32 item] + 1;
        if ((uint64_t)v35 < (uint64_t)v34)
        {
          unint64_t v36 = v29 % v30;
          do
          {
            while (v35 % [(MTBaseCollectionViewFlowLayout *)self numberOfColumns] == v36)
            {
              if ((uint64_t)++v35 >= (uint64_t)v34) {
                goto LABEL_33;
              }
            }
            double v37 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v35, [v32 section]);
            id v38 = [(MTCollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v37];
            [v19 addObject:v38];
            [v38 frame];
            double MaxY = CGRectGetMaxY(v85);
            v86.origin.CGFloat x = x;
            v86.origin.CGFloat y = y;
            v86.size.CGFloat width = width;
            v86.size.CGFloat height = height;
            BOOL v40 = MaxY < CGRectGetMaxY(v86);
          }
          while ((uint64_t)++v35 < (uint64_t)v34 && v40);
        }
LABEL_33:
      }
    }
    id v42 = +[NSMutableDictionary dictionary];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v43 = v19;
    id v44 = [v43 countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v69;
      do
      {
        for (k = 0; k != v44; k = (char *)k + 1)
        {
          if (*(void *)v69 != v45) {
            objc_enumerationMutation(v43);
          }
          unint64_t v47 = *(void **)(*((void *)&v68 + 1) + 8 * (void)k);
          unint64_t v48 = [v47 representedElementKind];

          if (v48)
          {
            BOOL v49 = [v47 indexPath];
            v50 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v49 section]);
            [v42 setObject:v47 forKeyedSubscript:v50];
          }
        }
        id v44 = [v43 countByEnumeratingWithState:&v68 objects:v81 count:16];
      }
      while (v44);
    }

    [(MTBaseCollectionViewFlowLayout *)self appliedYOffset];
    double v52 = v51;
    id v53 = [(MTCollectionViewFlowLayout *)self collectionView];
    uint64_t v54 = (uint64_t)[v53 numberOfSections];

    if (v54 >= 1)
    {
      uint64_t v55 = v54 + 1;
      double v56 = 1.79769313e308;
      while (1)
      {
        double v57 = +[NSIndexPath indexPathWithIndex:v55 - 2];
        v58 = +[NSNumber numberWithInteger:v55 - 2];
        double v59 = [v42 objectForKeyedSubscript:v58];

        if (v59) {
          goto LABEL_48;
        }
        v67.receiver = self;
        v67.super_class = (Class)MTCollectionViewFlowLayout;
        double v59 = [(MTCollectionViewFlowLayout *)&v67 layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:v57];
        if (v59) {
          break;
        }
LABEL_51:

        if ((unint64_t)--v55 <= 1) {
          goto LABEL_52;
        }
      }
      [v43 addObject:v59];
LABEL_48:
      [(MTCollectionViewFlowLayout *)self updateAttributes:v59 withTopAlignmentGuide:v52 andLastYOrigin:v56];
      [v59 frame];
      if (v56 >= v60) {
        double v56 = v60;
      }

      goto LABEL_51;
    }
LABEL_52:
    double v61 = +[NSIndexPath indexPathForItem:0 inSection:0];
    double v62 = [(MTCollectionViewFlowLayout *)self layoutAttributesForSupplementaryViewOfKind:@"MTUnplayedBackgroundCollectionReusableViewKind" atIndexPath:v61];
    [v43 addObject:v62];
    id v63 = [v43 copy];
    [(MTCollectionViewFlowLayout *)self updateCachedLayoutAttributesForElementsInRect:v63];

    double v64 = v66;
  }

  return v63;
}

- (void)updateCachedLayoutAttributesForElementsInRect:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v5, "_collectionViewData");
  id v7 = [(MTCollectionViewFlowLayout *)self collectionView];
  id v8 = object_getIvar(v7, InstanceVariable);

  if (!v8)
  {
    unint64_t v29 = +[IMLogger sharedLogger];
    unint64_t v30 = v29;
    CFStringRef v31 = @"Unable to retreive collection view data instance.";
    uint64_t v32 = 373;
LABEL_26:
    [v29 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m" lineNumber:v32 format:v31];

    goto LABEL_30;
  }
  BOOL v9 = NSClassFromString(@"UICollectionViewData");
  if (!v9)
  {
    unint64_t v29 = +[IMLogger sharedLogger];
    unint64_t v30 = v29;
    CFStringRef v31 = @"Unable to retreive collection view data class.";
    uint64_t v32 = 379;
    goto LABEL_26;
  }
  id v10 = class_getInstanceVariable(v9, "_supplementaryLayoutAttributes");
  id v11 = object_getIvar(v8, v10);
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = [v11 objectForKeyedSubscript:UICollectionElementKindSectionHeader];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v34 = +[IMLogger sharedLogger];
      [v34 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m" lineNumber:392 format:@"Unable to retreive cached supplementary layout attributes of kind header from collection view data."];
    }
    else if ([v12 count])
    {
      unint64_t v35 = v11;
      unint64_t v36 = v8;
      uint64_t v13 = +[NSMutableSet set];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v37 = v4;
      id v14 = v4;
      id v15 = [v14 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            id v20 = [v19 representedElementKind];
            unsigned int v21 = [UICollectionElementKindSectionHeader isEqualToString:v20];

            if (v21)
            {
              double v22 = [v19 indexPath];
              unint64_t v23 = [v12 objectForKeyedSubscript:v22];
              v24 = v23;
              if (v23 && ([v23 isEqual:v19] & 1) == 0)
              {
                [v12 setObject:v19 forKey:v22];
                BOOL v25 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v22 section]);
                [v13 addObject:v25];
              }
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v16);
      }

      if ([v13 count])
      {
        v26 = +[IMLogger sharedLogger];
        BOOL v27 = [v13 allObjects];
        v28 = [v27 componentsJoinedByString:@", "];
        [v26 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m", 422, @"Collection view data cache updated with new attributes for sections: %@", v28 lineNumber format];
      }
      id v8 = v36;
      id v4 = v37;
      id v11 = v35;
    }
  }
  else
  {
    CGRect v33 = +[IMLogger sharedLogger];
    [v33 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m" lineNumber:386 format:@"Unable to retreive cached supplementary layout attributes from collection view data."];
  }
LABEL_30:
}

- (void)updateCellPresentationAttributes:(id)a3
{
  id v20 = a3;
  id v4 = [(MTCollectionViewFlowLayout *)self collectionView];
  v5 = [v20 indexPath];
  id v6 = [(MTCollectionViewFlowLayout *)self collectionView];
  id v7 = [v6 numberOfItemsInSection:[v5 section]];

  unint64_t v8 = (unint64_t)(v7 - 1);
  BOOL v9 = [v4 swipedCellIndexPath];
  id v10 = [v9 compare:v5];

  id v11 = [v4 swipedCellIndexPath];
  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  uint64_t v13 = v12;
  [v20 setOpen:v13];

  [v20 setShowsSeperator:1];
  if ([v5 item] == (id)v8
    || (unint64_t v14 = (unint64_t)[v5 item],
        unint64_t v15 = v14 / [(MTBaseCollectionViewFlowLayout *)self numberOfColumns],
        unint64_t v16 = (unint64_t)[v5 item],
        unint64_t v17 = [(MTBaseCollectionViewFlowLayout *)self numberOfColumns],
        unint64_t v18 = v8 / [(MTBaseCollectionViewFlowLayout *)self numberOfColumns],
        unint64_t v19 = [(MTBaseCollectionViewFlowLayout *)self numberOfColumns],
        v15 == v18 - 1)
    && v16 % v17 != v8 % v19
    || v15 == v18)
  {
    [v20 setShowsSeperator:0];
  }
}

- (void)updateAttributes:(id)a3 withTopAlignmentGuide:(double)a4 andLastYOrigin:(double)a5
{
  id v7 = a3;
  if (v7)
  {
    id v15 = v7;
    [v7 naturalRect];
    if (v8 == 0.0)
    {
      [v15 frame];
      [v15 setNaturalRect:];
    }
    [v15 frame];
    double x = v17.origin.x;
    double y = v17.origin.y;
    double width = v17.size.width;
    double height = v17.size.height;
    if (CGRectGetMinY(v17) >= a4
      || (v18.origin.double x = x,
          v18.origin.double y = y,
          v18.size.double width = width,
          v18.size.double height = height,
          CGRectGetHeight(v18) + a4 >= a5))
    {
      v19.origin.double x = x;
      v19.origin.double y = y;
      v19.size.double width = width;
      v19.size.double height = height;
      double MinY = CGRectGetMinY(v19);
      if (a5 > a4 && MinY < a4)
      {
        v20.origin.double x = x;
        v20.origin.double y = y;
        v20.size.double width = width;
        v20.size.double height = height;
        double y = a5 - CGRectGetHeight(v20);
        [v15 setFloating:1];
        [v15 setPartiallyOffTheTop:1];
      }
    }
    else
    {
      [v15 setFloating:1];
      double y = a4;
    }
    [v15 setFrame:CGRectMake(x, y, width, height)];
    if ([v15 isFloating]) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 2;
    }
    [v15 setZIndex:v14];
    id v7 = v15;
  }
}

@end