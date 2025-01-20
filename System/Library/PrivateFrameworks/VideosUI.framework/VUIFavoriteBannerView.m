@interface VUIFavoriteBannerView
- (CGSize)_imageSizeForBannerStyle:(unint64_t)a3;
- (CGSize)_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)imageSizeForBannerStyle:(unint64_t)a3 sizeClass:(int64_t)a4;
- (CGSize)maxImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)backgroundImageLogos;
- (UIView)backgroundView;
- (VUIFavoriteBannerLayout)layout;
- (VUILabel)subtitleLabel;
- (VUILabel)titleLabel;
- (id)_generatePlainWeaveImagePointsForSize:(CGSize)a3;
- (id)_generatePointsForPlainWeaveSide:(double)a3 containerRect:(CGRect)a4 imageSize:(CGSize)a5 direction:(unint64_t)a6;
- (id)_generateSiderowImagePointsForSize:(CGSize)a3;
- (id)_generateSingleRowImagePoints;
- (void)layoutSubviews;
- (void)prepareForCellReuse;
- (void)setBackgroundImageLogos:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation VUIFavoriteBannerView

- (void)setTitleLabel:(id)a3
{
  v4 = (VUILabel *)a3;
  titleLabel = self->_titleLabel;
  if (titleLabel != v4) {
    [(VUILabel *)titleLabel removeFromSuperview];
  }
  if (v4 && ([(VUILabel *)v4 isDescendantOfView:self] & 1) == 0) {
    [(VUIFavoriteBannerView *)self addSubview:v4];
  }
  v6 = self->_titleLabel;
  self->_titleLabel = v4;

  [(VUIFavoriteBannerView *)self setNeedsLayout];
}

- (void)setSubtitleLabel:(id)a3
{
  v4 = (VUILabel *)a3;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel != v4) {
    [(VUILabel *)subtitleLabel removeFromSuperview];
  }
  if (v4 && ([(VUILabel *)v4 isDescendantOfView:self] & 1) == 0) {
    [(VUIFavoriteBannerView *)self addSubview:v4];
  }
  v6 = self->_subtitleLabel;
  self->_subtitleLabel = v4;

  [(VUIFavoriteBannerView *)self setNeedsLayout];
}

- (void)setBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v7 = v5;
    [(UIView *)backgroundView removeFromSuperview];
    if (v7 && ![(UIView *)v7 isDescendantOfView:self])
    {
      [(VUIFavoriteBannerView *)self addSubview:v7];
      [(VUIFavoriteBannerView *)self sendSubviewToBack:v7];
    }
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(VUIFavoriteBannerView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)setBackgroundImageLogos:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] || -[NSArray count](self->_backgroundImageLogos, "count"))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    p_backgroundImageLogos = &self->_backgroundImageLogos;
    v7 = self->_backgroundImageLogos;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (([v5 containsObject:v12] & 1) == 0) {
            [v12 removeFromSuperview];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)p_backgroundImageLogos, a3);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v13 = *p_backgroundImageLogos;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          if ((objc_msgSend(v18, "isDescendantOfView:", self->_backgroundView, (void)v19) & 1) == 0) {
            [(UIView *)self->_backgroundView addSubview:v18];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }

    [(UIView *)self->_backgroundView setNeedsLayout];
    [(VUIFavoriteBannerView *)self setNeedsLayout];
  }
}

