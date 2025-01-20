@interface PLExpandableImageView
+ (double)imageBorderWidth;
- (BOOL)isBeingManipulated;
- (BOOL)isBorderAndAccessoriesVisible;
- (BOOL)isShadowEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showsPlaceholder;
- (CGRect)_snappedExpandedFrame;
- (CGRect)frameOfImage;
- (CGSize)_newSizeFromSize:(CGSize)a3;
- (CGSize)imageSize;
- (NSString)name;
- (PLExpandableImageView)initWithFrame:(CGRect)a3;
- (PLExpandableImageView)initWithFrame:(CGRect)a3 frameStyle:(int)a4;
- (PLExpandableImageView)initWithFrame:(CGRect)a3 frameStyle:(int)a4 withBorder:(BOOL)a5;
- (PLManagedAsset)photo;
- (PLVideoView)videoView;
- (double)imageRotationAngle;
- (double)transitionProgress;
- (float)_borderAlphaForExpansionFraction:(float)a3;
- (float)_currentScale;
- (float)_expandedScale;
- (float)_expansionFraction;
- (float)completeTrackingPinch:(id)a3 toState:(int)a4 duration:(double)a5;
- (float)continueTrackingPinch:(id)a3;
- (id)_contentView;
- (id)image;
- (id)imageView;
- (void)_bounceBack:(id)a3 finished:(id)a4 context:(void *)a5;
- (void)_bounceToPlace:(id)a3 finished:(id)a4 context:(void *)a5;
- (void)_setOriginalSize:(CGSize)a3;
- (void)_updateBorderAndAccessoriesAlpha;
- (void)_updatePinchWidthAndScaleWithLeftPoint:(CGPoint)a3 rightPoint:(CGPoint)a4;
- (void)beginTrackingPinch:(id)a3;
- (void)dealloc;
- (void)finishTransition;
- (void)layoutSubviews;
- (void)renderSnapshotInContext:(CGContext *)a3;
- (void)setBorderAndAccessoriesVisible:(BOOL)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFullSizeImageJPEGData:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 isFullscreen:(BOOL)a4;
- (void)setName:(id)a3;
- (void)setPhoto:(id)a3;
- (void)setShadowEnabled:(BOOL)a3;
- (void)setShowsPlaceholder:(BOOL)a3;
- (void)setSize:(CGSize)a3 angle:(float)a4;
- (void)setTextBadgeString:(id)a3;
- (void)setTransformAndCenterForFrame:(CGRect)a3;
- (void)setTransitionProgress:(double)a3;
- (void)setVideoView:(id)a3;
- (void)stateDidChangeFrom:(int)a3;
@end

@implementation PLExpandableImageView

- (void)setPhoto:(id)a3
{
}

- (PLManagedAsset)photo
{
  return self->_photo;
}

- (void)renderSnapshotInContext:(CGContext *)a3
{
}

- (void)setTextBadgeString:(id)a3
{
}

- (BOOL)isBeingManipulated
{
  unsigned int v2 = [(PLExpandableView *)self state] - 1;
  return v2 < 7 && v2 != 3;
}

- (double)transitionProgress
{
  [(PLImageView *)self->_imageView transitionProgress];
  return result;
}

- (void)setTransitionProgress:(double)a3
{
}

- (BOOL)isShadowEnabled
{
  return [(PLImageView *)self->_imageView isShadowEnabled];
}

- (void)setShadowEnabled:(BOOL)a3
{
}

- (double)imageRotationAngle
{
  return self->_imageRotationAngle;
}

- (void)setVideoView:(id)a3
{
}

- (PLVideoView)videoView
{
  return [(PLImageView *)self->_imageView videoView];
}

