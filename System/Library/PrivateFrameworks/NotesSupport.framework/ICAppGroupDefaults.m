@interface ICAppGroupDefaults
+ (NSUserDefaults)sharedAppGroupDefaults;
@end

@implementation ICAppGroupDefaults

void __44__ICAppGroupDefaults_sharedAppGroupDefaults__block_invoke()
{
  v7[10] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v1 = ICGroupContainerIdentifier();
  uint64_t v2 = [v0 initWithSuiteName:v1];
  v3 = (void *)sharedAppGroupDefaults_s_sharedUserDefaults;
  sharedAppGroupDefaults_s_sharedUserDefaults = v2;

  v4 = (void *)sharedAppGroupDefaults_s_sharedUserDefaults;
  v6[0] = @"EnableLinkPresentation";
  v6[1] = @"EnableXPCPreviewGeneration";
  v7[0] = MEMORY[0x263EFFA88];
  v7[1] = MEMORY[0x263EFFA88];
  v6[2] = @"EnableSmartTags";
  v6[3] = @"DefaultToPaperKitAttachments";
  v7[2] = MEMORY[0x263EFFA88];
  v7[3] = MEMORY[0x263EFFA88];
  v6[4] = @"DefaultToPaperKitPDFsAndScans";
  v6[5] = @"EnableBlockQuote";
  v7[4] = MEMORY[0x263EFFA88];
  v7[5] = MEMORY[0x263EFFA88];
  v6[6] = @"EnableNewNoteAccelerator";
  v6[7] = @"EnableSpotlightInstantAnswers";
  v7[6] = MEMORY[0x263EFFA88];
  v7[7] = MEMORY[0x263EFFA88];
  v6[8] = @"SpotlightSearchSuggestions";
  v6[9] = @"EnableEmphasis";
  v7[8] = MEMORY[0x263EFFA88];
  v7[9] = MEMORY[0x263EFFA88];
  v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:10];
  [v4 registerDefaults:v5];
}

+ (NSUserDefaults)sharedAppGroupDefaults
{
  if (sharedAppGroupDefaults_once != -1) {
    dispatch_once(&sharedAppGroupDefaults_once, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)sharedAppGroupDefaults_s_sharedUserDefaults;
  return (NSUserDefaults *)v2;
}

@end