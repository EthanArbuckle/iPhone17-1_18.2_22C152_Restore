@interface PLAssetImageGenerator
- (AVAssetImageGenerator)imageGenerator;
- (BOOL)inUse;
- (PLAssetImageGenerator)initWithAsset:(id)a3;
- (void)dealloc;
- (void)setImageGenerator:(id)a3;
- (void)setInUse:(BOOL)a3;
@end

@implementation PLAssetImageGenerator

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void)setImageGenerator:(id)a3
{
}

- (AVAssetImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (void)dealloc
{
  [(AVAssetImageGenerator *)[(PLAssetImageGenerator *)self imageGenerator] cancelAllCGImageGeneration];
  [(PLAssetImageGenerator *)self setImageGenerator:0];
  v3.receiver = self;
  v3.super_class = (Class)PLAssetImageGenerator;
  [(PLAssetImageGenerator *)&v3 dealloc];
}

- (PLAssetImageGenerator)initWithAsset:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLAssetImageGenerator;
  v4 = [(PLAssetImageGenerator *)&v6 init];
  if (v4) {
    -[PLAssetImageGenerator setImageGenerator:](v4, "setImageGenerator:", (id)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:a3]);
  }
  return v4;
}

@end