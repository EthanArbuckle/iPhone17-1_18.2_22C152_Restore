@interface NTKCDetailTableViewCell
+ (id)reuseIdentifier;
+ (id)titleFont;
- (BOOL)_visibleAtPoint:(CGPoint)a3;
- (BOOL)ignoresRTLCorrection;
- (BOOL)showsSeparator;
- (NTKCDetailTableViewCell)init;
- (NTKCDetailTableViewCell)initWithStyle:(int64_t)a3;
- (NTKCDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)separatorView;
- (double)rowHeight;
- (id)_fontForTextLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_fontSizeDidChange;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIgnoresRTLCorrection:(BOOL)a3;
- (void)setSeparatorView:(id)a3;
- (void)setShowsSeparator:(BOOL)a3;
@end

@implementation NTKCDetailTableViewCell

+ (id)reuseIdentifier
{
  return 0;
}

- (double)rowHeight
{
  return 0.0;
}

+ (id)titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:19.0 weight:*MEMORY[0x1E4FB09D0]];
}

- (NTKCDetailTableViewCell)init
{
  return [(NTKCDetailTableViewCell *)self initWithStyle:0];
}

- (NTKCDetailTableViewCell)initWithStyle:(int64_t)a3
{
  return [(NTKCDetailTableViewCell *)self initWithStyle:a3 reuseIdentifier:0];
}