- (CGSize)_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [(NSArray *)self->_backgroundImageLogos count];
  double v108 = width;
  double v9 = width + -48.0;
  [(VUIFavoriteBannerLayout *)self->_layout maxTextWidth];
  if (v10 <= width + -48.0)
  {
    [(VUIFavoriteBannerLayout *)self->_layout maxTextWidth];
    double v9 = v11;
  }
  [(VUIFavoriteBannerLayout *)self->_layout subtitleBaseLine];
  double v104 = v12;
  [(VUIFavoriteBannerLayout *)self->_layout margin];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  unint64_t v21 = -[VUIFavoriteBannerLayout bannerStyleForSizeClass:](self->_layout, "bannerStyleForSizeClass:", objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", v108));
  unint64_t v22 = v21;
  double v103 = height;
  if (!v21)
  {
    [(VUIFavoriteBannerView *)self _imageSizeForBannerStyle:0];
    double v46 = v48;
    double v45 = (double)(v8 - 1) * 10.0 + (double)v8 * v48;
    double v98 = v18;
    double v47 = (v108 - v45) * 0.5;
    v117.origin.double x = v47;
    v117.origin.y = v14;
    v117.size.double width = v45;
    v117.size.double height = v46;
    double v107 = v14;
    double v49 = v14 + CGRectGetHeight(v117) + 0.0;
    [(VUILabel *)self->_titleLabel tv_sizeThatFits:v9];
    double v51 = v50;
    CGFloat v53 = v52;
    [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:34.0];
    double v55 = v49 + v54;
    v118.origin.double x = (v108 - v51) * 0.5;
    double x = v118.origin.x;
    double v101 = v51;
    v118.origin.y = v55;
    v118.size.double width = v51;
    double v102 = v53;
    v118.size.double height = v53;
    double v56 = v55 + CGRectGetHeight(v118);
    -[VUILabel tv_sizeThatFits:](self->_subtitleLabel, "tv_sizeThatFits:", v9, 0.0);
    double v58 = v57;
    double v60 = v59;
    [(VUILabel *)self->_subtitleLabel topMarginToLabel:self->_titleLabel withBaselineMargin:v104];
    double v41 = v56 + v61;
    v119.origin.double x = (v108 - v58) * 0.5;
    double v106 = v119.origin.x;
    v119.origin.y = v41;
    v119.size.double width = v58;
    v119.size.double height = v60;
    double v42 = v41 + v98 + CGRectGetHeight(v119);
    double v62 = v108;
    if (a4) {
      goto LABEL_41;
    }
LABEL_21:
    double v99 = v42;
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v47, v107, v45, v46);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", x, v55, v101, v102);
    -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v106, v41, v58, v60);
    if (v22)
    {
      if (v22 == 1)
      {
        uint64_t v63 = -[VUIFavoriteBannerView _generatePlainWeaveImagePointsForSize:](self, "_generatePlainWeaveImagePointsForSize:", v108, v103);
      }
      else
      {
        if (v22 != 2)
        {
          v64 = 0;
          goto LABEL_29;
        }
        uint64_t v63 = -[VUIFavoriteBannerView _generateSiderowImagePointsForSize:](self, "_generateSiderowImagePointsForSize:", v108, v103);
      }
    }
    else
    {
      uint64_t v63 = [(VUIFavoriteBannerView *)self _generateSingleRowImagePoints];
    }
    v64 = (void *)v63;
