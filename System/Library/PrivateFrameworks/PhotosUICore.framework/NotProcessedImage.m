@interface NotProcessedImage
@end

@implementation NotProcessedImage

void ___NotProcessedImage_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] grayColor];
  uint64_t v0 = _ImageWithSymbolName(@"2.circle", v2);
  v1 = (void *)_NotProcessedImage__image;
  _NotProcessedImage__image = v0;
}

@end