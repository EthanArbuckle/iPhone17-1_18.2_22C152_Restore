@interface NCDefaultNotificationViewController
+ (void)initialize;
- (CGRect)mediaPlayPauseButtonFrame;
- (CGSize)_preferredContentSizeWithContainerWidth:(double)a3;
- (NCDefaultNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_primaryAttachment;
- (unint64_t)mediaPlayPauseButtonType;
- (void)_performDefaultAction;
- (void)_rewind;
- (void)_setupView;
- (void)didReceiveNotification:(id)a3;
- (void)handlePlayerItemDidPlayToEndTimeNotification:(id)a3;
- (void)handlePlayerItemFailedToPlayToEndTimeNotification:(id)a3;
- (void)mediaPause;
- (void)mediaPlay;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NCDefaultNotificationViewController

+ (void)initialize
{
  if (qword_100011990 != -1) {
    dispatch_once(&qword_100011990, &stru_10000C470);
  }
}

- (NCDefaultNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NCDefaultNotificationViewController;
  return [(NCDefaultNotificationViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)NCDefaultNotificationViewController;
  -[NCDefaultNotificationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  [(NCDefaultNotificationViewController *)self _preferredContentSizeWithContainerWidth:width];
  -[NCDefaultNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (CGSize)_preferredContentSizeWithContainerWidth:(double)a3
{
  v4 = [(NCDefaultNotificationViewController *)self _primaryAttachment];
  CFStringRef v5 = (const __CFString *)objc_msgSend(v4, "_nc_safeUTI");
  if (!UTTypeConformsTo(v5, kUTTypeAudio))
  {
    if (UTTypeConformsTo(v5, kUTTypeGIF))
    {
      objc_super v6 = [(ISAnimatedImagePlayer *)self->_animatedImagePlayer animatedImage];
      [v6 pixelSize];
    }
    else if (UTTypeConformsTo(v5, kUTTypeImage))
    {
      v7 = [(UIView *)self->_attachmentView image];
      [v7 size];
    }
    else if (UTTypeConformsTo(v5, kUTTypeMovie))
    {
      v8 = [(AVPlayer *)self->_moviePlayer currentItem];
      v9 = [v8 asset];
      v10 = [v9 tracksWithMediaType:AVMediaTypeVideo];
      v11 = [v10 firstObject];

      [v11 naturalSize];
    }
  }
  UISizeRoundToScale();
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.double width = v16;
  return result;
}

- (id)_primaryAttachment
{
  v2 = [(UNNotification *)self->_notification request];
  v3 = [v2 content];
  v4 = [v3 attachments];
  CFStringRef v5 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &stru_10000C4B0);

  return v5;
}

- (void)_setupView
{
  [(UIView *)self->_attachmentView removeFromSuperview];
  attachmentView = self->_attachmentView;
  self->_attachmentView = 0;

  v4 = [(NCDefaultNotificationViewController *)self _primaryAttachment];
  CFStringRef v5 = [v4 URL];
  [v5 startAccessingSecurityScopedResource];
  CFStringRef v6 = (const __CFString *)objc_msgSend(v4, "_nc_safeUTI");
  if (!UTTypeConformsTo(v6, kUTTypeAudio))
  {
    if (UTTypeConformsTo(v6, kUTTypeGIF))
    {
      id v25 = [objc_alloc((Class)PFAnimatedImage) initWithURL:v5];
      v26 = (ISAnimatedImagePlayer *)[objc_alloc((Class)ISAnimatedImagePlayer) initWithAnimatedImage:v25];
      animatedImagePlayer = self->_animatedImagePlayer;
      self->_animatedImagePlayer = v26;

      v28 = (UIView *)[objc_alloc((Class)ISAnimatedImageView) initWithAnimatedImagePlayer:self->_animatedImagePlayer];
      v29 = self->_attachmentView;
      self->_attachmentView = v28;

      [v25 pixelSize];
    }
    else if (UTTypeConformsTo(v6, kUTTypeImage))
    {
      v42 = [(NCDefaultNotificationViewController *)self view];
      [v42 bounds];
      double Width = CGRectGetWidth(v73);

      v44 = +[UIScreen mainScreen];
      [v44 scale];
      double v46 = v45;

      CFStringRef v70 = kCGImageSourceShouldCache;
      CFBooleanRef v71 = kCFBooleanFalse;
      id v25 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      CGImageSourceRef v47 = CGImageSourceCreateWithURL((CFURLRef)v5, (CFDictionaryRef)v25);
      if (v47)
      {
        v48 = v47;
        v68[0] = kCGImageSourceThumbnailMaxPixelSize;
        v49 = +[NSNumber numberWithDouble:Width * v46];
        v68[1] = kCGImageSourceCreateThumbnailFromImageAlways;
        v68[2] = kCGImageSourceShouldCacheImmediately;
        v69[0] = v49;
        v69[1] = kCFBooleanTrue;
        v68[3] = kCGImageSourceCreateThumbnailWithTransform;
        v69[2] = kCFBooleanTrue;
        v69[3] = kCFBooleanTrue;
        CFDictionaryRef v50 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];

        CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v48, 0, v50);
        if (ThumbnailAtIndex)
        {
          CGImageRef v52 = ThumbnailAtIndex;
          v53 = +[UIImage imageWithCGImage:ThumbnailAtIndex];
          v54 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v53];
          v55 = self->_attachmentView;
          self->_attachmentView = v54;

          [v53 size];
          CFRelease(v52);
        }
        CFRelease(v48);
      }
    }
    else
    {
      if (!UTTypeConformsTo(v6, kUTTypeMovie)) {
        goto LABEL_6;
      }
      v66 = AVURLAssetReferenceRestrictionsKey;
      v56 = +[NSNumber numberWithUnsignedInteger:0xFFFFLL];
      v67 = v56;
      id v25 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];

      id v57 = [objc_alloc((Class)AVURLAsset) initWithURL:v5 options:v25];
      id v58 = objc_alloc_init((Class)AVPlayerViewController);
      [v58 setAllowsPictureInPicturePlayback:0];
      [v58 setShowsPlaybackControls:0];
      [v58 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
      v59 = [v58 view];
      [v59 setUserInteractionEnabled:0];

      v60 = +[AVPlayerItem playerItemWithAsset:v57];
      v61 = (AVPlayer *)[objc_alloc((Class)AVPlayer) initWithPlayerItem:v60];
      moviePlayer = self->_moviePlayer;
      self->_moviePlayer = v61;

      [v58 setPlayer:self->_moviePlayer];
      v63 = +[NSNotificationCenter defaultCenter];
      [v63 addObserver:self selector:"handlePlayerItemDidPlayToEndTimeNotification:" name:AVPlayerItemDidPlayToEndTimeNotification object:0];
      [v63 addObserver:self selector:"handlePlayerItemFailedToPlayToEndTimeNotification:" name:AVPlayerItemFailedToPlayToEndTimeNotification object:0];
      [(NCDefaultNotificationViewController *)self addChildViewController:v58];
      v64 = [v58 view];
      v65 = self->_attachmentView;
      self->_attachmentView = v64;
    }
LABEL_6:
    v7 = (NCAudioPlayerControlsViewController *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_performDefaultAction"];
    [(UIView *)self->_attachmentView addGestureRecognizer:v7];
    [(UIView *)self->_attachmentView setUserInteractionEnabled:1];
    v10 = [(NCDefaultNotificationViewController *)self view];
    [v10 addSubview:self->_attachmentView];
    [(UIView *)self->_attachmentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = [(UIView *)self->_attachmentView leadingAnchor];
    v31 = [v10 leadingAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v32 setActive:1];

    v33 = [(UIView *)self->_attachmentView trailingAnchor];
    v34 = [v10 trailingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(UIView *)self->_attachmentView topAnchor];
    v37 = [v10 topAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v38 setActive:1];

    v23 = [(UIView *)self->_attachmentView bottomAnchor];
    v24 = [v10 bottomAnchor];
    v39 = [v23 constraintEqualToAnchor:v24];
    [v39 setActive:1];

    goto LABEL_7;
  }
  v7 = objc_alloc_init(NCAudioPlayerControlsViewController);
  [(NCAudioPlayerControlsViewController *)v7 setURL:v5];
  [(NCDefaultNotificationViewController *)self addChildViewController:v7];
  v8 = [(NCAudioPlayerControlsViewController *)v7 view];
  v9 = self->_attachmentView;
  self->_attachmentView = v8;

  v10 = [(NCDefaultNotificationViewController *)self view];
  [v10 addSubview:self->_attachmentView];
  [(UIView *)self->_attachmentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(UIView *)self->_attachmentView leadingAnchor];
  double v12 = [v10 leadingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12 constant:20.0];
  [v13 setActive:1];

  double v14 = [(UIView *)self->_attachmentView trailingAnchor];
  double v15 = [v10 trailingAnchor];
  double v16 = [v14 constraintEqualToAnchor:v15 constant:-16.0];
  [v16 setActive:1];

  double v17 = [(UIView *)self->_attachmentView topAnchor];
  v18 = [v10 topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:20.0];
  [v19 setActive:1];

  v20 = [(UIView *)self->_attachmentView bottomAnchor];
  v21 = [v10 bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:-24.0];
  [v22 setActive:1];

  v23 = [(UIView *)self->_attachmentView heightAnchor];
  v24 = [v23 constraintEqualToConstant:38.0];
  [v24 setActive:1];
LABEL_7:

  v40 = [(NCDefaultNotificationViewController *)self view];
  [v40 bounds];
  double v41 = CGRectGetWidth(v72);

  [(NCDefaultNotificationViewController *)self _preferredContentSizeWithContainerWidth:v41];
  -[NCDefaultNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)didReceiveNotification:(id)a3
{
  id v5 = a3;
  notification = self->_notification;
  if (!notification) {
    goto LABEL_3;
  }
  v7 = [(UNNotification *)notification request];
  v8 = [v7 identifier];
  v9 = [v5 request];
  v10 = [v9 identifier];
  unsigned int v11 = [v8 isEqualToString:v10];

  if (v11)
  {
LABEL_3:
    double v12 = (void *)qword_100011998;
    if (os_log_type_enabled((os_log_t)qword_100011998, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = v12;
      double v14 = [v5 request];
      double v15 = [v14 identifier];
      double v16 = objc_msgSend(v15, "un_logDigest");
      int v17 = 138412290;
      v18 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Default extension did receive notification %@{public}", (uint8_t *)&v17, 0xCu);
    }
    objc_storeStrong((id *)&self->_notification, a3);
    [(NCDefaultNotificationViewController *)self _setupView];
    [(ISAnimatedImagePlayer *)self->_animatedImagePlayer setPlaying:1];
  }
}

- (unint64_t)mediaPlayPauseButtonType
{
  return 2 * (self->_moviePlayer != 0);
}

- (CGRect)mediaPlayPauseButtonFrame
{
  v2 = [(NCDefaultNotificationViewController *)self view];
  [v2 bounds];
  UIRectCenteredIntegralRectScale();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)mediaPlay
{
}

- (void)mediaPause
{
}

- (void)handlePlayerItemDidPlayToEndTimeNotification:(id)a3
{
}

- (void)handlePlayerItemFailedToPlayToEndTimeNotification:(id)a3
{
}

- (void)_rewind
{
  [(AVPlayer *)self->_moviePlayer pause];
  moviePlayer = self->_moviePlayer;
  long long v5 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [(AVPlayer *)moviePlayer seekToTime:&v5];
  double v4 = [(NCDefaultNotificationViewController *)self extensionContext];
  [v4 mediaPlayingPaused];
}

- (void)_performDefaultAction
{
  id v2 = [(NCDefaultNotificationViewController *)self extensionContext];
  [v2 performNotificationDefaultAction];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentView, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_moviePlayer, 0);

  objc_storeStrong((id *)&self->_animatedImagePlayer, 0);
}

@end