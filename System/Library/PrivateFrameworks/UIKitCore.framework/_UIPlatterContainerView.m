@interface _UIPlatterContainerView
- (UIView)platterContentView;
- (_UIPlatterContainerView)initWithFrame:(CGRect)a3;
- (_UIPlatterView)source;
- (_UIPlatterView)target;
- (_UIPlatterView)updatedTarget;
- (void)_updateTransforms;
- (void)applyRotation:(double)a3;
- (void)applyTransform:(CGAffineTransform *)a3 withSize:(CGSize)a4;
- (void)installPreviewContainer:(id)a3 overrideSourceView:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPlatterContentView:(id)a3;
- (void)setSource:(id)a3;
- (void)setTarget:(id)a3;
- (void)setUpdatedTarget:(id)a3;
@end

@implementation _UIPlatterContainerView

- (_UIPlatterContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_UIPlatterContainerView;
  v7 = -[UIView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", x, y, width, height);
    platterContentView = v7->_platterContentView;
    v7->_platterContentView = v8;

    [(UIView *)v7->_platterContentView setAutoresizingMask:18];
    [(UIView *)v7 addSubview:v7->_platterContentView];
  }
  return v7;
}

- (void)installPreviewContainer:(id)a3 overrideSourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(UIView *)self bounds];
  objc_msgSend(v6, "setFrame:");
  [(UIView *)self addSubview:v6];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v9 = [(_UIPlatterContainerView *)self source];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(_UIPlatterContainerView *)self target];
    }
    id v8 = v11;
  }
  v12 = [(_UIPlatterContainerView *)self platterContentView];
  [(UIView *)self transform];
  [v6 _preparePreviewContainerWithPreview:v12 source:v8 initialTransform:&v13];
}

- (void)applyTransform:(CGAffineTransform *)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGAffineTransformMakeScale(&v10, sqrt(a3->a * a3->a + a3->c * a3->c), sqrt(a3->b * a3->b + a3->d * a3->d));
  -[_UIPlatterContainerView setBounds:](self, "setBounds:", v8, v9, width * v10.a + height * v10.c, width * v10.b + height * v10.d);
  [(_UIPlatterContainerView *)self applyRotation:(double)atan2(a3->b, a3->a)];
}

- (void)applyRotation:(double)a3
{
  CGAffineTransformMakeRotation(&v5, a3);
  CGAffineTransform v4 = v5;
  [(UIView *)self setTransform:&v4];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPlatterContainerView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIPlatterContainerView *)self _updateTransforms];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPlatterContainerView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIPlatterContainerView *)self _updateTransforms];
}

