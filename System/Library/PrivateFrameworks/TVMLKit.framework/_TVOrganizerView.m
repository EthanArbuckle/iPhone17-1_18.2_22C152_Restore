@interface _TVOrganizerView
- (BOOL)canBecomeFocused;
- (BOOL)columnDividersEnabled;
- (BOOL)remembersLastFocusedItem;
- (CGSize)_contentSizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)components;
- (NSDictionary)divSizesByPosition;
- (NSDictionary)divsByPosition;
- (UIColor)columnDividerColor;
- (UIEdgeInsets)tv_alignmentInsetsForExpectedWidth:(double)a3;
- (UIView)backgroundImageView;
- (UIView)preferredFocusedComponent;
- (_TVOrganizerView)initWithFrame:(CGRect)a3;
- (double)columnDividerPadding;
- (double)cornerRadius;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)_positionFromView:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setBackgroundImageView:(id)a3;
- (void)setColumnDividerColor:(id)a3;
- (void)setColumnDividerPadding:(double)a3;
- (void)setColumnDividersEnabled:(BOOL)a3;
- (void)setComponents:(id)a3;
- (void)setComponentsNeedUpdate;
- (void)setCornerRadius:(double)a3;
- (void)setDivSizesByPosition:(id)a3;
- (void)setDivsByPosition:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPreferredFocusedComponent:(id)a3;
- (void)setRemembersLastFocusedItem:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
@end

@implementation _TVOrganizerView

- (_TVOrganizerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_TVOrganizerView;
  v3 = -[_TVFocusRedirectView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(_TVOrganizerView *)v3 setBackgroundColor:v4];

    [(_TVOrganizerView *)v3 setOpaque:0];
    v5 = [(_TVFocusRedirectView *)v3 containerGuide];
    [v5 setEnabled:0];

    v3->_remembersLastFocusedItem = 0;
  }
  return v3;
}

- (void)setPreferredFocusedComponent:(id)a3
{
}

- (UIView)preferredFocusedComponent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedView);
  return (UIView *)WeakRetained;
}

- (void)setComponentsNeedUpdate
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = [(_TVOrganizerView *)self divsByPosition];
  v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  v5 = (void *)MEMORY[0x263F08D40];
  v6 = [v3 objectForKeyedSubscript:&unk_26E59E3B0];
  double v7 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x263F001B0], v8);
  v9 = objc_msgSend(v5, "valueWithCGSize:");
  [v4 setObject:v9 forKeyedSubscript:&unk_26E59E3B0];

  v10 = (void *)MEMORY[0x263F08D40];
  v11 = [v3 objectForKeyedSubscript:&unk_26E59E3C8];
  objc_msgSend(v11, "sizeThatFits:", v7, v8);
  v12 = objc_msgSend(v10, "valueWithCGSize:");
  [v4 setObject:v12 forKeyedSubscript:&unk_26E59E3C8];

  v13 = (void *)MEMORY[0x263F08D40];
  v14 = [v3 objectForKeyedSubscript:&unk_26E59E3E0];
  objc_msgSend(v14, "sizeThatFits:", v7, v8);
  v15 = objc_msgSend(v13, "valueWithCGSize:");
  [v4 setObject:v15 forKeyedSubscript:&unk_26E59E3E0];

  v16 = (void *)MEMORY[0x263F08D40];
  v17 = [v3 objectForKeyedSubscript:&unk_26E59E3F8];
  objc_msgSend(v17, "sizeThatFits:", v7, v8);
  v18 = objc_msgSend(v16, "valueWithCGSize:");
  [v4 setObject:v18 forKeyedSubscript:&unk_26E59E3F8];

  v19 = (void *)MEMORY[0x263F08D40];
  v20 = [v3 objectForKeyedSubscript:&unk_26E59E410];
  objc_msgSend(v20, "sizeThatFits:", v7, v8);
  v21 = objc_msgSend(v19, "valueWithCGSize:");
  [v4 setObject:v21 forKeyedSubscript:&unk_26E59E410];

  v22 = (void *)MEMORY[0x263F08D40];
  v23 = [v3 objectForKeyedSubscript:&unk_26E59E428];
  objc_msgSend(v23, "sizeThatFits:", v7, v8);
  v24 = objc_msgSend(v22, "valueWithCGSize:");
  [v4 setObject:v24 forKeyedSubscript:&unk_26E59E428];

  [(_TVOrganizerView *)self setDivSizesByPosition:v4];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = objc_msgSend(v3, "allValues", 0);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) setComponentsNeedUpdate];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v27);
  }

  [(_TVOrganizerView *)self setNeedsLayout];
}

