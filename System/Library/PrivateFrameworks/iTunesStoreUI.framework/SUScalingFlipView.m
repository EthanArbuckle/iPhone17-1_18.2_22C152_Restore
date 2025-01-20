@interface SUScalingFlipView
- (SUScalingFlipView)initWithFrontView:(id)a3 backView:(id)a4;
- (SUScalingFlipViewDelegate)delegate;
- (double)duration;
- (id)_backLayerAnimation;
- (id)_fixedAnimationForAnimation:(id)a3;
- (id)_frontLayerAnimation;
- (id)_inputColorAnimation;
- (id)_positionAnimation;
- (id)_transformAnimationWithStart:(CATransform3D *)a3 middle:(CATransform3D *)a4 end:(CATransform3D *)a5;
- (int64_t)direction;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)performFlip;
- (void)setDelegate:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setDuration:(double)a3;
@end

@implementation SUScalingFlipView

- (SUScalingFlipView)initWithFrontView:(id)a3 backView:(id)a4
{
  p_fromFrame = &self->_fromFrame;
  [a3 frame];
  p_fromFrame->origin.x = v8;
  p_fromFrame->origin.y = v9;
  p_fromFrame->size.width = v10;
  p_fromFrame->size.height = v11;
  v12 = -[SUScalingFlipView initWithFrame:](self, "initWithFrame:");
  if (v12)
  {
    v12->_backView = (UIView *)a4;
    v12->_frontView = (UIView *)a3;
    [(UIView *)v12->_backView frame];
    v12->_toFrame.origin.x = v13;
    v12->_toFrame.origin.y = v14;
    v12->_toFrame.size.width = v15;
    v12->_toFrame.size.height = v16;
    [(CALayer *)[(UIView *)v12->_backView layer] setDoubleSided:0];
    [(CALayer *)[(UIView *)v12->_frontView layer] setDoubleSided:0];
    [(SUScalingFlipView *)v12 addSubview:v12->_backView];
    [(SUScalingFlipView *)v12 addSubview:v12->_frontView];
    frontView = v12->_frontView;
    [(SUScalingFlipView *)v12 center];
    -[UIView convertPoint:fromView:](frontView, "convertPoint:fromView:", v12);
    double v19 = v18;
    double v21 = v20;
    -[UIView setCenter:](v12->_backView, "setCenter:");
    -[UIView setCenter:](v12->_frontView, "setCenter:", v19, v21);
    v22 = (void *)[MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D20]];
    [v22 setName:@"multiply"];
    objc_msgSend(v22, "setValue:forKeyPath:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor"), "CGColor"), @"inputColor");
    v23 = (void *)[(SUScalingFlipView *)v12 layer];
    objc_msgSend(v23, "setFilters:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v22));
  }
  return v12;
}

- (void)dealloc
{
  self->_backView = 0;
  self->_frontView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScalingFlipView;
  [(SUScalingFlipView *)&v3 dealloc];
}

