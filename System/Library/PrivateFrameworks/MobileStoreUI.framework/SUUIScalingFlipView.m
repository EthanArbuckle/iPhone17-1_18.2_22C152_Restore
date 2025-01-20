@interface SUUIScalingFlipView
- (SUUIScalingFlipView)initWithFrontView:(id)a3 backView:(id)a4;
- (double)duration;
- (id)_backLayerAnimation;
- (id)_frontLayerAnimation;
- (id)_inputColorAnimation;
- (id)_positionAnimation;
- (id)_timingFunction;
- (int64_t)direction;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)performFlipWithCompletionBlock:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setDuration:(double)a3;
@end

@implementation SUUIScalingFlipView

- (SUUIScalingFlipView)initWithFrontView:(id)a3 backView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v7 frame];
  self->_fromFrame.origin.x = v9;
  self->_fromFrame.origin.y = v10;
  self->_fromFrame.size.width = v11;
  self->_fromFrame.size.height = v12;
  v13 = -[SUUIScalingFlipView initWithFrame:](self, "initWithFrame:");
  v14 = v13;
  if (v13)
  {
    p_backView = (id *)&v13->_backView;
    objc_storeStrong((id *)&v13->_backView, a4);
    objc_storeStrong((id *)&v14->_frontView, a3);
    [*p_backView frame];
    v14->_toFrame.origin.x = v16;
    v14->_toFrame.origin.y = v17;
    v14->_toFrame.size.width = v18;
    v14->_toFrame.size.height = v19;
    v20 = [*p_backView layer];
    [v20 setDoubleSided:0];

    v21 = [(UIView *)v14->_frontView layer];
    [v21 setDoubleSided:0];

    [(SUUIScalingFlipView *)v14 addSubview:*p_backView];
    [(SUUIScalingFlipView *)v14 addSubview:v14->_frontView];
    frontView = v14->_frontView;
    [(SUUIScalingFlipView *)v14 center];
    -[UIView convertPoint:fromView:](frontView, "convertPoint:fromView:", v14);
    double v24 = v23;
    double v26 = v25;
    objc_msgSend(*p_backView, "setCenter:");
    -[UIView setCenter:](v14->_frontView, "setCenter:", v24, v26);
    v27 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D20]];
    [v27 setName:@"multiply"];
    id v28 = [MEMORY[0x263F825C8] whiteColor];
    objc_msgSend(v27, "setValue:forKeyPath:", objc_msgSend(v28, "CGColor"), @"inputColor");

    v29 = [(SUUIScalingFlipView *)v14 layer];
    v30 = [MEMORY[0x263EFF8C0] arrayWithObject:v27];
    [v29 setFilters:v30];
  }
  return v14;
}

