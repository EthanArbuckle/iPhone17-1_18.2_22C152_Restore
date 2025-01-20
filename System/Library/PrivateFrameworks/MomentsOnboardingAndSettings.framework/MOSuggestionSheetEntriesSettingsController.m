@interface MOSuggestionSheetEntriesSettingsController
- (id)specifiers;
@end

@implementation MOSuggestionSheetEntriesSettingsController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(MOSuggestionSheetEntriesSettingsController *)self loadSpecifiersFromPlistName:@"MOSuggestionSheetEntriesSettings" target:self];
    [(MOSuggestionSheetEntriesSettingsController *)self setSpecifiers:v5];

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

@end