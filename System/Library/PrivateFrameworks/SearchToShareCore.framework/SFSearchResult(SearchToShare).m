@interface SFSearchResult(SearchToShare)
- (double)sts_providerIconSize;
- (id)_sts_cardSectionWithClass:()SearchToShare;
- (id)sts_appProviderName;
- (id)sts_badge;
- (id)sts_descriptionText;
- (id)sts_providerHostPageURL;
- (id)sts_providerName;
- (id)sts_searchProviderImage;
- (id)sts_userReportRequest;
- (id)sts_videoDuration;
- (void)sts_providerIconWithScale:()SearchToShare completion:;
@end

@implementation SFSearchResult(SearchToShare)

- (id)sts_badge
{
  v1 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v2 = [v1 badge];

  return v2;
}

- (id)sts_searchProviderImage
{
  v1 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v2 = [v1 image];

  return v2;
}

- (id)sts_videoDuration
{
  v1 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v2 = [v1 descriptionText];
  v3 = [v2 text];

  return v3;
}

- (id)sts_providerName
{
  v1 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v2 = [v1 title];

  return v2;
}

- (id)sts_appProviderName
{
  v1 = [a1 punchout];
  v2 = [v1 label];

  return v2;
}

- (id)sts_providerHostPageURL
{
  v1 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v2 = [v1 hostPageURL];

  return v2;
}

- (double)sts_providerIconSize
{
  v1 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v2 = [v1 image];
  [v2 size];
  double v4 = v3;

  return v4;
}

- (id)sts_userReportRequest
{
  v1 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v2 = [v1 userReportRequest];

  return v2;
}

- (void)sts_providerIconWithScale:()SearchToShare completion:
{
  v6 = a4;
  v7 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v8 = (void *)MEMORY[0x263F827E8];
  v9 = [v7 image];
  v10 = [v9 imageData];
  v11 = [v8 imageWithData:v10 scale:a2];

  if (v11)
  {
    if (v6) {
      v6[2](v6, v11);
    }
  }
  else
  {
    v12 = [v7 image];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__SFSearchResult_SearchToShare__sts_providerIconWithScale_completion___block_invoke;
    v13[3] = &unk_264A057F8;
    double v15 = a2;
    v14 = v6;
    [v12 loadImageDataWithCompletionHandler:v13];
  }
}

- (id)sts_descriptionText
{
  v1 = objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v2 = [v1 descriptionText];
  double v3 = [v2 text];

  return v3;
}

- (id)_sts_cardSectionWithClass:()SearchToShare
{
  if (!a3) {
    goto LABEL_3;
  }
  v5 = [a1 inlineCard];
  v6 = [v5 cardSections];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__SFSearchResult_SearchToShare___sts_cardSectionWithClass___block_invoke;
  v12[3] = &__block_descriptor_40_e30_B32__0__SFCardSection_8Q16_B24lu32l8;
  v12[4] = a3;
  uint64_t v7 = [v6 indexOfObjectPassingTest:v12];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [a1 inlineCard];
    v10 = [v9 cardSections];
    v8 = [v10 objectAtIndexedSubscript:v7];
  }
  else
  {
LABEL_3:
    v8 = 0;
  }

  return v8;
}

@end