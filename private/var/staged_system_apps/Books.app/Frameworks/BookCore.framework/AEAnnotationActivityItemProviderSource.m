@interface AEAnnotationActivityItemProviderSource
+ (id)activityItemProviderSourceWithAnnotations:(id)a3 propertySource:(id)a4;
+ (id)truncatedAnnotationSelectedText:(id)a3;
+ (unint64_t)citationWordCountLimit;
- (AEAnnotationActivityItemProviderSource)initWithAnnotations:(id)a3 propertySource:(id)a4;
- (AEAnnotationPaginationDataSource)paginationDataSource;
- (BOOL)areCitationAllowed;
- (NSArray)annotations;
- (id)_generateLinkMetadata;
- (id)chapterTitleForAnnotation:(id)a3;
- (id)copyrightCitation;
- (id)text;
- (void)dealloc;
- (void)setCitationsAllowed:(BOOL)a3;
- (void)setPaginationDataSource:(id)a3;
@end

@implementation AEAnnotationActivityItemProviderSource

+ (unint64_t)citationWordCountLimit
{
  return 200;
}

+ (id)truncatedAnnotationSelectedText:(id)a3
{
  v4 = [a3 annotationSelectedText];
  uint64_t v10 = 0;
  [v4 tokenCountWithEnumerationOptions:3 maxTokenCount:[a1 citationWordCountLimit] outLimitLength:&v10];
  uint64_t v5 = v10;
  v6 = IMCommonCoreBundle();
  v7 = [v6 localizedStringForKey:@"[\\U2026]" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  v8 = [v4 stringByTruncatingToLength:v5 options:3 truncationString:v7];

  return v8;
}

+ (id)activityItemProviderSourceWithAnnotations:(id)a3 propertySource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithAnnotations:v7 propertySource:v6];

  return v8;
}

- (AEAnnotationActivityItemProviderSource)initWithAnnotations:(id)a3 propertySource:(id)a4
{
  id v7 = a3;
  id v8 = [(AEAssetActivityItemProviderSource *)self initWithPropertySource:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_annotations, a3);
  }

  return v9;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_paginationDataSource, 0);
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotationActivityItemProviderSource;
  [(AEAnnotationActivityItemProviderSource *)&v3 dealloc];
}

- (id)copyrightCitation
{
  v7.receiver = self;
  v7.super_class = (Class)AEAnnotationActivityItemProviderSource;
  v2 = [(AEAssetActivityItemProviderSource *)&v7 citation];
  objc_super v3 = IMCommonCoreBundle();
  v4 = [v3 localizedStringForKey:@"This material may be protected by copyright." value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  uint64_t v5 = [v2 stringByAppendingFormat:@"\n%@", v4];

  return v5;
}

- (id)chapterTitleForAnnotation:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v4 chapterTitle], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [(AEAnnotationActivityItemProviderSource *)self paginationDataSource];
    uint64_t v5 = [v6 chapterTitleForAnnotation:v4];
  }

  return v5;
}

- (id)text
{
  objc_super v3 = objc_opt_class();
  id v4 = [(AEAnnotationActivityItemProviderSource *)self annotations];
  uint64_t v5 = [v4 firstObject];
  id v6 = [v3 truncatedAnnotationSelectedText:v5];

  return v6;
}

- (id)_generateLinkMetadata
{
  id v3 = objc_alloc_init((Class)LPLinkMetadata);
  id v4 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  uint64_t v5 = [v4 previewAssetCoverItemProvider];

  if (v5)
  {
    id v6 = [objc_alloc((Class)LPImage) initWithItemProvider:v5 properties:0 placeholderImage:0];
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v36 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
    v37 = [v36 assetCover];

    if (v37)
    {
      v38 = UIImagePNGRepresentation(v37);
      if (v38) {
        id v6 = [objc_alloc((Class)LPImage) initWithData:v38 MIMEType:@"image/png"];
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }

    if (v6)
    {
LABEL_3:
      objc_super v7 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      unsigned int v8 = [v7 isStoreAsset];

      if (v8)
      {
        v9 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
        uint64_t v10 = [v9 storeURL];

        [v3 setURL:v10];
        [v3 setOriginalURL:v10];
        v11 = [(AEAnnotationActivityItemProviderSource *)self annotations];
        v12 = [v11 firstObject];

        if (([v12 annotationHasNote] & 1) == 0)
        {
          v13 = +[AEAnnotationActivityItemProviderSource truncatedAnnotationSelectedText:v12];
          [v3 setSelectedText:v13];
        }
      }
      v14 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      v15 = [v14 title];
      [v3 setTitle:v15];

      v16 = +[BUAccountsProvider sharedProvider];
      v17 = [v16 activeStoreAccount];
      v18 = [v17 ams_storefront];

      v19 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      uint64_t v20 = (uint64_t)[v19 assetType];

      if (v20 == 4 || v20 == 1)
      {
        id v24 = objc_alloc_init((Class)LPiTunesMediaBookMetadata);
        v25 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
        v26 = [v25 title];
        [v24 setName:v26];

        v27 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
        v28 = [v27 author];
        [v24 setAuthor:v28];

        [v24 setArtwork:v6];
        v29 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
        LODWORD(v28) = [v29 isStoreAsset];

        if (v28)
        {
          [v24 setStoreFrontIdentifier:v18];
          v30 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
          v31 = [v30 storeID];
          [v24 setStoreIdentifier:v31];
        }
        v32 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
        v33 = [v32 readingDirection];

        if (v33)
        {
          v34 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
          v35 = [v34 readingDirection];
          [v24 setHasSpineOnRight:[v35 isEqualToString:@"rtl"]];
        }
      }
      else
      {
        if ((v20 & 0xFFFFFFFFFFFFFFFELL) != 2)
        {
          BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AEServices/Sharing/Private/AEAnnotationActivityItemProviderSource.m", 170, (uint64_t)"-[AEAnnotationActivityItemProviderSource _generateLinkMetadata]", (uint64_t)"NO", @"Trying to show link preview for unsupported asset type", v21, v22, v23, v48);
          goto LABEL_22;
        }
        id v24 = objc_alloc_init((Class)LPFileMetadata);
        v39 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
        v40 = [v39 title];
        [v24 setName:v40];

        v41 = BCAssetUTIForContentType(v20);
        [v24 setType:v41];

        v42 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
        v43 = [v42 bookURL];
        uint64_t v49 = 0;
        id v44 = [v43 bu_fileAllocatedSizeWithError:&v49];
        uint64_t v45 = v49;

        if (!v45 && v44) {
          [v24 setSize:v44];
        }
        [v24 setThumbnail:v6];
      }
      [v3 setSpecialization:v24];

LABEL_22:
      id v46 = v3;

      goto LABEL_29;
    }
  }
  id v46 = 0;
LABEL_29:

  return v46;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (AEAnnotationPaginationDataSource)paginationDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paginationDataSource);

  return (AEAnnotationPaginationDataSource *)WeakRetained;
}

- (void)setPaginationDataSource:(id)a3
{
}

- (BOOL)areCitationAllowed
{
  return self->_citationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->_citationsAllowed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_paginationDataSource);

  objc_storeStrong((id *)&self->_annotations, 0);
}

@end