@interface PUSharingHeaderController
+ (PUSharingHeaderController)new;
- (LPLinkMetadata)linkMetadata;
- (PUSharingHeaderController)init;
- (PUSharingHeaderController)initWithDataProvider:(id)a3;
- (PUSharingHeaderDataProvider)dataProvider;
- (id)_linkPresentationImageForPerson:(id)a3;
- (id)_sharingHeaderStatus;
- (id)createTextAttachmentForGlyphImageWithName:(id)a3;
- (void)setLinkMetadata:(id)a3;
- (void)updateIfNeeded;
@end

@implementation PUSharingHeaderController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
  objc_storeStrong((id *)&self->_sharingHeaderBackAsset, 0);
  objc_storeStrong((id *)&self->_sharingHeaderFrontAsset, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_icloudLinkImage, 0);
}

- (void)setLinkMetadata:(id)a3
{
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (PUSharingHeaderDataProvider)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  return (PUSharingHeaderDataProvider *)WeakRetained;
}

- (id)_linkPresentationImageForPerson:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUSharingHeaderController.m", 402, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  uint64_t v7 = objc_opt_class();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__PUSharingHeaderController__linkPresentationImageForPerson___block_invoke;
  v12[3] = &unk_1E5F253E8;
  id v13 = v5;
  id v8 = v5;
  [v6 registerObjectOfClass:v7 visibility:0 loadHandler:v12];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithItemProvider:v6 properties:0 placeholderImage:0];

  return v9;
}

uint64_t __61__PUSharingHeaderController__linkPresentationImageForPerson___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F90408]);
  uint64_t v5 = *(void *)(a1 + 32);
  PLPhysicalScreenScale();
  uint64_t v7 = objc_msgSend(v4, "initWithPerson:targetSize:displayScale:", v5, 40.0, 40.0, v6);
  [v7 setDeliveryMode:1];
  id v8 = [MEMORY[0x1E4F90410] sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PUSharingHeaderController__linkPresentationImageForPerson___block_invoke_2;
  v11[3] = &unk_1E5F2DA80;
  id v12 = v3;
  id v9 = v3;
  [v8 requestFaceCropForOptions:v7 resultHandler:v11];

  return 0;
}

void __61__PUSharingHeaderController__linkPresentationImageForPerson___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F90FA8]];
    double v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[PUSharingHeaderController _linkPresentationImageForPerson:]_block_invoke_2";
      __int16 v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "%s: Error fetching thumbnail image data: %@", (uint8_t *)&v7, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)createTextAttachmentForGlyphImageWithName:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = a3;
  double v6 = [v3 preferredFontForTextStyle:v4];
  int v7 = [MEMORY[0x1E4FB1830] configurationWithFont:v6 scale:1];
  id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v5 withConfiguration:v7];

  __int16 v9 = [v8 imageWithRenderingMode:2];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
  [v10 setImage:v9];

  return v10;
}

- (id)_sharingHeaderStatus
{
  v124[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PUSharingHeaderController *)self dataProvider];
  int v5 = [v4 isActionSheet];

  if (v5)
  {
    double v6 = [(PUSharingHeaderController *)self dataProvider];
    int v7 = [v6 localizedSubtitle];

    if (v7) {
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
    }
    else {
      id v8 = 0;
    }
    goto LABEL_88;
  }
  SEL v110 = a2;
  int v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  __int16 v9 = [(PUSharingHeaderController *)self dataProvider];
  v10 = [v9 orderedSelectedAssets];

  uint64_t v122 = 0;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v11 = [(PUSharingHeaderController *)self dataProvider];
  id v12 = v11;
  if (v11)
  {
    [v11 assetTypeCount];
  }
  else
  {
    uint64_t v122 = 0;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
  }

  uint64_t v111 = *((void *)&v120 + 1);
  id v13 = [(PUSharingHeaderController *)self dataProvider];
  uint64_t v113 = [v13 preferredExportFormat];

  v14 = [(PUSharingHeaderController *)self dataProvider];
  int v15 = [v14 shareAsCMM];

  if (v15)
  {
    v16 = PXLocalizedString();
    [v7 addObject:v16];
  }
  v17 = [(PUSharingHeaderController *)self dataProvider];
  char v18 = [v17 sendAsAssetBundles];

  if (v18)
  {
    v19 = @"SHARING_HEADER_ALL_PHOTOS_DATA";
LABEL_16:
    v22 = PULocalizedString(v19);
    [v7 addObject:v22];

    goto LABEL_17;
  }
  v20 = [(PUSharingHeaderController *)self dataProvider];
  int v21 = [v20 sendAsUnmodifiedOriginals];

  if (v21)
  {
    if ([v10 count] == 1) {
      v19 = @"SHARING_HEADER_UNMODIFIED_ORIGINALS";
    }
    else {
      v19 = @"SHARING_HEADER_UNMODIFIED_ORIGINALS_MULTIPLE";
    }
    goto LABEL_16;
  }
