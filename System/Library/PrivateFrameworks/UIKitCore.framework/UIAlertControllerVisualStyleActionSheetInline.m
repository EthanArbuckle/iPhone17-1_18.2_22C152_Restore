@interface UIAlertControllerVisualStyleActionSheetInline
+ (int64_t)interfaceActionPresentationStyle;
+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7;
- (BOOL)_shouldReverseActions;
- (BOOL)actionsReversed;
- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)placementAvoidsKeyboard;
- (BOOL)shouldOccludeDuringPresentation;
- (BOOL)shouldPreserveRespondersAcrossWindows;
- (BOOL)transitionOfType:(int64_t)a3 shouldBeInteractiveForAlertController:(id)a4;
- (CGRect)_sourceRectForAlertController:(id)a3 inContainerView:(id)a4;
- (UIView)headerView;
- (UIVisualEffectView)revealEffectView;
- (_UIPreviewPresentationEffectView)sourceViewSnapshot;
- (double)_actionDescriptiveTextFontSize;
- (double)minimumWidth;
- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dimmingViewForAlertController:(id)a3;
- (id)interactionProgressForTransitionOfType:(int64_t)a3 forAlertController:(id)a4;
- (id)tintColorForAlertController:(id)a3;
- (int64_t)permittedActionLayoutDirection;
- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9;
- (void)animateRevealOfAlertControllerView:(id)a3 alertController:(id)a4 inContainerView:(id)a5 duration:(double)a6 completionBlock:(id)a7;
- (void)setActionsReversed:(BOOL)a3;
- (void)setHeaderView:(id)a3;
- (void)setRevealEffectView:(id)a3;
- (void)setSourceViewSnapshot:(id)a3;
@end

@implementation UIAlertControllerVisualStyleActionSheetInline

+ (int64_t)interfaceActionPresentationStyle
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIAlertControllerVisualStyleActionSheetInline;
  if ([(UIAlertControllerVisualStyle *)&v8 isEqual:v4])
  {
    BOOL v5 = [(UIAlertControllerVisualStyleActionSheetInline *)self actionsReversed];
    int v6 = v5 ^ [v4 actionsReversed] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIAlertControllerVisualStyleActionSheetInline;
  id v4 = [(UIAlertControllerVisualStyle *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setActionsReversed:", -[UIAlertControllerVisualStyleActionSheetInline actionsReversed](self, "actionsReversed"));
  return v4;
}

- (double)_actionDescriptiveTextFontSize
{
  v2 = [(UIAlertControllerVisualStyle *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];

  double v4 = 15.0;
  if (([v3 isEqualToString:@"UICTContentSizeCategoryXS"] & 1) == 0
    && ([v3 isEqualToString:@"UICTContentSizeCategoryS"] & 1) == 0
    && ([v3 isEqualToString:@"UICTContentSizeCategoryM"] & 1) == 0
    && ([v3 isEqualToString:@"UICTContentSizeCategoryL"] & 1) == 0)
  {
    double v4 = 16.0;
    if (([v3 isEqualToString:@"UICTContentSizeCategoryXL"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"UICTContentSizeCategoryXXL"]) {
        double v4 = 17.0;
      }
      else {
        double v4 = 18.0;
      }
    }
  }

  return v4;
}

- (BOOL)shouldOccludeDuringPresentation
{
  return 0;
}

- (BOOL)shouldPreserveRespondersAcrossWindows
{
  return 1;
}

- (CGRect)_sourceRectForAlertController:(id)a3 inContainerView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 presentationController];
  objc_super v8 = [v7 sourceView];

  if (v8)
  {
    v9 = [v5 presentationController];
    [v9 sourceRect];
    +[UIForcePresentationHelper sourceRectForView:proposedSourceRect:](UIForcePresentationHelper, "sourceRectForView:proposedSourceRect:", v8);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v6, "convertRect:fromView:", v8, v11, v13, v15, v17);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    [v6 bounds];
    double v19 = v27 + v26 * 0.5;
    double v21 = v29 + v28 * 0.5;
    double v23 = 0.0;
    double v25 = 0.0;
  }

  double v30 = v19;
  double v31 = v21;
  double v32 = v23;
  double v33 = v25;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)animateRevealOfAlertControllerView:(id)a3 alertController:(id)a4 inContainerView:(id)a5 duration:(double)a6 completionBlock:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  id v13 = a5;
  double v14 = [v11 presentationController];
  double v15 = [v14 sourceView];
  [(UIAlertControllerVisualStyleActionSheetInline *)self _sourceRectForAlertController:v11 inContainerView:v13];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [v14 sourceRect];
  double v24 = +[UIForcePresentationHelper snapshotViewForSourceView:sourceRect:](UIForcePresentationHelper, "snapshotViewForSourceView:sourceRect:", v15);
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
  double v25 = [(UIAlertControllerVisualStyleActionSheetInline *)self headerView];
  [v13 insertSubview:v24 belowSubview:v25];

  [(UIAlertControllerVisualStyleActionSheetInline *)self setSourceViewSnapshot:v24];
  [v11 _setEffectAlpha:0.0];
  double v26 = [(UIAlertControllerVisualStyleActionSheetInline *)self headerView];
  [v26 setAlpha:0.0];

  double v27 = [(UIAlertControllerVisualStyleActionSheetInline *)self revealEffectView];
  [v27 _setEffect:0];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __141__UIAlertControllerVisualStyleActionSheetInline_animateRevealOfAlertControllerView_alertController_inContainerView_duration_completionBlock___block_invoke;
  v35[3] = &unk_1E52DCB30;
  id v36 = v24;
  v37 = self;
  id v38 = v11;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __141__UIAlertControllerVisualStyleActionSheetInline_animateRevealOfAlertControllerView_alertController_inContainerView_duration_completionBlock___block_invoke_2;
  v31[3] = &unk_1E52F0BC0;
  id v32 = v38;
  double v33 = self;
  id v34 = v12;
  id v28 = v12;
  id v29 = v38;
  id v30 = v24;
  +[UIView animateWithDuration:0 delay:v35 options:v31 animations:a6 completion:0.0];
}

