@interface TVRMessageView
- (BOOL)_largeAccessibilityFontSizesEnabled;
- (BOOL)isWifiConnectInProgress;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (TVRUIStyleProvider)styleProvider;
- (UIButton)turnOnWiFiButton;
- (UIView)currentView;
- (id)_convertToAttributedStringWithReplacement:(id)a3 imagePointSize:(double)a4;
- (id)_deviceTypeString;
- (id)_loadingViewWithTitle:(id)a3 forSize:(CGSize)a4;
- (id)_localizedLegacyPairingMessageForDeviceModel;
- (unint64_t)messageType;
- (void)_turnOnWireless:(id)a3;
- (void)clearContent;
- (void)layoutSubviews;
- (void)setCurrentView:(id)a3;
- (void)setMessageType:(unint64_t)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTurnOnWiFiButton:(id)a3;
- (void)setWifiConnectInProgress:(BOOL)a3;
- (void)showLoadingSpinner;
- (void)showMessageWithError:(id)a3 device:(id)a4;
- (void)showMessageWithTitle:(id)a3 message:(id)a4;
- (void)showMessageWithTitle:(id)a3 message:(id)a4 titleFont:(id)a5;
- (void)showNoAssociatedNetworkMessage;
- (void)showNoWIFIConnectionMessage;
- (void)showPairingMessageWithCode:(id)a3;
- (void)showSearchingSpinner;
@end

@implementation TVRMessageView

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_currentView bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)TVRMessageView;
  [(TVRMessageView *)&v4 layoutSubviews];
  currentView = self->_currentView;
  [(TVRMessageView *)self bounds];
  UIRectGetCenter();
  -[UIView setCenter:](currentView, "setCenter:");
}

- (void)showMessageWithError:(id)a3 device:(id)a4
{
  id v41 = a3;
  id v6 = a4;
  if ([v41 code] == 102)
  {
    v7 = NSString;
    v8 = [(TVRMessageView *)self _deviceTypeString];
    v9 = [v7 stringWithFormat:@"TVRemoteUIPairingDeviceLockedMessage%@", v8];

    v10 = NSString;
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:v9 value:&stru_26DB4CAE0 table:@"Localizable"];
    v13 = [v6 name];
    v14 = objc_msgSend(v10, "stringWithFormat:", v12, v13);

    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"TVRemoteUIPairingDeviceLockedTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
    [(TVRMessageView *)self showMessageWithTitle:v16 message:v14];
  }
  else if ([v41 code] == 104)
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v9 localizedStringForKey:@"TVRemoteUIConnectionErrorTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"TVRemoteUIConnectionBlockedMessage" value:&stru_26DB4CAE0 table:@"Localizable"];
    [(TVRMessageView *)self showMessageWithTitle:v14 message:v18];
  }
  else if ([v41 code] == 103)
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v9 localizedStringForKey:@"TVRemoteUIConnectionErrorTitleTV" value:&stru_26DB4CAE0 table:@"Localizable"];
    [(TVRMessageView *)self showMessageWithTitle:v14 message:&stru_26DB4CAE0];
  }
  else
  {
    int v19 = MGGetBoolAnswer();
    v20 = @"WIFI";
    if (v19) {
      v20 = @"WLAN";
    }
    v9 = [NSString stringWithFormat:@"TVRemoteUIConnectionErrorMessage%@", v20];
    v21 = NSString;
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:v9 value:&stru_26DB4CAE0 table:@"Localizable"];
    v24 = [v6 name];
    v14 = objc_msgSend(v21, "stringWithFormat:", v23, v24);

    v25 = [v6 model];
    int v26 = [v25 containsString:@"AppleTV"];

    v27 = [v6 name];

    if (!v27)
    {
      v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v29 = v28;
      if (v26) {
        v30 = @"TVRemoteUIAppleTVDeviceName";
      }
      else {
        v30 = @"TVRemoteUITVDeviceName";
      }
      v31 = [v28 localizedStringForKey:v30 value:&stru_26DB4CAE0 table:@"Localizable"];

      uint64_t v32 = [NSString stringWithFormat:@"%@NoName", v9];

      v33 = NSString;
      v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v35 = [v34 localizedStringForKey:v32 value:&stru_26DB4CAE0 table:@"Localizable"];
      uint64_t v36 = objc_msgSend(v33, "stringWithFormat:", v35, v31);

      v14 = (void *)v36;
      v9 = (void *)v32;
    }
    v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v38 = [v37 localizedStringForKey:@"TVRemoteUIConnectionErrorTitle" value:&stru_26DB4CAE0 table:@"Localizable"];

    if ((v26 & 1) == 0)
    {
      v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v40 = [v39 localizedStringForKey:@"TVRemoteUIConnectionErrorTitleTV" value:&stru_26DB4CAE0 table:@"Localizable"];

      v38 = (void *)v40;
    }
    [(TVRMessageView *)self showMessageWithTitle:v38 message:v14];
  }
}

