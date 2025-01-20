@interface UIFontPickerAnalyticsEventFontSelected
@end

@implementation UIFontPickerAnalyticsEventFontSelected

id ___UIFontPickerAnalyticsEventFontSelected_block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"selectedFont";
  v4[1] = @"selectedFontFamily";
  v1 = *(__CFString **)(a1 + 40);
  if (!v1) {
    v1 = @"unknownFamilyName";
  }
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end