@interface PKPassLogoImageSet(NanoPassKit)
- (BOOL)npkHasValidPaymentCardAssets;
- (uint64_t)loadPDFArtFromBundle:()NanoPassKit;
- (void)loadPDFArtFromBundle:()NanoPassKit targetSize:scale:;
- (void)memoryMapImageData;
- (void)resizeWithScreenSize:()NanoPassKit pass:;
@end

@implementation PKPassLogoImageSet(NanoPassKit)

- (void)resizeWithScreenSize:()NanoPassKit pass:
{
  id v34 = a5;
  v8 = (void *)MEMORY[0x223C37110]();
  BOOL v9 = NPKNewEventTicketDesignTreatment(v34);
  double v10 = 21.0;
  if (v9) {
    double v10 = 30.0;
  }
  v11 = objc_msgSend(MEMORY[0x263F5BEE0], "constraintsWithMaxSize:", a2 + -15.0, v10);
  v12 = [a1 logoImage];
  v13 = [v11 resizedImage:v12];
  [a1 setLogoImage:v13];

  v14 = [a1 logoImage];
  v15 = objc_msgSend(v14, "resizedImageToFit:", a2, a3);
  [a1 setLogoImage:v15];

  v16 = [a1 backgroundImage];
  v17 = objc_msgSend(v16, "resizedImageToCover:", a2, a3);
  [a1 setBackgroundImage:v17];

  v18 = [a1 thumbnailImage];
  v19 = objc_msgSend(v18, "resizedImageToFit:", a2, a3);
  [a1 setThumbnailImage:v19];

  v20 = [a1 stripImage];
  v21 = objc_msgSend(v20, "resizedImageToFit:", a2, a3);
  [a1 setStripImage:v21];

  v22 = [a1 footerImage];
  v23 = objc_msgSend(v22, "resizedImageToFit:", a2, a3);
  [a1 setFooterImage:v23];

  v24 = [a1 bankLogoImage];
  v25 = objc_msgSend(v24, "resizedImageToFit:", a2, a3);
  [a1 setBankLogoImage:v25];

  v26 = [a1 networkLogoImage];
  v27 = objc_msgSend(v26, "resizedImageToFit:", a2, a3);
  [a1 setNetworkLogoImage:v27];

  v28 = [a1 cobrandLogoImage];
  v29 = objc_msgSend(v28, "resizedImageToFit:", a2, a3);
  [a1 setCobrandLogoImage:v29];

  v30 = [a1 cardBackgroundImage];
  v31 = objc_msgSend(v30, "resizedImageToFit:", a2, a3);
  [a1 setCardBackgroundImage:v31];

  v32 = [a1 cardBackgroundCombinedImage];
  v33 = objc_msgSend(v32, "resizedImageToFit:", a2, a3);
  [a1 setCardBackgroundCombinedImage:v33];
}

- (void)memoryMapImageData
{
  v2 = (void *)MEMORY[0x223C37110]();
  v3 = [a1 logoImage];
  v4 = [v3 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setLogoImage:v4];

  v5 = [a1 backgroundImage];
  v6 = [v5 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setBackgroundImage:v6];

  v7 = [a1 thumbnailImage];
  v8 = [v7 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setThumbnailImage:v8];

  BOOL v9 = [a1 stripImage];
  double v10 = [v9 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setStripImage:v10];

  v11 = [a1 footerImage];
  v12 = [v11 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setFooterImage:v12];

  v13 = [a1 bankLogoImage];
  v14 = [v13 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setBankLogoImage:v14];

  v15 = [a1 networkLogoImage];
  v16 = [v15 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setNetworkLogoImage:v16];

  v17 = [a1 cobrandLogoImage];
  v18 = [v17 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setCobrandLogoImage:v18];

  v19 = [a1 cardBackgroundImage];
  v20 = [v19 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setCardBackgroundImage:v20];

  v21 = [a1 cardBackgroundCombinedImage];
  v22 = [v21 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkLogoImage"];
  [a1 setCardBackgroundCombinedImage:v22];
}

- (uint64_t)loadPDFArtFromBundle:()NanoPassKit
{
  return [a1 loadPDFArtFromBundle:*MEMORY[0x263F001B0] targetSize:*(double *)(MEMORY[0x263F001B0] + 8) scale:1.0];
}

- (void)loadPDFArtFromBundle:()NanoPassKit targetSize:scale:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a6;
  v11 = pk_General_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = pk_General_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v10;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Load PDF art from bundle: %@", (uint8_t *)&v21, 0xCu);
    }
  }
  double v14 = *MEMORY[0x263F001B0];
  double v15 = *(double *)(MEMORY[0x263F001B0] + 8);
  v16 = NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x263F5C5D0], *MEMORY[0x263F001B0], v15, a4);
  if (v16) {
    [a1 setBankLogoImage:v16];
  }

  v17 = NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x263F5C5F8], v14, v15, a4);
  if (v17) {
    [a1 setNetworkLogoImage:v17];
  }

  v18 = NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x263F5C5E8], v14, v15, a4);
  if (v18) {
    [a1 setCobrandLogoImage:v18];
  }

  v19 = NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x263F5C5E0], a2, a3, a4);
  if (v19) {
    [a1 setCardBackgroundImage:v19];
  }

  v20 = NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x263F5C5D8], a2, a3, a4);
  if (v20) {
    [a1 setCardBackgroundCombinedImage:v20];
  }
}

- (BOOL)npkHasValidPaymentCardAssets
{
  v2 = [a1 cardBackgroundCombinedImage];
  if (v2)
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [a1 cardBackgroundImage];
    if (v4)
    {
      BOOL v3 = 1;
    }
    else
    {
      v5 = [a1 backgroundImage];
      if (v5)
      {
        BOOL v3 = 1;
      }
      else
      {
        v6 = [a1 cobrandLogoImage];
        if (v6)
        {
          BOOL v3 = 1;
        }
        else
        {
          v7 = [a1 bankLogoImage];
          if (v7)
          {
            BOOL v3 = 1;
          }
          else
          {
            v8 = [a1 logoImage];
            if (v8)
            {
              BOOL v3 = 1;
            }
            else
            {
              BOOL v9 = [a1 networkLogoImage];
              BOOL v3 = v9 != 0;
            }
          }
        }
      }
    }
  }

  return v3;
}

@end