- (void)showMessageWithTitle:(id)a3 message:(id)a4 titleFont:(id)a5
{
  v68[3] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (objc_class *)MEMORY[0x263F82E00];
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  v13 = [v12 layer];
  [v13 setAllowsGroupOpacity:0];
  v65 = v13;
  [v13 setAllowsGroupBlending:0];
  id v14 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v14 setFont:v10];

  [v14 setNumberOfLines:0];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v15) = 1148846080;
  [v14 setContentCompressionResistancePriority:0 forAxis:v15];
  [v14 setTextAlignment:1];
  [v14 setAdjustsFontSizeToFitWidth:1];
  [v14 setText:v11];

  v16 = [(TVRMessageView *)self styleProvider];
  v17 = [v16 colorForMessageLabels];
  [v14 setTextColor:v17];

  [v12 addSubview:v14];
  v18 = [v14 topAnchor];
  int v19 = [v12 topAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19];

  v21 = [v14 leadingAnchor];
  v22 = [v12 leadingAnchor];
  uint64_t v23 = [v21 constraintEqualToAnchor:v22];

  v24 = [v14 trailingAnchor];
  v25 = [v12 trailingAnchor];
  uint64_t v26 = [v24 constraintEqualToAnchor:v25];

  v27 = (void *)MEMORY[0x263F08938];
  v63 = (void *)v23;
  v64 = (void *)v20;
  v68[0] = v20;
  v68[1] = v23;
  v62 = (void *)v26;
  v68[2] = v26;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:3];
  [v27 activateConstraints:v28];

  if (v8)
  {
    v29 = [(TVRMessageView *)self styleProvider];
    uint64_t v59 = [v29 fontForMessageViewDescription];

    id v30 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v30 setFont:v59];
    [v30 setNumberOfLines:0];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v31) = 1148846080;
    [v30 setContentCompressionResistancePriority:0 forAxis:v31];
    [v30 setTextAlignment:1];
    [v30 setAdjustsFontSizeToFitWidth:1];
    [v30 setText:v8];
    uint64_t v32 = [(TVRMessageView *)self styleProvider];
    v33 = [v32 colorForMessageLabels];
    [v30 setTextColor:v33];

    [v12 addSubview:v30];
    if ([(TVRMessageView *)self _largeAccessibilityFontSizesEnabled]) {
      double v34 = 40.0;
    }
    else {
      double v34 = 20.0;
    }
    v35 = objc_msgSend(v30, "firstBaselineAnchor", v59);
    uint64_t v36 = [v14 lastBaselineAnchor];
    v37 = [v35 constraintEqualToAnchor:v36 constant:v34];

    v38 = [v30 leadingAnchor];
    [v12 leadingAnchor];
    v39 = id v61 = v8;
    uint64_t v40 = [v38 constraintEqualToAnchor:v39];

    id v41 = [v30 trailingAnchor];
    v42 = [v12 trailingAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];

    v44 = [v30 bottomAnchor];
    v45 = [v12 bottomAnchor];
    v46 = [v44 constraintLessThanOrEqualToAnchor:v45];

    v47 = (void *)MEMORY[0x263F08938];
    v67[0] = v37;
    v67[1] = v40;
    v67[2] = v43;
    v67[3] = v46;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:4];
    [v47 activateConstraints:v48];

    id v8 = v61;
    v49 = v60;
  }
  else
  {
    v50 = (void *)MEMORY[0x263F08938];
    v49 = [v14 bottomAnchor];
    v37 = [v12 bottomAnchor];
    uint64_t v40 = [v49 constraintEqualToAnchor:v37];
    v66 = v40;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
    [v50 activateConstraints:v43];
    id v30 = 0;
  }

  [(TVRMessageView *)self bounds];
  double v52 = v51;
  double v54 = v53;
  objc_msgSend(v14, "sizeThatFits:", v51, v53);
  double v56 = v55;
  if (v8) {
    objc_msgSend(v30, "sizeThatFits:", v52, v54);
  }
  else {
    double v57 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  if (v56 + v57 + 20.0 >= v54) {
    double v58 = v54;
  }
  else {
    double v58 = v56 + v57 + 20.0;
  }
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v52, v58);
  [(TVRMessageView *)self setCurrentView:v12];
  [(TVRMessageView *)self setMessageType:1];
}

