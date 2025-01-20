@interface NTKStringFromEditModeDict
@end

@implementation NTKStringFromEditModeDict

void ___NTKStringFromEditModeDict_block_invoke()
{
  v3[10] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E29E8;
  v2[1] = &unk_1F16E2EC8;
  v3[0] = @"color";
  v3[1] = @"detail";
  v2[2] = &unk_1F16E2A00;
  v2[3] = &unk_1F16E2A18;
  v3[2] = @"content";
  v3[3] = @"typeface";
  v2[4] = &unk_1F16E2A30;
  v2[5] = &unk_1F16E2EE0;
  v3[4] = @"position";
  v3[5] = @"style";
  v2[6] = &unk_1F16E2A48;
  v2[7] = &unk_1F16E2A60;
  v3[6] = @"data-sources";
  v3[7] = @"background";
  v2[8] = &unk_1F16E2A78;
  v2[9] = &unk_1F16E2A90;
  v3[8] = @"night";
  v3[9] = @"numerals";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:10];
  v1 = (void *)_NTKStringFromEditModeDict_dictionary;
  _NTKStringFromEditModeDict_dictionary = v0;
}

@end