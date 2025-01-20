@interface AEAssetLinkPresentationActivityItemProvider
- (AEAssetActivityPropertyProvider)propertyProvider;
- (AEAssetLinkPresentationActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4;
- (BOOL)shouldShareActivityType:(id)a3;
- (BOOL)supportsActivityType:(id)a3;
- (id)_generateLinkMetaData;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation AEAssetLinkPresentationActivityItemProvider

- (AEAssetLinkPresentationActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4
{
  id v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AEAssetLinkPresentationActivityItemProvider;
  v6 = [(AEAssetLinkPresentationActivityItemProvider *)&v10 init];
  if (v6)
  {
    v7 = [[AEAssetActivityPropertyProvider alloc] initWithPropertySource:v5];
    propertyProvider = v6->_propertyProvider;
    v6->_propertyProvider = v7;
  }
  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_2CE418;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return [(AEAssetLinkPresentationActivityItemProvider *)self _generateLinkMetaData];
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  return [(AEAssetLinkPresentationActivityItemProvider *)self _generateLinkMetaData];
}

- (id)_generateLinkMetaData
{
  id v3 = objc_alloc_init((Class)LPLinkMetadata);
  v4 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
  id v5 = [v4 storeURL];

  [v3 setURL:v5];
  [v3 setOriginalURL:v5];
  v6 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
  v7 = [v6 previewAssetCoverItemProvider];

  if (v7)
  {
    id v8 = [objc_alloc((Class)LPImage) initWithItemProvider:v7 properties:0 placeholderImage:0];
    if (!v8) {
      goto LABEL_28;
    }
LABEL_11:
    v12 = +[BUAccountsProvider sharedProvider];
    v13 = [v12 activeStoreAccount];
    v14 = [v13 ams_storefront];

    v15 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
    uint64_t v16 = (uint64_t)[v15 assetType];

    if (v16 != 1 && v16 != 4)
    {
      if (v16 == 6)
      {
        id v20 = objc_alloc_init((Class)LPiTunesMediaAudioBookMetadata);
        v21 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
        v22 = [v21 title];
        [v20 setName:v22];

        v23 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
        v24 = [v23 author];
        [v20 setAuthor:v24];

        [v20 setArtwork:v8];
        v25 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
        LODWORD(v24) = [v25 isStoreAsset];

        if (v24)
        {
          [v20 setStoreFrontIdentifier:v14];
          v26 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
          v27 = [v26 storeID];
          [v20 setStoreIdentifier:v27];
LABEL_20:
        }
      }
      else
      {
        if ((v16 & 0xFFFFFFFFFFFFFFFELL) != 2)
        {
          BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AEServices/Sharing/Private/AEAssetActivityItemProviderSource.m", 984, (uint64_t)"-[AEAssetLinkPresentationActivityItemProvider _generateLinkMetaData]", (uint64_t)"NO", @"Trying to show link preview for unsupported asset type", v17, v18, v19, v45);
          goto LABEL_27;
        }
        id v20 = objc_alloc_init((Class)LPFileMetadata);
        v37 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
        v38 = [v37 title];
        [v20 setName:v38];

        v39 = BCAssetUTIForContentType(v16);
        [v20 setType:v39];

        v40 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
        v41 = [v40 bookURL];
        uint64_t v46 = 0;
        id v42 = [v41 bu_fileAllocatedSizeWithError:&v46];
        uint64_t v43 = v46;

        if (!v43 && v42) {
          [v20 setSize:v42];
        }
        [v20 setThumbnail:v8];
      }
LABEL_26:
      [v3 setSpecialization:v20];

LABEL_27:
      goto LABEL_28;
    }
    id v20 = objc_alloc_init((Class)LPiTunesMediaBookMetadata);
    v28 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
    v29 = [v28 title];
    [v20 setName:v29];

    v30 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
    v31 = [v30 author];
    [v20 setAuthor:v31];

    [v20 setArtwork:v8];
    v32 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
    LODWORD(v31) = [v32 isStoreAsset];

    if (v31)
    {
      [v20 setStoreFrontIdentifier:v14];
      v33 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
      v34 = [v33 storeID];
      [v20 setStoreIdentifier:v34];
    }
    v35 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
    v36 = [v35 readingDirection];

    if (!v36) {
      goto LABEL_26;
    }
    v26 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
    v27 = [v26 readingDirection];
    [v20 setHasSpineOnRight:[v27 isEqualToString:@"rtl"]];
    goto LABEL_20;
  }
  v9 = [(AEAssetLinkPresentationActivityItemProvider *)self propertyProvider];
  objc_super v10 = [v9 assetCover];

  if (v10)
  {
    v11 = UIImagePNGRepresentation(v10);
    if (v11) {
      id v8 = [objc_alloc((Class)LPImage) initWithData:v11 MIMEType:@"image/png"];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  if (v8) {
    goto LABEL_11;
  }
LABEL_28:

  return v3;
}

- (BOOL)shouldShareActivityType:(id)a3
{
  return 1;
}

- (BOOL)supportsActivityType:(id)a3
{
  return [a3 isEqualToString:UIActivityTypeMessage];
}

- (AEAssetActivityPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void).cxx_destruct
{
}

@end