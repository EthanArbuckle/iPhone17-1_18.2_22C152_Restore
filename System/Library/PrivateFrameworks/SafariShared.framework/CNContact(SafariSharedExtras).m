@interface CNContact(SafariSharedExtras)
+ (id)safari_defaultDescriptors;
+ (id)safari_imageViewDescriptors;
+ (id)safari_oneTimeCodeViewDescriptors;
- (id)safari_valueForWBSABProperty:()SafariSharedExtras;
- (uint64_t)safari_fullName;
@end

@implementation CNContact(SafariSharedExtras)

- (uint64_t)safari_fullName
{
  return [MEMORY[0x1E4F1B910] stringFromContact:a1 style:0];
}

+ (id)safari_defaultDescriptors
{
  v10[12] = *MEMORY[0x1E4F143B8];
  v0 = (void *)safari_defaultDescriptors_descriptors;
  if (!safari_defaultDescriptors_descriptors)
  {
    uint64_t v1 = *MEMORY[0x1E4F1AD90];
    v10[0] = *MEMORY[0x1E4F1AF10];
    v10[1] = v1;
    uint64_t v2 = *MEMORY[0x1E4F1ADF0];
    v10[2] = *MEMORY[0x1E4F1ADC8];
    v10[3] = v2;
    uint64_t v3 = *MEMORY[0x1E4F1AEA0];
    v10[4] = *MEMORY[0x1E4F1ADE0];
    v10[5] = v3;
    uint64_t v4 = *MEMORY[0x1E4F1AE78];
    v10[6] = *MEMORY[0x1E4F1AEE0];
    v10[7] = v4;
    uint64_t v5 = *MEMORY[0x1E4F1AFB0];
    v10[8] = *MEMORY[0x1E4F1AED8];
    v10[9] = v5;
    v10[10] = *MEMORY[0x1E4F1AE60];
    v6 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v10[11] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:12];
    v8 = (void *)safari_defaultDescriptors_descriptors;
    safari_defaultDescriptors_descriptors = v7;

    v0 = (void *)safari_defaultDescriptors_descriptors;
  }
  return v0;
}

+ (id)safari_imageViewDescriptors
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)safari_imageViewDescriptors_descriptors;
  if (!safari_imageViewDescriptors_descriptors)
  {
    uint64_t v1 = *MEMORY[0x1E4F1ADE0];
    v6[0] = *MEMORY[0x1E4F1ADF0];
    v6[1] = v1;
    uint64_t v2 = *MEMORY[0x1E4F1AE28];
    v6[2] = *MEMORY[0x1E4F1AEA0];
    v6[3] = v2;
    v6[4] = *MEMORY[0x1E4F1AF98];
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
    uint64_t v4 = (void *)safari_imageViewDescriptors_descriptors;
    safari_imageViewDescriptors_descriptors = v3;

    v0 = (void *)safari_imageViewDescriptors_descriptors;
  }
  return v0;
}

+ (id)safari_oneTimeCodeViewDescriptors
{
  if (safari_oneTimeCodeViewDescriptors_onceToken != -1) {
    dispatch_once(&safari_oneTimeCodeViewDescriptors_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)safari_oneTimeCodeViewDescriptors_descriptors;
  return v0;
}

- (id)safari_valueForWBSABProperty:()SafariSharedExtras
{
  uint64_t v2 = +[WBSContactsHelper CNContactKeyFromWBSABKey:](WBSContactsHelper, "CNContactKeyFromWBSABKey:");
  if ([v2 length] && objc_msgSend(a1, "isKeyAvailable:", v2))
  {
    uint64_t v3 = [a1 valueForKey:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

@end