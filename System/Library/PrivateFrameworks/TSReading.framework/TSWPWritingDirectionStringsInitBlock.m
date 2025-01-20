@interface TSWPWritingDirectionStringsInitBlock
@end

@implementation TSWPWritingDirectionStringsInitBlock

uint64_t s_TSWPWritingDirectionStringsInitBlock_block_invoke_4()
{
  v2[3] = *MEMORY[0x263EF8340];
  v1[0] = &unk_26D73A7A0;
  v1[1] = &unk_26D73A7B8;
  v2[0] = &unk_26D739B70;
  v2[1] = &unk_26D739B88;
  v1[2] = &unk_26D73A7D0;
  v2[2] = &unk_26D739BA0;
  return [NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:3];
}

@end