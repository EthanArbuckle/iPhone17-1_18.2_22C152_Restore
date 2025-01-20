@interface COSApplicationLinkCell
- (BOOL)useInlineInstallButtonUI;
- (COSApplicationLabelAccessoryView)labelAccessoryView;
- (COSApplicationLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (COSInstallSpinnerButton)installSpinnerButton;
- (NSString)appID;
- (UIButton)installButton;
- (UIColor)disabledColor;
- (UIColor)enabledColor;
- (id)cachedInstalledProgressByAppID;
- (id)device;
- (void)dealloc;
- (void)installApp;
- (void)installNanoBundle:(id)a3 forDevice:(id)a4;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setAppID:(id)a3;
- (void)setDisabledColor:(id)a3;
- (void)setEnabledColor:(id)a3;
- (void)setInstallButton:(id)a3;
- (void)setInstallSpinnerButton:(id)a3;
- (void)setLabelAccessoryView:(id)a3;
- (void)setUseInlineInstallButtonUI:(BOOL)a3;
- (void)stopInstallation;
- (void)updateProgress:(id)a3;
@end

@implementation COSApplicationLinkCell

- (COSApplicationLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v46.receiver = self;
  v46.super_class = (Class)COSApplicationLinkCell;
  v9 = [(COSApplicationLinkCell *)&v46 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:@"COSApplicationIsBeta"];
    if ([v10 BOOLValue])
    {
      v11 = [[COSApplicationLabelAccessoryView alloc] initWithLabelAccessoryType:1];
      labelAccessoryView = v9->_labelAccessoryView;
      v9->_labelAccessoryView = v11;

      v13 = [(COSApplicationLinkCell *)v9 contentView];
      [v13 addSubview:v9->_labelAccessoryView];
    }
    v14 = [v8 propertyForKey:BPSNotificationAppBBSectionInfo];
    uint64_t v15 = [v14 sectionID];
    appID = v9->_appID;
    v9->_appID = (NSString *)v15;

    if (!v9->_appID)
    {
      v9->_appID = (NSString *)@"none";
    }
    v17 = [v8 propertyForKey:@"COSSockPuppetAppSectionKey"];
    v9->_useInlineInstallButtonUI = v17 != 0;

    if (v9->_useInlineInstallButtonUI)
    {
      uint64_t v18 = +[UIColor systemOrangeColor];
      enabledColor = v9->_enabledColor;
      v9->_enabledColor = (UIColor *)v18;

      double v44 = 0.0;
      double v45 = 0.0;
      double v43 = 0.0;
      v20 = +[UIColor systemOrangeColor];
      [v20 getRed:&v45 green:&v44 blue:&v43 alpha:0];

      double v22 = v44;
      double v21 = v45;
      double v23 = v43;
      UIInterfaceGetContentDisabledAlpha();
      uint64_t v25 = +[UIColor colorWithRed:v21 green:v22 blue:v23 alpha:v24];
      disabledColor = v9->_disabledColor;
      v9->_disabledColor = (UIColor *)v25;

      uint64_t v27 = +[UIButton buttonWithType:1];
      installButton = v9->_installButton;
      v9->_installButton = (UIButton *)v27;

      v29 = [(UIButton *)v9->_installButton layer];
      [v29 setBorderWidth:1.0];

      v30 = [(UIButton *)v9->_installButton layer];
      [v30 setCornerRadius:3.0];

      v31 = v9->_installButton;
      v32 = +[NSBundle mainBundle];
      v33 = [v32 localizedStringForKey:@"INSTALL_SUGGESTED_APP_BUTTON" value:&stru_100249230 table:@"Localizable"];
      [(UIButton *)v31 setTitle:v33 forState:0];

      [(UIButton *)v9->_installButton setTitleColor:v9->_enabledColor forState:0];
      [(UIButton *)v9->_installButton setTitleColor:v9->_disabledColor forState:2];
      -[UIButton setContentEdgeInsets:](v9->_installButton, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
      [(UIButton *)v9->_installButton setAlpha:1.0];
      v34 = [(UIButton *)v9->_installButton titleLabel];
      v35 = +[UIFont systemFontOfSize:14.0];
      [v34 setFont:v35];

      [(UIButton *)v9->_installButton addTarget:v9 action:"installApp" forEvents:64];
      v36 = [(COSApplicationLinkCell *)v9 contentView];
      [v36 addSubview:v9->_installButton];

      v37 = objc_alloc_init(COSInstallSpinnerButton);
      installSpinnerButton = v9->_installSpinnerButton;
      v9->_installSpinnerButton = v37;

      [(COSInstallSpinnerButton *)v9->_installSpinnerButton addTarget:v9 action:"stopInstallation" forEvents:64];
      v39 = [(COSApplicationLinkCell *)v9 contentView];
      [v39 addSubview:v9->_installSpinnerButton];

      v40 = [v8 propertyForKey:@"COSSockPuppetInstallationState"];
      if ([v40 integerValue] != (id)1)
      {
        v41 = [(COSApplicationLinkCell *)v9 cachedInstalledProgressByAppID];
        [v41 removeObjectForKey:v9->_appID];
      }
    }
  }
  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSApplicationLinkCell;
  [(COSApplicationLinkCell *)&v4 dealloc];
}

- (id)device
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 activeWatch];

  return v3;
}

