@interface THWGalleryExpandedRotationController
- (CGPoint)contentCenterOffset;
- (CGPoint)translate;
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (THWGalleryExpandedRotationController)initWithRep:(id)a3 pagedCanvasController:(id)a4 zoomableCanvasController:(id)a5;
- (THWGalleryRep)rep;
- (THWPagedCanvasController)pagedCanvasController;
- (THWZoomableCanvasController)zoomableCanvasController;
- (double)scale;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (double)targetViewScale;
- (int)autoRotationMode;
- (unint64_t)pageIndex;
- (void)dealloc;
- (void)expandedDidRotateTransitionToSize:(CGSize)a3;
- (void)expandedDidTransitionToSize:(CGSize)a3;
- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5;
- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (void)p_layoutWithSize:(CGSize)a3;
- (void)p_updateOtherItemLayers:(BOOL)a3;
@end

@implementation THWGalleryExpandedRotationController

- (THWGalleryExpandedRotationController)initWithRep:(id)a3 pagedCanvasController:(id)a4 zoomableCanvasController:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)THWGalleryExpandedRotationController;
  v8 = [(THWGalleryExpandedRotationController *)&v13 init];
  if (v8)
  {
    v8->_rep = (THWGalleryRep *)a3;
    v8->_pagedCanvasController = (THWPagedCanvasController *)a4;
    v8->_zoomableCanvasController = (THWZoomableCanvasController *)a5;
    if (a5)
    {
      [a5 contentOffsetForAnchor:0.5, 0.5];
      v8->_contentCenterOffset.x = v9;
      v8->_contentCenterOffset.y = v10;
      objc_msgSend(objc_msgSend(a5, "interactiveCanvasController"), "viewScale");
    }
    else
    {
      v8->_contentCenterOffset = CGPointZero;
      double v11 = 1.0;
    }
    v8->_targetViewScale = v11;
    v8->_scale = 1.0;
    v8->_translate = CGPointZero;
    v8->_pageIndex = [(THWPagedCanvasController *)v8->_pagedCanvasController pageIndex];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWGalleryExpandedRotationController;
  [(THWGalleryExpandedRotationController *)&v3 dealloc];
}

- (void)p_updateOtherItemLayers:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THWGalleryRep *)self->_rep currentItem];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [[self->_rep info:0] items];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      CGFloat v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) != v5) {
          [self->_rep p_layerForItem:v3].setHidden:v3);
        }
        CGFloat v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (int)autoRotationMode
{
  return 3;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  return self->_scale;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x = self->_translate.x;
  double y = self->_translate.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  -[THWGalleryExpandedRotationController p_updateOtherItemLayers:](self, "p_updateOtherItemLayers:", 1, a3.width, a3.height, a4.width, a4.height);
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_pagedCanvasController, "interactiveCanvasController"), "layerHost"), "canvasView"), "setClipsToBounds:", 0);
  [(THScrollView *)[(THWPagedCanvasController *)self->_pagedCanvasController scrollView] setClipsToBounds:0];
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWZoomableCanvasController interactiveCanvasController](self->_zoomableCanvasController, "interactiveCanvasController"), "layerHost"), "canvasView"), "setClipsToBounds:", 0);
  id v5 = [(THWZoomableCanvasController *)self->_zoomableCanvasController scrollView];

  [(TSKScrollView *)v5 setClipsToBounds:0];
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  -[THWGalleryExpandedRotationController p_layoutWithSize:](self, "p_layoutWithSize:", a3.width, a3.height);
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_pagedCanvasController, "interactiveCanvasController"), "layerHost"), "canvasView"), "setClipsToBounds:", 1);
  [(THScrollView *)[(THWPagedCanvasController *)self->_pagedCanvasController scrollView] setClipsToBounds:1];
  objc_msgSend(objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWZoomableCanvasController interactiveCanvasController](self->_zoomableCanvasController, "interactiveCanvasController"), "layerHost"), "canvasView"), "layer"), "setMasksToBounds:", 1);
  id v4 = [(TSKScrollView *)[(THWZoomableCanvasController *)self->_zoomableCanvasController scrollView] layer];

  [v4 setMasksToBounds:1];
}

- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5
{
  CGFloat height = a4.height;
  double width = a4.width;
  CGFloat v7 = a3.height;
  CGFloat v8 = a3.width;
  [(THWPagedCanvasController *)[(THWGalleryRep *)self->_rep thumbnailTrackCanvasController] invalidateLayoutsAndFrames];
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)[(THWGalleryRep *)self->_rep thumbnailTrackCanvasController] interactiveCanvasController] layoutIfNeeded];
  id v10 = [(THWGalleryRep *)self->_rep currentItem];
  if (v10)
  {
    double v28 = height;
    objc_msgSend(objc_msgSend(v10, "imageInfo"), "naturalSize");
    zoomableCanvasController = self->_zoomableCanvasController;
    if (zoomableCanvasController)
    {
      unsigned int v12 = ![(THWZoomableCanvasController *)self->_zoomableCanvasController isZoomedOut];
      [(TSDInteractiveCanvasController *)[(THWZoomableCanvasController *)zoomableCanvasController interactiveCanvasController] viewScale];
      double v14 = v13;
      TSDMultiplySizeScalar();
      double v16 = v15;
      double v17 = v8;
      double v18 = v7;
      double v20 = v19;
    }
    else
    {
      TSDShrinkSizeToFitInSize();
      double v16 = v21;
      double v17 = v8;
      double v18 = v7;
      double v20 = v22;
      unsigned int v12 = 0;
      double v14 = 1.0;
    }
    TSDShrinkSizeToFitInSize();
    BOOL v24 = v16 > width;
    if (v20 > v28) {
      BOOL v24 = 1;
    }
    if ((v12 & v24) != 0) {
      double v23 = v16;
    }
    double v25 = v23 / v16;
    self->_targetViewScale = v14 * v25;
    self->_scale = v25;
    -[THWZoomableCanvasController clampedUnscaledContentOffset:anchor:viewScale:scrollViewBoundsSize:](zoomableCanvasController, "clampedUnscaledContentOffset:anchor:viewScale:scrollViewBoundsSize:", self->_contentCenterOffset.x, self->_contentCenterOffset.y, 0.5, 0.5, v14, v17, v18);
    -[THWZoomableCanvasController clampedUnscaledContentOffset:anchor:viewScale:scrollViewBoundsSize:](zoomableCanvasController, "clampedUnscaledContentOffset:anchor:viewScale:scrollViewBoundsSize:", self->_contentCenterOffset.x, self->_contentCenterOffset.y, 0.5, 0.5, v14 * self->_scale, width, v28);
    TSDSubtractPoints();
    TSDMultiplyPointScalar();
    self->_translate.double x = v26;
    self->_translate.double y = v27;
  }
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  zoomableCanvasController = self->_zoomableCanvasController;
  if (!zoomableCanvasController
    || [(THWZoomableCanvasController *)zoomableCanvasController isZoomedOut])
  {
    id v8 = [(THWGalleryRep *)self->_rep currentItem];
    if (v8)
    {
      objc_msgSend(objc_msgSend(v8, "imageInfo"), "naturalSize");
      double v10 = width / v9;
      double v12 = height / v11;
      if (v12 < v10) {
        double v10 = v12;
      }
      self->_targetViewScale = fmin(v10, 1.0);
    }
  }
}

- (void)expandedDidTransitionToSize:(CGSize)a3
{
  -[THWGalleryExpandedRotationController p_layoutWithSize:](self, "p_layoutWithSize:", a3.width, a3.height);
  [(THWPagedCanvasController *)[(THWGalleryRep *)self->_rep thumbnailTrackCanvasController] invalidateLayoutsAndFrames];
  id v4 = [(THWPagedCanvasController *)[(THWGalleryRep *)self->_rep thumbnailTrackCanvasController] interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v4 layoutIfNeeded];
}

- (void)p_layoutWithSize:(CGSize)a3
{
  id v4 = [(THWGalleryRep *)self->_rep layout];
  [v4 invalidateFrame];
  [v4 invalidateChildren];
  [self->_rep.interactiveCanvasController layoutIfNeeded];
  [(THWPagedCanvasController *)self->_pagedCanvasController setPageIndex:self->_pageIndex animated:0];
  [(THWPagedCanvasController *)self->_pagedCanvasController invalidateLayoutsAndFrames];
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_pagedCanvasController interactiveCanvasController] layoutIfNeeded];
  zoomableCanvasController = self->_zoomableCanvasController;
  id v6 = [(THWGalleryRep *)self->_rep currentItem];
  if (zoomableCanvasController)
  {
    [(THWGalleryRep *)self->_rep p_updateMinMaxViewScaleForItem:v6 forceMinScale:0];
    -[THWZoomableCanvasController setViewScale:contentOffset:anchor:](self->_zoomableCanvasController, "setViewScale:contentOffset:anchor:", self->_targetViewScale, self->_contentCenterOffset.x, self->_contentCenterOffset.y, 0.5, 0.5);
  }
  [(THWGalleryRep *)self->_rep p_resetViewScaleForItemsExcept:v6];

  [(THWGalleryExpandedRotationController *)self p_updateOtherItemLayers:0];
}

- (THWGalleryRep)rep
{
  return self->_rep;
}

- (CGPoint)contentCenterOffset
{
  double x = self->_contentCenterOffset.x;
  double y = self->_contentCenterOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)targetViewScale
{
  return self->_targetViewScale;
}

- (double)scale
{
  return self->_scale;
}

- (CGPoint)translate
{
  double x = self->_translate.x;
  double y = self->_translate.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (THWPagedCanvasController)pagedCanvasController
{
  return self->_pagedCanvasController;
}

- (THWZoomableCanvasController)zoomableCanvasController
{
  return self->_zoomableCanvasController;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

@end