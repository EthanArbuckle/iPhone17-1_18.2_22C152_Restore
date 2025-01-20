@interface PUPickerBannerView
- (BOOL)_animatingStackView;
- (CGRect)_frameReversedIfRightToLeft:(BOOL)a3 frame:(CGRect)a4 bounds:(CGRect)a5;
- (NSArray)images;
- (NSString)title;
- (PUPickerBannerView)initWithFrame:(CGRect)a3;
- (PUStackView)_stackView;
- (UILabel)_label;
- (UIView)leftView;
- (UIView)rightView;
- (id)_animationCompletionHandler;
- (int64_t)_alignment;
- (unint64_t)style;
- (void)_setAlignment:(int64_t)a3;
- (void)_setAnimatingStackView:(BOOL)a3;
- (void)_setAnimationCompletionHandler:(id)a3;
- (void)_setLabel:(id)a3;
- (void)_setStackView:(id)a3;
- (void)_updateAlignment;
- (void)_updateLabel;
- (void)_updateStackView;
- (void)animateImagesOntoView:(id)a3 inContainerView:(id)a4 completionHandler:(id)a5;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)setImages:(id)a3;
- (void)setLeftView:(id)a3;
- (void)setLeftView:(id)a3 animated:(BOOL)a4;
- (void)setRightView:(id)a3;
- (void)setRightView:(id)a3 animated:(BOOL)a4;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation PUPickerBannerView