LABEL_17:
  if (![v7 count])
  {
    v23 = [MEMORY[0x1E4F906A0] sharedInstance];
    int v24 = [v23 showSingleVideoDurationInShareSheetHeader];

    if (v24)
    {
      if ([v10 count] == 1 && *((void *)&v118 + 1) && !(void)v119)
      {
        v25 = [v10 firstObject];
        [v25 duration];
        v26 = PXLocalizedVideoDuration();

        [v7 addObject:v26];
      }
    }
  }
  v27 = [(PUSharingHeaderController *)self dataProvider];
  int v28 = [v27 excludeCaption];
  if (*((void *)&v121 + 1)) {
    int v29 = v28;
  }
  else {
    int v29 = 1;
  }

  v30 = [(PUSharingHeaderController *)self dataProvider];
  [v30 excludeAccessibilityDescription];

  if (v29 == 1)
  {
    v31 = 0;
  }
  else
  {
    [v7 addObject:@"{CaptionIcon}"];
    v32 = [(PUSharingHeaderController *)self createTextAttachmentForGlyphImageWithName:@"quote.bubble"];
    v33 = [v32 image];
    [v33 baselineOffsetFromBottom];
    double v35 = v34;
    [v33 alignmentRectInsets];
    double v37 = v36 - v35 + 1.0;
    [v32 bounds];
    [v33 size];
    objc_msgSend(v32, "setBounds:", 0.0, v37, v38, v39);
    v31 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v32];
  }
  uint64_t v40 = v113;
  if (!*((void *)&v120 + 1)) {
    goto LABEL_50;
  }
  v41 = [(PUSharingHeaderController *)self dataProvider];
  int v42 = [v41 excludeLocation];

  if (!v42)
  {
    v46 = [v10 firstObject];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v48 = [v10 firstObject];
      v49 = [v48 photoLibrary];
      v50 = [v49 librarySpecificFetchOptions];

      v51 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
      v124[0] = v51;
      v52 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
      v124[1] = v52;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:2];

      [v50 setSortDescriptors:v53];
      v107 = v10;
      v109 = v50;
      v54 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAssets:v10 withType:3 options:v50];
      v55 = [MEMORY[0x1E4F1CA70] orderedSet];
      v56 = [MEMORY[0x1E4F906A0] sharedInstance];
      uint64_t v57 = [v56 sharingHeaderLocationDisplayStyle];

      v108 = v54;
      if (!v57)
      {
LABEL_52:
        if (v111 == 1) {
          v68 = @"SHARING_HEADER_LOCATION_ON";
        }
        else {
          v68 = @"SHARING_HEADER_LOCATION_ON_MULTIPLE";
        }
        v44 = PULocalizedString(v68);
        v10 = v107;
        goto LABEL_72;
      }
      v104 = v53;
      v105 = v48;
      v106 = v31;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v58 = v54;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v114 objects:v123 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v115;
        while (2)
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v115 != v61) {
              objc_enumerationMutation(v58);
            }
            v63 = [*(id *)(*((void *)&v114 + 1) + 8 * i) localizedLocationNames];
            [v55 addObjectsFromArray:v63];
            if ((unint64_t)[v55 count] >= 2 && v57 == 1)
            {

              uint64_t v40 = v113;
              v48 = v105;
              v31 = v106;
              v53 = v104;
              goto LABEL_52;
            }
            unint64_t v64 = [v55 count];

            if (v64 >= 2 && v57 == 2) {
              goto LABEL_48;
            }
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v114 objects:v123 count:16];
          if (v60) {
            continue;
          }
          break;
        }
      }
