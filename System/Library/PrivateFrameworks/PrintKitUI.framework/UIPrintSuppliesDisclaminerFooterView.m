@interface UIPrintSuppliesDisclaminerFooterView
- (NSURL)suppliesInfoURL;
- (UILabel)disclaimerLabel;
- (UIPrintSuppliesDisclaminerFooterView)initWithReuseIdentifier:(id)a3;
- (_NSRange)suppliesInfoLinkRange;
- (id)messageText;
- (void)handleTapOnLabel:(id)a3;
- (void)prepareForReuse;
- (void)setDisclaimerLabel:(id)a3;
- (void)setSuppliesInfoLinkRange:(_NSRange)a3;
- (void)setSuppliesInfoURL:(id)a3;
- (void)updateDisclaimerTextWithInfoURL:(id)a3 tintColor:(id)a4;
@end

@implementation UIPrintSuppliesDisclaminerFooterView

- (UIPrintSuppliesDisclaminerFooterView)initWithReuseIdentifier:(id)a3
{
  v48[4] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)UIPrintSuppliesDisclaminerFooterView;
  v3 = [(UIPrintSuppliesDisclaminerFooterView *)&v46 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(UIPrintSuppliesDisclaminerFooterView *)v3 contentView];
    [v5 addSubview:v4];

    v42 = [(UIPrintSuppliesDisclaminerFooterView *)v3 contentView];
    v6 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [(UIPrintSuppliesDisclaminerFooterView *)v3 contentView];
    v43 = [v6 constraintWithItem:v4 attribute:5 relatedBy:0 toItem:v44 attribute:5 multiplier:1.0 constant:0.0];
    v48[0] = v43;
    v7 = (void *)MEMORY[0x1E4F28DC8];
    v8 = [(UIPrintSuppliesDisclaminerFooterView *)v3 contentView];
    v9 = [v7 constraintWithItem:v4 attribute:6 relatedBy:0 toItem:v8 attribute:6 multiplier:1.0 constant:0.0];
    v48[1] = v9;
    v10 = (void *)MEMORY[0x1E4F28DC8];
    v11 = [(UIPrintSuppliesDisclaminerFooterView *)v3 contentView];
    v12 = [v10 constraintWithItem:v4 attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:0.0];
    v48[2] = v12;
    v13 = (void *)MEMORY[0x1E4F28DC8];
    v14 = [(UIPrintSuppliesDisclaminerFooterView *)v3 contentView];
    v15 = [v13 constraintWithItem:v4 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:0.0];
    v48[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    [v42 addConstraints:v16];

    id v17 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UIPrintSuppliesDisclaminerFooterView *)v3 setDisclaimerLabel:v17];

    v18 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    v19 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v19 setFont:v18];

    v20 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v20 setNumberOfLines:0];

    v21 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v21 setTextAlignment:4];

    v22 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v22 setLineBreakMode:0];

    v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v24 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v24 setTextColor:v23];

    v25 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v25 setBackgroundColor:0];

    v26 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v26 setOpaque:0];

    v27 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

    v28 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    [v4 addSubview:v28];

    v29 = (void *)MEMORY[0x1E4F28DC8];
    v45 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    v30 = [v29 constraintWithItem:v45 attribute:5 relatedBy:0 toItem:v4 attribute:17 multiplier:1.0 constant:0.0];
    v47[0] = v30;
    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    v33 = [v31 constraintWithItem:v32 attribute:3 relatedBy:0 toItem:v4 attribute:15 multiplier:1.0 constant:0.0];
    v47[1] = v33;
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    v36 = [v34 constraintWithItem:v35 attribute:4 relatedBy:0 toItem:v4 attribute:16 multiplier:1.0 constant:0.0];
    v47[2] = v36;
    v37 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [(UIPrintSuppliesDisclaminerFooterView *)v3 disclaimerLabel];
    v39 = [v37 constraintWithItem:v38 attribute:6 relatedBy:0 toItem:v4 attribute:6 multiplier:1.0 constant:0.0];
    v47[3] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    [v4 addConstraints:v40];
  }
  return v3;
}

- (id)messageText
{
  v2 = [(UIPrintSuppliesDisclaminerFooterView *)self disclaimerLabel];
  v3 = [v2 text];

  return v3;
}

- (void)updateDisclaimerTextWithInfoURL:(id)a3 tintColor:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(UIPrintSuppliesDisclaminerFooterView *)self setSuppliesInfoURL:a3];
  id v7 = objc_alloc(MEMORY[0x1E4F28E48]);
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Supply levels shown are approximate." value:@"Supply levels shown are approximate." table:@"Localizable"];
  v10 = (void *)[v7 initWithString:v9];

  if (a3)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
    v12 = NSString;
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"More Info" value:@"More Info" table:@"Localizable"];
    v15 = [v12 stringWithFormat:@" %@", v14];
    uint64_t v22 = *MEMORY[0x1E4FB12B8];
    v23[0] = v6;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v17 = (void *)[v11 initWithString:v15 attributes:v16];

    -[UIPrintSuppliesDisclaminerFooterView setSuppliesInfoLinkRange:](self, "setSuppliesInfoLinkRange:", [v10 length], objc_msgSend(v17, "length"));
    [v10 appendAttributedString:v17];
    v18 = [(UIPrintSuppliesDisclaminerFooterView *)self disclaimerLabel];
    [v18 setUserInteractionEnabled:1];

    v19 = [(UIPrintSuppliesDisclaminerFooterView *)self disclaimerLabel];
    v20 = [[UIPrintLabelTappableLinkGestureRecognizer alloc] initWithTarget:self action:sel_handleTapOnLabel_];
    [v19 addGestureRecognizer:v20];
  }
  v21 = [(UIPrintSuppliesDisclaminerFooterView *)self disclaimerLabel];
  [v21 setAttributedText:v10];
}

- (void)prepareForReuse
{
  v3 = [(UIPrintSuppliesDisclaminerFooterView *)self disclaimerLabel];
  [v3 setAttributedText:0];

  [(UIPrintSuppliesDisclaminerFooterView *)self setSuppliesInfoURL:0];
  v4.receiver = self;
  v4.super_class = (Class)UIPrintSuppliesDisclaminerFooterView;
  [(UIPrintSuppliesDisclaminerFooterView *)&v4 prepareForReuse];
}

- (void)handleTapOnLabel:(id)a3
{
  id v4 = a3;
  v5 = [(UIPrintSuppliesDisclaminerFooterView *)self disclaimerLabel];
  uint64_t v6 = [(UIPrintSuppliesDisclaminerFooterView *)self suppliesInfoLinkRange];
  int v8 = objc_msgSend(v4, "didTapAttributedTextInLabel:inRange:", v5, v6, v7);

  if (v8)
  {
    id v10 = [MEMORY[0x1E4FB1438] sharedApplication];
    v9 = [(UIPrintSuppliesDisclaminerFooterView *)self suppliesInfoURL];
    [v10 openURL:v9 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
}

- (UILabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (void)setDisclaimerLabel:(id)a3
{
}

- (NSURL)suppliesInfoURL
{
  return self->_suppliesInfoURL;
}

- (void)setSuppliesInfoURL:(id)a3
{
}

- (_NSRange)suppliesInfoLinkRange
{
  p_suppliesInfoLinkRange = &self->_suppliesInfoLinkRange;
  NSUInteger location = self->_suppliesInfoLinkRange.location;
  NSUInteger length = p_suppliesInfoLinkRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSuppliesInfoLinkRange:(_NSRange)a3
{
  self->_suppliesInfoLinkRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppliesInfoURL, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
}

@end