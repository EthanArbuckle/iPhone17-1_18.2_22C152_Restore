@interface PXContentSyndicationAttributionInfo
+ (id)_applyAttributesToTitle:(id)a3;
+ (id)_displayNameFont;
+ (id)_nameStringForContact:(id)a3;
+ (id)_primaryFont;
+ (id)_sharedContactFetchSerialQueue;
+ (id)appIconFetchQueue;
- (BOOL)hasSyndicationAttributionInfo;
- (BOOL)syndicationAttributionInfoIsLoading;
- (CNContact)contact;
- (NSAttributedString)savedFromTitle;
- (NSAttributedString)syndicationSharedWithInMessagesAttributedTitle;
- (NSString)axDescriptionForSyndicationContactImage;
- (NSString)axDescriptionForSyndicationLoadingIndicator;
- (NSString)axDescriptionForSyndicationReplyButton;
- (NSString)receivingGroupDisplayName;
- (NSString)senderAppName;
- (NSString)syndicationAttributionIdentifier;
- (NSString)syndicationSenderDisplayName;
- (PHAsset)asset;
- (PXContentSyndicationAttributionInfo)initWithAsset:(id)a3;
- (PXContentSyndicationAttributionInfoChangeDelegate)changeDelegate;
- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)highlightProvider;
- (SLHighlight)highlight;
- (UIImage)senderThumbnailImage;
- (id)_sfaAttributes;
- (void)_fetchContactWithIdentifier:(id)a3 completion:(id)a4;
- (void)_handleAttributionChanges;
- (void)_handleContactFetchCompletion:(id)a3 error:(id)a4 oldSyndicationSenderDisplayName:(id)a5 oldSyndicationSharedWithTitle:(id)a6 oldImageData:(id)a7;
- (void)_invalidateAttributedStrings;
- (void)_updateAppNameColorForAttributedString:(id)a3 defaultFontValue:(id)a4;
- (void)createSyndicatedAppIconWithSize:(CGSize)a3 scale:(double)a4 completion:(id)a5;
- (void)fetchAppIconThumbnailImageWithCompletion:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAxDescriptionForSyndicationContactImage:(id)a3;
- (void)setAxDescriptionForSyndicationReplyButton:(id)a3;
- (void)setChangeDelegate:(id)a3;
- (void)setContact:(id)a3;
- (void)setHasSyndicationAttributionInfo:(BOOL)a3;
- (void)setHighlight:(id)a3;
- (void)setHighlightProvider:(id)a3;
- (void)setReceivingGroupDisplayName:(id)a3;
- (void)setSavedFromTitle:(id)a3;
- (void)setSenderAppName:(id)a3;
- (void)setSenderThumbnailImage:(id)a3;
- (void)setSyndicationAttributionIdentifier:(id)a3;
- (void)setSyndicationAttributionInfoIsLoading:(BOOL)a3;
- (void)setSyndicationSenderDisplayName:(id)a3;
- (void)setSyndicationSharedWithInMessagesAttributedTitle:(id)a3;
@end

@implementation PXContentSyndicationAttributionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_receivingGroupDisplayName, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_axDescriptionForSyndicationReplyButton, 0);
  objc_storeStrong((id *)&self->_axDescriptionForSyndicationContactImage, 0);
  objc_storeStrong((id *)&self->_axDescriptionForSyndicationLoadingIndicator, 0);
  objc_storeStrong((id *)&self->_syndicationAttributionIdentifier, 0);
  objc_storeStrong((id *)&self->_senderThumbnailImage, 0);
  objc_destroyWeak((id *)&self->_changeDelegate);
  objc_storeStrong((id *)&self->_savedFromTitle, 0);
  objc_storeStrong((id *)&self->_syndicationSharedWithInMessagesAttributedTitle, 0);
  objc_storeStrong((id *)&self->_senderAppName, 0);
  objc_storeStrong((id *)&self->_syndicationSenderDisplayName, 0);
}

- (void)setHighlightProvider:(id)a3
{
}

- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)highlightProvider
{
  return self->_highlightProvider;
}

