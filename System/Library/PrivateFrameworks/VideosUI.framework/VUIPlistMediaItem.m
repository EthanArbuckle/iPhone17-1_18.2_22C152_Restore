@interface VUIPlistMediaItem
- (VUIPlistMediaDatabaseItem)databaseItem;
- (VUIPlistMediaItem)initWithMediaLibrary:(id)a3 databaseItem:(id)a4 requestedProperties:(id)a5;
- (VUIPlistMediaItem)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6;
- (id)_valueForPropertyDescriptor:(id)a3;
- (id)assetType;
- (id)coverArtImageIdentifier;
- (id)imageLoadParamsWithImageType:(unint64_t)a3;
- (id)isLocal;
- (id)playedState;
- (id)previewFrameImageIdentifier;
- (id)seasonIdentifier;
- (id)seasonNumber;
- (id)seasonTitle;
- (id)showIdentifier;
- (id)showTitle;
- (void)setDatabaseItem:(id)a3;
@end

@implementation VUIPlistMediaItem

- (VUIPlistMediaItem)initWithMediaLibrary:(id)a3 databaseItem:(id)a4 requestedProperties:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [VUIPlistMediaEntityIdentifier alloc];
  v13 = [v9 identifier];
  v14 = -[VUIPlistMediaEntityIdentifier initWithIdentifier:type:](v12, "initWithIdentifier:type:", v13, [v9 type]);

  v15 = VUIPlistMediaItemKind();
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaItem;
  v16 = [(VUIMediaEntity *)&v18 initWithMediaLibrary:v11 identifier:v14 requestedProperties:v10 kind:v15];

  if (v16) {
    objc_storeStrong((id *)&v16->_databaseItem, a4);
  }

  return v16;
}

- (VUIPlistMediaItem)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  id v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The %@ initializer is not available.", v9 format];

  return 0;
}

- (id)coverArtImageIdentifier
{
  v2 = [(VUIPlistMediaItem *)self databaseItem];
  v3 = [v2 coverArtURL];
  v4 = [v3 absoluteString];

  return v4;
}

- (id)playedState
{
  return &unk_1F3F3D2E0;
}

- (id)showIdentifier
{
  v2 = [(VUIPlistMediaItem *)self databaseItem];
  v3 = [v2 season];
  v4 = [v3 show];
  v5 = [v4 identifier];

  v6 = [[VUIPlistMediaEntityIdentifier alloc] initWithIdentifier:v5 type:4];
  return v6;
}

- (id)showTitle
{
  v2 = [(VUIPlistMediaItem *)self databaseItem];
  v3 = [v2 season];
  v4 = [v3 show];
  v5 = [v4 title];

  return v5;
}

- (id)seasonNumber
{
  v2 = [(VUIPlistMediaItem *)self databaseItem];
  v3 = [v2 season];
  v4 = [v3 seasonNumber];

  return v4;
}

- (id)isLocal
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  v3 = [(VUIPlistMediaItem *)self databaseItem];
  v4 = [v3 downloadState];
  v5 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "isEqualToString:", VUIPlistDatabaseItemDownloadStateDownloaded));

  return v5;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  v4 = [a3 sourcePropertyNames];
  v5 = [v4 allObjects];

  if ([v5 count] == 1)
  {
    v6 = [v5 firstObject];
    v7 = [(VUIPlistMediaItem *)self databaseItem];
    NSSelectorFromString(v6);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v7 valueForKey:v6];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)previewFrameImageIdentifier
{
  v2 = [(VUIPlistMediaItem *)self databaseItem];
  v3 = [v2 previewFrameURL];
  v4 = [v3 absoluteString];

  return v4;
}

- (id)seasonIdentifier
{
  v2 = [(VUIPlistMediaItem *)self databaseItem];
  v3 = [v2 season];
  v4 = [v3 identifier];

  v5 = [[VUIPlistMediaEntityIdentifier alloc] initWithIdentifier:v4 type:5];
  return v5;
}

- (id)seasonTitle
{
  v2 = [(VUIPlistMediaItem *)self databaseItem];
  v3 = [v2 season];
  v4 = [v3 title];

  return v4;
}

- (id)assetType
{
  v2 = [(VUIPlistMediaItem *)self databaseItem];
  v3 = [v2 downloadState];
  int v4 = [v3 isEqualToString:VUIPlistDatabaseItemDownloadStateDownloaded];

  if (v4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v6 numberWithUnsignedInteger:v5];
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v8 = [(VUIPlistMediaItem *)self databaseItem];
    v6 = [v8 previewFrameURL];

    uint64_t v7 = [(VUIPlistMediaItem *)self previewFrameImageIdentifier];
  }
  else
  {
    if (a3)
    {
      id v9 = 0;
      v6 = 0;
      id v10 = 0;
      goto LABEL_9;
    }
    uint64_t v5 = [(VUIPlistMediaItem *)self databaseItem];
    v6 = [v5 coverArtURL];

    uint64_t v7 = [(VUIPlistMediaItem *)self coverArtImageIdentifier];
  }
  id v9 = (void *)v7;
  id v10 = 0;
  if (v6 && v7) {
    id v10 = [[VUIPlistMediaEntityImageLoadParams alloc] initWithImageURL:v6 baseImageIdentifier:v7 imageType:a3];
  }
LABEL_9:

  return v10;
}

- (VUIPlistMediaDatabaseItem)databaseItem
{
  return self->_databaseItem;
}

- (void)setDatabaseItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end