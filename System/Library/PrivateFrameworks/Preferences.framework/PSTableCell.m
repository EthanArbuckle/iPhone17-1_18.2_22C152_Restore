@interface PSTableCell
+ (Class)cellClassForSpecifier:(id)a3;
+ (double)defaultCellHeight;
+ (id)reuseIdentifierForBasicCellTypes:(int64_t)a3;
+ (id)reuseIdentifierForClassAndType:(int64_t)a3;
+ (id)reuseIdentifierForSpecifier:(id)a3;
+ (id)stringFromCellType:(int64_t)a3;
+ (id)traitsThatImpactImageRendering;
+ (int64_t)cellStyle;
+ (int64_t)cellTypeFromString:(id)a3;
- (BOOL)canBeChecked;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canReload;
- (BOOL)cellEnabled;
- (BOOL)forceHideDisclosureIndicator;
- (BOOL)isChecked;
- (BOOL)isCopyable;
- (BOOL)modernLayoutEnabled;
- (BOOL)reusedCell;
- (BOOL)shouldUseModernLayout;
- (CGSize)iconSizeForShape:(unint64_t)a3 scale:(double)a4;
- (NSArray)constraints;
- (NSNumber)lazyIconShapeOverride;
- (NSString)lazyIconUTTypeIdentifier;
- (NSURL)lazyIconURL;
- (PSSpecifier)specifier;
- (PSTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (SEL)action;
- (SEL)cellAction;
- (UILongPressGestureRecognizer)longTapRecognizer;
- (UITraitCollection)cachedTraitCollection;
- (double)textFieldOffset;
- (id)_automationID;
- (id)_checkmarkImage:(BOOL)a3;
- (id)_contentString;
- (id)_copyableText;
- (id)_disclosureChevronImage:(BOOL)a3;
- (id)_urlSession;
- (id)blankIcon;
- (id)cellTarget;
- (id)getIcon;
- (id)getIconFromIconServices;
- (id)getLazyIcon;
- (id)getLazyIconID;
- (id)imageDescriptor;
- (id)lazyIconQueue:(id)a3;
- (id)scriptingInfoWithChildren;
- (id)target;
- (id)title;
- (id)titleTextLabel;
- (id)value;
- (int64_t)type;
- (unint64_t)iconShape;
- (void)_invalidateHighlightContext;
- (void)_updateAccessoryTypeForSpecifier:(id)a3;
- (void)cellRemovedFromView;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)forceSynchronousIconLoadOnNextIconLoad;
- (void)handleTraitCollectionChange:(id)a3;
- (void)highlightCellForDuration:(double)a3 animateUnighlight:(BOOL)a4;
- (void)layoutSubviews;
- (void)loadISIconFromSpecifier:(id)a3;
- (void)longPressed:(id)a3;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
- (void)setAction:(SEL)a3;
- (void)setAlignment:(int)a3;
- (void)setCachedTraitCollection:(id)a3;
- (void)setCellAction:(SEL)a3;
- (void)setCellEnabled:(BOOL)a3;
- (void)setCellTarget:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setConstraints:(id)a3;
- (void)setForceHideDisclosureIndicator:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIcon:(id)a3;
- (void)setIsCopyable:(BOOL)a3;
- (void)setLazyIconShapeOverride:(id)a3;
- (void)setLazyIconURL:(id)a3;
- (void)setLazyIconUTTypeIdentifier:(id)a3;
- (void)setLongTapRecognizer:(id)a3;
- (void)setReusedCell:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldHideTitle:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5;
- (void)setupModernLayoutConstraints;
@end

@implementation PSTableCell

- (void)layoutSubviews
{
  if ([(PSTableCell *)self modernLayoutEnabled])
  {
    [(PSTableCell *)self setupModernLayoutConstraints];
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v4 = [v3 BOOLForKey:@"PSTableCellVisualLabelDebugging"];

    if (v4)
    {
      v5 = [MEMORY[0x1E4F428B8] greenColor];
      v6 = [v5 colorWithAlphaComponent:0.3];
      v7 = [(PSTableCell *)self textLabel];
      [v7 setBackgroundColor:v6];

      id v159 = [MEMORY[0x1E4F428B8] greenColor];
      v8 = [v159 colorWithAlphaComponent:0.2];
      v9 = [(PSTableCell *)self detailTextLabel];
      [v9 setBackgroundColor:v8];
    }
    return;
  }
  v161.receiver = self;
  v161.super_class = (Class)PSTableCell;
  [(PSTableCell *)&v161 layoutSubviews];
  v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v11 = [v10 BOOLForKey:@"PSTableCellVisualLabelDebugging"];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F428B8] redColor];
    v13 = [v12 colorWithAlphaComponent:0.3];
    v14 = [(PSTableCell *)self textLabel];
    [v14 setBackgroundColor:v13];

    v15 = [MEMORY[0x1E4F428B8] redColor];
    v16 = [v15 colorWithAlphaComponent:0.2];
    v17 = [(PSTableCell *)self detailTextLabel];
    [v17 setBackgroundColor:v16];
  }
  int v18 = [(PSTableCell *)self _shouldReverseLayoutDirection];
  v19 = [(PSTableCell *)self contentView];
  [v19 bounds];
  double v157 = v21;
  double v158 = v20;
  id v160 = v22;
  double v24 = v23;

  v25 = [(PSTableCell *)self contentView];
  [v25 bounds];
  double v27 = v26;
  double v29 = v28;

  v30 = [(PSTableCell *)self traitCollection];
  v31 = [v30 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v31);

  if (IsAccessibilityCategory)
  {
    v33 = [(PSTableCell *)self textLabel];
    LODWORD(v34) = 1045220557;
    [v33 _setHyphenationFactor:v34];

    v35 = [(PSTableCell *)self detailTextLabel];
    LODWORD(v36) = 1055286886;
    [v35 _setHyphenationFactor:v36];
  }
  if ((self->_alignment & 0xFFFFFFFE) == 2)
  {
    v37 = [(PSTableCell *)self textLabel];
    [v37 frame];
    if (self->_alignment == 2)
    {
      float v39 = v27 * 0.5 - v38 * 0.5;
      double v40 = roundf(v39);
    }
    else
    {
      double v40 = v27 - v38 + -10.0;
    }
    [v37 setFrame:v40];
    v41 = [(PSTableCell *)self detailTextLabel];

    v64 = [v41 text];
    uint64_t v65 = [v64 length];

    if (!v65) {
      goto LABEL_28;
    }
    [v41 frame];
    double v47 = v66;
    double v51 = v67;
    double v61 = v27 - v63 + -10.0;
    *(float *)&double v66 = v27 * 0.5 - v63 * 0.5;
    double v68 = roundf(*(float *)&v66);
    if (self->_alignment == 2) {
      double v61 = v68;
    }
    goto LABEL_27;
  }
  v41 = [(PSTableCell *)self specifier];
  uint64_t v42 = [v41 propertyForKey:@"LeftAlignLinkListDetailText"];
  if (v42)
  {
    v43 = (void *)v42;
    int64_t v44 = [(PSTableCell *)self type];

    if (v44 != 2) {
      goto LABEL_29;
    }
    v41 = [(PSTableCell *)self detailTextLabel];
    [v41 setTextAlignment:0];
    [v41 frame];
    double v155 = v45;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    [(PSTableCell *)self textFieldOffset];
    double v53 = v52;
    v54 = [(PSTableCell *)self textLabel];
    [v54 frame];
    double v55 = v24;
    double v57 = v56;
    v58 = [(PSTableCell *)self _tableView];
    [v58 layoutMargins];
    double v60 = v57 + v59 + 6.0;

    if (v60 <= v53) {
      double v61 = v53;
    }
    else {
      double v61 = v60;
    }
    double v24 = v55;
    double v62 = v61 - v155;
    if (v18) {
      double v62 = 0.0;
    }
    double v63 = v49 - v62;
    if (v18) {
      double v61 = *(double *)&v160 - v61 - v49;
    }
LABEL_27:
    objc_msgSend(v41, "setFrame:", v61, v47, v63, v51);
  }
LABEL_28:

LABEL_29:
  checkedImageView = self->_checkedImageView;
  if (!checkedImageView) {
    goto LABEL_48;
  }
  double v153 = v24;
  [(UIImageView *)checkedImageView frame];
  CGFloat v71 = v70;
  CGFloat v73 = v72;
  double v154 = v29;
  double v156 = v27;
  float v74 = (v29 - v72) * 0.5;
  double v75 = floorf(v74);
  double v76 = v27 + -8.0 - v70;
  if (v18) {
    double v77 = 8.0;
  }
  else {
    double v77 = v76;
  }
  -[UIImageView setFrame:](self->_checkedImageView, "setFrame:", v77, v75);
  v78 = [(PSTableCell *)self valueLabel];
  v79 = v78;
  if (v78)
  {
    [v78 frame];
    double v84 = v80;
    double v85 = v81;
    double v86 = v83;
    if (v18)
    {
      double v152 = v82;
      v87 = [(PSTableCell *)self detailTextLabel];
      [v87 frame];
      double v89 = v88;
      v163.origin.x = v77;
      v163.origin.y = v75;
      v163.size.width = v71;
      v163.size.height = v73;
      CGFloat v90 = CGRectGetMaxX(v163) + v89 + 9.0;

      double v84 = v84 + v90;
      objc_msgSend(v79, "setFrame:", v84, v85, v152, v86);
      v164.origin.x = v84;
      v164.origin.y = v85;
      v164.size.width = v152;
      v164.size.height = v86;
      double MaxX = CGRectGetMaxX(v164);
      v92 = [(PSTableCell *)self textLabel];
      [v92 frame];
      double v93 = MaxX - (CGRectGetMinX(v165) + -6.0);

      if (v93 > 0.0)
      {
        double v94 = v85;
        double v95 = v152;
        goto LABEL_45;
      }
    }
    else
    {
      double v96 = v82;
      double v93 = CGRectGetMaxX(*(CGRect *)&v80) - (v76 + -9.0);
      if (v93 > 0.0)
      {
        double v94 = v85;
        double v95 = v96;
        v97 = [(PSTableCell *)self textLabel];
        [v97 frame];
        double v98 = v84 - (CGRectGetMaxX(v166) + 6.0);

        if (v98 > 0.0)
        {
          if (v93 <= v98) {
            double v99 = v95;
          }
          else {
            double v99 = v95 - (v93 - v98);
          }
          if (v93 <= v98) {
            double v84 = v84 - v93;
          }
          else {
            double v84 = v84 - v98;
          }
          goto LABEL_46;
        }
LABEL_45:
        double v99 = v95 - v93;
LABEL_46:
        objc_msgSend(v79, "setFrame:", v84, v94, v99, v86);
      }
    }
  }

  double v29 = v154;
  double v27 = v156;
  double v24 = v153;