- (void)setReceivingGroupDisplayName:(id)a3
{
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setContact:(id)a3
{
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setAxDescriptionForSyndicationReplyButton:(id)a3
{
}

- (void)setAxDescriptionForSyndicationContactImage:(id)a3
{
}

- (NSString)axDescriptionForSyndicationLoadingIndicator
{
  return self->_axDescriptionForSyndicationLoadingIndicator;
}

- (void)setSyndicationAttributionIdentifier:(id)a3
{
}

- (void)setSenderThumbnailImage:(id)a3
{
}

- (void)setChangeDelegate:(id)a3
{
}

- (PXContentSyndicationAttributionInfoChangeDelegate)changeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
  return (PXContentSyndicationAttributionInfoChangeDelegate *)WeakRetained;
}

- (void)setHasSyndicationAttributionInfo:(BOOL)a3
{
  self->_hasSyndicationAttributionInfo = a3;
}

- (BOOL)hasSyndicationAttributionInfo
{
  return self->_hasSyndicationAttributionInfo;
}

- (void)setSyndicationAttributionInfoIsLoading:(BOOL)a3
{
  self->_syndicationAttributionInfoIsLoading = a3;
}

- (BOOL)syndicationAttributionInfoIsLoading
{
  return self->_syndicationAttributionInfoIsLoading;
}

- (void)setSavedFromTitle:(id)a3
{
}

- (void)setSyndicationSharedWithInMessagesAttributedTitle:(id)a3
{
}

- (void)setSenderAppName:(id)a3
{
}

- (void)setSyndicationSenderDisplayName:(id)a3
{
}

- (void)_handleContactFetchCompletion:(id)a3 error:(id)a4 oldSyndicationSenderDisplayName:(id)a5 oldSyndicationSharedWithTitle:(id)a6 oldImageData:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [(PXContentSyndicationAttributionInfo *)self asset];
      v19 = [v18 uuid];
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "Info Panel attribution: Contact refresh failed for asset UUID: %{public}@ with error: %@", buf, 0x16u);
    }
  }
  [(PXContentSyndicationAttributionInfo *)self setContact:v12];
  id v20 = [(PXContentSyndicationAttributionInfo *)self syndicationSenderDisplayName];
  if (v20 == v14)
  {
  }
  else
  {
    int v21 = [v14 isEqualToString:v20];

    if (!v21) {
      goto LABEL_12;
    }
  }
  id v29 = v13;
  v22 = [(PXContentSyndicationAttributionInfo *)self syndicationSharedWithInMessagesAttributedTitle];
  id v23 = (id)[v22 copy];
  if (v23 == v15)
  {
  }
  else
  {
    char v24 = [v15 isEqualToString:v23];

    if ((v24 & 1) == 0)
    {

      id v13 = v29;
LABEL_12:
      v25 = v16;

LABEL_15:
      v28 = [(PXContentSyndicationAttributionInfo *)self changeDelegate];
      [v28 syndicationAttributionInfoDidChange:self];

      goto LABEL_16;
    }
  }
  v26 = _ThumbnailImageDataFromAttributionContact(v12);
  v25 = v16;
  char v27 = [v16 isEqualToData:v26];

  id v13 = v29;
  if ((v27 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_fetchContactWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = +[PXContentSyndicationAttributionInfo _sharedContactFetchSerialQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__PXContentSyndicationAttributionInfo__fetchContactWithIdentifier_completion___block_invoke;
    v15[3] = &unk_1E5DD3280;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v8, v15);

    v9 = v16;
  }
  else
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [(PXContentSyndicationAttributionInfo *)self asset];
      id v12 = [v11 uuid];
      *(_DWORD *)buf = 138543362;
      int v21 = v12;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Info Panel attribution: No contact to fetch with asset UUID: %{public}@", buf, 0xCu);
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F28588];
    v19 = @"Contact ID nil while attempting to fetch contact.";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v14 = (void *)[v13 initWithDomain:@"PhotosUISyndicationDomain" code:0 userInfo:v9];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

