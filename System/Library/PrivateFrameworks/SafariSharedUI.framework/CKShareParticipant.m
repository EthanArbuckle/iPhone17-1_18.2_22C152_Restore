@interface CKShareParticipant
@end

@implementation CKShareParticipant

void __67__CKShareParticipant_WBSUICKShareParticipantExtras__safari_contact__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
  v5[0] = v0;
  id v1 = objc_alloc_init(MEMORY[0x1E4F1BB40]);
  v2 = [v1 descriptorForRequiredKeys];
  v5[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  v4 = (void *)safari_contact_keyDescriptors;
  safari_contact_keyDescriptors = v3;
}

@end