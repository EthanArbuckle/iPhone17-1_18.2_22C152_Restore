@interface CarSmallWidgetCollectionViewFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
@end

@implementation CarSmallWidgetCollectionViewFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v6 = sub_100577F64();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v21.double width = width;
    v21.double height = height;
    v7 = NSStringFromCGSize(v21);
    v8 = [(CarSmallWidgetCollectionViewFlowLayout *)self collectionView];
    [v8 bounds];
    v22.double width = v9;
    v22.double height = v10;
    v11 = NSStringFromCGSize(v22);
    int v17 = 138412546;
    v18 = v7;
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange newBoundsSize: %@, collectionViewBounds: %@", (uint8_t *)&v17, 0x16u);
  }
  v12 = [(CarSmallWidgetCollectionViewFlowLayout *)self collectionView];
  [v12 bounds];
  BOOL v15 = height != v14 || width != v13;

  return v15;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CarSmallWidgetCollectionViewFlowLayout;
  v3 = -[CarSmallWidgetCollectionViewFlowLayout invalidationContextForBoundsChange:](&v7, "invalidationContextForBoundsChange:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v3 setInvalidateFlowLayoutDelegateMetrics:1];
  v4 = sub_100577F64();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 description];
    *(_DWORD *)buf = 138412290;
    CGFloat v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionViewFlowLayout invalidationContextForBoundsChange %@", buf, 0xCu);
  }

  return v3;
}

@end