void __78__PXContentSyndicationAttributionInfo__fetchContactWithIdentifier_completion___block_invoke(uint64_t a1)
{
  v18[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1ADC8];
  v18[0] = *MEMORY[0x1E4F1AE08];
  v18[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AF98];
  v18[2] = *MEMORY[0x1E4F1AEE0];
  v18[3] = v3;
  v4 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v18[4] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];

  id v6 = +[PXPeopleUtilities sharedContactStore];
  uint64_t v7 = *(void *)(a1 + 32);
  id v17 = 0;
  v8 = [v6 unifiedContactWithIdentifier:v7 keysToFetch:v5 error:&v17];
  id v9 = v17;

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PXContentSyndicationAttributionInfo__fetchContactWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E5DD0E78;
  id v10 = *(id *)(a1 + 40);
  id v15 = v9;
  id v16 = v10;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __78__PXContentSyndicationAttributionInfo__fetchContactWithIdentifier_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_handleAttributionChanges
{
  uint64_t v3 = [(PXContentSyndicationAttributionInfo *)self syndicationSenderDisplayName];
  v4 = [(PXContentSyndicationAttributionInfo *)self syndicationSharedWithInMessagesAttributedTitle];
  v5 = (void *)[v4 copy];

  id v6 = [(PXContentSyndicationAttributionInfo *)self contact];
  uint64_t v7 = _ThumbnailImageDataFromAttributionContact(v6);

  [(PXContentSyndicationAttributionInfo *)self setContact:0];
  [(PXContentSyndicationAttributionInfo *)self setSenderThumbnailImage:0];
  [(PXContentSyndicationAttributionInfo *)self setSyndicationSenderDisplayName:0];
  objc_initWeak(&location, self);
  v8 = [(PXContentSyndicationAttributionInfo *)self contact];
  id v9 = [v8 identifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PXContentSyndicationAttributionInfo__handleAttributionChanges__block_invoke;
  v13[3] = &unk_1E5DB3828;
  objc_copyWeak(&v17, &location);
  id v10 = v3;
  id v14 = v10;
  id v11 = v5;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  [(PXContentSyndicationAttributionInfo *)self _fetchContactWithIdentifier:v9 completion:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __64__PXContentSyndicationAttributionInfo__handleAttributionChanges__block_invoke(void *a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 7);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleContactFetchCompletion:v7 error:v6 oldSyndicationSenderDisplayName:a1[4] oldSyndicationSharedWithTitle:a1[5] oldImageData:a1[6]];
}

- (CNContact)contact
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  contact = self->_contact;
  if (!contact)
  {
    v4 = [(PXContentSyndicationAttributionInfo *)self highlight];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 attributions];
      id v7 = [v6 firstObject];

      v8 = [v7 sender];
      id v9 = [v8 contact];
      id v10 = self->_contact;
      self->_contact = v9;

      if (!self->_contact)
      {
        id v11 = [v7 relatedPersons];
        id v12 = [v11 firstObject];
        id v13 = [v12 contact];
        id v14 = self->_contact;
        self->_contact = v13;

        if (!self->_contact)
        {
          id v15 = PLUIGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            id v16 = [(PXContentSyndicationAttributionInfo *)self asset];
            id v17 = [v16 uuid];
            int v19 = 138412546;
            id v20 = v5;
            __int16 v21 = 2114;
            uint64_t v22 = v17;
            _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Info Panel attribution: Contact not found for highlight: %@ asset UUID: %{public}@", (uint8_t *)&v19, 0x16u);
          }
        }
      }
    }
    contact = self->_contact;
  }
  return contact;
}

- (NSString)receivingGroupDisplayName
{
  receivingGroupDisplayName = self->_receivingGroupDisplayName;
  if (!receivingGroupDisplayName)
  {
    self->_receivingGroupDisplayName = (NSString *)&stru_1F00B0030;
    v4 = [(PXContentSyndicationAttributionInfo *)self highlight];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 attributions];
      id v7 = [v6 firstObject];

      if ([v7 isGroupConversation])
      {
        v8 = [v7 groupDisplayName];
        id v9 = (NSString *)[v8 copy];
        id v10 = self->_receivingGroupDisplayName;
        self->_receivingGroupDisplayName = v9;
      }
    }

    receivingGroupDisplayName = self->_receivingGroupDisplayName;
  }
  return receivingGroupDisplayName;
}

