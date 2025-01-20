@interface BFFLinkLabelFooterView
+ (void)initialize;
- (BFFLinkLabelFooterView)initWithFrame:(CGRect)a3;
- (BOOL)wantsFromBottomLayout;
- (BOOL)wantsSideBySideLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 shouldSetSize:(BOOL)a4;
- (NSAttributedString)attributedSubtitleText;
- (NSString)labelText;
- (UIColor)topLineColor;
- (UIEdgeInsets)margins;
- (double)flexibleHeight;
- (unint64_t)numberOfLinks;
- (void)addLinkWithTitle:(id)a3 handler:(id)a4;
- (void)addLinkWithTitle:(id)a3 textStyle:(id)a4 handler:(id)a5;
- (void)layoutSubviews;
- (void)removeAllLinks;
- (void)removeLinkAtIndex:(unint64_t)a3;
- (void)setAttributedSubtitleText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFlexibleHeight:(double)a3;
- (void)setLabelText:(id)a3;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setTopLineColor:(id)a3;
- (void)setWantsFromBottomLayout:(BOOL)a3;
- (void)setWantsSideBySideLayout:(BOOL)a3;
@end

@implementation BFFLinkLabelFooterView

+ (void)initialize
{
  BOOL v2 = BFFIsiPad();
  double v3 = 1.0;
  if (v2) {
    double v3 = 11.0;
  }
  double v4 = 12.0;
  if (v2) {
    double v4 = 17.0;
  }
  MinimumVerticalMarginBeforeTopLink = *(void *)&v3;
  MinimumVerticalMarginBeforeSoloLink = *(void *)&v3;
  if (v2) {
    double v5 = 0.0;
  }
  else {
    double v5 = 10.0;
  }
  MinimumVerticalMarginAfterTopLink = *(void *)&v4;
  MinimumHorizontalMargin = *(void *)&v5;
  MinimumVerticalMarginAfterLabel = 0x4018000000000000;
  MinimumVerticalMarginAfterBottomLink = 0x4018000000000000;
}

- (BFFLinkLabelFooterView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)BFFLinkLabelFooterView;
  double v3 = -[BFFLinkLabelFooterView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    BOOL v4 = BFFIsiPad();
    double v5 = (id *)MEMORY[0x263F83628];
    if (!v4) {
      double v5 = (id *)MEMORY[0x263F83570];
    }
    v6 = (objc_class *)MEMORY[0x263F828E0];
    id v7 = *v5;
    v8 = (UILabel *)objc_alloc_init(v6);
    label = v3->_label;
    v3->_label = v8;

    [(UILabel *)v3->_label setNumberOfLines:0];
    v10 = v3->_label;
    v11 = [MEMORY[0x263F82760] preferredFontForTextStyle:v7];
    [(UILabel *)v10 setFont:v11];

    v12 = +[BFFStyle sharedStyle];
    [v12 applyThemeToLabel:v3->_label];

    [(UILabel *)v3->_label setTextAlignment:1];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v13;

    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    v15 = v3->_subtitleLabel;
    v16 = [MEMORY[0x263F82760] preferredFontForTextStyle:v7];

    [(UILabel *)v15 setFont:v16];
    v17 = +[BFFStyle sharedStyle];
    [v17 applyThemeToLabel:v3->_subtitleLabel];

    [(UILabel *)v3->_subtitleLabel setTextAlignment:1];
    uint64_t v18 = objc_opt_new();
    linkHandlers = v3->_linkHandlers;
    v3->_linkHandlers = (NSMutableArray *)v18;
  }
  return v3;
}

- (NSString)labelText
{
  return [(UILabel *)self->_label text];
}

- (void)setLabelText:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(BFFLinkLabelFooterView *)self labelText];
  char v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_label setText:v6];
    [(UILabel *)self->_label removeFromSuperview];
    if ([v6 length]) {
      [(BFFLinkLabelFooterView *)self addSubview:self->_label];
    }
    [(BFFLinkLabelFooterView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A758]();
}

- (void)setAttributedSubtitleText:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToAttributedString:self->_attributedSubtitleText] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attributedSubtitleText, a3);
    [(UILabel *)self->_subtitleLabel setAttributedText:v5];
    [(UILabel *)self->_subtitleLabel removeFromSuperview];
    if ([v5 length]) {
      [(BFFLinkLabelFooterView *)self addSubview:self->_subtitleLabel];
    }
    [(BFFLinkLabelFooterView *)self setNeedsLayout];
  }
}

