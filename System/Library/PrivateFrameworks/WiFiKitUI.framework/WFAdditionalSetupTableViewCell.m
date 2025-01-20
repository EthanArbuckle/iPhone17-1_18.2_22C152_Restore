@interface WFAdditionalSetupTableViewCell
- (UILabel)label;
- (void)awakeFromNib;
- (void)setLabel:(id)a3;
@end

@implementation WFAdditionalSetupTableViewCell

- (void)awakeFromNib
{
  v8.receiver = self;
  v8.super_class = (Class)WFAdditionalSetupTableViewCell;
  [(WFAdditionalSetupTableViewCell *)&v8 awakeFromNib];
  v3 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v4 = (void *)MEMORY[0x263F81708];
  [v3 pointSize];
  v5 = objc_msgSend(v4, "boldSystemFontOfSize:");
  v6 = [(WFAdditionalSetupTableViewCell *)self label];
  [v6 setFont:v5];

  v7 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [(WFAdditionalSetupTableViewCell *)self setBackgroundColor:v7];
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end