- (void)_updateAppNameColorForAttributedString:(id)a3 defaultFontValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  uint64_t v8 = [v5 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__PXContentSyndicationAttributionInfo__updateAppNameColorForAttributedString_defaultFontValue___block_invoke;
  v11[3] = &unk_1E5DB3800;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v11);
}

void __95__PXContentSyndicationAttributionInfo__updateAppNameColorForAttributedString_defaultFontValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v14 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v14 fontDescriptor];
    char v10 = [v9 symbolicTraits];

    if ((v10 & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], *(void *)(a1 + 40), a3, a4);
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *MEMORY[0x1E4FB0700];
      id v13 = [MEMORY[0x1E4FB1618] labelColor];
      objc_msgSend(v11, "addAttribute:value:range:", v12, v13, a3, a4);

      *a5 = 1;
    }
  }
}

- (id)_sfaAttributes
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  PXCappedFontWithTextStyle();
}

- (void)_invalidateAttributedStrings
{
  savedFromTitle = self->_savedFromTitle;
  self->_savedFromTitle = 0;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
  self->_syndicationAttributionInfoIsLoading = 0;
  self->_hasSyndicationAttributionInfo = a3 != 0;
  id v5 = [(PXContentSyndicationAttributionInfo *)self changeDelegate];
  [v5 syndicationAttributionInfoDidChange:self];
}

- (NSString)axDescriptionForSyndicationReplyButton
{
  axDescriptionForSyndicationReplyButton = self->_axDescriptionForSyndicationReplyButton;
  if (!axDescriptionForSyndicationReplyButton)
  {
    v4 = [(PXContentSyndicationAttributionInfo *)self syndicationSenderDisplayName];
    if (v4)
    {
      id v5 = PXLocalizedStringFromTable(@"AX_LABEL_SYNDICATION_ATTRIBUTION_REPLY_BUTTON", @"PhotosUICore");
      PXStringWithValidatedFormat();
      id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = self->_axDescriptionForSyndicationReplyButton;
      self->_axDescriptionForSyndicationReplyButton = v6;
    }
    axDescriptionForSyndicationReplyButton = self->_axDescriptionForSyndicationReplyButton;
  }
  return axDescriptionForSyndicationReplyButton;
}

- (NSString)axDescriptionForSyndicationContactImage
{
  axDescriptionForSyndicationContactImage = self->_axDescriptionForSyndicationContactImage;
  if (!axDescriptionForSyndicationContactImage)
  {
    v4 = [(PXContentSyndicationAttributionInfo *)self syndicationSenderDisplayName];
    if (v4)
    {
      id v5 = PXLocalizedStringFromTable(@"AX_LABEL_SYNDICATION_ATTRIBUTION_CONTACT_IMAGE", @"PhotosUICore");
      PXStringWithValidatedFormat();
      id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = self->_axDescriptionForSyndicationContactImage;
      self->_axDescriptionForSyndicationContactImage = v6;
    }
    axDescriptionForSyndicationContactImage = self->_axDescriptionForSyndicationContactImage;
  }
  return axDescriptionForSyndicationContactImage;
}

- (NSString)syndicationAttributionIdentifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  syndicationAttributionIdentifier = self->_syndicationAttributionIdentifier;
  if (!syndicationAttributionIdentifier)
  {
    v4 = [(PXContentSyndicationAttributionInfo *)self highlight];
    id v5 = [v4 attributions];
    id v6 = [v5 firstObject];

    if (v6)
    {
      uint64_t v7 = [v6 uniqueIdentifier];
      uint64_t v8 = [v7 copy];
      id v9 = self->_syndicationAttributionIdentifier;
      self->_syndicationAttributionIdentifier = v8;
    }
    else
    {
      uint64_t v7 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        char v10 = [(PXContentSyndicationAttributionInfo *)self asset];
        id v11 = [v10 uuid];
        int v13 = 138543618;
        id v14 = v4;
        __int16 v15 = 2114;
        id v16 = v11;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Attribution Info: No SLAttribution found for highlight: %{public}@ asset UUID: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }

    syndicationAttributionIdentifier = self->_syndicationAttributionIdentifier;
  }
  return syndicationAttributionIdentifier;
}

