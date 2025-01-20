@interface AirDropNoContentView
- (AirDropNoContentView)initWithFrame:(CGRect)a3;
- (AirDropNoContentViewDelegate)delegate;
- (UIButton)actionButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (unint64_t)viewType;
- (void)actionButtonTapped;
- (void)setActionButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewType:(unint64_t)a3;
- (void)setupConstraints;
@end

@implementation AirDropNoContentView

- (AirDropNoContentView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)AirDropNoContentView;
  v3 = -[AirDropNoContentView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init((Class)UILabel);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 setTextAlignment:1];
    [v4 setNumberOfLines:0];
    v5 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:UIFontTextStyleTitle2 addingSymbolicTraits:32770 options:0];
    v6 = +[UIFont fontWithDescriptor:v5 size:0.0];
    [v4 setFont:v6];

    [(AirDropNoContentView *)v3 setTitleLabel:v4];
    id v7 = objc_alloc_init((Class)UILabel);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setTextAlignment:1];
    [v7 setNumberOfLines:0];
    v8 = +[UIColor secondaryLabelColor];
    [v7 setTextColor:v8];

    v9 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:UIFontTextStyleSubhead];
    v10 = +[UIFont fontWithDescriptor:v9 size:0.0];
    [v7 setFont:v10];

    [(AirDropNoContentView *)v3 setSubtitleLabel:v7];
    v11 = +[UIButton buttonWithType:1];
    v12 = +[UIColor systemBlueColor];
    [v11 setTitleColor:v12 forState:0];

    [v11 setContentHorizontalAlignment:0];
    [v11 addTarget:v3 action:"actionButtonTapped" forControlEvents:64];
    v13 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:0];
    v14 = +[UIFont fontWithDescriptor:v13 size:0.0];
    v15 = [v11 titleLabel];
    [v15 setFont:v14];

    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AirDropNoContentView *)v3 setActionButton:v11];
    v16 = [(AirDropNoContentView *)v3 titleLabel];
    [(AirDropNoContentView *)v3 addSubview:v16];

    v17 = [(AirDropNoContentView *)v3 subtitleLabel];
    [(AirDropNoContentView *)v3 addSubview:v17];

    v18 = [(AirDropNoContentView *)v3 actionButton];
    [(AirDropNoContentView *)v3 addSubview:v18];

    [(AirDropNoContentView *)v3 setupConstraints];
  }
  return v3;
}

