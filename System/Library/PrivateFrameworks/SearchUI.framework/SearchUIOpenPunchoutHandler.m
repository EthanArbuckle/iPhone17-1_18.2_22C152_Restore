@interface SearchUIOpenPunchoutHandler
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
+ (id)queryItemValueForName:(id)a3 inURL:(id)a4;
+ (void)handlePunchout:(id)a3 triggerEvent:(unint64_t)a4;
- (BOOL)prefersModalPresentation;
- (BOOL)schemeSupportedForCopyAndShare;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (id)defaultSymbolName;
- (id)defaultTitle;
- (id)destinationPunchout;
- (id)itemProvider;
- (id)url;
- (void)fetchShareableURLWithCompletionHandler:(id)a3;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIOpenPunchoutHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 selectableGridPunchoutIndex];
  v7 = [v5 punchouts];

  if (v6 < 1 || [v7 count] <= (unint64_t)v6)
  {
    v8 = [v7 firstObject];
  }
  else
  {
    v8 = [v7 objectAtIndexedSubscript:v6];
  }
  v9 = v8;
  v10 = [v8 preferredOpenableURL];

  if (v10)
  {
    v10 = objc_opt_new();
    [v10 setPunchout:v9];
  }

  return v10;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6 = [(SearchUIOpenPunchoutHandler *)self destinationPunchout];
  +[SearchUIOpenPunchoutHandler handlePunchout:v6 triggerEvent:a4];
}

+ (void)handlePunchout:(id)a3 triggerEvent:(unint64_t)a4
{
  id v8 = a3;
  id v5 = [v8 preferredOpenableURL];
  id v6 = [v8 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.contacts"];

  if (a4 == 7)
  {
    if (([v5 isFileURL] ^ 1 | v7) != 1) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a4 != 22 || (([v5 isFileURL] ^ 1 | v7) & 1) != 0) {
LABEL_6:
  }
    +[SearchUIUtilities openPunchout:v8];
LABEL_7:
}

- (BOOL)prefersModalPresentation
{
  v2 = [(SearchUIOpenPunchoutHandler *)self url];
  v3 = [v2 host];
  char v4 = [v3 isEqualToString:@"events.shazam.apple.com"];

  return v4;
}

- (id)destinationPunchout
{
  v2 = [(SearchUICommandHandler *)self command];
  v3 = [v2 punchout];

  return v3;
}

- (id)url
{
  v2 = [(SearchUIOpenPunchoutHandler *)self destinationPunchout];
  v3 = [v2 preferredOpenableURL];

  return v3;
}

- (BOOL)schemeSupportedForCopyAndShare
{
  v2 = [(SearchUIOpenPunchoutHandler *)self url];
  v3 = [v2 scheme];
  char v4 = [v3 lowercaseString];

  LOBYTE(v2) = [&unk_1F404AFC8 containsObject:v4];
  return (char)v2;
}

- (void)fetchShareableURLWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(SearchUIOpenPunchoutHandler *)self url];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)defaultTitle
{
  return @"Open Link";
}

- (id)defaultSymbolName
{
  return @"safari";
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v4 = [(SearchUIOpenPunchoutHandler *)self destinationPunchout];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v4 urls];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v6)
  {
    v16 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      v11 = [v10 scheme];
      if ([v11 isEqualToString:@"stocks"])
      {
        v17 = [(id)objc_opt_class() queryItemValueForName:@"symbol" inURL:v10];
        v16 = (void *)[objc_alloc(MEMORY[0x1E4FA8070]) initWithStockTicker:v17];

LABEL_19:
        goto LABEL_20;
      }
      v12 = [v10 host];
      int v13 = [v12 isEqualToString:@"weather.apple.com"];

      if (v13)
      {
        v16 = (void *)[objc_alloc(MEMORY[0x1E4FB6048]) initWithURL:v10];
        goto LABEL_19;
      }
      if ([MEMORY[0x1E4F820A8] canOpenURL:v10])
      {
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F820A8]) initWithURL:v10];
        [v16 setLinkPreviewing:1];
        goto LABEL_19;
      }
      if (([v4 hasClip] & 1) == 0)
      {
        if ([&unk_1F404AFE0 containsObject:v11])
        {
          v14 = [v10 host];
          char v15 = [&unk_1F404AFF8 containsObject:v14];

          if ((v15 & 1) == 0)
          {
            v16 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v10];
            [v16 _setShowingLinkPreviewWithMinimalUI:1];
            goto LABEL_19;
          }
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    v16 = 0;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_20:

  return v16;
}

+ (id)queryItemValueForName:(id)a3 inURL:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F29088] componentsWithURL:a4 resolvingAgainstBaseURL:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(v6, "queryItems", 0);
  uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 name];
        char v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          uint64_t v8 = [v11 value];
          goto LABEL_11;
        }
      }
      uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)itemProvider
{
  id v3 = objc_alloc(MEMORY[0x1E4F28D78]);
  char v4 = [(SearchUIOpenPunchoutHandler *)self url];
  id v5 = (void *)[v3 initWithObject:v4];

  return v5;
}

@end