- (void)createSyndicatedAppIconWithSize:(CGSize)a3 scale:(double)a4 completion:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a5;
  char v10 = [(PXContentSyndicationAttributionInfo *)self asset];
  id v11 = [v10 curationProperties];

  uint64_t v12 = [v11 importedByBundleIdentifier];
  int v13 = +[PXContentSyndicationAttributionInfo appIconFetchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PXContentSyndicationAttributionInfo_createSyndicatedAppIconWithSize_scale_completion___block_invoke;
  block[3] = &unk_1E5DB37D8;
  CGFloat v19 = width;
  CGFloat v20 = height;
  double v21 = a4;
  id v17 = v12;
  id v18 = v9;
  id v14 = v9;
  id v15 = v12;
  dispatch_async(v13, block);
}

void __88__PXContentSyndicationAttributionInfo_createSyndicatedAppIconWithSize_scale_completion___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:*(void *)(a1 + 32)];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v2 prepareImagesForImageDescriptors:v4];

  id v5 = [v2 imageForDescriptor:v3];
  if ([v5 placeholder])
  {
    uint64_t v6 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"appstore.app"];
  }
  else
  {
    if (!v5)
    {
      uint64_t v7 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v5, "CGImage"));
  }
  uint64_t v7 = (void *)v6;
LABEL_6:
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__PXContentSyndicationAttributionInfo_createSyndicatedAppIconWithSize_scale_completion___block_invoke_2;
  v10[3] = &unk_1E5DD3280;
  id v8 = *(id *)(a1 + 40);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __88__PXContentSyndicationAttributionInfo_createSyndicatedAppIconWithSize_scale_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchAppIconThumbnailImageWithCompletion:(id)a3
{
  id v5 = a3;
  v4 = [(PXContentSyndicationAttributionInfo *)self senderAppName];
  if (v4) {
    -[PXContentSyndicationAttributionInfo createSyndicatedAppIconWithSize:scale:completion:](self, "createSyndicatedAppIconWithSize:scale:completion:", v5, 32.0, 32.0, 3.0);
  }
}

- (UIImage)senderThumbnailImage
{
  senderThumbnailImage = self->_senderThumbnailImage;
  if (!senderThumbnailImage)
  {
    v4 = [(PXContentSyndicationAttributionInfo *)self contact];
    id v5 = _ThumbnailImageDataFromAttributionContact(v4);
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1818] imageWithData:v5];
      uint64_t v7 = self->_senderThumbnailImage;
      self->_senderThumbnailImage = v6;
    }
    senderThumbnailImage = self->_senderThumbnailImage;
  }
  return senderThumbnailImage;
}

- (NSAttributedString)savedFromTitle
{
  savedFromTitle = self->_savedFromTitle;
  if (!savedFromTitle)
  {
    v4 = [(PXContentSyndicationAttributionInfo *)self senderAppName];
    id v5 = [(PXContentSyndicationAttributionInfo *)self _sfaAttributes];
    if (v4)
    {
      uint64_t v6 = PXLocalizedStringFromTable(@"ATTRIBUTION_SAVED_FROM_APP", @"PhotosUICore");
      id v14 = objc_msgSend(v4, "px_stringConvertedToHTMLString");
      uint64_t v7 = PXLocalizedStringWithValidatedFormat(v6, @"%@");

      id v8 = objc_msgSend(MEMORY[0x1E4F28E48], "px_attributedStringWithHTMLString:defaultAttributes:", v7, v5, v14);
      id v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
      [(PXContentSyndicationAttributionInfo *)self _updateAppNameColorForAttributedString:v8 defaultFontValue:v9];

      char v10 = (NSAttributedString *)[v8 copy];
      id v11 = self->_savedFromTitle;
      self->_savedFromTitle = v10;
    }
    else
    {
      uint64_t v7 = PXLocalizedStringFromTable(@"ATTRIBUTION_SAVED_FROM", @"PhotosUICore");
      id v12 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v5];
      id v8 = self->_savedFromTitle;
      self->_savedFromTitle = v12;
    }

    savedFromTitle = self->_savedFromTitle;
  }
  return savedFromTitle;
}

