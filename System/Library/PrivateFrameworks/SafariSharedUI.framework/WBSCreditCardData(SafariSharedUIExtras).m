@interface WBSCreditCardData(SafariSharedUIExtras)
- (id)initWithCameraReaderOutput:()SafariSharedUIExtras;
- (id)virtualCardIcon;
- (void)virtualCardArtworkWithSize:()SafariSharedUIExtras completionHandler:;
@end

@implementation WBSCreditCardData(SafariSharedUIExtras)

- (id)initWithCameraReaderOutput:()SafariSharedUIExtras
{
  v24 = a1;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    uint64_t v9 = *(void *)v32;
    uint64_t v10 = *MEMORY[0x1E4F5CD18];
    uint64_t v30 = *MEMORY[0x1E4F5CD08];
    uint64_t v29 = *MEMORY[0x1E4F5CD10];
    id v25 = v3;
    while (1)
    {
      uint64_t v11 = 0;
      uint64_t v26 = v5;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v3);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "type", v24);
        if ([v13 isEqualToString:v10])
        {
          [v12 stringValue];
          v8 = v14 = v8;
        }
        else if ([v13 isEqualToString:v30])
        {
          [v12 stringValue];
          v7 = v14 = v7;
        }
        else
        {
          if (![v13 isEqualToString:v29]) {
            goto LABEL_13;
          }
          v27 = v7;
          id v15 = v12;
          v14 = [v15 dayValue];
          [v14 integerValue];
          v16 = [v15 monthValue];
          [v16 integerValue];
          v28 = v8;
          [v15 yearValue];
          uint64_t v17 = v10;
          uint64_t v18 = v9;
          v20 = v19 = v6;
          [v20 integerValue];
          uint64_t v21 = WBSExpirationDateWithDayMonthYear();

          uint64_t v9 = v18;
          uint64_t v10 = v17;
          uint64_t v5 = v26;

          v7 = v27;
          id v3 = v25;
          v6 = (void *)v21;
          v8 = v28;
        }

LABEL_13:
        ++v11;
      }
      while (v5 != v11);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v5) {
        goto LABEL_17;
      }
    }
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
LABEL_17:
  id v22 = (id)objc_msgSend(v24, "initWithCardName:number:cardholderName:expirationDate:", 0, v8, v7, v6, v24);

  return v22;
}

- (id)virtualCardIcon
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getPKGlyphViewClass_softClass;
  uint64_t v11 = getPKGlyphViewClass_softClass;
  if (!getPKGlyphViewClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPKGlyphViewClass_block_invoke;
    v7[3] = &unk_1E5E41610;
    v7[4] = &v8;
    __getPKGlyphViewClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  uint64_t v4 = [a1 virtualCard];
  uint64_t v5 = [v4 cardIcon];

  return v5;
}

- (void)virtualCardArtworkWithSize:()SafariSharedUIExtras completionHandler:
{
  uint64_t v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F982F0] creditCardDataController];
  uint64_t v10 = [v9 artworkCache];

  uint64_t v11 = NSString;
  v12 = [a1 cardNumber];
  v13 = [v11 stringWithFormat:@"%zu, %zu x %zu", objc_msgSend(v12, "hash"), (unint64_t)a2, (unint64_t)a3];

  v14 = [v10 objectForKey:v13];
  if (v14)
  {
    v8[2](v8, v14);
  }
  else
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    id v15 = (void *)getPKAddPassesViewControllerClass_softClass;
    uint64_t v26 = getPKAddPassesViewControllerClass_softClass;
    if (!getPKAddPassesViewControllerClass_softClass)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __getPKAddPassesViewControllerClass_block_invoke;
      v22[3] = &unk_1E5E41610;
      v22[4] = &v23;
      __getPKAddPassesViewControllerClass_block_invoke((uint64_t)v22);
      id v15 = (void *)v24[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v23, 8);
    uint64_t v17 = [a1 virtualCard];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__WBSCreditCardData_SafariSharedUIExtras__virtualCardArtworkWithSize_completionHandler___block_invoke;
    v18[3] = &unk_1E5E415E8;
    v18[4] = a1;
    id v19 = v10;
    id v20 = v13;
    uint64_t v21 = v8;
    objc_msgSend(v17, "cardArtworkWithSize:completion:", v18, a2, a3);
  }
}

@end