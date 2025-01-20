@interface MTAWorldClockMapView
+ (double)mapHeightForWidth:(double)a3;
+ (void)updateNewYearsDay;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTAWorldClockMapView)initWithFrame:(CGRect)a3;
- (double)maxWidthForDateStringWithFont:(id)a3;
- (double)terminatorUpdateInterval;
- (id)terminatorPathForDayOfYear:(double)a3 size:(CGSize)a4;
- (void)addCity:(id)a3;
- (void)addCity:(id)a3 animated:(BOOL)a4;
- (void)cancelTerminatorUpdate;
- (void)didMoveToWindow;
- (void)handleLocaleChange;
- (void)handleSignificantTimeChange:(id)a3;
- (void)layoutSubviews;
- (void)removeCity:(id)a3;
- (void)resizeCityViews;
- (void)scheduleTerminatorUpdate;
- (void)setCities:(id)a3;
- (void)startUpdatingTime;
- (void)stopUpdatingTime;
- (void)updateTerminator;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAWorldClockMapView

- (MTAWorldClockMapView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)MTAWorldClockMapView;
  v3 = -[MTAWorldClockMapView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    timeFormatter = v3->_timeFormatter;
    v3->_timeFormatter = v4;

    [(NSDateFormatter *)v3->_timeFormatter setTimeStyle:1];
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cityViews = v3->_cityViews;
    v3->_cityViews = v6;

    v8 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:0];
    mapWithTerminator = v3->_mapWithTerminator;
    v3->_mapWithTerminator = v8;

    [(MTAWorldClockMapView *)v3 addSubview:v3->_mapWithTerminator];
    [(id)objc_opt_class() updateNewYearsDay];
    [(MTAWorldClockMapView *)v3 updateTerminator];
    v10 = +[MTAWorldClockMapCityView secondaryLabelFont];
    [(MTAWorldClockMapView *)v3 maxWidthForDateStringWithFont:v10];
    v3->_maxTimeStringWidth = v11;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v12 = +[WorldClockManager sharedManager];
    v13 = [v12 cities];

    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          [(MTAWorldClockMapView *)v3 addCity:*(void *)(*((void *)&v22 + 1) + 8 * (void)v17) animated:0];
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v15);
    }

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v3 selector:"handleLocaleChange" name:NSCurrentLocaleDidChangeNotification object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v3 selector:"handleSignificantTimeChange:" name:UIApplicationSignificantTimeChangeNotification object:0];

    v20 = v3;
  }

  return v3;
}

- (void)handleLocaleChange
{
  v3 = +[MTAWorldClockMapCityView secondaryLabelFont];
  [(MTAWorldClockMapView *)self maxWidthForDateStringWithFont:v3];
  self->_maxTimeStringWidth = v4;

  [(MTAWorldClockMapView *)self resizeCityViews];

  [(MTAWorldClockMapView *)self setNeedsLayout];
}

- (void)handleSignificantTimeChange:(id)a3
{
  [(id)objc_opt_class() updateNewYearsDay];

  [(MTAWorldClockMapView *)self updateTerminator];
}

- (void)resizeCityViews
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->_cityViews allValues];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setTimeLabelWidth:self->_maxTimeStringWidth];
        [v8 handleLocaleChange];
        [v8 sizeToFit];
        [v8 setNeedsLayout];
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (double)mapHeightForWidth:(double)a3
{
  sub_100024450(a3);
  double v4 = v3;
  int v5 = MTUIShouldUseLargePadLayout();
  double v6 = 10.0;
  if (v5) {
    double v6 = 13.0;
  }
  return v4 + v6 * 2.0;
}

- (double)maxWidthForDateStringWithFont:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  double v6 = +[NSTimeZone systemTimeZone];
  [v5 setTimeZone:v6];

  id v7 = objc_alloc_init((Class)NSDateComponents);
  [v7 setYear:2010];
  [v7 setMonth:7];
  [v7 setDay:10];
  [v7 setSecond:0];
  uint64_t v8 = 0;
  double v9 = 0.0;
  do
  {
    [v7 setHour:*(void *)((char *)&v15 + v8)];
    [v7 setMinute:*(void *)((char *)&v15 + v8 + 8)];
    long long v10 = [v5 dateFromComponents:v7];
    long long v11 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v10];
    [v11 _legacy_sizeWithFont:v4];
    double v13 = v12;

    if (v13 > v9) {
      double v9 = v13;
    }

    v8 += 16;
  }
  while (v8 != 64);

  return v9 + 6.0;
}

