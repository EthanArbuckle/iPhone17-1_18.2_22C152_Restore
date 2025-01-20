@interface _UIBarCustomizationChiclet
- (BOOL)_isDisplayingRootItem;
- (BOOL)fixed;
- (BOOL)labelVisible;
- (BOOL)minimized;
- (BOOL)platterVisible;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)_contentSizeWithInterItemSpacing:(double)a3;
- (CGSize)_currentContentSize;
- (CGSize)fittingSizeWithChicletSize:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)subitemViews;
- (UILabel)label;
- (UIPointerInteraction)pointerInteraction;
- (UIView)contentWrapperView;
- (UIView)platterView;
- (UIView)rootItemView;
- (_UIBarCustomizationChiclet)initWithItem:(id)a3;
- (_UIBarCustomizationChicletAnchorView)anchorView;
- (_UIBarCustomizationItem)representedItem;
- (double)_currentInterItemSpacing;
- (double)_interItemSpacingForChicletSize:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)chicletSize;
- (void)_addContentView:(id)a3;
- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3;
- (void)_updatePlatterShadow;
- (void)layoutSubviews;
- (void)setAnchorView:(id)a3;
- (void)setChicletSize:(int64_t)a3;
- (void)setContentWrapperView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelVisible:(BOOL)a3;
- (void)setMinimized:(BOOL)a3;
- (void)setPlatterView:(id)a3;
- (void)setPlatterVisible:(BOOL)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setRootItemView:(id)a3;
- (void)setSubitemViews:(id)a3;
- (void)sizeToFit;
- (void)updateItemCenterPoints;
@end

@implementation _UIBarCustomizationChiclet

- (_UIBarCustomizationChiclet)initWithItem:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_UIBarCustomizationChiclet;
  v5 = -[UIView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_chicletSize = 0;
    objc_storeWeak((id *)&v5->_representedItem, v4);
    objc_msgSend(v4, "set_chiclet:", v6);
    [v4 _sourceFrameInContainer:0];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    v15 = objc_opt_new();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __43___UIBarCustomizationChiclet_initWithItem___block_invoke;
    v44[3] = &unk_1E52EB010;
    id v16 = v15;
    id v45 = v16;
    CGFloat v46 = v8;
    CGFloat v47 = v10;
    CGFloat v48 = v12;
    CGFloat v49 = v14;
    [v4 _enumerateSubitemsWithBlock:v44];
    v17 = _itemViewFromItem(v4, v8, v10, v12, v14);
    [(_UIBarCustomizationChiclet *)v6 setRootItemView:v17];

    [(_UIBarCustomizationChiclet *)v6 setSubitemViews:v16];
    v18 = [UIView alloc];
    [(UIView *)v6 bounds];
    v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
    [(_UIBarCustomizationChiclet *)v6 setContentWrapperView:v19];

    v20 = [(_UIBarCustomizationChiclet *)v6 contentWrapperView];
    [(UIView *)v6 addSubview:v20];

    v21 = [UIView alloc];
    [(UIView *)v6 bounds];
    v22 = -[UIView initWithFrame:](v21, "initWithFrame:");
    [(_UIBarCustomizationChiclet *)v6 setPlatterView:v22];

    v23 = +[UIColor systemBackgroundColor];
    v24 = [(_UIBarCustomizationChiclet *)v6 platterView];
    [v24 setBackgroundColor:v23];

    v25 = [(_UIBarCustomizationChiclet *)v6 platterView];
    v26 = [v25 layer];
    [v26 setShadowPathIsBounds:1];

    v27 = [(_UIBarCustomizationChiclet *)v6 platterView];
    v28 = [v27 layer];
    [v28 setAllowsEdgeAntialiasing:1];

    v29 = [(_UIBarCustomizationChiclet *)v6 contentWrapperView];
    v30 = [(_UIBarCustomizationChiclet *)v6 platterView];
    [v29 addSubview:v30];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v31 = v16;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v41;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v41 != v34) {
            objc_enumerationMutation(v31);
          }
          -[_UIBarCustomizationChiclet _addContentView:](v6, "_addContentView:", *(void *)(*((void *)&v40 + 1) + 8 * v35++), (void)v40);
        }
        while (v33 != v35);
        uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v33);
    }

    v36 = [(_UIBarCustomizationChiclet *)v6 rootItemView];
    [(_UIBarCustomizationChiclet *)v6 _addContentView:v36];

    v37 = [[UIPointerInteraction alloc] initWithDelegate:v6];
    [(_UIBarCustomizationChiclet *)v6 setPointerInteraction:v37];

    v38 = [(_UIBarCustomizationChiclet *)v6 pointerInteraction];
    [(UIView *)v6 addInteraction:v38];
  }
  return v6;
}