- (double)cornerRadius
{
  v2 = [(_TVOrganizerView *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(_TVOrganizerView *)self layer];
  [v4 setCornerRadius:a3];
}

- (void)setBackgroundImageView:(id)a3
{
  v5 = (UIView *)a3;
  p_backgroundImageView = &self->_backgroundImageView;
  backgroundImageView = self->_backgroundImageView;
  double v8 = v5;
  if (backgroundImageView != v5)
  {
    [(UIView *)backgroundImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundImageView, a3);
    if (*p_backgroundImageView) {
      [(_TVOrganizerView *)self insertSubview:*p_backgroundImageView atIndex:0];
    }
  }
  [(_TVOrganizerView *)self setNeedsLayout];
}

- (void)setRemembersLastFocusedItem:(BOOL)a3
{
  BOOL v3 = a3;
  self->_remembersLastFocusedItem = a3;
  id v4 = [(_TVFocusRedirectView *)self containerGuide];
  [v4 setEnabled:v3];
}

- (void)setComponents:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_components, a3);
  v68 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:9];
  v6 = (void *)MEMORY[0x263EFF980];
  v66 = self;
  double v7 = [(_TVOrganizerView *)self divsByPosition];
  double v8 = [v7 allKeys];
  v9 = [v6 arrayWithArray:v8];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          uint64_t v16 = [(_TVOrganizerView *)v66 _positionFromView:v15];
          v17 = [NSNumber numberWithInteger:v16];
          v18 = [v68 objectForKeyedSubscript:v17];

          if (!v18)
          {
            v18 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
            v19 = [NSNumber numberWithInteger:v16];
            [v68 setObject:v18 forKeyedSubscript:v19];
          }
          [v18 addObject:v15];
          v20 = [NSNumber numberWithInteger:v16];
          [v9 removeObject:v20];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v73 objects:v78 count:16];
    }
    while (v11);
  }

  v67 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v68, "count"));
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v21 = [v68 allKeys];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    unint64_t v24 = 0;
    uint64_t v25 = *(void *)v70;
    double v26 = *MEMORY[0x263F001A8];
    double v27 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v28 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v29 = *(double *)(MEMORY[0x263F001A8] + 24);
    long long v30 = v66;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v70 != v25) {
          objc_enumerationMutation(v21);
        }
        long long v32 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        if (([v9 containsObject:v32] & 1) != 0
          || ([(_TVOrganizerView *)v30 divsByPosition],
              long long v33 = objc_claimAutoreleasedReturnValue(),
              [v33 objectForKeyedSubscript:v32],
              v34 = (_TVOrganizerCellView *)objc_claimAutoreleasedReturnValue(),
              v33,
              !v34))
        {
          if (v24 >= [v9 count])
          {
            v34 = -[_TVOrganizerCellView initWithFrame:]([_TVOrganizerCellView alloc], "initWithFrame:", v26, v27, v28, v29);
          }
          else
          {
            uint64_t v35 = [(_TVOrganizerView *)v30 divsByPosition];
            unint64_t v36 = v24 + 1;
            v37 = [v9 objectAtIndexedSubscript:v24];
            v34 = [v35 objectForKeyedSubscript:v37];

            unint64_t v24 = v36;
            long long v30 = v66;
          }
        }
        v38 = [v68 objectForKeyedSubscript:v32];
        [(_TVOrganizerCellView *)v34 setComponents:v38];

        unint64_t v39 = [v32 integerValue] - 1;
        if (v39 <= 0xA) {
          [(_TVOrganizerCellView *)v34 setContentVerticalAlignment:qword_230C383B0[v39]];
        }
        [v67 setObject:v34 forKeyedSubscript:v32];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v23);
  }
  else
  {
    unint64_t v24 = 0;
    long long v30 = v66;
  }

  v40 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  v41 = (void *)MEMORY[0x263F08D40];
  v42 = [v67 objectForKeyedSubscript:&unk_26E59E3B0];
  double v43 = *MEMORY[0x263F001B0];
  double v44 = *(double *)(MEMORY[0x263F001B0] + 8);
  objc_msgSend(v42, "sizeThatFits:", *MEMORY[0x263F001B0], v44);
  v45 = objc_msgSend(v41, "valueWithCGSize:");
  [v40 setObject:v45 forKeyedSubscript:&unk_26E59E3B0];

  v46 = (void *)MEMORY[0x263F08D40];
  v47 = [v67 objectForKeyedSubscript:&unk_26E59E3C8];
  objc_msgSend(v47, "sizeThatFits:", v43, v44);
  v48 = objc_msgSend(v46, "valueWithCGSize:");
  [v40 setObject:v48 forKeyedSubscript:&unk_26E59E3C8];

  v49 = (void *)MEMORY[0x263F08D40];
  v50 = [v67 objectForKeyedSubscript:&unk_26E59E3E0];
  objc_msgSend(v50, "sizeThatFits:", v43, v44);
  v51 = objc_msgSend(v49, "valueWithCGSize:");
  [v40 setObject:v51 forKeyedSubscript:&unk_26E59E3E0];

  v52 = (void *)MEMORY[0x263F08D40];
  v53 = [v67 objectForKeyedSubscript:&unk_26E59E3F8];
  objc_msgSend(v53, "sizeThatFits:", v43, v44);
  v54 = objc_msgSend(v52, "valueWithCGSize:");
  [v40 setObject:v54 forKeyedSubscript:&unk_26E59E3F8];

  v55 = (void *)MEMORY[0x263F08D40];
  v56 = [v67 objectForKeyedSubscript:&unk_26E59E410];
  objc_msgSend(v56, "sizeThatFits:", v43, v44);
  v57 = objc_msgSend(v55, "valueWithCGSize:");
  [v40 setObject:v57 forKeyedSubscript:&unk_26E59E410];

  v58 = (void *)MEMORY[0x263F08D40];
  v59 = [v67 objectForKeyedSubscript:&unk_26E59E428];
  objc_msgSend(v59, "sizeThatFits:", v43, v44);
  v60 = objc_msgSend(v58, "valueWithCGSize:");
  [v40 setObject:v60 forKeyedSubscript:&unk_26E59E428];

  while (v24 < [v9 count])
  {
    v61 = [(_TVOrganizerView *)v30 divsByPosition];
    v62 = [v9 objectAtIndexedSubscript:v24];
    v63 = [v61 objectForKeyedSubscript:v62];
    [v63 removeFromSuperview];

    ++v24;
  }
  v64 = [(_TVOrganizerView *)v30 constraints];
  [(_TVOrganizerView *)v30 removeConstraints:v64];

  [(_TVOrganizerView *)v30 setDivsByPosition:v67];
  [(_TVOrganizerView *)v30 setDivSizesByPosition:v40];
  [(_TVOrganizerView *)v30 setNeedsLayout];
}