- (void)addCity:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  cityViews = self->_cityViews;
  id v13 = v6;
  uint64_t v8 = [v6 alCityId];
  double v9 = [(NSMutableDictionary *)cityViews objectForKey:v8];

  if (!v9)
  {
    long long v10 = [[MTAWorldClockMapCityView alloc] initWithCity:v13];
    [(MTAWorldClockMapCityView *)v10 start];
    [(MTAWorldClockMapCityView *)v10 setTimeFormatter:self->_timeFormatter];
    [(MTAWorldClockMapCityView *)v10 setTimeLabelWidth:self->_maxTimeStringWidth];
    [(MTAWorldClockMapCityView *)v10 sizeToFit];
    long long v11 = self->_cityViews;
    double v12 = [v13 alCityId];
    [(NSMutableDictionary *)v11 setObject:v10 forKey:v12];

    [(MTAWorldClockMapView *)self addSubview:v10];
    if (v4) {
      objc_storeStrong((id *)&self->_addedCityView, v10);
    }
  }
}

- (void)addCity:(id)a3
{
}

- (void)removeCity:(id)a3
{
  cityViews = self->_cityViews;
  id v5 = a3;
  id v6 = [v5 alCityId];
  id v7 = [(NSMutableDictionary *)cityViews objectForKey:v6];

  uint64_t v8 = self->_cityViews;
  double v9 = [v5 alCityId];

  [(NSMutableDictionary *)v8 removeObjectForKey:v9];
  [(MTAWorldClockMapView *)self setNeedsLayout];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100024934;
  v13[3] = &unk_1000A14C0;
  id v14 = v7;
  long long v15 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024974;
  v11[3] = &unk_1000A19B8;
  id v12 = v14;
  id v10 = v14;
  +[UIView animateWithDuration:0 delay:v13 options:v11 animations:0.3 completion:0.0];
}

- (void)setCities:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_cityViews allKeys];
  id v6 = +[NSMutableSet setWithArray:v5];

  id v7 = [v4 valueForKey:@"alCityId"];
  uint64_t v8 = +[NSMutableSet setWithArray:v7];

  if (([v6 isEqualToSet:v8] & 1) == 0)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v9 = self->_cityViews;
    id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [(NSMutableDictionary *)self->_cityViews objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * (void)v13)];
          [v14 removeFromSuperview];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    [(NSMutableDictionary *)self->_cityViews removeAllObjects];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v4;
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          -[MTAWorldClockMapView addCity:animated:](self, "addCity:animated:", *(void *)(*((void *)&v20 + 1) + 8 * (void)v19), 0, (void)v20);
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a4;
  id v6 = [(MTAWorldClockMapView *)self window];

  if (v6)
  {
    id v7 = objc_alloc((Class)UISnapshotView);
    [(UIImageView *)self->_mapWithTerminator frame];
    id v8 = [v7 initWithFrame:];
    [v8 captureSnapshotOfView:self->_mapWithTerminator withSnapshotType:1];
    [(MTAWorldClockMapView *)self insertSubview:v8 aboveSubview:self->_mapWithTerminator];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100024D14;
    v12[3] = &unk_1000A13D8;
    id v13 = v8;
    id v14 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100024D68;
    v10[3] = &unk_1000A1400;
    id v11 = v13;
    id v9 = v13;
    [v5 animateAlongsideTransition:v12 completion:v10];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  sub_100024DB0(a3.width);
  double v7 = v5 / v6;
  double v8 = width / (v5 / v6);
  if (width / height >= v7) {
    double v9 = height;
  }
  else {
    double v9 = v8;
  }
  double v10 = width;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockMapView;
  [(MTAWorldClockMapView *)&v4 didMoveToWindow];
  if (self->_needsUpdateTerminator)
  {
    double v3 = [(MTAWorldClockMapView *)self window];

    if (v3) {
      [(MTAWorldClockMapView *)self updateTerminator];
    }
  }
}

