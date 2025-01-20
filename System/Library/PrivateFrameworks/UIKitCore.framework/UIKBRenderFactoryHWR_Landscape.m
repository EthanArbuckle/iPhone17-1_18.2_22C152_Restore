@interface UIKBRenderFactoryHWR_Landscape
- (CGPoint)deleteGlyphOffset;
- (CGPoint)spaceKeyTextOffset;
- (UIEdgeInsets)handwritingAreaInsets;
- (UIEdgeInsets)symbolFrameInsets;
- (double)handwritingGradientStartLocation;
- (double)spaceKeyFontSize;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactoryHWR_Landscape

- (double)handwritingGradientStartLocation
{
  return 0.25;
}

- (UIEdgeInsets)handwritingAreaInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)deleteGlyphOffset
{
  double v2 = 0.5;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)spaceKeyTextOffset
{
  double v2 = 0.0;
  double v3 = 1.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 18.0;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2 = 3.0;
  double v3 = 3.0;
  double v4 = 3.0;
  double v5 = 3.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setupLayoutSegments
{
  double v3 = [(UIKBRenderFactory10Key_Round *)self controlKeyTraits];
  id v6 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v3];

  [v6 setKeyStates:3];
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, 0.188, 1.0);
  [(UIKBRenderFactory *)self addLayoutSegment:v6];
  double v4 = [(UIKBRenderFactory10Key_Round *)self activeControlKeyTraits];
  double v5 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v4];

  [v5 setKeyStates:4];
  objc_msgSend(v5, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, 0.188, 1.0);
  [(UIKBRenderFactory *)self addLayoutSegment:v5];
}

- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)UIKBRenderFactoryHWR_Landscape;
  id v7 = a4;
  id v8 = [(UIKBRenderFactory10Key *)&v10 edgesAdjustedForTranslucentGapsForGeometry:a3 key:v7 onKeyplane:a5];
  LODWORD(a3) = objc_msgSend(v7, "displayType", v10.receiver, v10.super_class);

  if (a3 == 12) {
    return 14;
  }
  else {
    return (unint64_t)v8;
  }
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBRenderFactoryHWR_Landscape;
  id v7 = [(UIKBRenderFactoryHWR_Portrait *)&v27 _traitsForKey:v6 onKeyplane:a4];
  if ([v6 displayType] == 12)
  {
    if ([(UIKBRenderFactory10Key_Round *)self useRoundCorner])
    {
      [v7 removeAllRenderEffects];
      id v8 = [v7 geometry];
      [v8 setRoundRectCorners:-1];

      v9 = [v7 geometry];
      [v9 setRoundRectRadius:5.0];

      objc_super v10 = [v7 geometry];
      [v10 paddedFrame];
      double v13 = v12 + -0.5;
      double v15 = v14 + 0.5;
      double v17 = v16 + -0.5;
      double v18 = 1.0;
    }
    else
    {
      objc_super v10 = [v7 geometry];
      [v10 paddedFrame];
      double v13 = v19 + 0.0;
      double v18 = -0.5;
      double v15 = v20 + -0.5;
      double v17 = v21 + 0.0;
    }
    double v22 = v11 + v18;
    v23 = [v7 geometry];
    objc_msgSend(v23, "setPaddedFrame:", v13, v17, v15, v22);
  }
  if ([(UIKBRenderFactory10Key_Round *)self useRoundCorner]
    && [v6 interactionType] == 4)
  {
    v24 = [v7 geometry];
    [v24 setRoundRectCorners:2];

    v25 = [v7 geometry];
    [v25 setRoundRectRadius:5.0];
  }
  return v7;
}

@end