- (void)setupConstraints
{
  id v42 = (id)objc_opt_new();
  v3 = [(AirDropNoContentView *)self leadingAnchor];
  id v4 = [(AirDropNoContentView *)self titleLabel];
  v5 = [v4 leadingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  [v42 addObject:v6];

  id v7 = [(AirDropNoContentView *)self trailingAnchor];
  v8 = [(AirDropNoContentView *)self titleLabel];
  v9 = [v8 trailingAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  [v42 addObject:v10];

  v11 = [(AirDropNoContentView *)self topAnchor];
  v12 = [(AirDropNoContentView *)self titleLabel];
  v13 = [v12 topAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [v42 addObject:v14];

  v15 = [(AirDropNoContentView *)self leadingAnchor];
  v16 = [(AirDropNoContentView *)self subtitleLabel];
  v17 = [v16 leadingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v42 addObject:v18];

  v19 = [(AirDropNoContentView *)self trailingAnchor];
  objc_super v20 = [(AirDropNoContentView *)self subtitleLabel];
  v21 = [v20 trailingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v42 addObject:v22];

  v23 = [(AirDropNoContentView *)self titleLabel];
  v24 = [v23 lastBaselineAnchor];
  v25 = [(AirDropNoContentView *)self subtitleLabel];
  v26 = [v25 firstBaselineAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:-26.0];
  [v42 addObject:v27];

  v28 = [(AirDropNoContentView *)self titleLabel];
  v29 = [v28 centerXAnchor];
  v30 = [(AirDropNoContentView *)self actionButton];
  v31 = [v30 centerXAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v42 addObject:v32];

  v33 = [(AirDropNoContentView *)self subtitleLabel];
  v34 = [v33 lastBaselineAnchor];
  v35 = [(AirDropNoContentView *)self actionButton];
  v36 = [v35 firstBaselineAnchor];
  v37 = [v34 constraintEqualToAnchor:v36 constant:-44.0];
  [v42 addObject:v37];

  v38 = [(AirDropNoContentView *)self bottomAnchor];
  v39 = [(AirDropNoContentView *)self actionButton];
  v40 = [v39 bottomAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v42 addObject:v41];

  +[NSLayoutConstraint activateConstraints:v42];
}

- (void)setViewType:(unint64_t)a3
{
  self->_viewType = a3;
  switch(a3)
  {
    case 0uLL:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"AIRDROP_NO_PEOPLE";
      goto LABEL_11;
    case 1uLL:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"AIRDROP_WIFI_OFF_TITLE";
      goto LABEL_11;
    case 2uLL:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"AIRDROP_WLAN_OFF_TITLE";
      goto LABEL_11;
    case 3uLL:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"AIRDROP_BT_OFF_TITLE";
      goto LABEL_11;
    case 4uLL:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"AIRDROP_WIFI_BT_OFF_TITLE";
      goto LABEL_11;
    case 5uLL:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"AIRDROP_WLAN_BT_OFF_TITLE";
      goto LABEL_11;
    case 6uLL:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"AIRDROP_AIRPLANE_MODE_TITLE";
      goto LABEL_11;
    case 7uLL:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"AIRDROP_PERSONAL_HOTSPOT_TITLE";
LABEL_11:
      id v7 = [v4 localizedStringForKey:v6 value:&stru_100031788 table:0];

      break;
    default:
      id v7 = 0;
      break;
  }
  v8 = [(AirDropNoContentView *)self titleLabel];
  [v8 setText:v7];

  switch(self->_viewType)
  {
    case 0uLL:
      v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"AIRDROP_NO_PEOPLE_SUBTITLE";
      goto LABEL_22;
    case 1uLL:
      v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"AIRDROP_WIFI_OFF_SUBTITLE";
      goto LABEL_22;
    case 2uLL:
      v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"AIRDROP_WLAN_OFF_SUBTITLE";
      goto LABEL_22;
    case 3uLL:
      v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"AIRDROP_BT_OFF_SUBTITLE";
      goto LABEL_22;
    case 4uLL:
      v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"AIRDROP_WIFI_BT_OFF_SUBTITLE";
      goto LABEL_22;
    case 5uLL:
      v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"AIRDROP_WLAN_BT_OFF_SUBTITLE";
      goto LABEL_22;
    case 6uLL:
      v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"AIRDROP_AIRPLANE_MODE_SUBTITLE";
      goto LABEL_22;
    case 7uLL:
      v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"AIRDROP_PERSONAL_HOTSPOT_SUBTITLE";
LABEL_22:
      v12 = [v9 localizedStringForKey:v11 value:&stru_100031788 table:0];

      break;
    default:
      v12 = 0;
      break;
  }
  v13 = [(AirDropNoContentView *)self subtitleLabel];
  [v13 setText:v12];

  id v18 = [(AirDropNoContentView *)self actionButton];
  switch(self->_viewType)
  {
    case 1uLL:
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"AIRDROP_WIFI_OFF_BUTTON";
      goto LABEL_32;
    case 2uLL:
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"AIRDROP_WLAN_OFF_BUTTON";
      goto LABEL_32;
    case 3uLL:
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"AIRDROP_BT_OFF_BUTTON";
      goto LABEL_32;
    case 4uLL:
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"AIRDROP_WIFI_BT_OFF_BUTTON";
      goto LABEL_32;
    case 5uLL:
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"AIRDROP_WLAN_BT_OFF_BUTTON";
      goto LABEL_32;
    case 6uLL:
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"AIRDROP_AIRPLANE_MODE_BUTTON";
      goto LABEL_32;
    case 7uLL:
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      CFStringRef v16 = @"AIRDROP_PERSONAL_HOTSPOT_BUTTON";
LABEL_32:
      v17 = [v14 localizedStringForKey:v16 value:&stru_100031788 table:0];

      break;
    default:
      v17 = 0;
      break;
  }
  [v18 setTitle:v17 forState:0];
}

- (void)actionButtonTapped
{
  id v3 = [(AirDropNoContentView *)self delegate];
  [v3 noContentViewActionTriggered:self];
}

- (unint64_t)viewType
{
  return self->_viewType;
}

- (AirDropNoContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AirDropNoContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end