@interface WFBuddyNetworkListCell
- (NSLayoutConstraint)bottomLabelConstraint;
- (NSLayoutConstraint)topLabelConstraint;
- (NSLayoutConstraint)trailingImageViewConstraint;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)setBottomLabelConstraint:(id)a3;
- (void)setTopLabelConstraint:(id)a3;
- (void)setTrailingImageViewConstraint:(id)a3;
@end

@implementation WFBuddyNetworkListCell

- (void)awakeFromNib
{
  v16[2] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)WFBuddyNetworkListCell;
  [(WFNetworkListCell *)&v14 awakeFromNib];
  v15[0] = *MEMORY[0x263F81500];
  v3 = [MEMORY[0x263F825C8] systemBlueColor];
  v16[0] = v3;
  v15[1] = *MEMORY[0x263F814F0];
  v4 = [MEMORY[0x263F68058] sharedStyle];
  v5 = [v4 tableCellFont];
  v16[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  [@"A" sizeWithAttributes:v6];
  double v8 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topLabelConstraint);
  [WeakRetained setConstant:v8];

  id v10 = objc_loadWeakRetained((id *)&self->_bottomLabelConstraint);
  [v10 setConstant:v8];

  v11 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [(WFBuddyNetworkListCell *)self setBackgroundColor:v11];

  v12 = [MEMORY[0x263F825C8] defaultTextColor];
  v13 = [(WFBuddyNetworkListCell *)self textLabel];
  [v13 setTextColor:v12];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)WFBuddyNetworkListCell;
  [(WFBuddyNetworkListCell *)&v5 layoutSubviews];
  if ([(WFBuddyNetworkListCell *)self accessoryType] == 4) {
    double v3 = 0.0;
  }
  else {
    double v3 = 8.0;
  }
  v4 = [(WFBuddyNetworkListCell *)self trailingImageViewConstraint];
  [v4 setConstant:v3];
}

- (NSLayoutConstraint)trailingImageViewConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingImageViewConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTrailingImageViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)topLabelConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topLabelConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTopLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomLabelConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomLabelConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomLabelConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bottomLabelConstraint);
  objc_destroyWeak((id *)&self->_topLabelConstraint);
  objc_destroyWeak((id *)&self->_trailingImageViewConstraint);
}

@end