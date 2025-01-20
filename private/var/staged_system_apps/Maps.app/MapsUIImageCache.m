@interface MapsUIImageCache
+ (id)sharedCache;
+ (id)sharedCarCache;
- (BOOL)isCarPlay;
- (MapsUIImageCache)initWithCarPlay:(BOOL)a3;
- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate;
- (UIImage)searchImage;
- (double)screenScale;
- (void)dealloc;
- (void)fetchImageForKey:(id)a3 completion:(id)a4;
- (void)getImageForAppIcon:(id)a3 format:(int)a4 completion:(id)a5;
- (void)getImageForCarSmallWidget:(id)a3 completion:(id)a4;
- (void)getImageForCategory:(id)a3 completion:(id)a4;
- (void)getImageForContact:(id)a3 completion:(id)a4;
- (void)getImageForContact:(id)a3 size:(double)a4 completion:(id)a5;
- (void)getImageForContact:(id)a3 style:(int64_t)a4 tintColor:(id)a5 size:(double)a6 completion:(id)a7;
- (void)getImageForInvertedStyleAttributes:(id)a3 completion:(id)a4;
- (void)getImageForMapItem:(id)a3 completion:(id)a4;
- (void)getImageForMarkerTransparent:(BOOL)a3 completion:(id)a4;
- (void)getImageForPublisherWithIconIdentifier:(unsigned int)a3 completion:(id)a4;
- (void)getImageForRowFavorite:(id)a3 inverted:(BOOL)a4 completion:(id)a5;
- (void)getImageForRowSuggestion:(id)a3 inverted:(BOOL)a4 completion:(id)a5;
- (void)getImageForSearchResult:(id)a3 completion:(id)a4;
- (void)getImageForSpec:(id)a3 completion:(id)a4;
- (void)getImageForSpec:(id)a3 loadImageOnBackgroundQueue:(BOOL)a4 completion:(id)a5;
- (void)getImageForStyleAttributes:(id)a3 completion:(id)a4;
- (void)getImageForSuggestion:(id)a3 completion:(id)a4;
- (void)getImageForTransparentStyleAttributes:(id)a3 completion:(id)a4;
- (void)handleMemoryWarning:(id)a3;
- (void)loadImageForKey:(id)a3 loadImageOnBackgroundQueue:(BOOL)a4 withBlock:(id)a5;
- (void)setImage:(id)a3 forKey:(id)a4;
- (void)setUserInterfaceDelegate:(id)a3;
@end

@implementation MapsUIImageCache

- (MapsUIImageCache)initWithCarPlay:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MapsUIImageCache;
  v4 = [(MapsUIImageCache *)&v20 init];
  v5 = v4;
  if (v4)
  {
    v4->_isCarPlay = a3;
    v6 = (NSCache *)objc_alloc_init((Class)NSCache);
    imageCache = v5->_imageCache;
    v5->_imageCache = v6;

    [(NSCache *)v5->_imageCache setCountLimit:25];
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    loadingKeys = v5->_loadingKeys;
    v5->_loadingKeys = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fetchBlocks = v5->_fetchBlocks;
    v5->_fetchBlocks = v10;

    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    lock = v5->_lock;
    v5->_lock = (OS_dispatch_queue *)v16;

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v5 selector:"handleMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
  return v5;
}

- (double)screenScale
{
  if ([(MapsUIImageCache *)self isCarPlay])
  {
    v2 = +[CarDisplayController sharedInstance];
    v3 = [v2 screenTraitCollection];
    [v3 displayScale];
    double v5 = v4;
  }
  else
  {
    v2 = +[MKSystemController sharedInstance];
    [v2 screenScale];
    double v5 = v6;
  }

  return v5;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (void)getImageForRowFavorite:(id)a3 inverted:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [[MapsUIImageSuggestionSpec alloc] initWithFavorite:v9];

  [(MapsUIImageSuggestionSpec *)v10 setInverted:v5];
  [(MapsUIImageCache *)self getImageForSpec:v10 completion:v8];
}

