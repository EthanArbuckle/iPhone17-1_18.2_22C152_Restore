@interface PSBadgedTableCell
+ (double)badgePadding;
+ (id)badgeNumberLabelTextColor;
+ (id)reuseIdentifierForClassAndType:(int64_t)a3;
+ (id)unreadBubbleImage;
- (BOOL)_shouldUseRoundStyle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PSBadgedTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)contentAccessoryPadding;
- (double)minimumBadgeWidth;
- (void)badgeWithInteger:(int64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)resetLocale;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation PSBadgedTableCell

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(PSBadgedTableCell *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory && self->_badgeImageView)
  {
    if ([(PSBadgedTableCell *)self _shouldUseRoundStyle])
    {
      [(UILabel *)self->_badgeNumberLabel frame];
      double v10 = v9;
      [(UILabel *)self->_badgeNumberLabel frame];
      if (v10 >= v11) {
        double v12 = v10;
      }
      else {
        double v12 = v11;
      }
    }
    else
    {
      [(id)objc_opt_class() badgePadding];
      double v14 = v13;
      [(UILabel *)self->_badgeNumberLabel frame];
      double v12 = v15 + v14 * 2.0;
      if (v12 < 30.0) {
        double v12 = 30.0;
      }
    }
    double width = width - (v12 + 20.0);
  }
  v18.receiver = self;
  v18.super_class = (Class)PSBadgedTableCell;
  -[PSBadgedTableCell sizeThatFits:](&v18, sel_sizeThatFits_, width, height);
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PSBadgedTableCell;
  [(PSTableCell *)&v5 setSelected:a3 animated:a4];
  [(PSBadgedTableCell *)self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PSBadgedTableCell;
  [(PSTableCell *)&v5 setHighlighted:a3 animated:a4];
  [(PSBadgedTableCell *)self setNeedsLayout];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSBadgedTableCell;
  id v4 = a3;
  [(PSTableCell *)&v6 refreshCellContentsWithSpecifier:v4];
  objc_super v5 = objc_msgSend(v4, "propertyForKey:", @"badgeNumber", v6.receiver, v6.super_class);

  -[PSBadgedTableCell badgeWithInteger:](self, "badgeWithInteger:", [v5 integerValue]);
}

- (void)badgeWithInteger:(int64_t)a3
{
  if (self->_badgeInt != a3)
  {
    self->_badgeInt = a3;
    [(UIImageView *)self->_badgeImageView removeFromSuperview];
    badgeImageView = self->_badgeImageView;
    self->_badgeImageView = 0;

    [(UILabel *)self->_badgeNumberLabel removeFromSuperview];
    badgeNumberLabel = self->_badgeNumberLabel;
    self->_badgeNumberLabel = 0;

    if (a3)
    {
      v7 = [(id)objc_opt_class() unreadBubbleImage];
      v8 = [(id)objc_opt_class() unreadBubbleImage];
      double v9 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v7 highlightedImage:v8];
      double v10 = self->_badgeImageView;
      self->_badgeImageView = v9;

      double v11 = [(PSBadgedTableCell *)self contentView];
      [v11 addSubview:self->_badgeImageView];

      id v12 = objc_alloc(MEMORY[0x1E4F42B38]);
      double v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v14 = self->_badgeNumberLabel;
      self->_badgeNumberLabel = v13;

      double v15 = self->_badgeNumberLabel;
      double v16 = [MEMORY[0x1E4F428B8] clearColor];
      [(UILabel *)v15 setBackgroundColor:v16];

      double v17 = [MEMORY[0x1E4F42738] sharedApplication];
      objc_super v18 = [v17 preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

      double v20 = 17.0;
      if (IsAccessibilityCategory)
      {
        v21 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
        [v21 pointSize];
        double v23 = v22;

        double v20 = fmin(v23, 50.0);
      }
      BOOL v24 = [(PSBadgedTableCell *)self _shouldUseRoundStyle];
      v25 = self->_badgeNumberLabel;
      if (v24) {
        [MEMORY[0x1E4F42A30] systemFontOfSize:v20];
      }
      else {
      v26 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:v20];
      }
      [(UILabel *)v25 setFont:v26];

      v27 = self->_badgeNumberLabel;
      v28 = (void *)MEMORY[0x1E4F28EE0];
      v29 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
      v30 = [v28 localizedStringFromNumber:v29 numberStyle:0];
      [(UILabel *)v27 setText:v30];

      [(UILabel *)self->_badgeNumberLabel setTextAlignment:1];
      v31 = [(PSBadgedTableCell *)self contentView];
      [v31 addSubview:self->_badgeNumberLabel];
    }
    [(PSBadgedTableCell *)self setNeedsLayout];
  }
}

