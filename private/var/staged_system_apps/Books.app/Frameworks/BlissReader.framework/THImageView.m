@interface THImageView
+ (Class)layerClass;
- (CGSize)nativeSize;
- (THImageView)initWithFrame:(CGRect)a3;
- (void)setImageData:(id)a3 maxSize:(CGSize)a4 setLayerBounds:(BOOL)a5;
@end

@implementation THImageView

- (THImageView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THImageView;
  result = -[THImageView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->mNativeSize.width = 0.0;
    result->mNativeSize.height = 0.0;
  }
  return result;
}

- (void)setImageData:(id)a3 maxSize:(CGSize)a4 setLayerBounds:(BOOL)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_134E5C;
  v5[3] = &unk_459D88;
  v5[4] = a3;
  [(-[THImageView layer](self, "layer")) setImageProviderBlock:[v5 copy] setLayerBounds:a5 maxSize:&self->mNativeSize outNativeSize:a4.width, a4.height];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CGSize)nativeSize
{
  double width = self->mNativeSize.width;
  double height = self->mNativeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end