- (void)performFlip
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
  [(CALayer *)[(UIView *)self->_frontView layer] addAnimation:[(SUScalingFlipView *)self _fixedAnimationForAnimation:[(SUScalingFlipView *)self _frontLayerAnimation]] forKey:@"flipAnimation"];
  [(CALayer *)[(UIView *)self->_backView layer] addAnimation:[(SUScalingFlipView *)self _fixedAnimationForAnimation:[(SUScalingFlipView *)self _backLayerAnimation]] forKey:@"flipAnimation"];
  objc_super v3 = (void *)[MEMORY[0x263F15750] animation];
  objc_msgSend(v3, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", -[SUScalingFlipView _inputColorAnimation](self, "_inputColorAnimation"), -[SUScalingFlipView _positionAnimation](self, "_positionAnimation"), 0));
  [v3 setDelegate:self];
  v4 = (void *)[(SUScalingFlipView *)self layer];
  id v5 = [(SUScalingFlipView *)self _fixedAnimationForAnimation:v3];

  [v4 addAnimation:v5 forKey:@"multiplyAndPositionAnimation"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  objc_msgSend((id)-[SUScalingFlipView layer](self, "layer", a3, a4), "removeAllAnimations");
  [(CALayer *)[(UIView *)self->_backView layer] removeAllAnimations];
  [(CALayer *)[(UIView *)self->_frontView layer] removeAllAnimations];
  id v5 = [(UIView *)self->_backView layer];
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v21[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v21[5] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v21[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v21[7] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v21[0] = *MEMORY[0x263F15740];
  v21[1] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v21[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v21[3] = v9;
  [(CALayer *)v5 setTransform:v21];
  CGFloat v10 = [(UIView *)self->_frontView layer];
  CATransform3DMakeRotation(&v20, 3.14159265, 0.0, 1.0, 0.0);
  [(CALayer *)v10 setTransform:&v20];
  -[SUScalingFlipView setFrame:](self, "setFrame:", self->_toFrame.origin.x, self->_toFrame.origin.y, self->_toFrame.size.width, self->_toFrame.size.height);
  [(SUScalingFlipView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[UIView setFrame:](self->_backView, "setFrame:");
  -[UIView setFrame:](self->_frontView, "setFrame:", v12, v14, v16, v18);
  [(UIView *)self->_backView setNeedsDisplay];
  if (objc_opt_respondsToSelector())
  {
    double v19 = self;
    [(SUScalingFlipViewDelegate *)self->_delegate scalingFlipViewDidFinish:self];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endIgnoringInteractionEvents");
}

- (id)_backLayerAnimation
{
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
  double v8 = dbl_2279242C0[(unint64_t)(direction - 1) < 2];
  CGFloat v9 = 1.0 / ((width + height) * 0.5 * 3.0);
  double v10 = self->_fromFrame.size.height;
  CGFloat v11 = self->_fromFrame.size.width / width;
  long long v24 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  *(_OWORD *)&v30.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v23 = *(_OWORD *)&v30.m21;
  *(_OWORD *)&v30.m23 = v24;
  *(_OWORD *)&v30.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v22 = *(_OWORD *)&v30.m31;
  double v13 = v10 / height;
  v30.CGFloat m33 = *(CGFloat *)(MEMORY[0x263F15740] + 80);
  CGFloat m33 = v30.m33;
  long long v21 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  *(_OWORD *)&v30.m11 = *MEMORY[0x263F15740];
  long long v20 = *(_OWORD *)&v30.m11;
  *(_OWORD *)&v30.m13 = v21;
  v30.CGFloat m34 = v9;
  long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  *(_OWORD *)&v30.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v18 = *(_OWORD *)&v30.m41;
  *(_OWORD *)&v30.m43 = v19;
  CATransform3DScale(&v31, &v30, v11, 1.0, 1.0);
  long long v52 = *(_OWORD *)&v31.m21;
  long long v53 = *(_OWORD *)&v31.m23;
  long long v54 = *(_OWORD *)&v31.m31;
  CGFloat v55 = v31.m33;
  long long v50 = *(_OWORD *)&v31.m11;
  long long v51 = *(_OWORD *)&v31.m13;
  long long v48 = *(_OWORD *)&v31.m41;
  long long v49 = *(_OWORD *)&v31.m43;
  CATransform3D v30 = v31;
  CATransform3DRotate(&v31, &v30, v8, v7, v6, 0.0);
  long long v52 = *(_OWORD *)&v31.m21;
  long long v53 = *(_OWORD *)&v31.m23;
  long long v54 = *(_OWORD *)&v31.m31;
  CGFloat v55 = v31.m33;
  long long v50 = *(_OWORD *)&v31.m11;
  long long v51 = *(_OWORD *)&v31.m13;
  CGFloat m34 = v31.m34;
  long long v48 = *(_OWORD *)&v31.m41;
  long long v49 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&v30.m21 = v23;
  *(_OWORD *)&v30.m23 = v24;
  *(_OWORD *)&v30.m31 = v22;
  v30.CGFloat m33 = m33;
  *(_OWORD *)&v30.m11 = v20;
  *(_OWORD *)&v30.m13 = v21;
  v30.CGFloat m34 = v9;
  *(_OWORD *)&v30.m41 = v18;
  *(_OWORD *)&v30.m43 = v19;
  CATransform3DScale(&v31, &v30, v11 + (1.0 - v11) * 0.5, v13 + (1.0 - v13) * 0.5, 1.0);
  long long v44 = *(_OWORD *)&v31.m21;
  long long v45 = *(_OWORD *)&v31.m23;
  long long v46 = *(_OWORD *)&v31.m31;
  CGFloat v47 = v31.m33;
  long long v42 = *(_OWORD *)&v31.m11;
  long long v43 = *(_OWORD *)&v31.m13;
  long long v40 = *(_OWORD *)&v31.m41;
  long long v41 = *(_OWORD *)&v31.m43;
  CATransform3D v30 = v31;
  CATransform3DRotate(&v31, &v30, v8 * 0.5, v7, v6, 0.0);
  long long v44 = *(_OWORD *)&v31.m21;
  long long v45 = *(_OWORD *)&v31.m23;
  long long v46 = *(_OWORD *)&v31.m31;
  CGFloat v47 = v31.m33;
  long long v42 = *(_OWORD *)&v31.m11;
  long long v43 = *(_OWORD *)&v31.m13;
  CGFloat v14 = v31.m34;
  long long v40 = *(_OWORD *)&v31.m41;
  long long v41 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&v30.m21 = v23;
  *(_OWORD *)&v30.m23 = v24;
  *(_OWORD *)&v30.m31 = v22;
  v30.CGFloat m33 = m33;
  *(_OWORD *)&v30.m11 = v20;
  *(_OWORD *)&v30.m13 = v21;
  v30.CGFloat m34 = v9;
  *(_OWORD *)&v30.m41 = v18;
  *(_OWORD *)&v30.m43 = v19;
  CATransform3DScale(&v31, &v30, 1.0, 1.0, 1.0);
  long long v36 = *(_OWORD *)&v31.m21;
  long long v37 = *(_OWORD *)&v31.m23;
  long long v38 = *(_OWORD *)&v31.m31;
  CGFloat v39 = v31.m33;
  long long v34 = *(_OWORD *)&v31.m11;
  long long v35 = *(_OWORD *)&v31.m13;
  CGFloat v15 = v31.m34;
  long long v32 = *(_OWORD *)&v31.m41;
  long long v33 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&v31.m21 = v52;
  *(_OWORD *)&v31.m23 = v53;
  *(_OWORD *)&v31.m31 = v54;
  v31.CGFloat m33 = v55;
  *(_OWORD *)&v31.m11 = v50;
  *(_OWORD *)&v31.m13 = v51;
  v31.CGFloat m34 = m34;
  *(_OWORD *)&v31.m41 = v48;
  *(_OWORD *)&v31.m43 = v49;
  *(_OWORD *)&v30.m21 = v44;
  *(_OWORD *)&v30.m23 = v45;
  *(_OWORD *)&v30.m31 = v46;
  v30.CGFloat m33 = v47;
  *(_OWORD *)&v30.m11 = v42;
  *(_OWORD *)&v30.m13 = v43;
  v30.CGFloat m34 = v14;
  *(_OWORD *)&v30.m41 = v40;
  *(_OWORD *)&v30.m43 = v41;
  v25[2] = v36;
  v25[3] = v37;
  v25[4] = v38;
  CGFloat v26 = v39;
  v25[0] = v34;
  v25[1] = v35;
  CGFloat v27 = v15;
  long long v28 = v32;
  long long v29 = v33;
  return [(SUScalingFlipView *)self _transformAnimationWithStart:&v31 middle:&v30 end:v25];
}

- (id)_fixedAnimationForAnimation:(id)a3
{
  double duration = self->_duration;
  UIAnimationDragCoefficient();
  [a3 setDuration:duration * v5];
  [a3 setFillMode:*MEMORY[0x263F15AB0]];
  [a3 setRemovedOnCompletion:0];
  objc_msgSend(a3, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
  return a3;
}

- (id)_frontLayerAnimation
{
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
  double v8 = dbl_2279242D0[(unint64_t)(direction - 1) < 2];
  CGFloat v9 = 1.0 / ((width + height) * 0.5 * 3.0);
  CGFloat v10 = self->_toFrame.size.width / width;
  CGFloat v11 = self->_toFrame.size.height / height;
  long long v22 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  *(_OWORD *)&v28.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v21 = *(_OWORD *)&v28.m21;
  *(_OWORD *)&v28.m23 = v22;
  *(_OWORD *)&v28.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v20 = *(_OWORD *)&v28.m31;
  v28.CGFloat m33 = *(CGFloat *)(MEMORY[0x263F15740] + 80);
  CGFloat m33 = v28.m33;
  long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  *(_OWORD *)&v28.m11 = *MEMORY[0x263F15740];
  long long v18 = *(_OWORD *)&v28.m11;
  *(_OWORD *)&v28.m13 = v19;
  v28.CGFloat m34 = v9;
  long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  *(_OWORD *)&v28.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v16 = *(_OWORD *)&v28.m41;
  *(_OWORD *)&v28.m43 = v17;
  CATransform3DScale(&v29, &v28, (v10 + -1.0) * 0.5 + 1.0, (v11 + -1.0) * 0.5 + 1.0, 1.0);
  long long v42 = *(_OWORD *)&v29.m21;
  long long v43 = *(_OWORD *)&v29.m23;
  long long v44 = *(_OWORD *)&v29.m31;
  CGFloat v45 = v29.m33;
  long long v40 = *(_OWORD *)&v29.m11;
  long long v41 = *(_OWORD *)&v29.m13;
  long long v38 = *(_OWORD *)&v29.m41;
  long long v39 = *(_OWORD *)&v29.m43;
  CATransform3D v28 = v29;
  CATransform3DRotate(&v29, &v28, v8 * 0.5, v7, v6, 0.0);
  long long v42 = *(_OWORD *)&v29.m21;
  long long v43 = *(_OWORD *)&v29.m23;
  long long v44 = *(_OWORD *)&v29.m31;
  CGFloat v45 = v29.m33;
  long long v40 = *(_OWORD *)&v29.m11;
  long long v41 = *(_OWORD *)&v29.m13;
  CGFloat m34 = v29.m34;
  long long v38 = *(_OWORD *)&v29.m41;
  long long v39 = *(_OWORD *)&v29.m43;
  *(_OWORD *)&v28.m21 = v21;
  *(_OWORD *)&v28.m23 = v22;
  *(_OWORD *)&v28.m31 = v20;
  v28.CGFloat m33 = m33;
  *(_OWORD *)&v28.m11 = v18;
  *(_OWORD *)&v28.m13 = v19;
  v28.CGFloat m34 = v9;
  *(_OWORD *)&v28.m41 = v16;
  *(_OWORD *)&v28.m43 = v17;
  CATransform3DScale(&v29, &v28, v10, v11, 1.0);
  long long v34 = *(_OWORD *)&v29.m21;
  long long v35 = *(_OWORD *)&v29.m23;
  long long v36 = *(_OWORD *)&v29.m31;
  CGFloat v37 = v29.m33;
  long long v32 = *(_OWORD *)&v29.m11;
  long long v33 = *(_OWORD *)&v29.m13;
  long long v30 = *(_OWORD *)&v29.m41;
  long long v31 = *(_OWORD *)&v29.m43;
  CATransform3D v28 = v29;
  CATransform3DRotate(&v29, &v28, v8, v7, v6, 0.0);
  long long v34 = *(_OWORD *)&v29.m21;
  long long v35 = *(_OWORD *)&v29.m23;
  long long v36 = *(_OWORD *)&v29.m31;
  CGFloat v37 = v29.m33;
  long long v32 = *(_OWORD *)&v29.m11;
  long long v33 = *(_OWORD *)&v29.m13;
  CGFloat v14 = v29.m34;
  long long v30 = *(_OWORD *)&v29.m41;
  long long v31 = *(_OWORD *)&v29.m43;
  *(_OWORD *)&v29.m21 = v21;
  *(_OWORD *)&v29.m23 = v22;
  *(_OWORD *)&v29.m31 = v20;
  v29.CGFloat m33 = m33;
  *(_OWORD *)&v29.m11 = v18;
  *(_OWORD *)&v29.m13 = v19;
  v29.CGFloat m34 = v9;
  *(_OWORD *)&v29.m41 = v16;
  *(_OWORD *)&v29.m43 = v17;
  *(_OWORD *)&v28.m21 = v42;
  *(_OWORD *)&v28.m23 = v43;
  *(_OWORD *)&v28.m31 = v44;
  v28.CGFloat m33 = v45;
  *(_OWORD *)&v28.m11 = v40;
  *(_OWORD *)&v28.m13 = v41;
  v28.CGFloat m34 = m34;
  *(_OWORD *)&v28.m41 = v38;
  *(_OWORD *)&v28.m43 = v39;
  v23[2] = v34;
  v23[3] = v35;
  v23[4] = v36;
  CGFloat v24 = v37;
  v23[0] = v32;
  v23[1] = v33;
  CGFloat v25 = v14;
  long long v26 = v30;
  long long v27 = v31;
  return [(SUScalingFlipView *)self _transformAnimationWithStart:&v29 middle:&v28 end:v23];
}

- (id)_inputColorAnimation
{
  v2 = (void *)[MEMORY[0x263F157D8] animationWithKeyPath:@"filters.multiply.inputColor"];
  objc_super v3 = (void *)[MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
  v4 = (void *)[MEMORY[0x263F1C550] colorWithWhite:0.330000013 alpha:1.0];
  float v5 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v6 = [NSNumber numberWithFloat:0.0];
  LODWORD(v7) = 0.5;
  uint64_t v8 = [NSNumber numberWithFloat:v7];
  LODWORD(v9) = 1.0;
  objc_msgSend(v2, "setKeyTimes:", objc_msgSend(v5, "arrayWithObjects:", v6, v8, objc_msgSend(NSNumber, "numberWithFloat:", v9), 0));
  objc_msgSend(v2, "setValues:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", objc_msgSend(v3, "CGColor"), objc_msgSend(v4, "CGColor"), objc_msgSend(v3, "CGColor"), 0));
  return v2;
}

- (id)_positionAnimation
{
  objc_msgSend((id)-[SUScalingFlipView layer](self, "layer"), "position");
  double v3 = v2;
  double v5 = v4;
  UIRectGetCenter();
  double v7 = floor(v3 + v6 - v3);
  double v9 = floor(v5 + v8 - v5);
  CGFloat v10 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"position"];
  objc_msgSend(v10, "setToValue:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v7, v9));
  return v10;
}

- (id)_transformAnimationWithStart:(CATransform3D *)a3 middle:(CATransform3D *)a4 end:(CATransform3D *)a5
{
  double v8 = (void *)[MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
  double v9 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v10 = [NSNumber numberWithFloat:0.0];
  LODWORD(v11) = 0.5;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  LODWORD(v13) = 1.0;
  objc_msgSend(v8, "setKeyTimes:", objc_msgSend(v9, "arrayWithObjects:", v10, v12, objc_msgSend(NSNumber, "numberWithFloat:", v13), 0));
  CGFloat v14 = (void *)MEMORY[0x263EFF8C0];
  long long v15 = *(_OWORD *)&a3->m33;
  long long v34 = *(_OWORD *)&a3->m31;
  long long v35 = v15;
  long long v16 = *(_OWORD *)&a3->m43;
  long long v36 = *(_OWORD *)&a3->m41;
  long long v37 = v16;
  long long v17 = *(_OWORD *)&a3->m13;
  long long v30 = *(_OWORD *)&a3->m11;
  long long v31 = v17;
  long long v18 = *(_OWORD *)&a3->m23;
  long long v32 = *(_OWORD *)&a3->m21;
  long long v33 = v18;
  uint64_t v19 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v30];
  long long v20 = *(_OWORD *)&a4->m33;
  long long v34 = *(_OWORD *)&a4->m31;
  long long v35 = v20;
  long long v21 = *(_OWORD *)&a4->m43;
  long long v36 = *(_OWORD *)&a4->m41;
  long long v37 = v21;
  long long v22 = *(_OWORD *)&a4->m13;
  long long v30 = *(_OWORD *)&a4->m11;
  long long v31 = v22;
  long long v23 = *(_OWORD *)&a4->m23;
  long long v32 = *(_OWORD *)&a4->m21;
  long long v33 = v23;
  uint64_t v24 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v30];
  long long v25 = *(_OWORD *)&a5->m33;
  long long v34 = *(_OWORD *)&a5->m31;
  long long v35 = v25;
  long long v26 = *(_OWORD *)&a5->m43;
  long long v36 = *(_OWORD *)&a5->m41;
  long long v37 = v26;
  long long v27 = *(_OWORD *)&a5->m13;
  long long v30 = *(_OWORD *)&a5->m11;
  long long v31 = v27;
  long long v28 = *(_OWORD *)&a5->m23;
  long long v32 = *(_OWORD *)&a5->m21;
  long long v33 = v28;
  objc_msgSend(v8, "setValues:", objc_msgSend(v14, "arrayWithObjects:", v19, v24, objc_msgSend(MEMORY[0x263F08D40], "valueWithCATransform3D:", &v30), 0));
  return v8;
}

- (SUScalingFlipViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUScalingFlipViewDelegate *)a3;
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

@end