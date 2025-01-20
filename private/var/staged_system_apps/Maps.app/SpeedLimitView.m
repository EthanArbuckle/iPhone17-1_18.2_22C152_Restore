@interface SpeedLimitView
- (BOOL)hasContent;
- (BOOL)useNightMode;
- (CGSize)intrinsicContentSize;
- (SpeedLimitView)initWithCoder:(id)a3;
- (SpeedLimitView)initWithFrame:(CGRect)a3;
- (UIImageView)speedLimitImageView;
- (double)dynamicScale;
- (id)_stringWithSpeedLimit:(unint64_t)a3;
- (int64_t)shieldSize;
- (int64_t)shieldType;
- (unint64_t)speedLimit;
- (void)_maps_commonInit;
- (void)_updateShield;
- (void)didMoveToWindow;
- (void)setShieldType:(int64_t)a3;
- (void)setSpeedLimit:(unint64_t)a3;
- (void)setSpeedLimit:(unint64_t)a3 shieldType:(int64_t)a4;
- (void)setUseNightMode:(BOOL)a3;
@end

@implementation SpeedLimitView

- (SpeedLimitView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SpeedLimitView;
  v3 = [(SpeedLimitView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SpeedLimitView *)v3 _maps_commonInit];
  }
  return v4;
}

- (SpeedLimitView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SpeedLimitView;
  v3 = -[SpeedLimitView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SpeedLimitView *)v3 _maps_commonInit];
  }
  return v4;
}