- (void)performFlipWithCompletionBlock:(id)a3
{
  id v20 = a3;
  v4 = [MEMORY[0x263F82438] sharedApplication];
  [v4 beginIgnoringInteractionEvents];

  if (self->_completionBlock != v20)
  {
    v5 = (void *)[v20 copy];
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v5;
  }
  id v7 = [(UIView *)self->_frontView layer];
  id v8 = [(SUUIScalingFlipView *)self _frontLayerAnimation];
  [v7 addAnimation:v8 forKey:@"flipAnimation"];

  CGFloat v9 = [(UIView *)self->_backView layer];
  CGFloat v10 = [(SUUIScalingFlipView *)self _backLayerAnimation];
  [v9 addAnimation:v10 forKey:@"flipAnimation"];

  CGFloat v11 = [MEMORY[0x263F15750] animation];
  CGFloat v12 = (void *)MEMORY[0x263EFF8C0];
  v13 = [(SUUIScalingFlipView *)self _inputColorAnimation];
  v14 = [(SUUIScalingFlipView *)self _positionAnimation];
  v15 = objc_msgSend(v12, "arrayWithObjects:", v13, v14, 0);
  [v11 setAnimations:v15];

  [v11 setDelegate:self];
  double duration = self->_duration;
  UIAnimationDragCoefficient();
  [v11 setDuration:duration * v17];
  [v11 setFillMode:*MEMORY[0x263F15AB0]];
  [v11 setRemovedOnCompletion:0];
  CGFloat v18 = [(SUUIScalingFlipView *)self _timingFunction];
  [v11 setTimingFunction:v18];

  CGFloat v19 = [(SUUIScalingFlipView *)self layer];
  [v19 addAnimation:v11 forKey:@"multiplyAndPositionAnimation"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  v5 = [(SUUIScalingFlipView *)self layer];
  [v5 removeAllAnimations];

  v6 = [(UIView *)self->_backView layer];
  [v6 removeAllAnimations];

  id v7 = [(UIView *)self->_frontView layer];
  [v7 removeAllAnimations];

  id v8 = [(UIView *)self->_backView layer];
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v25[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v25[5] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v25[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v25[7] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v25[0] = *MEMORY[0x263F15740];
  v25[1] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v25[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v25[3] = v12;
  [v8 setTransform:v25];

  v13 = [(UIView *)self->_frontView layer];
  CATransform3DMakeRotation(&v24, 3.14159265, 0.0, 1.0, 0.0);
  [v13 setTransform:&v24];

  -[SUUIScalingFlipView setFrame:](self, "setFrame:", self->_toFrame.origin.x, self->_toFrame.origin.y, self->_toFrame.size.width, self->_toFrame.size.height);
  [(SUUIScalingFlipView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  -[UIView setFrame:](self->_backView, "setFrame:");
  -[UIView setFrame:](self->_frontView, "setFrame:", v15, v17, v19, v21);
  [(UIView *)self->_backView setNeedsDisplay];
  id completionBlock = (void (**)(id, SUUIScalingFlipView *))self->_completionBlock;
  if (completionBlock) {
    completionBlock[2](completionBlock, self);
  }
  double v23 = [MEMORY[0x263F82438] sharedApplication];
  [v23 endIgnoringInteractionEvents];
}

- (id)_backLayerAnimation
{
  v60[3] = *MEMORY[0x263EF8340];
  double width = self->_toFrame.size.width;
  double height = self->_toFrame.size.height;
  int64_t direction = self->_direction;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  double v8 = dbl_2568A0FC0[(direction & 0xFFFFFFFFFFFFFFFDLL) == 0];
  CGFloat v9 = 1.0 / ((width + height) * 0.5 * 3.0);
  double v10 = self->_fromFrame.size.height;
  CGFloat v11 = self->_fromFrame.size.width / width;
  long long v39 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  *(_OWORD *)&v40.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v38 = *(_OWORD *)&v40.m21;
  *(_OWORD *)&v40.m23 = v39;
  *(_OWORD *)&v40.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v37 = *(_OWORD *)&v40.m31;
  double v13 = v10 / height;
  v40.CGFloat m33 = *(CGFloat *)(MEMORY[0x263F15740] + 80);
  CGFloat m33 = v40.m33;
  long long v36 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  *(_OWORD *)&v40.m11 = *MEMORY[0x263F15740];
  long long v35 = *(_OWORD *)&v40.m11;
  *(_OWORD *)&v40.m13 = v36;
  v40.CGFloat m34 = v9;
  long long v34 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  *(_OWORD *)&v40.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v33 = *(_OWORD *)&v40.m41;
  *(_OWORD *)&v40.m43 = v34;
  CATransform3DScale(&v41, &v40, v11, 1.0, 1.0);
  long long v56 = *(_OWORD *)&v41.m21;
  long long v57 = *(_OWORD *)&v41.m23;
  long long v58 = *(_OWORD *)&v41.m31;
  CGFloat v59 = v41.m33;
  long long v54 = *(_OWORD *)&v41.m11;
  long long v55 = *(_OWORD *)&v41.m13;
  long long v52 = *(_OWORD *)&v41.m41;
  long long v53 = *(_OWORD *)&v41.m43;
  *(_OWORD *)&v40.m21 = *(_OWORD *)&v41.m21;
  *(_OWORD *)&v40.m23 = *(_OWORD *)&v41.m23;
  *(_OWORD *)&v40.m31 = *(_OWORD *)&v41.m31;
  v40.CGFloat m33 = v41.m33;
  *(_OWORD *)&v40.m11 = *(_OWORD *)&v41.m11;
  *(_OWORD *)&v40.m13 = *(_OWORD *)&v41.m13;
  v40.CGFloat m34 = v41.m34;
  *(_OWORD *)&v40.m41 = *(_OWORD *)&v41.m41;
  *(_OWORD *)&v40.m43 = *(_OWORD *)&v41.m43;
  CATransform3DRotate(&v41, &v40, v8, v7, v6, 0.0);
  long long v56 = *(_OWORD *)&v41.m21;
  long long v57 = *(_OWORD *)&v41.m23;
  long long v58 = *(_OWORD *)&v41.m31;
  CGFloat v59 = v41.m33;
  long long v54 = *(_OWORD *)&v41.m11;
  long long v55 = *(_OWORD *)&v41.m13;
  CGFloat m34 = v41.m34;
  long long v52 = *(_OWORD *)&v41.m41;
  long long v53 = *(_OWORD *)&v41.m43;
  *(_OWORD *)&v40.m21 = v38;
  *(_OWORD *)&v40.m23 = v39;
  *(_OWORD *)&v40.m31 = v37;
  v40.CGFloat m33 = m33;
  *(_OWORD *)&v40.m11 = v35;
  *(_OWORD *)&v40.m13 = v36;
  v40.CGFloat m34 = v9;
  *(_OWORD *)&v40.m41 = v33;
  *(_OWORD *)&v40.m43 = v34;
  CATransform3DScale(&v41, &v40, v11 + (1.0 - v11) * 0.330000013, v13 + (1.0 - v13) * 0.330000013, 1.0);
  long long v48 = *(_OWORD *)&v41.m21;
  long long v49 = *(_OWORD *)&v41.m23;
  long long v50 = *(_OWORD *)&v41.m31;
  CGFloat v51 = v41.m33;
  long long v46 = *(_OWORD *)&v41.m11;
  long long v47 = *(_OWORD *)&v41.m13;
  long long v44 = *(_OWORD *)&v41.m41;
  long long v45 = *(_OWORD *)&v41.m43;
  *(_OWORD *)&v40.m21 = *(_OWORD *)&v41.m21;
  *(_OWORD *)&v40.m23 = *(_OWORD *)&v41.m23;
  *(_OWORD *)&v40.m31 = *(_OWORD *)&v41.m31;
  v40.CGFloat m33 = v41.m33;
  *(_OWORD *)&v40.m11 = *(_OWORD *)&v41.m11;
  *(_OWORD *)&v40.m13 = *(_OWORD *)&v41.m13;
  v40.CGFloat m34 = v41.m34;
  *(_OWORD *)&v40.m41 = *(_OWORD *)&v41.m41;
  *(_OWORD *)&v40.m43 = *(_OWORD *)&v41.m43;
  CATransform3DRotate(&v41, &v40, v8 * 0.5, v7, v6, 0.0);
  long long v48 = *(_OWORD *)&v41.m21;
  long long v49 = *(_OWORD *)&v41.m23;
  long long v50 = *(_OWORD *)&v41.m31;
  CGFloat v51 = v41.m33;
  long long v46 = *(_OWORD *)&v41.m11;
  long long v47 = *(_OWORD *)&v41.m13;
  CGFloat v14 = v41.m34;
  long long v44 = *(_OWORD *)&v41.m41;
  long long v45 = *(_OWORD *)&v41.m43;
  *(_OWORD *)&v40.m21 = v38;
  *(_OWORD *)&v40.m23 = v39;
  *(_OWORD *)&v40.m31 = v37;
  v40.CGFloat m33 = m33;
  *(_OWORD *)&v40.m11 = v35;
  *(_OWORD *)&v40.m13 = v36;
  v40.CGFloat m34 = v9;
  *(_OWORD *)&v40.m41 = v33;
  *(_OWORD *)&v40.m43 = v34;
  CATransform3DScale(&v41, &v40, 1.0, 1.0, 1.0);
  *(_OWORD *)&v40.m21 = *(_OWORD *)&v41.m21;
  *(_OWORD *)&v40.m23 = *(_OWORD *)&v41.m23;
  *(_OWORD *)&v40.m31 = *(_OWORD *)&v41.m31;
  v40.CGFloat m33 = v41.m33;
  *(_OWORD *)&v40.m11 = *(_OWORD *)&v41.m11;
  *(_OWORD *)&v40.m13 = *(_OWORD *)&v41.m13;
  CGFloat v15 = v41.m34;
  long long v42 = *(_OWORD *)&v41.m41;
  long long v43 = *(_OWORD *)&v41.m43;
  double v16 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
  double v17 = (void *)MEMORY[0x263EFF8C0];
  double v18 = [NSNumber numberWithFloat:0.0];
  LODWORD(v19) = 0.5;
  double v20 = [NSNumber numberWithFloat:v19];
  LODWORD(v21) = 1.0;
  v22 = [NSNumber numberWithFloat:v21];
  double v23 = objc_msgSend(v17, "arrayWithObjects:", v18, v20, v22, 0);
  [v16 setKeyTimes:v23];

  *(_OWORD *)&v41.m21 = v56;
  *(_OWORD *)&v41.m23 = v57;
  *(_OWORD *)&v41.m31 = v58;
  v41.CGFloat m33 = v59;
  *(_OWORD *)&v41.m11 = v54;
  *(_OWORD *)&v41.m13 = v55;
  v41.CGFloat m34 = m34;
  *(_OWORD *)&v41.m41 = v52;
  *(_OWORD *)&v41.m43 = v53;
  CATransform3D v24 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v41];
  v60[0] = v24;
  *(_OWORD *)&v41.m21 = v48;
  *(_OWORD *)&v41.m23 = v49;
  *(_OWORD *)&v41.m31 = v50;
  v41.CGFloat m33 = v51;
  *(_OWORD *)&v41.m11 = v46;
  *(_OWORD *)&v41.m13 = v47;
  v41.CGFloat m34 = v14;
  *(_OWORD *)&v41.m41 = v44;
  *(_OWORD *)&v41.m43 = v45;
  double v25 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v41];
  v60[1] = v25;
  *(_OWORD *)&v41.m21 = *(_OWORD *)&v40.m21;
  *(_OWORD *)&v41.m23 = *(_OWORD *)&v40.m23;
  *(_OWORD *)&v41.m31 = *(_OWORD *)&v40.m31;
  v41.CGFloat m33 = v40.m33;
  *(_OWORD *)&v41.m11 = *(_OWORD *)&v40.m11;
  *(_OWORD *)&v41.m13 = *(_OWORD *)&v40.m13;
  v41.CGFloat m34 = v15;
  *(_OWORD *)&v41.m41 = v42;
  *(_OWORD *)&v41.m43 = v43;
  double v26 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v41];
  v60[2] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];
  [v16 setValues:v27];

  double duration = self->_duration;
  UIAnimationDragCoefficient();
  [v16 setDuration:duration * v29];
  [v16 setFillMode:*MEMORY[0x263F15AB0]];
  [v16 setRemovedOnCompletion:0];
  v30 = [(SUUIScalingFlipView *)self _timingFunction];
  [v16 setTimingFunction:v30];

  return v16;
}

- (id)_frontLayerAnimation
{
  v56[3] = *MEMORY[0x263EF8340];
  double width = self->_fromFrame.size.width;
  double height = self->_fromFrame.size.height;
  int64_t direction = self->_direction;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  double v8 = dbl_2568A0FD0[(direction & 0xFFFFFFFFFFFFFFFDLL) == 0];
  CGFloat v9 = 1.0 / ((width + height) * 0.5 * 3.0);
  CGFloat v10 = self->_toFrame.size.width / width;
  CGFloat v11 = self->_toFrame.size.height / height;
  long long v37 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  *(_OWORD *)&v38.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v36 = *(_OWORD *)&v38.m21;
  *(_OWORD *)&v38.m23 = v37;
  *(_OWORD *)&v38.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v35 = *(_OWORD *)&v38.m31;
  v38.CGFloat m33 = *(CGFloat *)(MEMORY[0x263F15740] + 80);
  CGFloat m33 = v38.m33;
  long long v34 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  *(_OWORD *)&v38.m11 = *MEMORY[0x263F15740];
  long long v33 = *(_OWORD *)&v38.m11;
  *(_OWORD *)&v38.m13 = v34;
  v38.CGFloat m34 = v9;
  long long v32 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  *(_OWORD *)&v38.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v31 = *(_OWORD *)&v38.m41;
  *(_OWORD *)&v38.m43 = v32;
  CATransform3DScale(&v39, &v38, (v10 + -1.0) * 0.5 + 1.0, (v11 + -1.0) * 0.5 + 1.0, 1.0);
  long long v52 = *(_OWORD *)&v39.m21;
  long long v53 = *(_OWORD *)&v39.m23;
  long long v54 = *(_OWORD *)&v39.m31;
  CGFloat v55 = v39.m33;
  long long v50 = *(_OWORD *)&v39.m11;
  long long v51 = *(_OWORD *)&v39.m13;
  long long v48 = *(_OWORD *)&v39.m41;
  long long v49 = *(_OWORD *)&v39.m43;
  CATransform3D v38 = v39;
  CATransform3DRotate(&v39, &v38, v8 * 0.5, v7, v6, 0.0);
  long long v52 = *(_OWORD *)&v39.m21;
  long long v53 = *(_OWORD *)&v39.m23;
  long long v54 = *(_OWORD *)&v39.m31;
  CGFloat v55 = v39.m33;
  long long v50 = *(_OWORD *)&v39.m11;
  long long v51 = *(_OWORD *)&v39.m13;
  CGFloat m34 = v39.m34;
  long long v48 = *(_OWORD *)&v39.m41;
  long long v49 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&v38.m21 = v36;
  *(_OWORD *)&v38.m23 = v37;
  *(_OWORD *)&v38.m31 = v35;
  v38.CGFloat m33 = m33;
  *(_OWORD *)&v38.m11 = v33;
  *(_OWORD *)&v38.m13 = v34;
  v38.CGFloat m34 = v9;
  *(_OWORD *)&v38.m41 = v31;
  *(_OWORD *)&v38.m43 = v32;
  CATransform3DScale(&v39, &v38, v10, v11, 1.0);
  long long v44 = *(_OWORD *)&v39.m21;
  long long v45 = *(_OWORD *)&v39.m23;
  long long v46 = *(_OWORD *)&v39.m31;
  CGFloat v47 = v39.m33;
  long long v42 = *(_OWORD *)&v39.m11;
  long long v43 = *(_OWORD *)&v39.m13;
  long long v40 = *(_OWORD *)&v39.m41;
  long long v41 = *(_OWORD *)&v39.m43;
  CATransform3D v38 = v39;
  CATransform3DRotate(&v39, &v38, v8, v7, v6, 0.0);
  long long v44 = *(_OWORD *)&v39.m21;
  long long v45 = *(_OWORD *)&v39.m23;
  long long v46 = *(_OWORD *)&v39.m31;
  CGFloat v47 = v39.m33;
  long long v42 = *(_OWORD *)&v39.m11;
  long long v43 = *(_OWORD *)&v39.m13;
  CGFloat v14 = v39.m34;
  long long v40 = *(_OWORD *)&v39.m41;
  long long v41 = *(_OWORD *)&v39.m43;
  CGFloat v15 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
  double v16 = (void *)MEMORY[0x263EFF8C0];
  double v17 = [NSNumber numberWithFloat:0.0];
  LODWORD(v18) = 0.5;
  double v19 = [NSNumber numberWithFloat:v18];
  LODWORD(v20) = 1.0;
  double v21 = [NSNumber numberWithFloat:v20];
  v22 = objc_msgSend(v16, "arrayWithObjects:", v17, v19, v21, 0);
  [v15 setKeyTimes:v22];

  *(_OWORD *)&v39.m21 = v36;
  *(_OWORD *)&v39.m23 = v37;
  *(_OWORD *)&v39.m31 = v35;
  v39.CGFloat m33 = m33;
  *(_OWORD *)&v39.m11 = v33;
  *(_OWORD *)&v39.m13 = v34;
  v39.CGFloat m34 = v9;
  *(_OWORD *)&v39.m41 = v31;
  *(_OWORD *)&v39.m43 = v32;
  double v23 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v39];
  v56[0] = v23;
  *(_OWORD *)&v39.m21 = v52;
  *(_OWORD *)&v39.m23 = v53;
  *(_OWORD *)&v39.m31 = v54;
  v39.CGFloat m33 = v55;
  *(_OWORD *)&v39.m11 = v50;
  *(_OWORD *)&v39.m13 = v51;
  v39.CGFloat m34 = m34;
  *(_OWORD *)&v39.m41 = v48;
  *(_OWORD *)&v39.m43 = v49;
  CATransform3D v24 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v39];
  v56[1] = v24;
  *(_OWORD *)&v39.m21 = v44;
  *(_OWORD *)&v39.m23 = v45;
  *(_OWORD *)&v39.m31 = v46;
  v39.CGFloat m33 = v47;
  *(_OWORD *)&v39.m11 = v42;
  *(_OWORD *)&v39.m13 = v43;
  v39.CGFloat m34 = v14;
  *(_OWORD *)&v39.m41 = v40;
  *(_OWORD *)&v39.m43 = v41;
  double v25 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v39];
  v56[2] = v25;
  double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
  [v15 setValues:v26];

  double duration = self->_duration;
  UIAnimationDragCoefficient();
  [v15 setDuration:duration * v28];
  [v15 setFillMode:*MEMORY[0x263F15AB0]];
  [v15 setRemovedOnCompletion:0];
  float v29 = [(SUUIScalingFlipView *)self _timingFunction];
  [v15 setTimingFunction:v29];

  return v15;
}

