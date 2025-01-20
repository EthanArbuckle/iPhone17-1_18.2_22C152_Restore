@interface TransportTypeSegment
- (TransportTypeSegment)initWithTransportType:(int64_t)a3;
- (UIImageView)iconView;
- (int64_t)transportType;
- (void)_setupConstraints;
- (void)_updateViews;
- (void)didMoveToWindow;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation TransportTypeSegment

- (TransportTypeSegment)initWithTransportType:(int64_t)a3
{
  v33.receiver = self;
  v33.super_class = (Class)TransportTypeSegment;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[TransportTypeSegment initWithFrame:](&v33, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    [(TransportTypeSegment *)v7 setClipsToBounds:0];
    v9 = +[UIColor clearColor];
    [(TransportTypeSegment *)v8 setBackgroundColor:v9];

    [(TransportTypeSegment *)v8 setExclusiveTouch:1];
    [(TransportTypeSegment *)v8 setShowsLargeContentViewer:1];
    switch(a3)
    {
      case 1:
        v10 = +[NSBundle mainBundle];
        v11 = v10;
        CFStringRef v12 = @"Drive [Transport Type Picker, Accessibility]";
        goto LABEL_9;
      case 2:
        v10 = +[NSBundle mainBundle];
        v11 = v10;
        CFStringRef v12 = @"Walk [Transport Type Picker, Accessibility]";
        goto LABEL_9;
      case 3:
        v10 = +[NSBundle mainBundle];
        v11 = v10;
        CFStringRef v12 = @"Transit [Transport Type Picker, Accessibility]";
        goto LABEL_9;
      case 4:
        v10 = +[NSBundle mainBundle];
        v11 = v10;
        CFStringRef v12 = @"Ride [Transport Type Picker, Accessibility]";
        goto LABEL_9;
      case 5:
        v10 = +[NSBundle mainBundle];
        v11 = v10;
        CFStringRef v12 = @"Cycle [Transport Type Picker, Accessibility]";
LABEL_9:
        v13 = [v10 localizedStringForKey:v12 value:@"localized string not found" table:0];

        break;
      default:
        v13 = 0;
        break;
    }
    [(TransportTypeSegment *)v8 setLargeContentTitle:v13];

    LODWORD(v14) = 1144750080;
    [(TransportTypeSegment *)v8 setContentHuggingPriority:1 forAxis:v14];
    LODWORD(v15) = 1144750080;
    [(TransportTypeSegment *)v8 setContentHuggingPriority:0 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(TransportTypeSegment *)v8 setContentCompressionResistancePriority:1 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [(TransportTypeSegment *)v8 setContentCompressionResistancePriority:0 forAxis:v17];
    v8->_transportType = a3;
    v18 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    iconView = v8->_iconView;
    v8->_iconView = v18;

    [(UIImageView *)v8->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v8->_iconView setContentMode:1];
    [(TransportTypeSegment *)v8 addSubview:v8->_iconView];
    switch(a3)
    {
      case 1:
        [(TransportTypeSegment *)v8 setAccessibilityIdentifier:@"DriveButton"];
        v20 = +[NSBundle mainBundle];
        v21 = v20;
        CFStringRef v22 = @"Drive [Transport Type Picker, Accessibility]";
        goto LABEL_17;
      case 2:
        [(TransportTypeSegment *)v8 setAccessibilityIdentifier:@"WalkButton"];
        v20 = +[NSBundle mainBundle];
        v21 = v20;
        CFStringRef v22 = @"Walk [Transport Type Picker, Accessibility]";
        goto LABEL_17;
      case 3:
        [(TransportTypeSegment *)v8 setAccessibilityIdentifier:@"TransitButton"];
        v20 = +[NSBundle mainBundle];
        v21 = v20;
        CFStringRef v22 = @"Transit [Transport Type Picker, Accessibility]";
        goto LABEL_17;
      case 4:
        [(TransportTypeSegment *)v8 setAccessibilityIdentifier:@"RideshareButton"];
        v20 = +[NSBundle mainBundle];
        v21 = v20;
        CFStringRef v22 = @"Ride [Transport Type Picker, Accessibility]";
        goto LABEL_17;
      case 5:
        [(TransportTypeSegment *)v8 setAccessibilityIdentifier:@"CyclingButton"];
        v20 = +[NSBundle mainBundle];
        v21 = v20;
        CFStringRef v22 = @"Cycle [Transport Type Picker, Accessibility]";
LABEL_17:
        v23 = [v20 localizedStringForKey:v22 value:@"localized string not found" table:0];

        break;
      default:
        [(TransportTypeSegment *)v8 setAccessibilityIdentifier:0];
        v23 = 0;
        break;
    }
    [(TransportTypeSegment *)v8 setAccessibilityLabel:v23];

    [(TransportTypeSegment *)v8 _setupConstraints];
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_100B1AF80;
    v30 = &unk_1012E69C0;
    int64_t v32 = a3;
    v24 = v8;
    v31 = v24;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v27);
    [(TransportTypeSegment *)v24 _updateViews];
    v25 = v24;
  }
  return v8;
}

