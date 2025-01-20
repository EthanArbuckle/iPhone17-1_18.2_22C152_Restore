@interface SFTabGroupTitleView
- (SFTabGroupTitleView)initWithFrame:(CGRect)a3;
- (WBTabGroup)tabGroup;
- (id)_attributedStringWithImageNamed:(id)a3 textStyle:(id)a4 additionalSymbolicTraits:(unsigned int)a5 color:(id)a6 baselineOffset:(double)a7;
- (void)setTabGroup:(id)a3;
- (void)updateTitle;
@end

@implementation SFTabGroupTitleView

- (SFTabGroupTitleView)initWithFrame:(CGRect)a3
{
  v39[7] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)SFTabGroupTitleView;
  v3 = -[SFTabGroupTitleView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [(UILabel *)v3->_titleLabel setFont:v6];

    [(SFTabGroupTitleView *)v3 addSubview:v3->_titleLabel];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v7;

    [(UILabel *)v3->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [(UILabel *)v3->_subtitleLabel setFont:v9];

    v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_subtitleLabel setTextColor:v10];

    LODWORD(v11) = 1132593152;
    [(UILabel *)v3->_subtitleLabel setContentHuggingPriority:1 forAxis:v11];
    LODWORD(v12) = 1144913920;
    [(UILabel *)v3->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v12];
    [(SFTabGroupTitleView *)v3 addSubview:v3->_subtitleLabel];
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v37 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v36 = [(SFTabGroupTitleView *)v3 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v39[0] = v35;
    v34 = [(UILabel *)v3->_titleLabel widthAnchor];
    v33 = [(SFTabGroupTitleView *)v3 widthAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v39[1] = v32;
    v31 = [(UILabel *)v3->_titleLabel topAnchor];
    v30 = [(SFTabGroupTitleView *)v3 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v39[2] = v29;
    v27 = [(UILabel *)v3->_subtitleLabel topAnchor];
    v26 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v39[3] = v25;
    v24 = [(UILabel *)v3->_subtitleLabel leadingAnchor];
    v13 = [(SFTabGroupTitleView *)v3 leadingAnchor];
    v14 = [v24 constraintEqualToAnchor:v13];
    v39[4] = v14;
    v15 = [(UILabel *)v3->_subtitleLabel widthAnchor];
    v16 = [(SFTabGroupTitleView *)v3 widthAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v39[5] = v17;
    v18 = [(UILabel *)v3->_subtitleLabel bottomAnchor];
    v19 = [(SFTabGroupTitleView *)v3 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v39[6] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:7];
    [v28 activateConstraints:v21];

    v22 = v3;
  }

  return v3;
}

- (void)setTabGroup:(id)a3
{
  v5 = (WBTabGroup *)a3;
  if (self->_tabGroup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tabGroup, a3);
    [(SFTabGroupTitleView *)self updateTitle];
    v5 = v6;
  }
}

- (void)updateTitle
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EDA07C28];
  if ([(WBTabGroup *)self->_tabGroup isShared])
  {
    v4 = [(SFTabGroupTitleView *)self _attributedStringWithImageNamed:@"person.2.fill" textStyle:*MEMORY[0x1E4FB2950] additionalSymbolicTraits:0 color:0 baselineOffset:0.0];
    [v3 appendAttributedString:v4];

    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v3 appendAttributedString:v5];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  v7 = NSString;
  v8 = [(WBTabGroup *)self->_tabGroup displayTitle];
  v9 = [v7 stringWithFormat:@"%@ ", v8];
  v10 = (void *)[v6 initWithString:v9];
  [v3 appendAttributedString:v10];

  uint64_t v11 = *MEMORY[0x1E4FB28D8];
  double v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v13 = [(SFTabGroupTitleView *)self _attributedStringWithImageNamed:@"chevron.forward" textStyle:v11 additionalSymbolicTraits:2 color:v12 baselineOffset:0.5];
  [v3 appendAttributedString:v13];

  [(UILabel *)self->_titleLabel setAttributedText:v3];
  if ([0 length])
  {
    v14 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v11];
    v15 = (void *)MEMORY[0x1E4FB08E0];
    v16 = objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v14, "symbolicTraits") | 2);
    [v14 pointSize];
    v17 = objc_msgSend(v15, "fontWithDescriptor:size:", v16);

    id v18 = objc_alloc(MEMORY[0x1E4F28E48]);
    v19 = _WBSLocalizedString();
    v20 = (void *)[v18 initWithString:v19];

    uint64_t v21 = *MEMORY[0x1E4FB06F8];
    v35[0] = v17;
    uint64_t v22 = *MEMORY[0x1E4FB0700];
    v34[0] = v21;
    v34[1] = v22;
    v23 = [MEMORY[0x1E4FB1618] labelColor];
    v35[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v25 = [v20 string];
    uint64_t v26 = [v25 rangeOfString:@"%@"];
    objc_msgSend(v20, "setAttributes:range:", v24, v26, v27);

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E48]), "initWithFormat:options:locale:", v20, 0, 0, 0);
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v28 appendAttributedString:v29];

    v30 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
    v31 = (void *)MEMORY[0x1E4F28B18];
    v32 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v30];
    v33 = [v31 attributedStringWithAttachment:v32];

    [v28 appendAttributedString:v33];
    [(UILabel *)self->_subtitleLabel setAttributedText:v28];
  }
  else
  {
    [(UILabel *)self->_subtitleLabel setText:&stru_1EDA07C28];
  }
}

- (id)_attributedStringWithImageNamed:(id)a3 textStyle:(id)a4 additionalSymbolicTraits:(unsigned int)a5 color:(id)a6 baselineOffset:(double)a7
{
  id v11 = a6;
  double v12 = (void *)MEMORY[0x1E4FB1818];
  id v13 = a4;
  v14 = [v12 systemImageNamed:a3];
  v15 = (void *)MEMORY[0x1E4F28B18];
  v16 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v14];
  v17 = [v15 attributedStringWithAttachment:v16];
  id v18 = (void *)[v17 mutableCopy];

  v19 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v13];

  v20 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v21 = objc_msgSend(v19, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v19, "symbolicTraits") | a5);
  [v19 pointSize];
  uint64_t v22 = objc_msgSend(v20, "fontWithDescriptor:size:", v21);

  objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v22, 0, 1);
  if (v11) {
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v11, 0, 1);
  }
  if (a7 != 0.0)
  {
    uint64_t v23 = *MEMORY[0x1E4FB06C8];
    v24 = [NSNumber numberWithDouble:a7];
    objc_msgSend(v18, "addAttribute:value:range:", v23, v24, 0, 1);
  }

  return v18;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end