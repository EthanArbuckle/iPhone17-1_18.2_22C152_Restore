@interface MTArtworkView
+ (double)cornerRadiusForSize:(CGSize)a3;
- (BOOL)applyCachedImageForPodcast:(id)a3 withSize:(CGSize)a4;
- (BOOL)isEnabled;
- (BOOL)isPlaceholder;
- (MTArtworkView)initWithFrame:(CGRect)a3;
- (NSString)artworkKey;
- (void)_artworkSizeDidChange;
- (void)_reloadArtwork;
- (void)applyImageForPodcast:(id)a3 withSize:(CGSize)a4;
- (void)applyPlaceholderWithSize:(CGSize)a3;
- (void)dealloc;
- (void)setArtworkKey:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation MTArtworkView

- (MTArtworkView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MTArtworkView;
  v3 = -[MTArtworkView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_enabled = 1;
    objc_storeStrong((id *)&v3->_artworkKey, kMTLibraryDefaultImageKey);
    uint64_t v5 = +[PUIObjCArtworkProvider uiShared];
    imageProvider = v4->_imageProvider;
    v4->_imageProvider = (PUIObjCArtworkProvider *)v5;

    [(MTArtworkView *)v4 setContentMode:1];
    v7 = +[UIColor clearColor];
    [(MTArtworkView *)v4 setBackgroundColor:v7];

    v8 = +[UIScreen mainScreen];
    [v8 scale];
    double v10 = v9;

    v11 = [(MTArtworkView *)v4 layer];
    [v11 setBorderWidth:1.0 / v10];

    id v12 = +[UIColor artworkBorderColor];
    id v13 = [v12 CGColor];
    v14 = [(MTArtworkView *)v4 layer];
    [v14 setBorderColor:v13];

    v15 = [(MTArtworkView *)v4 layer];
    [v15 setCornerCurve:kCACornerCurveContinuous];

    [(MTArtworkView *)v4 setClipsToBounds:1];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTArtworkView;
  [(MTArtworkView *)&v4 dealloc];
}

+ (double)cornerRadiusForSize:(CGSize)a3
{
  double v3 = floor(a3.width);
  double result = 0.0;
  if (v3 >= 10.0)
  {
    double result = 3.0;
    if (v3 > 39.0)
    {
      if (v3 < 40.0 || (double result = 4.0, v3 > 99.0))
      {
        BOOL v5 = v3 > 279.0 || v3 < 100.0;
        double result = 8.0;
        if (!v5) {
          return 6.0;
        }
      }
    }
  }
  return result;
}

- (void)setArtworkKey:(id)a3
{
  BOOL v5 = (NSString *)a3;
  artworkKey = self->_artworkKey;
  if (artworkKey != v5)
  {
    v7 = v5;
    artworkKey = (NSString *)[(NSString *)artworkKey isEqualToString:v5];
    BOOL v5 = v7;
    if ((artworkKey & 1) == 0)
    {
      objc_storeStrong((id *)&self->_artworkKey, a3);
      artworkKey = (NSString *)[(MTArtworkView *)self _reloadArtwork];
      BOOL v5 = v7;
    }
  }

  _objc_release_x1(artworkKey, v5);
}

- (NSString)artworkKey
{
  if (self->_artworkKey) {
    return self->_artworkKey;
  }
  else {
    return (NSString *)kMTLibraryDefaultImageKey;
  }
}

- (BOOL)isPlaceholder
{
  v2 = [(MTArtworkView *)self artworkKey];
  unsigned __int8 v3 = [v2 isEqualToString:kMTLibraryDefaultImageKey];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  double v3 = 0.400000006;
  if (a3) {
    double v3 = 1.0;
  }
  [(MTArtworkView *)self setAlpha:v3];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MTArtworkView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MTArtworkView;
  -[MTArtworkView setFrame:](&v15, "setFrame:", x, y, width, height);
  [(MTArtworkView *)self frame];
  if (v9 != v13 || v11 != v12) {
    [(MTArtworkView *)self _artworkSizeDidChange];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MTArtworkView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MTArtworkView;
  -[MTArtworkView setBounds:](&v15, "setBounds:", x, y, width, height);
  [(MTArtworkView *)self bounds];
  if (v9 != v13 || v11 != v12) {
    [(MTArtworkView *)self _artworkSizeDidChange];
  }
}

- (void)_artworkSizeDidChange
{
  [(MTArtworkView *)self _reloadArtwork];
  double v3 = objc_opt_class();
  [(MTArtworkView *)self bounds];
  [v3 cornerRadiusForSize:v4, v5];
  double v7 = v6;
  id v8 = [(MTArtworkView *)self layer];
  [v8 setCornerRadius:v7];
}

- (void)_reloadArtwork
{
  [(MTArtworkView *)self bounds];
  if (v3 >= 1.0 && v4 >= 1.0)
  {
    double v6 = v3;
    double v7 = v4;
    if ([(MTArtworkView *)self isPlaceholder])
    {
      -[MTArtworkView applyPlaceholderWithSize:](self, "applyPlaceholderWithSize:", v9, v6, v7);
    }
    else if (self->_artworkKey {
           && ![(MTArtworkView *)self applyCachedImageForPodcast:v6 withSize:v7])
    }
    {
      artworkKedouble y = self->_artworkKey;
      -[MTArtworkView applyImageForPodcast:withSize:](self, "applyImageForPodcast:withSize:", artworkKey, v6, v7);
    }
  }
}

- (void)applyPlaceholderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_initWeak(&location, self);
  imageProvider = self->_imageProvider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F4D18;
  v7[3] = &unk_10054F218;
  objc_copyWeak(&v8, &location);
  -[PUIObjCArtworkProvider placeholderWithSize:completionHandler:](imageProvider, "placeholderWithSize:completionHandler:", v7, width, height);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)applyCachedImageForPodcast:(id)a3 withSize:(CGSize)a4
{
  double v5 = -[PUIObjCArtworkProvider legacyUICachedArtworkForPodcastUuid:withSize:](self->_imageProvider, "legacyUICachedArtworkForPodcastUuid:withSize:", a3, a4.width, a4.height);
  if (v5) {
    [(MTArtworkView *)self setImage:v5];
  }

  return v5 != 0;
}

- (void)applyImageForPodcast:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  objc_initWeak(&location, self);
  imageProvider = self->_imageProvider;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F4FC8;
  v9[3] = &unk_100551480;
  objc_copyWeak(&v10, &location);
  -[PUIObjCArtworkProvider keyedArtworkForShow:size:completionHandler:](imageProvider, "keyedArtworkForShow:size:completionHandler:", v7, v9, width, height);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkKey, 0);

  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end