- (void).cxx_destruct
{
  objc_storeStrong(&self->__animationCompletionHandler, 0);
  objc_storeStrong((id *)&self->__stackView, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

- (void)_setAnimationCompletionHandler:(id)a3
{
}

- (id)_animationCompletionHandler
{
  return self->__animationCompletionHandler;
}

- (BOOL)_animatingStackView
{
  return self->__animatingStackView;
}

- (void)_setStackView:(id)a3
{
}

- (PUStackView)_stackView
{
  return self->__stackView;
}

- (void)_setLabel:(id)a3
{
}

- (UILabel)_label
{
  return self->__label;
}

- (int64_t)_alignment
{
  return self->__alignment;
}

- (UIView)rightView
{
  return self->_rightView;
}

- (UIView)leftView
{
  return self->_leftView;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)images
{
  return self->_images;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(PUPickerBannerView *)self _animationCompletionHandler];

  if (v6)
  {
    v7 = [(PUPickerBannerView *)self _animationCompletionHandler];
    v7[2](v7, v4);

    [(PUPickerBannerView *)self _setAnimationCompletionHandler:0];
  }
}

- (void)animateImagesOntoView:(id)a3 inContainerView:(id)a4 completionHandler:(id)a5
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8 && v9)
  {
    v12 = [(PUPickerBannerView *)self _stackView];
    v13 = [v12 snapshotView];
    [v12 bounds];
    v74 = self;
    objc_msgSend(v12, "convertRect:toView:", v9);
    v77 = v13;
    objc_msgSend(v13, "setFrame:");
    [v9 addSubview:v13];
    [(PUPickerBannerView *)self _setAnimatingStackView:1];
    id v14 = v8;
    UIAnimationDragCoefficient();
    double v16 = v15 * 0.5;
    UIAnimationDragCoefficient();
    double v18 = v17 * 0.2;
    uint64_t v19 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    v81 = (void *)v19;
    uint64_t v20 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    uint64_t v21 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    v78 = v12;
    [v12 center];
    double v23 = v22;
    double v25 = v24;
    v26 = [v12 superview];
    objc_msgSend(v9, "convertPoint:fromView:", v26, v23, v25);
    double v28 = v27;
    double v30 = v29;

    v76 = v14;
    [v14 center];
    double v32 = v31;
    double v34 = v33;
    v35 = [v14 superview];
    objc_msgSend(v9, "convertPoint:fromView:", v35, v32, v34);
    double v37 = v36;
    double v39 = v38;

    if (v30 >= v39) {
      double v40 = v39;
    }
    else {
      double v40 = v30;
    }
    double v41 = v40 + -50.0;
    double v42 = v28 + (v37 - v28) * 0.5;
    [v9 bounds];
    double MidX = CGRectGetMidX(v93);
    if (vabdd_f64(v37, v28) < vabdd_f64(v37, MidX)) {
      double v42 = MidX;
    }
    v44 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v44, "moveToPoint:", v28, v30);
    objc_msgSend(v44, "addQuadCurveToPoint:controlPoint:", v37, v39, v42, v41);
    v45 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position"];
    id v75 = v44;
    objc_msgSend(v45, "setPath:", objc_msgSend(v75, "CGPath"));
    [v45 setKeyTimes:&unk_1F078B3F0];
    v92[0] = v19;
    id v79 = v9;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:1];
    [v45 setTimingFunctions:v46];

    v47 = v45;
    v72 = v45;
    [v45 setDuration:v16];
    v48 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale"];
    [v48 setValues:&unk_1F078B408];
    [v48 setKeyTimes:&unk_1F078B420];
    v49 = (void *)v20;
    v91[0] = v20;
    v91[1] = v21;
    uint64_t v50 = v21;
    v69 = (void *)v21;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
    v51 = id v80 = v8;
    [v48 setTimingFunctions:v51];

    v71 = v48;
    [v48 setDuration:v16];
    v52 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.rotation.z"];
    [v52 setValues:&unk_1F078B438];
    [v52 setKeyTimes:&unk_1F078B450];
    v90 = v49;
    v73 = v49;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
    [v52 setTimingFunctions:v53];

    v70 = v52;
    [v52 setDuration:v16];
    v54 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v54 setValues:&unk_1F078B468];
    [v54 setKeyTimes:&unk_1F078B480];
    v89 = v49;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
    [v54 setTimingFunctions:v55];

    v56 = v54;
    [v54 setDuration:v16];
    v57 = [MEMORY[0x1E4F39B38] animation];
    [v57 setDuration:v16];
    [v57 setRemovedOnCompletion:0];
    [v57 setFillMode:*MEMORY[0x1E4F39FA8]];
    v88[0] = v47;
    v88[1] = v48;
    v88[2] = v52;
    v88[3] = v56;
    v58 = v56;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:4];
    [v57 setAnimations:v59];

    v60 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale"];
    [v60 setBeginTime:v16];
    [v60 setDuration:v18];
    [v60 setValues:&unk_1F078B498];
    [v60 setKeyTimes:&unk_1F078B4B0];
    v87[0] = v81;
    v87[1] = v50;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
    [v60 setTimingFunctions:v61];

    v62 = [MEMORY[0x1E4F39B38] animation];
    [v62 setDuration:v16 + v18];
    [v62 setRemovedOnCompletion:1];
    [v62 setFillMode:*MEMORY[0x1E4F39FB0]];
    v86 = v60;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
    [v62 setAnimations:v63];

    [v62 setDelegate:v74];
    v64 = +[PUInterfaceManager beginDisablingUserInteractionForReason:3];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __78__PUPickerBannerView_animateImagesOntoView_inContainerView_completionHandler___block_invoke;
    v82[3] = &unk_1E5F2AFC8;
    id v83 = v77;
    id v84 = v64;
    id v85 = v11;
    id v65 = v64;
    id v66 = v77;
    [(PUPickerBannerView *)v74 _setAnimationCompletionHandler:v82];
    v67 = [v66 layer];
    [v67 addAnimation:v57 forKey:@"jumpAndLandAnimation"];

    v68 = [v76 layer];

    [v68 addAnimation:v62 forKey:@"jumpAndLandAnimation"];
    id v9 = v79;

    id v8 = v80;
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
}

uint64_t __78__PUPickerBannerView_animateImagesOntoView_inContainerView_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  +[PUInterfaceManager endDisablingUserInteraction:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateLabel
{
  id v4 = [(PUPickerBannerView *)self title];
  v3 = [(PUPickerBannerView *)self _label];
  [v3 setText:v4];

  [(PUPickerBannerView *)self setNeedsLayout];
}

- (void)_updateStackView
{
  id v8 = [(PUPickerBannerView *)self images];
  v3 = [(PUPickerBannerView *)self _stackView];
  uint64_t v4 = +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", [v3 style]);
  unint64_t v5 = [v8 count];
  if (v4 >= v5) {
    uint64_t v4 = v5;
  }
  [v3 setNumberOfVisibleItems:v4];
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [v8 objectAtIndex:i];
      [v7 size];
      objc_msgSend(v3, "setImageSize:forItemAtIndex:", i);
      [v3 setImage:v7 forItemAtIndex:i];
    }
  }
  [(PUPickerBannerView *)self setNeedsLayout];
}

