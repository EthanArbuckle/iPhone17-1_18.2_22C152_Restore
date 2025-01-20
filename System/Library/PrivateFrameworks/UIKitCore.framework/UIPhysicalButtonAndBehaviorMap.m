@interface UIPhysicalButtonAndBehaviorMap
@end

@implementation UIPhysicalButtonAndBehaviorMap

void ___UIPhysicalButtonAndBehaviorMap_block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1ED3F2B38;
  v2[1] = &unk_1ED3F2AC0;
  v3[0] = &unk_1ED3EF110;
  v3[1] = &unk_1ED3EF128;
  v2[2] = &unk_1ED3F2AD8;
  v3[2] = &unk_1ED3EF140;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)qword_1EB25EEF0;
  qword_1EB25EEF0 = v0;
}

@end