- (void)layoutSubviews
{
  [(MTAWorldClockMapView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MTAWorldClockMapView *)self updateTerminator];
  [(UIImageView *)self->_mapWithTerminator setImage:self->_terminatorImages[0]];
  mapWithTerminator = self->_mapWithTerminator;
  double v47 = v8;
  CGFloat v48 = v10;
  -[UIImageView setFrame:](mapWithTerminator, "setFrame:", v4, v6, v8, v10);
  uint64_t v12 = [(NSMutableDictionary *)self->_cityViews allValues];
  id v13 = (char *)[v12 count];
  uint64_t v14 = __chkstk_darwin(v13);
  id v15 = &v45 - 2 * v14;
  if (v14)
  {
    v45.f64[0] = v4;
    v45.f64[1] = v6;
    v46 = &v45;
    id v16 = 0;
    f64 = (void *)v15[1].f64;
    double v18 = v48;
    do
    {
      v19 = [v12 objectAtIndex:v16, v18, *(_OWORD *)&v45, v46];
      [v19 setIconPlacement:1];
      id v20 = v19;
      long long v21 = [v20 city];
      long long v22 = [v21 alCity];
      [v22 latitude];
      long long v23 = [v21 alCity];
      [v23 longitude];
      MTUILocationCoordinate2DMake();
      sub_10002663C(v24, v25, v47);

      [v20 frame];
      uint64_t v27 = v26;
      uint64_t v29 = v28;
      [v20 hotspotOffset];

      MTUIRoundToPixel();
      MTUIRoundToPixel();

      MTUIRoundToPixel();
      uint64_t v31 = v30;
      MTUIRoundToPixel();
      *(f64 - 2) = v31;
      *(f64 - 1) = v32;
      void *f64 = v27;
      f64[1] = v29;
      f64 += 4;

      ++v16;
    }
    while (v13 != v16);
    sub_100025238(v15, (unint64_t)v13, v12, v45.f64[0], v45.f64[1], v47, v48);
    v33 = 0;
    v34 = v15[1].f64;
    do
    {
      v35 = [v12 objectAtIndexedSubscript:v33];
      double v37 = *v34;
      double v36 = v34[1];
      MTUIRoundToPixel();
      double v39 = v38;
      MTUIRoundToPixel();
      double v41 = v40;
      addedCityView = self->_addedCityView;
      if (addedCityView) {
        BOOL v43 = v35 == addedCityView;
      }
      else {
        BOOL v43 = 1;
      }
      if (v43)
      {
        -[MTAWorldClockMapCityView setFrame:](v35, "setFrame:", v39, v40, v37, v36);
      }
      else
      {
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_100025A1C;
        v49[3] = &unk_1000A16D0;
        v50 = v35;
        double v51 = v39;
        double v52 = v41;
        double v53 = v37;
        double v54 = v36;
        +[UIView animateWithDuration:v49 animations:0.3];
      }
      ++v33;
      v34 += 4;
    }
    while (v13 != v33);
  }
  else
  {
    sub_100025238(&v45, (unint64_t)v13, v12, v4, v6, v47, v48);
  }
  v44 = self->_addedCityView;
  self->_addedCityView = 0;
}

- (void)startUpdatingTime
{
  [(MTAWorldClockMapView *)self scheduleTerminatorUpdate];
  id v3 = [(NSMutableDictionary *)self->_cityViews allValues];
  [v3 makeObjectsPerformSelector:"start"];
}

- (void)stopUpdatingTime
{
  [(MTAWorldClockMapView *)self cancelTerminatorUpdate];
  id v3 = [(NSMutableDictionary *)self->_cityViews allValues];
  [v3 makeObjectsPerformSelector:"stop"];
}

- (double)terminatorUpdateInterval
{
  MTUIMainScreenScale();
  double v4 = v3;
  [(MTAWorldClockMapView *)self bounds];
  double result = 112.5;
  if (v4 * v5 != 0.0) {
    return 86400.0 / (v4 * v5);
  }
  return result;
}

- (void)cancelTerminatorUpdate
{
  [(NSTimer *)self->_terminatorTimer invalidate];
  terminatorTimer = self->_terminatorTimer;
  self->_terminatorTimer = 0;
}

