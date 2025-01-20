@interface CRLiOSPresetCollectionViewLayout
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)isCellEditableForSection:(unint64_t)a3 context:(id)a4;
- (BOOL)p_shouldVerticallyDistributeEvenlyInContext:(id)a3;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldVerticallyDistributeEvenlyForContext:(id)a3;
- (BOOL)showsSubpageNavigator;
- (BOOL)supportsSearch;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)p_swatchInsets;
- (CGSize)sizeOfPresetInSection:(unint64_t)a3;
- (CRLiOSPresetCollectionViewLayout)initWithPresetCollectionViewLayoutProvider:(id)a3 delegate:(id)a4;
- (CRLiOSPresetCollectionViewLayoutDelegate)p_delegate;
- (CRLiOSPresetCollectionViewLayoutProviding)p_layoutProvider;
- (NSArray)pageControlTitles;
- (NSArray)subpageNavigatorItems;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)p_insetsInSection:(unint64_t)a3 forContext:(id)a4;
- (double)additionalHeightForItemInSection:(unint64_t)a3 context:(id)a4;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)horizontalInsetForItemInSection:(unint64_t)a3 context:(id)a4;
- (double)p_horizontalSpacingInSection:(unint64_t)a3 forContext:(id)a4;
- (double)p_minimumInteritemSpacingInSection:(unint64_t)a3 forContext:(id)a4;
- (double)p_minimumLineSpacingInSection:(unint64_t)a3 forContext:(id)a4;
- (double)p_swatchHeightGivenWidth:(double)a3 context:(id)a4;
- (double)p_swatchWidthInSection:(unint64_t)a3 forContext:(id)a4;
- (double)p_verticalSpacingForSection:(unint64_t)a3 context:(id)a4;
- (id)cellRegistrationDictionary;
- (id)cellReuseIdentifierForSection:(unint64_t)a3 context:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)p_context;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSectionsInCollectionViewForContext:(id)a3;
- (unint64_t)p_itemsPerRowInContext:(id)a3;
- (unint64_t)pageControlType;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)setP_delegate:(id)a3;
- (void)setP_layoutProvider:(id)a3;
@end

@implementation CRLiOSPresetCollectionViewLayout

- (CRLiOSPresetCollectionViewLayout)initWithPresetCollectionViewLayoutProvider:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSPresetCollectionViewLayout;
  v9 = [(CRLiOSPresetCollectionViewLayout *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutProvider, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (double)additionalHeightForItemInSection:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  char v8 = objc_opt_respondsToSelector();

  double v9 = 0.0;
  if (v8)
  {
    v10 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
    [v10 additionalHeightForItemInSection:a3 context:v6];
    double v9 = v11;
  }
  return v9;
}

- (id)cellReuseIdentifierForSection:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  char v8 = [v7 cellReuseIdentifierForSection:a3 context:v6];

  return v8;
}

- (id)cellRegistrationDictionary
{
  v2 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  v3 = [v2 cellRegistrationDictionary];

  return v3;
}

- (BOOL)isCellEditableForSection:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLiOSPresetCollectionViewLayout *)self p_layoutProvider];
  LOBYTE(a3) = [v7 isCellEditableForSection:a3 context:v6];

  return a3;
}

- (double)horizontalInsetForItemInSection:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  char v8 = objc_opt_respondsToSelector();

  double v9 = 0.0;
  if (v8)
  {
    v10 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
    [v10 horizontalInsetForItemInSection:a3 context:v6];
    double v9 = v11;
  }
  return v9;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  v5 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  id v6 = [(CRLiOSPresetCollectionViewLayout *)self p_context];
  id v7 = [v5 numberOfItemsInSection:a3 context:v6];

  return (unint64_t)v7;
}

- (unint64_t)numberOfSectionsInCollectionViewForContext:(id)a3
{
  id v4 = a3;
  v5 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
    unint64_t v8 = (unint64_t)[v7 numberOfSectionsInCollectionViewForContext:v4];
  }
  else
  {
    unint64_t v8 = 1;
  }

  return v8;
}

