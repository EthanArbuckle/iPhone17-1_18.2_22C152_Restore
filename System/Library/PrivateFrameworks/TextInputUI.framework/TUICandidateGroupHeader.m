@interface TUICandidateGroupHeader
+ (id)reuseIdentifier;
- (CGRect)virtualLabelContainerFrame;
- (CGRect)visibleBounds;
- (NSString)text;
- (TUICandidateGroupHeader)initWithCoder:(id)a3;
- (TUICandidateGroupHeader)initWithFrame:(CGRect)a3;
- (TUICandidateViewStyle)style;
- (UILabel)textLabel;
- (double)rowHeight;
- (int64_t)alignment;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setAlignment:(int64_t)a3;
- (void)setRowHeight:(double)a3;
- (void)setStyle:(id)a3;
- (void)setText:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setVirtualLabelContainerFrame:(CGRect)a3;
- (void)setVisibleBounds:(CGRect)a3;
- (void)updateGroupHeaderLabelPosition;
@end

@implementation TUICandidateGroupHeader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (CGRect)virtualLabelContainerFrame
{
  double x = self->_virtualLabelContainerFrame.origin.x;
  double y = self->_virtualLabelContainerFrame.origin.y;
  double width = self->_virtualLabelContainerFrame.size.width;
  double height = self->_virtualLabelContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (NSString)text
{
  return self->_text;
}

- (void)setVirtualLabelContainerFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_virtualLabelContainerFrame = a3;
  id v21 = [(TUICandidateGroupHeader *)self style];
  [v21 extraCellPadding];
  double v9 = x + v8;
  double v11 = y + v10;
  double v13 = width - (v8 + v12);
  double v15 = height - (v10 + v14);
  if (objc_opt_respondsToSelector())
  {
    [v21 groupHeaderPadding];
    double v9 = v9 + v16;
    double v11 = v11 + v17;
    double v13 = v13 - (v16 + v18);
    double v15 = v15 - (v17 + v19);
  }
  v20 = [(TUICandidateGroupHeader *)self textLabel];
  objc_msgSend(v20, "setFrame:", v9, v11, v13, v15);
}

- (void)updateGroupHeaderLabelPosition
{
  [(TUICandidateGroupHeader *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TUICandidateGroupHeader *)self visibleBounds];
  v34.origin.double x = v11;
  v34.origin.double y = v12;
  v34.size.double width = v13;
  v34.size.double height = v14;
  [(TUICandidateGroupHeader *)self virtualLabelContainerFrame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(TUICandidateGroupHeader *)self style];
  uint64_t v24 = [v23 layoutOrientation];

  [(TUICandidateGroupHeader *)self rowHeight];
  if (v24 == 1)
  {
    double v16 = (v25 - v20) * 0.5;
    v36.origin.double x = v4;
    v36.origin.double y = v6;
    v36.size.double width = v8;
    v36.size.double height = v10;
    double v26 = CGRectGetMaxX(v36) - v16 - v20;
    if (CGRectIsEmpty(v34)) {
      goto LABEL_5;
    }
    v37.origin.double x = v26;
    v37.origin.double y = v18;
    v37.size.double width = v20;
    v37.size.double height = v22;
    double MinX = CGRectGetMinX(v37);
    CGFloat v28 = CGRectGetMaxX(v34) - v16;
    v38.origin.double x = v26;
    v38.origin.double y = v18;
    v38.size.double width = v20;
    v38.size.double height = v22;
    if (v28 - CGRectGetWidth(v38) >= MinX) {
      goto LABEL_5;
    }
    CGFloat v29 = CGRectGetMaxX(v34) - v16;
    v39.origin.double x = v26;
    v39.origin.double y = v18;
    v39.size.double width = v20;
    v39.size.double height = v22;
    double v26 = v29 - CGRectGetWidth(v39);
    v40.origin.double x = v26;
    v40.origin.double y = v18;
    v40.size.double width = v20;
    v40.size.double height = v22;
    if (CGRectGetMinX(v40) >= v16) {
LABEL_5:
    }
      double v16 = v26;
  }
  else
  {
    double v18 = (v25 - v22) * 0.5;
    if (!CGRectIsEmpty(v34))
    {
      v41.origin.double x = v16;
      v41.origin.double y = v18;
      v41.size.double width = v20;
      v41.size.double height = v22;
      double MinY = CGRectGetMinY(v41);
      v42.origin.double x = v4;
      v42.origin.double y = v6;
      v42.size.double width = v8;
      v42.size.double height = v10;
      double MaxY = CGRectGetMaxY(v42);
      v43.origin.double x = v4;
      v43.origin.double y = v6;
      v43.size.double width = v8;
      v43.size.double height = v10;
      double v30 = CGRectGetMinY(v43);
      if (v18 + CGRectGetMinY(v34) > MinY)
      {
        double v31 = MaxY - (MinY - v30);
        double v18 = v18 + CGRectGetMinY(v34);
        v44.origin.double x = v16;
        v44.origin.double y = v18;
        v44.size.double width = v20;
        v44.size.double height = v22;
        if (CGRectGetMaxY(v44) > v31)
        {
          v45.origin.double x = v16;
          v45.origin.double y = v18;
          v45.size.double width = v20;
          v45.size.double height = v22;
          double v18 = v31 - CGRectGetHeight(v45);
        }
      }
    }
  }
  [(TUICandidateGroupHeader *)self virtualLabelContainerFrame];
  v47.origin.double x = v16;
  v47.origin.double y = v18;
  v47.size.double width = v20;
  v47.size.double height = v22;
  if (!CGRectEqualToRect(v46, v47))
  {
    -[TUICandidateGroupHeader setVirtualLabelContainerFrame:](self, "setVirtualLabelContainerFrame:", v16, v18, v20, v22);
  }
}

