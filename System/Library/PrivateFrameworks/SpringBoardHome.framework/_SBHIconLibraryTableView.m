@interface _SBHIconLibraryTableView
- (SBFFeatherBlurView)headerBlur;
- (_SBHIconLibraryTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)layoutSubviews;
- (void)setHeaderBlur:(id)a3;
@end

@implementation _SBHIconLibraryTableView

- (_SBHIconLibraryTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_SBHIconLibraryTableView;
  v4 = -[_SBHIconLibraryTableView initWithFrame:style:](&v8, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FA5F00]) initWithRecipe:3];
    headerBlur = v4->_headerBlur;
    v4->_headerBlur = (SBFFeatherBlurView *)v5;

    [(_SBHIconLibraryTableView *)v4 addSubview:v4->_headerBlur];
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)_SBHIconLibraryTableView;
  [(_SBHIconLibraryTableView *)&v53 layoutSubviews];
  [(_SBHIconLibraryTableView *)self sectionHeaderHeight];
  if (v3 == *MEMORY[0x1E4FB2F28]) {
    [(_SBHIconLibraryTableView *)self _defaultSectionHeaderHeight];
  }
  else {
    [(_SBHIconLibraryTableView *)self sectionHeaderHeight];
  }
  CGFloat rect2 = v4;
  [(_SBHIconLibraryTableView *)self contentOffset];
  CGFloat v47 = v5;
  [(_SBHIconLibraryTableView *)self bounds];
  CGFloat v46 = v6;
  [(_SBHIconLibraryTableView *)self adjustedContentInset];
  double v8 = v7;
  if (BSFloatGreaterThanFloat())
  {
    [(_SBHIconLibraryTableView *)self contentOffset];
    BOOL v10 = v8 + v9 <= 0.0;
  }
  else
  {
    BOOL v10 = 1;
  }
  if ([(_SBHIconLibraryTableView *)self _headerAndFooterViewsFloat])
  {
    v11 = (void *)MEMORY[0x1E4F1CA70];
    v12 = [(_SBHIconLibraryTableView *)self indexPathsForVisibleRows];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __42___SBHIconLibraryTableView_layoutSubviews__block_invoke;
    v52[3] = &unk_1E6AB04C8;
    v52[4] = self;
    v13 = objc_msgSend(v12, "bs_mapNoNulls:", v52);
    v14 = [v11 orderedSetWithArray:v13];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          [v20 frame];
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          double v28 = v27;
          v56.origin.x = 0.0;
          v56.origin.y = v47;
          v56.size.width = v46;
          v56.size.height = v8;
          double MaxY = CGRectGetMaxY(v56);
          v57.origin.x = v22;
          v57.origin.y = v24;
          v57.size.width = v26;
          v57.size.height = v28;
          double v45 = CGRectGetMaxY(v57);
          v58.origin.x = v22;
          v58.origin.y = v24;
          v58.size.width = v26;
          v58.size.height = v28;
          double MinY = CGRectGetMinY(v58);
          v59.origin.x = 0.0;
          v59.origin.y = v47;
          v59.size.width = v46;
          v59.size.height = v8;
          v62.origin.y = CGRectGetMaxY(v59);
          v62.origin.x = 0.0;
          v60.origin.x = v22;
          v60.origin.y = v24;
          v60.size.width = v26;
          v60.size.height = v28;
          v62.size.width = v46;
          v62.size.height = rect2;
          BOOL v30 = CGRectIntersectsRect(v60, v62);
          BOOL v31 = v45 > MaxY + v28 || MinY < MaxY;
          headerBlur = self->_headerBlur;
          if (v31 && !v30) {
            -[_SBHIconLibraryTableView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v20, headerBlur, MinY, v45);
          }
          else {
            -[_SBHIconLibraryTableView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v20, headerBlur, MinY, v45);
          }
          v61.origin.x = 0.0;
          v61.size.width = v46;
          v61.origin.y = v47;
          v61.size.height = v8;
          v63.origin.x = v22;
          v63.origin.y = v24;
          v63.size.width = v26;
          v63.size.height = v28;
          BOOL v34 = CGRectIntersectsRect(v61, v63);
          double v35 = 1.0;
          if (v34)
          {
            SBHCGRectIntersectionAsPercentage(0.0, v47, v46, v8, v22, v24, v26, v28);
            double v35 = v36 * -3.0 + 1.0;
            if (v35 < 0.0) {
              double v35 = 0.0;
            }
          }
          [v20 setAlpha:v35];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v17);
    }

    uint64_t v37 = [v15 count];
    double v38 = -0.0;
    if (v37) {
      double v38 = rect2;
    }
    double v8 = v8 + v38;
  }
  -[SBFFeatherBlurView setFrame:](self->_headerBlur, "setFrame:", 0.0, v47, v46, v8 + 12.0);
  v39 = (void *)MEMORY[0x1E4FA5F00];
  v40 = [(SBFFeatherBlurView *)self->_headerBlur window];
  v41 = objc_msgSend(v39, "matchMoveAnimationForFrame:relativeToView:", v40, 0.0, v47 - v47, v46, v8 + 12.0);

  v42 = [(SBFFeatherBlurView *)self->_headerBlur layer];
  [v42 addAnimation:v41 forKey:@"SBHIconLibraryTableViewMatchMoveAnimation"];

  [(SBFFeatherBlurView *)self->_headerBlur setHidden:v10];
}

- (SBFFeatherBlurView)headerBlur
{
  return self->_headerBlur;
}

- (void)setHeaderBlur:(id)a3
{
}

- (void).cxx_destruct
{
}

@end