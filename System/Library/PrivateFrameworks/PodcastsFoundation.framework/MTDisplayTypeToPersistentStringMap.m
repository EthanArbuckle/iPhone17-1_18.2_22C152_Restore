@interface MTDisplayTypeToPersistentStringMap
@end

@implementation MTDisplayTypeToPersistentStringMap

void __MTDisplayTypeToPersistentStringMap_inverted_block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F03D7FB0;
  v4[1] = &unk_1F03D8130;
  v5[0] = @"free";
  v5[1] = @"paid";
  v4[2] = &unk_1F03D8148;
  v5[2] = @"hybrid";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  v1 = (void *)MTDisplayTypeToPersistentStringMap_inverted_map;
  MTDisplayTypeToPersistentStringMap_inverted_map = v0;

  uint64_t v2 = objc_msgSend((id)MTDisplayTypeToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v3 = (void *)MTDisplayTypeToPersistentStringMap_inverted_invertedMap;
  MTDisplayTypeToPersistentStringMap_inverted_invertedMap = v2;
}

@end