- (PSBadgedTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSBadgedTableCell;
  double v9 = [(PSTableCell *)&v14 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    double v10 = [v8 propertyForKey:@"badgeNumber"];
    double v11 = v10;
    if (v10) {
      -[PSBadgedTableCell badgeWithInteger:](v9, "badgeWithInteger:", [v10 integerValue]);
    }
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v9 selector:sel_resetLocale name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v9;
}

- (void)layoutSubviews
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  v135.receiver = self;
  v135.super_class = (Class)PSBadgedTableCell;
  [(PSTableCell *)&v135 layoutSubviews];
  if (!self->_badgeImageView) {
    return;
  }
  [(UILabel *)self->_badgeNumberLabel sizeToFit];
  v3 = [(PSBadgedTableCell *)self layoutManager];
  [v3 contentRectForCell:self forState:0];
  CGFloat rect = v5;
  CGFloat v126 = v4;
  double v7 = v6;
  double v9 = v8;

  [(UIImageView *)self->_badgeImageView frame];
  double v11 = v10;
  double v13 = v12;
  objc_super v14 = [(PSBadgedTableCell *)self traitCollection];
  double v15 = [v14 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if ([(PSBadgedTableCell *)self _shouldUseRoundStyle])
  {
    if (IsAccessibilityCategory)
    {
      [(UILabel *)self->_badgeNumberLabel frame];
      double v13 = v17;
      [(UILabel *)self->_badgeNumberLabel frame];
      if (v13 < v18) {
        double v13 = v18;
      }
      double v11 = v13;
    }
  }
  else
  {
    [(id)objc_opt_class() badgePadding];
    double v20 = v19;
    [(UILabel *)self->_badgeNumberLabel frame];
    double v13 = v21;
    [(UILabel *)self->_badgeNumberLabel frame];
    double v11 = v22 + v20 * 2.0;
    [(PSBadgedTableCell *)self minimumBadgeWidth];
    if (v11 < v23) {
      double v11 = v23;
    }
  }
  int v24 = [(PSBadgedTableCell *)self _shouldReverseLayoutDirection];
  v25 = [(PSBadgedTableCell *)self accessoryView];
  objc_opt_class();
  double v26 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(PSBadgedTableCell *)self contentAccessoryPadding];
    double v26 = v27;
  }

  CGFloat v122 = v9;
  CGFloat v123 = v7;
  if (!v24) {
    double v26 = v7 - v26 - v11;
  }
  float v28 = (v9 - v13) * 0.5;
  double v29 = floorf(v28);
  -[UIImageView setFrame:](self->_badgeImageView, "setFrame:", v26, v29, v11, v13);
  badgeNumberLabel = self->_badgeNumberLabel;
  if (([(PSBadgedTableCell *)self isHighlighted] & 1) == 0) {
    [(PSBadgedTableCell *)self isSelected];
  }
  v31 = [(id)objc_opt_class() badgeNumberLabelTextColor];
  [(UILabel *)badgeNumberLabel setTextColor:v31];

  if ([(PSBadgedTableCell *)self _shouldUseRoundStyle]) {
    double v32 = v29;
  }
  else {
    double v32 = v29 + -1.0;
  }
  -[UILabel setFrame:](self->_badgeNumberLabel, "setFrame:", v26, v32, v11, v13);
  v33 = [(PSBadgedTableCell *)self textLabel];
  [v33 frame];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  double v129 = v11;
  double v130 = v26;
  double v128 = v13;
  double v42 = v35;
  double v43 = v37;
  double v44 = v39;
  double v45 = v41;
  if (v24)
  {
    CGFloat v118 = v41;
    CGFloat v46 = v37;
    double MinX = CGRectGetMinX(*(CGRect *)&v42);
    v138.origin.x = v26;
    v138.origin.y = v29;
    v138.size.double width = v11;
    v138.size.double height = v13;
    if (MinX >= CGRectGetMaxX(v138))
    {
      double v52 = v35;
      double v59 = v29;
      double v53 = v46;
      double v41 = v118;
      if (!IsAccessibilityCategory) {
        goto LABEL_42;
      }
      goto LABEL_28;
    }
    v139.origin.x = v35;
    CGFloat v120 = v46;
    v139.origin.y = v46;
    v139.size.double width = v39;
    double v41 = v118;
    v139.size.double height = v118;
    double MaxX = CGRectGetMaxX(v139);
    v140.origin.x = v26;
    double v119 = v29;
    v140.origin.y = v29;
    v140.size.double width = v11;
    v140.size.double height = v13;
    double v49 = MaxX - CGRectGetMaxX(v140);
    [(PSBadgedTableCell *)self contentAccessoryPadding];
    double v51 = v49 - v50;
    double v52 = v35 + v39 - v51;
    double v39 = v51;
    double v53 = v120;
LABEL_23:
    v58 = [(PSBadgedTableCell *)self textLabel];
    objc_msgSend(v58, "setFrame:", v52, v53, v39, v41);

    double v59 = v119;
    if (!IsAccessibilityCategory) {
      goto LABEL_42;
    }
LABEL_28:
    v144.origin.x = v52;
    v144.origin.y = v53;
    v144.size.double width = v39;
    v144.size.double height = v41;
    double Width = CGRectGetWidth(v144);
    v61 = [(PSBadgedTableCell *)self textLabel];
    objc_msgSend(v61, "sizeThatFits:", Width, 1.79769313e308);
    double v63 = v62;
    double v65 = v64;

    v145.origin.y = rect;
    v145.origin.x = v126;
    v145.size.double height = v122;
    v145.size.double width = v123;
    double Height = CGRectGetHeight(v145);
    v146.origin.x = v52;
    v146.origin.y = v53;
    v146.size.double width = v63;
    v146.size.double height = v65;
    CGFloat v67 = CGRectGetHeight(v146);
    double v68 = PSRoundToPixel((Height - v67) * 0.5);
    v69 = [(PSBadgedTableCell *)self textLabel];
    objc_msgSend(v69, "setFrame:", v52, v68, v63, v65);

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v70 = [(PSBadgedTableCell *)self subviews];
    uint64_t v71 = [v70 countByEnumeratingWithState:&v131 objects:v136 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      char v127 = v24;
      v73 = 0;
      uint64_t v74 = *(void *)v132;
      do
      {
        for (uint64_t i = 0; i != v72; ++i)
        {
          if (*(void *)v132 != v74) {
            objc_enumerationMutation(v70);
          }
          v76 = *(void **)(*((void *)&v131 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v77 = v76;

            v73 = v77;
          }
        }
        uint64_t v72 = [v70 countByEnumeratingWithState:&v131 objects:v136 count:16];
      }
      while (v72);

      if (v73)
      {
        [v73 frame];
        double v79 = v78;
        CGFloat recta = v80;
        double v82 = v81;
        double v84 = v83;
        v147.origin.x = v52;
        v147.origin.y = v68;
        v147.size.double width = v63;
        v147.size.double height = v65;
        double MinY = CGRectGetMinY(v147);
        v86 = [(PSBadgedTableCell *)self textLabel];
        v87 = [v86 font];
        [v87 lineHeight];
        double v89 = v88;
        v148.origin.x = v79;
        v148.origin.y = recta;
        v148.size.double width = v82;
        v148.size.double height = v84;
        CGFloat v90 = CGRectGetHeight(v148);
        double v91 = MinY + PSRoundToPixel((v89 - v90) * 0.5);

        objc_msgSend(v73, "setFrame:", v79, v91, v82, v84);
      }
      LOBYTE(v24) = v127;
    }
    else
    {

      v73 = 0;
    }
    v92 = [(PSBadgedTableCell *)self textLabel];
    [v92 frame];
    double v93 = CGRectGetMinY(v149);
    v94 = [(PSBadgedTableCell *)self textLabel];
    v95 = [v94 font];
    [v95 lineHeight];
    double v97 = v96;
    v150.origin.x = v130;
    v150.origin.y = v59;
    v150.size.double width = v129;
    v150.size.double height = v128;
    CGFloat v98 = CGRectGetHeight(v150);
    double v99 = v59 - (v93 + PSRoundToPixel((v97 - v98) * 0.5));

    double v59 = v59 - v99;
    -[UIImageView setFrame:](self->_badgeImageView, "setFrame:", v130, v59, v129, v128);
    -[UILabel setFrame:](self->_badgeNumberLabel, "setFrame:", v130, v59, v129, v128);

    goto LABEL_42;
  }
  CGFloat v121 = v37;
  double v54 = CGRectGetMaxX(*(CGRect *)&v42);
  v141.origin.x = v26;
  v141.origin.y = v29;
  v141.size.double width = v11;
  v141.size.double height = v13;
  if (v54 > CGRectGetMinX(v141))
  {
    v142.origin.x = v26;
    double v119 = v29;
    v142.origin.y = v29;
    v142.size.double width = v11;
    v142.size.double height = v13;
    double v55 = CGRectGetMinX(v142);
    v143.origin.x = v35;
    double v53 = v121;
    v143.origin.y = v121;
    v143.size.double width = v39;
    v143.size.double height = v41;
    double v56 = v55 - CGRectGetMinX(v143);
    [(PSBadgedTableCell *)self contentAccessoryPadding];
    double v39 = v56 - v57;
    double v52 = v35;
    goto LABEL_23;
  }
  double v52 = v35;
  double v59 = v29;
  double v53 = v121;
  if (IsAccessibilityCategory) {
    goto LABEL_28;
  }
LABEL_42:
  if ([(PSBadgedTableCell *)self style] != 3) {
    return;
  }
  v100 = [(PSBadgedTableCell *)self detailTextLabel];
  [v100 frame];
  double v102 = v101;
  double v104 = v103;
  CGFloat v106 = v105;
  double v108 = v107;

  if (v24)
  {
    v151.size.double width = v129;
    v151.origin.x = v130;
    v151.origin.y = v59;
    v151.size.double height = v128;
    double v109 = CGRectGetMaxX(v151);
    [(PSBadgedTableCell *)self contentAccessoryPadding];
    double v111 = v109 + v110;
    v152.origin.x = v102;
    v152.origin.y = v104;
    v152.size.double width = v106;
    v152.size.double height = v108;
    if (CGRectGetMinX(v152) >= v111) {
      return;
    }
    v153.origin.x = v102;
    v153.origin.y = v104;
    v153.size.double width = v106;
    v153.size.double height = v108;
    double v112 = v111 - CGRectGetMinX(v153);
    v154.origin.x = v102;
    v154.origin.y = v104;
    v154.size.double width = v106;
    v154.size.double height = v108;
    double v113 = CGRectGetMaxX(v154) - v111;
  }
  else
  {
    v155.size.double width = v129;
    v155.origin.x = v130;
    v155.origin.y = v59;
    v155.size.double height = v128;
    double v114 = CGRectGetMinX(v155);
    [(PSBadgedTableCell *)self contentAccessoryPadding];
    double v116 = v114 - v115;
    v156.origin.x = v102;
    v156.origin.y = v104;
    v156.size.double width = v106;
    v156.size.double height = v108;
    if (CGRectGetMaxX(v156) <= v116) {
      return;
    }
    v157.origin.x = v102;
    v157.origin.y = v104;
    v157.size.double width = v106;
    v157.size.double height = v108;
    CGRectGetMinX(v157);
    v158.origin.x = v102;
    v158.origin.y = v104;
    v158.size.double width = v106;
    v158.size.double height = v108;
    double v113 = v116 - CGRectGetMinX(v158);
    double v112 = -0.0;
  }
  v117 = [(PSBadgedTableCell *)self detailTextLabel];
  objc_msgSend(v117, "setFrame:", v102 + v112, v104, v113, v108);
}

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  return @"PSBadgedTableCell";
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PSBadgedTableCell;
  [(PSTableCell *)&v4 dealloc];
}

