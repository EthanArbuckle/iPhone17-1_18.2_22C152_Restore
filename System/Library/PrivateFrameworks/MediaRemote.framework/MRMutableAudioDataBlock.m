@interface MRMutableAudioDataBlock
- (void)setBuffer:(id)a3;
- (void)setGain:(float)a3;
- (void)setTime:(id)a3;
@end

@implementation MRMutableAudioDataBlock

- (void)setBuffer:(id)a3
{
  v5 = (MRAudioBuffer *)a3;
  buffer = self->super._buffer;
  p_buffer = &self->super._buffer;
  if (buffer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_buffer, a3);
    v5 = v8;
  }
}

- (void)setTime:(id)a3
{
  self->super._time = ($40B6730AB05BD5F005A117FA3F32FE52)a3;
}

- (void)setGain:(float)a3
{
  self->super._gain = a3;
}

@end