- (void)showMessageWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TVRMessageView *)self styleProvider];
  id v9 = [v8 fontForMessageViewTitle];

  [(TVRMessageView *)self showMessageWithTitle:v7 message:v6 titleFont:v9];
}

- (void)showPairingMessageWithCode:(id)a3
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v6 = [(TVRMessageView *)self styleProvider];
  uint64_t v7 = [v6 fontForMessageViewDescription];

  id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v8 setNumberOfLines:0];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"TVRemoteUILegacyPairingTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  [v8 setText:v10];

  [v8 setTextAlignment:1];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [(TVRMessageView *)self styleProvider];
  id v12 = [v11 fontForMessageViewTitle];
  [v8 setFont:v12];

  v13 = [(TVRMessageView *)self styleProvider];
  id v14 = [v13 colorForMessageLabels];
  [v8 setTextColor:v14];

  LODWORD(v15) = 1148846080;
  [v8 setContentCompressionResistancePriority:0 forAxis:v15];
  v108 = v8;
  LODWORD(v16) = 1148846080;
  [v8 setContentCompressionResistancePriority:1 forAxis:v16];
  id v17 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v17 setNumberOfLines:0];
  [v17 setTextAlignment:1];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  v106 = (void *)v7;
  [v17 setFont:v7];
  v18 = [(TVRMessageView *)self styleProvider];
  int v19 = [v18 colorForMessageLabels];
  [v17 setTextColor:v19];

  v105 = self;
  uint64_t v20 = [(TVRMessageView *)self _localizedLegacyPairingMessageForDeviceModel];
  [v17 setText:v20];

  LODWORD(v21) = 1148846080;
  [v17 setContentCompressionResistancePriority:0 forAxis:v21];
  v107 = v17;
  LODWORD(v22) = 1148846080;
  [v17 setContentCompressionResistancePriority:1 forAxis:v22];
  uint64_t v23 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "length"));
  if ([v4 length])
  {
    unint64_t v24 = 0;
    do
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"%c", objc_msgSend(v4, "characterAtIndex:", v24));
      [v23 addObject:v25];

      ++v24;
    }
    while (v24 < [v4 length]);
  }
  uint64_t v26 = [v23 componentsJoinedByString:@" "];
  id v27 = objc_alloc_init(MEMORY[0x263F828E0]);
  v104 = (void *)v26;
  [v27 setText:v26];
  [v27 setNumberOfLines:1];
  [v27 setTextAlignment:1];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v27 setTextAlignment:1];
  v28 = [MEMORY[0x263F81708] systemFontOfSize:*MEMORY[0x263F03B88] weight:28.0 design:*MEMORY[0x263F81838]];
  [v27 setFont:v28];

  v29 = [(TVRMessageView *)v105 styleProvider];
  id v30 = [v29 colorForMessageLabels];
  [v27 setTextColor:v30];

  LODWORD(v31) = 1148846080;
  [v27 setContentCompressionResistancePriority:0 forAxis:v31];
  LODWORD(v32) = 1148846080;
  [v27 setContentCompressionResistancePriority:1 forAxis:v32];
  id v33 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v33 setNumberOfLines:0];
  [v33 setTextAlignment:1];
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v33 setFont:v106];
  double v34 = [(TVRMessageView *)v105 styleProvider];
  v35 = [v34 colorForSpinner];
  [v33 setTintColor:v35];

  uint64_t v36 = [(TVRMessageView *)v105 styleProvider];
  v37 = [v36 colorForSpinner];
  [v33 setTextColor:v37];

  v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"TVRemoteUILegacyPairingBottomMessage" value:&stru_26DB4CAE0 table:@"Localizable"];
  uint64_t v40 = [(TVRMessageView *)v105 _convertToAttributedStringWithReplacement:v39 imagePointSize:13.0];
  [v33 setAttributedText:v40];

  LODWORD(v41) = 1148846080;
  [v33 setContentCompressionResistancePriority:0 forAxis:v41];
  LODWORD(v42) = 1148846080;
  [v33 setContentCompressionResistancePriority:1 forAxis:v42];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v117[0] = v108;
  v117[1] = v107;
  v117[2] = v27;
  v117[3] = v33;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:4];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v109 objects:v118 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v110 != v46) {
          objc_enumerationMutation(v43);
        }
        [v5 addSubview:*(void *)(*((void *)&v109 + 1) + 8 * i)];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v109 objects:v118 count:16];
    }
    while (v45);
  }

  v48 = [v108 topAnchor];
  v49 = [v5 topAnchor];
  v103 = [v48 constraintEqualToAnchor:v49];

  v50 = [v108 leadingAnchor];
  double v51 = [v5 leadingAnchor];
  v102 = [v50 constraintEqualToAnchor:v51];

  double v52 = [v108 trailingAnchor];
  double v53 = [v5 trailingAnchor];
  v101 = [v52 constraintEqualToAnchor:v53];

  double v54 = (void *)MEMORY[0x263F08938];
  v116[0] = v103;
  v116[1] = v102;
  v116[2] = v101;
  double v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:3];
  [v54 activateConstraints:v55];

  double v56 = [v107 topAnchor];
  double v57 = [v108 lastBaselineAnchor];
  v100 = [v56 constraintEqualToAnchor:v57 constant:16.0];

  double v58 = [v107 leadingAnchor];
  uint64_t v59 = [v5 leadingAnchor];
  v99 = [v58 constraintEqualToAnchor:v59];

  v60 = [v107 trailingAnchor];
  id v61 = [v5 trailingAnchor];
  v98 = [v60 constraintEqualToAnchor:v61];

  v62 = (void *)MEMORY[0x263F08938];
  v115[0] = v100;
  v115[1] = v99;
  v115[2] = v98;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:3];
  [v62 activateConstraints:v63];

  v64 = [v27 topAnchor];
  v65 = [v107 lastBaselineAnchor];
  v97 = [v64 constraintEqualToAnchor:v65 constant:16.0];

  v66 = [v27 leadingAnchor];
  v67 = [v5 leadingAnchor];
  v96 = [v66 constraintEqualToAnchor:v67];

  v68 = [v27 trailingAnchor];
  v69 = [v5 trailingAnchor];
  v95 = [v68 constraintEqualToAnchor:v69];

  v70 = (void *)MEMORY[0x263F08938];
  v114[0] = v97;
  v114[1] = v96;
  v114[2] = v95;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:3];
  [v70 activateConstraints:v71];

  v72 = [v33 topAnchor];
  v73 = [v27 bottomAnchor];
  v94 = [v72 constraintEqualToAnchor:v73 constant:16.0];

  v74 = [v33 leadingAnchor];
  v75 = [v5 leadingAnchor];
  v76 = [v74 constraintEqualToAnchor:v75];

  v77 = [v33 trailingAnchor];
  v78 = [v5 trailingAnchor];
  v79 = [v77 constraintEqualToAnchor:v78];

  v80 = (void *)MEMORY[0x263F08938];
  v113[0] = v76;
  v113[1] = v79;
  v113[2] = v94;
  v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:3];
  [v80 activateConstraints:v81];

  [(TVRMessageView *)v105 bounds];
  double v83 = v82;
  double v85 = v84;
  objc_msgSend(v108, "sizeThatFits:", v82, v84);
  double v87 = v86;
  objc_msgSend(v107, "sizeThatFits:", v83, v85);
  double v89 = v88;
  objc_msgSend(v27, "sizeThatFits:", v83, v85);
  double v91 = v90;
  objc_msgSend(v33, "sizeThatFits:", v83, v85);
  if (v87 + v89 + v91 + v92 + 20.0 >= v85) {
    double v93 = v85;
  }
  else {
    double v93 = v87 + v89 + v91 + v92 + 20.0;
  }
  objc_msgSend(v5, "setBounds:", 0.0, 0.0, v83, v93);
  [(TVRMessageView *)v105 setCurrentView:v5];
  [(TVRMessageView *)v105 setMessageType:2];
}