LABEL_48:
  int64_t v100 = [(PSTableCell *)self type];
  if (v100 == 10)
  {
    v114 = [(PSTableCell *)self iconImageView];
    v102 = v114;
    if (v114)
    {
      [v114 frame];
      double v116 = v115;
      double v118 = v117;
      v119 = [(PSTableCell *)self contentView];
      [v119 bounds];
      double v121 = v120;
      double v123 = v122;
      double v125 = v124;
      double v127 = v126;

      objc_msgSend(v102, "setFrame:", floor(v121 + v125 * 0.5 - v116 * 0.5), floor(v123 + v127 * 0.5 - v118 * 0.5), v116, v118);
    }
  }
  else
  {
    if (v100 != 14) {
      goto LABEL_56;
    }
    v101 = [(PSTableCell *)self specifier];
    v102 = [v101 propertyForKey:@"height"];

    if (v102)
    {
      [v102 floatValue];
      double v24 = v103;
    }
    double v104 = PSTextViewInsets();
    double v106 = v158 + v105;
    double v107 = v157 + v104;
    double v109 = *(double *)&v160 - (v105 + v108);
    double v111 = v24 - (v104 + v110);
    v112 = [(PSTableCell *)self textView];
    objc_msgSend(v112, "setFrame:", v106, v107, v109, v111);

    v113 = [(PSTableCell *)self textLabel];
    [v113 setHidden:1];
  }
LABEL_56:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
  v129 = [WeakRetained propertyForKey:@"prioritizeValueTextDisplay"];
  int v130 = [v129 BOOLValue];

  if (v130)
  {
    v131 = [(PSTableCell *)self valueLabel];
    objc_msgSend(v131, "sizeThatFits:", v27, v29);
    [v131 frame];
    double v133 = v132;
    double v135 = v134;
    double v137 = v136;
    double v139 = v138;
    UICeilToViewScale();
    double v141 = v140 - v137;
    if (v140 - v137 > 0.0)
    {
      objc_msgSend(v131, "setFrame:", v133 - v141, v135, v137 + v141, v139);
      v142 = [(PSTableCell *)self titleLabel];
      [v142 frame];
      double v144 = v143;
      double v146 = v145;
      double v148 = v147;
      double v150 = v149;

      v151 = [(PSTableCell *)self titleLabel];
      objc_msgSend(v151, "setFrame:", v144, v146, v148 - v141, v150);
    }
  }
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)modernLayoutEnabled
{
  v3 = [(PSTableCell *)self traitCollection];
  int v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
  {
    v6 = [(PSTableCell *)self specifier];
    v7 = [v6 objectForKeyedSubscript:@"useModernLayout"];
    if ([v7 BOOLValue])
    {

      return 1;
    }
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = [(PSTableCell *)self shouldUseModernLayout];

      if (v8) {
        return 1;
      }
    }
    else
    {
    }
  }
  return 0;
}

- (PSSpecifier)specifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
  return (PSSpecifier *)WeakRetained;
}

+ (int64_t)cellTypeFromString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 length] < 3) {
    goto LABEL_2;
  }
  int v6 = [v3 characterAtIndex:2];
  if (v6 <= 75)
  {
    if (v6 == 69)
    {
      if ([v3 isEqualToString:@"PSEditTextCell"])
      {
        int64_t v4 = 8;
        goto LABEL_3;
      }
      if ([v3 isEqualToString:@"PSEditTextViewCell"])
      {
        int64_t v4 = 14;
        goto LABEL_3;
      }
      goto LABEL_2;
    }
    if (v6 == 71)
    {
      if ([v3 isEqualToString:@"PSGroupCell"])
      {
        int64_t v4 = 0;
        goto LABEL_3;
      }
      if ([v3 isEqualToString:@"PSGiantIconCell"])
      {
        int64_t v4 = 10;
        goto LABEL_3;
      }
      if ([v3 isEqualToString:@"PSGiantCell"])
      {
        int64_t v4 = 11;
        goto LABEL_3;
      }
      goto LABEL_2;
    }
    goto LABEL_21;
  }
  if (v6 == 76)
  {
    if ([v3 isEqualToString:@"PSLinkCell"])
    {
      int64_t v4 = 1;
      goto LABEL_3;
    }
    if ([v3 isEqualToString:@"PSLinkListCell"])
    {
      int64_t v4 = 2;
      goto LABEL_3;
    }
    if ([v3 isEqualToString:@"PSListItemCell"])
    {
      int64_t v4 = 3;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  if (v6 == 83)
  {
    if ([v3 isEqualToString:@"PSSwitchCell"])
    {
      int64_t v4 = 6;
      goto LABEL_3;
    }
    if ([v3 isEqualToString:@"PSSliderCell"])
    {
      int64_t v4 = 5;
      goto LABEL_3;
    }
    if ([v3 isEqualToString:@"PSSegmentCell"])
    {
      int64_t v4 = 9;
      goto LABEL_3;
    }
    if ([v3 isEqualToString:@"PSSecureEditTextCell"])
    {
      int64_t v4 = 12;
      goto LABEL_3;
    }
    if ([v3 isEqualToString:@"PSSpinnerCell"])
    {
      int64_t v4 = 15;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  if (v6 != 84)
  {
LABEL_21:
    if ([v3 isEqualToString:@"PSButtonCell"])
    {
      int64_t v4 = 13;
      goto LABEL_3;
    }
    v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "CellType String (%@) Fell Back to PSDefaultCell", (uint8_t *)&v8, 0xCu);
    }

    goto LABEL_2;
  }
  if (([v3 isEqualToString:@"PSTableCell"] & 1) == 0
    && ([v3 isEqualToString:@"PSTitleValueCell"] & 1) != 0)
  {
    int64_t v4 = 4;
    goto LABEL_3;
  }
LABEL_2:
  int64_t v4 = -1;
LABEL_3:

  return v4;
}

void __39__PSTableCell_loadISIconFromSpecifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) getLazyIconID];
  if (v2 == *(void **)(a1 + 40))
  {
    id v7 = v2;
    id v3 = [*(id *)(a1 + 32) specifier];

    if (v3)
    {
      int64_t v4 = *(unsigned char **)(a1 + 32);
      if (v4[1097])
      {
        v5 = [v4 specifier];
        [v5 setProperty:*(void *)(a1 + 48) forKey:@"iconImage"];

        int64_t v4 = *(unsigned char **)(a1 + 32);
      }
      uint64_t v6 = *(void *)(a1 + 48);
      [v4 setIcon:v6];
    }
  }
  else
  {
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(PSTableCell *)self specifier];
  int v8 = [v7 propertyForKey:@"isTopLevelCell"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v10 = [(PSTableCell *)self specifier];
    int v11 = [v10 propertyForKey:@"hasSelectionStyle"];
    int v12 = [v11 BOOLValue];

    id v13 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (v5 && v12)
    {
      v15 = [(PSTableCell *)self textLabel];
      v16 = [MEMORY[0x1E4F428B8] whiteColor];
      [v15 setHighlightedTextColor:v16];

      v17 = [(PSTableCell *)self detailTextLabel];
      int v18 = [MEMORY[0x1E4F428B8] whiteColor];
      [v17 setHighlightedTextColor:v18];

      v19 = +[PSListController appearance];
      uint64_t v20 = [v19 padSelectionColor];
    }
    else
    {
      double v21 = +[PSListController appearance];
      v22 = [v21 cellHighlightColor];

      if (!v22)
      {
LABEL_8:
        [(PSTableCell *)self setSelectedBackgroundView:v14];

        goto LABEL_9;
      }
      double v23 = [(PSTableCell *)self textLabel];
      [v23 setHighlightedTextColor:0];

      double v24 = [(PSTableCell *)self detailTextLabel];
      [v24 setHighlightedTextColor:0];

      v19 = +[PSListController appearance];
      uint64_t v20 = [v19 cellHighlightColor];
    }
    v25 = (void *)v20;
    [v14 setBackgroundColor:v20];

    goto LABEL_8;
  }
LABEL_9:
  v26.receiver = self;
  v26.super_class = (Class)PSTableCell;
  [(PSTableCell *)&v26 setSelected:v5 animated:v4];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PSTableCell;
  [(PSTableCell *)&v4 setHighlighted:a3 animated:a4];
}

void __39__PSTableCell_loadISIconFromSpecifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) getLazyIcon];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PSTableCell_loadISIconFromSpecifier___block_invoke_2;
    block[3] = &unk_1E5C5D548;
    id v3 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v5 = v3;
    id v6 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __55__PSTableCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained handleTraitCollectionChange:v4];
}

