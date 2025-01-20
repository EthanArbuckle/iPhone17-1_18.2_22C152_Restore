@interface UIPasteboard(MobileSafariFrameworkExtras)
+ (BOOL)safari_canCopyLinksForTabs:()MobileSafariFrameworkExtras;
- (void)_safari_copyRichText:()MobileSafariFrameworkExtras withPlainTextFallback:;
- (void)safari_copyLinksForTabGroup:()MobileSafariFrameworkExtras;
- (void)safari_copyLinksForTabs:()MobileSafariFrameworkExtras;
@end

@implementation UIPasteboard(MobileSafariFrameworkExtras)

+ (BOOL)safari_canCopyLinksForTabs:()MobileSafariFrameworkExtras
{
  return objc_msgSend(MEMORY[0x1E4FB60A0], "linkCountForTabs:") != 0;
}

- (void)safari_copyLinksForTabGroup:()MobileSafariFrameworkExtras
{
  id v4 = a3;
  id v6 = [v4 richTextForPasteboard];
  v5 = [v4 plainTextForPasteboard];

  if (v6 && v5) {
    objc_msgSend(a1, "_safari_copyRichText:withPlainTextFallback:", v6, v5);
  }
}

- (void)safari_copyLinksForTabs:()MobileSafariFrameworkExtras
{
  id v4 = (void *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  objc_msgSend(v4, "safari_richListOfLinksForTabs:", v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = objc_msgSend(NSString, "safari_listOfLinksForTabs:", v5);

  if (v8) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    objc_msgSend(a1, "_safari_copyRichText:withPlainTextFallback:", v8, v6);
  }
}

- (void)_safari_copyRichText:()MobileSafariFrameworkExtras withPlainTextFallback:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v9 = [(id)*MEMORY[0x1E4F444A0] identifier];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__UIPasteboard_MobileSafariFrameworkExtras___safari_copyRichText_withPlainTextFallback___block_invoke;
  v19[3] = &unk_1E54EC698;
  id v20 = v6;
  id v10 = v6;
  [v8 registerItemForTypeIdentifier:v9 loadHandler:v19];

  v11 = [(id)*MEMORY[0x1E4F44470] identifier];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __88__UIPasteboard_MobileSafariFrameworkExtras___safari_copyRichText_withPlainTextFallback___block_invoke_5;
  v17 = &unk_1E54EC698;
  id v18 = v7;
  id v12 = v7;
  [v8 registerItemForTypeIdentifier:v11 loadHandler:&v14];

  v21[0] = v8;
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 1, v14, v15, v16, v17);
  [a1 setItemProviders:v13];
}

@end