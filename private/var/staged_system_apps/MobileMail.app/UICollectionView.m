@interface UICollectionView
+ (id)mf_offsetLog;
- (BOOL)mf_isIndexPathValid:(id)a3;
- (BOOL)mf_isIndexPathVisible:(id)a3 overlap:(CGRect)a4;
- (double)mf_cellOffsetByApplyingDynamicOffset:(id)a3 cellHeight:(double)a4;
- (double)mf_contentOffsetApplyingDynamicOffset:(id)a3 indexPath:(id)a4;
- (id)mf_dynamicOffsetForVisibleCell:(id)a3;
- (id)mf_mostVisibleCellNearestEdge:(unint64_t)a3 preferredMinimumHeight:(double)a4;
- (void)mf_pageDown;
- (void)mf_pageUp;
- (void)pageDirection:(int64_t)a3;
@end

@implementation UICollectionView

- (BOOL)mf_isIndexPathValid:(id)a3
{
  id v4 = a3;
  id v5 = [v4 row];
  id v6 = [v4 section];
  BOOL v8 = v4
    && (id v7 = v6, (uint64_t)v6 < [(UICollectionView *)self numberOfSections])
    && (uint64_t)v5 < [(UICollectionView *)self numberOfItemsInSection:v7];

  return v8;
}

- (void)pageDirection:(int64_t)a3
{
  [(UICollectionView *)self mf_visibleHeight];
  double v6 = v5;
  [(UICollectionView *)self contentInset];
  double v8 = v7;
  double v9 = v6 + -20.0;
  [(UICollectionView *)self visibleBounds];
  double MinY = CGRectGetMinY(v16);
  double v11 = MinY;
  if (a3 == 1)
  {
    double v11 = MinY - v9;
    if (MinY - v9 <= -v8) {
      double v11 = -v8;
    }
  }
  else if (!a3)
  {
    double v11 = v9 + MinY;
    double v12 = v6 + v9 + MinY;
    [(UICollectionView *)self contentSize];
    if (v12 >= v13)
    {
      [(UICollectionView *)self contentSize];
      double v11 = v14 - v6;
    }
  }
  -[UICollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 1, 0.0, v11);

  [(UICollectionView *)self flashScrollIndicators];
}

- (void)mf_pageUp
{
}

- (void)mf_pageDown
{
}

+ (id)mf_offsetLog
{
  if (qword_100699F48 != -1) {
    dispatch_once(&qword_100699F48, &stru_10060E198);
  }
  v2 = (void *)qword_100699F40;

  return v2;
}