- (CGSize)sizeOfPresetInSection:(unint64_t)a3
{
  v5 = [(CRLiOSPresetCollectionViewLayout *)self p_context];
  [(CRLiOSPresetCollectionViewLayout *)self p_swatchWidthInSection:a3 forContext:v5];
  double v7 = v6;
  -[CRLiOSPresetCollectionViewLayout p_swatchHeightGivenWidth:context:](self, "p_swatchHeightGivenWidth:context:", v5);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  [a4 layer:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setHidden:0];
}

- (BOOL)showsSubpageNavigator
{
  v2 = [(CRLiOSPresetCollectionViewLayout *)self p_layoutProvider];
  unsigned __int8 v3 = [v2 showsSubpageNavigator];

  return v3;
}

- (NSArray)subpageNavigatorItems
{
  v2 = [(CRLiOSPresetCollectionViewLayout *)self p_layoutProvider];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v3 = [v2 subpageTitles];
  }
  else
  {
    unsigned __int8 v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (BOOL)supportsSearch
{
  v2 = [(CRLiOSPresetCollectionViewLayout *)self p_layoutProvider];
  unsigned __int8 v3 = [v2 supportsSearch];

  return v3;
}

- (unint64_t)pageControlType
{
  v2 = [(CRLiOSPresetCollectionViewLayout *)self p_layoutProvider];
  id v3 = [v2 pageControlType];

  return (unint64_t)v3;
}

- (NSArray)pageControlTitles
{
  v2 = [(CRLiOSPresetCollectionViewLayout *)self p_layoutProvider];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 pageControlTitles];
    id v4 = [v3 crl_arrayByMappingObjectsUsingBlock:&stru_1014CD110];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (BOOL)shouldVerticallyDistributeEvenlyForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSPresetCollectionViewLayout *)self p_layoutProvider];
  unsigned __int8 v6 = [v5 shouldVerticallyDistributeEvenlyForContext:v4];

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = [a5 section:a3, a4];
  [(CRLiOSPresetCollectionViewLayout *)self sizeOfPresetInSection:v6];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CRLiOSPresetCollectionViewLayout *)self p_context];
  [(CRLiOSPresetCollectionViewLayout *)self horizontalInsetForItemInSection:v6 context:v11];
  double v13 = v8 + v12 * 2.0;
  [(CRLiOSPresetCollectionViewLayout *)self additionalHeightForItemInSection:v6 context:v11];
  double v15 = v10 + v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v7 = [(CRLiOSPresetCollectionViewLayout *)self p_context];
  [(CRLiOSPresetCollectionViewLayout *)self p_insetsInSection:a5 forContext:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  double v7 = [(CRLiOSPresetCollectionViewLayout *)self p_context];
  [(CRLiOSPresetCollectionViewLayout *)self p_minimumInteritemSpacingInSection:a5 forContext:v7];
  double v9 = v8;

  return v9;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  double v7 = [(CRLiOSPresetCollectionViewLayout *)self p_context];
  [(CRLiOSPresetCollectionViewLayout *)self p_minimumLineSpacingInSection:a5 forContext:v7];
  double v9 = v8;

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CRLiOSPresetCollectionViewLayout *)self p_delegate];
  unsigned __int8 v7 = [v6 presetCollectionViewLayoutShouldHighlightPresetAtIndexPath:v5];

  return v7;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CRLiOSPresetCollectionViewLayout *)self p_delegate];
  [v6 presetCollectionViewLayoutDidHighlightPresetAtIndexPath:v5];
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CRLiOSPresetCollectionViewLayout *)self p_delegate];
  [v6 presetCollectionViewLayoutDidUnhighlightPresetAtIndexPath:v5];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CRLiOSPresetCollectionViewLayout *)self p_delegate];
  [v6 presetCollectionViewLayoutDidSelectPresetAtIndexPath:v5];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CRLiOSPresetCollectionViewLayout;
  if ([(CRLiOSPresetCollectionViewLayout *)&v20 shouldInvalidateLayoutForBoundsChange:"shouldInvalidateLayoutForBoundsChange:"])
  {
    return 1;
  }
  double v9 = [(CRLiOSPresetCollectionViewLayout *)self collectionView];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v21.origin.CGFloat x = v11;
  v21.origin.CGFloat y = v13;
  v21.size.CGFloat width = v15;
  v21.size.CGFloat height = v17;
  double v18 = CGRectGetHeight(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v19 = CGRectGetHeight(v22);
  return v18 != v19 && vabdd_f64(v18, v19) >= fabs(v19 * 0.000000999999997);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat rect = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (objc_class *)objc_opt_class();
  v28.receiver = self;
  v28.super_class = (Class)CRLiOSPresetCollectionViewLayout;
  double v9 = -[CRLiOSPresetCollectionViewLayout invalidationContextForBoundsChange:](&v28, "invalidationContextForBoundsChange:", x, y, width, height);
  double v10 = sub_10024715C(v8, v9);

  CGFloat v11 = [(CRLiOSPresetCollectionViewLayout *)self collectionView];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v30.origin.double x = v13;
  v30.origin.double y = v15;
  v30.size.double width = v17;
  v30.size.double height = v19;
  double v20 = CGRectGetWidth(v30);
  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.double width = width;
  v31.size.double height = rect;
  double v21 = CGRectGetWidth(v31);
  BOOL v22 = v20 != v21 && vabdd_f64(v20, v21) >= fabs(v21 * 0.000000999999997);
  v32.origin.double x = v13;
  v32.origin.double y = v15;
  v32.size.double width = v17;
  v32.size.double height = v19;
  double v23 = CGRectGetHeight(v32);
  v33.origin.double x = x;
  v33.origin.double y = y;
  v33.size.double width = width;
  v33.size.double height = rect;
  double v24 = CGRectGetHeight(v33);
  BOOL v25 = v23 != v24 && vabdd_f64(v23, v24) >= fabs(v24 * 0.000000999999997);
  [v10 setInvalidateFlowLayoutDelegateMetrics:[v10 invalidateFlowLayoutDelegateMetrics] | (v22 || v25)];
  [v10 setInvalidateFlowLayoutAttributes:[v10 invalidateFlowLayoutAttributes] | v25];

  return v10;
}

