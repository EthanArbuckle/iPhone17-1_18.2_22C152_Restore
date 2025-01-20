@interface AXKonaBuffer
- (AVAudioPCMBuffer)buffer;
- (NSArray)markers;
- (void)setBuffer:(id)a3;
- (void)setMarkers:(id)a3;
@end

@implementation AXKonaBuffer

- (AVAudioPCMBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (NSArray)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markers, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end