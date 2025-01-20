@interface DecodeFrameSynchronously
@end

@implementation DecodeFrameSynchronously

uint64_t __jpeg_DecodeFrameSynchronously_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2 && !*(unsigned char *)(v2 + 240)) {
    *(unsigned char *)(v2 + 240) = 1;
  }
  return VTDecoderSessionEmitDecodedFrame();
}

@end