- (CGRect)frameOfImage
{
  *(unsigned char *)&self->_exImageFlags &= ~8u;
  [(PLExpandableImageView *)self layoutIfNeeded];
  v3 = (void *)[(PLExpandableImageView *)self superview];
  objc_msgSend(-[PLExpandableImageView imageView](self, "imageView"), "frame");
  objc_msgSend(v3, "convertRect:fromView:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGSize)imageSize
{
  unsigned int v2 = (void *)[(PLImageView *)self->_imageView image];
  [v2 size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)imageView
{
  return self->_imageView;
}

- (void)setShowsPlaceholder:(BOOL)a3
{
}

- (BOOL)showsPlaceholder
{
  return [(PLImageView *)self->_imageView showsPlaceholder];
}

- (NSString)name
{
  return [(PLImageView *)self->_imageView name];
}

- (void)setName:(id)a3
{
}

- (void)setFullSizeImageJPEGData:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5
{
}

- (id)image
{
  return (id)[(PLImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
}

- (void)setImage:(id)a3 isFullscreen:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(PLExpandableView *)self allowsExpansion] || [(PLExpandableView *)self state] != 1)
  {
    char v7 = v4 ? 64 : 0;
    *(unsigned char *)&self->_exImageFlags = *(unsigned char *)&self->_exImageFlags & 0xBF | v7;
    [(PLImageView *)self->_imageView setImage:a3];
    [(PLImageView *)self->_imageView setOpaque:1];
    if (a3)
    {
      *(unsigned char *)&self->_exImageFlags &= ~8u;
      [(PLExpandableImageView *)self layoutSubviews];
    }
  }
}

- (BOOL)isBorderAndAccessoriesVisible
{
  return [(PLImageView *)self->_imageView isBorderAndAccessoriesVisible];
}

- (void)setBorderAndAccessoriesVisible:(BOOL)a3
{
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PLExpandableImageView *)self center];
  if (x != v7 || y != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)PLExpandableImageView;
    -[PLExpandableImageView setCenter:](&v9, sel_setCenter_, x, y);
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLExpandableImageView;
  -[PLExpandableImageView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(unsigned char *)&self->_exImageFlags &= ~8u;
  [(PLExpandableImageView *)self layoutBelowIfNeeded];
  [(PLImageView *)self->_imageView updateFullSizeImageVisibleArea];
}

- (id)_contentView
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
    || self == 0)
  {
    return 0;
  }
  do
  {
    [(PLExpandableImageView *)self superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    self = (PLExpandableImageView *)[(PLExpandableImageView *)self superview];
  }
  while (self);
  return self;
}

- (void)finishTransition
{
  [(PLImageView *)self->_imageView setEdgeAntialiasingEnabled:0];
  v3.receiver = self;
  v3.super_class = (Class)PLExpandableImageView;
  [(PLExpandableView *)&v3 finishTransition];
}

- (void)_bounceToPlace:(id)a3 finished:(id)a4 context:(void *)a5
{
  if (([(PLExpandableView *)self state] & 0xFFFFFFFB) == 2)
  {
    if ([a4 BOOLValue])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __57__PLExpandableImageView__bounceToPlace_finished_context___block_invoke;
      v8[3] = &unk_1E63D2660;
      v8[4] = self;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __57__PLExpandableImageView__bounceToPlace_finished_context___block_invoke_2;
      v7[3] = &unk_1E63D2688;
      v7[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:v7 completion:0.1];
    }
    else
    {
      [(PLExpandableImageView *)self finishTransition];
    }
  }
}

uint64_t __57__PLExpandableImageView__bounceToPlace_finished_context___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _snappedExpandedFrame];
  return objc_msgSend(v1, "setTransformAndCenterForFrame:");
}

uint64_t __57__PLExpandableImageView__bounceToPlace_finished_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishTransition];
}

