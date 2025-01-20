@interface PVComputeGrabCut
- (BOOL)processImage:(id)a3 trimap:(id)a4 roi:(CGRect)a5 clusters:(int)a6 gamma:(float)a7 iterations:(int)a8 mask:(id)a9;
- (PVComputeGrabCut)init;
- (void)dealloc;
- (void)reset;
@end

@implementation PVComputeGrabCut

- (PVComputeGrabCut)init
{
  v3.receiver = self;
  v3.super_class = (Class)PVComputeGrabCut;
  if ([(PVComputeGrabCut *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  module = self->_module;
  if (module) {
    (*((void (**)(HFGrabCutInterface *, SEL))module->var0 + 1))(module, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)PVComputeGrabCut;
  [(PVComputeGrabCut *)&v4 dealloc];
}

- (void)reset
{
}

- (BOOL)processImage:(id)a3 trimap:(id)a4 roi:(CGRect)a5 clusters:(int)a6 gamma:(float)a7 iterations:(int)a8 mask:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a9;
  v17 = (__CVBuffer *)[v14 cvPixelBuffer];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v17);
  if (PixelFormatType == 1111970369)
  {
    int v19 = 23;
  }
  else if (PixelFormatType == 1380401729)
  {
    int v19 = 24;
  }
  else
  {
    NSLog(&cfstr_ErrorImagePixe.isa);
    int v19 = 0;
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v17, v19, 0, &v30);
  v20 = (__CVBuffer *)[v15 cvPixelBuffer];
  if (CVPixelBufferGetPixelFormatType(v20) == 1278226488)
  {
    int v21 = 1;
  }
  else
  {
    NSLog(&cfstr_ErrorTripmapPi.isa);
    int v21 = 0;
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v20, v21, 0, &v29);
  v22 = (__CVBuffer *)[v16 cvPixelBuffer];
  if (CVPixelBufferGetPixelFormatType(v22) == 1278226488)
  {
    int v23 = 1;
  }
  else
  {
    NSLog(&cfstr_ErrorMaskPixel.isa);
    int v23 = 0;
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v22, v23, 0, &v28);
  HGCVBitmap::lock(v30, 1uLL);
  HGCVBitmap::lock(v29, 0);
  HGCVBitmap::lock((HGCVBitmap *)v28, 0);
  HFGrabCutInterface::InitDataModels(self->_module, (HGBitmap *)v30, (HGBitmap *)v29, a6);
  *(float *)&double v24 = a7;
  HFGrabCutInterface::GenerateMask(self->_module, (HGBitmap *)v30, (HGBitmap *)v29, v28, v24, v25, v26);
  HGCVBitmap::unlock(v30, 1uLL);
  HGCVBitmap::unlock(v29, 0);
  HGCVBitmap::unlock((HGCVBitmap *)v28, 0);
  if (v28) {
    (*(void (**)(HGBitmap *))(*(void *)v28 + 24))(v28);
  }
  if (v29) {
    (*(void (**)(HGCVBitmap *))(*(void *)v29 + 24))(v29);
  }
  if (v30) {
    (*(void (**)(HGCVBitmap *))(*(void *)v30 + 24))(v30);
  }

  return 1;
}

@end