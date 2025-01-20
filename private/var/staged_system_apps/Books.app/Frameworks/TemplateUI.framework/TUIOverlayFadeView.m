@interface TUIOverlayFadeView
+ (id)renderModelWithIdentifier:(id)a3 size:(CGSize)a4 content:(id)a5 contentOrigin:(CGPoint)a6 contentErasableInsets:(UIEdgeInsets)a7 overlay:(id)a8 overlayOrigin:(CGPoint)a9 padding:(double)a10 gradientWidth:(double)a11 layoutDirection:(unint64_t)a12;
- (TUIViewFactory)factory;
- (void)_updateGeometry;
- (void)_updateSubviews;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureWithModel:(id)a3;
- (void)layoutSubviews;
- (void)setFactory:(id)a3;
- (void)viewDidEndDisplay;
@end

@implementation TUIOverlayFadeView

+ (id)renderModelWithIdentifier:(id)a3 size:(CGSize)a4 content:(id)a5 contentOrigin:(CGPoint)a6 contentErasableInsets:(UIEdgeInsets)a7 overlay:(id)a8 overlayOrigin:(CGPoint)a9 padding:(double)a10 gradientWidth:(double)a11 layoutDirection:(unint64_t)a12
{
  CGFloat x = a9.x;
  double bottom = a7.bottom;
  double right = a7.right;
  double left = a7.left;
  double top = a7.top;
  double y = a6.y;
  double v16 = a6.x;
  double height = a4.height;
  double width = a4.width;
  id v21 = a8;
  id v22 = a5;
  id v23 = a3;
  v24 = -[_TUIOverlayFadeRenderModel initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:]([_TUIOverlayFadeRenderModel alloc], "initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:", v23, v22, v21, *(void *)&x, width, height, v16, y, top, left, bottom, right, *(void *)&a10, *(void *)&a11, v29, v30);

  return v24;
}

- (void)applyLayoutAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUIOverlayFadeView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v6 applyLayoutAttributes:v4];
  v5 = [v4 renderModel];

  [(TUIOverlayFadeView *)self configureWithModel:v5];
}

- (void)configureWithModel:(id)a3
{
  v5 = (_TUIOverlayFadeRenderModel *)a3;
  if (self->_model == v5)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_6;
    }
    *(unsigned char *)&self->_flags |= 1u;
    objc_super v6 = v5;
    [(TUIOverlayFadeView *)self setNeedsLayout];
  }
  else
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_model, a3);
    [(TUIOverlayFadeView *)self _updateSubviews];
  }
  v5 = v6;
LABEL_6:
}

