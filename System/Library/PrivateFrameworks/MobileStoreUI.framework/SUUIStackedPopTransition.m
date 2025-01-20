@interface SUUIStackedPopTransition
- (SUUIStackedBar)fromBar;
- (SUUIStackedBar)toBar;
- (double)split;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setFromBar:(id)a3;
- (void)setSplit:(double)a3;
- (void)setToBar:(id)a3;
@end

@implementation SUUIStackedPopTransition

- (void)animateTransition:(id)a3
{
  v119[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];
  v7 = [v6 view];
  v93 = v5;
  v8 = [v5 view];
  v9 = [v4 containerView];
  v88 = v4;
  v92 = v6;
  [v4 finalFrameForViewController:v6];
  double v11 = v10;
  double v13 = v12;
  double rect = v12;
  uint64_t v86 = v15;
  uint64_t v87 = v14;
  [(SUUIStackedBar *)self->_fromBar setHidden:1];
  [(SUUIStackedBar *)self->_fromBar bounds];
  objc_msgSend(v8, "convertRect:fromView:", self->_fromBar);
  double v17 = v16;
  [(SUUIStackedBar *)self->_fromBar frame];
  id v118 = 0;
  SUUIGetImagesFromView(v8, 0, &v118, v17 + v18);
  id v19 = v118;
  [(SUUIStackedBar *)self->_fromBar setHidden:0];
  v20 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v19];
  id v21 = objc_alloc(MEMORY[0x263F82E00]);
  [v19 size];
  double v23 = v22;
  v91 = v19;
  [v19 size];
  v25 = objc_msgSend(v21, "initWithFrame:", 0.0, 0.0, v23, v24);
  v26 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
  [v25 setBackgroundColor:v26];

  [v25 setAlpha:0.0];
  [v9 addSubview:v20];
  [v9 addSubview:v25];
  [v20 frame];
  double v28 = v27;
  double v30 = v29;
  [(SUUIStackedBar *)self->_fromBar frame];
  double v32 = v13 + v31;
  [(SUUIStackedBar *)self->_fromBar bounds];
  v97 = v8;
  objc_msgSend(v8, "convertRect:fromView:", self->_fromBar);
  double v34 = v32 + v33;
  v96 = v20;
  objc_msgSend(v20, "setFrame:", v11, v32 + v33, v28, v30);
  objc_msgSend(v25, "setFrame:", v11, v34, v28, v30);
  double split = self->_split;
  [(SUUIStackedBar *)self->_toBar setHidden:1];
  double v35 = self->_split;
  id v116 = 0;
  id v117 = 0;
  v90 = v7;
  SUUIGetImagesFromView(v7, &v117, &v116, v35);
  id v36 = v117;
  id v37 = v116;
  [(SUUIStackedBar *)self->_toBar setHidden:0];
  v38 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v36];
  [v38 frame];
  double v40 = v39;
  double v42 = v41;
  double v43 = v34 - self->_split;
  objc_msgSend(v38, "setFrame:", v11, v43);
  v82 = v38;
  [v9 addSubview:v38];
  v84 = v37;
  v44 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v37];
  [v44 frame];
  double v46 = v45;
  double v48 = v47;
  v120.origin.x = v11;
  v120.origin.y = rect;
  v120.size.width = v40;
  v120.size.height = v42;
  double MaxY = CGRectGetMaxY(v120);
  objc_msgSend(v44, "setFrame:", v11, MaxY + v48, v46, v48);
  v81 = v44;
  [v9 addSubview:v44];
  v49 = objc_alloc_init(SUUIStackedBar);
  [(SUUIStackedBar *)v49 setSplitViewStyle:[(SUUIStackedBar *)self->_fromBar splitViewStyle]];
  [(SUUIStackedBar *)v49 setHidesStatusBar:1];
  v50 = [(SUUIStackedBar *)self->_fromBar items];
  -[SUUIStackedBar setAlwaysShowsBackButton:](v49, "setAlwaysShowsBackButton:", (unint64_t)[v50 count] > 1);

  v51 = [(SUUIStackedBar *)self->_fromBar items];
  v52 = [v51 lastObject];
  v119[0] = v52;
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:1];
  v54 = SUUINavigationItemsShallowCopy(v53);
  [(SUUIStackedBar *)v49 setItems:v54];

  [(SUUIStackedBar *)v49 sizeToFit];
  [v9 addSubview:v49];
  [(SUUIStackedBar *)v49 frame];
  double v56 = v55;
  -[SUUIStackedBar setFrame:](v49, "setFrame:", v11, v34 - v55, v28);
  v85 = v36;
  v57 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v36];
  objc_msgSend(v57, "setFrame:", v11, v43, v40, v42);
  [v57 setAlpha:0.0];
  [v9 addSubview:v57];
  v58 = objc_alloc_init(SUUIStackedBar);
  [(SUUIStackedBar *)v58 setSplitViewStyle:[(SUUIStackedBar *)self->_toBar splitViewStyle]];
  v59 = [(SUUIStackedBar *)self->_toBar items];
  v60 = SUUINavigationItemsShallowCopy(v59);
  [(SUUIStackedBar *)v58 setItems:v60];

  [(SUUIStackedBar *)v58 setLastItemExpanded:0];
  if ([(SUUIStackedBar *)self->_toBar splitViewStyle]) {
    [(SUUIStackedBar *)v58 setZeroHeightWhenFirstChildExpanded:1];
  }
  [(SUUIStackedBar *)v58 frame];
  -[SUUIStackedBar sizeThatFits:](v58, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  [(SUUIStackedBar *)self->_fromBar frame];
  [(SUUIStackedBar *)v58 setFrame:v11];
  [v9 addSubview:v58];
  [v97 removeFromSuperview];
  [(SUUIStackedBar *)v58 setLastItemExpanded:1 animated:1];
  id v61 = SUUIStackedBarSpringAnimationForExpandCollapse(v49, v11, rect + split - v56 + -1.0);
  id v62 = SUUIStackedBarSpringAnimationForExpandCollapse(v96, v11, rect + split);
  id v63 = SUUIStackedBarSpringAnimationForExpandCollapse(v25, v11, rect + split);
  id v64 = SUUIStackedBarSpringAnimationForExpandCollapse(v82, v11, rect);
  id v65 = SUUIStackedBarSpringAnimationForExpandCollapse(v57, v11, rect);
  id v66 = SUUIStackedBarSpringAnimationForExpandCollapse(v81, v11, MaxY);
  v67 = (void *)MEMORY[0x263F82E00];
  v113[0] = MEMORY[0x263EF8330];
  v113[1] = 3221225472;
  v113[2] = __46__SUUIStackedPopTransition_animateTransition___block_invoke;
  v113[3] = &unk_265400890;
  id v68 = v57;
  id v114 = v68;
  id v69 = v25;
  id v115 = v69;
  [v67 animateWithDuration:v113 animations:0.2];
  [(SUUIStackedPopTransition *)self transitionDuration:v88];
  dispatch_time_t when = dispatch_time(0, (uint64_t)(v70 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUUIStackedPopTransition_animateTransition___block_invoke_2;
  block[3] = &unk_2654017F0;
  double v109 = v11;
  double v110 = rect;
  uint64_t v111 = v87;
  uint64_t v112 = v86;
  id v99 = v90;
  id v100 = v9;
  v101 = v58;
  v102 = v49;
  id v103 = v96;
  id v104 = v82;
  id v105 = v68;
  id v106 = v69;
  id v107 = v81;
  id v108 = v88;
  id recta = v88;
  id v71 = v81;
  id v89 = v69;
  id v72 = v68;
  id v73 = v82;
  id v74 = v96;
  v75 = v49;
  v76 = v58;
  id v77 = v9;
  id v78 = v90;
  dispatch_after(when, MEMORY[0x263EF83A0], block);
}

uint64_t __46__SUUIStackedPopTransition_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __46__SUUIStackedPopTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  [*(id *)(a1 + 40) addSubview:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  [*(id *)(a1 + 64) removeFromSuperview];
  [*(id *)(a1 + 72) removeFromSuperview];
  [*(id *)(a1 + 80) removeFromSuperview];
  [*(id *)(a1 + 88) removeFromSuperview];
  [*(id *)(a1 + 96) removeFromSuperview];
  v2 = *(void **)(a1 + 104);
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