- (id)p_context
{
  v2 = [(CRLiOSPresetCollectionViewLayout *)self p_delegate];
  id v3 = [v2 context];

  return v3;
}

- (double)p_swatchWidthInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6 = a4;
  double v7 = (double)[(CRLiOSPresetCollectionViewLayout *)self p_itemsPerRowInContext:v6];
  [(CRLiOSPresetCollectionViewLayout *)self p_swatchInsets];
  double v9 = v8;
  double v10 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  [v10 minimumHorizontalSpacingMultiplierInSection:a3 forContext:v6];
  double v12 = v11;

  double v13 = v7 + v12 * (v7 + 1.0);
  [v6 contentSize];
  double v15 = v14;

  return floor(v15 / v13 + v9 * 2.0);
}

- (double)p_swatchHeightGivenWidth:(double)a3 context:(id)a4
{
  id v6 = a4;
  double v7 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  [v7 presetWidthToHeightRatioForContext:v6];
  double v9 = v8;

  return floor(a3 / v9);
}

- (UIEdgeInsets)p_insetsInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6 = a4;
  [(CRLiOSPresetCollectionViewLayout *)self p_swatchInsets];
  double v8 = v7;
  double v10 = v9;
  [(CRLiOSPresetCollectionViewLayout *)self p_horizontalSpacingInSection:a3 forContext:v6];
  double v12 = v11;
  [(CRLiOSPresetCollectionViewLayout *)self horizontalInsetForItemInSection:a3 context:v6];
  double v14 = v13;
  [(CRLiOSPresetCollectionViewLayout *)self p_verticalSpacingForSection:a3 context:v6];
  double v16 = v15;
  LODWORD(a3) = [(CRLiOSPresetCollectionViewLayout *)self p_shouldVerticallyDistributeEvenlyInContext:v6];

  double v17 = fmin(v16 - v10, 32.0);
  if (a3) {
    double v17 = v16;
  }
  double v18 = v12 - (v8 + v14);
  double v19 = v17;
  double v20 = v18;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (double)p_minimumLineSpacingInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6 = a4;
  [(CRLiOSPresetCollectionViewLayout *)self p_verticalSpacingForSection:a3 context:v6];
  double v8 = v7;
  LOBYTE(a3) = [(CRLiOSPresetCollectionViewLayout *)self p_shouldVerticallyDistributeEvenlyInContext:v6];

  if (a3) {
    return v8;
  }
  [(CRLiOSPresetCollectionViewLayout *)self p_swatchInsets];
  return v8 + v10 * -2.0;
}