- (void)_maps_commonInit
{
  v3 = [(SpeedLimitView *)self speedLimitImageView];
  [(SpeedLimitView *)self addSubview:v3];

  v20 = [(SpeedLimitView *)self speedLimitImageView];
  v19 = [v20 leadingAnchor];
  v18 = [(SpeedLimitView *)self leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v21[0] = v17;
  v16 = [(SpeedLimitView *)self speedLimitImageView];
  v15 = [v16 trailingAnchor];
  v14 = [(SpeedLimitView *)self trailingAnchor];
  v4 = [v15 constraintEqualToAnchor:v14];
  v21[1] = v4;
  v5 = [(SpeedLimitView *)self speedLimitImageView];
  objc_super v6 = [v5 topAnchor];
  v7 = [(SpeedLimitView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v21[2] = v8;
  v9 = [(SpeedLimitView *)self speedLimitImageView];
  v10 = [v9 bottomAnchor];
  v11 = [(SpeedLimitView *)self bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v21[3] = v12;
  v13 = +[NSArray arrayWithObjects:v21 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (int64_t)shieldSize
{
  return 4;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SpeedLimitView;
  [(SpeedLimitView *)&v3 didMoveToWindow];
  [(SpeedLimitView *)self _updateShield];
}

- (UIImageView)speedLimitImageView
{
  speedLimitImageView = self->_speedLimitImageView;
  if (!speedLimitImageView)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    v5 = self->_speedLimitImageView;
    self->_speedLimitImageView = v4;

    [(UIImageView *)self->_speedLimitImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_speedLimitImageView setContentMode:4];
    LODWORD(v6) = 1148846080;
    [(UIImageView *)self->_speedLimitImageView setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(UIImageView *)self->_speedLimitImageView setContentCompressionResistancePriority:0 forAxis:v7];
    speedLimitImageView = self->_speedLimitImageView;
  }

  return speedLimitImageView;
}

- (void)setSpeedLimit:(unint64_t)a3 shieldType:(int64_t)a4
{
  if (self->_speedLimit != a3 || self->_shieldType != a4)
  {
    self->_speedLimit = a3;
    self->_shieldType = a4;
    [(SpeedLimitView *)self _updateShield];
  }
}

- (void)setUseNightMode:(BOOL)a3
{
  if (self->_useNightMode != a3)
  {
    self->_useNightMode = a3;
    unsigned int v4 = [(SpeedLimitView *)self useNightMode];
    uint64_t v5 = 5;
    if (v4) {
      uint64_t v5 = 4;
    }
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___SpeedLimitView__speedLimitImageView[v5]);
    double v7 = [(SpeedLimitView *)self speedLimitImageView];
    [v7 setImage:v6];

    id v8 = [(SpeedLimitView *)self speedLimitImageView];
    [v8 sizeToFit];
  }
}

- (BOOL)hasContent
{
  v2 = [(SpeedLimitView *)self speedLimitImageView];
  objc_super v3 = [v2 image];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_updateShield
{
  if ([(SpeedLimitView *)self speedLimit] && [(SpeedLimitView *)self shieldType])
  {
    objc_super v3 = [(SpeedLimitView *)self _stringWithSpeedLimit:[(SpeedLimitView *)self speedLimit]];
    BOOL v4 = [(SpeedLimitView *)self _screen];
    [v4 scale];
    double v6 = v5;

    id v7 = objc_alloc_init((Class)VKIconModifiers);
    [v7 setText:v3];
    id v8 = +[VKIconManager sharedManager];
    int64_t v9 = [(SpeedLimitView *)self shieldType];
    int64_t v10 = [(SpeedLimitView *)self shieldSize];
    *(float *)&double v11 = v6;
    v12 = [v8 imageForDataID:v9 text:v3 contentScale:v10 sizeGroup:v7 modifiers:v11];

    v13 = +[VKIconManager sharedManager];
    [v7 setVariant:[v13 darkVariant]];

    v14 = +[VKIconManager sharedManager];
    int64_t v15 = [(SpeedLimitView *)self shieldType];
    int64_t v16 = [(SpeedLimitView *)self shieldSize];
    *(float *)&double v17 = v6;
    v18 = [v14 imageForDataID:v15 text:v3 contentScale:v16 sizeGroup:v7 modifiers:v17];

    if (v12)
    {
      id v19 = [v12 image];
      [(SpeedLimitView *)self dynamicScale];
      v21 = +[UIImage imageWithCGImage:v19 scale:0 orientation:v6 / v20];
    }
    else
    {
      v21 = 0;
    }
    objc_storeStrong((id *)&self->_speedLimitImage, v21);
    if (v12) {

    }
    if (v18)
    {
      id v30 = [v18 image];
      [(SpeedLimitView *)self dynamicScale];
      v32 = +[UIImage imageWithCGImage:v30 scale:0 orientation:v6 / v31];
    }
    else
    {
      v32 = 0;
    }
    objc_storeStrong((id *)&self->_dimmedSpeedLimitImage, v32);
    if (v18) {

    }
    if ([(SpeedLimitView *)self useNightMode]) {
      p_dimmedSpeedLimitImage = &self->_dimmedSpeedLimitImage;
    }
    else {
      p_dimmedSpeedLimitImage = &self->_speedLimitImage;
    }
    v34 = *p_dimmedSpeedLimitImage;
    v35 = [(SpeedLimitView *)self speedLimitImageView];
    [v35 setImage:v34];

    v36 = [(SpeedLimitView *)self speedLimitImageView];
    [v36 sizeToFit];

    v37 = sub_1005774B4();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v45 = [(SpeedLimitView *)self speedLimitImageView];
      v38 = [v45 image];
      v39 = v18;
      id v40 = v7;
      v41 = v12;
      unint64_t v42 = [(SpeedLimitView *)self speedLimit];
      int64_t v43 = [(SpeedLimitView *)self shieldType];
      v44 = [(SpeedLimitView *)self window];
      *(_DWORD *)buf = 138544130;
      unint64_t v47 = (unint64_t)v38;
      __int16 v48 = 2048;
      unint64_t v49 = v42;
      v12 = v41;
      id v7 = v40;
      v18 = v39;
      __int16 v50 = 2048;
      int64_t v51 = v43;
      __int16 v52 = 2114;
      v53 = v44;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Got image %{public}@ for speed limit %lu, shield type %lld, in window %{public}@", buf, 0x2Au);
    }
LABEL_22:

    goto LABEL_23;
  }
  v22 = [(SpeedLimitView *)self speedLimitImageView];
  v23 = [v22 image];

  if (v23)
  {
    speedLimitImage = self->_speedLimitImage;
    self->_speedLimitImage = 0;

    dimmedSpeedLimitImage = self->_dimmedSpeedLimitImage;
    self->_dimmedSpeedLimitImage = 0;

    v26 = [(SpeedLimitView *)self speedLimitImageView];
    [v26 setImage:0];

    objc_super v3 = sub_1005774B4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      unint64_t v27 = [(SpeedLimitView *)self speedLimit];
      int64_t v28 = [(SpeedLimitView *)self shieldType];
      v29 = [(SpeedLimitView *)self window];
      *(_DWORD *)buf = 134218498;
      unint64_t v47 = v27;
      __int16 v48 = 2048;
      unint64_t v49 = v28;
      __int16 v50 = 2114;
      int64_t v51 = (int64_t)v29;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing speed limit %lu, shield type %lld, in window %{public}@", buf, 0x20u);
    }
    goto LABEL_22;
  }
LABEL_23:
  [(SpeedLimitView *)self invalidateIntrinsicContentSize];
}

- (double)dynamicScale
{
  return 1.0;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(SpeedLimitView *)self speedLimitImageView];
  objc_super v3 = [v2 image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_stringWithSpeedLimit:(unint64_t)a3
{
  if (qword_10160FAB0 != -1) {
    dispatch_once(&qword_10160FAB0, &stru_1012F9C18);
  }
  double v4 = (void *)qword_10160FAA8;
  double v5 = +[NSNumber numberWithUnsignedInteger:a3];
  double v6 = [v4 stringFromNumber:v5];

  return v6;
}

- (BOOL)useNightMode
{
  return self->_useNightMode;
}

- (unint64_t)speedLimit
{
  return self->_speedLimit;
}

- (void)setSpeedLimit:(unint64_t)a3
{
  self->_speedLimit = a3;
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(int64_t)a3
{
  self->_shieldType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speedLimitImageView, 0);
  objc_storeStrong((id *)&self->_dimmedSpeedLimitImage, 0);

  objc_storeStrong((id *)&self->_speedLimitImage, 0);
}

@end