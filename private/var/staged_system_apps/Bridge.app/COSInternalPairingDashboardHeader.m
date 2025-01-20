@interface COSInternalPairingDashboardHeader
- (BOOL)enabled;
- (CGRect)_computedFrameForTextLabel;
- (CGRect)_computedFrameForWatchImage;
- (CGSize)sizeThatFits:(CGSize)a3;
- (COSInternalPairingDashboardHeader)initWithFrame:(CGRect)a3;
- (COSWatchView)watchView;
- (NSLayoutConstraint)leadingSpaceConstraint;
- (UILabel)internalDetails;
- (UILabel)productTypeBuildAndVariantDescription;
- (UILabel)titleLabel;
- (UILabel)watchBehavior;
- (UILabel)watchMaterialandSize;
- (UILabel)watchMessage;
- (UILabel)watchName;
- (UIStackView)horizontalStack;
- (UIStackView)watchDetails;
- (UIView)selectedBackGroundView;
- (double)totalHeaderHeight;
- (id)imagePath;
- (unint64_t)deviceState;
- (void)layoutSubviews;
- (void)refreshForWatchDetails:(id)a3;
- (void)setDeviceState:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHorizontalStack:(id)a3;
- (void)setInternalDetails:(id)a3;
- (void)setLeadingSpaceConstraint:(id)a3;
- (void)setProductTypeBuildAndVariantDescription:(id)a3;
- (void)setSelectedBackGroundView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setWatchBehavior:(id)a3;
- (void)setWatchDetails:(id)a3;
- (void)setWatchMaterialandSize:(id)a3;
- (void)setWatchMessage:(id)a3;
- (void)setWatchName:(id)a3;
- (void)setWatchView:(id)a3;
@end

@implementation COSInternalPairingDashboardHeader

- (COSInternalPairingDashboardHeader)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)COSInternalPairingDashboardHeader;
  v3 = -[COSInternalPairingDashboardHeader initWithFrame:](&v40, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = BPSSetupBackgroundColor();
    [(COSInternalPairingDashboardHeader *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v7 = v3->_titleLabel;
    v8 = +[UIFont systemFontOfSize:24.0 weight:UIFontWeightMedium];
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)v3->_titleLabel setText:@"Pairing Dashboard [Internal]"];
    [(UILabel *)v3->_titleLabel setNumberOfLines:2];
    v9 = v3->_titleLabel;
    v10 = BPSTextColor();
    [(UILabel *)v9 setTextColor:v10];

    uint64_t v11 = objc_opt_new();
    horizontalStack = v3->_horizontalStack;
    v3->_horizontalStack = (UIStackView *)v11;

    [(UIStackView *)v3->_horizontalStack setAxis:0];
    v13 = [[COSWatchView alloc] initWithStyle:3];
    watchView = v3->_watchView;
    v3->_watchView = v13;

    [(UIStackView *)v3->_horizontalStack addArrangedSubview:v3->_watchView];
    v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    v16 = [v15 _fontScaledByScaleFactor:0.933333333];

    v17 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    watchDetails = v3->_watchDetails;
    v3->_watchDetails = v17;

    [(UIStackView *)v3->_watchDetails setAxis:1];
    id v19 = v16;
    v20 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v20 setFont:v19];

    [(UILabel *)v20 setNumberOfLines:0];
    v21 = BPSTextColor();
    [(UILabel *)v20 setTextColor:v21];

    [(UILabel *)v20 setHighlighted:1];
    -[UILabel setSize:](v20, "setSize:", 14.0, 14.0);
    LODWORD(v22) = 1058642330;
    [(UILabel *)v20 _setHyphenationFactor:v22];
    [(UILabel *)v20 setLineBreakMode:0];
    watchName = v3->_watchName;
    v3->_watchName = v20;

    [(UILabel *)v3->_watchName setText:@"Watch Name (Advertising Name)"];
    [(UIStackView *)v3->_watchDetails addArrangedSubview:v3->_watchName];
    id v24 = v19;
    v25 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v25 setFont:v24];

    [(UILabel *)v25 setNumberOfLines:0];
    v26 = BPSTextColor();
    [(UILabel *)v25 setTextColor:v26];

    [(UILabel *)v25 setHighlighted:1];
    -[UILabel setSize:](v25, "setSize:", 14.0, 14.0);
    LODWORD(v27) = 1058642330;
    [(UILabel *)v25 _setHyphenationFactor:v27];
    [(UILabel *)v25 setLineBreakMode:0];
    productTypeBuildAndVariantDescription = v3->_productTypeBuildAndVariantDescription;
    v3->_productTypeBuildAndVariantDescription = v25;

    [(UILabel *)v3->_productTypeBuildAndVariantDescription setText:@"HWModel / ProductType / BuildVersion"];
    [(UIStackView *)v3->_watchDetails addArrangedSubview:v3->_productTypeBuildAndVariantDescription];
    id v29 = v24;
    v30 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v30 setFont:v29];

    [(UILabel *)v30 setNumberOfLines:0];
    v31 = BPSTextColor();
    [(UILabel *)v30 setTextColor:v31];

    [(UILabel *)v30 setHighlighted:1];
    -[UILabel setSize:](v30, "setSize:", 14.0, 14.0);
    LODWORD(v32) = 1058642330;
    [(UILabel *)v30 _setHyphenationFactor:v32];
    [(UILabel *)v30 setLineBreakMode:0];
    watchMaterialandSize = v3->_watchMaterialandSize;
    v3->_watchMaterialandSize = v30;

    [(UILabel *)v3->_watchMaterialandSize setText:@"Material / Size"];
    [(UIStackView *)v3->_watchDetails addArrangedSubview:v3->_watchMaterialandSize];
    id v34 = v29;
    v35 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v35 setFont:v34];

    [(UILabel *)v35 setNumberOfLines:0];
    v36 = BPSTextColor();
    [(UILabel *)v35 setTextColor:v36];

    [(UILabel *)v35 setHighlighted:1];
    -[UILabel setSize:](v35, "setSize:", 14.0, 14.0);
    LODWORD(v37) = 1058642330;
    [(UILabel *)v35 _setHyphenationFactor:v37];
    [(UILabel *)v35 setLineBreakMode:0];
    internalDetails = v3->_internalDetails;
    v3->_internalDetails = v35;

    [(UILabel *)v3->_internalDetails setText:@"Internal Details"];
    [(UIStackView *)v3->_watchDetails addArrangedSubview:v3->_internalDetails];
    [(UIStackView *)v3->_horizontalStack addArrangedSubview:v3->_watchDetails];
    [(COSInternalPairingDashboardHeader *)v3 addSubview:v3->_titleLabel];
    [(COSInternalPairingDashboardHeader *)v3 addSubview:v3->_horizontalStack];
  }
  return v3;
}

