@interface WBSSVGImageRenderingRequest
- (CGSize)imageSize;
- (NSArray)urls;
- (NSString)svgContent;
- (WBSSVGImageRenderingRequest)initWithSVGContent:(id)a3 imageSize:(CGSize)a4;
- (WBSSVGImageRenderingRequest)initWithURL:(id)a3 extraInfo:(id)a4;
- (WBSSVGImageRenderingRequest)initWithURL:(id)a3 imageSize:(CGSize)a4;
- (WBSSVGImageRenderingRequest)initWithURLs:(id)a3 imageSize:(CGSize)a4;
- (id)_imageSizeValueWithSize:(CGSize)a3;
@end

@implementation WBSSVGImageRenderingRequest

- (WBSSVGImageRenderingRequest)initWithURL:(id)a3 extraInfo:(id)a4
{
  return 0;
}

- (WBSSVGImageRenderingRequest)initWithURL:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"imageSize";
  id v7 = a3;
  v8 = -[WBSSVGImageRenderingRequest _imageSizeValueWithSize:](self, "_imageSizeValueWithSize:", width, height);
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v12.receiver = self;
  v12.super_class = (Class)WBSSVGImageRenderingRequest;
  v10 = [(WBSSiteMetadataRequest *)&v12 initWithURL:v7 extraInfo:v9];

  return v10;
}

- (WBSSVGImageRenderingRequest)initWithURLs:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"imageSize";
  id v7 = a3;
  v8 = -[WBSSVGImageRenderingRequest _imageSizeValueWithSize:](self, "_imageSizeValueWithSize:", width, height);
  v13[1] = @"urls";
  v14[0] = v8;
  v14[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v12.receiver = self;
  v12.super_class = (Class)WBSSVGImageRenderingRequest;
  v10 = [(WBSSiteMetadataRequest *)&v12 initWithURL:0 extraInfo:v9];

  return v10;
}

- (WBSSVGImageRenderingRequest)initWithSVGContent:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"imageSize";
  id v7 = a3;
  v8 = -[WBSSVGImageRenderingRequest _imageSizeValueWithSize:](self, "_imageSizeValueWithSize:", width, height);
  v13[1] = @"svgContent";
  v14[0] = v8;
  v14[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v12.receiver = self;
  v12.super_class = (Class)WBSSVGImageRenderingRequest;
  v10 = [(WBSSiteMetadataRequest *)&v12 initWithURL:0 extraInfo:v9];

  return v10;
}

- (id)_imageSizeValueWithSize:(CGSize)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", a3.width, a3.height);
}

- (CGSize)imageSize
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = [v2 objectForKeyedSubscript:@"imageSize"];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (NSString)svgContent
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = [v2 objectForKeyedSubscript:@"svgContent"];

  return (NSString *)v3;
}

- (NSArray)urls
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = [v2 objectForKeyedSubscript:@"urls"];

  return (NSArray *)v3;
}

@end