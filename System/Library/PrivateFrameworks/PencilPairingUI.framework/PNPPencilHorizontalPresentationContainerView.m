@interface PNPPencilHorizontalPresentationContainerView
- (BOOL)showsChargingStatusView;
- (CGSize)intrinsicContentSize;
- (PNPChargingStatusView)chargingStatusView;
- (PNPDeviceState)deviceState;
- (PNPPencilView)pencilView;
- (void)layoutSubviews;
- (void)setChargingStatusView:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)setPencilView:(id)a3;
- (void)setShowsChargingStatusView:(BOOL)a3;
@end

@implementation PNPPencilHorizontalPresentationContainerView

- (void)layoutSubviews
{
  v3 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
  v4 = objc_opt_new();
  [v3 intrinsicSizeForDeviceState:v4];

  [(PNPPencilHorizontalPresentationContainerView *)self bounds];
  v5 = [(PNPPencilHorizontalPresentationContainerView *)self traitCollection];
  [v5 displayScale];
  uint64_t v37 = v6;
  UIRectCenteredIntegralRectScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(MEMORY[0x263F158F8], "begin", v37);
  [MEMORY[0x263F158F8] setDisableActions:1];
  v15 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
  long long v16 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v39[0] = *MEMORY[0x263F000D0];
  v39[1] = v16;
  v39[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v15 setTransform:v39];

  v17 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
  objc_msgSend(v17, "setFrame:", v8, v10, v12, v14);

  v18 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
  v19 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
  v20 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
  v21 = [v20 deviceState];
  if (v19) {
    [v19 transformForDeviceState:v21];
  }
  else {
    memset(v38, 0, sizeof(v38));
  }
  [v18 setTransform:v38];

  [MEMORY[0x263F158F8] commit];
  v22 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
  [v22 setSpinning:1];

  v23 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
  if ([(PNPPencilHorizontalPresentationContainerView *)self showsChargingStatusView]) {
    double v24 = 0.0;
  }
  else {
    double v24 = 1.0;
  }
  [v23 setAlpha:v24];

  v25 = [(PNPPencilHorizontalPresentationContainerView *)self chargingStatusView];
  if ([(PNPPencilHorizontalPresentationContainerView *)self showsChargingStatusView]) {
    double v26 = 1.0;
  }
  else {
    double v26 = 0.0;
  }
  [v25 setAlpha:v26];

  v27 = [(PNPPencilHorizontalPresentationContainerView *)self chargingStatusView];
  [v27 intrinsicContentSize];

  [(PNPPencilHorizontalPresentationContainerView *)self bounds];
  UIRectCenteredIntegralRect();
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v36 = [(PNPPencilHorizontalPresentationContainerView *)self chargingStatusView];
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);
}

- (void)setPencilView:(id)a3
{
  id v6 = a3;
  id v5 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];

  if (v5 != v6)
  {
    [(PNPPencilView *)self->_pencilView removeFromSuperview];
    objc_storeStrong((id *)&self->_pencilView, a3);
    if (self->_pencilView)
    {
      -[PNPPencilHorizontalPresentationContainerView addSubview:](self, "addSubview:");
      [(PNPPencilHorizontalPresentationContainerView *)self setNeedsLayout];
    }
  }
}

- (void)setChargingStatusView:(id)a3
{
  id v6 = a3;
  id v5 = [(PNPPencilHorizontalPresentationContainerView *)self chargingStatusView];

  if (v5 != v6)
  {
    [(PNPChargingStatusView *)self->_chargingStatusView removeFromSuperview];
    objc_storeStrong((id *)&self->_chargingStatusView, a3);
    if (self->_chargingStatusView)
    {
      -[PNPPencilHorizontalPresentationContainerView addSubview:](self, "addSubview:");
      [(PNPPencilHorizontalPresentationContainerView *)self setNeedsLayout];
    }
  }
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
  id v5 = a3;
  [(PNPPencilView *)self->_pencilView setDeviceState:v5];
  [(PNPChargingStatusView *)self->_chargingStatusView setDeviceState:v5];

  [(PNPPencilHorizontalPresentationContainerView *)self setNeedsLayout];
}

- (void)setShowsChargingStatusView:(BOOL)a3
{
  self->_showsChargingStatusView = a3;
  [(PNPPencilHorizontalPresentationContainerView *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  if ([(PNPPencilHorizontalPresentationContainerView *)self showsChargingStatusView])
  {
    chargingStatusView = self->_chargingStatusView;
    [(PNPChargingStatusView *)chargingStatusView intrinsicContentSize];
  }
  else
  {
    id v6 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
    double v7 = [(PNPPencilHorizontalPresentationContainerView *)self pencilView];
    double v8 = [v7 deviceState];
    [v6 comfortableContainingSizeForDeviceState:v8];
    double v10 = v9;
    double v12 = v11;

    double v4 = v10;
    double v5 = v12;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (PNPChargingStatusView)chargingStatusView
{
  return self->_chargingStatusView;
}

- (BOOL)showsChargingStatusView
{
  return self->_showsChargingStatusView;
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (PNPPencilView)pencilView
{
  return self->_pencilView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_chargingStatusView, 0);
}

@end