- (NSAttributedString)syndicationSharedWithInMessagesAttributedTitle
{
  syndicationSharedWithInMessagesAttributedTitle = self->_syndicationSharedWithInMessagesAttributedTitle;
  if (!syndicationSharedWithInMessagesAttributedTitle)
  {
    v4 = PXLocalizedStringFromTable(@"SYNDICATION_ATTRIBUTION_SHARED_WITH_YOU_IN_MESSAGES", @"PhotosUICore");
    id v9 = [(PXContentSyndicationAttributionInfo *)self syndicationSenderDisplayName];
    id v5 = PXLocalizedStringWithValidatedFormat(v4, @"%@");

    +[PXContentSyndicationAttributionInfo _applyAttributesToTitle:](PXContentSyndicationAttributionInfo, "_applyAttributesToTitle:", v5, v9);
    uint64_t v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_syndicationSharedWithInMessagesAttributedTitle;
    self->_syndicationSharedWithInMessagesAttributedTitle = v6;

    syndicationSharedWithInMessagesAttributedTitle = self->_syndicationSharedWithInMessagesAttributedTitle;
  }
  return syndicationSharedWithInMessagesAttributedTitle;
}

- (NSString)senderAppName
{
  senderAppName = self->_senderAppName;
  if (!senderAppName)
  {
    v4 = [(PXContentSyndicationAttributionInfo *)self asset];
    id v5 = [v4 syndicatedAppDisplayName];
    uint64_t v6 = (NSString *)[v5 copy];
    uint64_t v7 = self->_senderAppName;
    self->_senderAppName = v6;

    senderAppName = self->_senderAppName;
  }
  return senderAppName;
}

- (NSString)syndicationSenderDisplayName
{
  syndicationSenderDisplayName = self->_syndicationSenderDisplayName;
  if (!syndicationSenderDisplayName)
  {
    v4 = [(PXContentSyndicationAttributionInfo *)self contact];
    if (v4)
    {
      id v5 = [(id)objc_opt_class() _nameStringForContact:v4];
    }
    else
    {
      id v5 = &stru_1F00B0030;
    }
    uint64_t v6 = self->_syndicationSenderDisplayName;
    self->_syndicationSenderDisplayName = &v5->isa;

    syndicationSenderDisplayName = self->_syndicationSenderDisplayName;
  }
  return syndicationSenderDisplayName;
}

- (PXContentSyndicationAttributionInfo)initWithAsset:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXContentSyndicationAttributionInfo.m", 107, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)PXContentSyndicationAttributionInfo;
  uint64_t v7 = [(PXContentSyndicationAttributionInfo *)&v20 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_asset, a3);
    if ((objc_msgSend(v6, "px_isSyndicatedAsset") & 1) != 0
      || objc_msgSend(v6, "px_wasSavedThroughSyndication"))
    {
      if (objc_msgSend(v6, "px_canLoadSyndicationAttributionInfo"))
      {
        uint64_t v9 = +[PXContentSyndicationPhotoKitSocialLayerHighlightProvider sharedInstance];
        highlightProvider = v8->_highlightProvider;
        v8->_highlightProvider = (PXContentSyndicationPhotoKitSocialLayerHighlightProvider *)v9;

        v8->_syndicationAttributionInfoIsLoading = 1;
        uint64_t v11 = PXLocalizedStringFromTable(@"AX_LABEL_SYNDICATION_ATTRIBUTION_LOADING", @"PhotosUICore");
        axDescriptionForSyndicationLoadingIndicator = v8->_axDescriptionForSyndicationLoadingIndicator;
        v8->_axDescriptionForSyndicationLoadingIndicator = (NSString *)v11;

        objc_initWeak(&location, v8);
        int v13 = v8->_highlightProvider;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __53__PXContentSyndicationAttributionInfo_initWithAsset___block_invoke;
        v17[3] = &unk_1E5DB37B0;
        objc_copyWeak(&v18, &location);
        [(PXContentSyndicationPhotoKitSocialLayerHighlightProvider *)v13 fetchSocialLayerHighlightForAsset:v6 completion:v17];
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v8 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v8;
}

void __53__PXContentSyndicationAttributionInfo_initWithAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setHighlight:v3];

  if (!v3)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_loadWeakRetained(v2);
      uint64_t v7 = [v6 asset];
      id v8 = [v7 uuid];
      int v9 = 138543362;
      char v10 = v8;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Unexpected nil highlight for asset UUID: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (id)_displayNameFont
{
}

