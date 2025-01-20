@interface _UIZoomTransitionSpec
+ (id)settingsControllerModule;
- (CATransform3D)recededContentTransformFor:(SEL)a3;
- (CGSize)platterShadowOffset;
- (_TtC5UIKit21_UIZoomTransitionSpec)initWithDefaultValues;
- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)cancelInteractive;
- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomIn;
- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomInShowcase;
- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomOut;
- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomOutInteractive;
- (double)dimmingOpacity;
- (double)fallbackSourceViewWidth;
- (double)platterShadowRadius;
- (double)platterShadowXOffset;
- (double)platterShadowYOffset;
- (double)recededBackgroundMinScale;
- (double)recededBackgroundScaleDownPoints;
- (float)platterShadowOpacity;
- (void)setCancelInteractive:(id)a3;
- (void)setDefaultValues;
- (void)setDimmingOpacity:(double)a3;
- (void)setFallbackSourceViewWidth:(double)a3;
- (void)setPlatterShadowOpacity:(float)a3;
- (void)setPlatterShadowRadius:(double)a3;
- (void)setPlatterShadowXOffset:(double)a3;
- (void)setPlatterShadowYOffset:(double)a3;
- (void)setRecededBackgroundMinScale:(double)a3;
- (void)setRecededBackgroundScaleDownPoints:(double)a3;
- (void)setZoomIn:(id)a3;
- (void)setZoomInShowcase:(id)a3;
- (void)setZoomOut:(id)a3;
- (void)setZoomOutInteractive:(id)a3;
@end

@implementation _UIZoomTransitionSpec

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomIn
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomIn));
}

- (void)setZoomIn:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomIn);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomIn) = (Class)a3;
  id v3 = a3;
}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomInShowcase
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomInShowcase));
}

- (void)setZoomInShowcase:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomInShowcase);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomInShowcase) = (Class)a3;
  id v3 = a3;
}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomOut
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOut));
}

- (void)setZoomOut:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOut);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOut) = (Class)a3;
  id v3 = a3;
}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomOutInteractive
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOutInteractive));
}

- (void)setZoomOutInteractive:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOutInteractive);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOutInteractive) = (Class)a3;
  id v3 = a3;
}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)cancelInteractive
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_cancelInteractive));
}

- (void)setCancelInteractive:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_cancelInteractive);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_cancelInteractive) = (Class)a3;
  id v3 = a3;
}

- (CGSize)platterShadowOffset
{
  double v2 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowXOffset);
  double v3 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowYOffset);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CATransform3D)recededContentTransformFor:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundScaleDownPoints);
  double v10 = *(double *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundMinScale);
  v11 = self;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v12 = CGRectGetWidth(v24) - v9;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v13 = v12 / CGRectGetWidth(v25);
  if (v13 <= v10) {
    double v13 = v10;
  }
  CATransform3DMakeScale(&v23, v13, v13, 1.0);
  long long v21 = *(_OWORD *)&v23.m13;
  long long v22 = *(_OWORD *)&v23.m11;
  long long v19 = *(_OWORD *)&v23.m23;
  long long v20 = *(_OWORD *)&v23.m21;
  long long v17 = *(_OWORD *)&v23.m33;
  long long v18 = *(_OWORD *)&v23.m31;
  long long v15 = *(_OWORD *)&v23.m43;
  long long v16 = *(_OWORD *)&v23.m41;

  *(_OWORD *)&retstr->m11 = v22;
  *(_OWORD *)&retstr->m13 = v21;
  *(_OWORD *)&retstr->m21 = v20;
  *(_OWORD *)&retstr->m23 = v19;
  *(_OWORD *)&retstr->m31 = v18;
  *(_OWORD *)&retstr->m33 = v17;
  *(_OWORD *)&retstr->m41 = v16;
  *(_OWORD *)&retstr->m43 = v15;
  return result;
}

- (double)recededBackgroundScaleDownPoints
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundScaleDownPoints);
}

- (void)setRecededBackgroundScaleDownPoints:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundScaleDownPoints) = a3;
}

- (double)recededBackgroundMinScale
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundMinScale);
}

- (void)setRecededBackgroundMinScale:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundMinScale) = a3;
}

- (double)dimmingOpacity
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_dimmingOpacity);
}

- (void)setDimmingOpacity:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_dimmingOpacity) = a3;
}

- (double)fallbackSourceViewWidth
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_fallbackSourceViewWidth);
}

- (void)setFallbackSourceViewWidth:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_fallbackSourceViewWidth) = a3;
}

- (float)platterShadowOpacity
{
  return *(float *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowOpacity);
}

- (void)setPlatterShadowOpacity:(float)a3
{
  *(float *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowOpacity) = a3;
}

- (double)platterShadowRadius
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowRadius);
}

- (void)setPlatterShadowRadius:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowRadius) = a3;
}

- (double)platterShadowXOffset
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowXOffset);
}

- (void)setPlatterShadowXOffset:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowXOffset) = a3;
}

- (double)platterShadowYOffset
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowYOffset);
}

- (void)setPlatterShadowYOffset:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowYOffset) = a3;
}

- (void)setDefaultValues
{
  double v2 = self;
  sub_1859F0E78();
}

+ (id)settingsControllerModule
{
  sub_1859F1CC8();
  return v2;
}

- (_TtC5UIKit21_UIZoomTransitionSpec)initWithDefaultValues
{
  return (_TtC5UIKit21_UIZoomTransitionSpec *)sub_1859F1470();
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_cancelInteractive);
}

@end