void __141__UIAlertControllerVisualStyleActionSheetInline_animateRevealOfAlertControllerView_alertController_inContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  +[UIForcePresentationHelper applyPhase:1 toSnapshotView:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) revealEffectView];
  v2 = [*(id *)(a1 + 48) traitCollection];
  v3 = +[UIForcePresentationHelper visualEffectForPresentationPhase:1 traitCollection:v2 variant:1];
  [v4 _setEffect:v3];
}

uint64_t __141__UIAlertControllerVisualStyleActionSheetInline_animateRevealOfAlertControllerView_alertController_inContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setEffectAlpha:1.0];
  v2 = [*(id *)(a1 + 40) headerView];
  [v2 setAlpha:1.0];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a9;
  long long v94 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v95 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v126.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v126.c = v94;
  long long v93 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v126.double tx = v93;
  double v18 = [v15 presentationController];
  uint64_t v19 = [v15 _presentationSourceRepresentationView];
  v86 = [v18 sourceView];
  v84 = v18;
  [v18 sourceRect];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  [(UIAlertControllerVisualStyleActionSheetInline *)self _sourceRectForAlertController:v15 inContainerView:v16];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  id v36 = [(UIAlertControllerVisualStyleActionSheetInline *)self headerView];
  [v36 bounds];
  objc_msgSend(v16, "convertRect:fromView:", v36);
  CGFloat rect_24 = v38;
  CGFloat v91 = v37;
  CGFloat rect_8 = v40;
  CGFloat rect_16 = v39;
  v92 = self;
  if (v11)
  {
    v41 = [(UIAlertControllerVisualStyleActionSheetInline *)self sourceViewSnapshot];
    if (!v41)
    {
      v41 = +[UIForcePresentationHelper snapshotViewForSourceView:sourceRect:](UIForcePresentationHelper, "snapshotViewForSourceView:sourceRect:", v86, v21, v23, v25, v27);
      objc_msgSend(v41, "setFrame:", v29, v31, v33, v35);
      v42 = [(UIAlertControllerVisualStyleActionSheetInline *)v92 headerView];
      [v16 insertSubview:v41 belowSubview:v42];

      [(UIAlertControllerVisualStyleActionSheetInline *)v92 setSourceViewSnapshot:v41];
    }
    [v41 bounds];
    objc_msgSend(v16, "convertRect:fromView:", v41);
    double v29 = v43;
    double v31 = v44;
    double v33 = v45;
    double v35 = v46;
  }
  else
  {
    v41 = 0;
  }
  CGFloat rect = v29;
  [v14 center];
  CGAffineTransformMakeTranslation(&v126, v33 * 0.5 + v29 - v47, v35 * 0.5 + v31 - v48);
  v127.origin.x = v29;
  v127.origin.y = v31;
  v127.size.width = v33;
  v127.size.height = v35;
  double Width = CGRectGetWidth(v127);
  v128.origin.x = v91;
  v128.origin.y = rect_24;
  v128.size.width = rect_16;
  v128.size.height = rect_8;
  double v50 = Width / CGRectGetWidth(v128);
  v129.origin.x = rect;
  CGFloat v80 = v31;
  v129.origin.y = v31;
  v129.size.width = v33;
  CGFloat v81 = v35;
  v129.size.height = v35;
  double Height = CGRectGetHeight(v129);
  v130.origin.x = v91;
  v130.origin.y = rect_24;
  v130.size.width = rect_16;
  v130.size.height = rect_8;
  double v52 = Height / CGRectGetHeight(v130);
  if (v50 < v52) {
    double v52 = v50;
  }
  CGFloat sx = v52;
  if (!v19) {
    double v52 = 0.5;
  }
  CGAffineTransformMakeScale(&t1, v52, v52);
  CGAffineTransform t2 = v126;
  CGAffineTransformConcat(&v125, &t1, &t2);
  CGAffineTransform v126 = v125;
  if (v11)
  {
    CGAffineTransform v125 = v126;
    double v53 = 0.0;
    v54 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
  }
  else
  {
    *(_OWORD *)&v125.a = v95;
    *(_OWORD *)&v125.c = v94;
    double v53 = 1.0;
    v54 = &v126;
    *(_OWORD *)&v125.double tx = v93;
  }
  v83 = (void *)v19;
  long long v55 = *(_OWORD *)&v54->a;
  long long v56 = *(_OWORD *)&v54->tx;
  *(_OWORD *)&t2.c = *(_OWORD *)&v54->c;
  *(_OWORD *)&t2.double tx = v56;
  CGAffineTransform v122 = v125;
  *(_OWORD *)&t2.a = v55;
  [v14 setTransform:&v122];
  [v15 _setEffectAlpha:v53];
  *(_OWORD *)&v122.c = v94;
  *(_OWORD *)&v122.double tx = v93;
  *(_OWORD *)&v121.a = v95;
  *(_OWORD *)&v121.c = v94;
  *(_OWORD *)&v121.double tx = v93;
  *(_OWORD *)&v122.a = v95;
  v131.origin.x = rect;
  v131.origin.y = v80;
  v131.size.width = v33;
  v131.size.height = v81;
  double txa = CGRectGetMidX(v131);
  v132.origin.x = v91;
  v132.origin.y = rect_24;
  v132.size.width = rect_16;
  v132.size.height = rect_8;
  double tx = txa - CGRectGetMidX(v132);
  v133.origin.x = rect;
  v133.origin.y = v80;
  v133.size.width = v33;
  v133.size.height = v81;
  double MidY = CGRectGetMidY(v133);
  v134.origin.x = v91;
  v134.origin.y = rect_24;
  v134.size.width = rect_16;
  v134.size.height = rect_8;
  CGFloat v58 = CGRectGetMidY(v134);
  *(_OWORD *)&v120.a = v95;
  *(_OWORD *)&v120.c = v94;
  *(_OWORD *)&v120.double tx = v93;
  CGAffineTransformTranslate(&v121, &v120, tx, MidY - v58);
  CGAffineTransform v119 = v121;
  CGAffineTransformScale(&v120, &v119, sx, sx);
  CGAffineTransform v121 = v120;
  v85 = v16;
  if (v11)
  {
    CGAffineTransform v118 = v121;
    [v36 setTransform:&v118];
    [v36 setAlpha:0.0];
    v59 = [v15 traitCollection];
    v60 = +[UIForcePresentationHelper visualEffectForPresentationPhase:2 traitCollection:v59 variant:1];

    double v61 = 1.0;
  }
  else
  {
    v60 = 0;
    CGAffineTransform v122 = v121;
    double v61 = 0.0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  aBlock[3] = &unk_1E52E7948;
  id v96 = v14;
  id v116 = v96;
  CGAffineTransform v117 = t2;
  v62 = _Block_copy(aBlock);
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v110[3] = &unk_1E5311AB0;
  id v63 = v36;
  id v111 = v63;
  CGAffineTransform v113 = v122;
  BOOL v114 = v11;
  id v64 = v41;
  id v112 = v64;
  v65 = _Block_copy(v110);
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v106[3] = &unk_1E5311AD8;
  v106[4] = v92;
  BOOL v109 = v11;
  id v66 = v63;
  id v107 = v66;
  id v67 = v17;
  id v108 = v67;
  v68 = _Block_copy(v106);
  if (v11)
  {
    +[UIView _animateUsingSpringWithDuration:1030 delay:v62 options:v68 mass:a8 stiffness:0.0 damping:2.0 initialVelocity:1199.0 animations:98.0 completion:0.0];
    +[UIView _animateUsingSpringWithDuration:1030 delay:v65 options:0 mass:a8 stiffness:0.0 damping:2.0 initialVelocity:1199.0 animations:98.0 completion:0.0];
    double v69 = 1.0;
  }
  else
  {
    double v69 = 0.0;
    +[UIView animateWithDuration:1030 delay:v62 options:v68 animations:a8 completion:0.0];
    +[UIView animateWithDuration:1030 delay:v65 options:0 animations:a8 completion:0.0];
  }
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4;
  v103[3] = &unk_1E52D9CD0;
  id v104 = v15;
  double v105 = v69;
  id v70 = v15;
  if (v11) {
    double v71 = a8 * 0.3;
  }
  else {
    double v71 = a8 * 0.4;
  }
  if (v11) {
    double v72 = a8 * 0.4;
  }
  else {
    double v72 = a8 * 0.6;
  }
  if (v11) {
    double v73 = a8 * 0.5;
  }
  else {
    double v73 = a8;
  }
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 1030, v103, 0, v71, 0.0, *(void *)&tx);
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_5;
  v99[3] = &unk_1E52DA070;
  double v102 = v61;
  id v100 = v66;
  id v101 = v64;
  id v74 = v64;
  id v75 = v66;
  +[UIView animateWithDuration:1030 delay:v99 options:0 animations:v72 completion:0.0];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_6;
  v97[3] = &unk_1E52D9F98;
  v97[4] = v92;
  id v98 = v60;
  id v76 = v60;
  +[UIView animateWithDuration:1030 delay:v97 options:0 animations:v73 completion:0.0];
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  uint64_t result = [*(id *)(a1 + 32) setTransform:v4];
  if (*(unsigned char *)(a1 + 96)) {
    return [*(id *)(a1 + 40) setBlurRadius:20.0];
  }
  return result;
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) sourceViewSnapshot];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setSourceViewSnapshot:0];
  if (!*(unsigned char *)(a1 + 56))
  {
    v3 = [*(id *)(a1 + 32) revealEffectView];
    [v3 removeFromSuperview];

    [*(id *)(a1 + 32) setRevealEffectView:0];
    [*(id *)(a1 + 40) removeFromSuperview];
    id v4 = *(void **)(a1 + 40);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v7[0] = *MEMORY[0x1E4F1DAB8];
    v7[1] = v5;
    v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v4 setTransform:v7];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setEffectAlpha:*(double *)(a1 + 40)];
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  long long v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