- (void)setColumnDividerPadding:(double)a3
{
  self->_columnDividerPadding = a3;
}

- (void)setColumnDividersEnabled:(BOOL)a3
{
  self->_columnDividersEnabled = a3;
  rightColumnDivider = self->_rightColumnDivider;
  if (a3)
  {
    if (rightColumnDivider) {
      return;
    }
    double v8 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    leftColumnDivider = self->_leftColumnDivider;
    self->_leftColumnDivider = v8;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    double v7 = self->_rightColumnDivider;
    self->_rightColumnDivider = v6;
  }
  else
  {
    [(UIView *)rightColumnDivider removeFromSuperview];
    [(UIView *)self->_leftColumnDivider removeFromSuperview];
    id v5 = self->_rightColumnDivider;
    self->_rightColumnDivider = 0;

    double v7 = self->_leftColumnDivider;
    self->_leftColumnDivider = 0;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (UIEdgeInsets)tv_alignmentInsetsForExpectedWidth:(double)a3
{
  v158[3] = *MEMORY[0x263EF8340];
  id v5 = (double *)MEMORY[0x263F1D1C0];
  [(UIView *)self tv_padding];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = a3 - (v8 + v12);
  id v15 = [(_TVOrganizerView *)self divsByPosition];
  uint64_t v16 = [v15 objectForKeyedSubscript:&unk_26E59E440];

  v17 = [(_TVOrganizerView *)self divsByPosition];
  v18 = [v17 objectForKeyedSubscript:&unk_26E59E3B0];

  v19 = [(_TVOrganizerView *)self divsByPosition];
  v20 = [v19 objectForKeyedSubscript:&unk_26E59E458];

  v21 = [(_TVOrganizerView *)self divsByPosition];
  uint64_t v22 = [v21 objectForKeyedSubscript:&unk_26E59E3F8];

  uint64_t v23 = [(_TVOrganizerView *)self divsByPosition];
  unint64_t v24 = [v23 objectForKeyedSubscript:&unk_26E59E3C8];

  uint64_t v25 = [(_TVOrganizerView *)self divsByPosition];
  v147 = [v25 objectForKeyedSubscript:&unk_26E59E470];

  double v26 = [(_TVOrganizerView *)self divsByPosition];
  v150 = [v26 objectForKeyedSubscript:&unk_26E59E410];

  double v27 = [(_TVOrganizerView *)self divsByPosition];
  v149 = [v27 objectForKeyedSubscript:&unk_26E59E3E0];

  double v28 = [(_TVOrganizerView *)self divsByPosition];
  v152 = [v28 objectForKeyedSubscript:&unk_26E59E488];

  double v29 = [(_TVOrganizerView *)self divsByPosition];
  v148 = [v29 objectForKeyedSubscript:&unk_26E59E428];

  long long v30 = [(_TVOrganizerView *)self divsByPosition];
  long long v31 = [v30 objectForKeyedSubscript:&unk_26E59E4A0];

  v151 = v31;
  if (v16)
  {
    long long v32 = [v16 components];
    long long v33 = [v32 firstObject];

    objc_msgSend(v33, "tv_alignmentInsetsForExpectedWidth:", v14);
    double v35 = v34;
    objc_msgSend(v33, "tv_margin");
    double v37 = v35 + v36;

    long long v31 = v151;
  }
  else
  {
    double v37 = *v5;
  }
  double v38 = v5[2];
  unint64_t v39 = v147;
  if (v31)
  {
    v40 = [v31 components];
    v41 = [v40 lastObject];

    objc_msgSend(v41, "tv_alignmentInsetsForExpectedWidth:", v14);
    double v43 = v42;
    objc_msgSend(v41, "tv_margin");
    double v37 = v43 + v44;

    v45 = v151;
    if (v16) {
      goto LABEL_52;
    }
  }
  double v141 = v37;
  double v142 = v38;
  double v143 = v13;
  double v144 = v9;
  double v145 = v7;
  double v146 = v11;
  v46 = [(_TVOrganizerView *)self divSizesByPosition];
  v47 = [v46 objectForKeyedSubscript:&unk_26E59E3B0];
  [v47 CGSizeValue];
  double v137 = v48;
  double v139 = v49;

  v50 = [v46 objectForKeyedSubscript:&unk_26E59E3C8];
  [v50 CGSizeValue];
  double v134 = v51;
  double v136 = v52;

  v53 = [v46 objectForKeyedSubscript:&unk_26E59E3E0];
  [v53 CGSizeValue];
  double v132 = v54;
  double v56 = v55;

  v57 = [v46 objectForKeyedSubscript:&unk_26E59E428];
  [v57 CGSizeValue];
  double v58 = v14;
  double v60 = v59;
  double v62 = v61;

  v63 = [v46 objectForKeyedSubscript:&unk_26E59E410];
  [v63 CGSizeValue];
  double v65 = v64;
  double v67 = v66;

  v68 = [v46 objectForKeyedSubscript:&unk_26E59E3F8];
  [v68 CGSizeValue];
  double v70 = v69;
  double v72 = v71;

  double v73 = fmax(v65, v60);
  double v74 = v62;
  double v75 = v58 - (fmax(v137, fmax(v134, v132)) + fmax(v70, v73));
  if (v75 >= 0.0) {
    double v76 = v75;
  }
  else {
    double v76 = 0.0;
  }
  [v20 sizeThatFits:v76];
  double v78 = v77;
  objc_msgSend(v147, "sizeThatFits:", v76, 0.0);
  double v80 = v79;
  objc_msgSend(v152, "sizeThatFits:", v76, 0.0);
  double v128 = v56;
  double v81 = v139 + v136 + v56;
  double v83 = v82;
  double v138 = v67;
  double v133 = v74;
  double v135 = v72;
  double v84 = fmax(v81, fmax(v78 + v80 + v82, v74 + v67 + v72));
  uint64_t v85 = [MEMORY[0x263EFF9D0] null];
  v86 = (void *)v85;
  v131 = v18;
  v129 = v24;
  if (v18 || v24 || v149)
  {
    if (v18) {
      uint64_t v88 = (uint64_t)v18;
    }
    else {
      uint64_t v88 = v85;
    }
    if (v24) {
      uint64_t v89 = (uint64_t)v24;
    }
    else {
      uint64_t v89 = v85;
    }
    v158[0] = v88;
    v158[1] = v89;
    uint64_t v90 = (uint64_t)v149;
    if (!v149) {
      uint64_t v90 = v85;
    }
    v158[2] = v90;
    v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:3];
    [NSNumber numberWithDouble:v139];
    v92 = v16;
    v93 = v22;
    v95 = v94 = v20;
    v157[0] = v95;
    v96 = [NSNumber numberWithDouble:v136];
    v157[1] = v96;
    v97 = [NSNumber numberWithDouble:v128];
    v157[2] = v97;
    v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:v157 count:3];
    double v140 = __55___TVOrganizerView_tv_alignmentInsetsForExpectedWidth___block_invoke(v84, (uint64_t)v98, v91, v98);
    double v87 = v99;

    v20 = v94;
    uint64_t v22 = v93;
    uint64_t v16 = v92;
    unint64_t v39 = v147;
  }
  else
  {
    double v87 = 1.79769313e308;
    double v140 = 1.79769313e308;
  }
  double v37 = v141;
  v130 = v20;
  if (v20 || v39 || v152)
  {
    if (v20) {
      v102 = v20;
    }
    else {
      v102 = v86;
    }
    if (v39) {
      v103 = v39;
    }
    else {
      v103 = v86;
    }
    v156[0] = v102;
    v156[1] = v103;
    v104 = v152;
    if (!v152) {
      v104 = v86;
    }
    v156[2] = v104;
    v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:3];
    v106 = [NSNumber numberWithDouble:v78];
    v155[0] = v106;
    v107 = [NSNumber numberWithDouble:v80];
    v155[1] = v107;
    v108 = [NSNumber numberWithDouble:v83];
    v155[2] = v108;
    v109 = [MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:3];
    double v101 = __55___TVOrganizerView_tv_alignmentInsetsForExpectedWidth___block_invoke(v84, (uint64_t)v109, v105, v109);
    double v100 = v110;

    if (v22) {
      goto LABEL_39;
    }
  }
  else
  {
    double v100 = 1.79769313e308;
    double v101 = 1.79769313e308;
    if (v22) {
      goto LABEL_39;
    }
  }
  if (v150 || v148)
  {
LABEL_39:
    if (v22) {
      v113 = v22;
    }
    else {
      v113 = v86;
    }
    v114 = v150;
    if (!v150) {
      v114 = v86;
    }
    v154[0] = v113;
    v154[1] = v114;
    v115 = v148;
    if (!v148) {
      v115 = v86;
    }
    v154[2] = v115;
    v116 = [MEMORY[0x263EFF8C0] arrayWithObjects:v154 count:3];
    v117 = [NSNumber numberWithDouble:v135];
    v153[0] = v117;
    v118 = [NSNumber numberWithDouble:v138];
    v153[1] = v118;
    v119 = [NSNumber numberWithDouble:v133];
    v153[2] = v119;
    v120 = [MEMORY[0x263EFF8C0] arrayWithObjects:v153 count:3];
    double v112 = __55___TVOrganizerView_tv_alignmentInsetsForExpectedWidth___block_invoke(v84, (uint64_t)v120, v116, v120);
    double v111 = v121;

    goto LABEL_47;
  }
  double v111 = 1.79769313e308;
  double v112 = 1.79769313e308;
