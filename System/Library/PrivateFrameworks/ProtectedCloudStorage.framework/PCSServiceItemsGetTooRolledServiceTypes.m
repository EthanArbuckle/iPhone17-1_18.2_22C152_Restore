@interface PCSServiceItemsGetTooRolledServiceTypes
@end

@implementation PCSServiceItemsGetTooRolledServiceTypes

void ___PCSServiceItemsGetTooRolledServiceTypes_block_invoke()
{
  v3[16] = *MEMORY[0x1E4F143B8];
  v3[0] = kPCSBTCloudPairing;
  v3[1] = @"IdentityServicesEngram";
  v3[2] = kPCSServiceKeyboardServicesSecure;
  v3[3] = kPCSServiceRoutined;
  v3[4] = kPCSServiceHealthSync;
  v3[5] = kPCSServiceSiriProfile;
  v3[6] = kPCSServiceSiriKnowledge;
  v3[7] = kPCSServiceKnowledgestore;
  v3[8] = kPCSServiceWalletPaymentServices;
  v3[9] = kPCSServiceNewsContent;
  v3[10] = kPCSBTCloudPairing;
  v3[11] = kPCSMessagesDevelopment;
  v3[12] = kPCSMessages;
  v3[13] = kPCSIDServicesEngram;
  v3[14] = kPCSCoreSuggestionsPseudoEvents;
  v3[15] = kPCSAccessibilityVOPronunciation;
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:16];
  uint64_t v1 = [MEMORY[0x1E4F1CAD0] setWithArray:v0];
  v2 = (void *)_PCSServiceItemsGetTooRolledServiceTypes_tooRolled;
  _PCSServiceItemsGetTooRolledServiceTypes_tooRolled = v1;
}

@end