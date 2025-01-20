@interface PPTLibraryScrollTest
- (BOOL)cold;
- (BOOL)glitchFree;
- (BOOL)night;
- (NSTimer)timer;
- (PPTLibraryScrollTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (int)timeBeforeTest;
- (void)dealloc;
- (void)setCold:(BOOL)a3;
- (void)setGlitchFree:(BOOL)a3;
- (void)setNight:(BOOL)a3;
- (void)setTimer:(id)a3;
- (void)startTest;
- (void)warmImageCache:(id)a3;
@end

@implementation PPTLibraryScrollTest

- (PPTLibraryScrollTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PPTLibraryScrollTest;
  v11 = [(PPTLibraryDependentTest *)&v16 initWithName:a3 options:a4 testDefinition:v10 isMainTest:v6];
  if (v11)
  {
    v12 = [v10 objectForKeyedSubscript:@"warm-scroll"];
    v11->_cold = [v12 BOOLValue] ^ 1;

    v13 = [v10 objectForKeyedSubscript:@"night-mode"];
    v11->_night = [v13 BOOLValue];

    v14 = [v10 objectForKeyedSubscript:@"glitch-free"];
    v11->_glitchFree = [v14 BOOLValue];
  }
  return v11;
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PPTLibraryScrollTest;
  [(PPTLibraryScrollTest *)&v4 dealloc];
}

- (int)timeBeforeTest
{
  return 5;
}

- (void)warmImageCache:(id)a3
{
  id v4 = a3;
  v5 = [(PPTLibraryScrollTest *)self timer];

  if (!v5)
  {
    BOOL v6 = sub_10020FC30();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Warming the image cache", buf, 2u);
    }

    v7 = [(PPTBasicTest *)self bookshelf];
    v8 = [v7 collectionView];
    [v8 setContentOffset:0.0, 0.0];
    *(void *)buf = 0;
    v20 = buf;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000924E0;
    v13[3] = &unk_100A43D88;
    objc_copyWeak(&v17, &location);
    objc_super v16 = buf;
    id v9 = v8;
    id v14 = v9;
    id v15 = v4;
    id v10 = +[NSTimer timerWithTimeInterval:1 repeats:v13 block:0.5];
    [(PPTLibraryScrollTest *)self setTimer:v10];

    v11 = +[NSRunLoop mainRunLoop];
    v12 = [(PPTLibraryScrollTest *)self timer];
    [v11 addTimer:v12 forMode:NSDefaultRunLoopMode];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
}

- (void)startTest
{
  [(PPTBasicTest *)self setTestTimeout:590];
  [(PPTBasicTest *)self setRunning:1];
  BOOL night = self->_night;
  id v4 = +[NSUserDefaults standardUserDefaults];
  v5 = v4;
  if (night)
  {
    [v4 setInteger:2 forKey:kOverrideLightLevel];

    id v4 = +[NSUserDefaults standardUserDefaults];
    v5 = v4;
    uint64_t v6 = kOverrideNightMode;
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v6 = kOverrideNightMode;
    uint64_t v7 = 0;
  }
  [v4 setBool:v7 forKey:v6];

  v8 = +[NSUserDefaults standardUserDefaults];
  [v8 synchronize];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009279C;
  v11[3] = &unk_100A43D60;
  v11[4] = self;
  id v9 = objc_retainBlock(v11);
  if (!self->_glitchFree)
  {
    if (!self->_cold)
    {
      [(PPTLibraryScrollTest *)self warmImageCache:v9];
      goto LABEL_8;
    }
    id v10 = +[BCCacheManager defaultCacheManager];
    [v10 cleanCache];
  }
  ((void (*)(void *))v9[2])(v9);
LABEL_8:
}

- (BOOL)cold
{
  return self->_cold;
}

- (void)setCold:(BOOL)a3
{
  self->_cold = a3;
}

- (BOOL)night
{
  return self->_night;
}

- (void)setNight:(BOOL)a3
{
  self->_BOOL night = a3;
}

- (BOOL)glitchFree
{
  return self->_glitchFree;
}

- (void)setGlitchFree:(BOOL)a3
{
  self->_glitchFree = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end