void __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) revealEffectView];
  [v2 _setEffect:*(void *)(a1 + 40)];
}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  if (!a3) {
    return 0.25;
  }
  self;
  _durationOfSpringAnimation(2.0, 1199.0, 98.0, 0.0);
  return result;
}

- (int64_t)permittedActionLayoutDirection
{
  return 1;
}

- (double)minimumWidth
{
  return 0.0;
}

- (BOOL)transitionOfType:(int64_t)a3 shouldBeInteractiveForAlertController:(id)a4
{
  return a3 == 0;
}

- (id)interactionProgressForTransitionOfType:(int64_t)a3 forAlertController:(id)a4
{
  id v4 = objc_msgSend(a4, "transitioningDelegate", a3);
  long long v5 = [v4 interactionProgressForPresentation];
  [v5 percentComplete];
  if (v6 >= 1.0) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7
{
  id v112 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v10 layoutBelowIfNeeded];
  id v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = v12;
  id v15 = [v10 superview];
  [v14 contentInsetsForContainerView:v15];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [v14 _sourceRectForAlertController:v112 inContainerView:v11];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  double v32 = [v112 _presentationSourceRepresentationView];
  if (v32)
  {
    double v33 = objc_alloc_init(UIView);
    [v32 bounds];
    double Height = CGRectGetHeight(v114);
    double v34 = [v14 interfaceActionVisualStyle];
    [v34 contentCornerRadius];
    double v110 = v21;
    double v35 = v23;
    double v37 = v36;
    double v38 = [(UIView *)v33 layer];
    [v38 setCornerRadius:v37];

    [(UIView *)v33 setClipsToBounds:1];
    double v39 = +[UIColor systemBackgroundColor];
    [(UIView *)v33 setBackgroundColor:v39];

    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v33 addSubview:v32];
    id v111 = v32;
    double v40 = _NSDictionaryOfVariableBindings(&cfstr_Presentationso.isa, v32, 0);
    v41 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|[presentationSourceRepresentationView]|" options:0 metrics:0 views:v40];
    [v13 addObjectsFromArray:v41];

    v42 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[presentationSourceRepresentationView]|" options:0 metrics:0 views:v40];
    [v13 addObjectsFromArray:v42];

    double v43 = [(UIView *)v33 leadingAnchor];
    double v44 = [v11 leadingAnchor];
    double v45 = [v43 constraintGreaterThanOrEqualToAnchor:v44 constant:v19];
    [v13 addObject:v45];

    double v46 = [(UIView *)v33 trailingAnchor];
    double v47 = [v11 trailingAnchor];
    double v48 = [v46 constraintLessThanOrEqualToAnchor:v47 constant:-v35];
    [v13 addObject:v48];

    v49 = [(UIView *)v33 topAnchor];
    double v50 = [v11 topAnchor];
    v51 = [v49 constraintGreaterThanOrEqualToAnchor:v50 constant:v17];
    [v13 addObject:v51];

    double v52 = [(UIView *)v33 bottomAnchor];
    double v53 = [v11 bottomAnchor];
    v54 = [v52 constraintLessThanOrEqualToAnchor:v53 constant:-v110];
    [v13 addObject:v54];

    if (Height > 0.0)
    {
      long long v55 = [(UIView *)v33 heightAnchor];
      long long v56 = [v55 constraintGreaterThanOrEqualToConstant:Height];
      [v13 addObject:v56];
    }
    v57 = [v10 leadingAnchor];
    CGFloat v58 = [(UIView *)v33 leadingAnchor];
    v59 = [v57 constraintEqualToAnchor:v58 constant:0.0];
    [v13 addObject:v59];

    v60 = [v10 trailingAnchor];
    double v61 = [(UIView *)v33 trailingAnchor];
    v62 = [v60 constraintEqualToAnchor:v61 constant:0.0];
    [v13 addObject:v62];

    id v63 = [(UIView *)v33 centerYAnchor];
    id v64 = [v11 topAnchor];
    v115.origin.x = v25;
    v115.origin.y = v27;
    v115.size.width = v29;
    v115.size.height = v31;
    v65 = [v63 constraintEqualToAnchor:v64 constant:CGRectGetMidY(v115)];

    LODWORD(v66) = 1131937792;
    [v65 setPriority:v66];
    [v13 addObject:v65];
    id v67 = [(UIView *)v33 centerXAnchor];
    v68 = [v11 leftAnchor];
    v116.origin.x = v25;
    v116.origin.y = v27;
    v116.size.width = v29;
    v116.size.height = v31;
    double v69 = [v67 constraintEqualToAnchor:v68 constant:CGRectGetMidX(v116)];

    LODWORD(v70) = 1144750080;
    [v69 setPriority:v70];
    [v13 addObject:v69];

    double v32 = v111;
  }
  else
  {
    double v40 = [v112 presentationController];
    double v71 = [v40 sourceView];
    [v40 sourceRect];
    +[UIForcePresentationHelper snapshotViewForSourceView:sourceRect:](UIForcePresentationHelper, "snapshotViewForSourceView:sourceRect:", v71);
    double v33 = (UIView *)objc_claimAutoreleasedReturnValue();

    double v72 = [(UIView *)v33 widthAnchor];
    v117.origin.x = v25;
    v117.origin.y = v27;
    v117.size.width = v29;
    v117.size.height = v31;
    double v73 = [v72 constraintEqualToConstant:CGRectGetWidth(v117)];
    [v13 addObject:v73];

    id v74 = [(UIView *)v33 heightAnchor];
    v118.origin.x = v25;
    v118.origin.y = v27;
    v118.size.width = v29;
    v118.size.height = v31;
    id v75 = [v74 constraintEqualToConstant:CGRectGetHeight(v118)];
    [v13 addObject:v75];

    id v76 = [(UIView *)v33 centerXAnchor];
    v77 = [v11 leftAnchor];
    v119.origin.x = v25;
    v119.origin.y = v27;
    v119.size.width = v29;
    v119.size.height = v31;
    v78 = [v76 constraintEqualToAnchor:v77 constant:CGRectGetMidX(v119)];
    [v13 addObject:v78];

    v79 = [(UIView *)v33 centerYAnchor];
    CGFloat v80 = [v11 topAnchor];
    v120.origin.x = v25;
    v120.origin.y = v27;
    v120.size.width = v29;
    v120.size.height = v31;
    CGFloat v81 = [v79 constraintEqualToAnchor:v80 constant:CGRectGetMidY(v120)];
    [v13 addObject:v81];

    v82 = [v10 leadingAnchor];
    v83 = [v11 leadingAnchor];
    v84 = [v82 constraintGreaterThanOrEqualToAnchor:v83 constant:v19];
    [v13 addObject:v84];

    v85 = [v10 trailingAnchor];
    v86 = [v11 trailingAnchor];
    v87 = [v85 constraintLessThanOrEqualToAnchor:v86 constant:-v23];
    [v13 addObject:v87];

    v88 = [v10 centerXAnchor];
    v89 = [v11 leftAnchor];
    v121.origin.x = v25;
    v121.origin.y = v27;
    v121.size.width = v29;
    v121.size.height = v31;
    v65 = [v88 constraintEqualToAnchor:v89 constant:CGRectGetMidX(v121)];

    LODWORD(v90) = 1144750080;
    [v65 setPriority:v90];
    [v13 addObject:v65];
  }

  [(UIView *)v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 addSubview:v33];
  [v14 setHeaderView:v33];
  v122.origin.x = v25;
  v122.origin.y = v27;
  v122.size.width = v29;
  v122.size.height = v31;
  double MidY = CGRectGetMidY(v122);
  [v11 bounds];
  double v92 = CGRectGetMidY(v123);
  if (MidY < v92)
  {
    long long v93 = [v10 topAnchor];
    long long v94 = [(UIView *)v33 bottomAnchor];
    double v95 = 10.0;
  }
  else
  {
    long long v93 = [v10 bottomAnchor];
    long long v94 = [(UIView *)v33 topAnchor];
    double v95 = -10.0;
  }
  id v96 = [v93 constraintEqualToAnchor:v94 constant:v95];
  [v13 addObject:v96];

  [v14 setActionsReversed:MidY >= v92];
  v97 = [v14 revealEffectView];

  if (!v97)
  {
    id v98 = [[UIVisualEffectView alloc] initWithEffect:0];
    [v14 setRevealEffectView:v98];
  }
  v99 = [v14 revealEffectView];
  [v11 insertSubview:v99 atIndex:0];

  [v11 bounds];
  double v101 = v100;
  double v103 = v102;
  double v105 = v104;
  double v107 = v106;
  id v108 = [v14 revealEffectView];
  objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);

  [MEMORY[0x1E4F5B268] activateConstraints:v13];
}

- (id)tintColorForAlertController:(id)a3
{
  return +[UIColor labelColor];
}

- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4
{
  return 1;
}

- (id)dimmingViewForAlertController:(id)a3
{
  v3 = [UIView alloc];
  id v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v4;
}

- (BOOL)_shouldReverseActions
{
  return self->_actionsReversed;
}

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

- (BOOL)actionsReversed
{
  return self->_actionsReversed;
}

- (void)setActionsReversed:(BOOL)a3
{
  self->_actionsReversed = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIVisualEffectView)revealEffectView
{
  return self->_revealEffectView;
}

- (void)setRevealEffectView:(id)a3
{
}

- (_UIPreviewPresentationEffectView)sourceViewSnapshot
{
  return self->_sourceViewSnapshot;
}

- (void)setSourceViewSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewSnapshot, 0);
  objc_storeStrong((id *)&self->_revealEffectView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end