- (void)installNanoBundle:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[COSApplicationLinkCell installNanoBundle:forDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = +[ACXDeviceConnection sharedDeviceConnection];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035550;
  v11[3] = &unk_100243B48;
  id v12 = v6;
  v13 = self;
  id v10 = v6;
  [v9 installApplication:v10 onPairedDevice:v7 completion:v11];
}

- (void)installApp
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[COSApplicationLinkCell installApp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_super v4 = (id *)&self->BPSLinkCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained propertyForKey:BPSNotificationAppBBSectionInfo];
  id v7 = [v6 sectionID];

  id v8 = [(COSApplicationLinkCell *)self device];
  id v9 = objc_loadWeakRetained(v4);
  [v9 setProperty:&off_10025BE90 forKey:@"COSSockPuppetInstallationState"];

  int HasCapabilityForString = BPSDeviceHasCapabilityForString();
  v11 = pbb_bridge_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (HasCapabilityForString)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v31 = v7;
      __int16 v32 = 2112;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Check if app %@ needs update for %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v13 = +[ACXDeviceConnection sharedDeviceConnection];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100035BD4;
    v26[3] = &unk_1002442E0;
    objc_copyWeak(&v29, (id *)buf);
    uint64_t v27 = v7;
    id v28 = v8;
    [v13 fetchLocallyAvailableApplicationWithBundleID:v27 forPairedDevice:v28 completion:v26];

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "app update check not needed", buf, 2u);
    }

    [(COSApplicationLinkCell *)self installNanoBundle:v7 forDevice:v8];
  }
  id v14 = objc_loadWeakRetained(v4);
  uint64_t v15 = [v14 target];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v17 = objc_loadWeakRetained(v4);
    uint64_t v18 = [v17 propertyForKey:@"COSSockPuppetAppSectionKey"];
    id v19 = [v18 integerValue];

    BOOL v20 = v19 == (id)1;
    id v21 = objc_loadWeakRetained(v4);
    double v22 = [v21 target];
    id v23 = objc_loadWeakRetained(v4);
    double v24 = [v23 propertyForKey:@"COSSockPuppetAppBundleIDKey"];
    [v22 registerRecentlyInstallingAppID:v24 isSuggested:v20];
  }
  id v25 = objc_loadWeakRetained(v4);
  [(COSApplicationLinkCell *)self refreshCellContentsWithSpecifier:v25];

  [(COSApplicationLinkCell *)self setNeedsLayout];
}

