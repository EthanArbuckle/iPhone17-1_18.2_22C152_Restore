@interface UIActivityActionCell
- (BOOL)isDisabled;
- (UIActivityActionCell)initWithFrame:(CGRect)a3;
- (UIView)fillView;
- (UIVisualEffectView)effectView;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setEffectView:(id)a3;
- (void)setFillView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIActivityActionCell

- (UIActivityActionCell)initWithFrame:(CGRect)a3
{
  v55.receiver = self;
  v55.super_class = (Class)UIActivityActionCell;
  v3 = -[UIActivityActionCell initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (!v3) {
    return v4;
  }
  [(UIActivityActionCell *)v3 setDisabled:0];
  v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  if (![v5 userInterfaceIdiom])
  {

    goto LABEL_6;
  }
  v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 1)
  {
LABEL_6:
    v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:18];
    v9 = [MEMORY[0x1E4FB1EA0] _effectForBlurEffect:v8 vibrancyStyle:112];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v9];
    v11 = [MEMORY[0x1E4FB1618] whiteColor];
    v12 = [v10 contentView];
    [v12 setBackgroundColor:v11];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setClipsToBounds:1];
    [(UIActivityActionCell *)v4 setEffectView:v10];

    id v13 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v14 = [MEMORY[0x1E4FB1618] blackColor];
    [v13 setBackgroundColor:v14];

    v15 = [(UIActivityActionCell *)v4 traitCollection];
    uint64_t v16 = [v15 userInterfaceStyle];
    double v17 = 0.27;
    if (v16 != 2) {
      double v17 = 0.0;
    }
    [v13 setAlpha:v17];

    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setClipsToBounds:1];
    [(UIActivityActionCell *)v4 setFillView:v13];
  }
  v18 = [(UIActivityActionCell *)v4 contentView];
  [v18 setClipsToBounds:1];
  v19 = [MEMORY[0x1E4F1CA48] array];
  if (v4->_fillView)
  {
    v20 = [(UIActivityActionCell *)v4 fillView];
    [v18 addSubview:v20];

    v21 = [(UIActivityActionCell *)v4 fillView];
    v22 = [v21 widthAnchor];
    v23 = [v18 widthAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v19 addObject:v24];

    v25 = [(UIActivityActionCell *)v4 fillView];
    v26 = [v25 heightAnchor];
    v27 = [v18 heightAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    [v19 addObject:v28];

    v29 = [(UIActivityActionCell *)v4 fillView];
    v30 = [v29 centerXAnchor];
    v31 = [v18 centerXAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v19 addObject:v32];

    v33 = [(UIActivityActionCell *)v4 fillView];
    v34 = [v33 centerYAnchor];
    v35 = [v18 centerYAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    [v19 addObject:v36];
  }
  if (v4->_effectView)
  {
    v37 = [(UIActivityActionCell *)v4 effectView];
    [v18 addSubview:v37];

    v38 = [(UIActivityActionCell *)v4 effectView];
    v39 = [v38 widthAnchor];
    v40 = [v18 widthAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v19 addObject:v41];

    v42 = [(UIActivityActionCell *)v4 effectView];
    v43 = [v42 heightAnchor];
    v44 = [v18 heightAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v19 addObject:v45];

    v46 = [(UIActivityActionCell *)v4 effectView];
    v47 = [v46 centerXAnchor];
    v48 = [v18 centerXAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    [v19 addObject:v49];

    v50 = [(UIActivityActionCell *)v4 effectView];
    v51 = [v50 centerYAnchor];
    v52 = [v18 centerYAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    [v19 addObject:v53];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v19];

  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UIActivityActionCell;
  [(UIActivityActionCell *)&v3 prepareForReuse];
  [(UIActivityActionCell *)self setDisabled:0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIActivityActionCell;
  -[UIActivityActionCell setHighlighted:](&v13, sel_setHighlighted_);
  if (v3)
  {
    v5 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
    v6 = [v5 colorWithAlphaComponent:0.6];
    uint64_t v7 = [(UIActivityActionCell *)self fillView];
    [v7 setBackgroundColor:v6];

    v8 = [(UIActivityActionCell *)self fillView];
    [v8 setAlpha:1.0];
  }
  else
  {
    v9 = [MEMORY[0x1E4FB1618] blackColor];
    v10 = [(UIActivityActionCell *)self fillView];
    [v10 setBackgroundColor:v9];

    v8 = [(UIActivityActionCell *)self traitCollection];
    if ([v8 userInterfaceStyle] == 2) {
      double v11 = 0.27;
    }
    else {
      double v11 = 0.0;
    }
    v12 = [(UIActivityActionCell *)self fillView];
    [v12 setAlpha:v11];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIActivityActionCell;
  [(UIActivityActionCell *)&v7 traitCollectionDidChange:a3];
  v4 = [(UIActivityActionCell *)self traitCollection];
  if ([v4 userInterfaceStyle] == 2) {
    double v5 = 0.27;
  }
  else {
    double v5 = 0.0;
  }
  v6 = [(UIActivityActionCell *)self fillView];
  [v6 setAlpha:v5];
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIView)fillView
{
  return self->_fillView;
}

- (void)setFillView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end