LABEL_47:
  id v5 = (double *)MEMORY[0x263F1D1C0];
  v20 = v130;
  v18 = v131;
  unint64_t v24 = v129;
  v45 = v151;
  double v122 = fmin(v140, fmin(v101, v112));
  if (!v16) {
    double v37 = v122;
  }
  double v123 = fmin(v87, fmin(v100, v111));
  double v38 = v142;
  if (!v151) {
    double v38 = v123;
  }

  double v7 = v145;
  double v11 = v146;
  double v13 = v143;
  double v9 = v144;
LABEL_52:

  double v124 = v7 + v37;
  double v125 = v5[1] + v9;
  double v126 = v5[3] + v13;
  double v127 = v11 + v38;
  result.right = v126;
  result.bottom = v127;
  result.left = v125;
  result.top = v124;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self tv_itemWidth];
  double v7 = v6;
  [(UIView *)self tv_itemHeight];
  double v9 = v8;
  if (v7 > 0.0) {
    double width = v7;
  }
  if (v8 > 0.0) {
    double height = v8;
  }
  double v10 = [(_TVOrganizerView *)self backgroundImageView];

  if (v10)
  {
    double v11 = [(_TVOrganizerView *)self backgroundImageView];
    objc_msgSend(v11, "sizeThatFits:", width, height);
    uint64_t v28 = v13;
    uint64_t v30 = v12;
  }
  else
  {
    uint64_t v28 = *(void *)(MEMORY[0x263F001B0] + 8);
    uint64_t v30 = *MEMORY[0x263F001B0];
  }
  [(UIView *)self tv_padding];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = width - (v16 + v20);
  double v23 = height - (v15 + v18);
  if (v22 < 0.0) {
    double v22 = 0.0;
  }
  if (v23 < 0.0) {
    double v23 = 0.0;
  }
  -[_TVOrganizerView _contentSizeThatFits:](self, "_contentSizeThatFits:", v22, v23);
  double v26 = fmax(v21 + v17 + v24, v31);
  double v27 = fmax(v19 + v15 + v25, v29);
  if (v7 > 0.0) {
    double v26 = v7;
  }
  if (v9 > 0.0) {
    double v27 = v9;
  }
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (void)layoutSubviews
{
  v123.receiver = self;
  v123.super_class = (Class)_TVOrganizerView;
  [(_TVFocusRedirectView *)&v123 layoutSubviews];
  [(_TVOrganizerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(_TVOrganizerView *)self divsByPosition];
  uint64_t v12 = [(_TVOrganizerView *)self divSizesByPosition];
  uint64_t v13 = [(_TVOrganizerView *)self backgroundImageView];
  double v107 = v6;
  double v102 = v8;
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  double v14 = self;
  double v15 = [(_TVOrganizerView *)v14 backgroundImageView];
  char v16 = objc_opt_respondsToSelector();

  double v17 = v14;
  if (v16)
  {
    double v18 = [(_TVOrganizerView *)v14 backgroundImageView];
    double v17 = [v18 contentView];
  }
  [(UIView *)v14 tv_padding];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = v8 - (v21 + v23);
  double v27 = v26;
  double v103 = v10;
  double v28 = v10 - (v19 + v26);
  double v29 = [v11 objectForKeyedSubscript:&unk_26E59E440];
  uint64_t v30 = [v11 objectForKeyedSubscript:&unk_26E59E4A0];
  double v101 = v25;
  if (v29)
  {
    objc_msgSend(v29, "sizeThatFits:", v25, 0.0);
    v124.size.double height = v31;
    v124.origin.x = v22;
    v124.origin.y = v20;
    v124.size.double width = v25;
    CGRect v125 = CGRectIntegral(v124);
    double height = v125.size.height;
    objc_msgSend(v29, "setFrame:", v125.origin.x, v125.origin.y, v125.size.width);
    [v17 addSubview:v29];
    double v20 = v20 + height;
    double v28 = v28 - height;
  }
  double v33 = v28;
  v97 = v30;
  v98 = v29;
  double v34 = v4;
  if (v30)
  {
    objc_msgSend(v30, "sizeThatFits:", v101, 0.0);
    v126.size.double height = v35;
    v126.origin.y = v103 - v27 - v35;
    v126.origin.x = v22;
    v126.size.double width = v101;
    CGRect v127 = CGRectIntegral(v126);
    double v36 = v127.size.height;
    objc_msgSend(v30, "setFrame:", v127.origin.x, v127.origin.y, v127.size.width);
    [v17 addSubview:v30];
    double v37 = v27 + v36;
    double v99 = v33 - v36;
  }
  else
  {
    double v99 = v33;
    double v37 = v27;
  }
  uint64_t v119 = 0;
  v120 = (double *)&v119;
  uint64_t v121 = 0x2020000000;
  uint64_t v122 = 0;
  uint64_t v115 = 0;
  v116 = (double *)&v115;
  uint64_t v117 = 0x2020000000;
  uint64_t v118 = 0;
  v113[0] = MEMORY[0x263EF8330];
  v113[1] = 3221225472;
  v113[2] = __34___TVOrganizerView_layoutSubviews__block_invoke;
  v113[3] = &unk_264BA7E90;
  id v100 = v17;
  id v114 = v100;
  double v38 = (void (**)(void, void, __n128, double))MEMORY[0x230FC9DC0](v113);
  v112[0] = MEMORY[0x263EF8330];
  v112[1] = 3221225472;
  v112[2] = __34___TVOrganizerView_layoutSubviews__block_invoke_2;
  v112[3] = &__block_descriptor_128_e38_v32__0__UIView_8__UIView_16__UIView_24l;
  *(double *)&v112[4] = v34;
  *(double *)&v112[5] = v107;
  *(double *)&v112[6] = v102;
  *(double *)&v112[7] = v103;
  *(double *)&v112[8] = v20;
  *(double *)&v112[9] = v22;
  *(double *)&v112[10] = v37;
  *(double *)&v112[11] = v24;
  *(double *)&v112[12] = v101;
  *(double *)&v112[13] = v99;
  *(double *)&v112[14] = (v22 - v24) * 0.5;
  *(double *)&v112[15] = (v20 - v37) * 0.5;
  unint64_t v39 = (void (**)(void, void, void, void))MEMORY[0x230FC9DC0](v112);
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __34___TVOrganizerView_layoutSubviews__block_invoke_3;
  v111[3] = &unk_264BA7ED8;
  *(double *)&v111[6] = v34;
  *(double *)&v111[7] = v107;
  *(double *)&v111[8] = v102;
  *(double *)&v111[9] = v103;
  *(double *)&v111[10] = v20;
  *(double *)&v111[11] = v22;
  *(double *)&v111[12] = v37;
  *(double *)&v111[13] = v24;
  *(double *)&v111[14] = v101;
  *(double *)&v111[15] = v99;
  v111[4] = &v119;
  v111[5] = &v115;
  *(double *)&v111[16] = (v22 - v24) * 0.5;
  *(double *)&v111[17] = (v20 - v37) * 0.5;
  v40 = (void (**)(void, void, void, void))MEMORY[0x230FC9DC0](v111);
  v41 = [v11 objectForKeyedSubscript:&unk_26E59E3B0];
  double v42 = [v11 objectForKeyedSubscript:&unk_26E59E458];
  v109 = [v11 objectForKeyedSubscript:&unk_26E59E3F8];
  v108 = [v11 objectForKeyedSubscript:&unk_26E59E3C8];
  double v110 = [v11 objectForKeyedSubscript:&unk_26E59E470];
  v106 = [v11 objectForKeyedSubscript:&unk_26E59E410];
  v105 = [v11 objectForKeyedSubscript:&unk_26E59E3E0];
  double v43 = [v11 objectForKeyedSubscript:&unk_26E59E488];
  v104 = [v11 objectForKeyedSubscript:&unk_26E59E428];
  double v44 = [v12 objectForKeyedSubscript:&unk_26E59E3B0];
  [v44 CGSizeValue];
  double v46 = v45;
  double v48 = v47;

  double v49 = [v12 objectForKeyedSubscript:&unk_26E59E3F8];
  [v49 CGSizeValue];
  double v51 = v50;
  double v53 = v52;

  double v54 = [v12 objectForKeyedSubscript:&unk_26E59E3C8];
  [v54 CGSizeValue];
  double v96 = v55;
  double v57 = v56;

  double v58 = [v12 objectForKeyedSubscript:&unk_26E59E410];
  [v58 CGSizeValue];
  double v95 = v59;
  double v61 = v60;

  double v62 = [v12 objectForKeyedSubscript:&unk_26E59E3E0];
  [v62 CGSizeValue];
  double v94 = v63;
  double v65 = v64;

  double v66 = [v12 objectForKeyedSubscript:&unk_26E59E428];
  [v66 CGSizeValue];
  double v93 = v67;
  double v69 = v68;

  double v70 = v120;
  v120[3] = fmax(v46, fmax(v57, v65));
  double v71 = fmax(v51, fmax(v61, v69));
  v116[3] = v71;
  if (v14->_rightColumnDivider)
  {
    -[UIView setFrame:](v14->_leftColumnDivider, "setFrame:", v70[3], v14->_columnDividerPadding, 1.0, v103 + v14->_columnDividerPadding * -2.0);
    -[UIView setFrame:](v14->_rightColumnDivider, "setFrame:", v102 - v116[3], v14->_columnDividerPadding, 1.0, v103 + v14->_columnDividerPadding * -2.0);
    [(UIView *)v14->_rightColumnDivider setBackgroundColor:v14->_columnDividerColor];
    [(UIView *)v14->_leftColumnDivider setBackgroundColor:v14->_columnDividerColor];
    [v100 addSubview:v14->_leftColumnDivider];
    [v100 addSubview:v14->_rightColumnDivider];
    double v72 = v53;
    double v70 = v120;
    double v71 = v116[3];
  }
  else
  {
    double v72 = v53;
  }
  double v73 = v101 - (v70[3] + v71);
  if (v73 > 0.0) {
    double v74 = v73;
  }
  else {
    double v74 = 0.0;
  }
  [v42 sizeThatFits:v74];
  double v76 = v75;
  double v78 = v77;
  objc_msgSend(v110, "sizeThatFits:", v74, 0.0);
  double v80 = v79;
  double v82 = v81;
  objc_msgSend(v43, "sizeThatFits:", v74, 0.0);
  double v83 = v88.n128_f64[0];
  double v85 = v84;
  double v86 = fmax(v76, fmax(v80, v88.n128_f64[0]));
  double v87 = v120;
  v88.n128_f64[0] = v120[3];
  uint64_t v89 = v116;
  if (v86 < v101 + fmax(v88.n128_f64[0], v116[3]) * -2.0)
  {
    float v90 = -(v88.n128_f64[0] + v86 * 0.5 - v101 * 0.5);
    v120[3] = v88.n128_f64[0] + floorf(v90);
    double v91 = v89[3];
    float v92 = -(v91 + v86 * 0.5 - v101 * 0.5);
    v89[3] = v91 + floorf(v92);
    v88.n128_f64[0] = v87[3];
  }
  ((void (**)(void, void *, __n128, double))v38)[2](v38, v41, v88, v48);
  ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v38[2])(v38, v42, v76, v78);
  ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v38[2])(v38, v109, v116[3], v72);
  ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v38[2])(v38, v108, v120[3], v96);
  ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v38[2])(v38, v110, v80, v82);
  ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v38[2])(v38, v106, v116[3], v95);
  ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v38[2])(v38, v105, v120[3], v94);
  ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v38[2])(v38, v43, v83, v85);
  ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v38[2])(v38, v104, v116[3], v93);
  ((void (**)(void, void *, void *, void *))v40)[2](v40, v41, v42, v109);
  ((void (**)(void, void *, void *, void *))v40)[2](v40, v108, v110, v106);
  ((void (**)(void, void *, void *, void *))v40)[2](v40, v105, v43, v104);
  ((void (**)(void, void *, void *, void *))v39)[2](v39, v41, v108, v105);
  ((void (**)(void, void *, void *, void *))v39)[2](v39, v42, v110, v43);
  ((void (**)(void, void *, void *, void *))v39)[2](v39, v109, v106, v104);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __66___TVOrganizerView_setSelected_animated_withAnimationCoordinator___block_invoke;
  v23[3] = &unk_264BA7F00;
  id v9 = v8;
  id v24 = v9;
  BOOL v25 = v5;
  BOOL v26 = v6;
  double v10 = (void (**)(void, void))MEMORY[0x230FC9DC0](v23);
  if ([(UIView *)self->_backgroundImageView tv_showOnHighlight]) {
    ((void (**)(void, UIView *))v10)[2](v10, self->_backgroundImageView);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_components;
  uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    double v17 = @"marquee-on-highlight";
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "setHighlighted:animated:withAnimationCoordinator:", v6, v5, v9, v17);
        if (objc_msgSend(v15, "tv_showOnHighlight")) {
          ((void (**)(void, void *))v10)[2](v10, v15);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v15 setHighlighted:v6];
          char v16 = [v15 valueForTVViewStyle:@"tv-text-highlight-style"];
          if ([v16 isEqualToString:v17])
          {
            [v15 setMarqueeEnabled:v6];
            [v15 setMarqueeRunning:v6];
            if (!v6) {
              [v15 setLineBreakMode:4];
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v15 setSelected:v6 animated:v5];
          }
        }
      }
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = self->_components;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
          objc_msgSend(v9, "setHighlighted:", v3, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedView);
  if (WeakRetained) {
    goto LABEL_2;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(_TVOrganizerView *)self components];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) preferredFocusEnvironments];
        long long v11 = [v10 firstObject];

        if ([v11 canBecomeFocused])
        {

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  long long v11 = 0;
LABEL_13:

  id WeakRetained = v11;
  if (v11)
  {
LABEL_2:
    id v17 = WeakRetained;
    double v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  }
  else
  {
    double v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  obuint64_t j = [a3 nextFocusedView];
  if ([obj isDescendantOfView:self])
  {
    uint64_t v5 = [obj superview];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = [obj superview];
      objc_storeWeak((id *)&self->_lastFocusedView, v7);
    }
    else
    {
      objc_storeWeak((id *)&self->_lastFocusedView, obj);
    }
  }
}

