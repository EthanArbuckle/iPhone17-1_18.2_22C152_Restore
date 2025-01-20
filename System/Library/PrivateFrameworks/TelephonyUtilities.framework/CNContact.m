@interface CNContact
@end

@implementation CNContact

void __54__CNContact_TUSearchUtilities__keysToFetchForFaceTime__block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v1 = *MEMORY[0x1E4F1AE28];
  v6[0] = v0;
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AEE0];
  v6[2] = *MEMORY[0x1E4F1AF98];
  v6[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1ADA0];
  v6[4] = *MEMORY[0x1E4F1ADC8];
  v6[5] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
  v5 = (void *)keysToFetchForFaceTime_keysToFetchForFaceTime;
  keysToFetchForFaceTime_keysToFetchForFaceTime = v4;
}

@end