- (void)_bounceBack:(id)a3 finished:(id)a4 context:(void *)a5
{
  if (([(PLExpandableView *)self state] & 0xFFFFFFFB) == 2)
  {
    if ([a4 BOOLValue])
    {
      [MEMORY[0x1E4F42FF0] beginAnimations:0 context:0];
      [MEMORY[0x1E4F42FF0] setAnimationDuration:0.15];
      [MEMORY[0x1E4F42FF0] setAnimationCurve:2];
      [MEMORY[0x1E4F42FF0] setAnimationDelegate:self];
      [MEMORY[0x1E4F42FF0] setAnimationDidStopSelector:sel__bounceToPlace_finished_context_];
      [(PLExpandableImageView *)self _snappedExpandedFrame];
      double v8 = v7;
      double v10 = v9;
      UIRectGetCenter();
      v15.size.width = v8 * 0.995000005;
      v15.size.height = v10 * 0.995000005;
      v15.origin.double x = v11 - v8 * 0.995000005 * 0.5;
      v15.origin.double y = v12 - v10 * 0.995000005 * 0.5;
      CGRect v16 = CGRectIntegral(v15);
      -[PLExpandableImageView setTransformAndCenterForFrame:](self, "setTransformAndCenterForFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
      v13 = (void *)MEMORY[0x1E4F42FF0];
      [v13 commitAnimations];
    }
    else
    {
      [(PLExpandableImageView *)self finishTransition];
    }
  }
}

- (float)completeTrackingPinch:(id)a3 toState:(int)a4 duration:(double)a5
{
  int v9 = [(PLExpandableView *)self state];
  [(PLExpandableImageView *)self _currentScale];
  float v11 = v10;
  if ((*(unsigned char *)&self->_exImageFlags & 2) == 0) {
    self->super._pinchVelocitdouble y = 0.0;
  }
  [(PLExpandableImageView *)self bounds];
  UIRectGetCenter();
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", [(PLExpandableImageView *)self superview], v12, v13);
  double v15 = v14;
  double v17 = v16;
  __asm { FMOV            V0.2D, #0.5 }
  self->_anchorPoint = _Q0;
  objc_msgSend((id)-[PLExpandableImageView layer](self, "layer"), "setAnchorPoint:", self->_anchorPoint.x, self->_anchorPoint.y);
  -[PLExpandableImageView setCenter:](self, "setCenter:", v15, v17);
  double v22 = 0.0;
  if (a4)
  {
    if (a4 == 4)
    {
      if (v9 == 6 && (double v22 = self->super._pinchVelocity, v22 > 0.0))
      {
        int v23 = 1;
        double v24 = 0.2;
      }
      else
      {
        [(PLExpandableImageView *)self _expandedScale];
        float v41 = v40;
        [(PLExpandableImageView *)self _expansionFraction];
        pinchVelocitdouble y = self->super._pinchVelocity;
        if (pinchVelocity <= 0.0)
        {
          int v23 = 0;
          double v24 = 0.3;
        }
        else
        {
          float v44 = v41 + (1.0 - v42 * 0.5) * 0.5;
          double v24 = (self->_pinchWidth * v44 / v11 - self->_pinchWidth) / pinchVelocity;
          int v23 = 0;
          if (v24 > 0.3) {
            double v24 = 0.3;
          }
        }
      }
      [(PLExpandableImageView *)self _snappedExpandedFrame];
      double v56 = v55;
      double v58 = v57;
      double width = v59;
      double height = v61;
      UIRectGetCenter();
      if (v24 <= 0.0 || (*((unsigned char *)&self->super._expandFlags + 1) & 1) != 0)
      {
        [(PLExpandableImageView *)self performSelector:sel_finishTransition withObject:0 afterDelay:0.0];
      }
      else
      {
        double v65 = v63;
        double v66 = v64;
        if (a3)
        {
          [(PLExpandableImageView *)self _expansionFraction];
          float v68 = (float)(1.0 - v67) * 0.05 + 1.0;
          if (v24 >= 0.1 && ([(PLExpandableImageView *)self center], UIDistanceBetweenPoints(), v69 >= 50.0))
          {
            [(PLExpandableImageView *)self center];
            double width = operator||(v56, v58, width, height, v68, v72, v73);
            double height = v74;
            int v70 = 1;
          }
          else
          {
            v79.size.double width = width * v68;
            v79.size.double height = height * v68;
            v79.origin.double x = v65 - v79.size.width * 0.5;
            v79.origin.double y = v66 - v79.size.height * 0.5;
            CGRect v80 = CGRectIntegral(v79);
            double width = v80.size.width;
            double height = v80.size.height;
            int v70 = 0;
          }
          v75 = &selRef__bounceToPlace_finished_context_;
          if (!v23) {
            v75 = &selRef__bounceBack_finished_context_;
          }
          v71 = *v75;
        }
        else
        {
          int v70 = 0;
          v71 = sel_finishTransition;
        }
        [MEMORY[0x1E4F42FF0] beginAnimations:0 context:0];
        [MEMORY[0x1E4F42FF0] setAnimationDuration:v24];
        [MEMORY[0x1E4F42FF0] setAnimationCurve:2];
        if ((v70 & 1) == 0)
        {
          [MEMORY[0x1E4F42FF0] setAnimationDelegate:self];
          [MEMORY[0x1E4F42FF0] setAnimationDidStopSelector:v71];
        }
        -[PLExpandableImageView _newSizeFromSize:](self, "_newSizeFromSize:", width, height);
        -[PLExpandableImageView setSize:angle:](self, "setSize:angle:");
        imageView = self->_imageView;
        LODWORD(v77) = 1.0;
        [(PLExpandableImageView *)self _borderAlphaForExpansionFraction:v77];
        -[PLImageView setBorderAndAccessoriesAlpha:](imageView, "setBorderAndAccessoriesAlpha:");
        if (v70)
        {
          [MEMORY[0x1E4F42FF0] beginAnimations:0 context:0];
          [MEMORY[0x1E4F42FF0] setAnimationDuration:v24 * 1.25];
          [MEMORY[0x1E4F42FF0] setAnimationDelay:v24 * 0.1];
          [MEMORY[0x1E4F42FF0] setAnimationDelegate:self];
          [MEMORY[0x1E4F42FF0] setAnimationDidStopSelector:v71];
          -[PLExpandableImageView setCenter:](self, "setCenter:", v65, v66);
          [MEMORY[0x1E4F42FF0] commitAnimations];
        }
        else
        {
          -[PLExpandableImageView setCenter:](self, "setCenter:", v65, v66);
        }
        [MEMORY[0x1E4F42FF0] commitAnimations];
      }
      LODWORD(v22) = 1.0;
    }
  }
  else
  {
    [(PLExpandableView *)self contractedFrame];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v33 = self->_originalAngle - self->_pinchAngle;
    if (v33 < 0.0) {
      double v33 = -v33;
    }
    double v34 = v33 / 3.14159265 * 0.7;
    [(PLExpandableImageView *)self center];
    UIRectGetCenter();
    UIDistanceBetweenPoints();
    double v36 = v35 * 0.0009765625;
    if (self->super._pinchVelocity >= 0.0)
    {
      double v39 = 0.2;
      if (v9 != 3 || a5 >= 0.2) {
        double v39 = a5;
      }
    }
    else
    {
      double pinchWidth = self->_pinchWidth;
      [(PLExpandableImageView *)self _currentScale];
      double v39 = (pinchWidth / v38 - self->_pinchWidth) / self->super._pinchVelocity;
    }
    if (v39 < v34) {
      double v39 = v34;
    }
    if (v39 < v36) {
      double v39 = v36;
    }
    if (v39 <= 0.3) {
      double v46 = v39;
    }
    else {
      double v46 = 0.3;
    }
    [(PLExpandableImageView *)self _expansionFraction];
    float v48 = v47;
    [(PLImageView *)self->_imageView setBorderAndAccessoriesVisible:1];
    v49 = self->_imageView;
    *(float *)&double v50 = v48;
    [(PLExpandableImageView *)self _borderAlphaForExpansionFraction:v50];
    -[PLImageView setBorderAndAccessoriesAlpha:](v49, "setBorderAndAccessoriesAlpha:");
    if ((*((unsigned char *)&self->super._expandFlags + 1) & 1) == 0)
    {
      [MEMORY[0x1E4F42FF0] beginAnimations:@"collapseSingleImage" context:0];
      [MEMORY[0x1E4F42FF0] setAnimationDuration:v46];
      [MEMORY[0x1E4F42FF0] setAnimationDelegate:self];
      [MEMORY[0x1E4F42FF0] setAnimationDidStopSelector:sel_finishTransition];
    }
    -[PLExpandableImageView setTransformAndCenterForFrame:](self, "setTransformAndCenterForFrame:", v26, v28, v30, v32);
    if (v48 >= 0.5)
    {
      if ((*((unsigned char *)&self->super._expandFlags + 1) & 1) == 0)
      {
        double v52 = (float)((float)(v48 + -0.5) / v48);
        float v53 = (1.0 - v52) * v46;
        float v54 = v46 * v52;
        [MEMORY[0x1E4F42FF0] beginAnimations:@"fadeInBorderForCollapse" context:0];
        [MEMORY[0x1E4F42FF0] setAnimationDuration:v53];
        [MEMORY[0x1E4F42FF0] setAnimationDelay:v54];
      }
      LODWORD(v51) = 1.0;
      [(PLImageView *)self->_imageView setBorderAndAccessoriesAlpha:1 forced:v51];
      [(PLVideoView *)[(PLImageView *)self->_imageView videoView] setAlpha:0.0];
      if ((*((unsigned char *)&self->super._expandFlags + 1) & 1) == 0) {
        [MEMORY[0x1E4F42FF0] commitAnimations];
      }
    }
    else
    {
      LODWORD(v51) = 1.0;
      [(PLImageView *)self->_imageView setBorderAndAccessoriesAlpha:1 forced:v51];
      [(PLVideoView *)[(PLImageView *)self->_imageView videoView] setAlpha:0.0];
    }
    if (*((unsigned char *)&self->super._expandFlags + 1)) {
      [(PLExpandableImageView *)self finishTransition];
    }
    else {
      [MEMORY[0x1E4F42FF0] commitAnimations];
    }
    LODWORD(v22) = 0;
  }
  *(unsigned char *)&self->_exImageFlags &= ~2u;
  return *(float *)&v22;
}

- (void)setTransformAndCenterForFrame:(CGRect)a3
{
  -[PLExpandableImageView _newSizeFromSize:](self, "_newSizeFromSize:", a3.size.width, a3.size.height);
  -[PLExpandableImageView setSize:angle:](self, "setSize:angle:");
  UIRectGetCenter();
  -[PLExpandableImageView setCenter:](self, "setCenter:");
}

- (CGSize)_newSizeFromSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(PLExpandableImageView *)self image];
  if (v5)
  {
    [v5 size];
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  float v8 = v6 / v7;
  float v9 = width / height;
  double v10 = v8;
  if (v8 <= v9) {
    double width = rint(height * v10);
  }
  else {
    double height = rint(width / v10);
  }
  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (float)continueTrackingPinch:(id)a3
{
  id v5 = [(PLExpandableImageView *)self _contentView];
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", v5, self->super._leftTouchLocation.x, self->super._leftTouchLocation.y);
  double v7 = v6;
  double v9 = v8;
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", v5, self->super._rightTouchLocation.x, self->super._rightTouchLocation.y);
  double v11 = v10;
  double v12 = (v7 + v10) * 0.5;
  double v14 = (v9 + v13) * 0.5;
  double v50 = v13;
  double v51 = v9;
  -[PLExpandableImageView _updatePinchWidthAndScaleWithLeftPoint:rightPoint:](self, "_updatePinchWidthAndScaleWithLeftPoint:rightPoint:", v7, v9, v10);
  char exImageFlags = (char)self->_exImageFlags;
  if ((exImageFlags & 0x20) == 0)
  {
    *(unsigned char *)&self->_char exImageFlags = exImageFlags | 0x20;
    [(PLExpandableImageView *)self center];
    self->_centerOffset.double width = v16 - v12;
    self->_centerOffset.double height = v17 - v14;
    char exImageFlags = (char)self->_exImageFlags;
  }
  if ((exImageFlags & 4) != 0)
  {
    [(PLImageView *)self->_imageView bounds];
    double v19 = v18;
    double v21 = v20;
    objc_msgSend((id)-[PLExpandableImageView superview](self, "superview"), "convertRect:fromView:", 0, self->_initialExpandingFrame.origin.x, self->_initialExpandingFrame.origin.y, self->_initialExpandingFrame.size.width, self->_initialExpandingFrame.size.height);
    PLIntegralRect(v22, v23, v24, v25);
    double v28 = v26;
    double v29 = v27;
    double v49 = v21;
    double v30 = v27 / v21;
    double v31 = v19;
    if (v26 >= v27) {
      double v30 = v26 / v19;
    }
    float v32 = v30;
    -[PLExpandableImageView _setOriginalSize:](self, "_setOriginalSize:", v26, v27);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __47__PLExpandableImageView_continueTrackingPinch___block_invoke;
    v52[3] = &unk_1E63D1FE8;
    v52[4] = self;
    float v53 = v32;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v52 animations:0.2];
    p_centerOffset = &self->_centerOffset;
    if (v31 + fabs(p_centerOffset->width + p_centerOffset->width) < v28
      && v49 + fabs(self->_centerOffset.height + self->_centerOffset.height) < v29)
    {
      CGSize *p_centerOffset = *(CGSize *)MEMORY[0x1E4F1DB30];
    }
    *(unsigned char *)&self->_exImageFlags &= ~4u;
  }
  double v34 = v12 + self->_centerOffset.width;
  double v35 = v14 + self->_centerOffset.height;
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", v5, self->super._previousLeftLocation.x, self->super._previousLeftLocation.y);
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", v5, self->super._previousRightLocation.x, self->super._previousRightLocation.y);
  UIDistanceBetweenPoints();
  *(float *)&double v36 = v36;
  if (*(float *)&v36 >= 1.0 || ([a3 velocity], fabs(v37) > 0.05))
  {
    double v38 = atan((v51 - v50) / (v11 - v7));
    if (v7 <= v11) {
      double v39 = v38;
    }
    else {
      double v39 = v38 + 3.14159265;
    }
    if ((*(unsigned char *)&self->_exImageFlags & 1) == 0)
    {
      double originalAngle = self->_originalAngle;
      if (vabdd_f64(v39, originalAngle) <= 0.261799388)
      {
LABEL_19:
        objc_msgSend((id)-[PLExpandableImageView layer](self, "layer"), "setAnchorPoint:", self->_anchorPoint.x, self->_anchorPoint.y);
        -[PLExpandableImageView setCenter:](self, "setCenter:", v34, v35);
        [(PLImageView *)self->_imageView setEdgeAntialiasingEnabled:1];
        double pinchScale = self->_pinchScale;
        float v46 = self->_originalSize.width * pinchScale;
        double v47 = self->_originalAngle - originalAngle;
        *(float *)&double v47 = v47;
        -[PLExpandableImageView setSize:angle:](self, "setSize:angle:", rintf(v46), rint(pinchScale * self->_originalSize.height), v47);
        self->_pinchAngle = originalAngle;
        [(PLExpandableImageView *)self _updateBorderAndAccessoriesAlpha];
        goto LABEL_20;
      }
      self->_double originalAngle = v39;
      [(PLExpandableImageView *)self frame];
      self->_anchorPoint.double x = (v34 - v41) / v42;
      self->_anchorPoint.double y = (v35 - v43) / v44;
      *(unsigned char *)&self->_exImageFlags |= 1u;
    }
    double originalAngle = v39;
    goto LABEL_19;
  }
  if ([(PLExpandableView *)self state] == 1) {
    -[PLExpandableImageView setCenter:](self, "setCenter:", v34, v35);
  }
LABEL_20:
  [(PLExpandableImageView *)self _expansionFraction];
  return result;
}

uint64_t __47__PLExpandableImageView_continueTrackingPinch___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, *(float *)(a1 + 40), *(float *)(a1 + 40));
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) _updateBorderAndAccessoriesAlpha];
}