- (void)showNoAssociatedNetworkMessage
{
  int v3 = MGGetBoolAnswer();
  id v4 = @"WIFI";
  if (v3) {
    id v4 = @"WLAN";
  }
  id v7 = [NSString stringWithFormat:@"TVRemoteUINoAssociatedNetworkString%@", v4];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:v7 value:&stru_26DB4CAE0 table:@"Localizable"];
  [(TVRMessageView *)self showMessageWithTitle:v6 message:0];

  [(TVRMessageView *)self setMessageType:4];
}

- (void)showNoWIFIConnectionMessage
{
  v56[8] = *MEMORY[0x263EF8340];
  if (![(TVRMessageView *)self isWifiConnectInProgress])
  {
    int v3 = MGGetBoolAnswer();
    id v4 = @"WIFI";
    if (v3) {
      id v4 = @"WLAN";
    }
    double v52 = [NSString stringWithFormat:@"TVRemoteUINoWIFIConnectionString%@", v4];
    id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
    double v54 = [v5 layer];
    [v54 setAllowsGroupOpacity:0];
    [v54 setAllowsGroupBlending:0];
    [(TVRMessageView *)self setUserInteractionEnabled:1];
    id v6 = [(TVRMessageView *)self styleProvider];
    double v53 = [v6 fontForMessageViewTitle];

    id v7 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v7 setFont:v53];
    [v7 setNumberOfLines:0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1148846080;
    [v7 setContentCompressionResistancePriority:0 forAxis:v8];
    [v7 setTextAlignment:1];
    [v7 setAdjustsFontSizeToFitWidth:1];
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:v52 value:&stru_26DB4CAE0 table:@"Localizable"];
    [v7 setText:v10];

    id v11 = [(TVRMessageView *)self styleProvider];
    id v12 = [v11 colorForMessageLabels];
    [v7 setTextColor:v12];

    [v5 addSubview:v7];
    v13 = [v7 topAnchor];
    id v14 = [v5 topAnchor];
    double v55 = [v13 constraintEqualToAnchor:v14];

    double v15 = [v7 leadingAnchor];
    double v16 = [v5 leadingAnchor];
    double v51 = [v15 constraintEqualToAnchor:v16];

    id v17 = [v7 trailingAnchor];
    v18 = [v5 trailingAnchor];
    v50 = [v17 constraintEqualToAnchor:v18];

    int v19 = [v7 heightAnchor];
    v49 = [v19 constraintEqualToConstant:44.0];

    uint64_t v20 = [MEMORY[0x263F824E8] buttonWithType:0];
    [(TVRMessageView *)self setTurnOnWiFiButton:v20];

    turnOnWiFiButton = self->_turnOnWiFiButton;
    double v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v23 = [v22 localizedStringForKey:@"TVRemoteUITurnOnButtonTitleString" value:&stru_26DB4CAE0 table:@"Localizable"];
    [(UIButton *)turnOnWiFiButton setTitle:v23 forState:0];

    unint64_t v24 = [(UIButton *)self->_turnOnWiFiButton layer];
    [v24 setCornerRadius:8.0];

    v25 = [(TVRMessageView *)self styleProvider];
    uint64_t v26 = [v25 buttonTextColor];
    id v27 = [(UIButton *)self->_turnOnWiFiButton titleLabel];
    [v27 setTextColor:v26];

    v28 = [(TVRMessageView *)self styleProvider];
    v29 = [v28 fontForWiFiButton];
    id v30 = [(UIButton *)self->_turnOnWiFiButton titleLabel];
    [v30 setFont:v29];

    [(UIButton *)self->_turnOnWiFiButton setTranslatesAutoresizingMaskIntoConstraints:0];
    double v31 = [MEMORY[0x263F825C8] colorWithDisplayP3Red:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.3];
    [(UIButton *)self->_turnOnWiFiButton setBackgroundColor:v31];

    [(UIButton *)self->_turnOnWiFiButton addTarget:self action:sel__turnOnWireless_ forControlEvents:64];
    v48 = v5;
    [v5 addSubview:self->_turnOnWiFiButton];
    double v32 = [(UIButton *)self->_turnOnWiFiButton topAnchor];
    id v33 = [v7 bottomAnchor];
    v47 = [v32 constraintEqualToAnchor:v33 constant:16.0];

    double v34 = [(UIButton *)self->_turnOnWiFiButton centerXAnchor];
    v35 = [v5 centerXAnchor];
    uint64_t v36 = [v34 constraintEqualToAnchor:v35];

    v37 = [(UIButton *)self->_turnOnWiFiButton heightAnchor];
    v38 = [v37 constraintEqualToConstant:44.0];

    v39 = [(UIButton *)self->_turnOnWiFiButton widthAnchor];
    uint64_t v40 = [v39 constraintEqualToConstant:281.0];

    double v41 = (void *)MEMORY[0x263F08938];
    v56[0] = v55;
    v56[1] = v51;
    v56[2] = v50;
    v56[3] = v49;
    v56[4] = v47;
    v56[5] = v36;
    v56[6] = v38;
    v56[7] = v40;
    double v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:8];
    [v41 activateConstraints:v42];

    [(TVRMessageView *)self bounds];
    double v44 = v43;
    objc_msgSend(v7, "sizeThatFits:", v43, v45);
    objc_msgSend(v48, "setBounds:", 0.0, 0.0, v44, v46 + 44.0 + 20.0);
    [(TVRMessageView *)self setCurrentView:v48];
    [(TVRMessageView *)self setMessageType:3];
  }
}

