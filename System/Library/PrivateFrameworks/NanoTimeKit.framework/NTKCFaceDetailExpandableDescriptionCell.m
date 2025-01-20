@interface NTKCFaceDetailExpandableDescriptionCell
+ (id)reuseIdentifier;
- (BOOL)expanded;
- (BOOL)shouldLayoutText;
- (NTKCFaceDetailExpandableDescriptionCell)init;
- (NTKCFaceDetailExpandableDescriptionCellDelegate)delegate;
- (UIButton)moreButton;
- (double)laidOutWidth;
- (void)_fontSizeDidChange;
- (void)_moreTapped;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAttributedText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setLaidOutWidth:(double)a3;
- (void)setMoreButton:(id)a3;
- (void)setShouldLayoutText:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation NTKCFaceDetailExpandableDescriptionCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailExpandableDescriptionCell)init
{
  v15.receiver = self;
  v15.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  v2 = [(NTKCFaceDetailDescriptionCell *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(NTKCFaceDetailExpandableDescriptionCell *)v2 setClipsToBounds:1];
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    moreButton = v3->_moreButton;
    v3->_moreButton = (UIButton *)v4;

    v6 = BPSBridgeTintColor();
    [(UIButton *)v3->_moreButton setTintColor:v6];

    v7 = [(NTKCFaceDetailDescriptionCell *)v3 textView];
    v8 = [v7 font];
    v9 = [(UIButton *)v3->_moreButton titleLabel];
    [v9 setFont:v8];

    v10 = v3->_moreButton;
    v12 = NTKCCustomizationLocalizedString(@"ACTION_MORE", @"more", v11);
    [(UIButton *)v10 setTitle:v12 forState:0];

    [(UIButton *)v3->_moreButton addTarget:v3 action:sel__moreTapped forControlEvents:64];
    v13 = [(NTKCFaceDetailExpandableDescriptionCell *)v3 contentView];
    [v13 addSubview:v3->_moreButton];

    v3->_shouldLayoutText = 1;
    v3->_laidOutWidth = 0.0;
  }
  return v3;
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    self->_shouldLayoutText = 1;
    [(NTKCFaceDetailExpandableDescriptionCell *)self setNeedsLayout];
  }
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  [(NTKCFaceDetailDescriptionCell *)&v4 setText:a3];
  self->_shouldLayoutText = 1;
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  [(NTKCFaceDetailDescriptionCell *)&v4 setAttributedText:a3];
  self->_shouldLayoutText = 1;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  [(NTKCFaceDetailExpandableDescriptionCell *)&v3 prepareForReuse];
  self->_shouldLayoutText = 1;
}