- (id)imagePath
{
  return @"DeviceAssets/Screen-Carousel-v6";
}

- (CGRect)_computedFrameForTextLabel
{
  [(COSInternalPairingDashboardHeader *)self bounds];
  double v2 = CGRectGetWidth(v6) + -28.0;
  double v3 = 50.0;
  double v4 = 14.0;
  double v5 = 7.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_computedFrameForWatchImage
{
  double v2 = 140.0;
  double v3 = 103.0;
  double v4 = 113.0;
  double v5 = 14.0;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v5;
  return result;
}

- (void)layoutSubviews
{
  titleLabel = self->_titleLabel;
  [(COSInternalPairingDashboardHeader *)self _computedFrameForTextLabel];
  -[UILabel setFrame:](titleLabel, "setFrame:");
  watchView = self->_watchView;
  [(COSInternalPairingDashboardHeader *)self _computedFrameForWatchImage];
  -[COSWatchView setFrame:](watchView, "setFrame:");
  horizontalStack = self->_horizontalStack;
  [(COSInternalPairingDashboardHeader *)self bounds];
  -[UIStackView setFrame:](horizontalStack, "setFrame:", 14.0, 64.0, CGRectGetWidth(v8) + -28.0, 136.0);
  [(UIStackView *)self->_horizontalStack setDistribution:2];
  watchDetails = self->_watchDetails;

  [(UIStackView *)watchDetails setDistribution:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(COSInternalPairingDashboardHeader *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(COSInternalPairingDashboardHeader *)self _computedFrameForTextLabel];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGFloat Width = CGRectGetWidth(v24);
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  double v21 = CGRectGetMaxY(v25) + 25.0;
  double v22 = Width;
  result.height = v21;
  result.width = v22;
  return result;
}

- (double)totalHeaderHeight
{
  return 200.0;
}

- (void)refreshForWatchDetails:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForProperty:NRDevicePropertyProductType];
  double v6 = [v4 valueForProperty:NRDevicePropertyArtworkTraits];
  int v7 = MGGetBoolAnswer();
  double v8 = pbb_bridge_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  v45 = self;
  v46 = v6;
  if (v7 && v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      v56 = "-[COSInternalPairingDashboardHeader refreshForWatchDetails:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyArtworkTraits to get PBBDeviceSize", buf, 0xCu);
    }

    double v10 = [v6 objectForKeyedSubscript:@"ArtworkDeviceSubType"];
    [v10 unsignedIntegerValue];

    uint64_t v11 = BPSVariantSizeForArtworkDeviceSubType();
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      v56 = "-[COSInternalPairingDashboardHeader refreshForWatchDetails:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyProductType to get PBBDeviceSize", buf, 0xCu);
    }

    uint64_t v11 = BPSVariantSizeForProductType();
  }
  uint64_t v38 = v11;
  double v12 = +[BPSScreenStringObj screenStringsWithArray:&off_10025BC80];
  uint64_t v13 = BPSGetRelevantScreenStringForProduct();

  double v14 = +[NSBundle mainBundle];
  CGFloat v15 = &stru_100249230;
  v44 = (void *)v13;
  v43 = [v14 localizedStringForKey:v13 value:&stru_100249230 table:@"Pairing"];

  id v39 = +[PBBridgeWatchAttributeController materialFromDevice:v4];
  double v16 = BPSUnlocalizedNameForMaterial();
  uint64_t v17 = [v16 stringByAppendingString:@"_ACTIVE_DEVICE"];

  double v18 = +[NSBundle mainBundle];
  v42 = (void *)v17;
  v41 = [v18 localizedStringForKey:v17 value:&stru_100249230 table:@"Pairing"];

  CGFloat v19 = [v4 valueForProperty:NRDevicePropertySystemBuildVersion];
  v20 = [v4 valueForProperty:NRDevicePropertyName];
  double v21 = [v4 valueForProperty:NRDevicePropertyAdvertisedName];
  [v4 valueForProperty:NRDevicePropertyHWModelString];
  objc_super v40 = v47 = (void *)v5;
  double v22 = [v40 stringByAppendingFormat:@" / %@", v5];
  v23 = [v4 valueForProperty:NRDevicePropertyIsInternalInstall];
  CGRect v24 = v23;
  if (v23)
  {
    unsigned int v25 = [v23 BOOLValue];
    v26 = @"Customer";
    if (v25) {
      v26 = @"Internal";
    }
    CGFloat v15 = v26;
  }
  double v27 = [v4 valueForProperty:NRDevicePropertyIsAltAccount];
  v28 = v27;
  if (v27)
  {
    unsigned int v29 = [v27 BOOLValue];
    CFStringRef v30 = @"Classic";
    if (v29) {
      CFStringRef v30 = @"Tinker";
    }
    uint64_t v31 = [(__CFString *)v15 stringByAppendingFormat:@" / %@", v30];

    CGFloat v15 = (__CFString *)v31;
  }
  if ([v19 length])
  {
    uint64_t v32 = [v22 stringByAppendingFormat:@" / %@", v19];

    double v22 = (void *)v32;
  }
  if ([v21 length])
  {
    uint64_t v33 = [v20 stringByAppendingFormat:@" (%@)", v21];

    v20 = (void *)v33;
  }
  [v41 stringByAppendingFormat:@" / %@", v43];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000421BC;
  block[3] = &unk_100244538;
  block[4] = v45;
  id v49 = v20;
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  id v51 = v22;
  id v53 = v39;
  uint64_t v54 = v38;
  v52 = v15;
  id v34 = v15;
  id v35 = v22;
  id v36 = v50;
  id v37 = v20;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (COSWatchView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
}

