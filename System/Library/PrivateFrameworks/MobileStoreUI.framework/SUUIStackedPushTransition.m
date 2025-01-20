@interface SUUIStackedPushTransition
- (SUUIStackedBar)fromBar;
- (SUUIStackedBar)toBar;
- (double)split;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setFromBar:(id)a3;
- (void)setSplit:(double)a3;
- (void)setToBar:(id)a3;
@end

@implementation SUUIStackedPushTransition

- (void)animateTransition:(id)a3
{
  v134[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v108 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  v107 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];
  v5 = [v107 view];
  v110 = [v108 view];
  v101 = v4;
  v6 = [v4 containerView];
  [v4 finalFrameForViewController:v107];
  double v8 = v7;
  double v10 = v9;
  uint64_t v102 = v12;
  uint64_t v104 = v11;
  [(SUUIStackedBar *)self->_toBar setHidden:1];
  [(SUUIStackedBar *)self->_toBar frame];
  double MaxY = CGRectGetMaxY(v135);
  id v133 = 0;
  SUUIGetImagesFromView(v5, 0, &v133, MaxY);
  id v106 = v133;
  v14 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v106];
  id v15 = objc_alloc(MEMORY[0x263F82E00]);
  [v106 size];
  double v17 = v16;
  [v106 size];
  v19 = objc_msgSend(v15, "initWithFrame:", 0.0, 0.0, v17, v18);
  v20 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
  [v19 setBackgroundColor:v20];

  v109 = v14;
  [v6 addSubview:v14];
  v98 = v19;
  [v6 addSubview:v19];
  [v14 frame];
  double v22 = v21;
  double v24 = v23;
  double v25 = v10 + self->_split;
  objc_msgSend(v14, "setFrame:", v8, v25);
  double v92 = v25;
  objc_msgSend(v19, "setFrame:", v8, v25, v22, v24);
  [(SUUIStackedBar *)self->_toBar frame];
  double v27 = v10 + v26;
  [(SUUIStackedBar *)self->_toBar frame];
  double v29 = v27 + v28;
  id v30 = objc_alloc_init(MEMORY[0x263F82E00]);
  [(SUUIStackedBar *)self->_toBar frame];
  double v32 = v31;
  [(SUUIStackedBar *)self->_toBar frame];
  double v34 = v25 - (v32 + v33);
  v97 = v5;
  [v5 frame];
  objc_msgSend(v30, "setFrame:", v8, v34, v22);
  [v6 addSubview:v30];
  v89 = v30;
  [v6 sendSubviewToBack:v30];
  [(SUUIStackedBar *)self->_toBar frame];
  double v36 = v35;
  [(SUUIStackedBar *)self->_toBar frame];
  double v95 = v29 - (v36 + v37);
  double v90 = v29;
  [v5 frame];
  [v30 bounds];
  objc_msgSend(v5, "setFrame:");
  [v30 addSubview:v5];
  [(SUUIStackedBar *)self->_fromBar setHidden:1];
  double split = self->_split;
  id v131 = 0;
  id v132 = 0;
  SUUIGetImagesFromView(v110, &v132, &v131, split);
  id v100 = v132;
  id v99 = v131;
  [(SUUIStackedBar *)self->_fromBar setHidden:0];
  v39 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v100];
  [v39 frame];
  double v94 = v10;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  objc_msgSend(v39, "setFrame:", v8, v10);
  [v6 addSubview:v39];
  double v93 = v29 - self->_split;
  v44 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v99];
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
  double v91 = v49 + v48;
  v50 = objc_alloc_init(SUUIStackedBar);
  [(SUUIStackedBar *)v50 setSplitViewStyle:[(SUUIStackedBar *)self->_toBar splitViewStyle]];
  [(SUUIStackedBar *)v50 setHidesStatusBar:1];
  v51 = [(SUUIStackedBar *)self->_toBar items];
  -[SUUIStackedBar setAlwaysShowsBackButton:](v50, "setAlwaysShowsBackButton:", (unint64_t)[v51 count] > 1);

  v52 = [(SUUIStackedBar *)self->_toBar items];
  v53 = [v52 lastObject];
  v134[0] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:1];
  v55 = SUUINavigationItemsShallowCopy(v54);
  [(SUUIStackedBar *)v50 setItems:v55];

  [(SUUIStackedBar *)v50 sizeToFit];
  [v6 addSubview:v50];
  [(SUUIStackedBar *)v50 frame];
  double v57 = v56;
  -[SUUIStackedBar setFrame:](v50, "setFrame:", v8, v92 - v56, v22);
  [(SUUIStackedBar *)v50 setAlpha:0.0];
  v58 = objc_alloc_init(SUUIStackedBar);
  [(SUUIStackedBar *)v58 setSplitViewStyle:[(SUUIStackedBar *)self->_fromBar splitViewStyle]];
  v59 = [(SUUIStackedBar *)self->_fromBar items];
  v60 = SUUINavigationItemsShallowCopy(v59);
  [(SUUIStackedBar *)v58 setItems:v60];

  [(SUUIStackedBar *)self->_fromBar frame];
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  v69 = [(SUUIStackedBar *)self->_fromBar superview];
  objc_msgSend(v6, "convertRect:fromView:", v69, v62, v64, v66, v68);
  -[SUUIStackedBar setFrame:](v58, "setFrame:");

  [v6 addSubview:v58];
  [v110 removeFromSuperview];
  [(SUUIStackedBar *)v58 setLastItemExpanded:0 animated:1];
  id v70 = SUUIStackedBarSpringAnimationForExpandCollapse(v50, v8, v90 - v57);
  id v71 = SUUIStackedBarSpringAnimationForExpandCollapse(v89, v8, v95);
  id v72 = SUUIStackedBarSpringAnimationForExpandCollapse(v109, v8, v90);
  id v73 = SUUIStackedBarSpringAnimationForExpandCollapse(v98, v8, v90);
  id v74 = SUUIStackedBarSpringAnimationForExpandCollapse(v39, v8, v93);
  id v75 = SUUIStackedBarSpringAnimationForExpandCollapse(v44, v8, v91);
  v76 = (void *)MEMORY[0x263F82E00];
  v128[0] = MEMORY[0x263EF8330];
  v128[1] = 3221225472;
  v128[2] = __47__SUUIStackedPushTransition_animateTransition___block_invoke;
  v128[3] = &unk_265400890;
  id v77 = v39;
  id v129 = v77;
  v78 = v50;
  v130 = v78;
  [v76 animateWithDuration:v128 animations:0.4];
  v96 = (void *)MEMORY[0x263F82E00];
  [(SUUIStackedPushTransition *)self transitionDuration:v101];
  double v80 = v79;
  v126[0] = MEMORY[0x263EF8330];
  v126[1] = 3221225472;
  v126[2] = __47__SUUIStackedPushTransition_animateTransition___block_invoke_2;
  v126[3] = &unk_265400980;
  id v127 = v98;
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __47__SUUIStackedPushTransition_animateTransition___block_invoke_3;
  v111[3] = &unk_2654017C8;
  v111[4] = self;
  id v112 = v89;
  double v122 = v8;
  double v123 = v94;
  uint64_t v124 = v104;
  uint64_t v125 = v102;
  id v113 = v97;
  id v114 = v6;
  v115 = v58;
  v116 = v78;
  id v117 = v109;
  id v118 = v77;
  id v119 = v127;
  id v120 = v44;
  id v121 = v101;
  id v105 = v101;
  id v81 = v44;
  id v103 = v127;
  id v82 = v77;
  id v83 = v109;
  v84 = v78;
  v85 = v58;
  id v86 = v6;
  id v87 = v97;
  id v88 = v89;
  [v96 animateWithDuration:v126 animations:v111 completion:v80];
}

uint64_t __47__SUUIStackedPushTransition_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __47__SUUIStackedPushTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __47__SUUIStackedPushTransition_animateTransition___block_invoke_3(uint64_t a1)
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

- (SUUIStackedBar)fromBar
{
  return self->_fromBar;
}

- (void)setFromBar:(id)a3
{
}

- (SUUIStackedBar)toBar
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

@end