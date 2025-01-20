@interface CollectionLinkMetadataProvider
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
@end

@implementation CollectionLinkMetadataProvider

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    v5 = (LPLinkMetadata *)objc_alloc_init((Class)LPLinkMetadata);
    v6 = [(CollectionActivityProvider *)self collectionInfo];
    v7 = [v6 sharingURL];
    [(LPLinkMetadata *)v5 setURL:v7];

    v8 = [(CollectionActivityProvider *)self collectionInfo];
    v9 = [v8 sharingURL];
    [(LPLinkMetadata *)v5 setOriginalURL:v9];

    v10 = [(CollectionActivityProvider *)self collectionInfo];
    v11 = [v10 title];
    [(LPLinkMetadata *)v5 setTitle:v11];

    id v12 = objc_alloc_init((Class)LPMapCollectionMetadata);
    v13 = [(CollectionActivityProvider *)self collectionInfo];
    v14 = [v13 title];
    [v12 setName:v14];

    v15 = [(CollectionActivityProvider *)self collectionInfo];
    v16 = [v15 image];

    if (v16)
    {
      id v17 = objc_alloc((Class)LPImage);
      v18 = [(CollectionActivityProvider *)self collectionInfo];
      v19 = [v18 image];
      v20 = UIImagePNGRepresentation(v19);
      id v21 = [v17 initWithData:v20 MIMEType:@"image/png"];
      [v12 setIcon:v21];
    }
    v22 = [(CollectionActivityProvider *)self mapItems];
    [v12 setNumberOfItems:[v22 count]];

    v23 = [(CollectionActivityProvider *)self mapItems];
    v24 = sub_100099700(v23, &stru_1012E5FD8);

    id v25 = [v24 copy];
    [v12 setAddresses:v25];

    v26 = [(CollectionActivityProvider *)self mapItems];
    v27 = annotatedSnapshotImageWithMapItems();
    [v12 setImage:v27];

    v28 = [(CollectionActivityProvider *)self mapItems];
    v29 = annotatedSnapshotImageWithMapItems();
    [v12 setDarkImage:v29];

    [(LPLinkMetadata *)v5 setSpecialization:v12];
    v30 = self->_cachedMetadata;
    self->_cachedMetadata = v5;

    cachedMetadata = self->_cachedMetadata;
  }

  return cachedMetadata;
}

- (void).cxx_destruct
{
}

@end