LABEL_48:

      unint64_t v65 = [v55 count];
      if ([v55 count])
      {
        uint64_t v66 = [v55 objectAtIndexedSubscript:0];
      }
      else
      {
        uint64_t v66 = 0;
      }
      v10 = v107;
      uint64_t v40 = v113;
      if ((unint64_t)[v55 count] < 2)
      {
        uint64_t v69 = 0;
      }
      else
      {
        uint64_t v69 = [v55 objectAtIndexedSubscript:1];
      }
      v31 = v106;
      v112 = (void *)v69;
      if (v65 == 1)
      {
        if (v66)
        {
          PULocalizedString(@"SHARING_HEADER_ONE_LOCATION");
          v71 = uint64_t v70 = v66;
          v44 = PUStringWithValidatedFormat();

          uint64_t v66 = v70;
          goto LABEL_69;
        }
      }
      else if (v66 | v69)
      {
        if (v65 == 2)
        {
          v31 = v106;
          v53 = v104;
          if (v66 && v69)
          {
            PULocalizedString(@"SHARING_HEADER_TWO_LOCATIONS");
            v73 = uint64_t v72 = v66;
            v44 = PUStringWithValidatedFormat();

            uint64_t v66 = v72;
          }
          else
          {
            if (v66) {
              v94 = (void *)v66;
            }
            else {
              v94 = (void *)v69;
            }
            id v95 = v94;
            if (!v95)
            {
              [MEMORY[0x1E4F28B00] currentHandler];
              v101 = uint64_t v100 = v66;
              [v101 handleFailureInMethod:v110, self, @"PUSharingHeaderController.m", 318, @"Invalid parameter not satisfying: %@", @"locationName" object file lineNumber description];

              uint64_t v66 = v100;
            }
            v96 = PULocalizedString(@"SHARING_HEADER_ONE_LOCATION_AND_MORE");
            v44 = PUStringWithValidatedFormat();

            uint64_t v40 = v113;
          }
          v48 = v105;
          goto LABEL_71;
        }
        if (v65 < 3)
        {
          v44 = 0;
          v31 = v106;
        }
        else
        {
          v48 = v105;
          if (v66 && v69)
          {
            PULocalizedString(@"SHARING_HEADER_TWO_LOCATIONS_AND_N_MORE");
            v93 = uint64_t v92 = v66;
            v44 = PUStringWithValidatedFormat();

            uint64_t v66 = v92;
            v31 = v106;
            goto LABEL_70;
          }
          if (v66) {
            v97 = (void *)v66;
          }
          else {
            v97 = (void *)v69;
          }
          id v98 = v97;
          if (!v98)
          {
            [MEMORY[0x1E4F28B00] currentHandler];
            v103 = uint64_t v102 = v66;
            [v103 handleFailureInMethod:v110, self, @"PUSharingHeaderController.m", 326, @"Invalid parameter not satisfying: %@", @"locationName" object file lineNumber description];

            uint64_t v66 = v102;
          }
          v99 = PULocalizedString(@"SHARING_HEADER_ONE_LOCATION_AND_N_MORE");
          v44 = PUStringWithValidatedFormat();
          v31 = v106;

          uint64_t v40 = v113;
        }
LABEL_69:
        v48 = v105;
LABEL_70:
        v53 = v104;
LABEL_71:

LABEL_72:
        v45 = @"location.fill";
        goto LABEL_73;
      }
      v44 = PULocalizedString(@"SHARING_HEADER_LOCATION_ON");
      goto LABEL_69;
    }
LABEL_50:
    v67 = 0;
    goto LABEL_75;
  }
  if ([v10 count] == 1) {
    v43 = @"SHARING_HEADER_LOCATION_OFF";
  }
  else {
    v43 = @"SHARING_HEADER_LOCATION_OFF_MULTIPLE";
  }
  v44 = PULocalizedString(v43);
  v45 = @"location.slash";
LABEL_73:
  v74 = PULocalizedString(@"SHARING_HEADER_LOCATION_STRING_WITH_LOCATION_ICON_PREFIX");
  v75 = PUStringWithValidatedFormat();

  v76 = [(PUSharingHeaderController *)self createTextAttachmentForGlyphImageWithName:v45, @"{LocationIcon}", v44];
  v77 = [v76 image];
  [v77 alignmentRectInsets];
  double v79 = v78;
  [v76 bounds];
  [v77 size];
  objc_msgSend(v76, "setBounds:", 0.0, v79, v80, v81);
  v67 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v76];

  if (v75)
  {
    [v7 addObject:v75];
  }
