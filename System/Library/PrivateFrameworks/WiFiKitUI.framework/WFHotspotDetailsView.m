@interface WFHotspotDetailsView
- (CGSize)intrinsicContentSize;
- (NSString)cellularProtocolString;
- (UIImageView)signalImageView;
- (UILabel)networkTypeLabel;
- (WFHotspotDetailsView)initWithCoder:(id)a3;
- (WFHotspotDetailsView)initWithFrame:(CGRect)a3;
- (_UIBatteryView)batteryView;
- (id)attributedStringFromCellularProtocol:(id)a3;
- (unint64_t)batteryCharge;
- (unint64_t)signalBars;
- (void)setBatteryCharge:(unint64_t)a3;
- (void)setBatteryView:(id)a3;
- (void)setCellularProtocolString:(id)a3;
- (void)setNetworkTypeLabel:(id)a3;
- (void)setSignalBars:(unint64_t)a3;
- (void)setSignalImageView:(id)a3;
- (void)setupSubviews;
- (void)updateCellularProtocolLabel;
- (void)updateSignalBars;
@end

@implementation WFHotspotDetailsView

- (WFHotspotDetailsView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFHotspotDetailsView;
  v3 = -[WFHotspotDetailsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_signalBars = 0;
    cellularProtocolString = v3->_cellularProtocolString;
    v3->_cellularProtocolString = (NSString *)&stru_26D8F6070;

    v4->_batteryCharge = 0;
  }
  [(WFHotspotDetailsView *)v4 setupSubviews];
  return v4;
}