- (NTKCDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)NTKCDetailTableViewCell;
  v4 = [(NTKCDetailTableViewCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = BPSBackgroundColor();
    [(NTKCDetailTableViewCell *)v4 setBackgroundColor:v5];

    v6 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
    [(NTKCDetailTableViewCell *)v4 setSelectionTintColor:v6];

    [(NTKCDetailTableViewCell *)v4 setSelectionStyle:0];
    v7 = [(id)objc_opt_class() defaultTextColor];
    v8 = [(NTKCDetailTableViewCell *)v4 textLabel];
    [v8 setTextColor:v7];

    if (CLKLayoutIsRTL()) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
    v10 = [(NTKCDetailTableViewCell *)v4 detailTextLabel];
    [v10 setTextAlignment:v9];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v4 selector:sel__fontSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    [(NTKCDetailTableViewCell *)v4 _fontSizeDidChange];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKCDetailTableViewCell;
  [(NTKCDetailTableViewCell *)&v4 dealloc];
}

- (void)setShowsSeparator:(BOOL)a3
{
  if (self->_showsSeparator != a3)
  {
    self->_showsSeparator = a3;
    separatorView = self->_separatorView;
    if (a3)
    {
      if (!separatorView)
      {
        v5 = objc_opt_new();
        [(NTKCDetailTableViewCell *)self setSeparatorView:v5];

        [(NTKCDetailTableViewCell *)self addSubview:self->_separatorView];
        separatorView = self->_separatorView;
      }
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 1;
    }
    [(UIView *)separatorView setHidden:v6];
  }
}

- (void)layoutSubviews
{
  v85.receiver = self;
  v85.super_class = (Class)NTKCDetailTableViewCell;
  [(NTKCDetailTableViewCell *)&v85 layoutSubviews];
  v3 = [(NTKCDetailTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = NTKCScreenEdgeMargin();
  objc_super v13 = [(NTKCDetailTableViewCell *)self textLabel];
  v14 = [v13 font];
  [v14 _scaledValueForValue:28.0];
  double v16 = v15;

  int IsRTL = CLKLayoutIsRTL();
  v18 = [(NTKCDetailTableViewCell *)self textLabel];
  v19 = [v18 text];
  if (![v19 length])
  {

LABEL_17:
    goto LABEL_18;
  }
  CGFloat v83 = v11;
  CGFloat rect = v9;
  BOOL ignoresRTLCorrection = self->_ignoresRTLCorrection;

  if (!ignoresRTLCorrection)
  {
    CGFloat v82 = v5;
    v21 = [(NTKCDetailTableViewCell *)self textLabel];
    [v21 frame];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    double v27 = v26;
    double v29 = v28;

    double v30 = v12;
    if (IsRTL)
    {
      v86.origin.x = v82;
      v86.size.height = v83;
      v86.origin.y = v7;
      v86.size.width = rect;
      double Width = CGRectGetWidth(v86);
      v87.origin.x = v23;
      v87.origin.y = v25;
      v87.size.width = v27;
      v87.size.height = v29;
      double v30 = Width - CGRectGetWidth(v87) - v12;
    }
    v32 = [(NTKCDetailTableViewCell *)self textLabel];
    [v32 _lastLineBaseline];
    double v34 = v16 - v33;

    v88.origin.x = v30;
    v88.origin.y = v34;
    v88.size.width = v27;
    v88.size.height = v29;
    if (CGRectGetMinY(v88) < 0.0) {
      double v34 = 0.0;
    }
    v35 = [(NTKCDetailTableViewCell *)self textLabel];
    objc_msgSend(v35, "setFrame:", v30, v34, v27, v29);

    v36 = [(NTKCDetailTableViewCell *)self detailTextLabel];
    v37 = [v36 text];
    uint64_t v38 = [v37 length];

    if (v38)
    {
      v89.origin.x = v82;
      v89.origin.y = v7;
      v89.size.height = v83;
      v89.size.width = rect;
      CGFloat v39 = CGRectGetWidth(v89) + v12 * -2.0;
      v90.origin.x = v30;
      v90.origin.y = v34;
      v90.size.width = v27;
      v90.size.height = v29;
      double v40 = v39 - CGRectGetWidth(v90) + -16.0;
      v41 = [(NTKCDetailTableViewCell *)self detailTextLabel];
      [v41 frame];
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      double v47 = v46;

      v48 = [(NTKCDetailTableViewCell *)self detailTextLabel];
      [v48 _lastLineBaseline];
      double v50 = v16 - v49;

      v91.origin.x = v43;
      v91.origin.y = v50;
      v91.size.width = v45;
      v91.size.height = v47;
      double v51 = CGRectGetWidth(v91);
      double v52 = 0.0;
      if (v40 >= 0.0) {
        double v52 = v40;
      }
      if (v51 <= v40) {
        double v53 = v45;
      }
      else {
        double v53 = v52;
      }
      if ((IsRTL & 1) == 0)
      {
        v92.origin.x = v82;
        v92.size.height = v83;
        v92.origin.y = v7;
        v92.size.width = rect;
        CGFloat v54 = CGRectGetWidth(v92) - v12;
        v93.origin.x = v43;
        v93.origin.y = v50;
        v93.size.width = v53;
        v93.size.height = v47;
        double v12 = v54 - CGRectGetWidth(v93);
      }
      v18 = [(NTKCDetailTableViewCell *)self detailTextLabel];
      objc_msgSend(v18, "setFrame:", v12, v50, v53, v47);
      goto LABEL_17;
    }
  }
LABEL_18:
  [(NTKCDetailTableViewCell *)self bringSubviewToFront:self->_separatorView];
  [(UIView *)self->_separatorView frame];
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  double v60 = v59;
  [(NTKCDetailTableViewCell *)self bounds];
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  [(NTKCDetailTableViewCell *)self separatorInset];
  CGFloat v70 = v64 + v69;
  CGFloat v73 = v66 - (v71 + v72);
  v94.size.height = v68 - (v69 + v74);
  v94.origin.x = v62 + v71;
  v94.origin.y = v70;
  v94.size.width = v73;
  double v75 = CGRectGetWidth(v94);
  if (IsRTL)
  {
    [(NTKCDetailTableViewCell *)self bounds];
    double v76 = CGRectGetWidth(v95);
    v96.origin.x = v56;
    v96.origin.y = v58;
    v96.size.width = v75;
    v96.size.height = v60;
    double v77 = v76 - CGRectGetWidth(v96);
    [(NTKCDetailTableViewCell *)self separatorInset];
    double v79 = v77 - v78;
  }
  else
  {
    [(NTKCDetailTableViewCell *)self separatorInset];
    double v79 = v80;
  }
  [(NTKCDetailTableViewCell *)self bounds];
  double Height = CGRectGetHeight(v97);
  v98.origin.x = v79;
  v98.origin.y = v58;
  v98.size.width = v75;
  v98.size.height = v60;
  -[UIView setFrame:](self->_separatorView, "setFrame:", v79, Height - CGRectGetHeight(v98), v75, v60);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NTKCDetailTableViewCell;
  [(NTKCDetailTableViewCell *)&v16 setHighlighted:a3 animated:a4];
  if ([(NTKCDetailTableViewCell *)self selectionStyle])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = [(NTKCDetailTableViewCell *)self subviews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            objc_msgSend(v11, "setSelected:", -[NTKCDetailTableViewCell isHighlighted](self, "isHighlighted"));
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)NTKCDetailTableViewCell;
  uint64_t v7 = -[NTKCDetailTableViewCell hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  if (v7 && -[NTKCDetailTableViewCell _visibleAtPoint:](self, "_visibleAtPoint:", x, y)) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_visibleAtPoint:(CGPoint)a3
{
  double v4 = [(NTKCDetailTableViewCell *)self _tableView];
  double v5 = [v4 indexPathForCell:self];
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v4 contentInset];
  double v15 = v7 + v14;
  double v17 = v9 + v16;
  double v19 = v11 - (v14 + v18);
  double v21 = v13 - (v16 + v20);
  double v22 = objc_msgSend(v4, "headerViewForSection:", objc_msgSend(v5, "section"));
  [v22 frame];
  v42.origin.CGFloat x = v23;
  v42.origin.CGFloat y = v24;
  v42.size.CGFloat width = v25;
  v42.size.CGFloat height = v26;
  v38.origin.CGFloat x = v15;
  v38.origin.CGFloat y = v17;
  v38.size.CGFloat width = v19;
  v38.size.CGFloat height = v21;
  CGRect v39 = CGRectIntersection(v38, v42);
  CGFloat x = v39.origin.x;
  CGFloat y = v39.origin.y;
  CGFloat width = v39.size.width;
  CGFloat height = v39.size.height;
  if (!CGRectIsNull(v39))
  {
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    CGFloat v31 = CGRectGetHeight(v40);
    double v17 = v17 + v31;
    double v21 = v21 - v31;
  }
  -[NTKCDetailTableViewCell convertPoint:toView:](self, "convertPoint:toView:", v4, a3.x, a3.y);
  v37.CGFloat x = v32;
  v37.CGFloat y = v33;
  v41.origin.CGFloat x = v15;
  v41.origin.CGFloat y = v17;
  v41.size.CGFloat width = v19;
  v41.size.CGFloat height = v21;
  BOOL v34 = CGRectContainsPoint(v41, v37);

  return v34;
}

- (id)_fontForTextLabel
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

- (void)_fontSizeDidChange
{
  v3 = [(NTKCDetailTableViewCell *)self _fontForTextLabel];
  double v4 = [(NTKCDetailTableViewCell *)self textLabel];
  [v4 setFont:v3];

  double v5 = [(NTKCDetailTableViewCell *)self _fontForDetailTextLabel];
  double v6 = [(NTKCDetailTableViewCell *)self detailTextLabel];
  [v6 setFont:v5];

  [(NTKCDetailTableViewCell *)self setNeedsLayout];
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (BOOL)ignoresRTLCorrection
{
  return self->_ignoresRTLCorrection;
}

- (void)setIgnoresRTLCorrection:(BOOL)a3
{
  self->_BOOL ignoresRTLCorrection = a3;
}

- (void).cxx_destruct
{
}

@end