@interface NavSpeedLimitView
- (BOOL)isVisible;
- (CGSize)intrinsicContentSize;
- (NavSpeedLimitView)initWithFrame:(CGRect)a3;
- (id)_currentAccessibilityLabel;
- (void)_drawSign;
- (void)_setSpeedLimit:(unint64_t)a3 units:(unint64_t)a4 shieldType:(int64_t)a5 useNightMode:(BOOL)a6;
- (void)setSpeedLimit:(unint64_t)a3 units:(unint64_t)a4 shieldType:(int64_t)a5;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NavSpeedLimitView

- (NavSpeedLimitView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NavSpeedLimitView;
  v3 = -[NavSpeedLimitView initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(NavSpeedLimitView *)v3 setAccessibilityIdentifier:v5];

    [(NavSpeedLimitView *)v3 setIsAccessibilityElement:1];
    uint64_t v6 = objc_opt_new();
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setContentMode:4];
    [(UIImageView *)v3->_imageView setIsAccessibilityElement:0];
    [(NavSpeedLimitView *)v3 addSubview:v3->_imageView];
    v8 = [(NavSpeedLimitView *)v3 traitCollection];
    v3->_useNightMode = [v8 userInterfaceStyle] == (id)2;

    v22 = [(UIImageView *)v3->_imageView leadingAnchor];
    v21 = [(NavSpeedLimitView *)v3 leadingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v19 = [(UIImageView *)v3->_imageView trailingAnchor];
    v9 = [(NavSpeedLimitView *)v3 trailingAnchor];
    v10 = [v19 constraintEqualToAnchor:v9];
    v24[1] = v10;
    v11 = [(UIImageView *)v3->_imageView topAnchor];
    v12 = [(NavSpeedLimitView *)v3 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v24[2] = v13;
    v14 = [(UIImageView *)v3->_imageView bottomAnchor];
    v15 = [(NavSpeedLimitView *)v3 bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v24[3] = v16;
    v17 = +[NSArray arrayWithObjects:v24 count:4];
    +[NSLayoutConstraint activateConstraints:v17];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NavSpeedLimitView;
  [(NavSpeedLimitView *)&v8 traitCollectionDidChange:a3];
  unint64_t speedLimit = self->_speedLimit;
  unint64_t units = self->_units;
  int64_t shieldType = self->_shieldType;
  v7 = [(NavSpeedLimitView *)self traitCollection];
  -[NavSpeedLimitView _setSpeedLimit:units:shieldType:useNightMode:](self, "_setSpeedLimit:units:shieldType:useNightMode:", speedLimit, units, shieldType, [v7 userInterfaceStyle] == (id)2);
}

- (void)setSpeedLimit:(unint64_t)a3 units:(unint64_t)a4 shieldType:(int64_t)a5
{
}

- (BOOL)isVisible
{
  v2 = [(UIImageView *)self->_imageView image];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setSpeedLimit:(unint64_t)a3 units:(unint64_t)a4 shieldType:(int64_t)a5 useNightMode:(BOOL)a6
{
  BOOL v6 = a6;
  if (*(_OWORD *)&self->_speedLimit != __PAIR128__(a4, a3) || self->_shieldType != a5 || self->_useNightMode != a6)
  {
    v11 = sub_1005774B4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unint64_t speedLimit = self->_speedLimit;
      unint64_t units = self->_units;
      int64_t shieldType = self->_shieldType;
      BOOL useNightMode = self->_useNightMode;
      int v16 = 134219776;
      unint64_t v17 = speedLimit;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2048;
      unint64_t v21 = units;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      __int16 v24 = 2048;
      int64_t v25 = shieldType;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      __int16 v28 = 1024;
      BOOL v29 = useNightMode;
      __int16 v30 = 1024;
      BOOL v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Changing speedLimit from %lu to %lu, units from %lu to %lu, shieldType from %lld to %lld, useNightMode from %d to %d", (uint8_t *)&v16, 0x4Au);
    }

    self->_unint64_t speedLimit = a3;
    self->_unint64_t units = a4;
    self->_int64_t shieldType = a5;
    self->_BOOL useNightMode = v6;
    [(NavSpeedLimitView *)self _drawSign];
  }
}

- (void)_drawSign
{
  p_intrinsicContentSize = &self->_intrinsicContentSize;
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  if (self->_speedLimit && self->_shieldType)
  {
    BOOL v6 = sub_1005774B4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int64_t shieldType = self->_shieldType;
      unint64_t speedLimit = self->_speedLimit;
      BOOL useNightMode = self->_useNightMode;
      int v33 = 134218496;
      int64_t v34 = shieldType;
      __int16 v35 = 2048;
      unint64_t v36 = speedLimit;
      __int16 v37 = 1024;
      BOOL v38 = useNightMode;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Drawing speed limit sign; type: %ld, speed limit: %lu, night mode: %d",
        (uint8_t *)&v33,
        0x1Cu);
    }

    v10 = objc_opt_new();
    if (qword_10160FA30 != -1) {
      dispatch_once(&qword_10160FA30, &stru_1012F95F0);
    }
    unint64_t v11 = self->_speedLimit;
    id v12 = (id)qword_10160FA28;
    v13 = +[NSNumber numberWithUnsignedInteger:v11];
    v14 = [v12 stringFromNumber:v13];

    [v10 setText:v14];
    if (self->_useNightMode)
    {
      v15 = +[VKIconManager sharedManager];
      [v10 setVariant:[v15 darkVariant]];
    }
    int v16 = [(NavSpeedLimitView *)self traitCollection];
    [v16 displayScale];
    double v18 = v17;

    unint64_t v19 = +[VKIconManager sharedManager];
    *(float *)&double v20 = v18;
    unint64_t v21 = [v19 imageForDataID:LODWORD(self->_shieldType) text:v14 contentScale:4 sizeGroup:v10 modifiers:v20];

    if (v21)
    {
      __int16 v22 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v21 image], 0, v18);
      p_imageView = &self->_imageView;
      [(UIImageView *)self->_imageView setImage:v22];
    }
    else
    {
      p_imageView = &self->_imageView;
      [(UIImageView *)self->_imageView setImage:0];
    }
    [(UIImageView *)*p_imageView intrinsicContentSize];
    p_intrinsicContentSize->double width = v27;
    p_intrinsicContentSize->double height = v28;
    BOOL v29 = [(UIImageView *)*p_imageView image];

    if (!v29)
    {
      __int16 v30 = sub_1005774B4();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v33) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to get an image for the speed limit", (uint8_t *)&v33, 2u);
      }
    }
  }
  else
  {
    __int16 v24 = sub_1005774B4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int64_t v25 = self->_shieldType;
      unint64_t v26 = self->_speedLimit;
      int v33 = 134218240;
      int64_t v34 = v25;
      __int16 v35 = 2048;
      unint64_t v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Missing speed limit information; type: %ld, speed limit: %lu",
        (uint8_t *)&v33,
        0x16u);
    }

    [(UIImageView *)self->_imageView setImage:0];
    CGSize *p_intrinsicContentSize = CGSizeZero;
  }
  BOOL v31 = [(NavSpeedLimitView *)self _currentAccessibilityLabel];
  [(NavSpeedLimitView *)self setAccessibilityLabel:v31];

  if (width != p_intrinsicContentSize->width || height != p_intrinsicContentSize->height)
  {
    [(NavSpeedLimitView *)self invalidateIntrinsicContentSize];
    [(NavSpeedLimitView *)self setNeedsLayout];
  }
}

- (id)_currentAccessibilityLabel
{
  if (self->_speedLimit)
  {
    unint64_t units = self->_units;
    v4 = +[NSBundle mainBundle];
    v5 = v4;
    if (units) {
      CFStringRef v6 = @"[Navigation][VO] Speed limit description (kph)";
    }
    else {
      CFStringRef v6 = @"[Navigation][VO] Speed limit description (mph)";
    }
    v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

    uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, self->_speedLimit);
  }
  else
  {
    v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"[Navigation][VO] Empty speed limit description" value:@"localized string not found" table:0];
  }
  v9 = (void *)v8;

  return v9;
}

- (void).cxx_destruct
{
}

@end