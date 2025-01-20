@interface NNNewsDaemonHeadlineHeadlineWrapper
- (NNNewsDaemonHeadlineHeadlineWrapper)initWithHeadline:(id)a3 assetFileURLsByRemoteURL:(id)a4;
- (NSData)publisherLogoData;
- (NSData)sync_publisherLogoImageData;
- (NSData)sync_thumbnailImageData;
- (NSData)thumbnailData;
- (NSString)sync_NewsURLString;
- (NSString)sync_excerpt;
- (NSString)sync_identifier;
- (NSString)sync_publisherIdentifier;
- (NSString)sync_publisherName;
- (NSString)sync_title;
- (NTHeadline)headline;
@end

@implementation NNNewsDaemonHeadlineHeadlineWrapper

- (NNNewsDaemonHeadlineHeadlineWrapper)initWithHeadline:(id)a3 assetFileURLsByRemoteURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)NNNewsDaemonHeadlineHeadlineWrapper;
  v9 = [(NNNewsDaemonHeadlineHeadlineWrapper *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_headline, a3);
    v11 = [v7 thumbnailRemoteURL];
    if (v11)
    {
      v12 = [v8 objectForKeyedSubscript:v11];
      v13 = v12;
      if (v12)
      {
        v14 = [v12 path];
        uint64_t v15 = +[NSData dataWithContentsOfFile:v14];
        thumbnailData = v10->_thumbnailData;
        v10->_thumbnailData = (NSData *)v15;
      }
    }
    v17 = [v7 sourceNameImageRemoteURL];
    if (v17)
    {
      v18 = [v8 objectForKeyedSubscript:v17];
      v19 = v18;
      if (v18)
      {
        v20 = [v18 path];
        uint64_t v21 = +[NSData dataWithContentsOfFile:v20];
        publisherLogoData = v10->_publisherLogoData;
        v10->_publisherLogoData = (NSData *)v21;
      }
    }
  }
  return v10;
}

- (NSString)sync_identifier
{
  v2 = [(NNNewsDaemonHeadlineHeadlineWrapper *)self headline];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)sync_title
{
  v3 = [(NNNewsDaemonHeadlineHeadlineWrapper *)self headline];
  v4 = [v3 titleCompact];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(NNNewsDaemonHeadlineHeadlineWrapper *)self headline];
    id v6 = [v7 title];
  }
  return (NSString *)v6;
}

- (NSString)sync_excerpt
{
  v2 = [(NNNewsDaemonHeadlineHeadlineWrapper *)self headline];
  v3 = [v2 shortExcerpt];

  return (NSString *)v3;
}

- (NSData)sync_thumbnailImageData
{
  return [(NNNewsDaemonHeadlineHeadlineWrapper *)self thumbnailData];
}

- (NSData)sync_publisherLogoImageData
{
  return [(NNNewsDaemonHeadlineHeadlineWrapper *)self publisherLogoData];
}

- (NSString)sync_publisherName
{
  v3 = [(NNNewsDaemonHeadlineHeadlineWrapper *)self headline];
  v4 = [v3 compactSourceName];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(NNNewsDaemonHeadlineHeadlineWrapper *)self headline];
    id v6 = [v7 sourceName];
  }
  return (NSString *)v6;
}

- (NSString)sync_publisherIdentifier
{
  v2 = [(NNNewsDaemonHeadlineHeadlineWrapper *)self headline];
  v3 = [v2 personalizationMetadata];
  v4 = [v3 publisherID];

  return (NSString *)v4;
}

- (NSString)sync_NewsURLString
{
  v2 = [(NNNewsDaemonHeadlineHeadlineWrapper *)self headline];
  v3 = [v2 NewsURL];
  v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (NTHeadline)headline
{
  return self->_headline;
}

- (NSData)thumbnailData
{
  return self->_thumbnailData;
}

- (NSData)publisherLogoData
{
  return self->_publisherLogoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherLogoData, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end