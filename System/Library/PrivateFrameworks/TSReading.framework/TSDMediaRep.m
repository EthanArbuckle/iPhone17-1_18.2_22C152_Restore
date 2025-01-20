@interface TSDMediaRep
- (BOOL)canResetMediaSize;
- (BOOL)i_shouldRenderStroke:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)replaceButtonContainsPoint:(CGPoint)a3;
- (BOOL)shouldCreateKnobs;
- (BOOL)shouldShowMediaReplaceUI;
- (CGPoint)p_scaledPositionOfImageReplaceKnob;
- (CGPoint)positionOfHyperlinkKnob;
- (CGSize)p_replaceButtonSize;
- (TSDMediaInfo)mediaInfo;
- (TSDMediaLayout)mediaLayout;
- (id)additionalLayersOverLayer;
- (id)currentReplaceButtonHighlightedImage;
- (id)currentReplaceButtonImage;
- (id)overlayLayers;
- (id)p_tapToReplaceLayer;
- (void)addKnobsToArray:(id)a3;
- (void)dealloc;
- (void)didEndZooming;
- (void)i_updateFrameRep;
- (void)p_addLayerForReplaceButtonToArray:(id)a3;
- (void)p_updateTapToReplaceLayerPosition;
- (void)processChangedProperty:(int)a3;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)willBeginZooming;
@end

@implementation TSDMediaRep

- (void)dealloc
{
  [*(id *)&self->mIsZooming setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)TSDMediaRep;
  [(TSDStyledRep *)&v3 dealloc];
}

- (TSDMediaInfo)mediaInfo
{
  objc_opt_class();
  [(TSDRep *)self info];

  return (TSDMediaInfo *)TSUDynamicCast();
}

- (TSDMediaLayout)mediaLayout
{
  objc_opt_class();
  [(TSDRep *)self layout];

  return (TSDMediaLayout *)TSUDynamicCast();
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMediaRep;
  -[TSDStyledRep processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 527) {
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] invalidateLayers];
  }
}

- (void)willBeginZooming
{
  *((unsigned char *)&self->super.mFlags + 4) = 1;
  if ([(TSDMediaRep *)self shouldShowMediaReplaceUI])
  {
    objc_super v3 = [(TSDRep *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v3 layoutInvalidated];
  }
}

- (void)didEndZooming
{
  *((unsigned char *)&self->super.mFlags + 4) = 0;
  if ([(TSDMediaRep *)self shouldShowMediaReplaceUI])
  {
    objc_super v3 = [(TSDRep *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v3 layoutInvalidated];
  }
}

- (id)overlayLayers
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMediaRep;
  objc_super v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDRep overlayLayers](&v5, sel_overlayLayers));
  if ([(TSDRep *)self isSelected]
    && [(TSDMediaRep *)self shouldShowMediaReplaceUI])
  {
    [(TSDMediaRep *)self p_addLayerForReplaceButtonToArray:v3];
  }
  return v3;
}

- (id)additionalLayersOverLayer
{
  objc_super v3 = [(TSDRep *)self interactiveCanvasController];
  v6.receiver = self;
  v6.super_class = (Class)TSDMediaRep;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDRep additionalLayersOverLayer](&v6, sel_additionalLayersOverLayer));
  if (!*((unsigned char *)&self->super.mFlags + 4)
    && ![(TSDInteractiveCanvasController *)v3 inReadMode]
    && [(TSDMediaRep *)self shouldShowMediaReplaceUI]
    && ![(TSDRep *)self isSelected])
  {
    if (!v4) {
      v4 = (void *)[MEMORY[0x263EFF980] array];
    }
    [(TSDMediaRep *)self p_addLayerForReplaceButtonToArray:v4];
  }
  return v4;
}

- (BOOL)canResetMediaSize
{
  return ![(TSDDrawableInfo *)[(TSDMediaRep *)self mediaInfo] isLocked];
}

- (BOOL)shouldCreateKnobs
{
  v4.receiver = self;
  v4.super_class = (Class)TSDMediaRep;
  return [(TSDRep *)&v4 shouldCreateKnobs]
      || [(TSDMediaRep *)self shouldShowMediaReplaceUI];
}

