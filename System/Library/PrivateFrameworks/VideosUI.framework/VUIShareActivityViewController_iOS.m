@interface VUIShareActivityViewController_iOS
+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceRect:(CGRect)a9 completionHandler:(id)a10;
+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceView:(id)a9 completionHandler:(id)a10;
+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceView:(id)a9 sourceRect:(CGRect)a10 completionHandler:(id)a11;
+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 sharedWatchId:(id)a8 sharedWatchUrl:(id)a9 sourceView:(id)a10 completionHandler:(id)a11;
+ (void)shareMediaWithShareSheet:(id)a3;
- (NSString)itemSubtitle;
- (NSString)itemTitle;
- (NSURL)itemImageURL;
- (VUIShareActivityViewController_iOS)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)_prepareActivity:(id)a3 completion:(id)a4;
- (void)setItemImageURL:(id)a3;
- (void)setItemSubtitle:(id)a3;
- (void)setItemTitle:(id)a3;
@end

@implementation VUIShareActivityViewController_iOS

+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 sharedWatchId:(id)a8 sharedWatchUrl:(id)a9 sourceView:(id)a10 completionHandler:(id)a11
{
  v17 = (void *)MEMORY[0x1E4F1CA60];
  id v26 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v27 = [v17 dictionary];
  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v20, @"sharedWatchId");

  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v19, @"sharedWatchUrl");
  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v23, @"title");
  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v22, @"subtitle");
  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v21, @"imageUrlFormat");
  [(id)objc_opt_class() shareMediaItem:v25 previewURLString:v24 title:v23 subtitle:v22 imageURLStr:v21 groupActivityMetadata:v27 sourceView:v18 completionHandler:v26];
}

+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceView:(id)a9 completionHandler:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  [v18 bounds];
  objc_msgSend(a1, "shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:sourceRect:completionHandler:", v24, v23, v22, v21, v20, v19, v18, v17);
}

+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceRect:(CGRect)a9 completionHandler:(id)a10
{
}

+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceView:(id)a9 sourceRect:(CGRect)a10 completionHandler:(id)a11
{
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = (__CFString *)a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a11;
  if ([v20 length])
  {
    v59 = v27;
    id v60 = v26;
    id v62 = v21;
    v28 = [MEMORY[0x1E4F1CA48] array];
    id v61 = v20;
    if (v22 && v24)
    {
      v29 = [VUIShareURLActivityItem alloc];
      v30 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
      v31 = (void *)MEMORY[0x1E4F1CB10];
      v32 = v22;
      v33 = [v31 URLWithString:v24];
      v34 = [(VUIShareURLActivityItem *)v29 initWithURL:v30 title:v32 subtitle:v23 imageURL:v33];

      if (v21)
      {
        v35 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
        [(VUIShareURLActivityItem *)v34 setPreviewURL:v35];
      }
      [v28 addObject:v34];
    }
    v36 = [MEMORY[0x1E4F1CA48] arrayWithObject:*MEMORY[0x1E4F43588]];
    uint64_t v37 = objc_msgSend(v25, "vui_stringForKey:", @"sharedWatchId");
    v63 = objc_msgSend(v25, "vui_URLForKey:", @"sharedWatchUrl");
    v38 = VUIDefaultLogObject();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    v57 = (void *)v37;
    id v58 = v25;
    if (v25 && v37 && v63)
    {
      if (v39)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v67 = v37;
        _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "VUIShareActivityViewController:: Adding group activity to activity items for sharedWatchId %@", buf, 0xCu);
      }

      v40 = [[VUIGroupWatchActivityPreviewMetadata alloc] initWithContextData:v25];
      v41 = +[VUIInterfaceFactory sharedInstance];
      v42 = [v41 groupActivitiesManager];
      uint64_t v43 = v37;
      v44 = v42;
      v45 = [v42 itemProviderForActivityWithSharedWatchId:v43 sharedWatchUrl:v63 previewMetadata:v40 existingItemProvider:0];

      if (v45)
      {
        [v28 addObject:v45];
        id v21 = v62;
      }
      else
      {
        v47 = VUIDefaultLogObject();
        id v21 = v62;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v47, OS_LOG_TYPE_DEFAULT, "VUIShareActivityViewController:: failed to create group activity provider", buf, 2u);
        }
      }
      v46 = v36;
    }
    else
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "VUIShareActivityViewController:: Not adding group activity to activity because shared watch id or url is missing", buf, 2u);
      }

      v46 = v36;
      [v36 addObject:*MEMORY[0x1E4F43620]];
      id v21 = v62;
    }
    v48 = [VUIShareActivityViewController_iOS alloc];
    v49 = (void *)[v28 copy];
    v50 = [(VUIShareActivityViewController_iOS *)v48 initWithActivityItems:v49 applicationActivities:0];

    v51 = &stru_1F3E921E0;
    if (v22 && [(__CFString *)v22 length]) {
      v51 = v22;
    }
    [(VUIShareActivityViewController_iOS *)v50 setItemTitle:v51];
    if (v23)
    {
      if ([v23 length]) {
        id v52 = v23;
      }
      else {
        id v52 = 0;
      }
    }
    else
    {
      id v52 = 0;
    }
    [(VUIShareActivityViewController_iOS *)v50 setItemSubtitle:v52];
    if (v24 && [v24 length])
    {
      v53 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
      [(VUIShareActivityViewController_iOS *)v50 setItemImageURL:v53];
    }
    else
    {
      [(VUIShareActivityViewController_iOS *)v50 setItemImageURL:0];
    }
    [(VUIShareActivityViewController_iOS *)v50 setExcludedActivityTypes:v46];
    v54 = +[VUIInterfaceFactory sharedInstance];
    v55 = [v54 controllerPresenter];

    [(VUIShareActivityViewController_iOS *)v50 setModalPresentationStyle:7];
    v56 = [(VUIShareActivityViewController_iOS *)v50 popoverPresentationController];
    [v56 setSourceView:v60];
    objc_msgSend(v56, "setSourceRect:", x, y, width, height);
    [v56 _setCentersPopoverIfSourceViewNotSet:1];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __159__VUIShareActivityViewController_iOS_shareMediaItem_previewURLString_title_subtitle_imageURLStr_groupActivityMetadata_sourceView_sourceRect_completionHandler___block_invoke;
    v64[3] = &unk_1E6DF3DD0;
    id v27 = v59;
    id v65 = v59;
    [v55 presentViewController:v50 animated:1 completion:v64];

    id v26 = v60;
    id v20 = v61;
    id v25 = v58;
  }
}