- (id)mf_mostVisibleCellNearestEdge:(unint64_t)a3 preferredMinimumHeight:(double)a4
{
  char v4 = a3;
  double v6 = +[UICollectionView mf_offsetLog];
  int v7 = v4 & 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10045E594(v7, v6, a4);
  }

  double v8 = +[UICollectionView mf_offsetLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    [(UICollectionView *)self contentOffset];
    sub_10045E558((uint64_t)v56, v8, v9, v10, v11);
  }

  double v12 = [(UICollectionView *)self visibleCells];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100224C54;
  v53[3] = &unk_10060E1B8;
  char v54 = v7;
  double v13 = [v12 sortedArrayUsingComparator:v53];

  [(UICollectionView *)self mui_safeVisibleBounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v22 = +[UICollectionView mf_offsetLog];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v58.origin.CGFloat x = v15;
    v58.origin.CGFloat y = v17;
    v58.size.CGFloat width = v19;
    v58.size.CGFloat height = v21;
    NSStringFromCGRect(v58);
    objc_claimAutoreleasedReturnValue();
    sub_10045E510();
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v23 = v13;
  id v24 = [v23 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v24)
  {
    id v25 = 0;
    uint64_t v26 = *(void *)v50;
    double v48 = 0.0;
    while (2)
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v50 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        [v28 frame];
        v64.origin.CGFloat x = v29;
        v64.origin.CGFloat y = v30;
        v64.size.CGFloat width = v31;
        v64.size.CGFloat height = v32;
        v59.origin.CGFloat x = v15;
        v59.origin.CGFloat y = v17;
        v59.size.CGFloat width = v19;
        v59.size.CGFloat height = v21;
        CGRect v60 = CGRectIntersection(v59, v64);
        CGFloat x = v60.origin.x;
        CGFloat y = v60.origin.y;
        CGFloat width = v60.size.width;
        CGFloat height = v60.size.height;
        if (!CGRectIsNull(v60))
        {
          [v28 frame];
          if (CGRectGetHeight(v61) > a4)
          {
            [v28 frame];
            v65.origin.CGFloat x = v37;
            v65.origin.CGFloat y = v38;
            v65.size.CGFloat width = v39;
            v65.size.CGFloat height = v40;
            v62.origin.CGFloat x = v15;
            v62.origin.CGFloat y = v17;
            v62.size.CGFloat width = v19;
            v62.size.CGFloat height = v21;
            if (CGRectContainsRect(v62, v65))
            {
              v44 = +[UICollectionView mf_offsetLog];
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                [(UICollectionView *)self indexPathForCell:v28];
                objc_claimAutoreleasedReturnValue();
                sub_10045E4C8();
              }

              id v45 = v28;
              goto LABEL_30;
            }
          }
          v63.origin.CGFloat x = x;
          v63.origin.CGFloat y = y;
          v63.size.CGFloat width = width;
          v63.size.CGFloat height = height;
          double v41 = CGRectGetHeight(v63);
          if (v41 > v48)
          {
            id v42 = v28;

            double v48 = v41;
            id v25 = v42;
          }
        }
      }
      id v24 = [v23 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v24) {
        continue;
      }
      break;
    }

    if (v25)
    {
      v43 = +[UICollectionView mf_offsetLog];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        [(UICollectionView *)self indexPathForCell:v25];
        objc_claimAutoreleasedReturnValue();
        sub_10045E480();
      }
      goto LABEL_29;
    }
  }
  else
  {
  }
  v43 = +[UICollectionView mf_offsetLog];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    sub_10045E43C(v43);
  }
  id v25 = 0;
LABEL_29:

  id v25 = v25;
  id v45 = v25;
LABEL_30:

  return v45;
}

- (id)mf_dynamicOffsetForVisibleCell:(id)a3
{
  id v4 = a3;
  double v5 = [(UICollectionView *)self visibleCells];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if (v6)
  {
    int v7 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10045E7A4((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }

    [(UICollectionView *)self mui_safeVisibleBounds];
    CGFloat v49 = v15;
    CGFloat v50 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [(UICollectionView *)self mui_safeVisibleBounds];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [v4 frame];
    v61.origin.CGFloat x = v28;
    v61.origin.CGFloat y = v29;
    v61.size.CGFloat width = v30;
    v61.size.CGFloat height = v31;
    v52.origin.CGFloat x = v21;
    v52.origin.CGFloat y = v23;
    v52.size.CGFloat width = v25;
    v52.size.CGFloat height = v27;
    CGRect v53 = CGRectIntersection(v52, v61);
    CGFloat x = v53.origin.x;
    CGFloat y = v53.origin.y;
    CGFloat width = v53.size.width;
    CGFloat height = v53.size.height;
    [v4 frame];
    double v48 = CGRectGetHeight(v54);
    v55.origin.CGFloat x = x;
    v55.origin.CGFloat y = y;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v55);
    [v4 frame];
    double v37 = CGRectGetMinY(v56);
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    double v38 = CGRectGetMinY(v57);
    v58.origin.CGFloat y = v49;
    v58.origin.CGFloat x = v50;
    v58.size.CGFloat width = v17;
    v58.size.CGFloat height = v19;
    double v39 = CGRectGetMinY(v58);
    CGFloat v40 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v59.origin.CGFloat y = v49;
      v59.origin.CGFloat x = v50;
      v59.size.CGFloat width = v17;
      v59.size.CGFloat height = v19;
      NSStringFromCGRect(v59);
      objc_claimAutoreleasedReturnValue();
      sub_10045E510();
    }

    double v41 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      sub_10045E738();
    }

    id v42 = +[UICollectionView mf_offsetLog];
    double v43 = MinY - v37;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      sub_10045E6CC();
    }

    v44 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      sub_10045E660();
    }

    v60.origin.CGFloat y = v49;
    v60.origin.CGFloat x = v50;
    v60.size.CGFloat width = v17;
    v60.size.CGFloat height = v19;
    id v45 = [[MFDynamicCellOffsetRepresentation alloc] initWithRelativeCellAnchor:v43 / v48 relativeDistanceFromTop:(v38 - v39) / CGRectGetHeight(v60)];
    v46 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      [(MFDynamicCellOffsetRepresentation *)v45 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045E618();
    }
  }
  else
  {
    id v45 = 0;
  }

  return v45;
}