- (void)setSource:(id)a3
{
  CGAffineTransform v5 = (_UIPlatterView *)a3;
  source = self->_source;
  double v8 = v5;
  if (source != v5) {
    [(UIView *)source removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_source, a3);
  if (self->_source)
  {
    id v7 = [(_UIPlatterContainerView *)self platterContentView];
    [v7 addSubview:v8];

    [(_UIPlatterContainerView *)self _updateTransforms];
  }
}

- (void)setTarget:(id)a3
{
  CGAffineTransform v5 = (_UIPlatterView *)a3;
  target = self->_target;
  v12 = v5;
  if (target != v5) {
    [(UIView *)target removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_target, a3);
  if (self->_target)
  {
    id v7 = [(_UIPlatterContainerView *)self platterContentView];
    [v7 addSubview:v12];

    if (!self->_updatedTargetWrapper)
    {
      double v8 = [UIView alloc];
      [(UIView *)self bounds];
      double v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
      updatedTargetWrapper = self->_updatedTargetWrapper;
      self->_updatedTargetWrapper = v9;

      id v11 = [(_UIPlatterContainerView *)self platterContentView];
      [v11 addSubview:self->_updatedTargetWrapper];
    }
    [(_UIPlatterContainerView *)self _updateTransforms];
  }
}

- (void)setUpdatedTarget:(id)a3
{
  CGAffineTransform v5 = (_UIPlatterView *)a3;
  p_updatedTarget = &self->_updatedTarget;
  updatedTarget = self->_updatedTarget;
  if (updatedTarget != v5) {
    [(UIView *)updatedTarget removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_updatedTarget, a3);
  if (*p_updatedTarget)
  {
    [(UIView *)*p_updatedTarget bounds];
    CGFloat v9 = v8;
    rect.origin.CGFloat x = v8;
    rect.origin.CGFloat y = v10;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(UIView *)self->_updatedTargetWrapper bounds];
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
    double v19 = CGRectGetWidth(v32);
    v33.origin.CGFloat x = v9;
    v33.origin.CGFloat y = v12;
    v33.size.CGFloat width = v14;
    v33.size.CGFloat height = rect.origin.y;
    CGFloat v20 = v19 / CGRectGetWidth(v33);
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double v21 = CGRectGetHeight(v34);
    v35.origin.CGFloat x = rect.origin.x;
    v35.origin.CGFloat y = v12;
    v35.size.CGFloat width = v14;
    v35.size.CGFloat height = rect.origin.y;
    CGFloat v22 = CGRectGetHeight(v35);
    CGAffineTransformMakeScale(&v31, v20, v21 / v22);
    v23 = *p_updatedTarget;
    rect.size = *(CGSize *)&v31.a;
    long long v29 = *(_OWORD *)&v31.c;
    long long v30 = *(_OWORD *)&v31.tx;
    [(UIView *)v23 setTransform:&rect.size];
    [(UIView *)self->_updatedTargetWrapper bounds];
    -[UIView setCenter:](*p_updatedTarget, "setCenter:", v25 + v24 * 0.5, v27 + v26 * 0.5);
    [(UIView *)self->_updatedTargetWrapper addSubview:*p_updatedTarget];
    [(_UIPlatterContainerView *)self _updateTransforms];
  }
}

- (void)_updateTransforms
{
  [(UIView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(_UIPlatterContainerView *)self source];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v62 = v14;
  CGFloat rect = v12;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v71.origin.CGFloat x = v4;
  v71.origin.CGFloat y = v6;
  CGFloat v19 = v6;
  double v59 = v6;
  v71.size.CGFloat width = v8;
  double v20 = v8;
  v71.size.CGFloat height = v10;
  CGFloat v21 = v10;
  double v61 = v10;
  double Width = CGRectGetWidth(v71);
  v72.origin.CGFloat x = v13;
  v72.origin.CGFloat y = v16;
  v72.size.CGFloat width = v18;
  v72.size.CGFloat height = v62;
  CGFloat v23 = Width / CGRectGetWidth(v72);
  v73.origin.CGFloat x = v4;
  v73.origin.CGFloat y = v19;
  v73.size.CGFloat width = v20;
  v73.size.CGFloat height = v21;
  double Height = CGRectGetHeight(v73);
  v74.origin.CGFloat x = rect;
  v74.origin.CGFloat y = v16;
  v74.size.CGFloat width = v18;
  v74.size.CGFloat height = v62;
  CGFloat v25 = CGRectGetHeight(v74);
  CGAffineTransformMakeScale(&v70, v23, Height / v25);
  double v26 = [(_UIPlatterContainerView *)self source];
  CGAffineTransform v69 = v70;
  [v26 setTransform:&v69];

  double v63 = v4 + v20 * 0.5;
  CGFloat rect = v59 + v61 * 0.5;
  double v27 = [(_UIPlatterContainerView *)self source];
  objc_msgSend(v27, "setCenter:", v63, rect);

  v28 = [(_UIPlatterContainerView *)self target];
  [v28 bounds];
  CGFloat v30 = v29;
  CGFloat v55 = v31;
  CGFloat v57 = v29;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  v75.origin.CGFloat x = v4;
  CGFloat v36 = v4;
  CGFloat v60 = v4;
  v75.origin.CGFloat y = v59;
  v75.size.CGFloat width = v20;
  v75.size.CGFloat height = v61;
  double v37 = CGRectGetWidth(v75);
  v76.origin.CGFloat x = v30;
  v76.origin.CGFloat y = v33;
  v76.size.CGFloat width = v35;
  v76.size.CGFloat height = v55;
  CGFloat v38 = v37 / CGRectGetWidth(v76);
  v77.origin.CGFloat x = v36;
  v77.origin.CGFloat y = v59;
  v77.size.CGFloat width = v20;
  v77.size.CGFloat height = v61;
  double v39 = CGRectGetHeight(v77);
  v78.origin.CGFloat x = v57;
  v78.origin.CGFloat y = v33;
  v78.size.CGFloat width = v35;
  v78.size.CGFloat height = v55;
  CGFloat v40 = CGRectGetHeight(v78);
  CGAffineTransformMakeScale(&v68, v38, v39 / v40);
  v41 = [(_UIPlatterContainerView *)self target];
  CGAffineTransform v67 = v68;
  [v41 setTransform:&v67];

  v42 = [(_UIPlatterContainerView *)self target];
  objc_msgSend(v42, "setCenter:", v63, rect);

  [(UIView *)self->_updatedTargetWrapper bounds];
  CGFloat v44 = v43;
  CGFloat v56 = v45;
  CGFloat v58 = v43;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  v79.origin.CGFloat x = v60;
  v79.origin.CGFloat y = v59;
  v79.size.CGFloat width = v20;
  v79.size.CGFloat height = v61;
  double v50 = CGRectGetWidth(v79);
  v80.origin.CGFloat x = v44;
  v80.origin.CGFloat y = v47;
  v80.size.CGFloat width = v49;
  v80.size.CGFloat height = v56;
  CGFloat v51 = v50 / CGRectGetWidth(v80);
  v81.origin.CGFloat x = v60;
  v81.origin.CGFloat y = v59;
  v81.size.CGFloat width = v20;
  v81.size.CGFloat height = v61;
  double v52 = CGRectGetHeight(v81);
  v82.origin.CGFloat x = v58;
  v82.origin.CGFloat y = v47;
  v82.size.CGFloat width = v49;
  v82.size.CGFloat height = v56;
  CGFloat v53 = CGRectGetHeight(v82);
  CGAffineTransformMakeScale(&v66, v51, v52 / v53);
  updatedTargetWrapper = self->_updatedTargetWrapper;
  CGAffineTransform rect_8 = v66;
  [(UIView *)updatedTargetWrapper setTransform:&rect_8];
  -[UIView setCenter:](self->_updatedTargetWrapper, "setCenter:", v63, rect);
}

- (_UIPlatterView)source
{
  return self->_source;
}

- (_UIPlatterView)target
{
  return self->_target;
}

- (_UIPlatterView)updatedTarget
{
  return self->_updatedTarget;
}

- (UIView)platterContentView
{
  return self->_platterContentView;
}

- (void)setPlatterContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterContentView, 0);
  objc_storeStrong((id *)&self->_updatedTarget, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_updatedTargetWrapper, 0);
}

@end