+ (void)shareMediaWithShareSheet:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  id v19 = [v3 urlString];
  v5 = [v3 previewUrlStr];
  v6 = [v3 title];
  v7 = [v3 subtitle];
  v8 = [v3 imageURLStr];
  v9 = [v3 groupActivityMetadata];
  v10 = [v3 sourceView];
  [v3 sourceRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v4, "shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:sourceRect:completionHandler:", v19, v5, v6, v7, v8, v9, v12, v14, v16, v18, v10, 0);
}

- (VUIShareActivityViewController_iOS)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIShareActivityViewController_iOS;
  v8 = [(VUIShareActivityViewController_iOS *)&v13 initWithActivityItems:v7 applicationActivities:a4];
  if (v8)
  {
    v9 = [v7 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v4 = [v7 firstObject];
      double v11 = [v4 shareURL];
    }
    else
    {
      double v11 = 0;
    }
    objc_storeStrong((id *)&v8->_sharingURL, v11);
    if (isKindOfClass)
    {
    }
  }

  return v8;
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = [v6 activityType];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F435C0]];

  if (v9)
  {
    p_pendingMessageMetadataProvider = &self->_pendingMessageMetadataProvider;
    pendingMessageMetadataProvider = self->_pendingMessageMetadataProvider;
    if (pendingMessageMetadataProvider) {
      [(LPMetadataProvider *)pendingMessageMetadataProvider cancel];
    }
    double v12 = self->_sharingURL;
    objc_super v13 = [(VUIShareActivityViewController_iOS *)self itemTitle];

    if (v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F30A78]);
      [v14 setURL:v12];
      id v15 = objc_alloc_init(MEMORY[0x1E4F30A00]);
      double v16 = [(VUIShareActivityViewController_iOS *)self itemTitle];
      [v15 setTitle:v16];

      double v17 = [(VUIShareActivityViewController_iOS *)self itemSubtitle];
      [v15 setSubtitle:v17];

      double v18 = [(VUIShareActivityViewController_iOS *)self itemImageURL];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke;
      aBlock[3] = &unk_1E6DF4998;
      id v68 = v18;
      id v69 = v14;
      id v70 = v15;
      id v71 = v6;
      v72 = v12;
      v73 = v7;
      id v19 = v12;
      id v20 = v15;
      id v21 = v14;
      id v22 = v18;
      id v23 = (void (**)(void))_Block_copy(aBlock);
      v23[2]();

      id v24 = 0;
    }
    else
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4F30AB0]);
      [v43 setShouldFetchSubresources:0];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_3;
      v61[3] = &unk_1E6DF6BE0;
      id v24 = v43;
      id v62 = v24;
      v63 = self;
      id v64 = v6;
      id v65 = v12;
      v66 = v7;
      v44 = v12;
      v45 = _Block_copy(v61);
      [v24 startFetchingMetadataForURL:v44 completionHandler:v45];
      objc_storeStrong((id *)p_pendingMessageMetadataProvider, v43);

      id v22 = v62;
    }

    goto LABEL_32;
  }
  id v25 = [v6 activityType];
  if ([v25 isEqualToString:*MEMORY[0x1E4F435B0]])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v27 = [MEMORY[0x1E4F28B50] mainBundle];
      v28 = [v27 localizedInfoDictionary];
      v29 = [v28 objectForKey:@"CFBundleDisplayFullName"];

      if (!v29)
      {
        v30 = [MEMORY[0x1E4F28B50] mainBundle];
        v31 = [v30 infoDictionary];
        v29 = [v31 objectForKey:@"CFBundleDisplayFullName"];
      }
      v32 = objc_opt_new();
      [v32 setString:@"<!DOCTYPE html><html><body>"];
      uint64_t v33 = [(VUIShareActivityViewController_iOS *)self itemTitle];
      if (v33
        && (v34 = (void *)v33,
            [(VUIShareActivityViewController_iOS *)self itemSubtitle],
            v35 = objc_claimAutoreleasedReturnValue(),
            v35,
            v34,
            !v35))
      {
        v46 = NSString;
        v47 = +[VUILocalizationManager sharedInstance];
        v48 = [v47 localizedStringForKey:@"SHARE_ITEM_MAIL"];
        v42 = [v46 stringWithValidatedFormat:v48, @"%@ %@", 0, self->_itemTitle, v29 validFormatSpecifiers error];

        [v32 appendFormat:@"%@<br/><br/>", v42, v60];
      }
      else
      {
        uint64_t v36 = [(VUIShareActivityViewController_iOS *)self itemTitle];
        if (!v36) {
          goto LABEL_22;
        }
        uint64_t v37 = (void *)v36;
        v38 = [(VUIShareActivityViewController_iOS *)self itemSubtitle];

        if (!v38) {
          goto LABEL_22;
        }
        BOOL v39 = NSString;
        v40 = +[VUILocalizationManager sharedInstance];
        v41 = [v40 localizedStringForKey:@"SHARE_ITEM_MAIL"];
        v42 = [v39 stringWithValidatedFormat:v41, @"%@ %@", 0, self->_itemSubtitle, v29 validFormatSpecifiers error];

        [v32 appendFormat:@"%@ · %@<br/><br/>", self->_itemTitle, v42];
      }