- (void)getImageForSpec:(id)a3 loadImageOnBackgroundQueue:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
  [v8 setNightMode:[WeakRetained isNightMode]];

  [v8 setIsRTL:MKApplicationLayoutDirectionIsRightToLeft()];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A4CC0;
  v18[3] = &unk_1012E5D58;
  id v11 = v8;
  id v19 = v11;
  objc_super v20 = self;
  [(MapsUIImageCache *)self loadImageForKey:v11 loadImageOnBackgroundQueue:v6 withBlock:v18];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A63F0;
  v14[3] = &unk_1012FFD40;
  id v15 = v11;
  dispatch_queue_t v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v11;
  [(MapsUIImageCache *)self fetchImageForKey:v13 completion:v14];
}

- (void)loadImageForKey:(id)a3 loadImageOnBackgroundQueue:(BOOL)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    lock = self->_lock;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100060B2C;
    v13[3] = &unk_1012F7A50;
    v13[4] = self;
    id v14 = v8;
    BOOL v16 = a4;
    id v12 = v10;
    id v15 = v12;
    dispatch_sync(lock, v13);
    if (!a4) {
      v12[2](v12);
    }
  }
}

- (void)getImageForSpec:(id)a3 completion:(id)a4
{
}

- (void)fetchImageForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    uint64_t v15 = 0;
    BOOL v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_1001040E4;
    id v19 = sub_1001048F0;
    id v20 = 0;
    lock = self->_lock;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100067F18;
    v11[3] = &unk_1012FFD90;
    id v14 = &v15;
    v11[4] = self;
    id v12 = v6;
    v10 = v8;
    id v13 = v10;
    dispatch_sync(lock, v11);
    if (v16[5]) {
      v10[2](v10);
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_1001040E4;
    v22[4] = sub_1001048F0;
    id v23 = 0;
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003DD9C;
    block[3] = &unk_1012FFD68;
    id v9 = v6;
    id v18 = v9;
    id v19 = self;
    id v20 = v7;
    v21 = v22;
    dispatch_sync(lock, block);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_1000A62EC;
    id v14 = &unk_1012E73F0;
    BOOL v16 = v22;
    id v15 = v9;
    v10 = objc_retainBlock(&v11);
    if (+[NSThread isMainThread]) {
      ((void (*)(void ***))v10[2])(v10);
    }
    else {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }

    _Block_object_dispose(v22, 8);
  }
}

+ (id)sharedCache
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109670;
  block[3] = &unk_1012E63F0;
  void block[4] = a1;
  if (qword_10160FED8 != -1) {
    dispatch_once(&qword_10160FED8, block);
  }
  v2 = (void *)qword_10160FED0;

  return v2;
}

- (void)setUserInterfaceDelegate:(id)a3
{
}

+ (id)sharedCarCache
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008E0B7C;
  block[3] = &unk_1012E63F0;
  void block[4] = a1;
  if (qword_10160FEE8 != -1) {
    dispatch_once(&qword_10160FEE8, block);
  }
  v2 = (void *)qword_10160FEE0;

  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MapsUIImageCache;
  [(MapsUIImageCache *)&v4 dealloc];
}

- (void)handleMemoryWarning:(id)a3
{
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008E0C94;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_sync(lock, block);
}

- (UIImage)searchImage
{
  searchImage = self->_searchImage;
  if (!searchImage)
  {
    if ([(MapsUIImageCache *)self isCarPlay]) {
      +[UIImage _mapsCar_systemImageNamed:@"magnifyingglass"];
    }
    else {
    objc_super v4 = +[UIImage imageNamed:@"search"];
    }
    BOOL v5 = self->_searchImage;
    self->_searchImage = v4;

    searchImage = self->_searchImage;
  }

  return searchImage;
}

- (void)getImageForMapItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_opt_new();
  id v8 = [v7 _styleAttributes];

  [v9 setStyle:v8];
  [(MapsUIImageCache *)self getImageForSpec:v9 completion:v6];
}