- (id)blankIcon
{
  if ([(PSTableCell *)self iconShape] == 4) {
    PSBlankMessageAppIconImage();
  }
  else {
  v2 = PSBlankIconImage();
  }
  return v2;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [v5 cellType];
    switch(v6)
    {
      case 1:
      case 3:
      case 6:
        goto LABEL_3;
      case 2:
        if (![v5 hasValidGetter]) {
          goto LABEL_3;
        }
        v92 = [v5 performGetter];

        if (!v92) {
          goto LABEL_3;
        }
        break;
      case 4:
      case 5:
        break;
      default:
        if (v6 == 13)
        {
LABEL_3:
          id v7 = [(PSTableCell *)self textLabel];
          [v7 setNumberOfLines:0];

          int v8 = [(PSTableCell *)self detailTextLabel];
          [v8 setNumberOfLines:0];
        }
        break;
    }
  }
  if (refreshCellContentsWithSpecifier__onceToken != -1) {
    dispatch_once(&refreshCellContentsWithSpecifier__onceToken, &__block_literal_global_13);
  }
  int v9 = __useModernAccessibilityIdentifiers;
  uint64_t v10 = [v5 identifier];
  if (v9)
  {
    [(PSTableCell *)self setAccessibilityIdentifier:v10];
  }
  else
  {
    int v11 = [(PSTableCell *)self textLabel];
    [v11 setAccessibilityIdentifier:v10];
  }
  int v12 = [v5 propertyForKey:@"useLazyIcons"];
  self->_BOOL lazyIcon = [v12 BOOLValue];

  id v13 = [v5 propertyForKey:@"appIDForLazyIcon"];
  lazyIconAppID = self->_lazyIconAppID;
  self->_lazyIconAppID = v13;

  v15 = [v5 propertyForKey:@"dontUnloadLazyIcon"];
  self->_lazyIconDontUnload = [v15 BOOLValue];

  v16 = [v5 propertyForKey:@"urlForLazyIcon"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = v16;
    lazyIconURL = self->_lazyIconURL;
    self->_lazyIconURL = v17;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
      lazyIconURL = self->_lazyIconURL;
      self->_lazyIconURL = v19;
    }
    else
    {
      lazyIconURL = self->_lazyIconURL;
      self->_lazyIconURL = 0;
    }
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v133 = *((void *)v5 + 7);
    uint64_t v20 = [v5 name];
    double v21 = [v5 propertyForKey:@"isCopyable"];
    self->_isCopyable = [v21 BOOLValue];

    uint64_t v22 = [v5 propertyForKey:@"gestureRecognizers"];
    v131 = (void *)v22;
    double v132 = (void *)v20;
    uint64_t v127 = 1097;
    if (v22 && (double v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v129 = v16;
      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v134 objects:v140 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v135;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v135 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v134 + 1) + 8 * i);
            id v3 = [(PSTableCell *)self gestureRecognizers];
            char v30 = [v3 containsObject:v29];

            if ((v30 & 1) == 0) {
              [(PSTableCell *)self addGestureRecognizer:v29];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v134 objects:v140 count:16];
        }
        while (v26);
      }

      v16 = v129;
      uint64_t v20 = (uint64_t)v132;
    }
    else
    {
      [(PSTableCell *)self removeAllGestureRecognizers];
    }
    longTapRecognizer = self->_longTapRecognizer;
    unint64_t v32 = v133;
    if (self->_isCopyable)
    {
      if (!longTapRecognizer)
      {
        v33 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel_longPressed_];
        double v34 = self->_longTapRecognizer;
        self->_longTapRecognizer = v33;
      }
      v35 = [(PSTableCell *)self gestureRecognizers];
      char v36 = [v35 containsObject:self->_longTapRecognizer];

      unint64_t v32 = v133;
      if ((v36 & 1) == 0) {
        [(PSTableCell *)self addGestureRecognizer:self->_longTapRecognizer];
      }
    }
    else
    {
      [(PSTableCell *)self removeGestureRecognizer:longTapRecognizer];
      v37 = self->_longTapRecognizer;
      self->_longTapRecognizer = 0;
    }
    -[PSTableCell setTag:](self, "setTag:", v32, v127);
    [(PSTableCell *)self setType:v32];
    if ((v32 & 0xFFFFFFFFFFFFFFFELL) == 0xA) {
      [(PSTableCell *)self setAlignment:2];
    }
    if (v32 == 11)
    {
      double v38 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43870]];
      float v39 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0];
      double v40 = [v38 scaledFontForFont:v39];

      v41 = [(PSTableCell *)self titleLabel];
      [v41 setFont:v40];

      uint64_t v42 = [(PSTableCell *)self titleLabel];
      v43 = [MEMORY[0x1E4F428B8] systemBlueColor];
      [v42 setTextColor:v43];

      BOOL v130 = 0;
      BOOL v44 = 0;
    }
    else
    {
      BOOL v44 = v32 == 13;
      BOOL v130 = v32 == 3;
      if (v32 > 0xD || ((1 << v32) & 0x240E) == 0)
      {
        [(PSTableCell *)self setSelectionStyle:0];
        [(PSTableCell *)self _updateAccessoryTypeForSpecifier:v5];
        if (v32 != 13) {
          goto LABEL_47;
        }
        goto LABEL_41;
      }
    }
    double v45 = [v5 propertyForKey:@"adjustFontSizeToFitWidth"];
    uint64_t v46 = [v45 BOOLValue];

    double v47 = [(PSTableCell *)self titleLabel];
    [v47 setAdjustsFontSizeToFitWidth:v46];

    [(PSTableCell *)self _updateAccessoryTypeForSpecifier:v5];
    if (!v44) {
      goto LABEL_47;
    }
LABEL_41:
    if (![(PSTableCell *)self accessoryType])
    {
      double v48 = v16;
      double v49 = [(PSTableCell *)self titleLabel];
      double v50 = +[PSListController appearance];
      id v3 = [v50 buttonTextColor];
      double v51 = v3;
      if (!v3)
      {
        double v51 = [MEMORY[0x1E4F428B8] tableCellBlueTextColor];
      }
      double v52 = [(PSTableCell *)self _accessibilityHigherContrastTintColorForColor:v51];
      [v49 setTextColor:v52];

      if (!v3) {
      v16 = v48;
      }
    }
