@interface PUCAMReviewAssetsFigDecodeItem
- (PUCAMReviewAssetsFigDecodeItem)initWithImageURL:(id)a3 targetSize:(CGSize)a4;
- (id)decodeSessionOptions;
- (void)cancelRequest;
@end

@implementation PUCAMReviewAssetsFigDecodeItem

- (void)cancelRequest
{
}

- (id)decodeSessionOptions
{
  v7.receiver = self;
  v7.super_class = (Class)PUCAMReviewAssetsFigDecodeItem;
  v3 = [(PLFigPreheatItem *)&v7 initialDecodeSessionOptions];
  v6.receiver = self;
  v6.super_class = (Class)PUCAMReviewAssetsFigDecodeItem;
  v4 = [(PLFigPreheatItem *)&v6 decodeSessionOptions];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F56288]];
  if (v4) {
    [v3 addEntriesFromDictionary:v4];
  }

  return v3;
}

- (PUCAMReviewAssetsFigDecodeItem)initWithImageURL:(id)a3 targetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  objc_super v7 = [a3 path];
  v10.receiver = self;
  v10.super_class = (Class)PUCAMReviewAssetsFigDecodeItem;
  v8 = -[PLFigPreheatItem initWithImagePath:format:imageType:optimalSourcePixelSize:options:](&v10, sel_initWithImagePath_format_imageType_optimalSourcePixelSize_options_, v7, 10000, 0, 3, width, height);

  return v8;
}

@end