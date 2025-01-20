@interface UnknownImage
@end

@implementation UnknownImage

void ___UnknownImage_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] redColor];
  uint64_t v0 = _ImageWithSymbolName(@"questionmark.circle", v2);
  v1 = (void *)_UnknownImage__image;
  _UnknownImage__image = v0;
}

@end