- (void)_updatePinchWidthAndScaleWithLeftPoint:(CGPoint)a3 rightPoint:(CGPoint)a4
{
  UIDistanceBetweenPoints();
  self->_double pinchWidth = v5;
  self->_double pinchScale = v5 / self->_originalWidth;
  if (![(PLExpandableView *)self allowsExpansion])
  {
    double pinchScale = self->_pinchScale;
    if (pinchScale > 1.0) {
      self->_double pinchScale = (1.0 - 1.0 / pinchScale) * 0.2 + 1.0;
    }
  }
}

- (void)_updateBorderAndAccessoriesAlpha
{
  [(PLExpandableImageView *)self _expansionFraction];
  imageView = self->_imageView;
  -[PLExpandableImageView _borderAlphaForExpansionFraction:](self, "_borderAlphaForExpansionFraction:");
  -[PLImageView setBorderAndAccessoriesAlpha:](imageView, "setBorderAndAccessoriesAlpha:");
}

- (float)_borderAlphaForExpansionFraction:(float)a3
{
  double v3 = fmax(a3 * -2.0 + 1.0, 0.0);
  if (v3 > 1.0) {
    return 1.0;
  }
  return v3;
}

- (void)setSize:(CGSize)a3 angle:(float)a4
{
  double height = a3.height;
  double width = a3.width;
  [(PLExpandableImageView *)self frame];
  double v9 = v8;
  double v11 = v10;
  [(PLExpandableImageView *)self bounds];
  BOOL v14 = width == height;
  if (width >= height) {
    double v15 = width;
  }
  else {
    double v15 = height;
  }
  if (v12 != v13) {
    BOOL v14 = 1;
  }
  float v16 = v15;
  double v17 = v16;
  if (v14) {
    double v18 = width;
  }
  else {
    double v18 = v16;
  }
  if (v14) {
    double v17 = height;
  }
  float v19 = self->_imageRotationAngle + a4;
  float currentAngle = self->_currentAngle;
  double v21 = vabdd_f64(v18, v9);
  BOOL v22 = vabds_f32(v19, currentAngle) < 1.0 && v21 < 1.0;
  double v23 = vabdd_f64(v17, v11);
  BOOL v24 = v22 && v23 < 1.0;
  if (!v24 || currentAngle != 0.0 && v19 == 0.0 || currentAngle == 0.0 && v19 != 0.0)
  {
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v31.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v31.c = v25;
    *(_OWORD *)&v31.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v26 = v17 / v13;
    double v27 = v18 / v12;
    if (v12 < v13) {
      double v27 = v26;
    }
    float v28 = v27;
    CGAffineTransformMakeRotation(&v31, v19);
    CGAffineTransform v29 = v31;
    CGAffineTransformScale(&v30, &v29, v28, v28);
    CGAffineTransform v31 = v30;
    [(PLExpandableImageView *)self setTransform:&v30];
    [(PLImageView *)self->_imageView setNeedsLayout];
    self->_float currentAngle = v19;
  }
}