- (void)updateItemCenterPoints
{
  id v21 = [(_UIBarCustomizationChiclet *)self representedItem];
  [v21 _sourceFrameInContainer:0];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(_UIBarCustomizationChiclet *)self rootItemView];
  _updateSourceCenterForItemView(v21, v11, v4, v6, v8, v10);

  CGFloat v12 = [v21 subitems];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    do
    {
      v15 = [v21 subitems];
      id v16 = [v15 objectAtIndexedSubscript:v14];
      v17 = [(_UIBarCustomizationChiclet *)self subitemViews];
      v18 = [v17 objectAtIndexedSubscript:v14];
      _updateSourceCenterForItemView(v16, v18, v4, v6, v8, v10);

      ++v14;
      v19 = [v21 subitems];
      unint64_t v20 = [v19 count];
    }
    while (v20 > v14);
  }
}

- (void)_addContentView:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v10;
    double v5 = [v4 sourceView];
    CGFloat v6 = [v5 window];

    if (!v6)
    {
      double v7 = +[_UIBarCustomizationCustomViewPortalSourceContainer sharedContainer];
      CGFloat v8 = [v4 sourceView];
      [v7 addSubview:v8];
    }
  }
  double v9 = [(_UIBarCustomizationChiclet *)self contentWrapperView];
  [v9 addSubview:v10];
}