+ (id)_primaryFont
{
}

+ (id)_applyAttributesToTitle:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[PXContentSyndicationAttributionInfo _primaryFont];
  id v5 = +[PXContentSyndicationAttributionInfo _displayNameFont];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  v16[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v6 = v16[0];
  v16[1] = v7;
  v17[0] = v4;
  id v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v17[1] = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  v14[1] = v7;
  v15[0] = v5;
  v14[0] = v6;
  char v10 = [MEMORY[0x1E4FB1618] labelColor];
  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  id v12 = objc_msgSend(MEMORY[0x1E4F28B18], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v3, v9, v11, v9);

  return v12;
}

+ (id)_nameStringForContact:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = &stru_1F00B0030;
    goto LABEL_17;
  }
  uint64_t v6 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:0];
  if ([(__CFString *)v6 length]) {
    goto LABEL_17;
  }
  uint64_t v7 = [v5 emailAddresses];
  id v8 = [v7 firstObject];

  if (!v8)
  {
    uint64_t v11 = [v5 phoneNumbers];
    id v12 = [v11 firstObject];

    if (!v12)
    {
      id v16 = PLUIGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v5;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Info Panel attribution: No display string found for attribution contact: %@", buf, 0xCu);
      }

      goto LABEL_15;
    }
    id v13 = [v12 value];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_11:
        id v14 = [v13 stringValue];
        uint64_t v15 = [v14 copy];

        uint64_t v6 = (__CFString *)v15;
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v26);
      char v27 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v23 handleFailureInMethod:a2, a1, @"PXContentSyndicationAttributionInfo.m", 389, @"%@ should be an instance inheriting from %@, but it is %@", @"phoneNumberValue", v25, v27 object file lineNumber description];
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      char v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      [v23 handleFailureInMethod:a2, a1, @"PXContentSyndicationAttributionInfo.m", 389, @"%@ should be an instance inheriting from %@, but it is nil", @"phoneNumberValue", v25 object file lineNumber description];
    }

    goto LABEL_11;
  }
  id v9 = [v8 value];
  if (!v9)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v19 = (objc_class *)objc_opt_class();
    objc_super v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, a1, @"PXContentSyndicationAttributionInfo.m", 383, @"%@ should be an instance inheriting from %@, but it is nil", @"emailValue", v20 object file lineNumber description];
LABEL_22:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    double v21 = (objc_class *)objc_opt_class();
    objc_super v20 = NSStringFromClass(v21);
    uint64_t v22 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v18 handleFailureInMethod:a2, a1, @"PXContentSyndicationAttributionInfo.m", 383, @"%@ should be an instance inheriting from %@, but it is %@", @"emailValue", v20, v22 object file lineNumber description];

    goto LABEL_22;
  }
LABEL_6:
  uint64_t v10 = [v9 copy];

  uint64_t v6 = (__CFString *)v10;
LABEL_16:

LABEL_17:
  return v6;
}

+ (id)_sharedContactFetchSerialQueue
{
  if (_sharedContactFetchSerialQueue_onceToken != -1) {
    dispatch_once(&_sharedContactFetchSerialQueue_onceToken, &__block_literal_global_193_47036);
  }
  uint64_t v2 = (void *)_sharedContactFetchSerialQueue_serialQueue;
  return v2;
}

void __69__PXContentSyndicationAttributionInfo__sharedContactFetchSerialQueue__block_invoke()
{
}

+ (id)appIconFetchQueue
{
  if (appIconFetchQueue_onceToken != -1) {
    dispatch_once(&appIconFetchQueue_onceToken, &__block_literal_global_47039);
  }
  uint64_t v2 = (void *)appIconFetchQueue_serialQueue;
  return v2;
}

void __56__PXContentSyndicationAttributionInfo_appIconFetchQueue__block_invoke()
{
}

@end