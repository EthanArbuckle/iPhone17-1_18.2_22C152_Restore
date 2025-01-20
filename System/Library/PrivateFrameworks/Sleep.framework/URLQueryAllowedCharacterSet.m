@interface URLQueryAllowedCharacterSet
@end

@implementation URLQueryAllowedCharacterSet

uint64_t ___URLQueryAllowedCharacterSet_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  v1 = (void *)qword_1EB538548;
  qword_1EB538548 = (uint64_t)v0;

  v2 = (void *)qword_1EB538548;
  v3 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  v4 = (void *)qword_1EB538548;
  return [v4 removeCharactersInString:@"="];
}

@end