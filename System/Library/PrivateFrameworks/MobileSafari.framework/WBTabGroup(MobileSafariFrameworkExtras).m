@interface WBTabGroup(MobileSafariFrameworkExtras)
- (BOOL)hasTextForPasteboard;
- (id)plainTextForPasteboard;
- (id)richTextForPasteboard;
- (uint64_t)_sf_isOppositeBrowsingModeOfTabGroup:()MobileSafariFrameworkExtras;
- (uint64_t)tabCountForPasteboard;
@end

@implementation WBTabGroup(MobileSafariFrameworkExtras)

- (BOOL)hasTextForPasteboard
{
  return [a1 tabCountForPasteboard] != 0;
}

- (id)plainTextForPasteboard
{
  char v2 = [a1 isNamed];
  v3 = NSString;
  v4 = [a1 unpinnedTabs];
  v5 = objc_msgSend(v3, "safari_listOfLinksForTabs:", v4);

  if (v5) {
    char v6 = v2;
  }
  else {
    char v6 = 0;
  }
  if (v6)
  {
    v7 = NSString;
    v8 = [a1 title];
    uint64_t v9 = [v7 stringWithFormat:@"%@\n%@", v8, v5];

    v5 = (void *)v9;
  }

  return v5;
}

- (id)richTextForPasteboard
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 isNamed];
  v3 = (void *)MEMORY[0x1E4F28B18];
  v4 = [a1 unpinnedTabs];
  v5 = objc_msgSend(v3, "safari_richListOfLinksForTabs:includingBulletForSingleLink:", v4, v2);

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    if (v2)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
      v8 = [a1 title];
      uint64_t v14 = *MEMORY[0x1E4FB06F8];
      uint64_t v9 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:14.0];
      v15[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v11 = (void *)[v7 initWithString:v8 attributes:v10];
      [v6 appendAttributedString:v11];

      v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      [v6 appendAttributedString:v12];
    }
    [v6 appendAttributedString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (uint64_t)tabCountForPasteboard
{
  v1 = (void *)MEMORY[0x1E4FB60A0];
  uint64_t v2 = [a1 unpinnedTabs];
  uint64_t v3 = [v1 linkCountForTabs:v2];

  return v3;
}

- (uint64_t)_sf_isOppositeBrowsingModeOfTabGroup:()MobileSafariFrameworkExtras
{
  id v4 = a3;
  LODWORD(a1) = [a1 isPrivateBrowsing];
  uint64_t v5 = a1 ^ [v4 isPrivateBrowsing];

  return v5;
}

@end