@interface WSNanoWebSheetDetailView
- (WSNanoWebSheetDetailView)initWithURL:(id)a3 ssid:(id)a4 isSecure:(BOOL)a5 hasEVCert:(BOOL)a6;
- (id)_evCertColor;
- (void)updateURILabel;
@end

@implementation WSNanoWebSheetDetailView

- (WSNanoWebSheetDetailView)initWithURL:(id)a3 ssid:(id)a4 isSecure:(BOOL)a5 hasEVCert:(BOOL)a6
{
  BOOL v51 = a5;
  v55[8] = *MEMORY[0x263EF8340];
  v54.receiver = self;
  v54.super_class = (Class)WSNanoWebSheetDetailView;
  id v53 = a4;
  id v52 = a3;
  v8 = [(WSNanoWebSheetDetailView *)&v54 init];
  v8->_hasEVCert = a6;
  v9 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [(WSNanoWebSheetDetailView *)v8 setBackgroundColor:v9];

  v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  urlLabel = v8->_urlLabel;
  v8->_urlLabel = v10;

  v12 = [MEMORY[0x263F1C550] labelColor];
  [(UILabel *)v8->_urlLabel setTintColor:v12];

  v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  ssidLabel = v8->_ssidLabel;
  v8->_ssidLabel = v13;

  v15 = [MEMORY[0x263F1C550] labelColor];
  [(UILabel *)v8->_ssidLabel setTintColor:v15];

  v50 = [MEMORY[0x263F1C6C8] configurationWithScale:1];
  v49 = [MEMORY[0x263F1C6B0] systemImageNamed:@"lock.fill" withConfiguration:v50];
  uint64_t v16 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v49];
  padlockImageView = v8->_padlockImageView;
  v8->_padlockImageView = (UIImageView *)v16;

  [(WSNanoWebSheetDetailView *)v8 updateURILabel];
  [(UILabel *)v8->_urlLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v8->_ssidLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)v8->_padlockImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WSNanoWebSheetDetailView *)v8 addSubview:v8->_urlLabel];
  [(WSNanoWebSheetDetailView *)v8 addSubview:v8->_ssidLabel];
  [(UILabel *)v8->_ssidLabel setTextAlignment:0];
  [(UILabel *)v8->_urlLabel setTextAlignment:0];
  [(WSNanoWebSheetDetailView *)v8 addSubview:v8->_padlockImageView];
  v37 = (void *)MEMORY[0x263F08938];
  v47 = [(UILabel *)v8->_urlLabel topAnchor];
  v48 = [(WSNanoWebSheetDetailView *)v8 layoutMarginsGuide];
  v46 = [v48 topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v55[0] = v45;
  v43 = [(UILabel *)v8->_urlLabel widthAnchor];
  v44 = [(WSNanoWebSheetDetailView *)v8 layoutMarginsGuide];
  v42 = [v44 widthAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:-10.0];
  v55[1] = v41;
  v40 = [(UILabel *)v8->_ssidLabel topAnchor];
  v39 = [(UILabel *)v8->_urlLabel bottomAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:10.0];
  v55[2] = v38;
  v36 = [(UILabel *)v8->_ssidLabel leadingAnchor];
  v35 = [(UILabel *)v8->_urlLabel leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v55[3] = v34;
  v32 = [(UILabel *)v8->_ssidLabel widthAnchor];
  v33 = [(WSNanoWebSheetDetailView *)v8 layoutMarginsGuide];
  v31 = [v33 widthAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:-10.0];
  v55[4] = v30;
  v29 = [(UIImageView *)v8->_padlockImageView firstBaselineAnchor];
  v28 = [(UILabel *)v8->_urlLabel firstBaselineAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v55[5] = v27;
  v18 = [(UIImageView *)v8->_padlockImageView trailingAnchor];
  v19 = [(UILabel *)v8->_urlLabel leadingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:-2.0];
  v55[6] = v20;
  v21 = [(UIImageView *)v8->_padlockImageView leadingAnchor];
  v22 = [(WSNanoWebSheetDetailView *)v8 layoutMarginsGuide];
  v23 = [v22 leadingAnchor];
  v24 = [v21 constraintGreaterThanOrEqualToAnchor:v23];
  v55[7] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:8];
  [v37 activateConstraints:v25];

  [(UIImageView *)v8->_padlockImageView setHidden:!v51];
  [(UILabel *)v8->_urlLabel setNumberOfLines:0];
  [(UILabel *)v8->_urlLabel setLineBreakMode:0];
  [(UILabel *)v8->_urlLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v8->_urlLabel setText:v52];

  [(UILabel *)v8->_urlLabel sizeToFit];
  [(UILabel *)v8->_ssidLabel setNumberOfLines:0];
  [(UILabel *)v8->_ssidLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v8->_ssidLabel setText:v53];

  [(UILabel *)v8->_ssidLabel sizeToFit];
  return v8;
}

- (id)_evCertColor
{
  v2 = (void *)_evCertColor_color;
  if (!_evCertColor_color)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F1C550]) initWithRed:0.262745098 green:0.749019608 blue:0.345098039 alpha:1.0];
    v4 = (void *)_evCertColor_color;
    _evCertColor_color = v3;

    v2 = (void *)_evCertColor_color;
  }
  return v2;
}

- (void)updateURILabel
{
  if (self->_hasEVCert) {
    [(WSNanoWebSheetDetailView *)self _evCertColor];
  }
  else {
  id v5 = [MEMORY[0x263F1C550] labelColor];
  }
  [(UILabel *)self->_urlLabel setTextColor:v5];
  uint64_t v3 = [(UIImageView *)self->_padlockImageView image];
  v4 = [v3 imageWithRenderingMode:2];
  [(UIImageView *)self->_padlockImageView setImage:v4];

  [(UIImageView *)self->_padlockImageView setTintColor:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_padlockImageView, 0);
  objc_storeStrong((id *)&self->_ssidLabel, 0);
  objc_storeStrong((id *)&self->_urlLabel, 0);
}

@end