- (void)showLoadingSpinner
{
  int v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TVRemoteUIConnectingString" value:&stru_26DB4CAE0 table:@"Localizable"];
  [(TVRMessageView *)self frame];
  id v7 = -[TVRMessageView _loadingViewWithTitle:forSize:](self, "_loadingViewWithTitle:forSize:", v4, v5, v6);
  [(TVRMessageView *)self setCurrentView:v7];

  [(TVRMessageView *)self setMessageType:5];
}

- (void)showSearchingSpinner
{
  int v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TVRemoteUISearchingString" value:&stru_26DB4CAE0 table:@"Localizable"];
  [(TVRMessageView *)self frame];
  id v7 = -[TVRMessageView _loadingViewWithTitle:forSize:](self, "_loadingViewWithTitle:forSize:", v4, v5, v6);
  [(TVRMessageView *)self setCurrentView:v7];

  [(TVRMessageView *)self setMessageType:6];
}

- (void)clearContent
{
  [(TVRMessageView *)self setCurrentView:0];
  [(TVRMessageView *)self setTurnOnWiFiButton:0];
  [(TVRMessageView *)self setUserInteractionEnabled:0];
  [(TVRMessageView *)self setMessageType:0];
}

- (id)_localizedLegacyPairingMessageForDeviceModel
{
  double v2 = (void *)MGCopyAnswer();
  int v3 = [v2 intValue];
  id v4 = @"TVRemoteUILegacyPairingTopMessage_IPHONE";
  if (v3 == 2) {
    id v4 = @"TVRemoteUILegacyPairingTopMessage_IPOD";
  }
  if (v3 == 3) {
    double v5 = @"TVRemoteUILegacyPairingTopMessage_IPAD";
  }
  else {
    double v5 = v4;
  }
  double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:v5 value:&stru_26DB4CAE0 table:@"Localizable"];

  return v7;
}