- (void)layoutSubviews
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  v150.receiver = self;
  v150.super_class = (Class)_UIBarCustomizationChiclet;
  [(UIView *)&v150 layoutSubviews];
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGFloat v12 = [(_UIBarCustomizationChiclet *)self contentWrapperView];
  if ([(_UIBarCustomizationChiclet *)self minimized])
  {
    objc_msgSend(v12, "setFrame:", round(v5 + v9 * 0.5 + -19.0), round(v7 + v11 * 0.5 + -19.0), 38.0, 38.0);
    uint64_t v13 = [(_UIBarCustomizationChiclet *)self platterView];
    [v12 bounds];
    objc_msgSend(v13, "setFrame:");
    [v13 setAlpha:1.0];
    [v13 bounds];
    [v13 _setCornerRadius:CGRectGetWidth(v155) * 0.5];
    unint64_t v14 = [(UIView *)self tintColor];
    [v13 setBackgroundColor:v14];

    v15 = [(UIView *)self traitCollection];
    id v16 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
    v17 = [v16 configurationWithTraitCollection:v15];
    v18 = +[UIImage systemImageNamed:@"ellipsis.circle" withConfiguration:v17];
    v19 = [v18 _outlinePath];

    id v20 = v19;
    CFArrayRef SeparateComponents = CGPathCreateSeparateComponents((CGPathRef)[v20 CGPath], 0);
    CFIndex Count = CFArrayGetCount(SeparateComponents);
    double v23 = 0.0;
    if (Count >= 1)
    {
      CFIndex v24 = Count;
      CFIndex v25 = 0;
      while (1)
      {
        ValueAtIndeCGFloat x = (const CGPath *)CFArrayGetValueAtIndex(SeparateComponents, v25);
        PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(ValueAtIndex);
        CGFloat x = PathBoundingBox.origin.x;
        CGFloat y = PathBoundingBox.origin.y;
        CGFloat width = PathBoundingBox.size.width;
        CGFloat height = PathBoundingBox.size.height;
        double v31 = CGRectGetWidth(PathBoundingBox);
        [v20 bounds];
        if (v31 < CGRectGetWidth(v157) * 0.5) {
          break;
        }
        if (v24 == ++v25) {
          goto LABEL_54;
        }
      }
      v169.origin.CGFloat x = x;
      v169.origin.CGFloat y = y;
      v169.size.CGFloat width = width;
      v169.size.CGFloat height = height;
      double v23 = CGRectGetWidth(v169);
    }
LABEL_54:

    CGAffineTransformMakeScale(&v149, v23 / 38.0, v23 / 38.0);
    CGAffineTransform v148 = v149;
    [(UIView *)self setTransform:&v148];
    [v12 bounds];
    double v111 = v110 + v109 * 0.5;
    double v114 = v113 + v112 * 0.5;
    v115 = [(_UIBarCustomizationChiclet *)self rootItemView];
    objc_msgSend(v115, "setCenter:", v111, v114);

    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    v65 = [(_UIBarCustomizationChiclet *)self subitemViews];
    uint64_t v116 = [v65 countByEnumeratingWithState:&v144 objects:v153 count:16];
    if (v116)
    {
      uint64_t v117 = v116;
      uint64_t v118 = *(void *)v145;
      do
      {
        for (uint64_t i = 0; i != v117; ++i)
        {
          if (*(void *)v145 != v118) {
            objc_enumerationMutation(v65);
          }
          v120 = *(void **)(*((void *)&v144 + 1) + 8 * i);
          v121 = [(_UIBarCustomizationChiclet *)self rootItemView];
          [v121 center];
          objc_msgSend(v120, "setCenter:");

          [v120 setAlpha:0.0];
        }
        uint64_t v117 = [v65 countByEnumeratingWithState:&v144 objects:v153 count:16];
      }
      while (v117);
    }
  }
  else
  {
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
    long long v123 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v124 = *MEMORY[0x1E4F1DAB8];
    v143[0] = *MEMORY[0x1E4F1DAB8];
    v143[1] = v123;
    long long v122 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v143[2] = v122;
    [(UIView *)self setTransform:v143];
    uint64_t v32 = [(_UIBarCustomizationChiclet *)self representedItem];
    [v32 _sourceFrameInContainer:0];

    [(_UIBarCustomizationChiclet *)self _currentContentSize];
    double v34 = v33;
    double v36 = v35;
    uint64_t v13 = [(_UIBarCustomizationChiclet *)self subitemViews];
    if ([(_UIBarCustomizationChiclet *)self platterVisible])
    {
      int v37 = [v13 count];
      [(_UIBarCustomizationChiclet *)self _currentInterItemSpacing];
      double v39 = v34 - v38 * (double)(v37 - 1);
      v158.origin.CGFloat x = v5;
      v158.origin.CGFloat y = v7;
      v158.size.CGFloat width = v9;
      v158.size.CGFloat height = v11;
      double v40 = (CGRectGetWidth(v158) - v39) / (double)(v37 + 1);
      if (v40 >= 16.0) {
        double v41 = v40;
      }
      else {
        double v41 = 16.0;
      }
      if ([v13 count])
      {
        unint64_t v42 = 0;
        double v43 = 0.0;
        do
        {
          v44 = [v13 objectAtIndexedSubscript:v42];
          id v45 = [(_UIBarCustomizationChiclet *)self representedItem];
          CGFloat v46 = [v45 subitems];
          CGFloat v47 = [v46 objectAtIndexedSubscript:v42];
          CGFloat v48 = [v47 tintColor];
          [v44 setTintColor:v48];

          [v44 bounds];
          CGFloat v49 = CGRectGetWidth(v159) * 0.5;
          objc_msgSend(v44, "setCenter:", v41 + v43 + v49, v7 + v11 * 0.5);
          [v44 center];
          double v43 = v49 + v50;

          ++v42;
        }
        while ([v13 count] > v42);
      }
    }
    else
    {
      v160.origin.CGFloat x = v5;
      v160.origin.CGFloat y = v7;
      v160.size.CGFloat width = v9;
      v160.size.CGFloat height = v11;
      double v51 = CGRectGetWidth(v160);
      v161.origin.CGFloat x = v5;
      v161.origin.CGFloat y = v7;
      v161.size.CGFloat width = v9;
      v161.size.CGFloat height = v11;
      double v52 = CGRectGetHeight(v161);
      if ([v13 count])
      {
        unint64_t v53 = 0;
        double v54 = (v51 - v34) * 0.5;
        double v55 = (v52 - v36) * 0.5;
        do
        {
          v56 = [v13 objectAtIndexedSubscript:v53];
          [v56 _getSourceCenter];
          objc_msgSend(v56, "setCenter:", v54 + v57, v55 + v58);
          v59 = [(_UIBarCustomizationChiclet *)self representedItem];
          v60 = [v59 subitems];
          v61 = [v60 objectAtIndexedSubscript:v53];

          if (([v61 enabled] & 1) == 0)
          {
            v62 = [v61 tintColor];
            v63 = v62;
            if (!v62)
            {
              v2 = [(UIView *)self tintColor];
              v63 = v2;
            }
            v64 = +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v63);
            [v56 setTintColor:v64];

            if (!v62) {
          }
            }

          ++v53;
        }
        while ([v13 count] > v53);
      }
    }
    v65 = [(_UIBarCustomizationChiclet *)self rootItemView];
    objc_msgSend(v65, "setCenter:", v5 + v9 * 0.5, v7 + v11 * 0.5);
    if ([(_UIBarCustomizationChiclet *)self _isDisplayingRootItem])
    {
      [v65 setAlpha:1.0];
      v142[0] = v124;
      v142[1] = v123;
      v142[2] = v122;
      [v65 setTransform:v142];
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v66 = v13;
      uint64_t v67 = [v66 countByEnumeratingWithState:&v138 objects:v152 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v139;
        do
        {
          for (uint64_t j = 0; j != v68; ++j)
          {
            if (*(void *)v139 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = *(void **)(*((void *)&v138 + 1) + 8 * j);
            memset(&v137, 0, sizeof(v137));
            [v65 center];
            double v73 = v72;
            [v71 center];
            CGFloat v75 = v73 - v74;
            [v65 center];
            double v77 = v76;
            [v71 center];
            CGAffineTransformMakeTranslation(&v137, v75, v77 - v78);
            CGAffineTransform v135 = v137;
            CGAffineTransformScale(&v136, &v135, 0.5, 0.5);
            CGAffineTransform v134 = v136;
            [v71 setTransform:&v134];
            [v71 setAlpha:0.0];
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v138 objects:v152 count:16];
        }
        while (v68);
      }
    }
    else
    {
      [v65 setAlpha:0.0];
      CGAffineTransformMakeScale(&v133, 0.5, 0.5);
      CGAffineTransform v132 = v133;
      [v65 setTransform:&v132];
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v79 = v13;
      uint64_t v80 = [v79 countByEnumeratingWithState:&v128 objects:v151 count:16];
      if (v80)
      {
        uint64_t v81 = v80;
        uint64_t v82 = *(void *)v129;
        do
        {
          for (uint64_t k = 0; k != v81; ++k)
          {
            if (*(void *)v129 != v82) {
              objc_enumerationMutation(v79);
            }
            v84 = *(void **)(*((void *)&v128 + 1) + 8 * k);
            [v84 frame];
            double MaxX = CGRectGetMaxX(v162);
            v163.origin.CGFloat x = v5;
            v163.origin.CGFloat y = v7;
            v163.size.CGFloat width = v9;
            v163.size.CGFloat height = v11;
            if (MaxX <= CGRectGetWidth(v163))
            {
              v125[0] = v124;
              v125[1] = v123;
              v125[2] = v122;
              [v84 setTransform:v125];
              [v84 setAlpha:1.0];
            }
            else
            {
              [v84 setAlpha:0.0];
              CGAffineTransformMakeScale(&v127, 0.0, 0.0);
              CGAffineTransform v126 = v127;
              [v84 setTransform:&v126];
              int v86 = [v79 indexOfObject:v84];
              v87 = [v79 objectAtIndexedSubscript:v86 - (v86 > 0)];
              [v87 center];
              objc_msgSend(v84, "setCenter:");
            }
          }
          uint64_t v81 = [v79 countByEnumeratingWithState:&v128 objects:v151 count:16];
        }
        while (v81);
      }
    }

    if ([(_UIBarCustomizationChiclet *)self platterVisible])
    {
      BOOL v88 = [(_UIBarCustomizationChiclet *)self fixed];
      v89 = [(_UIBarCustomizationChiclet *)self platterView];
      double v90 = 1.0;
      if (v88)
      {
        double v90 = 0.0;
        double v91 = 2.0;
      }
      else
      {
        double v91 = 0.0;
      }
    }
    else
    {
      v89 = [(_UIBarCustomizationChiclet *)self platterView];
      double v90 = 0.0;
      double v91 = 2.0;
    }
    [v89 setAlpha:v90];
    v92 = +[UIColor systemBackgroundColor];
    [v89 setBackgroundColor:v92];

    [v12 bounds];
    CGRect v165 = CGRectInset(v164, v91, v91);
    objc_msgSend(v89, "setFrame:", v165.origin.x, v165.origin.y, v165.size.width, v165.size.height);
    int64_t v93 = [(_UIBarCustomizationChiclet *)self chicletSize];
    double v94 = 13.0;
    if (v93 != 1) {
      double v94 = 10.0;
    }
    [v89 _setContinuousCornerRadius:v94];
    [(_UIBarCustomizationChiclet *)self _updatePlatterShadow];
    v95 = [(_UIBarCustomizationChiclet *)self label];

    if (v95)
    {
      [v89 bounds];
      objc_msgSend(v89, "convertRect:toView:", self);
      CGFloat v96 = v166.origin.x;
      CGFloat v97 = v166.origin.y;
      CGFloat v98 = v166.size.width;
      CGFloat v99 = v166.size.height;
      double MidX = CGRectGetMidX(v166);
      v167.origin.CGFloat x = v96;
      v167.origin.CGFloat y = v97;
      v167.size.CGFloat width = v98;
      v167.size.CGFloat height = v99;
      CGFloat v101 = CGRectGetMaxY(v167) + 10.0;
      v102 = [(_UIBarCustomizationChiclet *)self label];
      objc_msgSend(v102, "setCenter:", MidX, v101);

      v103 = [(_UIBarCustomizationChiclet *)self label];
      [v89 bounds];
      objc_msgSend(v103, "sizeThatFits:", CGRectGetWidth(v168) + 20.0, 0.0);
      double v105 = v104;
      double v107 = v106;

      v108 = [(_UIBarCustomizationChiclet *)self label];
      objc_msgSend(v108, "setBounds:", 0.0, 0.0, v105, v107);
    }
  }
}