- (void)addKnobsToArray:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMediaRep;
  [(TSDRep *)&v3 addKnobsToArray:a3];
}

- (void)updatePositionsOfKnobs:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMediaRep;
  [(TSDRep *)&v3 updatePositionsOfKnobs:a3];
}

- (CGPoint)positionOfHyperlinkKnob
{
  v12.receiver = self;
  v12.super_class = (Class)TSDMediaRep;
  [(TSDRep *)&v12 positionOfHyperlinkKnob];
  double v4 = v3;
  double v6 = v5;
  if ([(TSDMediaRep *)self shouldShowMediaReplaceUI])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C858], "imageNamed:inBundle:", @"sf-mac_canvas_btn_placeholder-small-N", TSDBundle()), "size");
    double v8 = v7;
    [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
    double v4 = v4 - v8 / v9;
  }
  double v10 = v4;
  double v11 = v6;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)isPlaceholder
{
  v2 = [(TSDMediaRep *)self mediaInfo];

  return [(TSDMediaInfo *)v2 isPlaceholder];
}

- (BOOL)shouldShowMediaReplaceUI
{
  double v3 = [(TSDMediaRep *)self mediaInfo];
  double v4 = [(TSDRep *)self interactiveCanvasController];
  double v5 = [(TSDInteractiveCanvasController *)v4 delegate];
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = [(TSDInteractiveCanvasControllerDelegate *)v5 interactiveCanvasController:v4 imageReplaceBadgeBehaviorForRep:self];
  }
  else {
    uint64_t v6 = 0;
  }
  BOOL v7 = [(TSDMediaInfo *)v3 wasMediaReplaced];
  BOOL v8 = v6 != 2 && v7;
  BOOL v9 = [(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive];
  if (v9)
  {
    BOOL v9 = [(TSDLayout *)[(TSDRep *)self layout] isInTopLevelContainerForEditing];
    if (v9)
    {
      if (![(TSDMediaInfo *)v3 isPlaceholder] || v8)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        BOOL v10 = [(TSDRep *)self isLocked];
        LOBYTE(v9) = 0;
        if (!v10 && v6 != 1)
        {
          [(TSDMediaRep *)self p_replaceButtonSize];
          double v13 = TSDAddSizes(v11, v12, 3.0);
          double v15 = v14;
          v16 = [(TSDRep *)self interactiveCanvasController];
          [(TSDRep *)self boundsForStandardKnobs];
          -[TSDInteractiveCanvasController convertUnscaledToBoundsSize:](v16, "convertUnscaledToBoundsSize:", v17, v18);
          LOBYTE(v9) = v15 <= v20 && v13 <= v19;
        }
      }
    }
  }
  return v9;
}

- (id)currentReplaceButtonImage
{
  v2 = (void *)MEMORY[0x263F7C858];
  uint64_t v3 = TSDBundle();

  return (id)[v2 imageNamed:@"sf-canvas-placeholder" inBundle:v3];
}

- (id)currentReplaceButtonHighlightedImage
{
  v2 = (void *)MEMORY[0x263F7C858];
  uint64_t v3 = TSDBundle();

  return (id)[v2 imageNamed:@"sf-canvas-placeholder-P" inBundle:v3];
}

- (BOOL)replaceButtonContainsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(TSDMediaRep *)self shouldShowMediaReplaceUI];
  if (v6)
  {
    id v7 = [(TSDMediaRep *)self p_tapToReplaceLayer];
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:]([(TSDRep *)self interactiveCanvasController], "convertUnscaledToBoundsPoint:", x, y);
    objc_msgSend(v7, "convertPoint:fromLayer:", -[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), v8, v9);
    double v11 = v10;
    double v13 = v12;
    int v6 = objc_msgSend(v7, "containsPoint:");
    if (v6)
    {
      [(TSDMediaRep *)self p_replaceButtonSize];
      double v15 = v14 * 0.5;
      [v7 bounds];
      double v20 = TSDCenterOfRect(v16, v17, v18, v19);
      LOBYTE(v6) = v15 > TSDDistance(v20, v21, v11, v13);
    }
  }
  return v6;
}

