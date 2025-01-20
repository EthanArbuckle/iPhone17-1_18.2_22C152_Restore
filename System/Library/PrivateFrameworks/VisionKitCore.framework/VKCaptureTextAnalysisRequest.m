@interface VKCaptureTextAnalysisRequest
- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4;
- (CGRect)focusRect;
- (UIImage)image;
- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 delegate:(id)a4;
- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 focusQuad:(id)a4 delegate:(id)a5;
- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 focusRect:(CGRect)a4 delegate:(id)a5;
- (VKCaptureTextAnalysisRequestDelegate)delegate;
- (VKQuad)focusQuad;
- (id)copyWithZone:(_NSZone *)a3;
- (id)requestHandler;
@end

@implementation VKCaptureTextAnalysisRequest

- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 size];
  v8 = [(VKCaptureTextAnalysisRequest *)self initWithImage:v7 focusRect:v6 delegate:VKMRectWithSize()];

  return v8;
}

- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 focusRect:(CGRect)a4 delegate:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  id v12 = a3;
  v13 = +[VKQuad quadFromCGRect:](VKQuad, "quadFromCGRect:", x, y, width, height);
  v14 = [(VKCaptureTextAnalysisRequest *)self initWithImage:v12 focusQuad:v13 delegate:v11];

  return v14;
}

- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 focusQuad:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VKCaptureTextAnalysisRequest;
  id v12 = [(VKCaptureTextAnalysisRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    if (v10)
    {
      v14 = (VKQuad *)v10;
    }
    else
    {
      [v9 size];
      v14 = +[VKQuad quadFromCGRect:VKMRectWithSize()];
    }
    focusQuad = v13->_focusQuad;
    v13->_focusQuad = v14;

    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (CGRect)focusRect
{
  v2 = [(VKCaptureTextAnalysisRequest *)self focusQuad];
  [v2 boundingBox];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)requestHandler
{
  id v2 = [(VKCaptureTextAnalysisRequest *)self image];
  uint64_t v3 = [v2 CGImage];
  double v4 = (__IOSurface *)[v2 ioSurface];
  uint64_t v5 = vk_cgImagePropertyOrientationFromVKOrientation([v2 imageOrientation]);
  if (v3)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F45890]);
    double v7 = (void *)[v6 initWithCGImage:v3 orientation:v5 options:MEMORY[0x1E4F1CC08]];
  }
  else if (v4)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    double v7 = 0;
    if (!CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, 0, &pixelBufferOut))
    {
      id v8 = objc_alloc(MEMORY[0x1E4F45890]);
      double v7 = (void *)[v8 initWithCVPixelBuffer:pixelBufferOut orientation:v5 options:MEMORY[0x1E4F1CC08]];
    }
    CVBufferRelease(pixelBufferOut);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [VKCaptureTextAnalysisRequest alloc];
  uint64_t v5 = [(VKCaptureTextAnalysisRequest *)self image];
  [(VKCaptureTextAnalysisRequest *)self focusRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(VKCaptureTextAnalysisRequest *)self delegate];
  v15 = -[VKCaptureTextAnalysisRequest initWithImage:focusRect:delegate:](v4, "initWithImage:focusRect:delegate:", v5, v14, v7, v9, v11, v13);

  return v15;
}

- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(VKCaptureTextAnalysisRequest *)self image];
  double v8 = objc_msgSend(v7, "vk_PNGData");

  double v9 = [v6 URLByAppendingPathComponent:@"RequestAsset.png"];

  LOBYTE(a4) = [v8 writeToURL:v9 options:2 error:a4];
  return (char)a4;
}

- (UIImage)image
{
  return self->_image;
}

- (VKQuad)focusQuad
{
  return self->_focusQuad;
}

- (VKCaptureTextAnalysisRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCaptureTextAnalysisRequestDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusQuad, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end