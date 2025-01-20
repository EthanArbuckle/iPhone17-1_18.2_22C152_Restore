@interface PVCameraFrameSet
- ($01BB1521EC52D44A8E7628F5261DCEC8)orientation;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (AVDepthData)depthData;
- (CGAffineTransform)colorTransform;
- (CGAffineTransform)depthTransform;
- (NSDictionary)metadata;
- (PVCameraFrameSet)initWithColorBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 metadata:(id)a5;
- (PVCameraFrameSet)initWithColorBuffer:(opaqueCMSampleBuffer *)a3 metadata:(id)a4;
- (PVImageBuffer)alphaMaskImageBuffer;
- (PVImageBuffer)colorImageBuffer;
- (double)rollRadians;
- (int64_t)cameraPosition;
- (int64_t)deviceOrientation;
- (opaqueCMSampleBuffer)colorSampleBuffer;
- (void)_sharedInitColorBuffer:(opaqueCMSampleBuffer *)a3 colorTransform:(CGAffineTransform *)a4 depthData:(id)a5 depthTransform:(CGAffineTransform *)a6 metadata:(id)a7;
- (void)dealloc;
- (void)setAlphaMaskImageBuffer:(id)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setColorTransform:(CGAffineTransform *)a3;
- (void)setDepthTransform:(CGAffineTransform *)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setOrientation:(id)a3;
- (void)setRollRadians:(double)a3;
@end

@implementation PVCameraFrameSet

- (PVCameraFrameSet)initWithColorBuffer:(opaqueCMSampleBuffer *)a3 metadata:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PVCameraFrameSet;
  v7 = [(PVCameraFrameSet *)&v14 init];
  v8 = v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v12[0] = *MEMORY[0x1E4F1DAB8];
    v12[1] = v9;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v11[0] = v12[0];
    v11[1] = v9;
    v11[2] = v13;
    [(PVCameraFrameSet *)v7 _sharedInitColorBuffer:a3 colorTransform:v12 depthData:0 depthTransform:v11 metadata:v6];
  }

  return v8;
}

- (PVCameraFrameSet)initWithColorBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 metadata:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PVCameraFrameSet;
  v10 = [(PVCameraFrameSet *)&v17 init];
  v11 = v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v15[0] = *MEMORY[0x1E4F1DAB8];
    v15[1] = v12;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v14[0] = v15[0];
    v14[1] = v12;
    v14[2] = v16;
    [(PVCameraFrameSet *)v10 _sharedInitColorBuffer:a3 colorTransform:v15 depthData:v8 depthTransform:v14 metadata:v9];
  }

  return v11;
}

- (void)_sharedInitColorBuffer:(opaqueCMSampleBuffer *)a3 colorTransform:(CGAffineTransform *)a4 depthData:(id)a5 depthTransform:(CGAffineTransform *)a6 metadata:(id)a7
{
  long long v12 = (AVDepthData *)a5;
  long long v13 = (NSDictionary *)a7;
  self->_colorSampleBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  long long v14 = *(_OWORD *)&a4->a;
  long long v15 = *(_OWORD *)&a4->tx;
  *(_OWORD *)&self->_colorTransform.c = *(_OWORD *)&a4->c;
  *(_OWORD *)&self->_colorTransform.tx = v15;
  *(_OWORD *)&self->_colorTransform.a = v14;
  depthData = self->_depthData;
  self->_depthData = v12;
  v21 = v12;

  long long v17 = *(_OWORD *)&a6->a;
  long long v18 = *(_OWORD *)&a6->tx;
  *(_OWORD *)&self->_depthTransform.c = *(_OWORD *)&a6->c;
  *(_OWORD *)&self->_depthTransform.tx = v18;
  *(_OWORD *)&self->_depthTransform.a = v17;
  alphaMaskImageBuffer = self->_alphaMaskImageBuffer;
  self->_alphaMaskImageBuffer = 0;

  metadata = self->_metadata;
  self->_metadata = v13;
}

- (void)dealloc
{
  colorSampleBuffer = self->_colorSampleBuffer;
  if (colorSampleBuffer)
  {
    CFRelease(colorSampleBuffer);
    self->_colorSampleBuffer = 0;
  }
  metadata = self->_metadata;
  self->_metadata = 0;

  v5.receiver = self;
  v5.super_class = (Class)PVCameraFrameSet;
  [(PVCameraFrameSet *)&v5 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_colorSampleBuffer;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp((CMTime *)retstr, (CMSampleBufferRef)result);
  }
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return result;
}

- (PVImageBuffer)colorImageBuffer
{
  colorSampleBuffer = self->_colorSampleBuffer;
  if (colorSampleBuffer)
  {
    colorSampleBuffer = +[PVImageBuffer imageWithCVPixelBuffer:CMSampleBufferGetImageBuffer(colorSampleBuffer)];
  }

  return (PVImageBuffer *)colorSampleBuffer;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)orientation
{
  double x = self->orientation.x;
  double y = self->orientation.y;
  double z = self->orientation.z;
  double w = self->orientation.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setOrientation:(id)a3
{
  self->orientation = ($BD458D890A0AD74B3ABF726E1329EF14)a3;
}

- (int64_t)deviceOrientation
{
  return self->deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->deviceOrientation = a3;
}

- (CGAffineTransform)colorTransform
{
  long long v3 = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].tx;
  return self;
}

- (void)setColorTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_colorTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_colorTransform.tdouble x = v4;
  *(_OWORD *)&self->_colorTransform.a = v3;
}

- (CGAffineTransform)depthTransform
{
  long long v3 = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].tx;
  return self;
}

- (void)setDepthTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_depthTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_depthTransform.tdouble x = v4;
  *(_OWORD *)&self->_depthTransform.a = v3;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (opaqueCMSampleBuffer)colorSampleBuffer
{
  return self->_colorSampleBuffer;
}

- (AVDepthData)depthData
{
  return self->_depthData;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadata:(id)a3
{
}

- (PVImageBuffer)alphaMaskImageBuffer
{
  return (PVImageBuffer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAlphaMaskImageBuffer:(id)a3
{
}

- (double)rollRadians
{
  return self->_rollRadians;
}

- (void)setRollRadians:(double)a3
{
  self->_rollRadians = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaMaskImageBuffer, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_depthData, 0);
}

@end