- (void)stopInstallation
{
  v3 = (id *)&self->BPSLinkCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained propertyForKey:BPSNotificationAppBBSectionInfo];
  id v6 = [v5 sectionID];

  id v7 = +[ACXDeviceConnection sharedDeviceConnection];
  id v8 = [(COSApplicationLinkCell *)self device];
  id v9 = objc_loadWeakRetained(v3);
  [v9 setProperty:&off_10025BEA8 forKey:@"COSSockPuppetInstallationState"];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003608C;
  v12[3] = &unk_100244308;
  id v13 = v6;
  id v10 = v6;
  [v7 removeApplication:v10 fromPairedDevice:v8 completionWithError:v12];
  id v11 = objc_loadWeakRetained(v3);
  [(COSApplicationLinkCell *)self refreshCellContentsWithSpecifier:v11];

  [(COSApplicationLinkCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v91.receiver = self;
  v91.super_class = (Class)COSApplicationLinkCell;
  [(COSApplicationLinkCell *)&v91 layoutSubviews];
  [(COSApplicationLinkCell *)self bounds];
  CGFloat v88 = v4;
  CGFloat v89 = v3;
  CGFloat v86 = v6;
  CGFloat v87 = v5;
  id v7 = [(COSApplicationLinkCell *)self textLabel];
  id v8 = [(COSApplicationLinkCell *)self detailTextLabel];
  [v7 frame];
  double v10 = v9;
  double rect = v11;
  double v13 = v12;
  double v15 = v14;
  unsigned int v16 = [(COSApplicationLinkCell *)self _shouldReverseLayoutDirection];
  labelAccessoryView = self->_labelAccessoryView;
  if (labelAccessoryView)
  {
    [(COSApplicationLabelAccessoryView *)labelAccessoryView frame];
    double v19 = v18;
    double v21 = v20;
    if (v16)
    {
      double v22 = [(COSApplicationLinkCell *)self iconImageView];
      [v22 frame];
      double v23 = CGRectGetMinX(v92) - v19 + -6.0;

      double v24 = v10 + -6.0;
    }
    else
    {
      double v24 = v10 + v18 + 6.0;
      double v23 = v10;
    }
    -[COSApplicationLabelAccessoryView setFrame:](self->_labelAccessoryView, "setFrame:", v23, rect + floor((v15 - v21) * 0.5), v19, v21);
    v93.origin.x = v24;
    v93.origin.y = rect;
    v93.size.width = v13;
    v93.size.height = v15;
    double MaxX = CGRectGetMaxX(v93);
    v26 = [(COSApplicationLinkCell *)self contentView];
    [v26 frame];
    double v27 = CGRectGetMaxX(v94);

    double v28 = v24 - v10;
    if (MaxX < v27) {
      double v28 = 0.0;
    }
    double v13 = v13 - v28;
    double v10 = v24;
  }
  if (self->_useInlineInstallButtonUI)
  {
    v84 = v8;
    id v29 = (id *)&self->BPSLinkCell_opaque[OBJC_IVAR___PSTableCell__specifier];
    id WeakRetained = objc_loadWeakRetained(v29);
    v31 = [WeakRetained propertyForKey:@"COSSockPuppetInstallationState"];

    id v32 = [v31 integerValue];
    p_installButton = &self->_installButton;
    [(UIButton *)self->_installButton sizeToFit];
    [(UIButton *)self->_installButton frame];
    double v35 = v34 + 5.0;
    double v37 = v36 + -4.0;
    v95.origin.y = v88;
    v95.origin.x = v89;
    v95.size.height = v86;
    v95.size.width = v87;
    double v38 = (CGRectGetHeight(v95) - v37) * 0.5;
    double v39 = 15.0;
    if ((v16 & 1) == 0)
    {
      v96.origin.y = v88;
      v96.origin.x = v89;
      v96.size.height = v86;
      v96.size.width = v87;
      double v39 = CGRectGetWidth(v96) - (v35 + 15.0);
    }
    -[UIButton setFrame:](*p_installButton, "setFrame:", v39, v38, v35, v37);
    v40 = [(COSApplicationLinkCell *)self iconImageView];
    [v40 frame];
    p_installSpinnerButton = (id *)&self->_installSpinnerButton;
    -[COSInstallSpinnerButton setFrame:](self->_installSpinnerButton, "setFrame:");

    [(UIButton *)*p_installButton center];
    -[COSInstallSpinnerButton setCenter:](self->_installSpinnerButton, "setCenter:");
    [(COSInstallSpinnerButton *)self->_installSpinnerButton frame];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [(UIButton *)*p_installButton frame];
    if (v16) {
      double MinX = CGRectGetMinX(*(CGRect *)&v48);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v48) - v45;
    }
    [*p_installSpinnerButton setFrame:MinX, v43, v45, v47];
    v53 = [(COSApplicationLinkCell *)self iconImageView];
    [v53 frame];

    if (v32 == (id)2 || v32 == (id)4)
    {
      [(UIButton *)*p_installButton setHidden:1];
      [*p_installSpinnerButton setHidden:1];
      if (v32 == (id)2)
      {
        id v54 = objc_loadWeakRetained(v29);
        v55 = [v54 propertyForKey:@"COSSockPuppetAppSectionKey"];
        id v56 = [v55 integerValue];

        if (v56 == (id)1) {
          [(COSApplicationLinkCell *)self setAccessoryType:0];
        }
      }

      id v8 = v84;
    }
    else
    {
      id v77 = objc_loadWeakRetained(v29);
      v78 = [v77 propertyForKey:@"COSSockPuppetInstallationState"];

      id v79 = [v78 integerValue];
      v80 = *p_installButton;
      if (v79 == (id)1)
      {
        [(UIButton *)v80 setHidden:1];
        [*p_installSpinnerButton setHidden:0];
        [*p_installSpinnerButton showProgressAnimation];
      }
      else
      {
        [(UIButton *)v80 setHidden:0];
        [*p_installSpinnerButton setHidden:1];
        [*p_installSpinnerButton stopProgressAnimation];
        p_installSpinnerButton = (id *)&self->_installButton;
      }
      id v8 = v84;
      id v58 = *p_installSpinnerButton;
      [(COSApplicationLinkCell *)self setAccessoryType:0];

      if (v58)
      {
        double v57 = v10;
        [v58 size];
        double v60 = v82;
        double v61 = 15.0;
        goto LABEL_21;
      }
    }
  }
  double v57 = v10;
  id v58 = v8;
  [v58 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
  double v60 = v59;
  double v61 = 35.0;
LABEL_21:
  double v85 = v61;
  [v58 frame];
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  v70 = [(COSApplicationLinkCell *)self traitCollection];
  v71 = [v70 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v71);

  if (v58)
  {
    v97.origin.x = v63;
    v97.origin.y = v65;
    v97.size.width = v67;
    v97.size.height = v69;
    char v73 = CGRectGetWidth(v97) <= 0.0 || IsAccessibilityCategory;
    if ((v73 & 1) == 0)
    {
      if (v16)
      {
        v98.origin.x = v57;
        v98.origin.y = rect;
        v98.size.width = v13;
        v98.size.height = v15;
        double v74 = CGRectGetMinX(v98);
        v99.origin.x = v63;
        v99.origin.y = v65;
        v99.size.width = v67;
        v99.size.height = v69;
        double v75 = v74 - CGRectGetMaxX(v99);
        if (v75 < 0.0)
        {
          double v76 = v75 + -6.0;
          double v13 = v13 + v76;
          double v57 = v57 - v76;
        }
      }
      else
      {
        v100.origin.x = v63;
        v100.origin.y = v65;
        v100.size.width = v67;
        v100.size.height = v69;
        CGFloat v83 = CGRectGetMaxX(v100) - v60;
        v101.origin.x = v57;
        v101.origin.y = rect;
        v101.size.width = v13;
        v101.size.height = v15;
        double v81 = v83 - (CGRectGetMaxX(v101) + 6.0);
        if (v81 < 0.0)
        {
          double v13 = v13 + v81;
          v102.origin.y = v88;
          v102.origin.x = v89;
          v102.size.height = v86;
          v102.size.width = v87;
          double v63 = CGRectGetWidth(v102) - (v85 + v60);
          double v67 = v60;
        }
      }
    }
  }
  [v58 setFrame:v63, v65, v67, v69];
  [v7 setFrame:v57 rect:v13 v15];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)COSApplicationLinkCell;
  id v4 = a3;
  [(COSApplicationLinkCell *)&v26 refreshCellContentsWithSpecifier:v4];
  double v5 = [v4 propertyForKey:@"COSSockPuppetInstallationState"];
  id v6 = [v5 integerValue];
  id v7 = [v4 propertyForKey:PSEnabledKey];

  -[UIButton setEnabled:](self->_installButton, "setEnabled:", [v7 BOOLValue]);
  if ([(UIButton *)self->_installButton isEnabled]) {
    id v8 = &OBJC_IVAR___COSApplicationLinkCell__enabledColor;
  }
  else {
    id v8 = &OBJC_IVAR___COSApplicationLinkCell__disabledColor;
  }
  id v9 = [(COSApplicationLinkCell *)self _accessibilityHigherContrastTintColorForColor:*(void *)&self->BPSLinkCell_opaque[*v8]];
  id v10 = [v9 CGColor];
  double v11 = [(UIButton *)self->_installButton layer];
  [v11 setBorderColor:v10];

  installButton = self->_installButton;
  double v13 = [(COSApplicationLinkCell *)self _accessibilityHigherContrastTintColorForColor:self->_enabledColor];
  [(UIButton *)installButton setTitleColor:v13 forState:0];

  double v14 = self->_installButton;
  double v15 = [(COSApplicationLinkCell *)self _accessibilityHigherContrastTintColorForColor:self->_disabledColor];
  [(UIButton *)v14 setTitleColor:v15 forState:2];

  if (v6 == (id)1)
  {
    if (self->_useInlineInstallButtonUI)
    {
      unsigned int v16 = &stru_100249230;
    }
    else
    {
      double v20 = +[NSBundle mainBundle];
      unsigned int v16 = [v20 localizedStringForKey:@"GIZMO_APP_INSTALLING" value:&stru_100249230 table:@"Localizable"];
    }
    double v18 = +[NSNotificationCenter defaultCenter];
    [v18 removeObserver:self name:@"COSInstallProgressNotificationName" object:0];
    [v18 addObserver:self selector:"updateProgress:" name:@"COSInstallProgressNotificationName" object:0];
    double v21 = [(COSApplicationLinkCell *)self cachedInstalledProgressByAppID];
    double v22 = [v21 objectForKey:self->_appID];
    [v22 floatValue];
    double v24 = v23;

    [(COSInstallSpinnerButton *)self->_installSpinnerButton setProgress:0 animated:v24];
    goto LABEL_16;
  }
  if (v6 == (id)4)
  {
    id v17 = +[NSBundle mainBundle];
    double v18 = v17;
    CFStringRef v19 = @"GIZMO_APP_UNINSTALLING";
LABEL_13:
    unsigned int v16 = [v17 localizedStringForKey:v19 value:&stru_100249230 table:@"Localizable"];
LABEL_16:

    goto LABEL_17;
  }
  unsigned int v16 = 0;
  if (v6 == (id)2)
  {
    if (self->_useInlineInstallButtonUI)
    {
      unsigned int v16 = &stru_100249230;
      goto LABEL_17;
    }
    id v17 = +[NSBundle mainBundle];
    double v18 = v17;
    CFStringRef v19 = @"INSTALLED";
    goto LABEL_13;
  }
LABEL_17:
  id v25 = [(COSApplicationLinkCell *)self detailTextLabel];
  [v25 setText:v16];
}

