@interface COSAnimatedInsigniaWatchView
- (AVPlayerItem)magicCodeOutro;
- (AVPlayerItem)magicCodeOutroPerMaterial;
- (AVQueuePlayer)player;
- (BOOL)_verboseMALogging;
- (BOOL)assetsLoaded;
- (COSAnimatedInsigniaWatchView)init;
- (UIImageView)genericMask;
- (UIImageView)overlay;
- (UIView)deviceInsignia;
- (void)_maybePresentInsignia;
- (void)addItemWithURL:(id)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)loadInsigniaAsset;
- (void)moveOutroToInsignia;
- (void)playerItemDidReachEnd:(id)a3;
- (void)setAssetsLoaded:(BOOL)a3;
- (void)setDeviceInsignia:(id)a3;
- (void)setGenericMask:(id)a3;
- (void)setMagicCodeOutro:(id)a3;
- (void)setMagicCodeOutroPerMaterial:(id)a3;
- (void)setOverlay:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setupInsigniaLayer;
@end

@implementation COSAnimatedInsigniaWatchView

- (COSAnimatedInsigniaWatchView)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSAnimatedInsigniaWatchView;
  v2 = [(COSAnimatedInsigniaWatchView *)&v5 initWithStyle:1];
  v3 = v2;
  if (v2) {
    [(COSAnimatedInsigniaWatchView *)v2 setupInsigniaLayer];
  }
  return v3;
}

- (void)setupInsigniaLayer
{
  v3 = +[AVQueuePlayer queuePlayerWithItems:&__NSArray0__struct];
  player = self->_player;
  self->_player = v3;

  [(AVQueuePlayer *)self->_player setAllowsExternalPlayback:0];
  [(AVQueuePlayer *)self->_player setMuted:1];
  objc_super v5 = self->_player;
  long long v36 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [(AVQueuePlayer *)v5 seekToTime:&v36];
  [(AVQueuePlayer *)self->_player setActionAtItemEnd:2];
  double v6 = sub_100038168();
  double v8 = v7;
  double v10 = v9;
  v12 = [objc_alloc((Class)UIView) initWithFrame:v6, v11, v7, v9];
  deviceInsignia = self->_deviceInsignia;
  self->_deviceInsignia = v12;

  v14 = +[AVPlayerLayer playerLayerWithPlayer:self->_player];
  [v14 setFrame:CGPointZero.x, CGPointZero.y, v8, v10];
  v15 = [(UIView *)self->_deviceInsignia layer];
  [v15 addSublayer:v14];

  [(COSAnimatedInsigniaWatchView *)self addSubview:self->_deviceInsignia];
  v16 = +[PBBridgeWatchAttributeController sharedDeviceController];
  v17 = (const char *)[v16 hardwareBehavior];

  if (v17)
  {
    v18 = +[UIScreen mainScreen];
    [v18 scale];
    v19 = @"@2x";
    if (v20 > 2.0) {
      v19 = @"@3x";
    }
    v21 = v19;

    v22 = +[PBBridgeWatchAttributeController sharedDeviceController];
    id v23 = [v22 material];

    v24 = +[PBBridgeWatchAttributeController sharedDeviceController];
    id v25 = [v24 size];

    id v26 = objc_alloc((Class)UIImageView);
    v27 = sub_10003393C(@"overlay", v17);
    v28 = +[PBBridgeWatchAttributeController resourceString:v27 material:v23 size:v25 forAttributes:4];
    v29 = [v28 stringByAppendingString:v21];

    v30 = sub_1000328FC((uint64_t)v29);
    v31 = +[UIImage imageNamed:v30];
    v32 = (UIImageView *)[v26 initWithImage:v31];
    overlay = self->_overlay;
    self->_overlay = v32;

    v34 = [(UIImageView *)self->_overlay layer];
    v35 = +[CAFilter filterWithType:kCAFilterMultiplyBlendMode];
    [v34 setCompositingFilter:v35];

    [(UIImageView *)self->_overlay setAlpha:0.0];
    [(UIView *)self->_deviceInsignia addSubview:self->_overlay];
  }
  [(COSAnimatedInsigniaWatchView *)self loadInsigniaAsset];
}

- (BOOL)_verboseMALogging
{
  if (qword_10029B070 != -1) {
    dispatch_once(&qword_10029B070, &stru_100244D68);
  }
  return byte_10029B068;
}