- (void)addLinkWithTitle:(id)a3 textStyle:(id)a4 handler:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(BFFLinkLabelFooterView *)self numberOfLinks] <= 1)
  {
    v10 = objc_opt_new();
    [v10 setHandler:v9];
    v11 = [v10 button];
    [v11 setTitle:v16 forState:0];

    v12 = [v10 button];
    v13 = [v12 titleLabel];
    v14 = [MEMORY[0x263F82760] preferredFontForTextStyle:v8];
    [v13 setFont:v14];

    [(NSMutableArray *)self->_linkHandlers addObject:v10];
    if ([v16 length])
    {
      v15 = [v10 button];
      [(BFFLinkLabelFooterView *)self addSubview:v15];
    }
  }
}

- (void)addLinkWithTitle:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  BOOL v7 = BFFIsiPad();
  id v8 = (void *)MEMORY[0x263F83628];
  if (!v7) {
    id v8 = (void *)MEMORY[0x263F83570];
  }
  [(BFFLinkLabelFooterView *)self addLinkWithTitle:v9 textStyle:*v8 handler:v6];
}

- (void)removeLinkAtIndex:(unint64_t)a3
{
  -[NSMutableArray objectAtIndexedSubscript:](self->_linkHandlers, "objectAtIndexedSubscript:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v6 button];
  [v5 removeFromSuperview];

  [(NSMutableArray *)self->_linkHandlers removeObjectAtIndex:a3];
}

- (void)removeAllLinks
{
  for (i = self->_linkHandlers; [(NSMutableArray *)i count]; i = self->_linkHandlers)
    [(BFFLinkLabelFooterView *)self removeLinkAtIndex:0];
}

- (unint64_t)numberOfLinks
{
  return [(NSMutableArray *)self->_linkHandlers count];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = self->_linkHandlers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        id v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "button", (void)v10);
        [v9 setEnabled:v3];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (UIColor)topLineColor
{
  return [(UIView *)self->_topLine backgroundColor];
}

- (void)setTopLineColor:(id)a3
{
  id v10 = a3;
  id v4 = [(UIView *)self->_topLine backgroundColor];

  uint64_t v5 = v10;
  if (v4 != v10)
  {
    [(UIView *)self->_topLine removeFromSuperview];
    if (v10)
    {
      topLine = self->_topLine;
      if (!topLine)
      {
        id v7 = objc_alloc(MEMORY[0x263F82E00]);
        uint64_t v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        id v9 = self->_topLine;
        self->_topLine = v8;

        topLine = self->_topLine;
      }
      [(BFFLinkLabelFooterView *)self addSubview:topLine];
    }
    [(UIView *)self->_topLine setBackgroundColor:v10];
    [(BFFLinkLabelFooterView *)self setNeedsLayout];
    uint64_t v5 = v10;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 shouldSetSize:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  uint64_t v142 = *MEMORY[0x263EF8340];
  [(BFFLinkLabelFooterView *)self margins];
  double v8 = v7;
  [(BFFLinkLabelFooterView *)self margins];
  if (v8 >= *(double *)&MinimumHorizontalMargin) {
    double v10 = v8;
  }
  else {
    double v10 = *(double *)&MinimumHorizontalMargin;
  }
  if (v9 >= *(double *)&MinimumHorizontalMargin) {
    double v11 = v9;
  }
  else {
    double v11 = *(double *)&MinimumHorizontalMargin;
  }
  double v136 = v10;
  double v12 = width - v10 - v11;
  if ([(BFFLinkLabelFooterView *)self wantsSideBySideLayout]
    && [(BFFLinkLabelFooterView *)self numberOfLinks] == 2)
  {
    double v13 = width;
    double v14 = *MEMORY[0x263F001A8];
    double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
    id v16 = [(NSMutableArray *)self->_linkHandlers objectAtIndexedSubscript:0];
    v17 = [(NSMutableArray *)self->_linkHandlers objectAtIndexedSubscript:1];
    uint64_t v18 = [v16 button];
    v19 = [v18 titleLabel];
    objc_msgSend(v19, "textRectForBounds:limitedToNumberOfLines:", 0, v14, v15, v12, 1.79769313e308);
    double v21 = v20;

    v22 = [v17 button];
    v23 = [v22 titleLabel];
    objc_msgSend(v23, "textRectForBounds:limitedToNumberOfLines:", 0, v14, v15, v12, 1.79769313e308);
    double v25 = v24;

    if (v21 > 0.0 && v25 > 0.0 && v21 + v25 + *(double *)&MinimumHorizontalMargin < v12)
    {
      double v26 = *(double *)&MinimumVerticalMarginBeforeSoloLink;
      [(BFFLinkLabelFooterView *)self margins];
      double v28 = BFFRoundRectToPixel(v136, v26 + v27);
      double v32 = v31;
      if (v4)
      {
        double v33 = v28;
        double v34 = v29;
        double v35 = v30;
        v36 = [v16 button];
        objc_msgSend(v36, "setFrame:", v33, v34, v35, v32);
      }
      double width = v13;
      double v37 = *(double *)&MinimumVerticalMarginBeforeSoloLink;
      [(BFFLinkLabelFooterView *)self margins];
      double v39 = BFFRoundRectToPixel(v13 - v11 - v25, v37 + v38);
      if (v4)
      {
        double v43 = v39;
        double v44 = v40;
        double v45 = v41;
        double v46 = v42;
        v47 = [v17 button];
        objc_msgSend(v47, "setFrame:", v43, v44, v45, v46);
      }
      double v48 = v32 + *(double *)&MinimumVerticalMarginAfterBottomLink;
      [(BFFLinkLabelFooterView *)self margins];
      double v50 = v48 + v49;
      [(BFFLinkLabelFooterView *)self margins];
      double v52 = v50 + v51 + 0.0;

      goto LABEL_61;
    }
  }
  v53 = [(UILabel *)self->_label text];
  uint64_t v54 = [v53 length];

  if (v54)
  {
    v55 = [(UILabel *)self->_label text];
    v56 = [(UILabel *)self->_label font];
    objc_msgSend(v55, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v56, -[UILabel lineBreakMode](self->_label, "lineBreakMode"), v12, 1.79769313e308);

    double v57 = *(double *)&MinimumVerticalMarginAfterLabel;
    [(BFFLinkLabelFooterView *)self margins];
    double v59 = BFFRoundRectToPixel(v136, v57 + v58);
    double v61 = v60;
    double v63 = v62;
    if (v4) {
      -[UILabel setFrame:](self->_label, "setFrame:", v59, v60);
    }
    double v64 = v61 + v63 + *(double *)&MinimumVerticalMarginAfterLabel;
    [(BFFLinkLabelFooterView *)self flexibleHeight];
    double v66 = v64 + v65;
    [(BFFLinkLabelFooterView *)self margins];
    double v68 = v66 + v67;
    [(BFFLinkLabelFooterView *)self margins];
    double v52 = v68 + v69;
  }
  else
  {
    double v52 = 0.0;
  }
  v70 = [(UILabel *)self->_subtitleLabel attributedText];
  uint64_t v71 = [v70 length];

  if (v71)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v12, 1.79769313e308);
    double v73 = v72;
    double v74 = v136 + (v12 - v72) * 0.5;
    if (v73 >= v12) {
      double v75 = v136;
    }
    else {
      double v75 = v74;
    }
    double v76 = *(double *)&MinimumVerticalMarginAfterLabel;
    [(BFFLinkLabelFooterView *)self margins];
    double v78 = v76 + v77;
    [(UILabel *)self->_label _lastLineBaseline];
    double v80 = BFFRoundRectToPixel(v75, v78 + v79);
    double v82 = v81;
    double v84 = v83;
    if (v4) {
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v80, v81);
    }
    double v85 = v82 + v84 + *(double *)&MinimumVerticalMarginAfterLabel;
    [(BFFLinkLabelFooterView *)self flexibleHeight];
    double v87 = v85 + v86;
    [(BFFLinkLabelFooterView *)self margins];
    double v89 = v87 + v88;
    [(BFFLinkLabelFooterView *)self margins];
    double v52 = v89 + v90;
  }
  if ([(NSMutableArray *)self->_linkHandlers count])
  {
    double v132 = width;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    obj = self->_linkHandlers;
    uint64_t v91 = [(NSMutableArray *)obj countByEnumeratingWithState:&v137 objects:v141 count:16];
    if (!v91) {
      goto LABEL_60;
    }
    uint64_t v92 = v91;
    uint64_t v135 = *(void *)v138;
    double v93 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v134 = *MEMORY[0x263F001A8];
    while (1)
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v138 != v135) {
          objc_enumerationMutation(obj);
        }
        v95 = *(void **)(*((void *)&v137 + 1) + 8 * v94);
        v96 = [v95 button];
        v97 = [v96 titleLabel];

        objc_msgSend(v97, "textRectForBounds:limitedToNumberOfLines:", 0, v134, v93, v12, 1.79769313e308);
        if (v98 >= v12) {
          double v99 = v136;
        }
        else {
          double v99 = v136 + (v12 - v98) * 0.5;
        }
        v100 = [(NSMutableArray *)self->_linkHandlers firstObject];
        if (v95 != v100)
        {

LABEL_43:
          double v102 = v52;
          goto LABEL_44;
        }
        v101 = [(UILabel *)self->_label text];
        if ([v101 length])
        {

          goto LABEL_43;
        }
        [(UILabel *)self->_subtitleLabel attributedText];
        v116 = BOOL v115 = v4;
        uint64_t v117 = [v116 length];

        BOOL v4 = v115;
        double v102 = v52;
        if (!v117)
        {
          if ([(BFFLinkLabelFooterView *)self wantsFromBottomLayout])
          {
            [(BFFLinkLabelFooterView *)self bounds];
            double MaxY = CGRectGetMaxY(v145);
            [(BFFLinkLabelFooterView *)self margins];
            double v120 = MaxY - v119;
            [v97 _lastLineBaseline];
            double v122 = v120 - v121;
            [v97 bounds];
            double v102 = v122 - v123;
          }
          else
          {
            uint64_t v124 = [(NSMutableArray *)self->_linkHandlers count];
            v125 = &MinimumVerticalMarginBeforeSoloLink;
            if (v124 != 1) {
              v125 = &MinimumVerticalMarginBeforeTopLink;
            }
            double v126 = *(double *)v125;
            [(BFFLinkLabelFooterView *)self margins];
            double v102 = v126 + v127;
          }
        }