- (WFHotspotDetailsView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFHotspotDetailsView;
  v3 = [(WFHotspotDetailsView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_signalBars = 0;
    cellularProtocolString = v3->_cellularProtocolString;
    v3->_cellularProtocolString = (NSString *)&stru_26D8F6070;

    v4->_batteryCharge = 0;
  }
  [(WFHotspotDetailsView *)v4 setupSubviews];
  return v4;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(WFHotspotDetailsView *)self arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v10 intrinsicContentSize];
        double v13 = v12;
        if (Width == 0.0)
        {
          [v10 frame];
          double Width = CGRectGetWidth(v25);
        }
        double v14 = v8 + Width;
        [(WFHotspotDetailsView *)self spacing];
        double v8 = v14 + v15;
        if (v7 < v13) {
          double v7 = v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }

  double v16 = v8;
  double v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setupSubviews
{
  [(WFHotspotDetailsView *)self setSpacing:4.0];
  [(WFHotspotDetailsView *)self setAlignment:3];
  v3 = [MEMORY[0x263F825C8] clearColor];
  [(WFHotspotDetailsView *)self setBackgroundColor:v3];

  id v4 = objc_alloc(MEMORY[0x263F82828]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  [(WFHotspotDetailsView *)self setSignalImageView:v9];

  v10 = [(WFHotspotDetailsView *)self signalImageView];
  [(WFHotspotDetailsView *)self addArrangedSubview:v10];

  [(WFHotspotDetailsView *)self updateSignalBars];
  v11 = [(WFHotspotDetailsView *)self signalImageView];
  double v12 = (void *)MEMORY[0x263F08938];
  double v13 = [(WFHotspotDetailsView *)self signalImageView];
  double v14 = [v12 constraintWithItem:v13 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:17.0];
  [v11 addConstraint:v14];

  double v15 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
  [(WFHotspotDetailsView *)self setNetworkTypeLabel:v15];

  [(WFHotspotDetailsView *)self updateCellularProtocolLabel];
  double v16 = [(WFHotspotDetailsView *)self networkTypeLabel];
  [(WFHotspotDetailsView *)self addArrangedSubview:v16];

  double v17 = (void *)[objc_alloc(MEMORY[0x263F82EC8]) initWithSizeCategory:0];
  [(WFHotspotDetailsView *)self setBatteryView:v17];

  double v18 = (double)[(WFHotspotDetailsView *)self batteryCharge] / 100.0;
  long long v19 = [(WFHotspotDetailsView *)self batteryView];
  [v19 setChargePercent:v18];

  long long v20 = [(WFHotspotDetailsView *)self batteryView];
  [v20 setNeedsLayout];

  long long v21 = [(WFHotspotDetailsView *)self batteryView];
  [(WFHotspotDetailsView *)self addArrangedSubview:v21];

  v22 = [(WFHotspotDetailsView *)self batteryView];
  [v22 intrinsicContentSize];
  double v24 = v23;

  CGRect v25 = [(WFHotspotDetailsView *)self batteryView];
  v26 = (void *)MEMORY[0x263F08938];
  v27 = [(WFHotspotDetailsView *)self batteryView];
  v28 = [v26 constraintWithItem:v27 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v24];
  [v25 addConstraint:v28];

  [(WFHotspotDetailsView *)self invalidateIntrinsicContentSize];
}

- (void)setCellularProtocolString:(id)a3
{
  objc_storeStrong((id *)&self->_cellularProtocolString, a3);
  [(WFHotspotDetailsView *)self updateCellularProtocolLabel];
}

- (void)updateCellularProtocolLabel
{
  if (self->_cellularProtocolString)
  {
    v3 = -[WFHotspotDetailsView attributedStringFromCellularProtocol:](self, "attributedStringFromCellularProtocol:");
    id v4 = [(WFHotspotDetailsView *)self networkTypeLabel];
    [v4 setAttributedText:v3];
  }
  else
  {
    v3 = [(WFHotspotDetailsView *)self networkTypeLabel];
    [v3 setText:&stru_26D8F6070];
  }

  double v5 = [(WFHotspotDetailsView *)self networkTypeLabel];
  LODWORD(v6) = 1148846080;
  [v5 setContentHuggingPriority:0 forAxis:v6];

  double v7 = [(WFHotspotDetailsView *)self networkTypeLabel];
  double v8 = [v7 constraints];

  if (v8)
  {
    v9 = [(WFHotspotDetailsView *)self networkTypeLabel];
    v10 = [(WFHotspotDetailsView *)self networkTypeLabel];
    v11 = [v10 constraints];
    [v9 removeConstraints:v11];
  }
  double v12 = [(WFHotspotDetailsView *)self networkTypeLabel];
  [v12 sizeToFit];

  double v13 = [(WFHotspotDetailsView *)self networkTypeLabel];
  double v14 = (void *)MEMORY[0x263F08938];
  double v15 = [(WFHotspotDetailsView *)self networkTypeLabel];
  double v16 = [(WFHotspotDetailsView *)self networkTypeLabel];
  [v16 frame];
  double v17 = [v14 constraintWithItem:v15 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:CGRectGetWidth(v19) + 1.0];
  [v13 addConstraint:v17];

  [(WFHotspotDetailsView *)self sizeToFit];
  [(WFHotspotDetailsView *)self invalidateIntrinsicContentSize];
}

- (id)attributedStringFromCellularProtocol:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F089B8];
  id v4 = a3;
  double v5 = (void *)[[v3 alloc] initWithString:v4];

  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x263F81510], &unk_26D912340, 0, objc_msgSend(v5, "length"));
  uint64_t v6 = *MEMORY[0x263F814F0];
  double v7 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
  objc_msgSend(v5, "addAttribute:value:range:", v6, v7, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (void)setSignalBars:(unint64_t)a3
{
  unint64_t v4 = 5;
  if (a3 < 5) {
    unint64_t v4 = a3;
  }
  self->_signalBars = v4;
  [(WFHotspotDetailsView *)self updateSignalBars];
  [(WFHotspotDetailsView *)self invalidateIntrinsicContentSize];
}

- (void)setBatteryCharge:(unint64_t)a3
{
  self->_batteryCharge = a3;
  double v3 = (double)a3 / 100.0;
  id v4 = [(WFHotspotDetailsView *)self batteryView];
  [v4 setChargePercent:v3];
}

- (void)updateSignalBars
{
  unint64_t signalBars = self->_signalBars;
  unint64_t v4 = 5;
  if (signalBars < 5) {
    unint64_t v4 = self->_signalBars;
  }
  if (v4 >= 4)
  {
    if (v4 != 4 && signalBars <= 4)
    {
      id v14 = 0;
      goto LABEL_12;
    }
    double v5 = kWFImageCellularBars4;
  }
  else
  {
    double v5 = off_2647568A8[v4];
  }
  double v7 = +[WFImageCache sharedImageCache];
  id v14 = [v7 imageNamed:*v5];

LABEL_12:
  if ([(WFHotspotDetailsView *)self _shouldReverseLayoutDirection])
  {
    uint64_t v8 = [v14 imageFlippedForRightToLeftLayoutDirection];

    v9 = (void *)v8;
  }
  else
  {
    v9 = v14;
  }
  signalImageView = self->_signalImageView;
  id v15 = v9;
  v11 = [v9 imageWithRenderingMode:2];
  [(UIImageView *)signalImageView setImage:v11];

  double v12 = self->_signalImageView;
  double v13 = [MEMORY[0x263F825C8] defaultTextColor];
  [(UIImageView *)v12 setTintColor:v13];

  [(UIImageView *)self->_signalImageView sizeToFit];
}

- (unint64_t)batteryCharge
{
  return self->_batteryCharge;
}

- (NSString)cellularProtocolString
{
  return self->_cellularProtocolString;
}

- (unint64_t)signalBars
{
  return self->_signalBars;
}

- (_UIBatteryView)batteryView
{
  return self->_batteryView;
}

- (void)setBatteryView:(id)a3
{
}

- (UIImageView)signalImageView
{
  return self->_signalImageView;
}

- (void)setSignalImageView:(id)a3
{
}

- (UILabel)networkTypeLabel
{
  return self->_networkTypeLabel;
}

- (void)setNetworkTypeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTypeLabel, 0);
  objc_storeStrong((id *)&self->_signalImageView, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_cellularProtocolString, 0);
}

@end