LABEL_47:
    double v53 = +[PSListController appearance];
    v54 = [v53 foregroundColor];

    if (v54)
    {
      double v55 = +[PSListController appearance];
      double v56 = [v55 foregroundColor];
      [(PSTableCell *)self setBackgroundColor:v56];
    }
    if ([(PSTableCell *)self type] == 13
      && (+[PSListController appearance],
          double v57 = objc_claimAutoreleasedReturnValue(),
          [v57 buttonTextColor],
          v58 = objc_claimAutoreleasedReturnValue(),
          v58,
          v57,
          v58))
    {
      double v59 = [(PSTableCell *)self textLabel];
      double v60 = +[PSListController appearance];
      double v61 = [v60 buttonTextColor];
      double v62 = [(PSTableCell *)self _accessibilityHigherContrastTintColorForColor:v61];
      [v59 setTextColor:v62];

      double v63 = [(PSTableCell *)self textLabel];
      v64 = +[PSListController appearance];
      id v3 = [v64 buttonTextColor];
      uint64_t v65 = [(PSTableCell *)self _accessibilityHigherContrastTintColorForColor:v3];
      [v63 setHighlightedTextColor:v65];
    }
    else
    {
      double v66 = +[PSListController appearance];
      double v67 = [v66 textColor];

      if (!v67 || v133 == 11)
      {
LABEL_56:
        double v68 = +[PSListController appearance];
        v69 = [v68 altTextColor];

        if (v69)
        {
          double v70 = [(PSTableCell *)self detailTextLabel];
          CGFloat v71 = +[PSListController appearance];
          double v72 = [v71 altTextColor];
          id v3 = [(PSTableCell *)self _accessibilityHigherContrastTintColorForColor:v72];
          [v70 setTextColor:v3];
        }
        if (v133 == 10) {
          [(PSTableCell *)self setShouldHideTitle:1];
        }
        if (v20) {
          [(PSTableCell *)self setTitle:v20];
        }
        id v73 = +[PSListController appearance];
        uint64_t v74 = [v73 cellHighlightColor];
        if (v74)
        {
          double v75 = (void *)v74;
          double v76 = [(PSTableCell *)self selectedBackgroundView];
          id v3 = [v76 backgroundColor];

          if (v3) {
            goto LABEL_66;
          }
          id v73 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
          double v77 = +[PSListController appearance];
          v78 = [v77 cellHighlightColor];
          [v73 setBackgroundColor:v78];

          [(PSTableCell *)self setSelectedBackgroundView:v73];
        }

LABEL_66:
        v79 = [v5 propertyForKey:@"iconImage"];
        if (v79)
        {
          double v80 = self;
          double v81 = v79;
LABEL_68:
          [(PSTableCell *)v80 setIcon:v81];
          goto LABEL_69;
        }
        double v89 = [(PSTableCell *)self imageView];
        CGFloat v90 = [v89 image];
        if (v90)
        {
          BOOL lazyIcon = self->_lazyIcon;

          if (!lazyIcon)
          {
            double v80 = self;
            double v81 = 0;
            goto LABEL_68;
          }
        }
        else
        {
        }
        if (self->_lazyIcon)
        {
          id v3 = [(PSTableCell *)self imageView];
          uint64_t v93 = [v3 image];
          if (v93)
          {
            double v94 = (void *)v93;
            [(PSTableCell *)self imageView];
            v96 = double v95 = v16;
            v97 = [v96 image];
            double v98 = [(PSTableCell *)self blankIcon];

            v16 = v95;
            if (v97 != v98) {
              goto LABEL_69;
            }
          }
          else
          {
          }
          if (self->_lazyIconForceSynchronous)
          {
            self->_lazyIconForceSynchronous = 0;
            double v121 = [(PSTableCell *)self getLazyIcon];
            if (v121)
            {
              [(PSTableCell *)self setIcon:v121];
              if (*((unsigned char *)&self->super.super.super.super.isa + v128))
              {
                double v122 = [(PSTableCell *)self specifier];
                [v122 setProperty:v121 forKey:@"iconImage"];
              }
            }
          }
          else
          {
            [(PSTableCell *)self loadISIconFromSpecifier:v5];
          }
        }
LABEL_69:
        double v82 = [v5 propertyForKey:@"alignment"];
        double v83 = v82;
        if (v82) {
          -[PSTableCell setAlignment:](self, "setAlignment:", [v82 intValue]);
        }
        double v84 = [v5 propertyForKey:@"useHighLegibilityAlternate"];
        int v85 = [v84 BOOLValue];

        if (!v85)
        {
LABEL_94:
          if (![v5 controllerLoadAction]
            && (CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0)
             || ![v5 legacyAction])
            && !*((void *)v5 + 3)
            && !*((void *)v5 + 8))
          {
            int64x2_t v101 = vdupq_n_s64(v133);
            if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v101, (int64x2_t)xmmword_1A667F4E0), (int32x4_t)vceqq_s64(v101, (int64x2_t)xmmword_1A667F4F0)))) & 1) == 0&& !*((void *)v5 + 6)&& !v79)
            {
              [(PSTableCell *)self setCellEnabled:0];
              v102 = _PSLoggingFacility();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
                *(_DWORD *)buf = 138412290;
                id v139 = WeakRetained;
                _os_log_impl(&dword_1A6597000, v102, OS_LOG_TYPE_DEFAULT, "########### Reminder: By default an 'action' Specifier without a setter will be disabled by Settings.\n%@", buf, 0xCu);
              }
            }
          }
          double v104 = [v5 values];

          if (!v104) {
            [v5 loadValuesAndTitlesFromDataSource];
          }
          if (v133 <= 0xD && ((1 << v133) & 0x200A) != 0
            || !*((void *)v5 + 2)
            || (id v116 = objc_loadWeakRetained((id *)v5 + 1),
                char v117 = objc_opt_respondsToSelector(),
                v116,
                (v117 & 1) == 0))
          {
            double v105 = 0;
LABEL_110:
            double v106 = [v5 propertyForKey:@"enabled"];
            double v107 = v106;
            if (v106) {
              -[PSTableCell setCellEnabled:](self, "setCellEnabled:", [v106 BOOLValue]);
            }
            if (*((void *)v5 + 3))
            {
              char v108 = v130;
              if (*((void *)v5 + 2)) {
                char v108 = 1;
              }
              if (v108) {
                goto LABEL_117;
              }
            }
            double v109 = [v5 propertyForKey:@"cellClass"];

            if (v109)
            {
LABEL_117:
              id v110 = objc_loadWeakRetained((id *)v5 + 1);
              [(PSTableCell *)self setValueChangedTarget:v110 action:*((void *)v5 + 3) specifier:v5];
            }
            double v111 = [v5 objectForKeyedSubscript:@"allowMultilineTitleKey"];
            int v112 = [v111 BOOLValue];

            if (v112)
            {
              v113 = [(PSTableCell *)self textLabel];
              [v113 setNumberOfLines:0];
            }
            goto LABEL_121;
          }
          id v118 = objc_loadWeakRetained((id *)v5 + 1);
          double v105 = SFPerformSelector();

          if (v105)
          {
            unint64_t v119 = v133;
            if (v133 == 9) {
              goto LABEL_145;
            }
            if (v133 == 4 || v133 == 2)
            {
              double v120 = [v5 shortTitleDictionary];
            }
            else
            {
              double v120 = [v5 titleDictionary];
            }
            double v123 = v120;
            if (v120)
            {
              uint64_t v124 = [v120 objectForKey:v105];

              double v105 = (void *)v124;
            }
          }
          unint64_t v119 = v133;
LABEL_145:
          if (v105)
          {
            if (v119 == 4
              && ([v5 name],
                  double v125 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v126 = [v125 length],
                  v125,
                  !v126))
            {
              [(PSTableCell *)self setTitle:v105];
            }
            else
            {
              [(PSTableCell *)self setValue:v105];
            }
          }
          goto LABEL_110;
        }
        uint64_t v86 = [v5 cellType];
        if (v86 == 4
          && ([v5 name], id v3 = objc_claimAutoreleasedReturnValue(), !objc_msgSend(v3, "length")))
        {
          v87 = v16;
          id v88 = [(PSTableCell *)self titleLabel];
        }
        else
        {
          v87 = v16;
          id v88 = [(PSTableCell *)self valueLabel];

          if (v86 != 4) {
            goto LABEL_91;
          }
        }

LABEL_91:
        double v99 = [v88 font];
        int64_t v100 = PSHighLegibilityAlternateFont(v99);

        if (v100) {
          [v88 setFont:v100];
        }

        v16 = v87;
        goto LABEL_94;
      }
      double v63 = [(PSTableCell *)self textLabel];
      v64 = +[PSListController appearance];
      id v3 = [v64 textColor];
      uint64_t v65 = [(PSTableCell *)self _accessibilityHigherContrastTintColorForColor:v3];
      [v63 setTextColor:v65];
    }

    goto LABEL_56;
  }
LABEL_121:
  if ([(PSTableCell *)self modernLayoutEnabled])
  {
    v114 = [(PSTableCell *)self textLabel];
    [v114 setNumberOfLines:0];

    double v115 = [(PSTableCell *)self detailTextLabel];
    [v115 setNumberOfLines:0];

    [(PSTableCell *)self setupModernLayoutConstraints];
  }
}

- (void)setIcon:(id)a3
{
  int v4 = a3 == 0;
  id v5 = a3;
  uint64_t v6 = [(PSTableCell *)self imageView];
  id v7 = [v6 image];
  int v8 = v7 == 0;

  int v9 = [(PSTableCell *)self imageView];
  [v9 setImage:v5];

  if (v4 != v8)
  {
    [(PSTableCell *)self setNeedsLayout];
  }
}

- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5
{
  -[PSTableCell setCellTarget:](self, "setCellTarget:", a3, a4, a5);
  [(PSTableCell *)self setCellAction:a4];
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setTitle:(id)a3
{
  BOOL shouldHideTitle = self->_shouldHideTitle;
  id v5 = a3;
  uint64_t v6 = v5;
  if (shouldHideTitle)
  {
    id v7 = (NSString *)[v5 copy];

    hiddenTitle = self->_hiddenTitle;
    self->_hiddenTitle = v7;
  }
  else
  {
    id v9 = [(PSTableCell *)self textLabel];
    [v9 setText:v6];

    hiddenTitle = (NSString *)v9;
  }
}

- (void)setCellTarget:(id)a3
{
}

- (void)setCellAction:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_pAction = v3;
}

- (void)_updateAccessoryTypeForSpecifier:(id)a3
{
  int v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4[7];
    id v13 = v4;
    uint64_t v6 = [v4 propertyForKey:@"accessory"];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = (int)[v6 intValue];
      id v9 = self;
    }
    else
    {
      if ((unint64_t)(v5 - 1) > 1)
      {
        if (self->_checked) {
          goto LABEL_5;
        }
      }
      else
      {
        if (!self->_forceHideDisclosureIndicator)
        {
          uint64_t v10 = [v13 propertyForKey:@"hidesDisclosureIndicator"];
          if ([v10 BOOLValue])
          {
          }
          else
          {
            int v11 = [v13 propertyForKey:@"useEtched"];
            char v12 = [v11 BOOLValue];

            if ((v12 & 1) == 0)
            {
              id v9 = self;
              uint64_t v8 = 1;
              goto LABEL_4;
            }
          }
        }
        if ([(PSTableCell *)self accessoryType] != 1) {
          goto LABEL_5;
        }
      }
      id v9 = self;
      uint64_t v8 = 0;
    }
LABEL_4:
    [(PSTableCell *)v9 setAccessoryType:v8];
LABEL_5:

    int v4 = v13;
  }
}

- (void)loadISIconFromSpecifier:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [(PSTableCell *)self lazyIconUTTypeIdentifier];
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F6F248]);
    uint64_t v8 = [(PSTableCell *)self lazyIconUTTypeIdentifier];
    uint64_t v6 = (void *)[v7 initWithType:v8];
  }
  id v9 = [(PSTableCell *)self imageDescriptor];
  uint64_t v10 = [v6 imageForDescriptor:v9];

  if (v6 && ([v10 placeholder] & 1) == 0)
  {
    double v21 = _PSLoggingFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [(PSTableCell *)self specifier];
      double v23 = [v22 identifier];
      *(_DWORD *)buf = 136315394;
      uint64_t v42 = "-[PSTableCell loadISIconFromSpecifier:]";
      __int16 v43 = 2112;
      BOOL v44 = v23;
      _os_log_impl(&dword_1A6597000, v21, OS_LOG_TYPE_DEFAULT, "%s: found fast icon for %@", buf, 0x16u);
    }
    id v12 = [(PSTableCell *)self getLazyIconID];
    id v24 = [(PSTableCell *)self getLazyIconID];
    if (v24 == v12)
    {
      uint64_t v25 = [(PSTableCell *)self specifier];

      if (!v25) {
        goto LABEL_14;
      }
      uint64_t v26 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v27 = [v10 CGImage];
      [v10 scale];
      objc_msgSend(v26, "imageWithCGImage:scale:orientation:", v27, 0);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v28 = [(PSTableCell *)self getLazyIconID];
      if (v28 == v12)
      {
        uint64_t v29 = [(PSTableCell *)self specifier];

        if (v29)
        {
          if (self->_lazyIconDontUnload)
          {
            char v30 = [(PSTableCell *)self specifier];
            [v30 setProperty:v24 forKey:@"iconImage"];
          }
          [(PSTableCell *)self setIcon:v24];
        }
      }
      else
      {
      }
    }
  }
  else
  {
    int v11 = [(PSTableCell *)self blankIcon];
    [(PSTableCell *)self setIcon:v11];

    id v12 = [(PSTableCell *)self getLazyIconID];
    if (v12)
    {
      id v13 = [(PSTableCell *)self lazyIconQueue:v4];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __39__PSTableCell_loadISIconFromSpecifier___block_invoke;
      v39[3] = &unk_1E5C5DDD0;
      v39[4] = self;
      id v14 = v12;
      id v40 = v14;
      v15 = (void *)MEMORY[0x1AD0BE2A0](v39);
      v16 = (void *)MEMORY[0x1E4F28B48];
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __39__PSTableCell_loadISIconFromSpecifier___block_invoke_3;
      double v34 = &unk_1E5C5E380;
      v35 = self;
      id v12 = v14;
      id v36 = v12;
      id v38 = v15;
      id v17 = v4;
      id v37 = v17;
      id v18 = v15;
      v19 = [v16 blockOperationWithBlock:&v31];
      objc_msgSend(v19, "setQualityOfService:", 25, v31, v32, v33, v34, v35);
      uint64_t v20 = [(PSTableCell *)self lazyIconQueue:v17];
      [v20 addOperation:v19];
    }
  }