- (void)setPlatterVisible:(BOOL)a3
{
  if (self->_platterVisible != a3)
  {
    self->_BOOL platterVisible = a3;
    if ([(_UIBarCustomizationChiclet *)self fixed])
    {
      BOOL platterVisible = self->_platterVisible;
      double v5 = [(_UIBarCustomizationChiclet *)self representedItem];
      double v6 = [v5 tintColor];
      if (platterVisible)
      {
        double v7 = +[UIColor _alertControllerDimmingViewColor];
        double v8 = [v6 _colorBlendedWithColor:v7];
        [(UIView *)self setTintColor:v8];

        double v9 = 0.32;
      }
      else
      {
        [(UIView *)self setTintColor:v6];

        double v9 = 1.0;
      }
      [(UIView *)self setAlpha:v9];
    }
    else
    {
      [(UIView *)self setNeedsLayout];
      if (+[UIView _isInAnimationBlock])
      {
        [(_UIBarCustomizationChiclet *)self sizeToFit];
        [(UIView *)self layoutIfNeeded];
      }
    }
  }
}

- (void)setLabelVisible:(BOOL)a3
{
  if (self->_labelVisible != a3)
  {
    self->_labelVisible = a3;
    [(UIView *)self setNeedsLayout];
    if (self->_labelVisible)
    {
      double v4 = [(_UIBarCustomizationChiclet *)self label];

      if (!v4)
      {
        double v5 = objc_opt_new();
        [(_UIBarCustomizationChiclet *)self setLabel:v5];

        double v6 = [(_UIBarCustomizationChiclet *)self label];
        [v6 setTextAlignment:1];

        double v7 = [(_UIBarCustomizationChiclet *)self label];
        [v7 setAllowsDefaultTighteningForTruncation:1];

        double v8 = [(_UIBarCustomizationChiclet *)self label];
        [v8 setAdjustsFontForContentSizeCategory:1];

        double v9 = [(_UIBarCustomizationChiclet *)self label];
        [v9 setNumberOfLines:2];

        double v10 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption2"];
        double v11 = [(_UIBarCustomizationChiclet *)self label];
        [v11 setFont:v10];

        CGFloat v12 = [(_UIBarCustomizationChiclet *)self representedItem];
        uint64_t v13 = [v12 name];
        unint64_t v14 = [(_UIBarCustomizationChiclet *)self label];
        [v14 setText:v13];

        v15 = [(_UIBarCustomizationChiclet *)self label];
        id v16 = [v15 layer];
        objc_msgSend(v16, "setAnchorPoint:", 0.5, 0.0);

        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __46___UIBarCustomizationChiclet_setLabelVisible___block_invoke;
        v19[3] = &unk_1E52D9F70;
        v19[4] = self;
        +[UIView performWithoutAnimation:v19];
      }
    }
    if (self->_labelVisible) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.0;
    }
    v18 = [(_UIBarCustomizationChiclet *)self label];
    [v18 setAlpha:v17];
  }
}

