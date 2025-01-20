@interface PTAssetReaderComposedFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (PTAssetReaderComposedFrame)initWithTime:(id *)a3 colorBuffer:(__CVBuffer *)a4 auxBuffer:(__CVBuffer *)a5;
- (__CVBuffer)auxBuffer;
- (__CVBuffer)colorBuffer;
- (void)dealloc;
@end

@implementation PTAssetReaderComposedFrame

- (PTAssetReaderComposedFrame)initWithTime:(id *)a3 colorBuffer:(__CVBuffer *)a4 auxBuffer:(__CVBuffer *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)PTAssetReaderComposedFrame;
  v8 = [(PTAssetReaderComposedFrame *)&v13 init];
  v9 = (PTAssetReaderComposedFrame *)v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a3->var0;
    *((void *)v8 + 5) = a3->var3;
    *(_OWORD *)(v8 + 24) = v10;
    *((void *)v8 + 1) = CVPixelBufferRetain(a4);
    v9->_auxBuffer = CVPixelBufferRetain(a5);
    v11 = v9;
  }

  return v9;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_colorBuffer);
  CVPixelBufferRelease(self->_auxBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PTAssetReaderComposedFrame;
  [(PTAssetReaderComposedFrame *)&v3 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (__CVBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (__CVBuffer)auxBuffer
{
  return self->_auxBuffer;
}

@end