LABEL_14:
}

- (id)lazyIconQueue:(id)a3
{
  id v3 = [a3 propertyForKey:@"customIconQueue"];
  if (!v3)
  {
    id v4 = (void *)lazyIconQueue____lazyIconQueue;
    if (!lazyIconQueue____lazyIconQueue)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      uint64_t v6 = (void *)lazyIconQueue____lazyIconQueue;
      lazyIconQueue____lazyIconQueue = (uint64_t)v5;

      [(id)lazyIconQueue____lazyIconQueue setMaxConcurrentOperationCount:8];
      id v4 = (void *)lazyIconQueue____lazyIconQueue;
    }
    id v3 = v4;
  }
  return v3;
}

- (id)imageDescriptor
{
  id v3 = [(PSTableCell *)self cachedTraitCollection];
  [v3 displayScale];
  double v5 = v4;

  unint64_t v6 = [(PSTableCell *)self iconShape];
  [(PSTableCell *)self iconSizeForShape:v6 scale:v5];
  if (v6 == 4)
  {
    id v9 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2A0]];
    [v9 setScale:v5];
    objc_msgSend(v9, "setSize:", 60.0, 45.0);
  }
  else
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v7, v8, v5);
  }
  uint64_t v10 = [(PSTableCell *)self cachedTraitCollection];
  [v9 setDrawBorder:1];
  objc_opt_class();
  gotLoadHelper_x8__OBJC_CLASS___SBSUITraitHomeScreenIconStyle(v11);
  id v12 = [v10 objectForTrait:objc_opt_class()];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  uint64_t v15 = [v14 configurationType];
  if (v15 == 3)
  {
    v19 = [v14 tintColor];
    id v17 = [v19 UIColor];

    BOOL v18 = 1;
    uint64_t v16 = 2;
  }
  else if (v15 == 2)
  {
    id v17 = 0;
    uint64_t v16 = 1;
    BOOL v18 = 1;
  }
  else if (v15)
  {
    uint64_t v16 = 0;
    id v17 = 0;
    BOOL v18 = 0;
  }
  else
  {
    uint64_t v16 = [v10 userInterfaceStyle] == 2;
    id v17 = 0;
    BOOL v18 = [v10 userInterfaceStyle] == 2;
  }
  [v9 setAppearance:v16];
  objc_msgSend(v9, "setPs_appearanceVariant:", v18);
  if (v17)
  {
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F228]), "initWithCGColor:", objc_msgSend(v17, "CGColor"));
    [v9 setTintColor:v20];
  }
  double v21 = [(PSTableCell *)self cachedTraitCollection];
  if ([v21 layoutDirection]) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 1;
  }
  [v9 setLanguageDirection:v22];

  double v23 = [(PSTableCell *)self cachedTraitCollection];
  objc_msgSend(v9, "setContrast:", objc_msgSend(v23, "accessibilityContrast") == 1);

  [v9 setShape:v6];
  return v9;
}

- (UITraitCollection)cachedTraitCollection
{
  return self->_cachedTraitCollection;
}

- (unint64_t)iconShape
{
  objc_opt_class();
  id v3 = [(PSTableCell *)self lazyIconShapeOverride];
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;

  if (!v5) {
    return 0;
  }
  unint64_t v6 = [(PSTableCell *)self lazyIconShapeOverride];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (NSNumber)lazyIconShapeOverride
{
  return self->_lazyIconShapeOverride;
}

- (void)handleTraitCollectionChange:(id)a3
{
  id v4 = a3;
  id v5 = [(PSTableCell *)self traitCollection];
  [(PSTableCell *)self setCachedTraitCollection:v5];

  objc_opt_class();
  unint64_t v6 = [(PSTableCell *)self lazyIconUTTypeIdentifier];
  if (objc_opt_isKindOfClass()) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0;
  }
  id v12 = v7;

  double v8 = [(PSTableCell *)self specifier];
  id v9 = [(PSTableCell *)self cachedTraitCollection];
  uint64_t v10 = [v9 changedTraitsFromTraitCollection:v4];

  double v11 = +[PSTableCell traitsThatImpactImageRendering];
  LODWORD(v9) = [v10 intersectsSet:v11];

  if (v9 && (v12 || self->_lazyIconAppID) && v8) {
    [(PSTableCell *)self loadISIconFromSpecifier:v8];
  }
}

- (NSString)lazyIconUTTypeIdentifier
{
  return self->_lazyIconUTTypeIdentifier;
}

- (void)setCachedTraitCollection:(id)a3
{
}

- (CGSize)iconSizeForShape:(unint64_t)a3 scale:(double)a4
{
  if (a3 == 4)
  {
    double v5 = PSSizeForMessagesIcon();
  }
  else
  {
    unint64_t v7 = PSBlankIconImage();
    [v7 size];
    double v9 = v8;
    double v11 = v10;

    double v5 = v9;
    double v6 = v11;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setReusedCell:(BOOL)a3
{
  self->_reusedCell = a3;
}

+ (int64_t)cellStyle
{
  return 1;
}

+ (Class)cellClassForSpecifier:(id)a3
{
  id v3 = (id)[a3 propertyForKey:@"cellClass"];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v4;
}

+ (id)reuseIdentifierForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = (id)[v3 propertyForKey:@"cellClass"];
  if (!v4)
  {
    uint64_t v5 = +[PSTableCell reuseIdentifierForBasicCellTypes:v3[7]];
    goto LABEL_5;
  }
  if ([v4 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v5 = [v4 reuseIdentifierForClassAndType:v3[7]];
LABEL_5:
    double v6 = (void *)v5;
    goto LABEL_7;
  }
  unint64_t v7 = NSStringFromClass(+[PSTableCell cellClassForSpecifier:v3]);
  double v8 = +[PSTableCell stringFromCellType:v3[7]];
  double v6 = [v7 stringByAppendingString:v8];

LABEL_7:
  return v6;
}

- (void)setSpecifier:(id)a3
{
  p_specifier = &self->_specifier;
  id v5 = a3;
  objc_storeWeak((id *)p_specifier, v5);
  double v6 = [v5 propertyForKey:@"iconUTTypeIdentifier"];
  [(PSTableCell *)self setLazyIconUTTypeIdentifier:v6];

  id v7 = [v5 propertyForKey:@"iconShapeOverride"];

  [(PSTableCell *)self setLazyIconShapeOverride:v7];
}

- (void)setLazyIconUTTypeIdentifier:(id)a3
{
}

- (void)setLazyIconShapeOverride:(id)a3
{
}

- (PSTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [(PSTableCell *)self initWithStyle:a3 reuseIdentifier:v8];
  double v11 = v10;
  if (v10)
  {
    v10->_alignment = 1;
    v10->_cellEnabled = 1;
    uint64_t v12 = [(PSTableCell *)v10 traitCollection];
    cachedTraitCollection = v11->_cachedTraitCollection;
    v11->_cachedTraitCollection = (UITraitCollection *)v12;

    objc_initWeak(&location, v11);
    id v14 = +[PSTableCell traitsThatImpactImageRendering];
    uint64_t v15 = objc_msgSend(v14, "bs_array");
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__PSTableCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
    v18[3] = &unk_1E5C5E358;
    objc_copyWeak(&v19, &location);
    id v16 = (id)[(PSTableCell *)v11 registerForTraitChanges:v15 withHandler:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v11;
}

+ (id)reuseIdentifierForBasicCellTypes:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return @"PSTableCell";
  }
  else {
    return off_1E5C5E458[a3 - 1];
  }
}

- (void)setForceHideDisclosureIndicator:(BOOL)a3
{
  if (self->_forceHideDisclosureIndicator != a3)
  {
    self->_forceHideDisclosureIndicator = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
    [(PSTableCell *)self _updateAccessoryTypeForSpecifier:WeakRetained];
  }
}

void __39__PSTableCell_loadISIconFromSpecifier___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) getLazyIconID];
  id v3 = v2;
  if (v2 != *(void **)(a1 + 40))
  {

LABEL_3:
    id v7 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:*(void *)(a1 + 56)];
    [v7 setQueuePriority:-4];
    [v7 setQualityOfService:25];
    id v4 = [*(id *)(a1 + 32) lazyIconQueue:*(void *)(a1 + 48)];
    [v4 addOperation:v7];

    return;
  }
  id v5 = [*(id *)(a1 + 32) specifier];

  if (!v5) {
    goto LABEL_3;
  }
  double v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  v6();
}