LABEL_22:
      v49 = [(VUIShareActivityViewController_iOS *)self itemImageURL];

      if (v49)
      {
        v50 = [(VUIShareActivityViewController_iOS *)self view];
        [v50 bounds];
        double v52 = v51 + -20.0;

        if (v52 < 150.0) {
          double v52 = 150.0;
        }
        v53 = NSString;
        v54 = [(VUIShareActivityViewController_iOS *)self itemImageURL];
        [v53 stringWithFormat:@"<br/><br/><img width=\"%f\" src=\"%@\"/>", *(void *)&v52, v54];
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v55 = &stru_1F3E921E0;
      }
      v56 = [NSString stringWithFormat:@"%@<a href=\"%@\">%@</a>%@</body></html>", v32, self->_sharingURL, self->_sharingURL, v55];
      v57 = self->_itemTitle;
      if (v57)
      {
        id v58 = [v6 mailComposeViewController];
        [v58 setSubject:v57];
      }
      v59 = [v6 mailComposeViewController];
      [v59 setMessageBody:v56 isHTML:1];

      if (v7) {
        v7[2](v7);
      }

      goto LABEL_32;
    }
  }
  else
  {
  }
  if (v7) {
    v7[2](v7);
  }
LABEL_32:
}

- (NSURL)itemImageURL
{
  return self->_itemImageURL;
}

- (void)setItemImageURL:(id)a3
{
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)itemSubtitle
{
  return self->_itemSubtitle;
}

- (void)setItemSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSubtitle, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_itemImageURL, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_pendingMessageMetadataProvider, 0);
}

@end