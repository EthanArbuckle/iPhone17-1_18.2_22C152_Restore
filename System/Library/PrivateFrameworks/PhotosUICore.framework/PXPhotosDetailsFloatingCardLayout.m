@interface PXPhotosDetailsFloatingCardLayout
- (BOOL)canDrag;
- (CGRect)_containerBounds;
- (NSDictionary)heightsForIdentifier;
- (NSDictionary)identifiersForHeight;
- (NSOrderedSet)snappableHeights;
- (PXPhotosDetailsFloatingCardLayout)initWithPhotosDetailsUIViewController:(id)a3 widgetComposition:(id)a4;
- (UIEdgeInsets)insets;
- (double)initialHeight;
- (double)width;
- (unint64_t)initialPosition;
- (void)_configureForPhotosDetailsViewController:(id)a3 composition:(id)a4;
- (void)didUpdateCardHeight:(double)a3;
- (void)didUpdateCardPosition:(unint64_t)a3;
@end

@implementation PXPhotosDetailsFloatingCardLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightsForIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersForHeight, 0);
  objc_storeStrong((id *)&self->_snappableHeights, 0);
}

- (NSDictionary)heightsForIdentifier
{
  return self->_heightsForIdentifier;
}

- (NSDictionary)identifiersForHeight
{
  return self->_identifiersForHeight;
}

- (CGRect)_containerBounds
{
  double x = self->__containerBounds.origin.x;
  double y = self->__containerBounds.origin.y;
  double width = self->__containerBounds.size.width;
  double height = self->__containerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSOrderedSet)snappableHeights
{
  return self->_snappableHeights;
}

- (void)didUpdateCardPosition:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  v3 = +[PXUserDefaults standardUserDefaults];
  [v3 setInfoPanelLastSnappedPosition:v4];
}

- (void)didUpdateCardHeight:(double)a3
{
  id v7 = [NSNumber numberWithDouble:a3];
  id v4 = [(PXPhotosDetailsFloatingCardLayout *)self identifiersForHeight];
  v5 = [v4 objectForKeyedSubscript:v7];

  if (v5)
  {
    v6 = +[PXUserDefaults standardUserDefaults];
    [v6 setInfoPanelLastSnappedWidgetIdentifier:v5];
  }
}

- (void)_configureForPhotosDetailsViewController:(id)a3 composition:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 contentEdgeInsets];
  id v7 = [v6 spec];
  [v7 widgetSpec];
  objc_claimAutoreleasedReturnValue();

  v8 = [v5 view];
  [v8 bounds];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  PXEdgeInsetsIsNull();
}

void __90__PXPhotosDetailsFloatingCardLayout__configureForPhotosDetailsViewController_composition___block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v20 preferredContentHeightForWidth:*(double *)(a1 + 80)];
    double v4 = v3;
  }
  else
  {
    double v4 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v20 contentTilingController];
      id v6 = [v5 currentLayout];
      id v7 = [v5 targetLayout];
      v8 = v7;
      if (!v7) {
        id v7 = v6;
      }
      [v7 contentBounds];
      double v4 = v9;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v10 = [v20 snappableWidgetIdentifier];
  }
  else
  {
    v10 = 0;
  }
  if (v4 > 0.0)
  {
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24);
    v11 = [*(id *)(a1 + 32) widgets];
    id v12 = [v11 firstObject];

    v13 = [*(id *)(a1 + 32) widgets];
    id v14 = [v13 lastObject];

    id v15 = v20;
    if (v12 == v20)
    {
      [*(id *)(a1 + 40) distanceBetweenTopAndHeaderlessWidgetContentTop];
      id v15 = v20;
      *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v16
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                              + 24);
    }
    v17 = *(void **)(a1 + 40);
    if (v14 == v15) {
      [v17 distanceBetweenFooterlessWidgetContentBottomAndBottom];
    }
    else {
      [v17 distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop];
    }
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v18
                                                                + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24);
    if (v10)
    {
      v19 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      [*(id *)(a1 + 48) addObject:v19];
      [*(id *)(a1 + 56) setObject:v10 forKeyedSubscript:v19];
      [*(id *)(a1 + 64) setObject:v19 forKeyedSubscript:v10];
    }
  }
}

- (unint64_t)initialPosition
{
  v2 = +[PXUserDefaults standardUserDefaults];
  double v3 = [v2 infoPanelLastSnappedPosition];

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (BOOL)canDrag
{
  v2 = +[PXPhotosDetailsSettings sharedInstance];
  char v3 = [v2 draggableInfoPanelEnabled];

  return v3;
}

- (UIEdgeInsets)insets
{
  double v2 = 46.0;
  double v3 = 20.0;
  double v4 = 20.0;
  double v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)initialHeight
{
  double v3 = [(PXPhotosDetailsFloatingCardLayout *)self snappableHeights];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0.0;
  }
  double v5 = +[PXUserDefaults standardUserDefaults];
  id v6 = [v5 infoPanelLastSnappedWidgetIdentifier];

  if (v6
    && ([(PXPhotosDetailsFloatingCardLayout *)self heightsForIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v6],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    [v8 floatValue];
    float v10 = v9;
  }
  else
  {
    v8 = [(PXPhotosDetailsFloatingCardLayout *)self snappableHeights];
    id v12 = [v8 lastObject];
    [v12 floatValue];
    float v10 = v13;
  }
  double v11 = v10;

  return v11;
}

- (double)width
{
  return 375.0;
}

- (PXPhotosDetailsFloatingCardLayout)initWithPhotosDetailsUIViewController:(id)a3 widgetComposition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosDetailsFloatingCardLayout;
  v8 = [(PXPhotosDetailsFloatingCardLayout *)&v17 init];
  if (v8)
  {
    float v9 = [v6 view];
    float v10 = [v9 superview];
    double v11 = [v10 safeAreaLayoutGuide];
    [v11 layoutFrame];
    v8->__containerBounds.origin.double x = v12;
    v8->__containerBounds.origin.double y = v13;
    v8->__containerBounds.size.double width = v14;
    v8->__containerBounds.size.double height = v15;

    [(PXPhotosDetailsFloatingCardLayout *)v8 _configureForPhotosDetailsViewController:v6 composition:v7];
  }

  return v8;
}

@end