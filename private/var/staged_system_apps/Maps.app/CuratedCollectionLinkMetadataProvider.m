@interface CuratedCollectionLinkMetadataProvider
- (CollectionThumbnailGenerator)thumbnailGenerator;
- (CuratedCollectionLinkMetadataProvider)initWithCuratedCollection:(id)a3 refinedMapItems:(id)a4;
- (LPLinkMetadata)cachedMetadata;
- (id)_curatedCollectionSpecialization;
- (id)_publisherSpecialization;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (void)setCachedMetadata:(id)a3;
- (void)setThumbnailGenerator:(id)a3;
@end

@implementation CuratedCollectionLinkMetadataProvider

- (CuratedCollectionLinkMetadataProvider)initWithCuratedCollection:(id)a3 refinedMapItems:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionLinkMetadataProvider;
  v7 = [(CuratedCollectionActivityProvider *)&v11 initWithCuratedCollection:v6 refinedMapItems:a4];
  if (v7)
  {
    v8 = -[CollectionThumbnailGenerator initWithPlaceCollection:size:]([CollectionThumbnailGenerator alloc], "initWithPlaceCollection:size:", v6, 70.0, 70.0);
    thumbnailGenerator = v7->_thumbnailGenerator;
    v7->_thumbnailGenerator = v8;
  }
  return v7;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  v4 = [(CuratedCollectionLinkMetadataProvider *)self cachedMetadata];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)LPLinkMetadata);
    id v6 = [(CuratedCollectionActivityProvider *)self url];
    [v5 setURL:v6];

    v7 = [(CuratedCollectionActivityProvider *)self url];
    [v5 setOriginalURL:v7];

    v8 = [(CuratedCollectionActivityProvider *)self title];
    [v5 setTitle:v8];

    v9 = [(CuratedCollectionActivityProvider *)self curatedCollection];

    if (v9)
    {
      uint64_t v10 = [(CuratedCollectionLinkMetadataProvider *)self _curatedCollectionSpecialization];
    }
    else
    {
      objc_super v11 = [(CuratedCollectionActivityProvider *)self publisher];

      if (!v11)
      {
LABEL_7:
        [(CuratedCollectionLinkMetadataProvider *)self setCachedMetadata:v5];

        goto LABEL_8;
      }
      uint64_t v10 = [(CuratedCollectionLinkMetadataProvider *)self _publisherSpecialization];
    }
    v12 = (void *)v10;
    [v5 setSpecialization:v10];

    goto LABEL_7;
  }
LABEL_8:

  return [(CuratedCollectionLinkMetadataProvider *)self cachedMetadata];
}

- (id)_publisherSpecialization
{
  v3 = [(CuratedCollectionActivityProvider *)self publisher];
  v4 = [v3 publisherAttribution];

  id v5 = objc_alloc_init((Class)LPMapCollectionPublisherMetadata);
  id v6 = [v4 displayName];
  [v5 setName:v6];

  v7 = +[MKPlaceCollectionsPublisherIconManager sharedInstance];
  v8 = [v4 displayName];
  id v9 = [v4 iconIdentifier];
  uint64_t v10 = +[UIScreen mainScreen];
  [v10 scale];
  objc_super v11 = [v7 iconForPublisherNamed:v8 usingId:v9 usingContentScale:5 usingSizeGroup:0 isNightMode:];

  if (v11)
  {
    id v12 = [objc_alloc((Class)LPImage) initWithPlatformImage:v11];
    [v5 setIcon:v12];
  }
  v13 = [(CuratedCollectionActivityProvider *)self publisher];
  objc_msgSend(v5, "setNumberOfPublishedCollections:", objc_msgSend(v13, "totalCollectionCount"));

  return v5;
}

- (id)_curatedCollectionSpecialization
{
  id v3 = objc_alloc_init((Class)LPMapCollectionMetadata);
  v4 = [(CuratedCollectionActivityProvider *)self curatedCollection];
  id v5 = [v4 collectionTitle];
  [v3 setName:v5];

  id v6 = objc_alloc_init((Class)NSItemProvider);
  objc_initWeak(&location, self);
  v7 = [UTTypePNG identifier];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1007D1B2C;
  v42[3] = &unk_1012F91C0;
  objc_copyWeak(&v43, &location);
  v40 = v6;
  [v6 registerItemForTypeIdentifier:v7 loadHandler:v42];

  id v8 = objc_alloc((Class)LPImage);
  id v9 = [(CuratedCollectionLinkMetadataProvider *)self thumbnailGenerator];
  uint64_t v10 = [v9 placeholderImage];
  id v41 = [v8 initWithPlatformImage:v10];

  if (v41)
  {
    id v11 = [objc_alloc((Class)LPImage) initWithItemProvider:v40 properties:0 placeholderImage:v41];
    [v3 setIcon:v11];
  }
  id v12 = [(CuratedCollectionActivityProvider *)self curatedCollection];
  [v3 setNumberOfItems:[v12 numberOfItems]];

  v13 = [(CuratedCollectionActivityProvider *)self refinedMapItems];
  v14 = sub_100099700(v13, &stru_1012F91E0);

  id v15 = [v14 copy];
  [v3 setAddresses:v15];
  v39 = v14;

  v16 = [(CuratedCollectionActivityProvider *)self curatedCollection];
  v17 = [v16 photos];
  v18 = [v17 firstObject];

  v19 = +[UIScreen mainScreen];
  [v19 scale];
  double v21 = v20;
  v22 = +[GEOMapItemPhotoOptions defaultPhotoOptionsWithAllowSmaller:0];
  v23 = [v18 bestPhotoForFrameSize:v22 displayScale:kRichPreviewSnapshotSize[0] options:kRichPreviewSnapshotSize[1] v21];

  v24 = [(CuratedCollectionActivityProvider *)self curatedCollection];
  v25 = [v24 joeColorImage];
  id v26 = v23;
  v27 = imageWithPlaceholderAndLoadHandler();

  [v3 setImage:v27];
  [v3 setDarkImage:v27];
  v28 = [(CuratedCollectionActivityProvider *)self curatedCollection];
  v29 = [v28 publisher];
  v30 = [v29 publisherAttribution];

  v31 = [v30 displayName];
  [v3 setPublisherName:v31];

  v32 = +[MKPlaceCollectionsPublisherIconManager sharedInstance];
  v33 = [v30 displayName];
  id v34 = [v30 iconIdentifier];
  v35 = +[UIScreen mainScreen];
  [v35 scale];
  v36 = [v32 iconForPublisherNamed:v33 usingId:v34 usingContentScale:5 usingSizeGroup:0 isNightMode:];

  if (v36)
  {
    id v37 = [objc_alloc((Class)LPImage) initWithPlatformImage:v36, v39];
    [v3 setPublisherIcon:v37];
  }
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  return v3;
}

- (LPLinkMetadata)cachedMetadata
{
  return self->_cachedMetadata;
}

- (void)setCachedMetadata:(id)a3
{
}

- (CollectionThumbnailGenerator)thumbnailGenerator
{
  return self->_thumbnailGenerator;
}

- (void)setThumbnailGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);

  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

@end