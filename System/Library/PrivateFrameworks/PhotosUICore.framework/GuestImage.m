@interface GuestImage
@end

@implementation GuestImage

void ___GuestImage_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] greenColor];
  uint64_t v0 = _ImageWithSymbolName(@"7.circle", v2);
  v1 = (void *)_GuestImage__image;
  _GuestImage__image = v0;
}

@end