- (void)_updateAlignment
{
  [(PUPickerBannerView *)self _setAlignment:self->_style == 2];
}

- (void)_setAlignment:(int64_t)a3
{
  if (self->__alignment != a3)
  {
    self->__alignment = a3;
    [(PUPickerBannerView *)self setNeedsLayout];
  }
}

- (void)_setAnimatingStackView:(BOOL)a3
{
  if (self->__animatingStackView != a3)
  {
    self->__animatingStackView = a3;
    [(PUPickerBannerView *)self setNeedsLayout];
  }
}

- (void)setRightView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (UIView *)a3;
  rightView = self->_rightView;
  if (rightView != v7)
  {
    id v9 = rightView;
    objc_storeStrong((id *)&self->_rightView, a3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PUPickerBannerView_setRightView_animated___block_invoke;
    aBlock[3] = &unk_1E5F2E908;
    id v10 = v9;
    id v14 = v10;
    float v15 = self;
    double v16 = v7;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    if (v4)
    {
      [(PUPickerBannerView *)self layoutSubviews];
      [MEMORY[0x1E4FB1EB0] transitionWithView:self duration:5242880 options:v12 animations:0 completion:0.3];
    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }
  }
}

uint64_t __44__PUPickerBannerView_setRightView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 addSubview:v3];
}

- (void)setRightView:(id)a3
{
}

- (void)setLeftView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (UIView *)a3;
  leftView = self->_leftView;
  if (leftView != v7)
  {
    id v9 = leftView;
    objc_storeStrong((id *)&self->_leftView, a3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__PUPickerBannerView_setLeftView_animated___block_invoke;
    aBlock[3] = &unk_1E5F2E908;
    id v10 = v9;
    id v14 = v10;
    float v15 = self;
    double v16 = v7;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    if (v4)
    {
      [(PUPickerBannerView *)self layoutSubviews];
      [MEMORY[0x1E4FB1EB0] transitionWithView:self duration:5242880 options:v12 animations:0 completion:0.3];
    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }
  }
}

uint64_t __43__PUPickerBannerView_setLeftView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 addSubview:v3];
}

- (void)setLeftView:(id)a3
{
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    BOOL v4 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v4;

    [(PUPickerBannerView *)self _updateLabel];
  }
}

- (void)setImages:(id)a3
{
  if (self->_images != a3)
  {
    BOOL v4 = (NSArray *)[a3 copy];
    images = self->_images;
    self->_images = v4;

    [(PUPickerBannerView *)self _updateStackView];
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PUPickerBannerView *)self _updateAlignment];
  }
}

