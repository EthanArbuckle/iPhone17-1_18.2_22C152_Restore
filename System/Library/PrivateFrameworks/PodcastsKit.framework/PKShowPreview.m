@interface PKShowPreview
- (NSString)feedUrl;
- (NSString)storeId;
- (NSString)title;
- (NSString)uuid;
- (PKShowPreview)initWithTitle:(id)a3 storeId:(id)a4 feedUrl:(id)a5 uuid:(id)a6;
- (void)setFeedUrl:(id)a3;
- (void)setStoreId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PKShowPreview

- (PKShowPreview)initWithTitle:(id)a3 storeId:(id)a4 feedUrl:(id)a5 uuid:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKShowPreview;
  v14 = [(PKShowPreview *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(PKShowPreview *)v14 setTitle:v10];
    [(PKShowPreview *)v15 setStoreId:v11];
    [(PKShowPreview *)v15 setFeedUrl:v12];
    [(PKShowPreview *)v15 setUuid:v13];
  }

  return v15;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)storeId
{
  return self->_storeId;
}

- (void)setStoreId:(id)a3
{
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end