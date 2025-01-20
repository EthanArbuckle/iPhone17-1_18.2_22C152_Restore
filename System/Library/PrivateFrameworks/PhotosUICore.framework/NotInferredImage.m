@interface NotInferredImage
@end

@implementation NotInferredImage

void ___NotInferredImage_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] grayColor];
  uint64_t v0 = _ImageWithSymbolName(@"4.circle", v2);
  v1 = (void *)_NotInferredImage__image;
  _NotInferredImage__image = v0;
}

@end