- (void)getImageForSearchResult:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_opt_new();
  id v8 = +[GEOFeatureStyleAttributes styleAttributesForSearchResult:v7];

  [v9 setStyle:v8];
  [(MapsUIImageCache *)self getImageForSpec:v9 completion:v6];
}

- (void)getImageForCategory:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_opt_new();
  [v9 setMarkerFallback:0];
  id v8 = [v7 styleAttributes];

  [v9 setStyle:v8];
  [(MapsUIImageCache *)self getImageForSpec:v9 completion:v6];
}

- (void)getImageForContact:(id)a3 completion:(id)a4
{
}

- (void)getImageForContact:(id)a3 size:(double)a4 completion:(id)a5
{
}

- (void)getImageForContact:(id)a3 style:(int64_t)a4 tintColor:(id)a5 size:(double)a6 completion:(id)a7
{
  id v15 = a3;
  id v12 = a5;
  id v13 = (void (**)(id, void))a7;
  if (v15)
  {
    id v14 = objc_opt_new();
    [v14 setContact:v15];
    [v14 setStyle:a4];
    [v14 setTintColor:v12];
    if (a6 > 0.0) {
      [v14 setSize:a6];
    }
    [(MapsUIImageCache *)self getImageForSpec:v14 completion:v13];
  }
  else
  {
    v13[2](v13, 0);
  }
}

- (void)getImageForMarkerTransparent:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (id)objc_opt_new();
  [v7 setTransparent:v4];
  [(MapsUIImageCache *)self getImageForSpec:v7 completion:v6];
}

- (void)getImageForInvertedStyleAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setStyle:v7];

  [v8 setInverted:1];
  [(MapsUIImageCache *)self getImageForSpec:v8 completion:v6];
}

- (void)getImageForStyleAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setStyle:v7];

  [(MapsUIImageCache *)self getImageForSpec:v8 completion:v6];
}

- (void)getImageForTransparentStyleAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setStyle:v7];

  [v8 setTransparent:1];
  [(MapsUIImageCache *)self getImageForSpec:v8 completion:v6];
}

- (void)getImageForSuggestion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[MapsUIImageSuggestionSpec alloc] initWithSuggestion:v7];

  [(MapsUIImageCache *)self getImageForSpec:v8 completion:v6];
}

- (void)getImageForCarSmallWidget:(id)a3 completion:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [[MapsUIImageSuggestionSpec alloc] initWithSuggestion:v6];

  unint64_t v8 = [(MapsUIImageSuggestionSpec *)v7 suggestionType];
  if (v8 <= 0xC && ((1 << v8) & 0x1308) != 0) {
    [(MapsUIImageSuggestionSpec *)v7 setIsDashboardWidget:1];
  }
  [(MapsUIImageCache *)self getImageForSpec:v7 completion:v10];
}

- (void)getImageForRowSuggestion:(id)a3 inverted:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[MapsUIImageSuggestionSpec alloc] initWithSuggestion:v9];

  [(MapsUIImageSuggestionSpec *)v10 setInverted:v5];
  [(MapsUIImageCache *)self getImageForSpec:v10 completion:v8];
}

- (void)getImageForPublisherWithIconIdentifier:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [[MapsUIImagePublisherSpec alloc] initWithIconIdentifier:v4];
  [(MapsUIImageCache *)self getImageForSpec:v7 completion:v6];
}

- (void)getImageForAppIcon:(id)a3 format:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[MapsUIImageAppIconSpec alloc] initWithBundleIdentifier:v9 format:v5];

  [(MapsUIImageCache *)self getImageForSpec:v10 completion:v8];
}

- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);

  return (MapsUIImageCacheUserInterfaceDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userInterfaceDelegate);
  objc_storeStrong((id *)&self->_searchImage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_fetchBlocks, 0);
  objc_storeStrong((id *)&self->_loadingKeys, 0);

  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end