LABEL_44:
        double v103 = BFFRoundRectToPixel(v99, v102);
        double v106 = v105;
        double v108 = v107;
        if (v4)
        {
          double v109 = v103;
          double v110 = v104;
          v111 = [v95 button];
          objc_msgSend(v111, "setFrame:", v109, v106, v110, v108);
        }
        v112 = [(NSMutableArray *)self->_linkHandlers firstObject];

        if (v95 == v112)
        {
          if ([(BFFLinkLabelFooterView *)self wantsFromBottomLayout])
          {
            [(BFFLinkLabelFooterView *)self bounds];
            double v52 = CGRectGetMaxY(v144) - v106;
          }
          else
          {
            double v113 = v106 + v108 + *(double *)&MinimumVerticalMarginAfterTopLink;
            [(BFFLinkLabelFooterView *)self flexibleHeight];
            double v52 = v113 + v114;
          }
        }
        else
        {
          double v52 = v52 + v108 + *(double *)&MinimumVerticalMarginAfterBottomLink;
        }

        ++v94;
      }
      while (v92 != v94);
      uint64_t v128 = [(NSMutableArray *)obj countByEnumeratingWithState:&v137 objects:v141 count:16];
      uint64_t v92 = v128;
      if (!v128)
      {
LABEL_60:

        double width = v132;
        break;
      }
    }
  }