- (void)resetLocale
{
  badgeNumberLabel = self->_badgeNumberLabel;
  objc_super v4 = (void *)MEMORY[0x1E4F28EE0];
  double v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_badgeInt];
  double v6 = [v4 localizedStringFromNumber:v5 numberStyle:0];
  [(UILabel *)badgeNumberLabel setText:v6];

  [(PSBadgedTableCell *)self setNeedsLayout];
}

- (double)contentAccessoryPadding
{
  return 10.0;
}

- (double)minimumBadgeWidth
{
  return 30.0;
}

- (BOOL)_shouldUseRoundStyle
{
  [(id)objc_opt_class() badgePadding];
  return v2 == 0.0;
}

+ (double)badgePadding
{
  return 0.0;
}

+ (id)unreadBubbleImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PSBadgedTableCell_unreadBubbleImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unreadBubbleImage_onceToken != -1) {
    dispatch_once(&unreadBubbleImage_onceToken, block);
  }
  double v2 = (void *)unreadBubbleImage_image;
  return v2;
}

uint64_t __38__PSBadgedTableCell_unreadBubbleImage__block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F42A80];
  v3 = PSPreferencesFrameworkBundle();
  objc_super v4 = [MEMORY[0x1E4F42D90] mainScreen];
  double v5 = [v4 traitCollection];
  uint64_t v6 = [v2 imageNamed:@"UnreadBubble" inBundle:v3 compatibleWithTraitCollection:v5];
  double v7 = (void *)unreadBubbleImage_image;
  unreadBubbleImage_image = v6;

  uint64_t result = [*(id *)(a1 + 32) badgePadding];
  if (v9 != 0.0)
  {
    double v10 = (void *)unreadBubbleImage_image;
    [*(id *)(a1 + 32) badgePadding];
    uint64_t v12 = [v10 stretchableImageWithLeftCapWidth:(uint64_t)v11 topCapHeight:0];
    uint64_t v13 = unreadBubbleImage_image;
    unreadBubbleImage_image = v12;
    return MEMORY[0x1F41817F8](v12, v13);
  }
  return result;
}

+ (id)badgeNumberLabelTextColor
{
  return (id)[MEMORY[0x1E4F428B8] whiteColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeNumberLabel, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
}

@end