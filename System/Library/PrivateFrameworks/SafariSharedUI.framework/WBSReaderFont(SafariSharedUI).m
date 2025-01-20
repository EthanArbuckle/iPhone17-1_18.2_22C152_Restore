@interface WBSReaderFont(SafariSharedUI)
- (id)fontOfSize:()SafariSharedUI;
- (uint64_t)isReadyToUse;
- (void)isInstalledWithCompletionHandler:()SafariSharedUI;
@end

@implementation WBSReaderFont(SafariSharedUI)

- (uint64_t)isReadyToUse
{
  v2 = [MEMORY[0x1E4F42A30] familyNames];
  v3 = [a1 familyName];
  if ([v2 containsObject:v3]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [a1 isInstalled];
  }

  return v4;
}

- (void)isInstalledWithCompletionHandler:()SafariSharedUI
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19[0] = *MEMORY[0x1E4F24538];
  v5 = [a1 familyName];
  uint64_t v6 = *MEMORY[0x1E4F24510];
  v20[0] = v5;
  v20[1] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = *MEMORY[0x1E4F24518];
  v19[1] = v6;
  v19[2] = v7;
  v20[2] = MEMORY[0x1E4F1CC38];
  v8 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3]);

  id v9 = objc_alloc_init(MEMORY[0x1E4F983D8]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__WBSReaderFont_SafariSharedUI__isInstalledWithCompletionHandler___block_invoke;
  v17[3] = &__block_descriptor_40_e5_v8__0l;
  v17[4] = v8;
  [v9 setHandler:v17];
  CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v8, 0);
  if ([(__CFArray *)MatchingFontDescriptors count])
  {
    v18 = v8;
    CFArrayRef v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 0;
    progressBlock[0] = MEMORY[0x1E4F143A8];
    progressBlock[1] = 3221225472;
    progressBlock[2] = __66__WBSReaderFont_SafariSharedUI__isInstalledWithCompletionHandler___block_invoke_2;
    progressBlock[3] = &unk_1E5E45F00;
    v14 = v15;
    id v13 = v4;
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v11, 0, progressBlock);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)fontOfSize:()SafariSharedUI
{
  uint64_t v5 = [a1 type];
  if (v5 == 2)
  {
    uint64_t v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:a2];
    v8 = [v7 fontDescriptor];
    id v9 = [v8 fontDescriptorWithDesign:*MEMORY[0x1E4F43838]];

    v2 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v9 size:a2];

LABEL_6:
    goto LABEL_8;
  }
  if (v5 != 1)
  {
    if (v5) {
      goto LABEL_8;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F42A30];
    uint64_t v7 = [a1 familyName];
    v2 = [v6 fontWithName:v7 size:a2];
    goto LABEL_6;
  }
  v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:a2];
LABEL_8:
  return v2;
}

@end