- (CGSize)_contentSizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v5 = [(_TVOrganizerView *)self divsByPosition];
  uint64_t v6 = [(_TVOrganizerView *)self divSizesByPosition];
  uint64_t v7 = [v6 objectForKeyedSubscript:&unk_26E59E3B0];
  [v7 CGSizeValue];
  double v9 = v8;
  double v66 = v10;

  long long v11 = [v6 objectForKeyedSubscript:&unk_26E59E3C8];
  [v11 CGSizeValue];
  double v13 = v12;
  double v65 = v14;

  long long v15 = [v6 objectForKeyedSubscript:&unk_26E59E3E0];
  [v15 CGSizeValue];
  double v17 = v16;
  double v64 = v18;

  uint64_t v19 = [v6 objectForKeyedSubscript:&unk_26E59E428];
  [v19 CGSizeValue];
  double v21 = v20;
  double v63 = v22;

  double v23 = [v6 objectForKeyedSubscript:&unk_26E59E410];
  [v23 CGSizeValue];
  double v25 = v24;
  double v62 = v26;

  double v27 = [v6 objectForKeyedSubscript:&unk_26E59E3F8];
  [v27 CGSizeValue];
  double v29 = v28;
  double v61 = v30;

  double v31 = fmax(v9, fmax(v13, v17));
  double v32 = fmax(v29, fmax(v25, v21));
  if (width - (v31 + v32) >= 0.0) {
    double v33 = width - (v31 + v32);
  }
  else {
    double v33 = 0.0;
  }
  double v34 = [v5 objectForKeyedSubscript:&unk_26E59E458];
  objc_msgSend(v34, "sizeThatFits:", v33, 0.0);
  double v59 = v35;
  double v60 = v36;

  double v37 = [v5 objectForKeyedSubscript:&unk_26E59E470];
  objc_msgSend(v37, "sizeThatFits:", v33, 0.0);
  double v39 = v38;
  double v41 = v40;

  double v42 = [v5 objectForKeyedSubscript:&unk_26E59E488];
  objc_msgSend(v42, "sizeThatFits:", v33, 0.0);
  double v44 = v43;
  double v46 = v45;

  double v47 = fmax(v59, fmax(v39, v44));
  if (v47 < v33 && v32 > 0.0 && v31 > 0.0) {
    double v47 = v33;
  }
  double v50 = v31 + v32 + v47;
  double v51 = objc_msgSend(v5, "objectForKeyedSubscript:", &unk_26E59E440, *(void *)&v59);
  objc_msgSend(v51, "sizeThatFits:", v50, 0.0);
  double v53 = v52;

  double v54 = [v5 objectForKeyedSubscript:&unk_26E59E4A0];
  objc_msgSend(v54, "sizeThatFits:", v50, 0.0);
  double v56 = v55;

  double v57 = v50;
  double v58 = fmax(v66 + v65 + v64, fmax(v60 + v41 + v46, v63 + v62 + v61)) + v53 + v56;
  result.double height = v58;
  result.double width = v57;
  return result;
}