LABEL_29:
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v65 = self->_backgroundImageLogos;
    uint64_t v66 = [(NSArray *)v65 countByEnumeratingWithState:&v109 objects:v113 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = 0;
      uint64_t v69 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v67; ++i)
        {
          if (*(void *)v110 != v69) {
            objc_enumerationMutation(v65);
          }
          v71 = *(void **)(*((void *)&v109 + 1) + 8 * i);
          if (v68 + i >= (unint64_t)[v64 count]) {
            goto LABEL_37;
          }
          v72 = [v64 objectAtIndexedSubscript:v68 + i];
          [v72 CGRectValue];
          double v74 = v73;
          double v76 = v75;
          double v78 = v77;
          double v80 = v79;

          -[UIView convertRect:toView:](self->_backgroundView, "convertRect:toView:", self, v74, v76, v78, v80);
          CGFloat v82 = v81;
          CGFloat v84 = v83;
          CGFloat v86 = v85;
          CGFloat v88 = v87;
          [(VUIFavoriteBannerView *)self bounds];
          v121.origin.double x = v89;
          v121.origin.y = v90;
          v121.size.double width = v91;
          v121.size.double height = v92;
          v120.origin.double x = v82;
          v120.origin.y = v84;
          v120.size.double width = v86;
          v120.size.double height = v88;
          if (CGRectIntersectsRect(v120, v121))
          {
            [v71 setHidden:0];
            objc_msgSend(v71, "setFrame:", v74, v76, v78, v80);
          }
          else
          {
LABEL_37:
            [v71 setHidden:1];
          }
        }
        uint64_t v67 = [(NSArray *)v65 countByEnumeratingWithState:&v109 objects:v113 count:16];
        v68 += i;
      }
      while (v67);
    }

    double v62 = v108;
    double v42 = v99;
    goto LABEL_41;
  }
  if (v21 > 2)
  {
    double v47 = *MEMORY[0x1E4F1DB28];
    double v55 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v60 = v46;
    double v58 = v45;
    double v41 = v55;
    double v106 = *MEMORY[0x1E4F1DB28];
    double v107 = v55;
    double v42 = 0.0;
    double v101 = v45;
    double v102 = v46;
    double x = *MEMORY[0x1E4F1DB28];
    double v62 = v108;
    if (a4) {
      goto LABEL_41;
    }
    goto LABEL_21;
  }
  double v94 = v20;
  double v23 = v14;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, 0.0);
  double v25 = v24;
  double v97 = v18;
  double v27 = v26;
  [(VUILabel *)self->_subtitleLabel topMarginToLabel:self->_titleLabel withBaselineMargin:v104];
  double v29 = v28;
  double v105 = v28;
  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v9, 0.0);
  double v31 = v30;
  CGFloat v33 = v32;
  double v34 = v27 + 0.0 + v29 + v32;
  double v107 = v23;
  if (height <= v34) {
    double v35 = v23 + 0.0;
  }
  else {
    double v35 = (height - v34) * 0.5;
  }
  double v36 = (v108 - v25) * 0.5;
  if (v22 != 1) {
    double v36 = v16;
  }
  double v93 = v16;
  if (v22 == 1) {
    double v37 = (v108 - v31) * 0.5;
  }
  else {
    double v37 = v16;
  }
  double x = v36;
  double v101 = v25;
  double v38 = v35;
  double v39 = v25;
  double v102 = v27;
  double v40 = v27;
  double v95 = v35;
  double v41 = v105 + CGRectGetHeight(*(CGRect *)&v36) + v35;
  double v106 = v37;
  v116.origin.double x = v37;
  v116.origin.y = v41;
  v116.size.double width = v31;
  CGFloat v96 = v33;
  v116.size.double height = v33;
  double v42 = v97 + CGRectGetHeight(v116) + v41;
  if (v22 == 2)
  {
    double v43 = v42;
    [(VUIFavoriteBannerLayout *)self->_layout maxTextWidth];
    double v42 = v43;
    double v45 = v108 - (v94 + v93 * 2.0 + v44);
    double v46 = v103 - (v107 + v97);
    double v47 = v108 - v94 - v45;
  }
  else
  {
    double v47 = (v108 - v108) * 0.5;
    double v46 = v103;
    double v107 = (v46 - v46) * 0.5;
    double v45 = v108;
  }
  double v62 = v108;
  double v58 = v31;
  double v60 = v96;
  double v55 = v95;
  if (!a4) {
    goto LABEL_21;
  }
LABEL_41:
  result.double height = v42;
  result.double width = v62;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUIFavoriteBannerView;
  [(VUIFavoriteBannerView *)&v5 layoutSubviews];
  [(VUIFavoriteBannerView *)self bounds];
  -[VUIFavoriteBannerView _layoutSubviewsWithSize:computationOnly:](self, "_layoutSubviewsWithSize:computationOnly:", 0, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIFavoriteBannerView _layoutSubviewsWithSize:computationOnly:](self, "_layoutSubviewsWithSize:computationOnly:", 1, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(VUIFavoriteBannerLayout *)self->_layout bannerMinHeight];
  if (v7 >= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  double v10 = v5;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (CGSize)maxImageSize
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  double v3 = [v2 traitCollection];

  +[VUIUtilities scaleContentSizeValue:v3 forTraitCollection:180.0];
  if (v4 <= 125.0) {
    double v5 = v4;
  }
  else {
    double v5 = 125.0;
  }

  double v6 = v5;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)imageSizeForBannerStyle:(unint64_t)a3 sizeClass:(int64_t)a4
{
  if (a3 == 2)
  {
    double v11 = 0.0;
    if ((unint64_t)a4 <= 7) {
      double v11 = dbl_1E38FE690[a4];
    }
    double v12 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
    double v6 = [v12 traitCollection];

    +[VUIUtilities scaleContentSizeValue:v6 forTraitCollection:v11];
    double v8 = 125.0;
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    double v9 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 1, a4);
    BOOL v10 = [v9 userInterfaceIdiom] == 2;

    double v4 = dbl_1E38FE680[v10];
    goto LABEL_13;
  }
  double v4 = 0.0;
  if (!a3)
  {
    double v5 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow", 0, a4);
    double v6 = [v5 traitCollection];

    +[VUIUtilities scaleContentSizeValue:v6 forTraitCollection:50.0];
    double v8 = 84.0;
LABEL_9:
    if (v7 <= v8) {
      double v4 = v7;
    }
    else {
      double v4 = v8;
    }
  }