- (BOOL)canReload
{
  uint64_t v3 = objc_opt_class();
  return [(PSTableCell *)self isMemberOfClass:v3];
}

uint64_t __48__PSTableCell_refreshCellContentsWithSpecifier___block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"useModernAccessibilityIdentifiers", @"com.apple.preferences-framework", 0);
  __useModernAccessibilityIdentifiers = result != 0;
  return result;
}

+ (id)stringFromCellType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0x11) {
    return &stru_1EFB51FD0;
  }
  else {
    return off_1E5C5E3C8[a3 + 1];
  }
}

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  id v4 = NSStringFromClass((Class)a1);
  id v5 = +[PSTableCell stringFromCellType:a3];
  double v6 = [v4 stringByAppendingString:v5];

  return v6;
}

+ (double)defaultCellHeight
{
  return *MEMORY[0x1E4F43D18];
}

- (void)dealloc
{
  [(PSTableCell *)self _invalidateHighlightContext];
  v3.receiver = self;
  v3.super_class = (Class)PSTableCell;
  [(PSTableCell *)&v3 dealloc];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)longPressed:(id)a3
{
  if ([a3 state] == 1)
  {
    [(PSTableCell *)self becomeFirstResponder];
    id v13 = [MEMORY[0x1E4F42B88] sharedMenuController];
    [(PSTableCell *)self frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [(PSTableCell *)self superview];
    objc_msgSend(v13, "setTargetRect:inView:", v12, v5, v7, v9, v11);

    [v13 setMenuVisible:1 animated:1];
  }
}

- (id)_copyableText
{
  objc_super v3 = [(PSTableCell *)self detailTextLabel];
  double v4 = [v3 text];

  if (!v4)
  {
    double v5 = [(PSTableCell *)self titleLabel];
    double v4 = [v5 text];
  }
  return v4;
}

- (void)copy:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F42C50], "generalPasteboard", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [(PSTableCell *)self _copyableText];
  [v5 setString:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_copy_ != a3) {
    return 0;
  }
  id v5 = [(PSTableCell *)self _copyableText];
  BOOL v4 = v5 != 0;

  return v4;
}

- (void)prepareForReuse
{
  [(PSTableCell *)self _invalidateHighlightContext];
  objc_super v3 = [(PSTableCell *)self detailTextLabel];
  BOOL v4 = [v3 text];

  if (v4)
  {
    id v5 = [(PSTableCell *)self detailTextLabel];
    [v5 setText:0];
  }
  double v6 = [(PSTableCell *)self textLabel];
  double v7 = [v6 text];

  if (v7)
  {
    double v8 = [(PSTableCell *)self textLabel];
    [v8 setText:0];
  }
  [(PSTableCell *)self setValueChangedTarget:0 action:0 specifier:0];
  [(PSTableCell *)self setCellEnabled:1];
  double v9 = [(PSTableCell *)self imageView];
  double v10 = [v9 image];

  if (v10)
  {
    [(PSTableCell *)self setIcon:0];
    double v11 = [(PSTableCell *)self imageView];
    [v11 setHighlightedImage:0];
  }
  id value = self->_value;
  self->_id value = 0;

  self->_alignment = 1;
  self->_forceHideDisclosureIndicator = 0;
  id v13 = [(PSTableCell *)self specifier];
  [v13 removePropertyForKey:@"cellObject"];

  id v14 = [(PSTableCell *)self specifier];
  [v14 removePropertyForKey:@"control"];

  [(PSTableCell *)self cellRemovedFromView];
  [(PSTableCell *)self setSelectedBackgroundView:0];
  uint64_t v15 = [(PSTableCell *)self textLabel];
  [v15 setHighlightedTextColor:0];

  id v16 = [(PSTableCell *)self detailTextLabel];
  [v16 setHighlightedTextColor:0];

  v17.receiver = self;
  v17.super_class = (Class)PSTableCell;
  [(PSTableCell *)&v17 prepareForReuse];
}

- (BOOL)shouldUseModernLayout
{
  uint64_t v3 = objc_opt_class();
  return [(PSTableCell *)self isMemberOfClass:v3];
}