- (int64_t)_positionFromView:(id)a3
{
  int64_t result = objc_msgSend(a3, "tv_position");
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [self tv_associatedIKViewElement];
  uint64_t v6 = [v5 appDocument];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    double v8 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v9 = [(_TVOrganizerView *)self components];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4);
          [v8 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      long long v15 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    }
    else
    {
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (UIView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (double)columnDividerPadding
{
  return self->_columnDividerPadding;
}

- (BOOL)columnDividersEnabled
{
  return self->_columnDividersEnabled;
}

- (UIColor)columnDividerColor
{
  return self->_columnDividerColor;
}

- (void)setColumnDividerColor:(id)a3
{
}

- (BOOL)remembersLastFocusedItem
{
  return self->_remembersLastFocusedItem;
}

- (NSArray)components
{
  return self->_components;
}

- (NSDictionary)divsByPosition
{
  return self->_divsByPosition;
}

- (void)setDivsByPosition:(id)a3
{
}

- (NSDictionary)divSizesByPosition
{
  return self->_divSizesByPosition;
}

- (void)setDivSizesByPosition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divSizesByPosition, 0);
  objc_storeStrong((id *)&self->_divsByPosition, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_columnDividerColor, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_leftColumnDivider, 0);
  objc_storeStrong((id *)&self->_rightColumnDivider, 0);
  objc_destroyWeak((id *)&self->_lastFocusedView);
}

@end