- (double)p_minimumInteritemSpacingInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6 = a4;
  [(CRLiOSPresetCollectionViewLayout *)self p_horizontalSpacingInSection:a3 forContext:v6];
  double v8 = v7;
  [(CRLiOSPresetCollectionViewLayout *)self p_swatchInsets];
  double v10 = v9;
  [(CRLiOSPresetCollectionViewLayout *)self horizontalInsetForItemInSection:a3 context:v6];
  double v12 = v11;

  return v8 + (v10 + v12) * -2.0;
}

- (double)p_horizontalSpacingInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6 = a4;
  double v7 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  [v7 minimumHorizontalSpacingMultiplierInSection:a3 forContext:v6];
  double v9 = v8;

  [(CRLiOSPresetCollectionViewLayout *)self p_swatchWidthInSection:a3 forContext:v6];
  double v11 = v10;

  [(CRLiOSPresetCollectionViewLayout *)self p_swatchInsets];
  return v9 * (v11 + v12 * -2.0);
}

- (BOOL)p_shouldVerticallyDistributeEvenlyInContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  unsigned __int8 v6 = [v5 shouldVerticallyDistributeEvenlyForContext:v4];

  return v6;
}

- (double)p_verticalSpacingForSection:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  [(CRLiOSPresetCollectionViewLayout *)self p_swatchWidthInSection:a3 forContext:v6];
  -[CRLiOSPresetCollectionViewLayout p_swatchHeightGivenWidth:context:](self, "p_swatchHeightGivenWidth:context:", v6);
  double v8 = v7;
  if ([(CRLiOSPresetCollectionViewLayout *)self p_shouldVerticallyDistributeEvenlyInContext:v6])
  {
    unint64_t v9 = vcvtps_u32_f32((float)[(CRLiOSPresetCollectionViewLayout *)self numberOfItemsInSection:a3]/ (float)[(CRLiOSPresetCollectionViewLayout *)self p_itemsPerRowInContext:v6]);
    [v6 contentSize];
    double v11 = floor((v10 - (double)v9 * v8) / (double)(v9 + 1));
  }
  else
  {
    double v12 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
    [v12 minimumVerticalSpacingMultiplierInSection:a3 forContext:v6];
    double v14 = v13;

    [(CRLiOSPresetCollectionViewLayout *)self p_swatchInsets];
    double v11 = v14 * (v8 + v15 * -2.0);
  }

  return v11;
}

- (unint64_t)p_itemsPerRowInContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSPresetCollectionViewLayout *)self p_layoutProvider];
  id v6 = [v5 itemsPerRowForContext:v4];

  return (unint64_t)v6;
}

- (CGSize)p_swatchInsets
{
  v2 = [(CRLiOSPresetCollectionViewLayout *)self presetCollectionViewLayoutProvider];
  [v2 swatchInsets];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CRLiOSPresetCollectionViewLayoutDelegate)p_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLiOSPresetCollectionViewLayoutDelegate *)WeakRetained;
}

- (void)setP_delegate:(id)a3
{
}

- (CRLiOSPresetCollectionViewLayoutProviding)p_layoutProvider
{
  return self->_layoutProvider;
}

- (void)setP_layoutProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end