LABEL_75:
  if (v40 == 2)
  {
    v82 = @"SHARING_HEADER_FORMAT_COMPATIBLE";
    goto LABEL_79;
  }
  if (v40 == 1)
  {
    v82 = @"SHARING_HEADER_FORMAT_CURRENT";
LABEL_79:
    v83 = PULocalizedString(v82);
    [v7 addObject:v83];
  }
  if ([v7 count])
  {
    v84 = PULocalizedString(@"SHARING_HEADER_SUBTITLE_SEPARATOR");
    v85 = [v7 componentsJoinedByString:v84];
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v85];
    if (v31)
    {
      uint64_t v86 = [v85 rangeOfString:@"{CaptionIcon}"];
      objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v86, v87, v31);
      uint64_t v88 = [v85 stringByReplacingOccurrencesOfString:@"{CaptionIcon}" withString:@" "];

      v85 = (void *)v88;
    }
    if (v67)
    {
      uint64_t v89 = [v85 rangeOfString:@"{LocationIcon}"];
      objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v89, v90, v67);
    }
  }
  else
  {
    id v8 = v31;
  }

LABEL_88:
  return v8;
}

- (void)updateIfNeeded
{
  v62[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PUSharingHeaderController *)self dataProvider];
  int v5 = [v4 orderedSelectedAssets];

  double v6 = [(PUSharingHeaderController *)self linkMetadata];
  if (!v6)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"PUSharingHeaderController.m", 72, @"Invalid parameter not satisfying: %@", @"linkMetadata" object file lineNumber description];
  }
  int v7 = [v6 specialization];
  if (!v7)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"PUSharingHeaderController.m", 75, @"Invalid parameter not satisfying: %@", @"statusMetadata" object file lineNumber description];
  }
  id v8 = [(PUSharingHeaderController *)self _sharingHeaderStatus];
  [v7 setStatus:v8];
  __int16 v9 = [(PUSharingHeaderController *)self dataProvider];
  v10 = [v9 localizedTitle];

  [v6 setTitle:v10];
  uint64_t v11 = [(PUSharingHeaderController *)self dataProvider];
  if ([v11 shareAsCMM])
  {
    id v12 = [(PUSharingHeaderController *)self dataProvider];
    char v13 = [v12 isActionSheet];

    if ((v13 & 1) == 0)
    {
      icloudLinkImage = self->_icloudLinkImage;
      if (!icloudLinkImage)
      {
        int v15 = (void *)MEMORY[0x1E4FB1818];
        v16 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
        v17 = [v15 systemImageNamed:@"link.icloud" withConfiguration:v16];

        char v18 = (LPImage *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v17];
        v19 = self->_icloudLinkImage;
        self->_icloudLinkImage = v18;

        icloudLinkImage = self->_icloudLinkImage;
      }
      v62[0] = icloudLinkImage;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
      [v6 setAlternateImages:v20];

      goto LABEL_56;
    }
  }
  else
  {
  }
  int v21 = [(PUSharingHeaderController *)self dataProvider];
  uint64_t v22 = [v21 keyAsset];

  uint64_t v57 = v10;
  if (v22)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v22];

    int v5 = (void *)v23;
  }
  int v24 = [v6 alternateImages];
  id v58 = v7;
  if ([v24 containsObject:self->_icloudLinkImage])
  {

    sharingHeaderFrontAsset = self->_sharingHeaderFrontAsset;
    self->_sharingHeaderFrontAsset = 0;

    sharingHeaderBackAsset = self->_sharingHeaderBackAsset;
    self->_sharingHeaderBackAsset = 0;

    int v24 = 0;
    self->_int showingUnmodifiedOriginalThumbnail = 0;
  }
  SEL v53 = a2;
  v27 = [(PUSharingHeaderController *)self dataProvider];
  uint64_t v60 = [v27 person];

  uint64_t v28 = [v5 firstObject];
  uint64_t v59 = v5;
  v56 = (void *)v22;
  if ((unint64_t)[v5 count] < 2)
  {
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = [v5 objectAtIndexedSubscript:1];
  }
  v30 = [(PUSharingHeaderController *)self dataProvider];
  int v61 = [v30 sendAsUnmodifiedOriginals];

  v31 = self->_sharingHeaderFrontAsset;
  v32 = self->_sharingHeaderBackAsset;
  int showingUnmodifiedOriginalThumbnail = self->_showingUnmodifiedOriginalThumbnail;
  v55 = v31;
  if (v28 | (unint64_t)v31) {
    int v34 = [(id)v28 isEqual:v31] ^ 1;
  }
  else {
    int v34 = 0;
  }
  int v35 = v29 | v32;
  if (v29 | (unint64_t)v32) {
    int v35 = [(id)v29 isEqual:v32] ^ 1;
  }
  if (showingUnmodifiedOriginalThumbnail != v61)
  {
    int v34 = v28 != 0;
    int v35 = v29 != 0;
  }
  int v54 = v35;
  if (v24)
  {
    uint64_t v36 = [v24 mutableCopy];
  }
  else
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  }
  double v37 = (void *)v36;
  if (v34)
  {
    objc_storeStrong((id *)&self->_sharingHeaderFrontAsset, (id)v28);
    if (v28)
    {
      if ([(id)v28 isEqual:v32])
      {
        if ((unint64_t)[v24 count] <= 1)
        {
          v51 = [MEMORY[0x1E4F28B00] currentHandler];
          [v51 handleFailureInMethod:v53, self, @"PUSharingHeaderController.m", 134, @"Invalid parameter not satisfying: %@", @"previousImagesStack.count > 1" object file lineNumber description];
        }
        uint64_t v38 = [v24 objectAtIndexedSubscript:1];
      }
      else
      {
        uint64_t v38 = PXLinkPresentationImageForAsset();
      }
    }
    else
    {
      if (!v60) {
        goto LABEL_38;
      }
      uint64_t v38 = [(PUSharingHeaderController *)self _linkPresentationImageForPerson:v60];
    }
    double v39 = (LPImage *)v38;
    if (v38)
    {
LABEL_42:
      [v37 setObject:v39 atIndexedSubscript:0];

      goto LABEL_43;
    }
LABEL_38:
    placeholderImage = self->_placeholderImage;
    if (placeholderImage)
    {
      double v39 = placeholderImage;
    }
    else
    {
      v41 = (void *)MEMORY[0x1E4FB1818];
      int v42 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
      v43 = [v41 systemImageNamed:@"photo" withConfiguration:v42];

      v44 = (LPImage *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v43];
      v45 = self->_placeholderImage;
      self->_placeholderImage = v44;

      double v39 = self->_placeholderImage;
      if (!v39)
      {
        v50 = [MEMORY[0x1E4F28B00] currentHandler];
        [v50 handleFailureInMethod:v53, self, @"PUSharingHeaderController.m", 155, @"Invalid parameter not satisfying: %@", @"frontImage" object file lineNumber description];

        double v39 = 0;
      }
    }
    goto LABEL_42;
  }
