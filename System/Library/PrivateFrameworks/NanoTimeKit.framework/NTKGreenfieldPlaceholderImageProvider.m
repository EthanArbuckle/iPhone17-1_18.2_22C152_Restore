@interface NTKGreenfieldPlaceholderImageProvider
+ (id)provider;
- (BOOL)isEqual:(id)a3;
- (UIImage)appIcon;
- (double)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAppIcon:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation NTKGreenfieldPlaceholderImageProvider

+ (id)provider
{
  return +[NTKGreenfieldPlaceholderImageProvider imageProviderWithImageViewCreationHandler:&__block_literal_global_132];
}

NTKGreenfieldPlaceholderView *__49__NTKGreenfieldPlaceholderImageProvider_provider__block_invoke(double a1, double a2)
{
  v2 = -[NTKGreenfieldPlaceholderView initWithFrame:]([NTKGreenfieldPlaceholderView alloc], "initWithFrame:", 0.0, 0.0, a1, a2);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 progress];
    if (CLKFloatEqualsFloat())
    {
      appIcon = self->_appIcon;
      v7 = [v5 appIcon];
      char v8 = NTKEqualObjects(appIcon, v7);
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKGreenfieldPlaceholderImageProvider;
  id v4 = [(CLKImageProvider *)&v7 copyWithZone:a3];
  id v5 = v4;
  if (v4)
  {
    [v4 setProgress:self->_progress];
    [v5 setAppIcon:self->_appIcon];
  }
  return v5;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (void)setAppIcon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end