- (id)_inputColorAnimation
{
  v2 = [MEMORY[0x263F157D8] animationWithKeyPath:@"filters.multiply.inputColor"];
  v3 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  v4 = [MEMORY[0x263F825C8] colorWithWhite:0.330000013 alpha:1.0];
  v5 = (void *)MEMORY[0x263EFF8C0];
  double v6 = [NSNumber numberWithFloat:0.0];
  LODWORD(v7) = 0.5;
  double v8 = [NSNumber numberWithFloat:v7];
  LODWORD(v9) = 1.0;
  CGFloat v10 = [NSNumber numberWithFloat:v9];
  CGFloat v11 = objc_msgSend(v5, "arrayWithObjects:", v6, v8, v10, 0);
  [v2 setKeyTimes:v11];

  long long v12 = (void *)MEMORY[0x263EFF8C0];
  id v13 = v3;
  uint64_t v14 = [v13 CGColor];
  id v15 = v4;
  uint64_t v16 = [v15 CGColor];
  id v17 = v13;
  double v18 = objc_msgSend(v12, "arrayWithObjects:", v14, v16, objc_msgSend(v17, "CGColor"), 0);
  [v2 setValues:v18];

  return v2;
}

- (id)_positionAnimation
{
  v2 = [(SUUIScalingFlipView *)self layer];
  [v2 position];
  double v4 = v3;
  double v6 = v5;

  UIRectGetCenter();
  *(float *)&double v7 = v4 + v7 - v4;
  double v8 = floorf(*(float *)&v7);
  *(float *)&double v7 = v6 + v9 - v6;
  double v10 = floorf(*(float *)&v7);
  CGFloat v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
  long long v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v8, v10);
  [v11 setToValue:v12];

  return v11;
}

- (id)_timingFunction
{
  LODWORD(v3) = 1036831949;
  LODWORD(v2) = 0.25;
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 1.0;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :v3 :v4 :v5];
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_int64_t direction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_backView, 0);
}

@end