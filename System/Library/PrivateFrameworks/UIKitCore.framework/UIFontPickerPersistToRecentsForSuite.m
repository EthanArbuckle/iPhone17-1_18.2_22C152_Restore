@interface UIFontPickerPersistToRecentsForSuite
@end

@implementation UIFontPickerPersistToRecentsForSuite

void ___UIFontPickerPersistToRecentsForSuite_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = +[_UIFontPickerFontInfo infoWithName:](_UIFontPickerFontInfo, "infoWithName:");
  if ([v3 isFontFamilyAvailable])
  {
    v4 = [v3 familyName];
    v5 = [*(id *)(a1 + 32) familyName];
    char v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

@end