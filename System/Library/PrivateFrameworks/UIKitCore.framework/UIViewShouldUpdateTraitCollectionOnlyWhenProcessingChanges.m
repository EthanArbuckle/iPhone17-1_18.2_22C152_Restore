@interface UIViewShouldUpdateTraitCollectionOnlyWhenProcessingChanges
@end

@implementation UIViewShouldUpdateTraitCollectionOnlyWhenProcessingChanges

void ___UIViewShouldUpdateTraitCollectionOnlyWhenProcessingChanges_block_invoke()
{
  int v0 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ViewTraitCollectionUpdateMode, @"ViewTraitCollectionUpdateMode", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  uint64_t v1 = qword_1EB257AF0;
  if (v0) {
    uint64_t v1 = 0;
  }
  if (v1 == -1) {
    goto LABEL_9;
  }
  if (v1 == 1)
  {
    char v2 = 1;
    goto LABEL_12;
  }
  if (!dyld_program_sdk_at_least())
  {
LABEL_9:
    char v2 = 0;
    goto LABEL_12;
  }
  v3 = _UIMainBundleIdentifier();
  if ([v3 isEqualToString:@"com.apple.siri"]) {
    char v2 = 0;
  }
  else {
    char v2 = [v3 isEqualToString:@"com.apple.mobilecal"] ^ 1;
  }

LABEL_12:
  byte_1EB25C0B5 = v2;
}

@end