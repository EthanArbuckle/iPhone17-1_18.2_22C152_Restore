@interface CRLMediaRep
+ (id)CRLSpatialLabelColor;
- (BOOL)i_shouldRenderStroke:(id)a3;
- (BOOL)replacingInterfaceAllowsMultipleSelection;
- (BOOL)shouldAllowReplacementFromDrop;
- (BOOL)shouldAllowReplacementFromPaste;
- (BOOL)shouldDisplayAsSpatial;
- (BOOL)shouldShowMediaReplaceUI;
- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3;
- (CRLCanvasRenderable)spatialGlyphRenderable;
- (CRLMediaLayout)mediaLayout;
- (id)additionalRenderablesOverRenderable;
- (int64_t)preferredReplacingInterfaceKind;
- (int64_t)supportedMediaTypes;
- (void)documentModeDidChange;
- (void)handleFadeInForZoom;
- (void)handleFadeOutForZoom;
- (void)updateSpatialLabel;
@end

@implementation CRLMediaRep

- (CRLMediaLayout)mediaLayout
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self layout];
  v5 = sub_1002469D0(v3, v4);

  return (CRLMediaLayout *)v5;
}

- (BOOL)shouldAllowReplacementFromDrop
{
  return 1;
}

- (BOOL)shouldAllowReplacementFromPaste
{
  return 0;
}

- (int64_t)supportedMediaTypes
{
  return 3;
}

- (int64_t)preferredReplacingInterfaceKind
{
  return 0;
}

- (BOOL)replacingInterfaceAllowsMultipleSelection
{
  return 0;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (CRLCanvasRenderable)spatialGlyphRenderable
{
  mGlyphRenderable = self->mGlyphRenderable;
  if (!mGlyphRenderable)
  {
    v4 = +[CRLCanvasRenderable renderable];
    v5 = self->mGlyphRenderable;
    self->mGlyphRenderable = v4;

    v6 = +[UIImage crl_imageNamed:@"spatial.cube" withPointSize:25.0];
    v7 = +[CRLImage imageWithUIImage:v6];

    v8 = +[CRLMediaRep CRLSpatialLabelColor];
    v9 = [v7 compositedImageWithColor:v8 alpha:20 blendMode:1.0];

    -[CRLCanvasRenderable setContents:](self->mGlyphRenderable, "setContents:", [v9 CGImage]);
    [(CRLCanvasRenderable *)self->mGlyphRenderable setOpacity:0.0];
    -[CRLCanvasRenderable setAnchorPoint:](self->mGlyphRenderable, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);

    mGlyphRenderable = self->mGlyphRenderable;
  }

  return mGlyphRenderable;
}

- (BOOL)shouldDisplayAsSpatial
{
  v2 = [(CRLMediaRep *)self mediaLayout];
  uint64_t v3 = [v2 mediaItem];
  unsigned __int8 v4 = [v3 isSpatial];

  return v4;
}

- (void)updateSpatialLabel
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (self->mIsZooming || ![(CRLMediaRep *)self shouldDisplayAsSpatial])
  {
    v22 = [(CRLMediaRep *)self spatialGlyphRenderable];
    [v22 setOpacity:0.0];
  }
  else
  {
    uint64_t v3 = [(CRLCanvasRep *)self canvas];
    [v3 viewScale];
    double v5 = v4;

    v6 = [(CRLCanvasRep *)self canvas];
    [(CRLCanvasRep *)self naturalBounds];
    [v6 convertUnscaledToBoundsRect:];
    double v8 = v7;

    if (v8 >= 85.0) {
      float v9 = 1.0;
    }
    else {
      float v9 = 0.0;
    }
    v10 = [(CRLMediaRep *)self spatialGlyphRenderable];
    *(float *)&double v11 = v9;
    [v10 setOpacity:v11];

    v12 = [(CRLMediaRep *)self spatialGlyphRenderable];
    [v12 setBounds:0.0, 0.0, 25.0, 25.0];

    if (v8 >= 140.0) {
      double v13 = 16.0;
    }
    else {
      double v13 = 8.0;
    }
    int v14 = sub_1003E86EC();
    [(CRLCanvasRep *)self naturalBounds];
    if (v14)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v15);
      [(CRLCanvasRep *)self naturalBounds];
      double MinY = CGRectGetMinY(v42);
      double v21 = MaxX - v13;
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v15);
      [(CRLCanvasRep *)self naturalBounds];
      double MinY = CGRectGetMinY(v43);
      double v21 = v13 + MinX;
    }
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", v21, v13 + MinY);
    double v26 = sub_1000646A4(v24, v25, v5);
    double v28 = v27;
    if (sub_1003E86EC()) {
      double v26 = v26 + -25.0;
    }
    v29 = [(CRLCanvasRep *)self parentRep];

    if (v29)
    {
      v30 = [(CRLCanvasRep *)self parentRep];
      [v30 layerFrameInScaledCanvas];
      double v26 = sub_100064680(v26, v28, v31);
      double v28 = v32;
    }
    v33 = [(CRLMediaRep *)self spatialGlyphRenderable];
    [v33 setPosition:v26, v28];

    v34 = [(CRLCanvasRep *)self layout];
    v35 = [v34 geometryInRoot];
    v36 = v35;
    if (v35) {
      [v35 transform];
    }
    else {
      memset(v41, 0, sizeof(v41));
    }
    double v37 = sub_10007F7C8((double *)v41);

    CGAffineTransformMakeRotation(&v40, v37);
    v22 = [(CRLMediaRep *)self spatialGlyphRenderable];
    v38 = [v22 layer];
    CGAffineTransform v39 = v40;
    [v38 setAffineTransform:&v39];
  }
  +[CATransaction commit];
}

- (id)additionalRenderablesOverRenderable
{
  v10.receiver = self;
  v10.super_class = (Class)CRLMediaRep;
  uint64_t v3 = [(CRLCanvasRep *)&v10 additionalRenderablesOverRenderable];
  double v4 = +[NSMutableArray arrayWithArray:v3];

  double v5 = [(CRLMediaRep *)self mediaLayout];
  v6 = [v5 mediaItem];
  unsigned int v7 = [v6 isSpatial];

  if (v7)
  {
    double v8 = [(CRLMediaRep *)self spatialGlyphRenderable];
    [v4 addObject:v8];
  }

  return v4;
}

+ (id)CRLSpatialLabelColor
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  float v9 = sub_10030384C;
  objc_super v10 = sub_10030385C;
  id v11 = 0;
  v2 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100303864;
  v5[3] = &unk_1014D3DB0;
  v5[4] = &v6;
  +[UITraitCollection crl_withTraitCollectionAsCurrent:v2 performBlock:v5];
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)handleFadeOutForZoom
{
  self->mIsZooming = 1;
  [(CRLMediaRep *)self updateSpatialLabel];
}

- (void)handleFadeInForZoom
{
  self->mIsZooming = 0;
  [(CRLMediaRep *)self updateSpatialLabel];
}

- (void)documentModeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLMediaRep;
  [(CRLCanvasRep *)&v3 documentModeDidChange];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)i_shouldRenderStroke:(id)a3
{
  objc_super v3 = (NSNull *)a3;
  double v4 = +[NSNull null];
  unsigned __int8 v5 = 0;
  if (v3 && v4 != v3) {
    unsigned __int8 v5 = [(NSNull *)v3 shouldRender];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end