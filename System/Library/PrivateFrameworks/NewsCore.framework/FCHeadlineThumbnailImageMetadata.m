@interface FCHeadlineThumbnailImageMetadata
- (FCHeadlineThumbnail)thumbnail;
- (FCHeadlineThumbnailImageMetadata)initWithURL:(id)a3 size:(unint64_t)a4 assetHandle:(id)a5;
- (NSURL)url;
- (unint64_t)sizeBuffer;
- (void)setSizeBuffer:(unint64_t)a3;
@end

@implementation FCHeadlineThumbnailImageMetadata

- (FCHeadlineThumbnailImageMetadata)initWithURL:(id)a3 size:(unint64_t)a4 assetHandle:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FCHeadlineThumbnailImageMetadata;
  v11 = [(FCHeadlineThumbnailImageMetadata *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    v12->_sizeBuffer = a4;
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (a4)
    {
      double v13 = (double)((a4 >> 8) & 0xFFFFFFF);
      double v14 = (double)(a4 >> 36);
    }
    else
    {
      double v14 = *MEMORY[0x1E4F1DB30];
    }
    uint64_t v15 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v10, v14, v13, (double)(a4 >> 36), *MEMORY[0x1E4F1DB30]);
    thumbnail = v12->_thumbnail;
    v12->_thumbnail = (FCHeadlineThumbnail *)v15;
  }
  return v12;
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)sizeBuffer
{
  return self->_sizeBuffer;
}

- (void)setSizeBuffer:(unint64_t)a3
{
  self->_sizeBuffer = a3;
}

- (FCHeadlineThumbnail)thumbnail
{
  return self->_thumbnail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end