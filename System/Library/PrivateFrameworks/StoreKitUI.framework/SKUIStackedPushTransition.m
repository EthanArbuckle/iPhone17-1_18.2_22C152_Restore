@interface SKUIStackedPushTransition
- (SKUIStackedBar)fromBar;
- (SKUIStackedBar)toBar;
- (double)split;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setFromBar:(id)a3;
- (void)setSplit:(double)a3;
- (void)setToBar:(id)a3;
@end

@implementation SKUIStackedPushTransition

- (void)animateTransition:(id)a3
{
  v134[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStackedPushTransition animateTransition:]();
  }
  [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v108 = v100 = v4;
  v107 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v5 = [v107 view];
  v110 = [v108 view];
  v6 = [v4 containerView];
  [v4 finalFrameForViewController:v107];
  double v8 = v7;
  double v10 = v9;
  uint64_t v102 = v12;
  uint64_t v104 = v11;
  [(SKUIStackedBar *)self->_toBar setHidden:1];
  [(SKUIStackedBar *)self->_toBar frame];
  double MaxY = CGRectGetMaxY(v135);
  id v133 = 0;
  SKUIGetImagesFromView(v5, 0, &v133, MaxY);
  id v106 = v133;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v106];
  id v15 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v106 size];
  double v17 = v16;
  [v106 size];
  v19 = objc_msgSend(v15, "initWithFrame:", 0.0, 0.0, v17, v18);
  v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
  [v19 setBackgroundColor:v20];

  v109 = v14;
  [v6 addSubview:v14];
  v97 = v19;
  [v6 addSubview:v19];
  [v14 frame];
  double v22 = v21;
  double v24 = v23;
  double v25 = v10 + self->_split;
  objc_msgSend(v14, "setFrame:", v8, v25);
  double v90 = v25;
  objc_msgSend(v19, "setFrame:", v8, v25, v22, v24);
  [(SKUIStackedBar *)self->_toBar frame];
  double v27 = v10 + v26;
  [(SKUIStackedBar *)self->_toBar frame];
  double v29 = v27 + v28;
  id v30 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(SKUIStackedBar *)self->_toBar frame];
  double v32 = v31;
  [(SKUIStackedBar *)self->_toBar frame];
  double v34 = v25 - (v32 + v33);
  v96 = v5;
  [v5 frame];
  objc_msgSend(v30, "setFrame:", v8, v34, v22);
  [v6 addSubview:v30];
  v92 = v30;
  [v6 sendSubviewToBack:v30];
  [(SKUIStackedBar *)self->_toBar frame];
  double v36 = v35;
  [(SKUIStackedBar *)self->_toBar frame];
  double v94 = v29 - (v36 + v37);
  double v88 = v29;
  [v5 frame];
  [v30 bounds];
  objc_msgSend(v5, "setFrame:");
  [v30 addSubview:v5];
  [(SKUIStackedBar *)self->_fromBar setHidden:1];
  double split = self->_split;
  id v131 = 0;
  id v132 = 0;
  SKUIGetImagesFromView(v110, &v132, &v131, split);
  id v99 = v132;
  id v98 = v131;
  [(SKUIStackedBar *)self->_fromBar setHidden:0];
  v39 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v99];
  [v39 frame];
  double v93 = v10;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  objc_msgSend(v39, "setFrame:", v8, v10);
  [v6 addSubview:v39];
  double v91 = v29 - self->_split;
  v44 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v98];
  [v44 frame];
  double v46 = v45;
  double v48 = v47;
  v136.origin.x = v8;
  v136.origin.y = v10;
  v136.size.width = v41;
  v136.size.height = v43;
  double v49 = CGRectGetMaxY(v136);
  objc_msgSend(v44, "setFrame:", v8, v49, v46, v48);
  [v6 addSubview:v44];
  double v89 = v49 + v48;
  v50 = objc_alloc_init(SKUIStackedBar);
  [(SKUIStackedBar *)v50 setSplitViewStyle:[(SKUIStackedBar *)self->_toBar splitViewStyle]];
  [(SKUIStackedBar *)v50 setHidesStatusBar:1];
  v51 = [(SKUIStackedBar *)self->_toBar items];
  -[SKUIStackedBar setAlwaysShowsBackButton:](v50, "setAlwaysShowsBackButton:", (unint64_t)[v51 count] > 1);

  v52 = [(SKUIStackedBar *)self->_toBar items];
  v53 = [v52 lastObject];
  v134[0] = v53;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:1];
  v55 = SKUINavigationItemsShallowCopy(v54);
  [(SKUIStackedBar *)v50 setItems:v55];

  [(SKUIStackedBar *)v50 sizeToFit];
  [v6 addSubview:v50];
  [(SKUIStackedBar *)v50 frame];
  double v57 = v56;
  -[SKUIStackedBar setFrame:](v50, "setFrame:", v8, v90 - v56, v22);
  [(SKUIStackedBar *)v50 setAlpha:0.0];
  v58 = objc_alloc_init(SKUIStackedBar);
  [(SKUIStackedBar *)v58 setSplitViewStyle:[(SKUIStackedBar *)self->_fromBar splitViewStyle]];
  v59 = [(SKUIStackedBar *)self->_fromBar items];
  v60 = SKUINavigationItemsShallowCopy(v59);
  [(SKUIStackedBar *)v58 setItems:v60];

  [(SKUIStackedBar *)self->_fromBar frame];
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  v69 = [(SKUIStackedBar *)self->_fromBar superview];
  objc_msgSend(v6, "convertRect:fromView:", v69, v62, v64, v66, v68);
  -[SKUIStackedBar setFrame:](v58, "setFrame:");

  [v6 addSubview:v58];
  [v110 removeFromSuperview];
  [(SKUIStackedBar *)v58 setLastItemExpanded:0 animated:1];
  id v70 = SKUIStackedBarSpringAnimationForExpandCollapse(v50, v8, v88 - v57);
  id v71 = SKUIStackedBarSpringAnimationForExpandCollapse(v92, v8, v94);
  id v72 = SKUIStackedBarSpringAnimationForExpandCollapse(v109, v8, v88);
  id v73 = SKUIStackedBarSpringAnimationForExpandCollapse(v97, v8, v88);
  id v74 = SKUIStackedBarSpringAnimationForExpandCollapse(v39, v8, v91);
  id v75 = SKUIStackedBarSpringAnimationForExpandCollapse(v44, v8, v89);
  v76 = (void *)MEMORY[0x1E4FB1EB0];
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __47__SKUIStackedPushTransition_animateTransition___block_invoke;
  v128[3] = &unk_1E6421FF8;
  id v77 = v39;
  id v129 = v77;
  v78 = v50;
  v130 = v78;
  [v76 animateWithDuration:v128 animations:0.4];
  v95 = (void *)MEMORY[0x1E4FB1EB0];
  [(SKUIStackedPushTransition *)self transitionDuration:v100];
  double v80 = v79;
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __47__SKUIStackedPushTransition_animateTransition___block_invoke_2;
  v126[3] = &unk_1E6422020;
  id v127 = v97;
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __47__SKUIStackedPushTransition_animateTransition___block_invoke_3;
  v111[3] = &unk_1E6424068;
  v111[4] = self;
  id v112 = v92;
  double v122 = v8;
  double v123 = v93;
  uint64_t v124 = v104;
  uint64_t v125 = v102;
  id v113 = v96;
  id v114 = v6;
  v115 = v58;
  v116 = v78;
  id v117 = v109;
  id v118 = v77;
  id v119 = v127;
  id v120 = v44;
  id v121 = v100;
  id v105 = v100;
  id v101 = v44;
  id v103 = v127;
  id v81 = v77;
  id v82 = v109;
  v83 = v78;
  v84 = v58;
  id v85 = v6;
  id v86 = v96;
  id v87 = v92;
  [v95 animateWithDuration:v126 animations:v111 completion:v80];
}

uint64_t __47__SKUIStackedPushTransition_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:1.0];
}

uint64_t __47__SKUIStackedPushTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __47__SKUIStackedPushTransition_animateTransition___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setHidden:0];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144));
  [*(id *)(a1 + 56) addSubview:*(void *)(a1 + 48)];
  [*(id *)(a1 + 64) removeFromSuperview];
  [*(id *)(a1 + 72) removeFromSuperview];
  [*(id *)(a1 + 80) removeFromSuperview];
  [*(id *)(a1 + 88) removeFromSuperview];
  [*(id *)(a1 + 96) removeFromSuperview];
  [*(id *)(a1 + 104) removeFromSuperview];
  v2 = *(void **)(a1 + 112);

  return [v2 completeTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.6;
}

- (double)split
{
  return self->_split;
}

- (void)setSplit:(double)a3
{
  self->_double split = a3;
}

- (SKUIStackedBar)fromBar
{
  return self->_fromBar;
}

- (void)setFromBar:(id)a3
{
}

- (SKUIStackedBar)toBar
{
  return self->_toBar;
}

- (void)setToBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBar, 0);

  objc_storeStrong((id *)&self->_fromBar, 0);
}

- (void)animateTransition:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStackedPushTransition animateTransition:]";
}

@end