LABEL_13:
  double v13 = v4;
  double v14 = v4;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  layout = self->_layout;
  if (a3) {
    [(VUIFavoriteBannerLayout *)layout highlightedBackgroundColor];
  }
  else {
  id v5 = [(VUIFavoriteBannerLayout *)layout backgroundColor];
  }
  [(VUIFavoriteBannerView *)self setBackgroundColor:v5];
}

- (CGSize)_imageSizeForBannerStyle:(unint64_t)a3
{
  id v5 = (void *)MEMORY[0x1E4FB1F48];
  [(VUIFavoriteBannerView *)self bounds];
  uint64_t v6 = objc_msgSend(v5, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v11));
  [(VUIFavoriteBannerView *)self imageSizeForBannerStyle:a3 sizeClass:v6];
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)_generateSingleRowImagePoints
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VUIFavoriteBannerView *)self _imageSizeForBannerStyle:0];
  double v5 = v4;
  double v7 = v6;
  if ([(NSArray *)self->_backgroundImageLogos count])
  {
    unint64_t v8 = 0;
    double v9 = 0.0;
    do
    {
      BOOL v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v9, 0.0, v5, v7);
      [v3 addObject:v10];

      double v9 = v5 + 10.0 + v9;
      ++v8;
    }
    while (v8 < [(NSArray *)self->_backgroundImageLogos count]);
  }
  return v3;
}

- (id)_generatePointsForPlainWeaveSide:(double)a3 containerRect:(CGRect)a4 imageSize:(CGSize)a5 direction:(unint64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v13 = 0.0;
  if (!a6) {
    double v13 = -a5.width;
  }
  if (a6 == 1) {
    double v14 = a5.width;
  }
  else {
    double v14 = v13;
  }
  double v15 = ceil(CGRectGetHeight(a4) / a5.height);
  CGFloat v32 = x;
  CGFloat v33 = y;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  CGFloat v16 = v10;
  v35.size.double width = v10;
  v35.size.double height = v9;
  double v17 = (CGRectGetHeight(v35) - (double)(unint64_t)v15 * height) * 0.5;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v17 < v9)
  {
    unsigned __int8 v19 = 0;
    double v20 = -0.0;
    if (a6) {
      double v21 = -0.0;
    }
    else {
      double v21 = v14;
    }
    if (a6 == 1) {
      double v20 = v14;
    }
    double v30 = v20;
    char v22 = 1;
    double v23 = a3;
    do
    {
      double v24 = v21 + v23;
      double v25 = -0.0;
      if (v22 & v19) {
        double v25 = v14;
      }
      double v26 = v25 + v24;
      v36.origin.CGFloat x = v25 + v24;
      v36.origin.CGFloat y = v17;
      v36.size.double width = width;
      v36.size.double height = height;
      v37.origin.CGFloat x = v32;
      v37.origin.CGFloat y = v33;
      v37.size.double width = v16;
      v37.size.double height = v9;
      BOOL v27 = CGRectIntersectsRect(v36, v37);
      if (v27)
      {
        double v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v26, v17, width, height);
        [v18 addObject:v28];

        double v23 = v30 + v14 + v26;
      }
      else
      {
        double v17 = height + v17;
        v19 ^= 1u;
        double v23 = a3;
      }
      char v22 = !v27;
    }
    while (v17 < v9);
  }
  return v18;
}

- (id)_generatePlainWeaveImagePointsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VUIFavoriteBannerLayout *)self->_layout maxTextWidth];
  CGFloat v8 = v7 + 20.0;
  CGFloat v9 = (width - (v7 + 20.0)) * 0.5;
  [(VUIFavoriteBannerView *)self _imageSizeForBannerStyle:1];
  double v11 = v10;
  double v13 = v12;
  v18.origin.CGFloat y = 0.0;
  v18.origin.CGFloat x = v9;
  v18.size.double width = v8;
  v18.size.double height = height;
  double v14 = -[VUIFavoriteBannerView _generatePointsForPlainWeaveSide:containerRect:imageSize:direction:](self, "_generatePointsForPlainWeaveSide:containerRect:imageSize:direction:", 0, CGRectGetMinX(v18), 0.0, 0.0, width, height, v11, v13);
  [v6 addObjectsFromArray:v14];

  v19.origin.CGFloat y = 0.0;
  v19.origin.CGFloat x = v9;
  v19.size.double width = v8;
  v19.size.double height = height;
  double v15 = -[VUIFavoriteBannerView _generatePointsForPlainWeaveSide:containerRect:imageSize:direction:](self, "_generatePointsForPlainWeaveSide:containerRect:imageSize:direction:", 1, CGRectGetMaxX(v19), 0.0, 0.0, width, height, v11, v13);
  [v6 addObjectsFromArray:v15];

  return v6;
}