- (id)p_tapToReplaceLayer
{
  id v3 = [(TSDMediaRep *)self currentReplaceButtonImage];
  if (!*(void *)&self->mIsZooming) {
    *(void *)&self->mIsZooming = objc_alloc_init(TSDNoDefaultImplicitActionLayer);
  }
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  objc_msgSend(*(id *)&self->mIsZooming, "setContents:", objc_msgSend(v3, "CGImageForContentsScale:"));
  [v3 size];
  [*(id *)&self->mIsZooming setBounds:TSDRectWithSize()];
  return *(id *)&self->mIsZooming;
}

- (void)p_addLayerForReplaceButtonToArray:(id)a3
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(TSDMediaRep *)self p_updateTapToReplaceLayerPosition];
  objc_msgSend(a3, "addObject:", -[TSDMediaRep p_tapToReplaceLayer](self, "p_tapToReplaceLayer"));
  double v5 = (void *)MEMORY[0x263F158F8];

  [v5 commit];
}

- (CGSize)p_replaceButtonSize
{
  BOOL v3 = [(TSDRep *)self shouldDisplayHyperlinkUI];
  double v5 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v3)
  {
    uint64_t v6 = sTapToReplaceButtonImageSmallSize_0;
    uint64_t v7 = sTapToReplaceButtonImageSmallSize_1;
    if (*(double *)&sTapToReplaceButtonImageSmallSize_0 == v5 && *(double *)&sTapToReplaceButtonImageSmallSize_1 == v4)
    {
      objc_msgSend(-[TSDMediaRep currentReplaceButtonImage](self, "currentReplaceButtonImage", *(double *)&sTapToReplaceButtonImageSmallSize_0, *(double *)&sTapToReplaceButtonImageSmallSize_1, v4), "size");
      sTapToReplaceButtonImageSmallSize_0 = v6;
      sTapToReplaceButtonImageSmallSize_1 = v7;
    }
  }
  else
  {
    uint64_t v6 = sTapToReplaceButtonImageSize_0;
    uint64_t v7 = sTapToReplaceButtonImageSize_1;
    if (*(double *)&sTapToReplaceButtonImageSize_0 == v5 && *(double *)&sTapToReplaceButtonImageSize_1 == v4)
    {
      objc_msgSend(-[TSDMediaRep currentReplaceButtonImage](self, "currentReplaceButtonImage", *(double *)&sTapToReplaceButtonImageSize_0, *(double *)&sTapToReplaceButtonImageSize_1, v4), "size");
      sTapToReplaceButtonImageSize_0 = v6;
      sTapToReplaceButtonImageSize_1 = v7;
    }
  }
  result.height = *(double *)&v7;
  result.width = *(double *)&v6;
  return result;
}

- (CGPoint)p_scaledPositionOfImageReplaceKnob
{
  BOOL v3 = [(TSDRep *)self interactiveCanvasController];
  [(TSDRep *)self boundsForStandardKnobs];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v13 = v12;
  v43.origin.double x = v5;
  v43.origin.double y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  double MaxX = CGRectGetMaxX(v43);
  [(TSDMediaRep *)self p_replaceButtonSize];
  double v16 = -1.0 / v13;
  double v17 = MaxX + -1.0 / v13 * (v15 * 0.5 + 3.0);
  v44.origin.double x = v5;
  v44.origin.double y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  double MaxY = CGRectGetMaxY(v44);
  [(TSDMediaRep *)self p_replaceButtonSize];
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", v17, MaxY + v16 * (v19 * 0.5 + 3.0));
  double v21 = v20;
  double v23 = v22;
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v3, "convertUnscaledToBoundsPoint:");
  double v25 = v24;
  double v27 = v26;
  if ([(TSDRep *)self parentRep])
  {
    -[TSDRep convertNaturalPointFromUnscaledCanvas:]([(TSDRep *)self parentRep], "convertNaturalPointFromUnscaledCanvas:", v21, v23);
    -[TSDRep convertNaturalPointToLayerRelative:]([(TSDRep *)self parentRep], "convertNaturalPointToLayerRelative:", v28, v29);
    double v25 = v30;
    double v27 = v31;
  }
  [(TSDMediaRep *)self p_replaceButtonSize];
  double v32 = TSDRectWithSize();
  double v36 = TSDCenterOfRect(v32, v33, v34, v35);
  TSDSubtractPoints(v25, v27, v36);
  double v37 = TSDRoundedPoint();

  double v39 = TSDAddPoints(v37, v38, v36);
  result.double y = v40;
  result.double x = v39;
  return result;
}

