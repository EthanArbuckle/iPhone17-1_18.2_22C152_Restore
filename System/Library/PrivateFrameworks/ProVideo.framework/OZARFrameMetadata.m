@interface OZARFrameMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataItemIdentifier;
+ (opaqueCMFormatDescription)metadataFormat;
- (CGSize)cameraImageResolution;
- (OZARFrameMetadata)initWithCameraTransform:(double)a3 cameraIntrinsics:(double)a4 cameraImageResolution:(double)a5;
- (OZARFrameMetadata)initWithCoder:(id)a3;
- (__n128)cameraIntrinsics;
- (__n128)cameraTransform;
- (__n128)setCameraIntrinsics:(__n128)a3;
- (__n128)setCameraTransform:(__n128)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraImageResolution:(CGSize)a3;
@end

@implementation OZARFrameMetadata

- (OZARFrameMetadata)initWithCameraTransform:(double)a3 cameraIntrinsics:(double)a4 cameraImageResolution:(double)a5
{
  v27.receiver = a1;
  v27.super_class = (Class)OZARFrameMetadata;
  v17 = [(OZARFrameMetadata *)&v27 init];
  v18 = v17;
  if (v17)
  {
    -[OZARFrameMetadata setCameraTransform:](v17, "setCameraTransform:", a2, a3, a4, a5);
    -[OZARFrameMetadata setCameraIntrinsics:](v18, "setCameraIntrinsics:", a6, a7, a8);
    -[OZARFrameMetadata setCameraImageResolution:](v18, "setCameraImageResolution:", a10, a11);
  }
  return v18;
}

+ (opaqueCMFormatDescription)metadataFormat
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __35__OZARFrameMetadata_metadataFormat__block_invoke;
  block[3] = &unk_1E616BC38;
  block[4] = a1;
  if (+[OZARFrameMetadata metadataFormat]::onceToken != -1) {
    dispatch_once(&+[OZARFrameMetadata metadataFormat]::onceToken, block);
  }
  return (opaqueCMFormatDescription *)+[OZARFrameMetadata metadataFormat]::metadataFormat;
}

uint64_t __35__OZARFrameMetadata_metadataFormat__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) createMetadataFormat];
  +[OZARFrameMetadata metadataFormat]::metadataFormat = result;
  return result;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)OZARFrameMetadata;
  id v4 = [(OZARFrameMetadata *)&v14 description];
  v5 = NSString;
  [(OZARFrameMetadata *)self cameraTransform];
  uint64_t v6 = objc_msgSend(v5, "oz_stringWithMatrixFloat4x4:precision:", 4);
  v7 = NSString;
  [(OZARFrameMetadata *)self cameraIntrinsics];
  uint64_t v8 = objc_msgSend(v7, "oz_stringWithMatrixFloat3x3:precision:", 4);
  v9 = NSNumber;
  [(OZARFrameMetadata *)self cameraImageResolution];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = NSNumber;
  [(OZARFrameMetadata *)self cameraImageResolution];
  return (id)[v3 stringWithFormat:@"%@\ncameraTransform:\n%@\ncameraIntrinsics:\n%@\ncameraImageResolution: {%@, %@}", v4, v6, v8, v10, objc_msgSend(v11, "numberWithDouble:", v12)];
}

+ (id)metadataItemIdentifier
{
  return (id)[MEMORY[0x1E4F16558] identifierForKey:@"com.apple.videoapps.arfx.metadata.frame" keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OZARFrameMetadata)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)OZARFrameMetadata;
  id v4 = [(OZARFrameMetadata *)&v15 init];
  if (v4)
  {
    objc_msgSend(a3, "oz_decodeMatrixFloat4x4ForKey:", @"cameraTransform");
    -[OZARFrameMetadata setCameraTransform:](v4, "setCameraTransform:");
    objc_msgSend(a3, "oz_decodeFloat2ForKey:", @"cameraIntrinsicsFocalLength");
    uint64_t v14 = v5;
    objc_msgSend(a3, "oz_decodeFloat2ForKey:", @"cameraIntrinsicsPrincipalPoint");
    LODWORD(v6) = 0;
    HIDWORD(v6) = HIDWORD(v14);
    __asm { FMOV            V2.4S, #1.0 }
    -[OZARFrameMetadata setCameraIntrinsics:](v4, "setCameraIntrinsics:", COERCE_DOUBLE((unint64_t)v14), v6, v12);
    objc_msgSend(a3, "oz_decodeCGSizeForKey:", @"cameraImageResolution");
    -[OZARFrameMetadata setCameraImageResolution:](v4, "setCameraImageResolution:");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [(OZARFrameMetadata *)self cameraTransform];
  objc_msgSend(a3, "oz_encodeMatrixFloat4x4:forKey:", @"cameraTransform");
  [(OZARFrameMetadata *)self cameraIntrinsics];
  unsigned int v8 = v5;
  [(OZARFrameMetadata *)self cameraIntrinsics];
  objc_msgSend(a3, "oz_encodeFloat2:forKey:", @"cameraIntrinsicsFocalLength", COERCE_DOUBLE(__PAIR64__(v6, v8)));
  [(OZARFrameMetadata *)self cameraIntrinsics];
  objc_msgSend(a3, "oz_encodeFloat2:forKey:", @"cameraIntrinsicsPrincipalPoint", v7);
  [(OZARFrameMetadata *)self cameraImageResolution];

  objc_msgSend(a3, "oz_encodeCGSize:forKey:", @"cameraImageResolution");
}

- (__n128)cameraTransform
{
  return a1[5];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (__n128)cameraIntrinsics
{
  return a1[2];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (CGSize)cameraImageResolution
{
  double width = self->_cameraImageResolution.width;
  double height = self->_cameraImageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCameraImageResolution:(CGSize)a3
{
  self->_cameraImageResolution = a3;
}

@end