- (void)setCurrentView:(id)a3
{
  id v5 = a3;
  [(UIView *)self->_currentView removeFromSuperview];
  if (v5)
  {
    objc_storeStrong((id *)&self->_currentView, a3);
    [(TVRMessageView *)self addSubview:self->_currentView];
  }
  [(TVRMessageView *)self setNeedsLayout];
}

- (id)_loadingViewWithTitle:(id)a3 forSize:(CGSize)a4
{
  double width = a4.width;
  v44[5] = *MEMORY[0x263EF8340];
  double v6 = (objc_class *)MEMORY[0x263F82E00];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = objc_alloc_init(MEMORY[0x263F823E8]);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setActivityIndicatorViewStyle:101];
  id v10 = [(TVRMessageView *)self styleProvider];
  id v11 = [v10 colorForSpinner];
  [v9 setColor:v11];

  [v9 startAnimating];
  id v12 = [(TVRMessageView *)self styleProvider];
  double v43 = [v12 fontForSpinnerTitle];

  id v13 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v13 setFont:v43];
  [v13 setAdjustsFontSizeToFitWidth:1];
  [v13 setNumberOfLines:1];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v14) = 1148846080;
  [v13 setContentCompressionResistancePriority:0 forAxis:v14];
  [v13 setTextAlignment:1];
  [v13 setText:v7];

  double v15 = [(TVRMessageView *)self styleProvider];
  double v16 = [v15 textColorForSpinnerTitle];
  [v13 setTextColor:v16];

  [v8 addSubview:v9];
  [v8 addSubview:v13];
  double v42 = [v8 layer];
  [v42 setAllowsGroupOpacity:0];
  [v42 setAllowsGroupBlending:0];
  id v17 = [v9 topAnchor];
  v18 = [v8 topAnchor];
  double v41 = [v17 constraintEqualToAnchor:v18];

  int v19 = [v9 centerXAnchor];
  uint64_t v20 = [v8 centerXAnchor];
  double v21 = [v19 constraintEqualToAnchor:v20];

  double v22 = [v13 bottomAnchor];
  uint64_t v23 = [v8 bottomAnchor];
  unint64_t v24 = [v22 constraintEqualToAnchor:v23];

  v25 = [v13 leadingAnchor];
  uint64_t v26 = [v8 leadingAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];

  v28 = [v13 trailingAnchor];
  v29 = [v8 trailingAnchor];
  id v30 = [v28 constraintEqualToAnchor:v29];

  double v31 = (void *)MEMORY[0x263F08938];
  v44[0] = v41;
  v44[1] = v21;
  v44[2] = v24;
  v44[3] = v27;
  v44[4] = v30;
  double v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:5];
  [v31 activateConstraints:v32];

  [v9 intrinsicContentSize];
  double v34 = v33;
  double v36 = v35;
  [v13 intrinsicContentSize];
  if (v34 >= v37) {
    double v37 = v34;
  }
  if (v37 >= width) {
    double v39 = width;
  }
  else {
    double v39 = v37;
  }
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v39, v36 + v38 + 10.0);

  return v8;
}