- (void)setMinimized:(BOOL)a3
{
  if (self->_minimized != a3)
  {
    self->_minimized = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (BOOL)fixed
{
  v2 = [(_UIBarCustomizationChiclet *)self representedItem];
  double v3 = [v2 identifier];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)sizeToFit
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[_UIBarCustomizationChiclet sizeThatFits:](self, "sizeThatFits:", v7, v9);
  if (v8 != v11 || v10 != v12)
  {
    -[UIView setBounds:](self, "setBounds:", v4, v6, v11, v12);
    id v14 = [(_UIBarCustomizationChiclet *)self pointerInteraction];
    [v14 invalidate];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t v4 = [(_UIBarCustomizationChiclet *)self chicletSize];
  [(_UIBarCustomizationChiclet *)self fittingSizeWithChicletSize:v4];
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)fittingSizeWithChicletSize:(int64_t)a3
{
  -[_UIBarCustomizationChiclet _interItemSpacingForChicletSize:](self, "_interItemSpacingForChicletSize:");
  double v6 = v5;
  -[_UIBarCustomizationChiclet _contentSizeWithInterItemSpacing:](self, "_contentSizeWithInterItemSpacing:");
  if (a3 == 1)
  {
    uint64_t v9 = 0;
    double v10 = v7 + 20.0;
    do
    {
      if (v10 <= fittingSizeWithChicletSize___sizeBuckets[v9]) {
        break;
      }
      ++v9;
    }
    while (v9 != 4);
    if (v9 >= 3) {
      LODWORD(v9) = 3;
    }
    double v11 = fittingSizeWithChicletSize___sizeBuckets[v9];
    if (v11 < 60.0) {
      double v11 = 60.0;
    }
    if (v8 < 60.0) {
      double v8 = 60.0;
    }
  }
  else
  {
    if (v8 < 38.0) {
      double v8 = 38.0;
    }
    double v11 = v6 + v6 + v7;
    if (v11 < 38.0) {
      double v11 = 38.0;
    }
  }
  result.CGFloat height = v8;
  result.CGFloat width = v11;
  return result;
}

- (CGSize)_currentContentSize
{
  [(_UIBarCustomizationChiclet *)self _currentInterItemSpacing];
  -[_UIBarCustomizationChiclet _contentSizeWithInterItemSpacing:](self, "_contentSizeWithInterItemSpacing:");
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGSize)_contentSizeWithInterItemSpacing:(double)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  if ([(_UIBarCustomizationChiclet *)self _isDisplayingRootItem])
  {
    double v5 = [(_UIBarCustomizationChiclet *)self rootItemView];
    v46[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  }
  else
  {
    double v6 = [(_UIBarCustomizationChiclet *)self subitemViews];
  }
  if ([(_UIBarCustomizationChiclet *)self platterVisible])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      double v11 = 0.0;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * i) bounds];
          CGFloat x = v48.origin.x;
          CGFloat y = v48.origin.y;
          CGFloat width = v48.size.width;
          CGFloat height = v48.size.height;
          double v12 = v12 + CGRectGetWidth(v48);
          v49.origin.CGFloat x = x;
          v49.origin.CGFloat y = y;
          v49.size.CGFloat width = width;
          v49.size.CGFloat height = height;
          double v18 = CGRectGetHeight(v49);
          if (v11 < v18) {
            double v11 = v18;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
      double v12 = 0.0;
    }

    double v27 = v12 + (double)(unint64_t)([v7 count] - 1) * a3;
  }
  else
  {
    v19 = [v6 firstObject];
    id v20 = [v6 lastObject];
    [v19 bounds];
    double MidX = CGRectGetMidX(v50);
    [v20 _getSourceCenter];
    double v23 = v22;
    [v19 _getSourceCenter];
    double v25 = v23 - v24;
    [v20 bounds];
    double v26 = MidX + v25 + CGRectGetMidX(v51);
    double v11 = 0.0;
    long long v36 = 0u;
    long long v37 = 0u;
    double v27 = v26;
    long long v38 = 0u;
    long long v39 = 0u;
    id v28 = v6;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "bounds", (void)v36);
          double v33 = CGRectGetHeight(v52);
          if (v11 < v33) {
            double v11 = v33;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v30);
    }
  }
  double v34 = v27;
  double v35 = v11;
  result.CGFloat height = v35;
  result.CGFloat width = v34;
  return result;
}