- (void)scheduleTerminatorUpdate
{
  [(MTAWorldClockMapView *)self cancelTerminatorUpdate];
  id v3 = objc_alloc((Class)NSTimer);
  double v4 = +[NSDate date];
  [(MTAWorldClockMapView *)self terminatorUpdateInterval];
  double v5 = [v3 initWithFireDate:v4 interval:self selector:@"updateTerminator" userInfo:0 repeats:1];
  terminatorTimer = self->_terminatorTimer;
  self->_terminatorTimer = v5;

  id v7 = +[NSRunLoop currentRunLoop];
  [v7 addTimer:self->_terminatorTimer forMode:NSDefaultRunLoopMode];
}

- (void)updateTerminator
{
  [(MTAWorldClockMapView *)self bounds];
  if (!CGRectIsEmpty(v64))
  {
    id obj = +[NSDate date];
    [(MTAWorldClockMapView *)self bounds];
    BOOL v3 = CGRectEqualToRect(v65, self->_lastTerminatorUpdateBounds);
    if (!v3
      || ([(MTAWorldClockMapView *)self terminatorUpdateInterval],
          double v5 = v4,
          [(NSDate *)self->_terminatorTimestamp timeIntervalSinceDate:obj],
          v5 - fabs(v6) < 1.0))
    {
      id v7 = [(MTAWorldClockMapView *)self window];

      if (v7)
      {
        BOOL v61 = v3;
        [(MTAWorldClockMapView *)self bounds];
        double v9 = v8;
        double v11 = v10;
        MTUIMainScreenScale();
        CGFloat v13 = v12;
        double v14 = v12 * v9;
        size_t v15 = (unint64_t)(v12 * v9);
        double v16 = v12 * v11;
        size_t v17 = (unint64_t)(v12 * v11);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        double v19 = (double)(unint64_t)v14;
        double v20 = (double)(unint64_t)v16;
        uint64_t size = 4 * v15 * v17;
        v60 = malloc_type_malloc(size, 0xEC6210D4uLL);
        long long v21 = CGBitmapContextCreate(v60, v15, v17, 8uLL, 4 * v15, DeviceRGB, 0x2002u);
        v66.origin.x = 0.0;
        v66.origin.y = 0.0;
        v66.size.double width = v19;
        v66.size.double height = v20;
        CGContextClearRect(v21, v66);
        CGContextTranslateCTM(v21, 0.0, v20);
        CGContextScaleCTM(v21, v13, -v13);
        CGContextSetAlpha(v21, 0.6);
        id v22 = +[UIColor blackColor];
        CGContextSetFillColorWithColor(v21, (CGColorRef)[v22 CGColor]);

        long long v23 = +[NSDate date];
        sub_100026B60(v23);
        sub_100026368(1);
        id v24 = objc_claimAutoreleasedReturnValue();
        CGContextAddPath(v21, (CGPathRef)[v24 CGPath]);

        CGContextFillPath(v21);
        id v25 = +[UIColor colorWithWhite:1.0 alpha:0.9];
        CGContextSetStrokeColorWithColor(v21, (CGColorRef)[v25 CGColor]);

        uint64_t v26 = +[NSDate date];
        sub_100026B60(v26);
        sub_100026368(0);
        id v27 = objc_claimAutoreleasedReturnValue();
        CGContextAddPath(v21, (CGPathRef)[v27 CGPath]);

        uint64_t v28 = DeviceRGB;
        CGContextStrokePath(v21);
        uint64_t v29 = malloc_type_calloc(1uLL, size, 0xB3D3DF3BuLL);
        uint64_t v30 = CGBitmapContextCreate(v29, v15, v17, 8uLL, 4 * v15, DeviceRGB, 0x2006u);
        id v31 = +[UIColor mtui_backgroundColor];
        CGContextSetFillColorWithColor(v30, (CGColorRef)[v31 CGColor]);

        v67.origin.x = 0.0;
        v67.origin.y = 0.0;
        v67.size.double width = v19;
        v67.size.double height = v20;
        CGContextFillRect(v30, v67);
        uint64_t v32 = (CGImage *)[(id)sub_1000266F0(v9)[1] CGImage];
        sub_100024DB0(v9);
        if (v13 == 1.0) {
          double v37 = v33;
        }
        else {
          double v37 = v13 * v33;
        }
        if (v13 == 1.0)
        {
          double v38 = v35;
        }
        else
        {
          double v34 = v13 * v34;
          double v38 = v13 * v35;
        }
        if (v13 == 1.0) {
          double v39 = v36;
        }
        else {
          double v39 = v13 * v36;
        }
        double v40 = v37;
        double v41 = v38;
        double v42 = v39;
        v68.origin.y = v20 - CGRectGetMaxY(*(CGRect *)(&v34 - 1));
        v68.origin.x = v37;
        v68.size.double width = v38;
        v68.size.double height = v39;
        CGContextDrawImage(v30, v68, v32);
        Image = CGBitmapContextCreateImage(v21);
        v69.origin.x = 0.0;
        v69.origin.y = 0.0;
        v69.size.double width = v19;
        v69.size.double height = v20;
        CGContextDrawImage(v30, v69, Image);
        CGImageRelease(Image);
        uint64_t v44 = -180;
        Mutable = CGPathCreateMutable();
        do
        {
          v44 += 30;
          MTUILocationCoordinate2DMake();
          float v48 = sub_10002663C(v46, v47, v9);
          CGFloat v49 = v13 * (floorf(v48) + 0.5);
          CGPathMoveToPoint(Mutable, 0, v49, 0.0);
          CGPathAddLineToPoint(Mutable, 0, v49, v20);
        }
        while (v44 < 150);
        id v50 = +[UIColor whiteColor];
        CGContextSetStrokeColorWithColor(v30, (CGColorRef)[v50 CGColor]);

        CGContextSetAlpha(v30, 0.100000001);
        CGContextSetLineWidth(v30, v13);
        CGContextAddPath(v30, Mutable);
        CGContextStrokePath(v30);
        double v51 = CGBitmapContextCreateImage(v30);
        double v52 = (UIImage *)[objc_alloc((Class)UIImage) initWithCGImage:v51 scale:0 orientation:v13];
        CGImageRelease(v51);
        CGColorSpaceRelease(v28);
        CGContextRelease(v30);
        CGContextRelease(v21);
        CGPathRelease(Mutable);
        free(v60);
        free(v29);
        double v53 = self->_terminatorImages[0];
        self->_terminatorImages[0] = v52;

        objc_storeStrong((id *)&self->_terminatorTimestamp, obj);
        [(MTAWorldClockMapView *)self bounds];
        self->_lastTerminatorUpdateBounds.origin.x = v54;
        self->_lastTerminatorUpdateBounds.origin.y = v55;
        self->_lastTerminatorUpdateBounds.size.double width = v56;
        self->_lastTerminatorUpdateBounds.size.double height = v57;
        self->_needsUpdateTerminator = 0;
        if (self->_terminatorTimer) {
          char v58 = v61;
        }
        else {
          char v58 = 1;
        }
        if ((v58 & 1) == 0) {
          [(MTAWorldClockMapView *)self scheduleTerminatorUpdate];
        }
        [(MTAWorldClockMapView *)self setNeedsLayout];
      }
      else
      {
        self->_needsUpdateTerminator = 1;
      }
    }
  }
}

+ (void)updateNewYearsDay
{
  id v7 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  v2 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v7 setTimeZone:v2];

  BOOL v3 = +[NSDate date];
  double v4 = [v7 components:4 fromDate:v3];

  [v4 setMonth:1];
  [v4 setDay:1];
  [v4 setHour:0];
  [v4 setMinute:0];
  [v4 setSecond:0];
  uint64_t v5 = [v7 dateFromComponents:v4];
  double v6 = (void *)qword_1000C7BC8;
  qword_1000C7BC8 = v5;
}

- (id)terminatorPathForDayOfYear:(double)a3 size:(CGSize)a4
{
  return sub_100026368(1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminatorTimer, 0);
  objc_storeStrong((id *)&self->_terminatorTimestamp, 0);
  objc_storeStrong((id *)self->_terminatorImages, 0);
  objc_storeStrong((id *)&self->_mapWithTerminator, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_addedCityView, 0);

  objc_storeStrong((id *)&self->_cityViews, 0);
}

@end