- (void)_updateGeometry
{
  [(_TUIOverlayFadeRenderModel *)self->_model size];
  double v4 = v3;
  double v72 = v3;
  [(_TUIOverlayFadeRenderModel *)self->_model padding];
  double v6 = v5;
  [(_TUIOverlayFadeRenderModel *)self->_model gradientWidth];
  double v79 = v7;
  v8 = [(_TUIOverlayFadeRenderModel *)self->_model content];
  [v8 size];
  double v10 = v9;
  double rect = v9;

  v11 = [(_TUIOverlayFadeRenderModel *)self->_model overlay];
  [v11 size];
  double v13 = v12;

  [(_TUIOverlayFadeRenderModel *)self->_model contentErasableInsets];
  double v15 = v14;
  double v17 = v16;
  double v81 = v18;
  double v20 = v19;
  unint64_t v21 = [(_TUIOverlayFadeRenderModel *)self->_model layoutDirection];
  double v68 = v6;
  double v89 = v13;
  double v88 = v6 + v10;
  BOOL IsLessThanOrAlmostEqualFloat = TUICGFloatIsLessThanOrAlmostEqualFloat(v6 + v10 + v13, v4);
  double y = CGPointZero.y;
  [(_TUIOverlayFadeRenderModel *)self->_model size];
  double v87 = v24;
  v25 = [(_TUIOverlayFadeRenderModel *)self->_model content];
  [v25 size];
  double v27 = v26;
  double v29 = v28;

  double v30 = v17 + CGPointZero.x;
  double v31 = y;
  double v83 = v20;
  double v84 = v17;
  double v32 = v27 - (v17 + v20);
  double v85 = v15;
  double v82 = v15 + v81;
  CGFloat v69 = v29;
  double v70 = v10;
  double v75 = v29 - v82;
  double v77 = v15 + y;
  double MinX = v72 - v10;
  double v74 = y;
  if (!IsLessThanOrAlmostEqualFloat)
  {
    CGFloat v71 = v32;
    double v35 = 0.0;
    CGFloat v34 = v79;
    CGFloat v36 = v79;
    CGFloat v37 = y;
    CGFloat v38 = v87;
    if (v21 == 2) {
      goto LABEL_5;
    }
    CGFloat v52 = v30;
    v95.size.double width = v13;
    v95.origin.CGFloat x = v72 - v13;
    double v88 = v72 - v13;
    v95.origin.double y = v37;
    v95.size.double height = v87;
    double v51 = CGRectGetMinX(v95) - v79;
    v96.origin.CGFloat x = v51;
    v96.origin.double y = v37;
    v96.size.double width = v79;
    v96.size.double height = v87;
    double rect = CGRectGetMaxX(v96);
    double v32 = v71;
LABEL_12:
    v97.origin.CGFloat x = v51;
    v97.origin.double y = v37;
    v97.size.double width = v34;
    v97.size.double height = v38;
    double MaxX = CGRectGetMaxX(v97);
    v98.origin.CGFloat x = v52;
    v98.size.double height = v75;
    v98.origin.double y = v77;
    v98.size.double width = v32;
    double v53 = CGRectGetMaxX(v98);
    v99.origin.CGFloat x = v51;
    v99.origin.double y = v37;
    v99.size.double width = v34;
    v99.size.double height = v38;
    double MinX = 0.0;
    double v76 = v34;
    double v78 = fmax(v53 - CGRectGetMaxX(v99), 0.0);
    double v50 = 0.0;
    goto LABEL_14;
  }
  CGFloat v34 = v79;
  if (v21 != 2)
  {
    CGFloat v52 = v30;
    CGFloat v34 = 0.0;
    CGFloat v38 = v87;
    double v51 = v88;
    CGFloat v37 = v31;
    goto LABEL_12;
  }
  CGFloat v71 = v32;
  double v35 = MinX - v68 - v13;
  CGFloat v36 = 0.0;
  CGFloat v37 = y;
  CGFloat v38 = v87;
LABEL_5:
  double v39 = MinX + v30;
  double v88 = v35;
  CGFloat v40 = v37;
  double v41 = v13;
  CGFloat v42 = v38;
  CGFloat v43 = CGRectGetMaxX(*(CGRect *)&v35);
  CGFloat v44 = v43;
  if (!IsLessThanOrAlmostEqualFloat)
  {
    CGFloat v45 = v37;
    CGFloat v46 = v34;
    CGFloat v47 = v38;
    double rect = v72 - CGRectGetMinX(*(CGRect *)&v43);
    v91.origin.CGFloat x = v44;
    v91.origin.double y = v37;
    v91.size.double width = v34;
    v91.size.double height = v38;
    double MinX = CGRectGetMinX(v91);
  }
  v92.origin.CGFloat x = v39;
  v92.origin.double y = v77;
  v92.size.double width = v71;
  v92.size.double height = v75;
  double MaxX = CGRectGetMinX(v92);
  CGFloat v73 = v44;
  v93.origin.CGFloat x = v44;
  v93.origin.double y = v37;
  CGFloat v48 = v36;
  v93.size.double width = v36;
  v93.size.double height = v38;
  double v49 = CGRectGetMinX(v93);
  v94.origin.CGFloat x = v39;
  v94.origin.double y = v77;
  v94.size.double width = v71;
  v94.size.double height = v75;
  double v50 = 0.0;
  double v78 = fmax(v49 - CGRectGetMinX(v94), 0.0);
  if (IsLessThanOrAlmostEqualFloat)
  {
    double v76 = 0.0;
  }
  else
  {
    v100.size.double height = v69;
    v100.origin.CGFloat x = MinX;
    v100.origin.double y = v37;
    v100.size.double width = rect;
    double v50 = v70 - CGRectGetWidth(v100);
    double v76 = v48;
  }
  double v51 = v73;
LABEL_14:
  BOOL v54 = v21 == 2;
  BOOL v55 = v21 == 2;
  if (v54) {
    double v56 = 0.0;
  }
  else {
    double v56 = v84;
  }
  int v57 = v54 || IsLessThanOrAlmostEqualFloat;
  if (IsLessThanOrAlmostEqualFloat) {
    double v58 = v84;
  }
  else {
    double v58 = v56;
  }
  if (v57) {
    double v59 = v83;
  }
  else {
    double v59 = 0.0;
  }
  [(_TUIOverlayFadeRenderModel *)self->_model contentOrigin];
  double v61 = v60;
  v62 = [(_TUIOverlayFadeRenderModel *)self->_model content];
  [v62 size];
  double v64 = v63;

  double v65 = v85 + v61;
  double v66 = v64 - v82;
  -[UIView setFrame:](self->_content, "setFrame:", v58 + MinX, v65, rect - (v58 + v59), v66);
  -[UIView setBounds:](self->_content, "setBounds:", v58 + v50, v85, rect - (v58 + v59), v66);
  -[TUIOverlayFadeView convertRect:toView:](self, "convertRect:toView:", self->_content, v51, v65, v76, v66);
  -[_TUIOverlayFadeGradientView setFrame:](self->_gradient, "setFrame:");
  -[TUIOverlayFadeView convertRect:toView:](self, "convertRect:toView:", self->_content, MaxX, v65, v78, v66);
  -[UIView setFrame:](self->_gradientOverflow, "setFrame:");
  -[UIView setFrame:](self->_overlay, "setFrame:", v88, v74, v89, v87);
  gradient = self->_gradient;

  [(_TUIOverlayFadeGradientView *)gradient configureGradientWithAxis:1 leading:v55];
}

