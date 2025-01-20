@interface VIStreamingSignalExtractionResult
- (NSData)payload;
- (VIImageRegion)imageRegion;
- (VIStreamingSignalExtractionResult)initWithImageRegion:(id)a3 payload:(id)a4;
@end

@implementation VIStreamingSignalExtractionResult

- (VIStreamingSignalExtractionResult)initWithImageRegion:(id)a3 payload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VIStreamingSignalExtractionResult;
  v9 = [(VIStreamingSignalExtractionResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageRegion, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

- (VIImageRegion)imageRegion
{
  return self->_imageRegion;
}

- (NSData)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_imageRegion, 0);
}

@end