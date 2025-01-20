@interface PVARMetadata
+ (BOOL)supportsSecureCoding;
- (ARFrame)arFrame;
- (AVDepthData)depthData;
- (CGSize)cameraImageResolution;
- (PVARMetadata)initWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5;
- (PVARMetadata)initWithCoder:(id)a3;
- (PVARMetadata)initWithImageBuffer:(double)a3 depthBuffer:(double)a4 depthData:(double)a5 depthFreshness:(double)a6 segmentationBuffer:(double)a7 cameraTransform:(double)a8 cameraIntrinsics:(uint64_t)a9 cameraImageResolution:(uint64_t)a10;
- (__CVBuffer)depthBuffer;
- (__CVBuffer)imageBuffer;
- (__CVBuffer)segmentationBuffer;
- (__n128)cameraIntrinsics;
- (__n128)cameraTransform;
- (__n128)setCameraIntrinsics:(__n128)a3;
- (__n128)setCameraTransform:(__n128)a3;
- (id)description;
- (int)depthFreshness;
- (void)dealloc;
- (void)setArFrame:(id)a3;
- (void)setCameraImageResolution:(CGSize)a3;
- (void)setDepthBuffer:(__CVBuffer *)a3;
- (void)setDepthData:(id)a3;
- (void)setDepthFreshness:(int)a3;
- (void)setImageBuffer:(__CVBuffer *)a3;
- (void)setSegmentationBuffer:(__CVBuffer *)a3;
@end

@implementation PVARMetadata

- (void)dealloc
{
  CVPixelBufferRelease(self->_imageBuffer);
  CVPixelBufferRelease(self->_depthBuffer);
  CVPixelBufferRelease(self->_segmentationBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PVARMetadata;
  [(PVARMetadata *)&v3 dealloc];
}

- (PVARMetadata)initWithImageBuffer:(double)a3 depthBuffer:(double)a4 depthData:(double)a5 depthFreshness:(double)a6 segmentationBuffer:(double)a7 cameraTransform:(double)a8 cameraIntrinsics:(uint64_t)a9 cameraImageResolution:(uint64_t)a10
{
  id v22 = a12;
  v33.receiver = a1;
  v33.super_class = (Class)PVARMetadata;
  v23 = [(PVARMetadata *)&v33 init];
  v24 = v23;
  if (v23)
  {
    [(PVARMetadata *)v23 setImageBuffer:a10];
    [(PVARMetadata *)v24 setDepthBuffer:a11];
    [(PVARMetadata *)v24 setDepthData:v22];
    [(PVARMetadata *)v24 setDepthFreshness:a13];
    [(PVARMetadata *)v24 setSegmentationBuffer:a14];
    -[PVARMetadata setCameraTransform:](v24, "setCameraTransform:", a2, a3, a4, a5);
    -[PVARMetadata setCameraIntrinsics:](v24, "setCameraIntrinsics:", a6, a7, a8);
    -[PVARMetadata setCameraImageResolution:](v24, "setCameraImageResolution:", a16, a17);
  }

  return v24;
}

- (PVARMetadata)initWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 capturedImage];
  v10 = [v7 sceneDepth];
  uint64_t v11 = [v10 depthMap];
  uint64_t v12 = [v7 segmentationBuffer];
  v13 = [v7 camera];
  [v13 transform];
  double v32 = v15;
  double v33 = v14;
  double v30 = v17;
  double v31 = v16;
  v18 = [v7 camera];
  [v18 intrinsics];
  double v28 = v20;
  double v29 = v19;
  double v27 = v21;
  id v22 = [v7 camera];
  [v22 imageResolution];
  v25 = -[PVARMetadata initWithImageBuffer:depthBuffer:depthData:depthFreshness:segmentationBuffer:cameraTransform:cameraIntrinsics:cameraImageResolution:](self, "initWithImageBuffer:depthBuffer:depthData:depthFreshness:segmentationBuffer:cameraTransform:cameraIntrinsics:cameraImageResolution:", v9, v11, v8, a5, v12, v33, v32, v31, v30, v29, v28, v27, v23, v24);

  if (v25) {
    [(PVARMetadata *)v25 setArFrame:v7];
  }

  return v25;
}

