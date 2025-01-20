@interface NTKStringFromDateStyleDict
@end

@implementation NTKStringFromDateStyleDict

void ___NTKStringFromDateStyleDict_block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E2F40;
  v2[1] = &unk_1F16E2F88;
  v3[0] = @"day";
  v3[1] = @"weekday and day";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_NTKStringFromDateStyleDict_dictionary;
  _NTKStringFromDateStyleDict_dictionary = v0;
}

@end