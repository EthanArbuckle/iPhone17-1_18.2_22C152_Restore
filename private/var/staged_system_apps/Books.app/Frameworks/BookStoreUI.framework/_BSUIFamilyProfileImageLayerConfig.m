@interface _BSUIFamilyProfileImageLayerConfig
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (CALayer)layer;
- (Class)layerClass;
- (Class)layerClassForSize:(CGSize)a3;
- (NSString)urlString;
- (_BSUIFamilyProfileImageLayerConfig)initWithSize:(CGSize)a3 contentsScale:(double)a4 cornerRadius:(double)a5 urlString:(id)a6;
- (id)_generateImage;
- (void)_profilePictureStoreChanged:(id)a3;
- (void)configureLayer:(id)a3;
- (void)dealloc;
- (void)setLayer:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation _BSUIFamilyProfileImageLayerConfig

- (_BSUIFamilyProfileImageLayerConfig)initWithSize:(CGSize)a3 contentsScale:(double)a4 cornerRadius:(double)a5 urlString:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_BSUIFamilyProfileImageLayerConfig;
  v13 = [(_BSUIFamilyProfileImageLayerConfig *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_size.CGFloat width = width;
    v13->_size.CGFloat height = height;
    v13->_contentsScale = a4;
    v13->_cornerRadius = a5;
    objc_storeStrong((id *)&v13->_urlString, a6);
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v14 selector:"_profilePictureStoreChanged:" name:AAUIProfilePictureStoreDidChangeNotification object:0];
  }
  return v14;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AAUIProfilePictureStoreDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)_BSUIFamilyProfileImageLayerConfig;
  [(_BSUIFamilyProfileImageLayerConfig *)&v4 dealloc];
}

- (void)_profilePictureStoreChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_224C0;
  v8[3] = &unk_38E9F8;
  objc_copyWeak(&v9, &location);
  v5 = objc_retainBlock(v8);
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
      block[2] = sub_2255C;
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
  v2 = [(_BSUIFamilyProfileImageLayerConfig *)self urlString];
  v3 = +[NSURL URLWithString:v2];

  id v4 = BSUIGetFamilyMemberImage(v3);

  return v4;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (Class)layerClassForSize:(CGSize)a3
{
  return [(_BSUIFamilyProfileImageLayerConfig *)self layerClass];
}

- (void)configureLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
  id v5 = a3;
  [v5 setRasterizationScale:self->_contentsScale];
  [v5 setContentsGravity:kCAGravityResizeAspectFill];
  id v6 = [(_BSUIFamilyProfileImageLayerConfig *)self _generateImage];
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

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end