- (BOOL)_largeAccessibilityFontSizesEnabled
{
  double v2 = [MEMORY[0x263F825F8] system];
  int v3 = [v2 preferredContentSizeCategory];

  BOOL v4 = UIContentSizeCategoryIsAccessibilityCategory(v3)
    && ([(NSString *)v3 isEqualToString:*MEMORY[0x263F83408]]
     || [(NSString *)v3 isEqualToString:*MEMORY[0x263F83400]]);

  return v4;
}

- (id)_deviceTypeString
{
  double v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return @"Pad";
  }
  id v5 = [MEMORY[0x263F82670] currentDevice];
  double v6 = [v5 model];
  int v7 = [v6 containsString:@"iPod"];

  if (v7) {
    return @"Pod";
  }
  else {
    return @"Phone";
  }
}

- (void)_turnOnWireless:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F86340]);
  if ([v4 powered])
  {
    [v4 setUserAutoJoinState:1];
    id v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      double v6 = "Wi-Fi already powered on. Now enabling auto-join state.";
LABEL_6:
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    [v4 setPowered:1];
    id v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      double v6 = "Requested turning on Wi-Fi in response to user action";
      goto LABEL_6;
    }
  }

  [(TVRMessageView *)self setWifiConnectInProgress:1];
  [(TVRMessageView *)self showLoadingSpinner];
  objc_initWeak(buf, self);
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__TVRMessageView__turnOnWireless___block_invoke;
  block[3] = &unk_264800468;
  objc_copyWeak(&v9, buf);
  dispatch_after(v7, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __34__TVRMessageView__turnOnWireless___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v3 setWifiConnectInProgress:0];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  dispatch_time_t v7 = [(TVRMessageView *)self turnOnWiFiButton];

  if (!v7) {
    return 0;
  }
  id v8 = [(TVRMessageView *)self turnOnWiFiButton];
  -[TVRMessageView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  id v13 = [(TVRMessageView *)self turnOnWiFiButton];
  [v13 bounds];
  v24.double x = v10;
  v24.double y = v12;
  BOOL v14 = CGRectContainsPoint(v25, v24);

  double v15 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = [(TVRMessageView *)self turnOnWiFiButton];
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v14;
    __int16 v21 = 1024;
    int v22 = [v16 isEnabled];
    _os_log_impl(&dword_227326000, v15, OS_LOG_TYPE_DEFAULT, "#debug pointinsidebutton %d %d", (uint8_t *)&buf, 0xEu);
  }
  if (!v14) {
    return 0;
  }
  objc_initWeak(&buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__TVRMessageView_pointInside_withEvent___block_invoke;
  block[3] = &unk_264800468;
  objc_copyWeak(&v19, &buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&buf);
  return 1;
}