- (CGRect)_frameReversedIfRightToLeft:(BOOL)a3 frame:(CGRect)a4 bounds:(CGRect)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  if (a3)
  {
    double MaxX = CGRectGetMaxX(a5);
    v14.origin.double x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    double x = MaxX - CGRectGetWidth(v14) - x;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)layoutSubviews
{
  BOOL v4 = [(PUPickerBannerView *)self _stackView];
  uint64_t v5 = [v4 numberOfVisibleItems];
  v6 = [(PUPickerBannerView *)self _label];
  [v4 frame];
  CGFloat v8 = v7;
  slice.origin.double x = v7;
  slice.origin.double y = v9;
  CGFloat rect = v9;
  slice.size.double width = v10;
  slice.size.double height = v11;
  [v6 frame];
  CGFloat v92 = v12;
  CGFloat v93 = v13;
  remainder.origin.double x = v12;
  remainder.origin.double y = v13;
  remainder.size.double width = v14;
  remainder.size.double height = v15;
  [(PUPickerBannerView *)self bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(PUPickerBannerView *)self safeAreaInsets];
  double v25 = v17 + v24;
  double v27 = v19 + v26;
  double v29 = v21 - (v24 + v28);
  double v31 = v23 - (v26 + v30);
  double v32 = [(PUPickerBannerView *)self leftView];
  double v33 = [(PUPickerBannerView *)self rightView];
  [v32 center];
  double v35 = v34;
  double v37 = v36;
  [v33 center];
  double v97 = v38;
  double v40 = v39;
  if (v32)
  {
    [v32 frame];
    double v41 = CGRectGetWidth(v100) + 14.0;
    v101.origin.double x = v25;
    v101.origin.double y = v27;
    v101.size.double width = v29;
    v101.size.double height = v31;
    CGRectGetMinX(v101);
    UIRoundToViewScale();
    double v95 = v42;
    v102.origin.double x = v25;
    v102.origin.double y = v27;
    v102.size.double width = v29;
    v102.size.double height = v31;
    CGRectGetMidY(v102);
    UIRoundToViewScale();
    double v37 = v43;
    double v44 = fmax(v41, 0.0);
  }
  else
  {
    double v95 = v35;
    double v44 = 0.0;
  }
  double v96 = v37;
  if (v33)
  {
    [v33 frame];
    double v45 = CGRectGetWidth(v103) + 14.0;
    v104.origin.double x = v25;
    v104.origin.double y = v27;
    v104.size.double width = v29;
    v104.size.double height = v31;
    CGRectGetMaxX(v104);
    UIRoundToViewScale();
    double v97 = v46;
    v105.origin.double x = v25;
    v105.origin.double y = v27;
    v105.size.double width = v29;
    v105.size.double height = v31;
    CGRectGetMidY(v105);
    UIRoundToViewScale();
    double v40 = v47;
    if (v44 < v45) {
      double v44 = v45;
    }
  }
  v106.origin.double x = v25;
  v106.origin.double y = v27;
  v106.size.double width = v29;
  v106.size.double height = v31;
  CGRect v107 = CGRectInset(v106, v44, 0.0);
  double x = v107.origin.x;
  double y = v107.origin.y;
  double width = v107.size.width;
  double height = v107.size.height;
  int64_t v52 = [(PUPickerBannerView *)self _alignment];
  int64_t v53 = v52;
  if (v52 == 1)
  {
    double v57 = x;
    double v58 = y;
    double v59 = width;
    double v60 = height;
    if (v5)
    {
      CGFloat v61 = CGRectGetHeight(*(CGRect *)&v57);
      slice.size.double width = v61;
      slice.size.double height = v61;
      v110.origin.double x = x;
      v110.origin.double y = y;
      v110.size.double width = width;
      v110.size.double height = height;
      CGFloat v62 = CGRectGetWidth(v110) + -10.0;
      v111.origin.double x = v8;
      v111.origin.double y = rect;
      v111.size.double width = v61;
      v111.size.double height = v61;
      double v63 = v62 - CGRectGetWidth(v111);
      objc_msgSend(v6, "sizeThatFits:", v63, 0.0);
      if (v64 < v63) {
        double v63 = v64;
      }
      remainder.size.double width = v63;
      v112.origin.double x = x;
      v112.origin.double y = y;
      v112.size.double width = width;
      v112.size.double height = height;
      remainder.size.double height = CGRectGetHeight(v112);
      v113.origin.double x = x;
      v113.origin.double y = y;
      v113.size.double width = width;
      v113.size.double height = height;
      CGFloat MidX = CGRectGetMidX(v113);
      v114.origin.double x = v8;
      v114.origin.double y = rect;
      v114.size.double width = v61;
      v114.size.double height = v61;
      CGRectGetWidth(v114);
      v115.origin.double x = v92;
      v115.origin.double y = v93;
      v115.size.double width = v63;
      v115.size.double height = remainder.size.height;
      CGRectGetWidth(v115);
      UIRoundToViewScale();
      CGFloat v66 = v65;
      slice.origin.double x = v65;
      v116.origin.double x = x;
      v116.origin.double y = y;
      v116.size.double width = width;
      v116.size.double height = height;
      v117.origin.double y = CGRectGetMinY(v116);
      slice.origin.double y = v117.origin.y;
      v117.origin.double x = v66;
      v117.size.double width = v61;
      v117.size.double height = v61;
      double v67 = CGRectGetMaxX(v117) + 10.0;
    }
    else
    {
      double v69 = CGRectGetWidth(*(CGRect *)&v57);
      objc_msgSend(v6, "sizeThatFits:", v69, 0.0);
      if (v70 < v69) {
        double v69 = v70;
      }
      remainder.size.double width = v69;
      v118.origin.double x = x;
      v118.origin.double y = y;
      v118.size.double width = width;
      v118.size.double height = height;
      remainder.size.double height = CGRectGetHeight(v118);
      v119.origin.double x = x;
      v119.origin.double y = y;
      v119.size.double width = width;
      v119.size.double height = height;
      CGRectGetMidX(v119);
      v120.origin.double x = v92;
      v120.origin.double y = v93;
      v120.size.double width = v69;
      v120.size.double height = remainder.size.height;
      CGRectGetWidth(v120);
      UIRoundToViewScale();
    }
    remainder.origin.double x = v67;
    v121.origin.double x = x;
    v121.origin.double y = y;
    v121.size.double width = width;
    v121.size.double height = height;
    remainder.origin.double y = CGRectGetMinY(v121);
  }
  else
  {
    if (!v52)
    {
      double v54 = v95;
      double v55 = v96;
      if (v5)
      {
        v108.origin.double x = x;
        v108.origin.double y = y;
        v108.size.double width = width;
        v108.size.double height = height;
        CGFloat v56 = CGRectGetHeight(v108);
        v109.origin.double x = x;
        v109.origin.double y = y;
        v109.size.double width = width;
        v109.size.double height = height;
        CGRectDivide(v109, &slice, &remainder, v56, CGRectMinXEdge);
        CGRect remainder = CGRectInset(remainder, 10.0, 0.0);
      }
      else
      {
        remainder.origin.double x = x;
        remainder.origin.double y = y;
        remainder.size.double width = width;
        remainder.size.double height = height;
      }
      goto LABEL_22;
    }
    v68 = [MEMORY[0x1E4F28B00] currentHandler];
    [v68 handleFailureInMethod:a2 object:self file:@"PUPickerBannerView.m" lineNumber:125 description:@"Alignment not implemented."];
  }
  double v54 = v95;
  double v55 = v96;
LABEL_22:
  BOOL v71 = [(PUPickerBannerView *)self _animatingStackView];
  if (v5) {
    uint64_t v72 = v71;
  }
  else {
    uint64_t v72 = 1;
  }
  BOOL v73 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUPickerBannerView semanticContentAttribute](self, "semanticContentAttribute")) == 1;
  objc_msgSend(v32, "setCenter:", v54, v55);
  [v32 frame];
  -[PUPickerBannerView _frameReversedIfRightToLeft:frame:bounds:](self, "_frameReversedIfRightToLeft:frame:bounds:", v73);
  objc_msgSend(v32, "setFrame:", PURoundRectToPixel(v74, v75, v76, v77));
  objc_msgSend(v33, "setCenter:", v97, v40);
  [v33 frame];
  -[PUPickerBannerView _frameReversedIfRightToLeft:frame:bounds:](self, "_frameReversedIfRightToLeft:frame:bounds:", v73);
  objc_msgSend(v33, "setFrame:", PURoundRectToPixel(v78, v79, v80, v81));
  [v4 setHidden:v72];
  -[PUPickerBannerView _frameReversedIfRightToLeft:frame:bounds:](self, "_frameReversedIfRightToLeft:frame:bounds:", v73, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, x, y, width, height);
  slice.origin.double x = v82;
  slice.origin.double y = v83;
  slice.size.double width = v84;
  slice.size.double height = v85;
  objc_msgSend(v4, "setFrame:");
  if (v53) {
    uint64_t v86 = v53;
  }
  else {
    uint64_t v86 = 4;
  }
  [v6 setTextAlignment:v86];
  -[PUPickerBannerView _frameReversedIfRightToLeft:frame:bounds:](self, "_frameReversedIfRightToLeft:frame:bounds:", v73, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, x, y, width, height);
  remainder.origin.double x = v87;
  remainder.origin.double y = v88;
  remainder.size.double width = v89;
  remainder.size.double height = v90;
  objc_msgSend(v6, "setFrame:");
}

- (PUPickerBannerView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PUPickerBannerView;
  uint64_t v3 = -[PUPickerBannerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    BOOL v4 = +[PUInterfaceManager currentTheme];
    uint64_t v5 = [PUStackView alloc];
    [(PUPickerBannerView *)v3 bounds];
    v6 = -[PUStackView initWithFrame:](v5, "initWithFrame:");
    [v4 configureBannerStackView:v6];
    [(PUPickerBannerView *)v3 addSubview:v6];
    [(PUPickerBannerView *)v3 _setStackView:v6];
    id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUPickerBannerView *)v3 bounds];
    CGFloat v8 = objc_msgSend(v7, "initWithFrame:");
    [v4 configureBannerLabel:v8];
    [(PUPickerBannerView *)v3 addSubview:v8];
    [(PUPickerBannerView *)v3 _setLabel:v8];
    CGFloat v9 = [v4 bannerBackgroundColor];
    [(PUPickerBannerView *)v3 setBackgroundColor:v9];
  }
  return v3;
}

@end