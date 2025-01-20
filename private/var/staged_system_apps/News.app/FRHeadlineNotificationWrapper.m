@interface FRHeadlineNotificationWrapper
- (FRHeadlineNotificationWrapper)initWithDictionary:(id)a3;
- (FRHeadlineNotificationWrapper)initWithHeadline:(id)a3;
- (NSString)headlineNotification_base64Image;
- (NSString)headlineNotification_base64PublisherImage;
- (NSString)headlineNotification_date;
- (NSString)headlineNotification_identifier;
- (NSString)headlineNotification_publisher;
- (NSString)headlineNotification_title;
- (id)headlineNotification_dictionaryRepresentation;
@end

@implementation FRHeadlineNotificationWrapper

- (FRHeadlineNotificationWrapper)initWithHeadline:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FRHeadlineNotificationWrapper;
  v5 = [(FRHeadlineNotificationWrapper *)&v44 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    headlineNotification_identifier = v5->_headlineNotification_identifier;
    v5->_headlineNotification_identifier = (NSString *)v6;

    uint64_t v8 = [v4 sourceName];
    headlineNotification_publisher = v5->_headlineNotification_publisher;
    v5->_headlineNotification_publisher = (NSString *)v8;

    uint64_t v10 = [v4 title];
    headlineNotification_title = v5->_headlineNotification_title;
    v5->_headlineNotification_title = (NSString *)v10;

    v12 = [v4 publishDate];
    uint64_t v13 = [v12 fr_gregorianShortDisplayString];
    headlineNotification_date = v5->_headlineNotification_date;
    v5->_headlineNotification_date = (NSString *)v13;

    v15 = FCThumbnailForHeadline();
    v16 = [v15 thumbnailAssetHandle];
    v17 = [v16 filePath];

    if (v17)
    {
      v18 = [v15 thumbnailAssetHandle];
      v19 = [v18 filePath];
      v20 = +[UIImage imageWithContentsOfFile:v19];

      v21 = [v20 fr_croppedImageWithAspectRatio:2.0];
      [v21 fr_scaledImageWithMaximumSize:100.0 targetScale:50.0];
      v22 = (UIImage *)objc_claimAutoreleasedReturnValue();

      v23 = UIImagePNGRepresentation(v22);
      id v24 = objc_alloc((Class)NSString);
      v25 = [v23 base64EncodedDataWithOptions:0];
      v26 = (NSString *)[v24 initWithData:v25 encoding:4];
      headlineNotification_base64Image = v5->_headlineNotification_base64Image;
      v5->_headlineNotification_base64Image = v26;
    }
    v28 = [v4 sourceChannel];
    v29 = [v28 theme];
    v30 = [v29 logoImageAssetHandle];
    v31 = [v30 filePath];

    if (v31)
    {
      v32 = [v4 sourceChannel];
      v33 = [v32 theme];
      v34 = [v33 logoImageAssetHandle];
      v35 = [v34 filePath];
      v36 = +[UIImage imageWithContentsOfFile:v35];

      [v36 fr_scaledImageWithMaximumSize:16.0 targetScale:2.0];
      v37 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v38 = UIImagePNGRepresentation(v37);
      id v39 = objc_alloc((Class)NSString);
      v40 = [v38 base64EncodedDataWithOptions:0];
      v41 = (NSString *)[v39 initWithData:v40 encoding:4];
      headlineNotification_base64PublisherImage = v5->_headlineNotification_base64PublisherImage;
      v5->_headlineNotification_base64PublisherImage = v41;
    }
  }

  return v5;
}

- (FRHeadlineNotificationWrapper)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FRHeadlineNotificationWrapper;
  v5 = [(FRHeadlineNotificationWrapper *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"identifier"];
    headlineNotification_identifier = v5->_headlineNotification_identifier;
    v5->_headlineNotification_identifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"date"];
    headlineNotification_date = v5->_headlineNotification_date;
    v5->_headlineNotification_date = (NSString *)v8;

    uint64_t v10 = [v4 objectForKey:@"publisher"];
    headlineNotification_publisher = v5->_headlineNotification_publisher;
    v5->_headlineNotification_publisher = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:@"title"];
    headlineNotification_title = v5->_headlineNotification_title;
    v5->_headlineNotification_title = (NSString *)v12;

    uint64_t v14 = [v4 objectForKey:@"b64image"];
    headlineNotification_base64Image = v5->_headlineNotification_base64Image;
    v5->_headlineNotification_base64Image = (NSString *)v14;

    uint64_t v16 = [v4 objectForKey:@"b64publisherImage"];
    headlineNotification_base64PublisherImage = v5->_headlineNotification_base64PublisherImage;
    v5->_headlineNotification_base64PublisherImage = (NSString *)v16;

    if (![(NSString *)v5->_headlineNotification_base64Image length])
    {
      v18 = v5->_headlineNotification_base64Image;
      v5->_headlineNotification_base64Image = 0;
    }
    if (![(NSString *)v5->_headlineNotification_base64PublisherImage length])
    {
      v19 = v5->_headlineNotification_base64PublisherImage;
      v5->_headlineNotification_base64PublisherImage = 0;
    }
  }

  return v5;
}

- (id)headlineNotification_dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FRHeadlineNotificationWrapper *)self headlineNotification_base64Image];
  [v3 fc_safelySetObject:v4 forKey:@"b64image"];

  v5 = [(FRHeadlineNotificationWrapper *)self headlineNotification_base64PublisherImage];
  [v3 fc_safelySetObject:v5 forKey:@"b64publisherImage"];

  uint64_t v6 = [(FRHeadlineNotificationWrapper *)self headlineNotification_identifier];
  [v3 fc_safelySetObject:v6 forKey:@"identifier"];

  v7 = [(FRHeadlineNotificationWrapper *)self headlineNotification_title];
  [v3 fc_safelySetObject:v7 forKey:@"title"];

  uint64_t v8 = [(FRHeadlineNotificationWrapper *)self headlineNotification_publisher];
  [v3 fc_safelySetObject:v8 forKey:@"publisher"];

  v9 = [(FRHeadlineNotificationWrapper *)self headlineNotification_date];
  [v3 fc_safelySetObject:v9 forKey:@"date"];

  id v10 = [v3 copy];

  return v10;
}

- (NSString)headlineNotification_identifier
{
  return self->_headlineNotification_identifier;
}

- (NSString)headlineNotification_title
{
  return self->_headlineNotification_title;
}

- (NSString)headlineNotification_date
{
  return self->_headlineNotification_date;
}

- (NSString)headlineNotification_base64Image
{
  return self->_headlineNotification_base64Image;
}

- (NSString)headlineNotification_publisher
{
  return self->_headlineNotification_publisher;
}

- (NSString)headlineNotification_base64PublisherImage
{
  return self->_headlineNotification_base64PublisherImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headlineNotification_base64PublisherImage, 0);
  objc_storeStrong((id *)&self->_headlineNotification_publisher, 0);
  objc_storeStrong((id *)&self->_headlineNotification_base64Image, 0);
  objc_storeStrong((id *)&self->_headlineNotification_date, 0);
  objc_storeStrong((id *)&self->_headlineNotification_title, 0);

  objc_storeStrong((id *)&self->_headlineNotification_identifier, 0);
}

@end