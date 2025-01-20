@interface MKAudioDecoder
- (MKAudioDecoder)init;
@end

@implementation MKAudioDecoder

- (MKAudioDecoder)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKAudioDecoder;
  v2 = [(MKVideoDecoder *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKVideoDecoder *)v2 setMediaType:*MEMORY[0x263EF9CE8]];
  }
  return v3;
}

@end