- (id)_generateSiderowImagePointsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VUIFavoriteBannerView *)self _imageSizeForBannerStyle:2];
  double v8 = v7;
  double v10 = v9;
  [(VUIFavoriteBannerLayout *)self->_layout margin];
  double v12 = v11;
  double v14 = v13;
  double v17 = width - v15 + v16 * -2.0;
  [(VUIFavoriteBannerLayout *)self->_layout maxTextWidth];
  double v19 = v17 - v18;
  NSUInteger v20 = [(NSArray *)self->_backgroundImageLogos count];
  unint64_t v21 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", width);
  char v22 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  if (v23 == 2)
  {
    if (v20 >= 8) {
      unint64_t v24 = 8;
    }
    else {
      unint64_t v24 = v20;
    }
    BOOL v25 = v24 > 1;
    double v26 = (double)(v24 - 1);
    double v27 = 26.0;
    goto LABEL_16;
  }
  if (v21 > 3)
  {
    if (v20 >= 0xA) {
      unint64_t v24 = 10;
    }
    else {
      unint64_t v24 = v20;
    }
    BOOL v25 = v24 > 1;
    double v26 = (double)(v24 - 1);
    double v27 = 20.0;
LABEL_16:
    double v32 = v26 * v27;
    if (!v25) {
      double v32 = 0.0;
    }
    double v33 = (v19 - v32) / (double)v24;
    double v34 = height - v12 - v14;
    double v29 = fmin(v33, fmin(v34, v10));
    if (v24) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
  if (v20 >= 8) {
    unint64_t v24 = 8;
  }
  else {
    unint64_t v24 = v20;
  }
  if (v24 > 4)
  {
    double v28 = height - v12 - v14;
    double v29 = fmin(v8, v28 * 0.5 + -10.0);
    double v27 = 10.0;
    double v30 = v28 - (v29 * 2.0 + 10.0);
    char v31 = 1;
    goto LABEL_20;
  }
  unint64_t v44 = 4;
  if (v20 < 4) {
    unint64_t v44 = v20;
  }
  double v27 = 10.0;
  double v45 = (double)(v44 - 1) * 10.0;
  if (v24 <= 1) {
    double v45 = 0.0;
  }
  double v46 = (v19 - v45) / (double)v44;
  double v34 = height - v12 - v14;
  double v29 = fmin(v8, v46);
  if (v24)
  {
LABEL_19:
    char v31 = 0;
    double v30 = v34 - v29;
LABEL_20:
    unint64_t v35 = 0;
    double v36 = v30 * 0.5;
    double v37 = v29 + v30 * 0.5 + 10.0;
    char v38 = v31 ^ 1;
    do
    {
      double v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v19 - v29, v36, v29, v29);
      [v6 addObject:v39];

      unint64_t v40 = v35 + 1;
      if (v35 + 1 >= v24) {
        char v41 = 1;
      }
      else {
        char v41 = v38;
      }
      if ((v41 & 1) == 0)
      {
        double v42 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v19 - v29, v37, v29, v29);
        [v6 addObject:v42];

        unint64_t v40 = v35 + 2;
      }
      double v19 = v19 - v29 - v27;
      unint64_t v35 = v40;
    }
    while (v40 < v24);
  }
LABEL_27:
  return v6;
}

- (void)prepareForCellReuse
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  layout = self->_layout;
  self->_layout = 0;

  [(VUILabel *)self->_titleLabel setText:0];
  [(VUILabel *)self->_subtitleLabel setText:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v4 = self->_backgroundImageLogos;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setImage:", 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (VUIFavoriteBannerLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (NSArray)backgroundImageLogos
{
  return self->_backgroundImageLogos;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundImageLogos, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end