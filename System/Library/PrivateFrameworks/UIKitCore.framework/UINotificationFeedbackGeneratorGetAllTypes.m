@interface UINotificationFeedbackGeneratorGetAllTypes
@end

@implementation UINotificationFeedbackGeneratorGetAllTypes

void ___UINotificationFeedbackGeneratorGetAllTypes_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
  v1 = (void *)qword_1EB25CBD8;
  qword_1EB25CBD8 = v0;

  for (uint64_t i = 0; i != 3; ++i)
  {
    v3 = (void *)qword_1EB25CBD8;
    v4 = [NSNumber numberWithInteger:i];
    [v3 addObject:v4];
  }
  uint64_t v5 = [(id)qword_1EB25CBD8 mutableCopy];
  v6 = (void *)qword_1EB25CBE0;
  qword_1EB25CBE0 = v5;

  for (uint64_t j = 1000; j != 1027; ++j)
  {
    v8 = (void *)qword_1EB25CBE0;
    v9 = [NSNumber numberWithInteger:j];
    [v8 addObject:v9];
  }
}

@end