- (void)setupModernLayoutConstraints
{
  uint64_t v3 = [(PSTableCell *)self contentView];
  id v114 = [v3 layoutMarginsGuide];

  BOOL v4 = [(PSTableCell *)self contentView];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  double v6 = [(PSTableCell *)self _separatorView:1];
  double v7 = v6;
  if (v6)
  {
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v8 = [v7 bottomAnchor];
    double v9 = [v4 bottomAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    [v5 addObject:v10];

    double v11 = [v7 leadingAnchor];
    uint64_t v12 = [(PSTableCell *)self textLabel];
    id v13 = [v12 leadingAnchor];
    id v14 = [v11 constraintEqualToAnchor:v13];
    [v5 addObject:v14];

    uint64_t v15 = [v7 trailingAnchor];
    id v16 = [(PSTableCell *)self trailingAnchor];
    objc_super v17 = [v15 constraintEqualToAnchor:v16];
    [v5 addObject:v17];

    BOOL v18 = [v7 heightAnchor];
    id v19 = [v18 constraintEqualToConstant:0.5];
    [v5 addObject:v19];
  }
  uint64_t v20 = [(PSTableCell *)self selectedBackgroundView];
  double v21 = [(PSTableCell *)self subviews];
  int v22 = [v21 containsObject:v20];

  if (v22)
  {
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v23 = [v20 topAnchor];
    id v24 = [(PSTableCell *)self topAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24];
    [v5 addObject:v25];

    uint64_t v26 = [v20 leadingAnchor];
    uint64_t v27 = [(PSTableCell *)self leadingAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];
    [v5 addObject:v28];

    uint64_t v29 = [v20 trailingAnchor];
    char v30 = [(PSTableCell *)self trailingAnchor];
    uint64_t v31 = [v29 constraintEqualToAnchor:v30];
    [v5 addObject:v31];

    uint64_t v32 = [v20 bottomAnchor];
    v33 = [(PSTableCell *)self bottomAnchor];
    double v34 = [v32 constraintEqualToAnchor:v33];
    [v5 addObject:v34];
  }
  v35 = [(PSTableCell *)self imageView];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v36 = [(PSTableCell *)self imageView];
  id v37 = [v36 topAnchor];
  id v38 = [v4 topAnchor];
  float v39 = [v37 constraintGreaterThanOrEqualToAnchor:v38 constant:8.0];
  [v5 addObject:v39];

  id v40 = [(PSTableCell *)self imageView];
  v41 = [v40 leadingAnchor];
  uint64_t v42 = [v114 leadingAnchor];
  __int16 v43 = [v41 constraintEqualToAnchor:v42];
  [v5 addObject:v43];

  BOOL v44 = [(PSTableCell *)self imageView];
  uint64_t v45 = [v44 bottomAnchor];
  uint64_t v46 = [v4 bottomAnchor];
  double v47 = [v45 constraintLessThanOrEqualToAnchor:v46 constant:-8.0];
  [v5 addObject:v47];

  double v48 = [(PSTableCell *)self imageView];
  double v49 = [v48 centerYAnchor];
  double v50 = [v4 centerYAnchor];
  double v51 = [v49 constraintEqualToAnchor:v50];
  [v5 addObject:v51];

  double v52 = [(PSTableCell *)self imageView];
  LODWORD(v53) = 1148846080;
  [v52 setContentCompressionResistancePriority:0 forAxis:v53];

  v54 = [(PSTableCell *)self imageView];
  LODWORD(v55) = 1148846080;
  [v54 setContentCompressionResistancePriority:1 forAxis:v55];

  double v56 = [(PSTableCell *)self textLabel];
  [v56 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v57 = [(PSTableCell *)self textLabel];
  v58 = [v57 topAnchor];
  double v59 = [v4 topAnchor];
  double v60 = [v58 constraintGreaterThanOrEqualToAnchor:v59 constant:13.0];
  [v5 addObject:v60];

  double v61 = [(PSTableCell *)self imageView];
  uint64_t v62 = [v61 image];
  if (!v62)
  {

    goto LABEL_9;
  }
  double v63 = (void *)v62;
  v64 = [(PSTableCell *)self imageView];
  char v65 = [v64 isHidden];

  if (v65)
  {
LABEL_9:
    double v66 = [(PSTableCell *)self textLabel];
    double v67 = [v66 leadingAnchor];
    double v68 = [v114 leadingAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];
    [v5 addObject:v69];
    goto LABEL_10;
  }
  double v66 = [(PSTableCell *)self textLabel];
  double v67 = [v66 leadingAnchor];
  double v68 = [(PSTableCell *)self imageView];
  v69 = [v68 trailingAnchor];
  double v70 = [v67 constraintEqualToAnchor:v69 constant:15.0];
  [v5 addObject:v70];

LABEL_10:
  v113 = v20;

  CGFloat v71 = [(PSTableCell *)self textLabel];
  double v72 = [v71 bottomAnchor];
  id v73 = [v4 bottomAnchor];
  uint64_t v74 = [v72 constraintLessThanOrEqualToAnchor:v73 constant:-13.0];
  [v5 addObject:v74];

  double v75 = [(PSTableCell *)self textLabel];
  double v76 = [v75 centerYAnchor];
  double v77 = [v4 centerYAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  [v5 addObject:v78];

  v79 = [(PSTableCell *)self detailTextLabel];
  [v79 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v80 = [(PSTableCell *)self detailTextLabel];
  double v81 = [v80 topAnchor];
  double v82 = [v4 topAnchor];
  double v83 = [v81 constraintGreaterThanOrEqualToAnchor:v82 constant:13.0];
  [v5 addObject:v83];

  double v84 = [(PSTableCell *)self detailTextLabel];
  int v85 = [v84 leadingAnchor];
  uint64_t v86 = [(PSTableCell *)self textLabel];
  v87 = [v86 trailingAnchor];
  id v88 = [v85 constraintGreaterThanOrEqualToAnchor:v87 constant:6.0];
  [v5 addObject:v88];

  if ([(PSTableCell *)self accessoryType]
    || ([(PSTableCell *)self accessoryView],
        double v89 = objc_claimAutoreleasedReturnValue(),
        v89,
        v89))
  {
    CGFloat v90 = v7;
    v91 = [(PSTableCell *)self detailTextLabel];
    v92 = [v91 trailingAnchor];
    uint64_t v93 = v4;
  }
  else
  {
    CGFloat v90 = v7;
    v91 = [(PSTableCell *)self detailTextLabel];
    v92 = [v91 trailingAnchor];
    uint64_t v93 = v114;
  }
  double v94 = [v93 trailingAnchor];
  double v95 = [v92 constraintEqualToAnchor:v94];

  double v96 = [(PSTableCell *)self detailTextLabel];
  v97 = [v96 trailingAnchor];
  double v98 = [v4 trailingAnchor];
  double v99 = [v97 constraintLessThanOrEqualToAnchor:v98];

  LODWORD(v100) = 1132068864;
  [v95 setPriority:v100];
  [v5 addObject:v95];
  [v5 addObject:v99];
  int64x2_t v101 = [(PSTableCell *)self detailTextLabel];
  v102 = [v101 bottomAnchor];
  float v103 = [v4 bottomAnchor];
  double v104 = [v102 constraintLessThanOrEqualToAnchor:v103 constant:-13.0];
  [v5 addObject:v104];

  double v105 = [(PSTableCell *)self detailTextLabel];
  double v106 = [v105 centerYAnchor];
  double v107 = [v4 centerYAnchor];
  char v108 = [v106 constraintEqualToAnchor:v107];
  [v5 addObject:v108];

  double v109 = (void *)MEMORY[0x1E4F28DC8];
  id v110 = [(PSTableCell *)self constraints];
  [v109 deactivateConstraints:v110];

  [(PSTableCell *)self setConstraints:v5];
  double v111 = (void *)MEMORY[0x1E4F28DC8];
  int v112 = [(PSTableCell *)self constraints];
  [v111 activateConstraints:v112];
}

- (id)titleTextLabel
{
  if ([(PSTableCell *)self tag] == 10)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(PSTableCell *)self titleLabel];
  }
  return v3;
}

- (id)_contentString
{
  v2 = [(PSTableCell *)self textLabel];
  uint64_t v3 = [v2 text];

  return v3;
}

- (id)_urlSession
{
  urlSession = self->_urlSession;
  if (!urlSession)
  {
    BOOL v4 = [MEMORY[0x1E4F290E0] sharedSession];
    id v5 = self->_urlSession;
    self->_urlSession = v4;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (id)getLazyIcon
{
  uint64_t v3 = [(PSTableCell *)self getIconFromIconServices];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_8;
  }
  lazyIconURL = self->_lazyIconURL;
  if (lazyIconURL)
  {
    double v7 = [MEMORY[0x1E4F290D0] requestWithURL:lazyIconURL cachePolicy:2 timeoutInterval:20.0];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v20 = 0;
    double v21 = &v20;
    uint64_t v22 = 0x3032000000;
    double v23 = __Block_byref_object_copy__3;
    id v24 = __Block_byref_object_dispose__3;
    id v25 = 0;
    double v9 = [(PSTableCell *)self _urlSession];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __26__PSTableCell_getLazyIcon__block_invoke;
    objc_super v17 = &unk_1E5C5E3A8;
    id v19 = &v20;
    double v10 = v8;
    BOOL v18 = v10;
    double v11 = [v9 dataTaskWithRequest:v7 completionHandler:&v14];

    objc_msgSend(v11, "resume", v14, v15, v16, v17);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v12 = (void *)v21[5];
    if (v12)
    {
      id v5 = v12;

      _Block_object_dispose(&v20, 8);
      goto LABEL_8;
    }

    _Block_object_dispose(&v20, 8);
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

intptr_t __26__PSTableCell_getLazyIcon__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && !a4)
  {
    uint64_t v5 = [MEMORY[0x1E4F42A80] imageWithData:a2];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  dispatch_semaphore_t v8 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v8);
}

- (id)getIconFromIconServices
{
  if (!self->_lazyIconAppID)
  {
    uint64_t v3 = [(PSTableCell *)self lazyIconUTTypeIdentifier];

    if (!v3)
    {
      double v21 = 0;
      goto LABEL_21;
    }
  }
  BOOL v4 = [(PSTableCell *)self imageDescriptor];
  uint64_t v5 = [v4 shape];
  uint64_t v6 = [(PSTableCell *)self cachedTraitCollection];
  [v6 displayScale];
  double v8 = v7;

  if (!self->_lazyIconAppID)
  {
    objc_opt_class();
    double v10 = [(PSTableCell *)self lazyIconUTTypeIdentifier];
    if (objc_opt_isKindOfClass()) {
      double v11 = v10;
    }
    else {
      double v11 = 0;
    }
    id v12 = v11;

    if (!v12) {
      goto LABEL_14;
    }
    id v13 = [(PSTableCell *)self lazyIconUTTypeIdentifier];
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithType:v13];

    if (!v9) {
      goto LABEL_14;
    }
LABEL_11:
    uint64_t v14 = [v9 prepareImageForDescriptor:v4];
    if (v14)
    {
      uint64_t v15 = v14;
      id v16 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v17 = [v14 CGImage];
      [v15 scale];
      BOOL v18 = objc_msgSend(v16, "imageWithCGImage:scale:orientation:", v17, 0);
      id v19 = v18;
      if (v5 == 4)
      {
        [(PSTableCell *)self iconSizeForShape:4 scale:v8];
        objc_msgSend(v19, "imageByPreparingThumbnailOfSize:");
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v20 = v18;
      }
      double v21 = v20;
    }
    else
    {
      double v21 = 0;
    }

    goto LABEL_20;
  }
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:self->_lazyIconAppID];
  if (v9) {
    goto LABEL_11;
  }
LABEL_14:
  double v21 = 0;
LABEL_20:

LABEL_21:
  return v21;
}

- (id)getLazyIconID
{
  lazyIconAppID = (NSURL *)self->_lazyIconAppID;
  if (lazyIconAppID || (lazyIconAppID = self->_lazyIconURL) != 0)
  {
    BOOL v4 = lazyIconAppID;
  }
  else
  {
    objc_opt_class();
    uint64_t v6 = [(PSTableCell *)self lazyIconUTTypeIdentifier];
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      BOOL v4 = [(PSTableCell *)self lazyIconUTTypeIdentifier];
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)cellRemovedFromView
{
  [(PSTableCell *)self setSpecifier:0];
  if (self->_lazyIcon && !self->_lazyIconDontUnload)
  {
    [(PSTableCell *)self setIcon:0];
  }
}

- (void)forceSynchronousIconLoadOnNextIconLoad
{
  self->_lazyIconForceSynchronous = 1;
}

- (id)getIcon
{
  return 0;
}

- (id)title
{
  if (self->_shouldHideTitle)
  {
    v2 = self->_hiddenTitle;
  }
  else
  {
    uint64_t v3 = [(PSTableCell *)self textLabel];
    v2 = [v3 text];
  }
  return v2;
}

- (void)setShouldHideTitle:(BOOL)a3
{
  self->_BOOL shouldHideTitle = a3;
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_checked = a3;
  uint64_t v5 = [(PSTableCell *)self accessoryType];
  if (v3)
  {
    if (v5 == 1 || [(PSTableCell *)self accessoryType] == 2)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
      double v7 = [(PSTableCell *)self _checkmarkImage:0];
      id v8 = [(PSTableCell *)self _checkmarkImage:1];
      double v9 = (UIImageView *)[v6 initWithImage:v7 highlightedImage:v8];
      checkedImageView = self->_checkedImageView;
      self->_checkedImageView = v9;

      double v11 = [(PSTableCell *)self contentView];
      [v11 addSubview:self->_checkedImageView];

      [(PSTableCell *)self setNeedsLayout];
      return;
    }
    id v13 = self;
    uint64_t v14 = 3;
    goto LABEL_15;
  }
  if (v5 != 1 && [(PSTableCell *)self accessoryType] != 2)
  {
    id v13 = self;
    uint64_t v14 = 0;
LABEL_15:
    [(PSTableCell *)v13 setAccessoryType:v14];
    return;
  }
  [(UIImageView *)self->_checkedImageView removeFromSuperview];
  id v12 = self->_checkedImageView;
  self->_checkedImageView = 0;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (BOOL)canBeChecked
{
  return self->_type == 3;
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  if (self->_value != v5)
  {
    id v12 = v5;
    objc_storeStrong(&self->_value, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(PSTableCell *)self detailTextLabel];
      double v7 = v6;
      id v8 = v12;
LABEL_7:
      [v6 setText:v8];

      id v5 = v12;
      goto LABEL_8;
    }
    id v5 = v12;
    if (!self->_value)
    {
      double v9 = [(PSTableCell *)self detailTextLabel];
      double v10 = [v9 text];
      uint64_t v11 = [v10 length];

      id v5 = v12;
      if (v11)
      {
        id v6 = [(PSTableCell *)self detailTextLabel];
        double v7 = v6;
        id v8 = 0;
        goto LABEL_7;
      }
    }
  }
LABEL_8:
}

- (id)value
{
  return self->_value;
}

- (void)setAlignment:(int)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    [(PSTableCell *)self setNeedsLayout];
  }
}

