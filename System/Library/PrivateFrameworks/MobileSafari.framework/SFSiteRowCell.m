@interface SFSiteRowCell
+ (NSString)reuseIdentifier;
+ (double)leadingSpace;
- (NSString)title;
- (SFSiteRowCell)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFSiteRowCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"SiteRow";
}

+ (double)leadingSpace
{
  return 12.0;
}

- (SFSiteRowCell)initWithFrame:(CGRect)a3
{
  v31[5] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)SFSiteRowCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SFSiteRowCell *)v3 contentView];
    v29 = [(SFStartPageFilledBackgroundCell *)v4 defaultBackgroundConfiguration];
    [v29 setCornerRadius:10.0];
    [(SFSiteRowCell *)v4 setBackgroundConfiguration:v29];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v4->_label;
    v4->_label = v6;

    [(UILabel *)v4->_label setAdjustsFontForContentSizeCategory:1];
    v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2950], 0x8000);
    [(UILabel *)v4->_label setFont:v8];

    [(UILabel *)v4->_label setNumberOfLines:1];
    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4->_label];
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(UILabel *)v4->_label centerXAnchor];
    v27 = [v5 centerXAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v31[0] = v26;
    v25 = [(UILabel *)v4->_label leadingAnchor];
    v24 = [v5 leadingAnchor];
    +[SFSiteRowCell leadingSpace];
    v23 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24);
    v31[1] = v23;
    v21 = [(UILabel *)v4->_label centerYAnchor];
    v20 = [v5 centerYAnchor];
    v9 = [v21 constraintEqualToAnchor:v20];
    v31[2] = v9;
    v10 = [(UILabel *)v4->_label topAnchor];
    v11 = [v5 topAnchor];
    v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11 constant:10.0];
    v31[3] = v12;
    v13 = [v5 heightAnchor];
    v14 = [v13 constraintEqualToConstant:40.0];
    LODWORD(v15) = 1132068864;
    v16 = objc_msgSend(v14, "sf_withPriority:", v15);
    v31[4] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:5];
    [v22 activateConstraints:v17];

    v18 = v4;
  }

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SFSiteRowCell *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)SFSiteRowCell;
  [(SFSiteRowCell *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    v6 = [(SFStartPageFilledBackgroundCell *)self backgroundEffectView];
    v7 = [(SFSiteRowCell *)self configurationState];
    objc_msgSend(v6, "sf_setHighlighted:cellState:", v3, v7);
  }
}

- (NSString)title
{
  return [(UILabel *)self->_label text];
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end