- (UIView)selectedBackGroundView
{
  return self->_selectedBackGroundView;
}

- (void)setSelectedBackGroundView:(id)a3
{
}

- (UIStackView)horizontalStack
{
  return self->_horizontalStack;
}

- (void)setHorizontalStack:(id)a3
{
}

- (UIStackView)watchDetails
{
  return self->_watchDetails;
}

- (void)setWatchDetails:(id)a3
{
}

- (NSLayoutConstraint)leadingSpaceConstraint
{
  return self->_leadingSpaceConstraint;
}

- (void)setLeadingSpaceConstraint:(id)a3
{
}

- (UILabel)watchName
{
  return self->_watchName;
}

- (void)setWatchName:(id)a3
{
}

- (UILabel)watchBehavior
{
  return self->_watchBehavior;
}

- (void)setWatchBehavior:(id)a3
{
}

- (UILabel)watchMaterialandSize
{
  return self->_watchMaterialandSize;
}

- (void)setWatchMaterialandSize:(id)a3
{
}

- (UILabel)watchMessage
{
  return self->_watchMessage;
}

- (void)setWatchMessage:(id)a3
{
}

- (UILabel)productTypeBuildAndVariantDescription
{
  return self->_productTypeBuildAndVariantDescription;
}

- (void)setProductTypeBuildAndVariantDescription:(id)a3
{
}

- (UILabel)internalDetails
{
  return self->_internalDetails;
}

- (void)setInternalDetails:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(unint64_t)a3
{
  self->_deviceState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDetails, 0);
  objc_storeStrong((id *)&self->_productTypeBuildAndVariantDescription, 0);
  objc_storeStrong((id *)&self->_watchMessage, 0);
  objc_storeStrong((id *)&self->_watchMaterialandSize, 0);
  objc_storeStrong((id *)&self->_watchBehavior, 0);
  objc_storeStrong((id *)&self->_watchName, 0);
  objc_storeStrong((id *)&self->_leadingSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_watchDetails, 0);
  objc_storeStrong((id *)&self->_horizontalStack, 0);
  objc_storeStrong((id *)&self->_selectedBackGroundView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end