- (id)cachedInstalledProgressByAppID
{
  if (qword_10029AFC0 != -1) {
    dispatch_once(&qword_10029AFC0, &stru_100244328);
  }
  v2 = (void *)qword_10029AFB8;

  return v2;
}

- (void)updateProgress:(id)a3
{
  id v11 = [a3 object];
  id v4 = [v11 objectForKeyedSubscript:@"appid"];
  double v5 = [(COSApplicationLinkCell *)self appID];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [v11 objectForKeyedSubscript:@"progress"];
    installSpinnerButton = self->_installSpinnerButton;
    [v7 doubleValue];
    -[COSInstallSpinnerButton setProgress:animated:](installSpinnerButton, "setProgress:animated:", 1);
    id v9 = [(COSApplicationLinkCell *)self cachedInstalledProgressByAppID];
    id v10 = [(COSApplicationLinkCell *)self appID];
    [v9 setObject:v7 forKey:v10];
  }
  if (!v11) {
    [(COSApplicationLinkCell *)self setNeedsLayout];
  }
}

- (COSApplicationLabelAccessoryView)labelAccessoryView
{
  return self->_labelAccessoryView;
}

- (void)setLabelAccessoryView:(id)a3
{
}

- (BOOL)useInlineInstallButtonUI
{
  return self->_useInlineInstallButtonUI;
}

- (void)setUseInlineInstallButtonUI:(BOOL)a3
{
  self->_useInlineInstallButtonUI = a3;
}

- (UIButton)installButton
{
  return self->_installButton;
}

- (void)setInstallButton:(id)a3
{
}

- (COSInstallSpinnerButton)installSpinnerButton
{
  return self->_installSpinnerButton;
}

- (void)setInstallSpinnerButton:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (UIColor)enabledColor
{
  return self->_enabledColor;
}

- (void)setEnabledColor:(id)a3
{
}

- (UIColor)disabledColor
{
  return self->_disabledColor;
}

- (void)setDisabledColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_enabledColor, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_installSpinnerButton, 0);
  objc_storeStrong((id *)&self->_installButton, 0);

  objc_storeStrong((id *)&self->_labelAccessoryView, 0);
}

@end