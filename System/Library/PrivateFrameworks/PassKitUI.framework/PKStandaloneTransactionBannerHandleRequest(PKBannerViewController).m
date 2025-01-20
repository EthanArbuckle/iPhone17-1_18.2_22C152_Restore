@interface PKStandaloneTransactionBannerHandleRequest(PKBannerViewController)
- (id)createBannerViewController;
@end

@implementation PKStandaloneTransactionBannerHandleRequest(PKBannerViewController)

- (id)createBannerViewController
{
  v2 = [MEMORY[0x1E4F84898] sharedInstance];
  v3 = [a1 passUniqueIdentifier];
  v4 = [v2 passWithUniqueID:v3];

  uint64_t v5 = [a1 transactionType];
  if (v5 == 1)
  {
    v6 = @"lock.fill";
    v7 = @"TRANSACTION_LOCKED";
  }
  else
  {
    if (v5 != 2)
    {
      v9 = 0;
LABEL_14:
      id v17 = 0;
      goto LABEL_28;
    }
    v6 = @"lock.open.fill";
    v7 = @"TRANSACTION_UNLOCKED";
  }
  uint64_t v8 = PKLocalizedCredentialString(&v7->isa);
  v9 = (void *)v8;
  if (v4) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    goto LABEL_14;
  }
  v11 = [v4 secureElementPass];
  v12 = [a1 displayableName];
  int v13 = [v11 isHomeKeyPass];
  int v14 = SBSIsSystemApertureAvailable();
  if (v13 && v12)
  {
    if (v14)
    {
      id v15 = v12;
      id v16 = v9;
    }
    else
    {
      id v15 = v9;
      id v16 = v12;
    }
    id v26 = v16;
    v27 = 0;
    uint64_t v28 = 2;
  }
  else
  {
    if (v14)
    {
      id v15 = [v4 localizedDescription];
      v18 = [v4 organizationName];
      v19 = v18;
      if (v15)
      {
        unint64_t v20 = [v15 length];
        uint64_t v21 = [v19 length];
        if (v20 > v21 + 1)
        {
          uint64_t v22 = v21;
          uint64_t v31 = v21 + 1;
          if ([v15 hasPrefix:v19])
          {
            v23 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            int v24 = objc_msgSend(v23, "characterIsMember:", objc_msgSend(v15, "characterAtIndex:", v22));

            if (v24)
            {
              uint64_t v25 = [v15 substringFromIndex:v31];

              id v15 = (id)v25;
            }
          }
        }
      }
      else
      {
        id v15 = v18;
      }
      id v26 = v9;

      v27 = 0;
    }
    else
    {
      id v15 = v9;
      id v26 = [v4 localizedDescription];
      v27 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    }
    uint64_t v28 = 0;
  }
  id v29 = +[PKPassBannerTrailingViewConfiguration createWithSymbolName:v6 overrideColor:v27];
  id v17 = +[PKPassBannerViewController createForTransactionWithPass:primaryText:secondaryText:preferredLabelAxis:trailingViewConfiguration:walletForeground:](PKPassBannerViewController, "createForTransactionWithPass:primaryText:secondaryText:preferredLabelAxis:trailingViewConfiguration:walletForeground:", v4, v15, v26, v28, v29, [a1 isWalletForeground]);

LABEL_28:
  return v17;
}

@end