- (double)_currentInterItemSpacing
{
  int64_t v3 = [(_UIBarCustomizationChiclet *)self chicletSize];
  [(_UIBarCustomizationChiclet *)self _interItemSpacingForChicletSize:v3];
  return result;
}

- (double)_interItemSpacingForChicletSize:(int64_t)a3
{
  double result = 16.0;
  if (a3 == 1) {
    return 20.0;
  }
  return result;
}

- (void)_updatePlatterShadow
{
  int64_t v3 = [(_UIBarCustomizationChiclet *)self chicletSize];
  if (v3 == 1) {
    double v4 = 4.0;
  }
  else {
    double v4 = 2.0;
  }
  if (v3 == 1) {
    double v5 = 32.0;
  }
  else {
    double v5 = 16.0;
  }
  double v6 = [(_UIBarCustomizationChiclet *)self platterView];
  id v7 = [v6 layer];
  LODWORD(v8) = 1036831949;
  [v7 setShadowOpacity:v8];

  uint64_t v9 = [(_UIBarCustomizationChiclet *)self platterView];
  uint64_t v10 = [v9 layer];
  [v10 setShadowRadius:v5];

  id v12 = [(_UIBarCustomizationChiclet *)self platterView];
  double v11 = [v12 layer];
  objc_msgSend(v11, "setShadowOffset:", 0.0, v4);
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)_UIBarCustomizationChiclet;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v18, sel__traitCollectionDidChangeOnSubtreeInternal_);
  var1 = a3->var1;
  if (var1)
  {
    var0 = a3->var0;
    if (!a3->var0 || var1[13] != var0[13] || var1[15] != var0[15])
    {
      id v7 = [(_UIBarCustomizationChiclet *)self rootItemView];
      [v7 sizeToFit];

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      double v8 = [(_UIBarCustomizationChiclet *)self subitemViews];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v14 + 1) + 8 * v12++) sizeToFit];
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v10);
      }

      [(_UIBarCustomizationChiclet *)self sizeToFit];
      [(UIView *)self setNeedsLayout];
      uint64_t v13 = [(_UIBarCustomizationChiclet *)self anchorView];
      [v13 sizeToFit];
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat width = v12;
  CGFloat height = v14;
  if ([v7 type] == 11)
  {
    v20.origin.double x = v9;
    v20.origin.double y = v11;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectInset(v20, -10.0, -10.0);
    CGFloat v9 = v21.origin.x;
    CGFloat v11 = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }
  v22.origin.double x = v9;
  v22.origin.double y = v11;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  v19.double x = x;
  v19.double y = y;
  if (CGRectContainsPoint(v22, v19))
  {
    BOOL v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIBarCustomizationChiclet;
    BOOL v16 = -[UIView pointInside:withEvent:](&v18, sel_pointInside_withEvent_, v7, x, y);
  }

  return v16;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat width = v12;
  CGFloat height = v14;
  uint64_t v16 = [v7 type];

  if (v16 == 11)
  {
    v21.origin.CGFloat x = v9;
    v21.origin.CGFloat y = v11;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectInset(v21, -10.0, -10.0);
    CGFloat v9 = v22.origin.x;
    CGFloat v11 = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  v23.origin.CGFloat x = v9;
  v23.origin.CGFloat y = v11;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  v20.CGFloat x = x;
  v20.CGFloat y = y;
  if (CGRectContainsPoint(v23, v20)) {
    long long v17 = self;
  }
  else {
    long long v17 = 0;
  }
  return v17;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  [(UIView *)self bounds];
  CGRect v9 = CGRectInset(v8, -10.0, -10.0);
  double v5 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  [v5 setLatchingAxes:3];
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5 = [(_UIBarCustomizationChiclet *)self platterView];
  double v6 = [(_UIBarCustomizationChiclet *)self contentWrapperView];
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  long long v15 = [v6 superview];
  objc_msgSend(v5, "convertRect:toView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [v5 _cornerRadius];
  double v25 = v24;
  double v26 = objc_opt_new();
  double v27 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v17, v19, v21, v23, v25);
  [v26 setShadowPath:v27];

  id v28 = [[UITargetedPreview alloc] initWithView:v6 parameters:v26];
  uint64_t v29 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v17, v19, v21, v23, v25);
  uint64_t v30 = +[UIPointerEffect effectWithPreview:v28];
  uint64_t v31 = +[UIPointerStyle styleWithEffect:v30 shape:v29];

  return v31;
}

