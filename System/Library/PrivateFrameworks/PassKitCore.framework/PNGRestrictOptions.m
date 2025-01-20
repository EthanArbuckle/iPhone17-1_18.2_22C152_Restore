@interface PNGRestrictOptions
@end

@implementation PNGRestrictOptions

void ___PNGRestrictOptions_block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];

  if (([v1 isEqualToString:@"com.apple.MessagesBlastDoorService"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.MessagesAirlockService"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.SubcredentialUIService.SubcredentialInvitationMessagesExtension"] & 1) != 0|| objc_msgSend(v1, "isEqualToString:", @"com.apple.CredentialSharingService.ShareableCredentialsMessagesExtension"))
  {
    uint64_t v2 = *MEMORY[0x1E4F2FF78];
    v5[0] = *MEMORY[0x1E4F2FF48];
    v5[1] = v2;
    v6[0] = MEMORY[0x1E4F1CC38];
    v6[1] = @"public.png";
    v5[2] = *MEMORY[0x1E4F2FE80];
    v6[2] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
    v4 = (void *)qword_1EB402B18;
    qword_1EB402B18 = v3;
  }
}

@end