- (void)_updateSubviews
{
  if (!self->_content && !self->_overlay)
  {
    double v3 = (UIView *)objc_alloc_init((Class)UIView);
    content = self->_content;
    self->_content = v3;

    [(UIView *)self->_content setClipsToBounds:1];
    double v5 = (UIView *)objc_alloc_init((Class)UIView);
    overladouble y = self->_overlay;
    self->_overladouble y = v5;

    double v7 = objc_alloc_init(_TUIOverlayFadeGradientView);
    gradient = self->_gradient;
    self->_gradient = v7;

    double v9 = (UIView *)objc_alloc_init((Class)UIView);
    gradientOverflow = self->_gradientOverflow;
    self->_gradientOverflow = v9;

    v11 = +[UIColor blackColor];
    [(UIView *)self->_gradientOverflow setBackgroundColor:v11];

    uint64_t v12 = kCAFilterDestOut;
    double v13 = [(UIView *)self->_gradientOverflow layer];
    [v13 setCompositingFilter:v12];

    double v14 = [(_TUIOverlayFadeGradientView *)self->_gradient layer];
    [v14 setZPosition:10000.0];

    double v15 = [(_TUIOverlayFadeGradientView *)self->_gradient layer];
    [v15 setZPosition:10000.0];

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_B86A4;
    v38[3] = &unk_251990;
    v38[4] = self;
    +[UIView performWithoutAnimation:v38];
  }
  char v37 = 0;
  if (self->_model
    && (p_factordouble y = &self->_factory, v17 = objc_loadWeakRetained((id *)&self->_factory), v17, v17))
  {
    double v18 = [(TUIReusableBaseView *)self feedControllerHost];
    double v19 = [v18 renderOverrideProvider];
    double v20 = [v19 renderOverrides];

    if (v20)
    {
      unint64_t v21 = [(TUIReusableBaseView *)self tui_querySectionUUID];
      id v22 = [(TUIReusableBaseView *)self tui_querySectionUID];
    }
    else
    {
      id v22 = 0;
      unint64_t v21 = 0;
    }
    double v28 = [(_TUIOverlayFadeRenderModel *)self->_model content];
    id WeakRetained = objc_loadWeakRetained((id *)p_factory);
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    id v33 = [v28 configureSubviewsWithFactory:WeakRetained outsets:v20 host:self->_content overrides:v21 usedOverrides:v22 UUID:UIEdgeInsetsZero.top left:left bottom:bottom right:right];

    CGFloat v34 = [(_TUIOverlayFadeRenderModel *)self->_model overlay];
    id v35 = objc_loadWeakRetained((id *)p_factory);
    id v36 = [v34 configureSubviewsWithFactory:v35 outsets:self->_overlay host:v20 overrides:v37 usedOverrides:v21 UUID:v22 uid:UIEdgeInsetsZero.top, left, bottom, right];

    [(TUIOverlayFadeView *)self _updateGeometry];
    char v27 = 2 * v37;
  }
  else
  {
    id v23 = objc_loadWeakRetained((id *)&self->_factory);
    double v24 = [v23 subviewPool];
    [v24 prepareToReuseHost:self->_content];

    id v25 = objc_loadWeakRetained((id *)&self->_factory);
    double v26 = [v25 subviewPool];
    [v26 prepareToReuseHost:self->_overlay];

    char v27 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v27;
}

- (void)viewDidEndDisplay
{
  v8.receiver = self;
  v8.super_class = (Class)TUIOverlayFadeView;
  [(TUIReusableBaseView *)&v8 viewDidEndDisplay];
  model = self->_model;
  self->_model = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  double v5 = [WeakRetained subviewPool];
  [v5 prepareToReuseHost:self->_content];

  id v6 = objc_loadWeakRetained((id *)&self->_factory);
  double v7 = [v6 subviewPool];
  [v7 prepareToReuseHost:self->_overlay];
}

- (void)layoutSubviews
{
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)&self->_flags &= ~1u;
    [(TUIOverlayFadeView *)self _updateSubviews];
  }
  v3.receiver = self;
  v3.super_class = (Class)TUIOverlayFadeView;
  [(TUIOverlayFadeView *)&v3 layoutSubviews];
}

- (TUIViewFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  return (TUIViewFactory *)WeakRetained;
}

- (void)setFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_gradientOverflow, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end