void __40__TVRMessageView_pointInside_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _turnOnWireless:0];
    id WeakRetained = v2;
  }
}

- (id)_convertToAttributedStringWithReplacement:(id)a3 imagePointSize:(double)a4
{
  id v5 = a3;
  if (_convertToAttributedStringWithReplacement_imagePointSize__onceToken != -1) {
    dispatch_once(&_convertToAttributedStringWithReplacement_imagePointSize__onceToken, &__block_literal_global_2);
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [v5 length];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_2;
  v19[3] = &unk_2648004B8;
  id v8 = v6;
  id v20 = v8;
  objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, v19);
  if ([v8 count])
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v5];
    CGFloat v10 = [MEMORY[0x263F82818] configurationWithPointSize:7 weight:a4];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_4;
    v16[3] = &unk_2648004E0;
    id v17 = v10;
    id v11 = v9;
    id v18 = v11;
    id v12 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v16];
    id v13 = v18;
    id v14 = v11;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke()
{
  v0 = (void *)_convertToAttributedStringWithReplacement_imagePointSize____unicodeToImageMapping;
  _convertToAttributedStringWithReplacement_imagePointSize____unicodeToImageMapping = (uint64_t)&unk_26DB65CE0;
}

void __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = (void *)_convertToAttributedStringWithReplacement_imagePointSize____unicodeToImageMapping;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_3;
  v10[3] = &unk_264800490;
  id v11 = v7;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  id v9 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];
}

void __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ([*(id *)(a1 + 32) isEqualToString:a2])
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
    [v5 setObject:v7 forKey:v6];
  }
}

void __75__TVRMessageView__convertToAttributedStringWithReplacement_imagePointSize___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F827E8];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v15 = [v5 systemImageNamed:a3 withConfiguration:v6];
  id v8 = objc_alloc_init(MEMORY[0x263F81678]);
  id v9 = [v15 imageWithRenderingMode:2];
  [v8 setImage:v9];

  CGFloat v10 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v8];
  id v11 = *(void **)(a1 + 40);
  uint64_t v12 = [v7 rangeValue];
  uint64_t v14 = v13;

  objc_msgSend(v11, "replaceCharactersInRange:withAttributedString:", v12, v14, v10);
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (UIView)currentView
{
  return self->_currentView;
}

- (UIButton)turnOnWiFiButton
{
  return self->_turnOnWiFiButton;
}

- (void)setTurnOnWiFiButton:(id)a3
{
}

- (BOOL)isWifiConnectInProgress
{
  return self->_wifiConnectInProgress;
}

- (void)setWifiConnectInProgress:(BOOL)a3
{
  self->_wifiConnectInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnOnWiFiButton, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end