- (void)setTarget:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  id v5 = [v4 callStackSymbols];
  NSLog(&cfstr_ImportantSetta.isa, v5);

  [(PSTableCell *)self setCellTarget:v6];
}

- (id)target
{
  BOOL v3 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&cfstr_ImportantTarge.isa, v3);

  return [(PSTableCell *)self cellTarget];
}

- (void)setAction:(SEL)a3
{
  id v5 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&cfstr_ImportantSetac.isa, v5);

  [(PSTableCell *)self setCellAction:a3];
}

- (SEL)action
{
  BOOL v3 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&cfstr_ImportantActio.isa, v3);

  return [(PSTableCell *)self cellAction];
}

- (id)cellTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_pTarget);
  return WeakRetained;
}

- (SEL)cellAction
{
  if (self->_pAction) {
    return self->_pAction;
  }
  else {
    return 0;
  }
}

- (void)setCellEnabled:(BOOL)a3
{
  if (self->_cellEnabled != a3)
  {
    BOOL v3 = a3;
    self->_cellEnabled = a3;
    -[PSTableCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    id v5 = [(PSTableCell *)self titleLabel];
    [v5 setEnabled:v3];

    id v6 = [(PSTableCell *)self detailTextLabel];
    [v6 setEnabled:v3];

    double v7 = [(PSTableCell *)self imageView];
    id v9 = v7;
    double v8 = 0.5;
    if (v3) {
      double v8 = 1.0;
    }
    [v7 setAlpha:v8];
  }
}

- (BOOL)cellEnabled
{
  return self->_cellEnabled;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  -[PSTableCell refreshCellContentsWithSpecifier:](self, "refreshCellContentsWithSpecifier:", a3, a4);
  [(PSTableCell *)self setNeedsLayout];
}

- (double)textFieldOffset
{
  BOOL v3 = [(PSTableCell *)self textLabel];
  BOOL v4 = [v3 text];
  if ([v4 length])
  {
    double v5 = 115.0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PSTableCell;
    [(PSTableCell *)&v8 textFieldOffset];
    double v5 = v6;
  }

  return v5;
}

- (void)highlightCellForDuration:(double)a3 animateUnighlight:(BOOL)a4
{
  BOOL v4 = a4;
  [(PSTableCell *)self _invalidateHighlightContext];
  double v7 = +[PSTableCellHighlightContext contextWithCell:self];
  customHighlightContext = self->_customHighlightContext;
  self->_customHighlightContext = v7;

  id v9 = self->_customHighlightContext;
  [(PSTableCellHighlightContext *)v9 performHighlightForDuration:v4 animateUnhighlight:a3];
}

- (void)_invalidateHighlightContext
{
  [(PSTableCellHighlightContext *)self->_customHighlightContext invalidate];
  customHighlightContext = self->_customHighlightContext;
  self->_customHighlightContext = 0;
}

- (id)_checkmarkImage:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[PSListController appearance];
  double v6 = [v5 buttonTextColor];

  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)PSTableCell;
    double v7 = [(PSTableCell *)&v12 _checkmarkImage:v3];
    objc_super v8 = [(PSTableCell *)self _accessibilityHigherContrastTintColorForColor:v6];
    id v9 = [v7 imageWithTintColor:v8 renderingMode:0];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PSTableCell;
    id v9 = [(PSTableCell *)&v11 _checkmarkImage:v3];
  }

  return v9;
}

- (id)_disclosureChevronImage:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[PSListController appearance];
  double v6 = [v5 cellAccessoryColor];

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)PSTableCell;
    double v7 = [(PSTableCell *)&v13 _disclosureChevronImage:v3];
    objc_super v8 = [(PSTableCell *)self _accessibilityHigherContrastTintColorForColor:v6];
    id v9 = [v7 _flatImageWithColor:v8];
    double v10 = [v9 imageFlippedForRightToLeftLayoutDirection];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PSTableCell;
    double v7 = [(PSTableCell *)&v12 _disclosureChevronImage:v3];
    double v10 = [v7 imageFlippedForRightToLeftLayoutDirection];
  }

  return v10;
}

+ (id)traitsThatImpactImageRendering
{
  if (traitsThatImpactImageRendering_onceToken != -1) {
    dispatch_once(&traitsThatImpactImageRendering_onceToken, &__block_literal_global_217);
  }
  v2 = (void *)traitsThatImpactImageRendering_traitsThatImpactImageRendering;
  return v2;
}

void __45__PSTableCell_traitsThatImpactImageRendering__block_invoke()
{
  id v5 = [MEMORY[0x1E4F1CA80] set];
  v0 = [MEMORY[0x1E4F42F80] systemTraitsAffectingImageLookup];
  [v5 addObjectsFromArray:v0];

  v1 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
  [v5 addObjectsFromArray:v1];

  gotLoadHelper_x8__OBJC_CLASS___SBSUITraitHomeScreenIconStyle(v2);
  [v5 addObject:objc_opt_class()];
  uint64_t v3 = [v5 copy];
  BOOL v4 = (void *)traitsThatImpactImageRendering_traitsThatImpactImageRendering;
  traitsThatImpactImageRendering_traitsThatImpactImageRendering = v3;
}

- (BOOL)reusedCell
{
  return self->_reusedCell;
}

- (BOOL)forceHideDisclosureIndicator
{
  return self->_forceHideDisclosureIndicator;
}

- (BOOL)isCopyable
{
  return self->_isCopyable;
}

- (void)setIsCopyable:(BOOL)a3
{
  self->_isCopyable = a3;
}

- (UILongPressGestureRecognizer)longTapRecognizer
{
  return self->_longTapRecognizer;
}

- (void)setLongTapRecognizer:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyIconShapeOverride, 0);
  objc_storeStrong((id *)&self->_lazyIconUTTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedTraitCollection, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_longTapRecognizer, 0);
  objc_storeStrong((id *)&self->_lazyIconURL, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_customHighlightContext, 0);
  objc_storeStrong((id *)&self->_lazyIconAppID, 0);
  objc_destroyWeak((id *)&self->_specifier);
  objc_destroyWeak(&self->_pTarget);
  objc_storeStrong((id *)&self->_hiddenTitle, 0);
  objc_storeStrong((id *)&self->_checkedImageView, 0);
  objc_storeStrong(&self->_value, 0);
}

- (NSURL)lazyIconURL
{
  return self->_lazyIconURL;
}

- (void)setLazyIconURL:(id)a3
{
}

- (id)_automationID
{
  uint64_t v3 = [(PSTableCell *)self title];
  if (!v3)
  {
    uint64_t v3 = [(PSTableCell *)self description];
  }
  unint64_t v4 = [(PSTableCell *)self tag];
  if (v4 <= 0xD && ((1 << v4) & 0x2C06) != 0)
  {
    id v5 = [@"BTN " stringByAppendingString:v3];
  }
  else
  {
    id v5 = v3;
  }
  double v6 = v5;

  return v6;
}

- (id)scriptingInfoWithChildren
{
  uint64_t v3 = [(PSTableCell *)self title];
  if (!v3)
  {
    uint64_t v3 = [(PSTableCell *)self description];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  switch([(PSTableCell *)self tag])
  {
    case 2:
    case 4:
    case 8:
      unint64_t v4 = [(PSTableCell *)self superview];
      [(PSTableCell *)self frame];
      objc_msgSend(v4, "convertRect:toView:", 0);
      *(void *)&long long v33 = v5;
      *((void *)&v33 + 1) = v6;
      *(void *)&long long v34 = v7;
      *((void *)&v34 + 1) = v8;

      uint64_t v9 = [@"DAT " stringByAppendingString:v3];

      double v10 = [(PSTableCell *)self valueLabel];
      objc_super v11 = [v10 text];
      goto LABEL_10;
    case 5:
      double v10 = [(PSTableCell *)self control];
      [v10 frame];
      -[PSTableCell convertRect:toView:](self, "convertRect:toView:", 0);
      *(void *)&long long v33 = v13;
      *((void *)&v33 + 1) = v14;
      *(void *)&long long v34 = v15;
      *((void *)&v34 + 1) = v16;
      uint64_t v9 = [@"SLD " stringByAppendingString:v3];

      uint64_t v17 = NSString;
      [v10 value];
      objc_msgSend(v17, "stringWithFormat:", @"%f", v18);
      objc_super v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6:
      double v10 = [(PSTableCell *)self control];
      [v10 frame];
      -[PSTableCell convertRect:toView:](self, "convertRect:toView:", 0);
      *(void *)&long long v33 = v19;
      *((void *)&v33 + 1) = v20;
      *(void *)&long long v34 = v21;
      *((void *)&v34 + 1) = v22;
      uint64_t v9 = [@"BTN " stringByAppendingString:v3];

      int v23 = [v10 isOn];
      id v24 = @"OFF";
      if (v23) {
        id v24 = @"ON";
      }
      objc_super v11 = v24;
LABEL_10:
      id v25 = v11;
      uint64_t v3 = (void *)v9;

      uint64_t v26 = (void *)MEMORY[0x1E4F1CA48];
      v31.receiver = self;
      v31.super_class = (Class)PSTableCell;
      uint64_t v27 = [(PSTableCell *)&v31 scriptingInfoWithChildren];
      objc_super v12 = [v26 arrayWithArray:v27];

      id v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
      uint64_t v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v33 length:32];
      [v28 setObject:v29 forKey:@"CGRect"];

      [v28 setObject:v3 forKey:@"ID"];
      if (v25) {
        [v28 setObject:v25 forKey:@"Value"];
      }
      [v12 addObject:v28];

      break;
    default:
      v32.receiver = self;
      v32.super_class = (Class)PSTableCell;
      objc_super v12 = [(PSTableCell *)&v32 scriptingInfoWithChildren];
      break;
  }

  return v12;
}

@end