- (BOOL)_isDisplayingRootItem
{
  int64_t v3 = [(_UIBarCustomizationChiclet *)self representedItem];
  if ([v3 collapsed])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(_UIBarCustomizationChiclet *)self subitemViews];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (BOOL)platterVisible
{
  return self->_platterVisible;
}

- (BOOL)labelVisible
{
  return self->_labelVisible;
}

- (BOOL)minimized
{
  return self->_minimized;
}

- (int64_t)chicletSize
{
  return self->_chicletSize;
}

- (void)setChicletSize:(int64_t)a3
{
  self->_chicletSize = a3;
}

- (_UIBarCustomizationChicletAnchorView)anchorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_anchorView);
  return (_UIBarCustomizationChicletAnchorView *)WeakRetained;
}

- (void)setAnchorView:(id)a3
{
}

- (_UIBarCustomizationItem)representedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representedItem);
  return (_UIBarCustomizationItem *)WeakRetained;
}

- (UIView)contentWrapperView
{
  return self->_contentWrapperView;
}

- (void)setContentWrapperView:(id)a3
{
}

- (UIView)rootItemView
{
  return self->_rootItemView;
}

- (void)setRootItemView:(id)a3
{
}

- (NSArray)subitemViews
{
  return self->_subitemViews;
}

- (void)setSubitemViews:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_subitemViews, 0);
  objc_storeStrong((id *)&self->_rootItemView, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
  objc_destroyWeak((id *)&self->_representedItem);
  objc_destroyWeak((id *)&self->_anchorView);
}

@end