- (void)beginTrackingPinch:(id)a3
{
  int v5 = [(PLExpandableView *)self state];
  if (v5 == 1)
  {
    [(PLImageView *)self->_imageView bounds];
    -[PLExpandableView pinchRect:inView:insetTouches:](self, "pinchRect:inView:insetTouches:", self->_imageView, 1);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    -[PLImageView convertRect:toView:](self->_imageView, "convertRect:toView:", [(PLExpandableImageView *)self superview], v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    -[PLImageView convertRect:toView:](self->_imageView, "convertRect:toView:", 0, v7, v9, v11, v13);
    self->_initialExpandingFrame.origin.double x = v22;
    self->_initialExpandingFrame.origin.double y = v23;
    self->_initialExpandingFrame.size.double width = v24;
    self->_initialExpandingFrame.size.double height = v25;
    char v26 = *(unsigned char *)&self->_exImageFlags | 4;
  }
  else
  {
    [(PLExpandableImageView *)self frame];
    double v15 = v27;
    double v17 = v28;
    double v19 = v29;
    double v21 = v30;
    [(PLExpandableView *)self contractedFrame];
    self->_initialExpandingFrame.origin.double x = v31;
    self->_initialExpandingFrame.origin.double y = v32;
    self->_initialExpandingFrame.size.double width = v33;
    self->_initialExpandingFrame.size.double height = v34;
    char v26 = *(unsigned char *)&self->_exImageFlags & 0xFB;
  }
  *(unsigned char *)&self->_char exImageFlags = v26;
  uint64_t v35 = [(PLExpandableImageView *)self superview];
  [a3 locationOfTouch:self->super._leftTouchIndex inView:v35];
  double v37 = v36;
  double v39 = v38;
  [a3 locationOfTouch:self->super._rightTouchIndex inView:v35];
  double v41 = v40;
  self->_anchorPoint.double x = ((v37 + v40) * 0.5 - v15) / v19;
  self->_anchorPoint.double y = ((v39 + v42) * 0.5 - v17) / v21;
  self->_double originalAngle = atan((v39 - v42) / (v40 - v37));
  id v43 = [(PLExpandableImageView *)self _contentView];
  [a3 locationOfTouch:self->super._leftTouchIndex inView:v43];
  [a3 locationOfTouch:self->super._rightTouchIndex inView:v43];
  UIDistanceBetweenPoints();
  self->_double originalWidth = originalWidth;
  if (v37 > v41)
  {
    self->_double originalAngle = self->_originalAngle + 3.14159265;
    double originalWidth = self->_originalWidth;
  }
  self->_double pinchWidth = originalWidth;
  self->_pinchAngle = self->_originalAngle;
  self->_double pinchScale = 1.0;
  char v45 = *(unsigned char *)&self->_exImageFlags & 0xDC;
  if (v5 == 1)
  {
    *(unsigned char *)&self->_char exImageFlags = v45 | 2;
  }
  else
  {
    *(unsigned char *)&self->_char exImageFlags = v45 | 0x22;
    self->_centerOffset = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  [(PLExpandableImageView *)self bounds];
  self->_originalBounds.origin.double x = v46;
  self->_originalBounds.origin.double y = v47;
  self->_originalBounds.size.double width = v48;
  self->_originalBounds.size.double height = v49;
  [(PLExpandableImageView *)self frame];
  -[PLExpandableImageView _setOriginalSize:](self, "_setOriginalSize:", v50, v51);
}

- (void)_setOriginalSize:(CGSize)a3
{
  self->_originalSize = a3;
}

- (void)stateDidChangeFrom:(int)a3
{
  if ([(PLExpandableView *)self state] == 1)
  {
    [(PLExpandableView *)self contractedFrame];
    double v5 = v4;
    double v7 = v6;
    [(PLExpandableView *)self expandedFrame];
    double v10 = v7 / v9;
    if (v9 > v8) {
      double v10 = v5 / v8;
    }
    imageView = self->_imageView;
    [(PLImageView *)imageView setPlaceholderScale:v10];
  }
}

- (CGRect)_snappedExpandedFrame
{
  [(PLExpandableView *)self expandedFrame];
  double v6 = PLIntegralRect(v2, v3, v4, v5);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (float)_expansionFraction
{
  [(PLExpandableView *)self contractedFrame];
  double v4 = v3;
  double v6 = v5;
  [(PLExpandableImageView *)self imageSize];
  double v8 = v7;
  double v10 = v9;
  *(float *)&double v7 = v7 / v9;
  double v11 = *(float *)&v7;
  BOOL v12 = *(float *)&v7 < 1.0;
  double v13 = rint(v6 * *(float *)&v7);
  double v14 = rint(v4 / v11);
  if (v12) {
    double v4 = v13;
  }
  else {
    double v6 = v14;
  }
  BOOL v15 = [(PLExpandableView *)self isTracking];
  if (v8 <= v10)
  {
    if (v15) {
      double v17 = self->_pinchScale * self->_originalSize.height;
    }
    else {
      [(PLExpandableImageView *)self frame];
    }
    double v21 = v17 - v6;
    [(PLExpandableView *)self expandedFrame];
    return v21 / (v22 - v6);
  }
  else
  {
    if (v15) {
      double v16 = self->_pinchScale * self->_originalSize.width;
    }
    else {
      [(PLExpandableImageView *)self frame];
    }
    double v18 = v16 - v4;
    [(PLExpandableView *)self expandedFrame];
    return v18 / (v19 - v4);
  }
}

- (float)_expandedScale
{
  [(PLExpandableView *)self expandedFrame];
  double v4 = v3;
  double v6 = v5;
  [(PLExpandableView *)self contractedFrame];
  double v9 = v6 / v8;
  if (v4 > v6) {
    return v4 / v7;
  }
  return v9;
}

- (float)_currentScale
{
  [(PLExpandableImageView *)self frame];
  double v4 = v3;
  [(PLExpandableView *)self contractedFrame];
  return v4 / v5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  imageView = self->_imageView;
  [(PLImageView *)imageView bounds];
  -[PLImageView convertRect:toView:](imageView, "convertRect:toView:", self);
  double v12 = (20.0 - v10) * 0.5;
  double v13 = (20.0 - v11) * 0.5;
  if (v12 > 0.0 || v13 > 0.0) {
    *(CGRect *)&uint64_t v8 = CGRectInset(*(CGRect *)&v8, -v12, -v13);
  }
  CGFloat v14 = x;
  CGFloat v15 = y;
  return CGRectContainsPoint(*(CGRect *)&v8, *(CGPoint *)&v14);
}

- (void)layoutSubviews
{
  char exImageFlags = (char)self->_exImageFlags;
  if ((exImageFlags & 0x18) != 8)
  {
    *(unsigned char *)&self->_char exImageFlags = exImageFlags | 8;
    unint64_t v4 = [(PLExpandableImageView *)self image];
    unint64_t v5 = [(PLExpandableImageView *)self videoView];
    if (v4 | v5)
    {
      unint64_t v6 = v5;
      [(PLExpandableImageView *)self bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      *(float *)&double v7 = v11;
      float v15 = rintf(*(float *)&v7);
      double v16 = rint(v13);
      if (v16 <= v15) {
        float v17 = v15;
      }
      else {
        float v17 = v16;
      }
      BOOL v18 = (*(unsigned char *)&self->_exImageFlags & 0x40) == 0
         || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1;
      double v19 = v14;
      double v20 = v12;
      if (v4)
      {
        -[PLImageView sizeThatFits:allowRounding:](self->_imageView, "sizeThatFits:allowRounding:", v18, v17, v17);
        double v20 = v21;
        double v19 = v22;
      }
      uint64_t v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", v18), "userInterfaceIdiom");
      if (v4 && (v23 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (v20 > v12 || v19 > v14))
      {
        float v24 = v20;
        double v12 = rintf(v24);
        double v14 = rint(v19);
        -[PLExpandableImageView setBounds:](self, "setBounds:", v8, v10, v12, v14);
      }
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
        && (!v4 ? (BOOL v25 = v6 == 0) : (BOOL v25 = 1),
            v25 ? (int v26 = 0) : (int v26 = 1),
            (*(unsigned char *)&self->_exImageFlags & 0x40) != 0 || v26))
      {
        double v27 = v8 + (v12 - v20) * 0.5;
        double v28 = v10 + (v14 - v19) * 0.5;
      }
      else
      {
        double v27 = round(v8 + (v12 - v20) * 0.5);
        double v28 = round(v10 + (v14 - v19) * 0.5);
      }
      imageView = self->_imageView;
      -[PLImageView setFrame:](imageView, "setFrame:", v27, v28, v20, v19);
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLExpandableImageView;
  [(PLExpandableView *)&v3 dealloc];
}

- (PLExpandableImageView)initWithFrame:(CGRect)a3
{
  return -[PLExpandableImageView initWithFrame:frameStyle:](self, "initWithFrame:frameStyle:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PLExpandableImageView)initWithFrame:(CGRect)a3 frameStyle:(int)a4
{
  return -[PLExpandableImageView initWithFrame:frameStyle:withBorder:](self, "initWithFrame:frameStyle:withBorder:", *(void *)&a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PLExpandableImageView)initWithFrame:(CGRect)a3 frameStyle:(int)a4 withBorder:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  v10.receiver = self;
  v10.super_class = (Class)PLExpandableImageView;
  double v8 = -[PLExpandableView initWithFrame:](&v10, sel_initWithFrame_, *(void *)&a4, a3.origin.x, a3.origin.y);
  if (v8)
  {
    v8->_imageView = -[PLImageView initWithFrame:]([PLImageView alloc], "initWithFrame:", 0.0, 0.0, width, height);
    objc_msgSend((id)-[PLExpandableImageView layer](v8, "layer"), "setEdgeAntialiasingMask:", 0);
    [(PLImageView *)v8->_imageView setOpaque:1];
    [(PLExpandableImageView *)v8 setBorderAndAccessoriesVisible:v5];
    [(PLExpandableImageView *)v8 addSubview:v8->_imageView];
  }
  return v8;
}

+ (double)imageBorderWidth
{
  return 6.0;
}

@end