- (void)p_updateTapToReplaceLayerPosition
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  BOOL v3 = [(TSDRep *)self interactiveCanvasController];
  id v4 = [(TSDMediaRep *)self p_tapToReplaceLayer];
  [(TSDMediaRep *)self p_scaledPositionOfImageReplaceKnob];
  objc_msgSend(v4, "setPosition:");
  if ([(TSDAbstractLayout *)[(TSDRep *)self layout] parent]
    && [(TSDRep *)self isSelected])
  {
    CGFloat v5 = [(TSDAbstractLayout *)[(TSDRep *)self layout] parent];
    if (v5)
    {
      [(TSDAbstractLayout *)v5 transformInRoot];
      float64x2_t v6 = v13;
      float64x2_t v7 = v14;
      float64x2_t v8 = v15;
    }
    else
    {
      float64x2_t v8 = 0uLL;
      float64x2_t v14 = 0u;
      float64x2_t v15 = 0u;
      float64x2_t v13 = 0u;
      float64x2_t v6 = 0uLL;
      float64x2_t v7 = 0uLL;
    }
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v3, "convertUnscaledToBoundsPoint:", vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v7, *(double *)(MEMORY[0x263F00148] + 8)), v6, *MEMORY[0x263F00148])), *(_OWORD *)&v13, *(_OWORD *)&v14, *(_OWORD *)&v15);
    double v10 = v9;
    objc_msgSend(-[TSDMediaRep p_tapToReplaceLayer](self, "p_tapToReplaceLayer"), "position");
    objc_msgSend(v4, "setPosition:", TSDAddPoints(v11, v12, v10));
  }
  [MEMORY[0x263F158F8] commit];
}

- (void)i_updateFrameRep
{
  id v3 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if ([(TSDMediaRep *)self i_shouldRenderStroke:v3]
    && [v3 isFrame])
  {
    mFrameMaskLayer = self->mFrameMaskLayer;
    if (!mFrameMaskLayer)
    {
LABEL_6:
      self->mFrameMaskLayer = (CALayer *)[[TSDFrameRep alloc] initWithTSDFrame:v3];
      return;
    }
    uint64_t v5 = [(CALayer *)mFrameMaskLayer frame];
    float64x2_t v6 = self->mFrameMaskLayer;
    if ((id)v5 != v3)
    {

      self->mFrameMaskLayer = 0;
      goto LABEL_6;
    }
    if (!v6) {
      goto LABEL_6;
    }
  }
  else
  {
    float64x2_t v7 = self->mFrameMaskLayer;
    if (v7)
    {

      self->mFrameMaskLayer = 0;
    }
  }
}

- (BOOL)i_shouldRenderStroke:(id)a3
{
  id v5 = (id)[MEMORY[0x263EFF9D0] null];
  LOBYTE(v6) = 0;
  if (a3)
  {
    if (v5 != a3)
    {
      int v6 = [a3 shouldRender];
      if (v6)
      {
        if ([a3 isFrame])
        {
          float64x2_t v7 = [(TSDMediaRep *)self mediaLayout];
          LOBYTE(v6) = [(TSDMediaLayout *)v7 shouldRenderFrameStroke];
        }
        else
        {
          LOBYTE(v6) = 1;
        }
      }
    }
  }
  return v6;
}

@end