- (void)setVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_visibleBounds = &self->_visibleBounds;
  if (!CGRectEqualToRect(self->_visibleBounds, a3))
  {
    p_visibleBounds->origin.CGFloat x = x;
    p_visibleBounds->origin.CGFloat y = y;
    p_visibleBounds->size.CGFloat width = width;
    p_visibleBounds->size.CGFloat height = height;
    [(TUICandidateGroupHeader *)self updateGroupHeaderLabelPosition];
  }
}

- (void)setStyle:(id)a3
{
  id v13 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    [v13 rowHeight];
    self->_rowHeight = v5;
    CGFloat v6 = [v13 candidateFont];
    double v7 = [(TUICandidateGroupHeader *)self textLabel];
    [v7 setFont:v6];

    CGFloat v8 = [v13 textColor];
    double v9 = [(TUICandidateGroupHeader *)self textLabel];
    [v9 setTextColor:v8];

    CGFloat v10 = [v13 groupHeaderBackgroundColor];
    [(TUICandidateGroupHeader *)self setBackgroundColor:v10];

    BOOL v11 = [v13 layoutOrientation] == 1;
    CGFloat v12 = [(TUICandidateGroupHeader *)self textLabel];
    [v12 setTextAlignment:v11];
  }
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    id v4 = [(TUICandidateGroupHeader *)self textLabel];
    [v4 setTextAlignment:a3];
  }
}

- (void)setText:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    id v4 = (NSString *)[v8 copy];
    text = self->_text;
    self->_text = v4;

    CGFloat v6 = self->_text;
    double v7 = [(TUICandidateGroupHeader *)self textLabel];
    [v7 setText:v6];
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)TUICandidateGroupHeader;
  [(TUICandidateGroupHeader *)&v26 layoutSubviews];
  [(TUICandidateGroupHeader *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  BOOL v11 = [(TUICandidateGroupHeader *)self style];
  uint64_t v12 = [v11 layoutOrientation];

  uint64_t v13 = v4;
  uint64_t v14 = v6;
  uint64_t v15 = v8;
  uint64_t v16 = v10;
  if (v12 == 1)
  {
    CGRect v27 = CGRectInset(*(CGRect *)&v13, 0.0, 10.0);
    CGFloat x = v27.origin.x;
    double y = v27.origin.y;
    double height = v27.size.height;
    [(TUICandidateGroupHeader *)self rowHeight];
    double v21 = v20;
    [(TUICandidateGroupHeader *)self bounds];
    double Width = CGRectGetWidth(v28);
    v29.origin.CGFloat x = x;
    v29.origin.double y = y;
    v29.size.CGFloat width = v21;
    v29.size.double height = height;
    double v23 = Width - CGRectGetMinX(v29);
    v30.origin.CGFloat x = x;
    v30.origin.double y = y;
    v30.size.CGFloat width = v21;
    v30.size.double height = height;
    double v24 = v23 - CGRectGetWidth(v30);
  }
  else
  {
    CGRect v31 = CGRectInset(*(CGRect *)&v13, 10.0, 0.0);
    double v24 = v31.origin.x;
    double y = v31.origin.y;
    double v21 = v31.size.width;
    [(TUICandidateGroupHeader *)self rowHeight];
    double height = v25;
  }
  -[TUICandidateGroupHeader setVirtualLabelContainerFrame:](self, "setVirtualLabelContainerFrame:", v24, y, v21, height);
}

- (TUICandidateGroupHeader)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateGroupHeader;
  uint64_t v3 = [(TUICandidateGroupHeader *)&v6 initWithCoder:a3];
  uint64_t v4 = v3;
  if (v3) {
    [(TUICandidateGroupHeader *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateGroupHeader)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateGroupHeader;
  uint64_t v3 = -[TUICandidateGroupHeader initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3) {
    [(TUICandidateGroupHeader *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  self->_alignment = 0;
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  [(TUICandidateGroupHeader *)self bounds];
  uint64_t v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
  textLabel = self->_textLabel;
  self->_textLabel = v4;

  [(UILabel *)self->_textLabel setLineBreakMode:4];
  [(UILabel *)self->_textLabel setBaselineAdjustment:1];
  [(UILabel *)self->_textLabel setTextAlignment:0];
  self->_rowHeight = 41.0;
  objc_super v6 = self->_textLabel;
  [(TUICandidateGroupHeader *)self addSubview:v6];
}

+ (id)reuseIdentifier
{
  return @"TUICandidateGroupHeader";
}

@end