- (void)setImageBuffer:(__CVBuffer *)a3
{
  self->_imageBuffer = a3;
}

- (void)setDepthBuffer:(__CVBuffer *)a3
{
  self->_depthBuffer = a3;
}

- (void)setSegmentationBuffer:(__CVBuffer *)a3
{
  self->_segmentationBuffer = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVARMetadata)initWithCoder:(id)a3
{
  return 0;
}

- (id)description
{
  v34 = NSString;
  objc_super v3 = NSNumber;
  imageBuffer = self->_imageBuffer;
  if (imageBuffer) {
    size_t Width = CVPixelBufferGetWidth(imageBuffer);
  }
  else {
    size_t Width = 0;
  }
  v35 = [v3 numberWithUnsignedLong:Width];
  v6 = NSNumber;
  id v7 = self->_imageBuffer;
  if (v7) {
    size_t Height = CVPixelBufferGetHeight(v7);
  }
  else {
    size_t Height = 0;
  }
  uint64_t v9 = [v6 numberWithUnsignedLong:Height];
  v10 = NSNumber;
  depthBuffer = self->_depthBuffer;
  if (depthBuffer) {
    size_t v12 = CVPixelBufferGetWidth(depthBuffer);
  }
  else {
    size_t v12 = 0;
  }
  v13 = [v10 numberWithUnsignedLong:v12];
  double v14 = NSNumber;
  double v15 = self->_depthBuffer;
  if (v15) {
    size_t v16 = CVPixelBufferGetHeight(v15);
  }
  else {
    size_t v16 = 0;
  }
  double v17 = [v14 numberWithUnsignedLong:v16];
  int depthFreshness = self->_depthFreshness;
  double v19 = NSNumber;
  depthData = self->_depthData;
  segmentationBuffer = self->_segmentationBuffer;
  if (segmentationBuffer) {
    size_t v22 = CVPixelBufferGetWidth(segmentationBuffer);
  }
  else {
    size_t v22 = 0;
  }
  uint64_t v23 = [v19 numberWithUnsignedLong:v22];
  uint64_t v24 = NSNumber;
  v25 = self->_segmentationBuffer;
  if (v25) {
    size_t v26 = CVPixelBufferGetHeight(v25);
  }
  else {
    size_t v26 = 0;
  }
  if (depthFreshness) {
    double v27 = @"Stale";
  }
  else {
    double v27 = @"Fresh";
  }
  double v28 = [v24 numberWithUnsignedLong:v26];
  double v29 = NSStringFromSIMDFloat4x4(2, *(simd_float4x4 *)&self[1].super.isa);
  double v30 = NSStringFromSIMDFloat3x3(2, *(simd_float3x3 *)self->_anon_50);
  double v31 = NSStringFromCGSize(self->_cameraImageResolution);
  double v32 = [v34 stringWithFormat:@"<Image %@x%@> <Depth %@x%@> <DepthData %@> <DepthFreshness %@> <Segmentation %@x%@> <CameraTransform %@> <CameraIntrinsics %@> <CameraResolution %@>", v35, v9, v13, v17, depthData, v27, v23, v28, v29, v30, v31];

  return v32;
}

- (ARFrame)arFrame
{
  return self->_arFrame;
}

- (void)setArFrame:(id)a3
{
}

- (__CVBuffer)imageBuffer
{
  return self->_imageBuffer;
}

- (__CVBuffer)depthBuffer
{
  return self->_depthBuffer;
}

- (AVDepthData)depthData
{
  return self->_depthData;
}

- (void)setDepthData:(id)a3
{
}

- (int)depthFreshness
{
  return self->_depthFreshness;
}

- (void)setDepthFreshness:(int)a3
{
  self->_int depthFreshness = a3;
}

- (__CVBuffer)segmentationBuffer
{
  return self->_segmentationBuffer;
}

- (__n128)cameraTransform
{
  return a1[8];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (__n128)cameraIntrinsics
{
  return a1[5];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthData, 0);

  objc_storeStrong((id *)&self->_arFrame, 0);
}

@end