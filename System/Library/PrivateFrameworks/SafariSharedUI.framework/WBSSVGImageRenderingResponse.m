@interface WBSSVGImageRenderingResponse
- (UIImage)image;
- (WBSSVGImageRenderingResponse)initWithURL:(id)a3;
- (WBSSVGImageRenderingResponse)initWithURL:(id)a3 image:(id)a4;
@end

@implementation WBSSVGImageRenderingResponse

- (WBSSVGImageRenderingResponse)initWithURL:(id)a3
{
  return [(WBSSVGImageRenderingResponse *)self initWithURL:a3 image:0];
}

- (WBSSVGImageRenderingResponse)initWithURL:(id)a3 image:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSSVGImageRenderingResponse;
  v8 = [(WBSSiteMetadataResponse *)&v12 initWithURL:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a4);
    v10 = v9;
  }

  return v9;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

@end