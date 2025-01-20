@interface ICNoteAllAccountVisibilityTesting
+ (id)sharedInstance;
- (BOOL)supportsVisibilityTestingType:(int64_t)a3;
- (id)predicateForSearchableAttachments;
- (id)predicateForSearchableNotes;
@end

@implementation ICNoteAllAccountVisibilityTesting

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_41);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

void __51__ICNoteAllAccountVisibilityTesting_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ICNoteAllAccountVisibilityTesting);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  if (!a3) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"visibilityTestingType != ICNoteVisibilityTestingTypeInvalid" functionName:"-[ICNoteAllAccountVisibilityTesting supportsVisibilityTestingType:]" simulateCrash:1 showAlert:0 format:@"Invalid visibilityTestingType"];
  }
  return a3 != 0;
}

- (id)predicateForSearchableNotes
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"isHiddenFromSearch == NO"];
}

- (id)predicateForSearchableAttachments
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"isHiddenFromSearch == NO"];
}

@end