LABEL_61:
  if (v4)
  {
    v129 = [(BFFLinkLabelFooterView *)self topLineColor];

    if (v129)
    {
      UICeilToViewScale();
      [(BFFLinkLabelFooterView *)self bounds];
      -[UIView setFrame:](self->_topLine, "setFrame:", 0.0, 0.0);
    }
  }
  double v130 = width;
  double v131 = v52;
  result.height = v131;
  result.double width = v130;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[BFFLinkLabelFooterView sizeThatFits:shouldSetSize:](self, "sizeThatFits:shouldSetSize:", 0, a3.width, a3.height);
  result.height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)BFFLinkLabelFooterView;
  [(BFFLinkLabelFooterView *)&v5 layoutSubviews];
  [(BFFLinkLabelFooterView *)self bounds];
  -[BFFLinkLabelFooterView sizeThatFits:shouldSetSize:](self, "sizeThatFits:shouldSetSize:", 1, v3, v4);
}

- (double)flexibleHeight
{
  return self->_flexibleHeight;
}

- (void)setFlexibleHeight:(double)a3
{
  self->_flexibleHeight = a3;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (NSAttributedString)attributedSubtitleText
{
  return self->_attributedSubtitleText;
}

- (BOOL)wantsSideBySideLayout
{
  return self->_wantsSideBySideLayout;
}

- (void)setWantsSideBySideLayout:(BOOL)a3
{
  self->_wantsSideBySideLayout = a3;
}

- (BOOL)wantsFromBottomLayout
{
  return self->_wantsFromBottomLayout;
}

- (void)setWantsFromBottomLayout:(BOOL)a3
{
  self->_wantsFromBottomLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedSubtitleText, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_linkHandlers, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end