- (double)mf_cellOffsetByApplyingDynamicOffset:(id)a3 cellHeight:(double)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if (a4 > 0.0)
  {
    uint64_t v8 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      [v6 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045E954();
    }

    [v6 relativeCellAnchor];
    [v6 relativeDistanceFromTop];
    [(UICollectionView *)self mui_safeVisibleBounds];
    CGRectGetHeight(v14);
    UIRoundToViewScale();
    double v7 = v9;
    uint64_t v10 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10045E8E8();
    }

    uint64_t v11 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10045E87C();
    }

    uint64_t v12 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10045E810();
    }
  }
  return v7;
}

- (double)mf_contentOffsetApplyingDynamicOffset:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UICollectionView *)self layoutAttributesForItemAtIndexPath:v7];
  if (v8)
  {
    double v9 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10045EAF8((uint64_t)v7, (uint64_t)v6, v9);
    }

    [v8 size];
    [(UICollectionView *)self mf_cellOffsetByApplyingDynamicOffset:v6 cellHeight:v10];
    [v8 frame];
    CGRectGetMinY(v22);
    [(UICollectionView *)self contentInset];
    UIRoundToViewScale();
    double v12 = v11;
    uint64_t v13 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10045EA8C();
    }

    CGRect v14 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10045EA20();
    }

    [(UICollectionView *)self mf_minContentOffset];
    double v16 = v15;
    [(UICollectionView *)self mf_maxContentOffset];
    if (v12 >= v17) {
      double v18 = v17;
    }
    else {
      double v18 = v12;
    }
    if (v16 >= v18) {
      double v19 = v16;
    }
    else {
      double v19 = v18;
    }
    double v20 = +[UICollectionView mf_offsetLog];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10045E9B4();
    }
  }
  else
  {
    double v19 = 0.0;
  }

  return v19;
}

- (BOOL)mf_isIndexPathVisible:(id)a3 overlap:(CGRect)a4
{
  id v5 = a3;
  id v6 = [(UICollectionView *)self indexPathsForVisibleItems];
  unsigned int v7 = [v6 containsObject:v5];

  if (v7)
  {
    uint64_t v8 = [(UICollectionView *)self layoutAttributesForItemAtIndexPath:v5];
    [v8 frame];
    -[UICollectionView convertRect:toView:](self, "convertRect:toView:", self);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(UICollectionView *)self mui_safeVisibleBounds];
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
    v27.origin.CGFloat x = v10;
    v27.origin.CGFloat y = v12;
    v27.size.CGFloat width = v14;
    v27.size.CGFloat height = v16;
    if (CGRectContainsRect(v25, v27))
    {
      char v21 = 1;
    }
    else
    {
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      v28.origin.CGFloat x = v10;
      v28.origin.CGFloat y = v12;
      v28.size.CGFloat width = v14;
      v28.size.CGFloat height = v16;
      char v21 = CGRectIntersectsRect(v26, v28);
    }
    if (!CGRectIsNull(a4))
    {
      v29.origin.CGFloat x = v10;
      v29.origin.CGFloat y = v12;
      v29.size.CGFloat width = v14;
      v29.size.CGFloat height = v16;
      BOOL v22 = CGRectContainsRect(a4, v29);
      v30.origin.CGFloat x = v10;
      v30.origin.CGFloat y = v12;
      v30.size.CGFloat width = v14;
      v30.size.CGFloat height = v16;
      CGRectIntersectsRect(a4, v30);
      v21 &= !v22;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

@end