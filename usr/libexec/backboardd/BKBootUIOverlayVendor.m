@interface BKBootUIOverlayVendor
+ (id)sharedInstance;
- (BKBootUIOverlayVendor)initWithFirstBootDetector:(id)a3;
- (id)currentOverlayWithLevel:(float)a3;
@end

@implementation BKBootUIOverlayVendor

- (void).cxx_destruct
{
}

- (id)currentOverlayWithLevel:(float)a3
{
  unsigned int v4 = [(BKFirstBootDetector *)self->_firstBootDetector isFirstBoot];
  v5 = sub_10005F9DC();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current bootUI is an Apple Logo", (uint8_t *)&v15, 2u);
    }

    v8 = +[CADisplay mainDisplay];
    *(float *)&double v9 = a3;
    v10 = +[BKDisplayRenderOverlayAppleLogo overlayWithLevel:v8 display:v9];
  }
  else
  {
    if (v6)
    {
      *(float *)&double v7 = a3;
      v11 = +[NSNumber numberWithFloat:v7];
      int v15 = 138412290;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current bootUI is the spinny, level %@", (uint8_t *)&v15, 0xCu);
    }
    v12 = +[CADisplay mainDisplay];
    *(float *)&double v13 = a3;
    v10 = +[BKDisplayRenderOverlaySpinny overlayWithLevel:v12 display:v13];

    [v10 setBackground:1];
  }

  return v10;
}

- (BKBootUIOverlayVendor)initWithFirstBootDetector:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKBootUIOverlayVendor;
  BOOL v6 = [(BKBootUIOverlayVendor *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_firstBootDetector, a3);
  }

  return v7;
}

+ (id)sharedInstance
{
  if (qword_100123188 != -1) {
    dispatch_once(&qword_100123188, &stru_1000F8D78);
  }
  v2 = (void *)qword_100123180;

  return v2;
}

@end