- (void)loadInsigniaAsset
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = sub_100038290();
  objc_super v5 = sub_100038328();
  double v6 = sub_1000383E8();
  if ([(COSAnimatedInsigniaWatchView *)self _verboseMALogging])
  {
    double v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = +[PBBridgeWatchAttributeController sharedDeviceController];
      double v9 = [v8 attributesDescription];
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HW Details: %@", buf, 0xCu);
    }
    double v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "outro1Resource: %@", buf, 0xCu);
    }

    double v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "outro2Resource: %@", buf, 0xCu);
    }

    v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "outro2FallbackResource: %@", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  v13 = sub_1000328F0();
  v14 = [v3 URLForResource:v4 withExtension:@"mov" subdirectory:v13];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100068B0C;
  v22 = &unk_100244D90;
  objc_copyWeak(&v26, (id *)buf);
  id v15 = v5;
  id v23 = v15;
  id v16 = v3;
  id v24 = v16;
  id v17 = v6;
  id v25 = v17;
  [(COSAnimatedInsigniaWatchView *)self addItemWithURL:v14 completion:&v19];

  v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:self selector:"playerItemDidReachEnd:" name:AVPlayerItemDidPlayToEndTimeNotification object:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)COSAnimatedInsigniaWatchView;
  [(COSAnimatedInsigniaWatchView *)&v4 layoutSubviews];
  overlay = self->_overlay;
  [(UIView *)self->_deviceInsignia bounds];
  -[UIImageView setFrame:](overlay, "setFrame:");
}

- (void)addItemWithURL:(id)a3 completion:(id)a4
{
  id v5 = a4;
  +[AVURLAsset assetWithURL:a3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100069260;
  v8[3] = &unk_1002441B0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  id v6 = v5;
  id v7 = v9;
  [v7 loadValuesAsynchronouslyForKeys:&off_10025BCB0 completionHandler:v8];
}

- (void)setAssetsLoaded:(BOOL)a3
{
  self->_assetsLoaded = a3;
  [(COSAnimatedInsigniaWatchView *)self _maybePresentInsignia];
}

- (void)_maybePresentInsignia
{
  if (self->_assetsLoaded)
  {
    v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      magicCodeOutroPerMaterial = self->_magicCodeOutroPerMaterial;
      int v6 = 136315394;
      id v7 = "-[COSAnimatedInsigniaWatchView _maybePresentInsignia]";
      __int16 v8 = 2112;
      id v9 = magicCodeOutroPerMaterial;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s -- magicCodeOutroPerMaterial: %@", (uint8_t *)&v6, 0x16u);
    }

    if (PBLogPerformanceMetrics())
    {
      id v5 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v5 beginMacroActivity:@"COSPreWristUIWaitPhase" beginTime:CFAbsoluteTimeGetCurrent()];
    }
    [(AVQueuePlayer *)self->_player insertItem:self->_magicCodeOutro afterItem:0];
    [(AVQueuePlayer *)self->_player insertItem:self->_magicCodeOutroPerMaterial afterItem:self->_magicCodeOutro];
    [(AVQueuePlayer *)self->_player play];
  }
}

- (void)playerItemDidReachEnd:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000695A4;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)moveOutroToInsignia
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:0];

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"com.apple.PreferencesApp.willBecomeActive" object:0];

  [(AVQueuePlayer *)self->_player pause];
  id v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    magicCodeOutroPerMaterial = self->_magicCodeOutroPerMaterial;
    LODWORD(buf.value) = 136315394;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[COSAnimatedInsigniaWatchView moveOutroToInsignia]";
    LOWORD(buf.flags) = 2112;
    *(void *)((char *)&buf.flags + 2) = magicCodeOutroPerMaterial;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- magicCodeOutroPerMaterial: %@", (uint8_t *)&buf, 0x16u);
  }

  memset(&buf, 0, sizeof(buf));
  id v7 = self->_magicCodeOutroPerMaterial;
  if (v7) {
    [(AVPlayerItem *)v7 duration];
  }
  memset(&v14, 0, sizeof(v14));
  CMTimeMake(&v14, 1, 60);
  CMTime lhs = buf;
  CMTime v11 = v14;
  CMTimeSubtract(&v13, &lhs, &v11);
  CMTime buf = v13;
  if (v13.flags)
  {
    player = self->_player;
    CMTime v13 = buf;
    [(AVQueuePlayer *)player seekToTime:&v13];
  }
  overlay = self->_overlay;
  if (overlay) {
    [(UIImageView *)overlay setAlpha:1.0];
  }
  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"COSOutroAnimationFinishedNotification" object:0];
}

- (UIView)deviceInsignia
{
  return self->_deviceInsignia;
}

- (void)setDeviceInsignia:(id)a3
{
}

- (AVQueuePlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayerItem)magicCodeOutro
{
  return self->_magicCodeOutro;
}

- (void)setMagicCodeOutro:(id)a3
{
}

- (AVPlayerItem)magicCodeOutroPerMaterial
{
  return self->_magicCodeOutroPerMaterial;
}

- (void)setMagicCodeOutroPerMaterial:(id)a3
{
}

- (BOOL)assetsLoaded
{
  return self->_assetsLoaded;
}

- (UIImageView)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (UIImageView)genericMask
{
  return self->_genericMask;
}

- (void)setGenericMask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericMask, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_magicCodeOutroPerMaterial, 0);
  objc_storeStrong((id *)&self->_magicCodeOutro, 0);
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_deviceInsignia, 0);
}

@end