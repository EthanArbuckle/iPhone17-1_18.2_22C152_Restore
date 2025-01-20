@interface PTAssetDataBufferFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (__CVBuffer)dataBuffer;
- (unint64_t)index;
- (void)dealloc;
- (void)setDataBuffer:(__CVBuffer *)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setTime:(id *)a3;
@end

@implementation PTAssetDataBufferFrame

- (void)dealloc
{
  CVPixelBufferRelease(self->_dataBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PTAssetDataBufferFrame;
  [(PTAssetDataBufferFrame *)&v3 dealloc];
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (__CVBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(__CVBuffer *)a3
{
  self->_dataBuffer = a3;
}

@end