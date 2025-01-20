@interface _BSUIProfileImageLayerConfig
- (AAUIProfilePictureStore)profilePictureStore;
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (CALayer)layer;
- (Class)layerClass;
- (Class)layerClassForSize:(CGSize)a3;
- (UIColor)maskColor;
- (_BSUIProfileImageLayerConfig)initWithSize:(CGSize)a3 contentsScale:(double)a4 cornerRadius:(double)a5 maskColor:(id)a6;
- (id)_generateImage;
- (void)_accountStoreChanged:(id)a3;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)configureLayer:(id)a3;
- (void)dealloc;
- (void)setLayer:(id)a3;
- (void)setMaskColor:(id)a3;
@end

@implementation _BSUIProfileImageLayerConfig

- (_BSUIProfileImageLayerConfig)initWithSize:(CGSize)a3 contentsScale:(double)a4 cornerRadius:(double)a5 maskColor:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_BSUIProfileImageLayerConfig;
  v13 = [(_BSUIProfileImageLayerConfig *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_size.CGFloat width = width;
    v13->_size.CGFloat height = height;
    v13->_contentsScale = a4;
    v13->_cornerRadius = a5;
    objc_storeStrong((id *)&v13->_maskColor, a6);
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v14 selector:"_accountStoreChanged:" name:AAUIProfilePictureStoreDidChangeNotification object:0];

    v16 = +[BUAccountsProvider sharedProvider];
    [v16 addObserver:v14 accountTypes:1];
  }
  return v14;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AAUIProfilePictureStoreDidChangeNotification object:0];

  v4 = +[BUAccountsProvider sharedProvider];
  [v4 removeObserver:self accountTypes:1];

  v5.receiver = self;
  v5.super_class = (Class)_BSUIProfileImageLayerConfig;
  [(_BSUIProfileImageLayerConfig *)&v5 dealloc];
}

- (void)_accountStoreChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_19908;
  v8[3] = &unk_38E9F8;
  objc_copyWeak(&v9, &location);
  objc_super v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_199A4;
      block[3] = &unk_38E0B8;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_generateImage
{
  v3 = +[BUAccountsProvider sharedProvider];
  id v4 = [v3 activeStoreAccount];

  if (!v4
    || ([(_BSUIProfileImageLayerConfig *)self profilePictureStore],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        [v5 profilePictureForAccountOwnerWithoutMonogramFallback],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    double height = self->_size.height;
    if (height < self->_size.width) {
      double height = self->_size.width;
    }
    v8 = +[UIImageSymbolConfiguration configurationWithPointSize:3 weight:3 scale:height];
    id v9 = +[UIImage systemImageNamed:@"person.crop.circle"];
    v6 = [v9 imageWithConfiguration:v8];

    v10 = [(_BSUIProfileImageLayerConfig *)self maskColor];

    if (v10)
    {
      v11 = [(_BSUIProfileImageLayerConfig *)self maskColor];
      uint64_t v12 = [v6 tui_imageMaskWithColor:v11];

      v6 = (void *)v12;
    }
  }

  return v6;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (Class)layerClassForSize:(CGSize)a3
{
  return [(_BSUIProfileImageLayerConfig *)self layerClass];
}

- (void)configureLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
  id v5 = a3;
  [v5 setRasterizationScale:self->_contentsScale];
  [v5 setContentsGravity:kCAGravityResizeAspectFill];
  id v6 = [(_BSUIProfileImageLayerConfig *)self _generateImage];
  [v5 setContents:[v6 CGImage]];
  [v5 setContentsScale:self->_contentsScale];
  [v5 setCornerRadius:self->_cornerRadius];
  [v5 setMasksToBounds:1];
}

- (BOOL)isEqualToConfig:(id)a3
{
  return self == a3;
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (AAUIProfilePictureStore)profilePictureStore
{
  v2 = +[BUAccountsProvider sharedProvider];
  v3 = [v2 iCloudAccountName];

  id v4 = +[BUAccountsProvider sharedProvider];
  id v5 = [v4 activeStoreAccount];
  id v6 = [v5 username];

  if ([v3 length] && objc_msgSend(v6, "length"))
  {
    v7 = +[BUAccountsProvider sharedProvider];
    v8 = [v7 primaryAppleAccount];

    id v9 = +[ACAccountStore bu_sharedAccountStore];
    v10 = [v9 aida_accountForPrimaryiCloudAccount];
    id v11 = [objc_alloc((Class)AAUIProfilePictureStore) initWithAppleAccount:v8 grandSlamAccount:v10 accountStore:v9];
    [v11 setMonogramType:2];
  }
  else
  {
    id v11 = 0;
  }

  return (AAUIProfilePictureStore *)v11;
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (void)setMaskColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskColor, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end