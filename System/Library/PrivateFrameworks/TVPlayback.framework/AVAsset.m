@interface AVAsset
@end

@implementation AVAsset

uint64_t __79__AVAsset_TVPAudioSubtitleAdditions__tvp_sortedSubtitleAVMediaSelectionOptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(a2, "tvp_languageCodeFromLocale");
  uint64_t v7 = objc_msgSend(v5, "tvp_languageCodeFromLocale");

  int v8 = [(id)v6 isEqual:*(void *)(a1 + 32)];
  int v9 = [(id)v7 isEqual:*(void *)(a1 + 32)];
  if (!(v6 | v7)) {
    goto LABEL_2;
  }
  if (!v6 && v7)
  {
LABEL_5:
    uint64_t v10 = 1;
    goto LABEL_14;
  }
  if (v6 && !v7)
  {
LABEL_13:
    uint64_t v10 = -1;
    goto LABEL_14;
  }
  int v11 = v9 ^ 1;
  if (((v8 ^ 1) & 1) != 0 || v11)
  {
    if ((v8 ^ 1 | v9) == 1)
    {
      if ((v8 | v11) == 1)
      {
        uint64_t v12 = *MEMORY[0x263EFF508];
        v13 = [*(id *)(a1 + 40) displayNameForKey:*MEMORY[0x263EFF508] value:v6];
        v14 = [*(id *)(a1 + 40) displayNameForKey:v12 value:v7];
        uint64_t v10 = [v13 localizedCaseInsensitiveCompare:v14];

        goto LABEL_14;
      }
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_2:
  uint64_t v10 = 0;
LABEL_14:

  return v10;
}

void __79__AVAsset_TVPAudioSubtitleAdditions__tvp_sortedSubtitleAVMediaSelectionOptions__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v15 = a2;
  int v5 = [v15 hasMediaCharacteristic:*MEMORY[0x263EF9CC0]];
  uint64_t v6 = 40;
  if (v5) {
    uint64_t v6 = 32;
  }
  [*(id *)(a1 + v6) addObject:v15];
  if (*(void *)(a1 + 72) - 1 <= a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 48) objectAtIndex:a3 + 1];
  }
  int v8 = objc_msgSend(v15, "tvp_languageCodeFromLocale");
  uint64_t v9 = objc_msgSend(v7, "tvp_languageCodeFromLocale");
  uint64_t v10 = (void *)v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
    int v8 = [NSString string];
    if (v10)
    {
LABEL_8:
      if (!v7) {
        goto LABEL_13;
      }
LABEL_12:
      if ([v8 isEqualToString:v10]) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  uint64_t v10 = [NSString string];
  if (v7) {
    goto LABEL_12;
  }
LABEL_13:
  int v11 = *(void **)(a1 + 56);
  uint64_t v12 = objc_msgSend((id)objc_opt_class(), "tvp_filteredAndSubsortedMainProgramSubtitleOptionsFromOptions:", *(void *)(a1 + 32));
  [v11 addObjectsFromArray:v12];

  v13 = *(void **)(a1 + 56);
  v14 = objc_msgSend((id)objc_opt_class(), "tvp_sortedAuxSubtitleOptionsFromOptions:", *(void *)(a1 + 40));
  [v13 addObjectsFromArray:v14];

  [*(id *)(a1 + 32) removeAllObjects];
  [*(id *)(a1 + 40) removeAllObjects];
LABEL_14:
}

uint64_t __85__AVAsset_ATVAudioSubtitleAdditionsPrivate__tvp_sortedAuxSubtitleOptionsFromOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = objc_msgSend(a2, "tvp_localizedDisplayString");
  uint64_t v6 = objc_msgSend(v4, "tvp_localizedDisplayString");

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

@end