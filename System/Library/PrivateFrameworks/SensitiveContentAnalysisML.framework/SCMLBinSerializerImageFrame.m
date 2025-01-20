@interface SCMLBinSerializerImageFrame
- (CGImage)cgImage;
- (NSData)imageData;
- (NSString)recordID;
- (SCMLBinSerializerImageFrame)initWithKey:(id)a3 value:(id)a4;
- (__CVBuffer)pixelBuffer;
- (__CVBuffer)pixelBufferWithFormat:(id)a3;
- (id)ciImage;
- (void)setImageData:(id)a3;
- (void)setRecordID:(id)a3;
@end

@implementation SCMLBinSerializerImageFrame

- (SCMLBinSerializerImageFrame)initWithKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCMLBinSerializerImageFrame;
  v9 = [(SCMLBinSerializerImageFrame *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordID, a3);
    objc_storeStrong((id *)&v10->_imageData, a4);
  }

  return v10;
}

- (id)ciImage
{
  id v3 = objc_alloc(MEMORY[0x263F00650]);
  v4 = [(SCMLBinSerializerImageFrame *)self imageData];
  v5 = (void *)[v3 initWithData:v4];

  return v5;
}

- (CGImage)cgImage
{
  id v3 = objc_alloc(MEMORY[0x263F00650]);
  v4 = [(SCMLBinSerializerImageFrame *)self imageData];
  v5 = (void *)[v3 initWithData:v4];

  if (v5)
  {
    v6 = (CGImage *)[v5 CGImage];
    if (!v6)
    {
      id v7 = [v5 properties];
      uint64_t v8 = *MEMORY[0x263F0F4C8];
      v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F0F4C8]];
      if (v9)
      {
        v10 = [v5 properties];
        v11 = [v10 objectForKeyedSubscript:v8];
        uint64_t v12 = [v11 intValue];
      }
      else
      {
        uint64_t v12 = 1;
      }
      v13 = [v5 imageByApplyingCGOrientation:v12];
      v14 = [MEMORY[0x263F00628] context];
      [v13 extent];
      v6 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:", v13);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (__CVBuffer)pixelBuffer
{
  return [(SCMLBinSerializerImageFrame *)self pixelBufferWithFormat:0];
}

- (__CVBuffer)pixelBufferWithFormat:(id)a3
{
  id v4 = a3;
  v5 = [(SCMLBinSerializerImageFrame *)self cgImage];
  v6 = v5;
  if (v5)
  {
    id v7 = (__CVBuffer *)pixelBufferFromCGImage(v5, v4);
    CGImageRelease(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)recordID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRecordID:(id)a3
{
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

@end