@interface CKAllowedSharingOptions(ReminderKitAdditions)
+ (id)rem_remindersAllowedSharingOptions;
@end

@implementation CKAllowedSharingOptions(ReminderKitAdditions)

+ (id)rem_remindersAllowedSharingOptions
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F19E40]) initWithAllowedParticipantPermissionOptions:2 allowedParticipantAccessOptions:2];

  return v0;
}

@end