- (void)_setupConstraints
{
  id v28 = objc_alloc_init((Class)NSMutableArray);
  v27 = [(TransportTypeSegment *)self iconView];
  v26 = [v27 centerXAnchor];
  v25 = [(TransportTypeSegment *)self centerXAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v23 = [(TransportTypeSegment *)self iconView];
  CFStringRef v22 = [v23 centerYAnchor];
  v21 = [(TransportTypeSegment *)self centerYAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v29[1] = v20;
  v19 = [(TransportTypeSegment *)self iconView];
  v18 = [v19 topAnchor];
  double v17 = [(TransportTypeSegment *)self topAnchor];
  double v16 = [v18 constraintGreaterThanOrEqualToAnchor:v17 constant:3.0];
  v29[2] = v16;
  double v15 = [(TransportTypeSegment *)self iconView];
  double v14 = [v15 leadingAnchor];
  v13 = [(TransportTypeSegment *)self leadingAnchor];
  v3 = [v14 constraintGreaterThanOrEqualToAnchor:v13 constant:6.0];
  v29[3] = v3;
  v4 = [(TransportTypeSegment *)self bottomAnchor];
  v5 = [(TransportTypeSegment *)self iconView];
  v6 = [v5 bottomAnchor];
  v7 = [v4 constraintGreaterThanOrEqualToAnchor:v6 constant:3.0];
  v29[4] = v7;
  v8 = [(TransportTypeSegment *)self trailingAnchor];
  v9 = [(TransportTypeSegment *)self iconView];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintGreaterThanOrEqualToAnchor:v10 constant:6.0];
  v29[5] = v11;
  CFStringRef v12 = +[NSArray arrayWithObjects:v29 count:6];
  [v28 addObjectsFromArray:v12];

  +[NSLayoutConstraint activateConstraints:v28];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)TransportTypeSegment;
  [(TransportTypeSegment *)&v4 didMoveToWindow];
  v3 = [(TransportTypeSegment *)self window];

  if (v3) {
    [(TransportTypeSegment *)self _updateViews];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TransportTypeSegment *)self isSelected] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)TransportTypeSegment;
    [(TransportTypeSegment *)&v6 setSelected:v3];
    v5 = [(TransportTypeSegment *)self window];

    if (v5) {
      [(TransportTypeSegment *)self _updateViews];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TransportTypeSegment *)self isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)TransportTypeSegment;
    [(TransportTypeSegment *)&v7 setHighlighted:v3];
    v5 = [(TransportTypeSegment *)self window];

    if (v5)
    {
      double v6 = 0.200000003;
      if (!v3) {
        double v6 = 1.0;
      }
      [(TransportTypeSegment *)self setAlpha:v6];
    }
  }
}

- (void)_updateViews
{
  [(TransportTypeSegment *)self _setContinuousCornerRadius:8.0];
  if ([(TransportTypeSegment *)self isSelected])
  {
    id v17 = +[UIColor colorNamed:@"TransportTypePicker-SelectedIcon"];
    +[UIColor colorNamed:@"TransportTypePicker-SelectedSegment"];
  }
  else
  {
    id v17 = +[UIColor secondaryLabelColor];
    +[UIColor tertiarySystemFillColor];
  BOOL v3 = };
  objc_super v4 = [(TransportTypeSegment *)self iconView];
  [v4 setTintColor:v17];

  [(TransportTypeSegment *)self setBackgroundColor:v3];
  if ([(TransportTypeSegment *)self isSelected] && sub_1000BBB44(self) != 5)
  {
    double v14 = [(TransportTypeSegment *)self layer];
    [v14 setShadowColor:0];

    double v15 = [(TransportTypeSegment *)self layer];
    [v15 setShadowRadius:0.0];

    double height = CGSizeZero.height;
    CFStringRef v12 = [(TransportTypeSegment *)self layer];
    [v12 setShadowOffset:CGSizeZero.width, height];
  }
  else
  {
    id v5 = +[UIColor blackColor];
    id v6 = [v5 CGColor];
    objc_super v7 = [(TransportTypeSegment *)self layer];
    [v7 setShadowColor:v6];

    v8 = [(TransportTypeSegment *)self layer];
    [v8 setShadowRadius:4.0];

    v9 = [(TransportTypeSegment *)self layer];
    [v9 setShadowOffset:0.0, 1.0];

    v10 = [(TransportTypeSegment *)self layer];
    [v10 setShadowPathIsBounds:1];

    if ([(TransportTypeSegment *)self isSelected]) {
      float v11 = 0.1;
    }
    else {
      float v11 = 0.0;
    }
    CFStringRef v12 = [(TransportTypeSegment *)self layer];
    *(float *)&double v13 = v11;
    [v12 setShadowOpacity:v13];
  }
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_aspectRatioConstraint, 0);
}

@end