LABEL_43:
  if (v54)
  {
    objc_storeStrong((id *)&self->_sharingHeaderBackAsset, (id)v29);
    if (!v29) {
      goto LABEL_52;
    }
    if ([(id)v29 isEqual:v55])
    {
      if (![v24 count])
      {
        v52 = [MEMORY[0x1E4F28B00] currentHandler];
        [v52 handleFailureInMethod:v53, self, @"PUSharingHeaderController.m", 165, @"Invalid parameter not satisfying: %@", @"previousImagesStack.count > 0" object file lineNumber description];
      }
      uint64_t v46 = [v24 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v46 = PXLinkPresentationImageForAsset();
    }
    v47 = (void *)v46;
    if (v46)
    {
      [v37 setObject:v46 atIndexedSubscript:1];
    }
    else
    {
LABEL_52:
      [v37 removeObjectAtIndex:1];
    }
  }
  self->_int showingUnmodifiedOriginalThumbnail = v61;
  if (([v24 isEqualToArray:v37] & 1) == 0) {
    [v6 setAlternateImages:v37];
  }

  int v7 = v58;
  int v5 = v59;
  v10 = v57;
LABEL_56:
}

- (PUSharingHeaderController)initWithDataProvider:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUSharingHeaderController.m", 58, @"Invalid parameter not satisfying: %@", @"dataProvider" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PUSharingHeaderController;
  double v6 = [(PUSharingHeaderController *)&v13 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_dataProvider, v5);
    id v8 = objc_alloc_init(MEMORY[0x1E4F309F8]);
    __int16 v9 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E4F30A78]);
    linkMetadata = v7->_linkMetadata;
    v7->_linkMetadata = v9;

    [(LPLinkMetadata *)v7->_linkMetadata setSpecialization:v8];
  }

  return v7;
}

- (PUSharingHeaderController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUSharingHeaderController.m", 50, @"%s is not available as initializer", "-[PUSharingHeaderController init]");

  abort();
}

+ (PUSharingHeaderController)new
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PUSharingHeaderController.m", 54, @"%s is not available as initializer", "+[PUSharingHeaderController new]");

  abort();
}

@end