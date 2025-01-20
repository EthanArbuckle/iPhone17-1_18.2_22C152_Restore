@interface WFHotspotCell
- (BOOL)personalHotspot;
- (BOOL)secure;
- (NSLayoutConstraint)stackViewBottomConstraint;
- (NSLayoutConstraint)stackViewLeadingConstraint;
- (NSLayoutConstraint)stackViewTopConstraint;
- (NSString)title;
- (UILabel)nameLabel;
- (UIStackView)stackView;
- (WFAssociationStateView)associationStateView;
- (WFHotspotDetails)hotspotDetails;
- (WFHotspotDetailsView)hotspotDetailsView;
- (double)_verticalPadding;
- (int64_t)state;
- (unint64_t)bars;
- (void)_adjustStackViewPadding;
- (void)awakeFromNib;
- (void)prepareForReuse;
- (void)setAssociationStateView:(id)a3;
- (void)setBars:(unint64_t)a3;
- (void)setHotspotDetails:(id)a3;
- (void)setHotspotDetailsView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPersonalHotspot:(BOOL)a3;
- (void)setSecure:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewBottomConstraint:(id)a3;
- (void)setStackViewLeadingConstraint:(id)a3;
- (void)setStackViewTopConstraint:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFHotspotCell

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)WFHotspotCell;
  [(WFHotspotCell *)&v3 awakeFromNib];
  [(WFHotspotCell *)self _adjustStackViewPadding];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4 = [a3 preferredContentSizeCategory];
  v5 = [(WFHotspotCell *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    [(WFHotspotCell *)self _adjustStackViewPadding];
  }
}

- (void)_adjustStackViewPadding
{
  [(WFHotspotCell *)self _verticalPadding];
  double v4 = v3;
  v5 = [(WFHotspotCell *)self stackViewTopConstraint];
  [v5 setConstant:v4];

  [(WFHotspotCell *)self _verticalPadding];
  double v7 = v6;
  id v8 = [(WFHotspotCell *)self stackViewBottomConstraint];
  [v8 setConstant:v7];
}

- (double)_verticalPadding
{
  v2 = [(WFHotspotCell *)self nameLabel];
  double v3 = [v2 font];
  [v3 _bodyLeading];
  double v5 = v4 * 0.5;

  return v5;
}

- (void)setState:(int64_t)a3
{
  id v4 = [(WFHotspotCell *)self associationStateView];
  [v4 setState:a3];
}

- (int64_t)state
{
  v2 = [(WFHotspotCell *)self associationStateView];
  int64_t v3 = [v2 state];

  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)WFHotspotCell;
  [(WFHotspotCell *)&v3 prepareForReuse];
  [(WFHotspotCell *)self setState:0];
  [(WFHotspotCell *)self setHotspotDetails:0];
}

- (void)setTitle:(id)a3
{
  id v4 = self;
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  id v4 = (WFHotspotCell *)((char *)v4 + 1056);
  id WeakRetained = objc_loadWeakRetained((id *)&v4->super.super.super.super.isa);
  [WeakRetained setText:v5];

  id v8 = objc_loadWeakRetained((id *)&v4->super.super.super.super.isa);
  double v7 = [MEMORY[0x263F825C8] defaultTextColor];

  [v8 setTextColor:v7];
}

- (void)setPersonalHotspot:(BOOL)a3
{
  self->_personalHotspot = a3;
  [(WFHotspotCell *)self setNeedsLayout];
}

- (void)setBars:(unint64_t)a3
{
  self->_bars = a3;
  [(WFHotspotCell *)self setNeedsLayout];
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
  [(WFHotspotCell *)self setNeedsLayout];
}

- (void)setHotspotDetails:(id)a3
{
  p_hotspotDetails = &self->_hotspotDetails;
  id v17 = a3;
  if (!-[WFHotspotDetails isEqual:](*p_hotspotDetails, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_hotspotDetails, a3);
    double v6 = [(WFHotspotDetails *)*p_hotspotDetails cellularProtocolString];
    double v7 = [(WFHotspotCell *)self hotspotDetailsView];
    [v7 setCellularProtocolString:v6];

    id v8 = [(WFHotspotDetails *)*p_hotspotDetails signalStrength];
    uint64_t v9 = [v8 unsignedIntegerValue];
    v10 = [(WFHotspotCell *)self hotspotDetailsView];
    [v10 setSignalBars:v9];

    v11 = [(WFHotspotDetails *)*p_hotspotDetails batteryLife];
    uint64_t v12 = [v11 unsignedIntegerValue];
    v13 = [(WFHotspotCell *)self hotspotDetailsView];
    [v13 setBatteryCharge:v12];

    v14 = [(WFHotspotCell *)self stackView];
    v15 = [(WFHotspotCell *)self hotspotDetailsView];
    [v14 addArrangedSubview:v15];

    v16 = [(WFHotspotCell *)self stackView];
    [v16 setLayoutMarginsRelativeArrangement:1];

    [(WFHotspotCell *)self setNeedsLayout];
  }
}

- (unint64_t)bars
{
  return self->_bars;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)personalHotspot
{
  return self->_personalHotspot;
}

- (WFHotspotDetails)hotspotDetails
{
  return self->_hotspotDetails;
}

- (BOOL)secure
{
  return self->_secure;
}

- (UIStackView)stackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackView);
  return (UIStackView *)WeakRetained;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)nameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameLabel);
  return (UILabel *)WeakRetained;
}

- (void)setNameLabel:(id)a3
{
}

- (WFHotspotDetailsView)hotspotDetailsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hotspotDetailsView);
  return (WFHotspotDetailsView *)WeakRetained;
}

- (void)setHotspotDetailsView:(id)a3
{
}

- (NSLayoutConstraint)stackViewTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewTopConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStackViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewBottomConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStackViewBottomConstraint:(id)a3
{
}

- (WFAssociationStateView)associationStateView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associationStateView);
  return (WFAssociationStateView *)WeakRetained;
}

- (void)setAssociationStateView:(id)a3
{
}

- (NSLayoutConstraint)stackViewLeadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewLeadingConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStackViewLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_associationStateView);
  objc_destroyWeak((id *)&self->_stackViewBottomConstraint);
  objc_destroyWeak((id *)&self->_stackViewTopConstraint);
  objc_destroyWeak((id *)&self->_hotspotDetailsView);
  objc_destroyWeak((id *)&self->_nameLabel);
  objc_destroyWeak((id *)&self->_stackView);
  objc_storeStrong((id *)&self->_hotspotDetails, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end