- (void)layoutSubviews
{
  v100[1] = *MEMORY[0x1E4F143B8];
  v99.receiver = self;
  v99.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  [(NTKCFaceDetailDescriptionCell *)&v99 layoutSubviews];
  objc_super v3 = [(NTKCFaceDetailExpandableDescriptionCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v101.origin.x = v5;
  v101.origin.y = v7;
  v101.size.width = v9;
  v101.size.height = v11;
  double Width = CGRectGetWidth(v101);
  [(NTKCFaceDetailExpandableDescriptionCell *)self separatorInset];
  double v14 = Width + v13 * -2.0;
  int IsRTL = CLKLayoutIsRTL();
  if (self->_shouldLayoutText || self->_laidOutWidth != v14)
  {
    v16 = [(NTKCFaceDetailDescriptionCell *)self textView];
    v17 = [v16 textContainer];
    [v17 setExclusionPaths:MEMORY[0x1E4F1CBF0]];

    v18 = [(NTKCFaceDetailDescriptionCell *)self textView];
    v19 = [v18 textContainer];
    [v19 setMaximumNumberOfLines:3];

    v20 = [(NTKCFaceDetailDescriptionCell *)self textView];
    objc_msgSend(v20, "sizeThatFits:", v14, 1.79769313e308);
    double rect_16 = v21;

    v22 = [(NTKCFaceDetailDescriptionCell *)self textView];
    v23 = [v22 textContainer];
    [v23 setMaximumNumberOfLines:0];

    v24 = [(NTKCFaceDetailDescriptionCell *)self textView];
    objc_msgSend(v24, "sizeThatFits:", v14, 1.79769313e308);
    double rect_8 = v25;

    if (self->_expanded) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = 3;
    }
    v27 = [(NTKCFaceDetailDescriptionCell *)self textView];
    v28 = [v27 textContainer];
    [v28 setMaximumNumberOfLines:v26];

    v29 = [(NTKCFaceDetailDescriptionCell *)self textView];
    [v29 frame];

    v30 = [(NTKCFaceDetailDescriptionCell *)self textView];
    objc_msgSend(v30, "sizeThatFits:", v14, 1.79769313e308);
    double v32 = v31;

    [(NTKCFaceDetailExpandableDescriptionCell *)self separatorInset];
    double v34 = v33;
    v35 = [(NTKCFaceDetailDescriptionCell *)self textView];
    v36 = [v35 font];
    [v36 _scaledValueForValue:13.5];
    double v38 = v37;

    v39 = [(NTKCFaceDetailDescriptionCell *)self textView];
    objc_msgSend(v39, "setFrame:", v34, v38, v14, v32);

    v40 = [(NTKCFaceDetailExpandableDescriptionCell *)self moreButton];
    [v40 sizeToFit];

    v41 = [(NTKCFaceDetailExpandableDescriptionCell *)self moreButton];
    [v41 layoutIfNeeded];

    v42 = [(NTKCFaceDetailExpandableDescriptionCell *)self moreButton];
    [v42 frame];
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    double v48 = v47;
    double v50 = v49;

    CGFloat rect = v44;
    v102.origin.x = v44;
    v102.origin.y = v46;
    v102.size.width = v48;
    v102.size.height = v50;
    double Height = CGRectGetHeight(v102);
    v52 = [(NTKCFaceDetailExpandableDescriptionCell *)self moreButton];
    v53 = [v52 titleLabel];
    [v53 frame];
    double rect_24 = Height - CGRectGetMaxY(v103);

    double v54 = v34;
    double v55 = v38;
    double v56 = v14;
    double v57 = v32;
    if (IsRTL)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v54);
    }
    else
    {
      double v94 = v14;
      double v59 = v38;
      double v60 = v34;
      double v61 = v32;
      double MaxX = CGRectGetMaxX(*(CGRect *)&v54);
      v104.origin.x = rect;
      v104.origin.y = v46;
      v104.size.width = v48;
      v104.size.height = v50;
      double MinX = MaxX - CGRectGetWidth(v104);
      double v32 = v61;
      double v34 = v60;
      double v38 = v59;
      double v14 = v94;
    }
    v105.origin.x = v34;
    v105.origin.y = v38;
    v105.size.width = v14;
    v105.size.height = v32;
    double v63 = rect_24 + CGRectGetMaxY(v105) - Height;
    v64 = [(NTKCFaceDetailExpandableDescriptionCell *)self moreButton];
    objc_msgSend(v64, "setFrame:", MinX, v63, v48, v50);

    BOOL expanded = self->_expanded;
    v66 = [(NTKCFaceDetailExpandableDescriptionCell *)self moreButton];
    v69 = v66;
    if (expanded || (v68 = rect_8, double v67 = rect_16, rect_8 <= rect_16))
    {
      objc_msgSend(v66, "setHidden:", 1, v67, v68);
    }
    else
    {
      objc_msgSend(v66, "setHidden:", 0, rect_16, rect_8);

      v70 = [(NTKCFaceDetailDescriptionCell *)self textView];
      v71 = [(NTKCFaceDetailExpandableDescriptionCell *)self moreButton];
      v72 = [v71 titleLabel];
      [v72 frame];
      double v74 = v73;
      double v76 = v75;
      double v77 = v14;
      double v79 = v78;
      double v81 = v80;
      v82 = [(NTKCFaceDetailExpandableDescriptionCell *)self moreButton];
      objc_msgSend(v70, "convertRect:fromView:", v82, v74, v76, v79, v81);
      CGFloat v84 = v83;
      CGFloat v86 = v85;
      CGFloat v88 = v87;
      CGFloat v90 = v89;

      v106.origin.x = v84;
      v106.origin.y = v86;
      v106.size.width = v88;
      double v14 = v77;
      v106.size.height = v90;
      CGRect v107 = CGRectInset(v106, 0.0, 1.0);
      v69 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v107.origin.x, v107.origin.y, v107.size.width, v107.size.height);
      v100[0] = v69;
      v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:1];
      v92 = [(NTKCFaceDetailDescriptionCell *)self textView];
      v93 = [v92 textContainer];
      [v93 setExclusionPaths:v91];
    }
    self->_shouldLayoutText = 0;
    self->_laidOutdouble Width = v14;
  }
}

- (void)_moreTapped
{
  [(NTKCFaceDetailExpandableDescriptionCell *)self setExpanded:1];
  id v3 = [(NTKCFaceDetailExpandableDescriptionCell *)self delegate];
  [v3 descriptionCellDidExpand:self];
}

- (void)_fontSizeDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  [(NTKCFaceDetailDescriptionCell *)&v6 _fontSizeDidChange];
  id v3 = [(NTKCFaceDetailDescriptionCell *)self textView];
  double v4 = [v3 font];
  CGFloat v5 = [(UIButton *)self->_moreButton titleLabel];
  [v5 setFont:v4];

  self->_shouldLayoutText = 1;
  [(NTKCFaceDetailExpandableDescriptionCell *)self setNeedsLayout];
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (NTKCFaceDetailExpandableDescriptionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCFaceDetailExpandableDescriptionCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (double)laidOutWidth
{
  return self->_laidOutWidth;
}

- (void)setLaidOutWidth:(double)a3
{
  self->_laidOutdouble Width = a3;
}

- (BOOL)shouldLayoutText
{
  return self->_shouldLayoutText;
}

- (void)setShouldLayoutText:(BOOL)a3
{
  self->_shouldLayoutText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end