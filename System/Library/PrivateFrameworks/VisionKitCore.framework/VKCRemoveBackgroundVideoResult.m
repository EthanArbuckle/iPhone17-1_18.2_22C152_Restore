@interface VKCRemoveBackgroundVideoResult
- (CGSize)canvasSize;
- (MADVideoRemoveBackgroundResult)madResult;
- (NSData)data;
- (NSNumber)animatedStickerScore;
- (UTType)utType;
- (VKCRemoveBackgroundVideoRequest)request;
- (VKCRemoveBackgroundVideoResult)initWithMADVideoResult:(id)a3 request:(id)a4;
- (void)generateVideoSizeWithData:(id)a3;
- (void)setAnimatedStickerScore:(id)a3;
- (void)setCanvasSize:(CGSize)a3;
- (void)setMadResult:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation VKCRemoveBackgroundVideoResult

- (VKCRemoveBackgroundVideoResult)initWithMADVideoResult:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VKCRemoveBackgroundVideoResult;
  v9 = [(VKCRemoveBackgroundVideoResult *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_madResult, a3);
    objc_storeStrong((id *)&v10->_request, a4);
    v10->_canvasSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v11 = [(MADVideoRemoveBackgroundResult *)v10->_madResult data];
    [(VKCRemoveBackgroundVideoResult *)v10 generateVideoSizeWithData:v11];
  }
  return v10;
}

- (void)generateVideoSizeWithData:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  if (v4)
  {
    CFDataRef v15 = v4;
    v5 = CGImageSourceCreateWithData(v4, 0);
    CFDataRef v4 = v15;
    if (v5)
    {
      CFDictionaryRef v6 = CGImageSourceCopyProperties(v5, 0);
      id v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FB18]];
      id v8 = v7;
      if (v7)
      {
        v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FB08]];
        [v9 doubleValue];
        double v11 = v10;

        v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FB00]];
        [v12 doubleValue];
        double v14 = v13;

        -[VKCRemoveBackgroundVideoResult setCanvasSize:](self, "setCanvasSize:", v11, v14);
      }
      CFRelease(v5);

      CFDataRef v4 = v15;
    }
  }
}

- (UTType)utType
{
  v2 = [(VKCRemoveBackgroundVideoResult *)self madResult];
  v3 = [v2 uniformTypeIdentifier];

  return (UTType *)v3;
}

- (NSData)data
{
  v2 = [(VKCRemoveBackgroundVideoResult *)self madResult];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void)setAnimatedStickerScore:(id)a3
{
}

- (MADVideoRemoveBackgroundResult)madResult
{
  return self->_madResult;
}

- (void)setMadResult:(id)a3
{
}

- (VKCRemoveBackgroundVideoRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_madResult, 0);
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
}

@end