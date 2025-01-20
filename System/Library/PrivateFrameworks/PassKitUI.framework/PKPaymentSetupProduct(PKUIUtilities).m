@interface PKPaymentSetupProduct(PKUIUtilities)
- (id)_getCardImageUrlFromMetadata:()PKUIUtilities forScale:;
- (id)digitalCardCachedImage:()PKUIUtilities;
- (id)logoCachedImage:()PKUIUtilities;
- (id)plasticCardCachedImage:()PKUIUtilities;
- (id)thumbnailCachedImageForSize:()PKUIUtilities completion:;
- (void)resetCache;
@end

@implementation PKPaymentSetupProduct(PKUIUtilities)

- (id)digitalCardCachedImage:()PKUIUtilities
{
  v4 = a3;
  v5 = [a1 imageAssets];
  uint64_t v6 = [v5 digitalCardImage];

  if (v6)
  {
    v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v6 scale:0 orientation:PKUIScreenScale()];
    if (v4) {
      v4[2](v4, 0, v7);
    }
  }
  else
  {
    v8 = [a1 imageAssetURLs];
    v9 = [v8 digitalCardImageUrl];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__PKPaymentSetupProduct_PKUIUtilities__digitalCardCachedImage___block_invoke;
    v12[3] = &unk_1E59DC968;
    id v13 = v9;
    v14 = a1;
    v15 = v4;
    id v10 = v9;
    PKCommonCachedImageFromURL(v10, v12);

    v7 = 0;
  }

  return v7;
}

- (id)_getCardImageUrlFromMetadata:()PKUIUtilities forScale:
{
  v5 = [a4 readerModeResources];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87AB8]];

  if (v6)
  {
    v7 = [v6 objectForKeyedSubscript:@"plasticCardImages"];
    if ([v7 count])
    {
      v8 = @"2x";
      if (a1 > 2.0) {
        v8 = @"3x";
      }
      v9 = (void *)MEMORY[0x1E4F1CB10];
      id v10 = v8;
      v11 = [v7 objectAtIndexedSubscript:0];
      v12 = [v11 objectForKeyedSubscript:v10];

      id v13 = [v9 URLWithString:v12];
    }
    else
    {
      v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Malformed reader mode resources - missing URLs", v16, 2u);
      }

      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)plasticCardCachedImage:()PKUIUtilities
{
  v4 = a3;
  v5 = [a1 imageAssets];
  uint64_t v6 = [v5 plasticCardImage];

  if (v6)
  {
    v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v6 scale:0 orientation:PKUIScreenScale()];
    if (v4) {
      v4[2](v4, 0, v7);
    }
  }
  else
  {
    v8 = [a1 provisioningMethodMetadataForType:*MEMORY[0x1E4F87AA0]];
    PKScreenScale();
    v9 = objc_msgSend(a1, "_getCardImageUrlFromMetadata:forScale:", v8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__PKPaymentSetupProduct_PKUIUtilities__plasticCardCachedImage___block_invoke;
    v12[3] = &unk_1E59DC968;
    id v13 = v9;
    v14 = a1;
    v15 = v4;
    id v10 = v9;
    PKCommonCachedImageFromURL(v10, v12);

    v7 = 0;
  }

  return v7;
}

- (id)thumbnailCachedImageForSize:()PKUIUtilities completion:
{
  v4 = a3;
  v5 = [a1 imageAssets];
  uint64_t v6 = [v5 thumbnailImage];

  if (!v6)
  {
    v9 = [a1 configuration];
    uint64_t v10 = [v9 featureIdentifier];
    if (v10 == 4)
    {
      v12 = (void *)MEMORY[0x1E4FB1818];
      id v13 = PKPassKitUIFoundationBundle();
      v11 = [v12 imageNamed:@"AppleBalance-CardTypePicker" inBundle:v13];
    }
    else
    {
      if (v10 != 2) {
        goto LABEL_13;
      }
      v11 = PKUIImageNamed(@"CardTypePicker-CCS");
    }
    v14 = [a1 imageAssets];
    id v15 = v11;
    objc_msgSend(v14, "setThumbnailImage:", objc_msgSend(v15, "CGImage"));

    if (v15)
    {
      if (v4) {
        v4[2](v4, 0, v15);
      }
      id v8 = v15;
      goto LABEL_25;
    }
LABEL_13:
    v16 = [a1 paymentOptions];
    v17 = [v16 firstObject];

    uint64_t v18 = [v17 cardType];
    v19 = [a1 imageAssetURLs];
    v20 = [v19 thumbnailImageUrl];

    if (v20 || v18 != 103)
    {
      if ([v9 type] == 6)
      {
        v24 = [a1 provisioningExtension];
        v25 = [v24 icons];
        uint64_t v26 = [v25 firstObject];
        if (v26)
        {
          v27 = (void *)v26;
          v28 = [a1 imageAssets];
          id v29 = v27;
          objc_msgSend(v28, "setThumbnailImage:", objc_msgSend(v29, "CGImage"));

          if (v4) {
            v4[2](v4, 0, v29);
          }
          id v8 = v29;

          goto LABEL_24;
        }
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __79__PKPaymentSetupProduct_PKUIUtilities__thumbnailCachedImageForSize_completion___block_invoke;
      v31[3] = &unk_1E59CC4C0;
      v31[4] = a1;
      v32 = v4;
      PKCommonCachedImageFromURL(v20, v31);

      id v8 = 0;
    }
    else
    {
      v21 = PKUIImageNamed(@"SuicaCard");
      v22 = [a1 imageAssets];
      id v23 = v21;
      objc_msgSend(v22, "setThumbnailImage:", objc_msgSend(v23, "CGImage"));

      id v8 = v23;
      if (v4) {
        v4[2](v4, 0, v8);
      }
    }
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v6 scale:0 orientation:PKUIScreenScale()];
  if (v4) {
    v4[2](v4, 0, v7);
  }
  id v8 = v7;
LABEL_26:

  return v8;
}

- (id)logoCachedImage:()PKUIUtilities
{
  v4 = a3;
  v5 = [a1 imageAssets];
  uint64_t v6 = [v5 logoImage];

  if (v6)
  {
    v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v6 scale:0 orientation:PKUIScreenScale()];
    if (v4) {
      v4[2](v4, 0, v7);
    }
  }
  else
  {
    id v8 = [a1 imageAssetURLs];
    v9 = [v8 logoImageUrl];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PKPaymentSetupProduct_PKUIUtilities__logoCachedImage___block_invoke;
    v11[3] = &unk_1E59CC4C0;
    v11[4] = a1;
    v12 = v4;
    PKCommonCachedImageFromURL(v9, v11);

    v7 = 0;
  }

  return v7;
}

- (void)resetCache
{
  id v1 = [a1 imageAssets];
  [v1 setThumbnailImage:0];
  [v1 setLogoImage:0];
  [v1 setPlasticCardImage:0];
  [v1 setDigitalCardImage:0];
}

@end