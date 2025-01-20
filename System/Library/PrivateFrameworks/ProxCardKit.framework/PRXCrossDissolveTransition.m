@interface PRXCrossDissolveTransition
- (CGSize)maxSize;
- (double)transitionDuration:(id)a3;
- (id)additionalAnimations;
- (int64_t)cardStyle;
- (void)animateTransition:(id)a3;
- (void)setAdditionalAnimations:(id)a3;
- (void)setCardStyle:(int64_t)a3;
- (void)setMaxSize:(CGSize)a3;
@end

@implementation PRXCrossDissolveTransition

- (void)animateTransition:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = PRXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PRXCrossDissolveTransition animateTransition:](v6);
  }

  v7 = [v4 viewControllerForKey:*MEMORY[0x263F1D7B0]];
  int v8 = objc_opt_respondsToSelector() & 1;
  v9 = [v4 viewForKey:*MEMORY[0x263F1D7B8]];
  v10 = [v4 viewForKey:*MEMORY[0x263F1D7A8]];
  v11 = [v10 snapshotViewAfterScreenUpdates:0];
  [v5 addSubview:v11];
  [v9 setAlpha:0.0];
  [v5 addSubview:v9];
  v12 = (void *)MEMORY[0x263F1CB60];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __48__PRXCrossDissolveTransition_animateTransition___block_invoke;
  v69[3] = &unk_264418170;
  id v13 = v9;
  id v70 = v13;
  [v12 performWithoutAnimation:v69];
  uint64_t v14 = [(PRXCrossDissolveTransition *)self cardStyle];
  v15 = [v7 traitCollection];
  double v16 = PRXCardPreferredSize(v14, objc_msgSend(v15, "prx_cardSizeClass"));
  double v18 = v17;

  [v7 preferredContentSize];
  if (v18 >= v19) {
    double v20 = v18;
  }
  else {
    double v20 = v19;
  }
  double v21 = *MEMORY[0x263F001A8];
  double v22 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(PRXCrossDissolveTransition *)self maxSize];
  if (v23 >= v16) {
    double v24 = v16;
  }
  else {
    double v24 = v23;
  }
  [(PRXCrossDissolveTransition *)self maxSize];
  if (v25 < v20) {
    double v20 = v25;
  }
  v26 = PRXDefaultLog();
  v52 = v10;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v75.origin.x = v21;
    v75.origin.y = v22;
    v75.size.width = v24;
    v75.size.height = v20;
    v48 = NSStringFromCGRect(v75);
    *(_DWORD *)buf = 138412290;
    v73 = v48;
    _os_log_debug_impl(&dword_21C6D2000, v26, OS_LOG_TYPE_DEBUG, "Animating to %@", buf, 0xCu);
  }
  objc_msgSend(v13, "setFrame:", v21, v22, v24, v20);
  [v13 intrinsicContentSize];
  if (v27 == *MEMORY[0x263F1D7C8])
  {
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v49 = (void *)MEMORY[0x263F08938];
    v28 = [v13 widthAnchor];
    [v28 constraintEqualToConstant:v16];
    v29 = int v51 = v8;
    v71[0] = v29;
    [v13 heightAnchor];
    id v50 = v4;
    v30 = v7;
    v31 = self;
    v33 = v32 = v5;
    [v33 constraintGreaterThanOrEqualToConstant:v18];
    v35 = v34 = v11;
    v71[1] = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
    [v49 activateConstraints:v36];

    v11 = v34;
    v5 = v32;
    self = v31;
    v7 = v30;
    id v4 = v50;

    int v8 = v51;
  }
  v37 = (void *)MEMORY[0x263F1CB60];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3;
  v67[3] = &unk_264418170;
  id v38 = v13;
  id v68 = v38;
  [v37 performWithoutAnimation:v67];
  [(PRXCrossDissolveTransition *)self transitionDuration:v4];
  double v40 = v39;
  if (v8) {
    [v7 setTransitioningSize:1];
  }
  v41 = (void *)MEMORY[0x263F1CB60];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __48__PRXCrossDissolveTransition_animateTransition___block_invoke_2;
  v60[3] = &unk_2644181C0;
  id v61 = v38;
  id v42 = v5;
  id v62 = v42;
  double v63 = v21;
  double v64 = v22;
  double v65 = v24;
  double v66 = v20;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3;
  v53[3] = &unk_2644181E8;
  id v43 = v11;
  id v54 = v43;
  id v44 = v52;
  id v55 = v44;
  id v45 = v61;
  id v56 = v45;
  char v59 = v8;
  id v46 = v7;
  id v57 = v46;
  id v47 = v4;
  id v58 = v47;
  [v41 transitionWithView:v42 duration:0 options:v60 animations:v53 completion:v40];
  if (self->_additionalAnimations) {
    objc_msgSend(MEMORY[0x263F1CB60], "animateWithDuration:animations:", v40);
  }
}

uint64_t __48__PRXCrossDissolveTransition_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

{
  NSObject *v2;

  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) setNeedsLayout];
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 56) setTransitioningSize:0];
  }
  v2 = PRXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3_cold_1(v2);
  }

  return [*(id *)(a1 + 64) completeTransition:1];
}

uint64_t __48__PRXCrossDissolveTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  v6 = *(void **)(a1 + 40);
  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

- (double)transitionDuration:(id)a3
{
  return 0.35;
}

- (id)additionalAnimations
{
  return self->_additionalAnimations;
}

- (void)setAdditionalAnimations:(id)a3
{
}

- (int64_t)cardStyle
{
  return self->_cardStyle;
}

- (void)setCardStyle:(int64_t)a3
{
  self->_cardStyle = a3;
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (void).cxx_destruct
{
}

- (void)animateTransition:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21C6D2000, log, OS_LOG_TYPE_DEBUG, "Beginning animation", v1, 2u);
}

void __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21C6D2000, log, OS_LOG_TYPE_DEBUG, "Finished animating", v1, 2u);
}

@end