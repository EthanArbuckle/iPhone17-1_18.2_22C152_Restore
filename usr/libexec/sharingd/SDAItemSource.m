@interface SDAItemSource
- (NSAttributedString)attributedString;
- (NSData)data;
- (NSString)fakeBundleID;
- (NSString)name;
- (NSString)string;
- (NSString)subject;
- (NSString)uti;
- (NSURL)URL;
- (SDAItemSource)initWithAttributedString:(id)a3 previewImage:(id)a4 subject:(id)a5;
- (SDAItemSource)initWithData:(id)a3 type:(id)a4 previewImage:(id)a5 subject:(id)a6 name:(id)a7;
- (SDAItemSource)initWithString:(id)a3 previewImage:(id)a4 subject:(id)a5;
- (SDAItemSource)initWithURL:(id)a3 previewImage:(id)a4 subject:(id)a5;
- (UIImage)previewImage;
- (float)fakeDuration;
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (int64_t)fakeBytes;
- (void)setAttributedString:(id)a3;
- (void)setData:(id)a3;
- (void)setFakeBundleID:(id)a3;
- (void)setFakeBytes:(int64_t)a3;
- (void)setFakeDuration:(float)a3;
- (void)setName:(id)a3;
- (void)setPreviewImage:(id)a3;
- (void)setString:(id)a3;
- (void)setSubject:(id)a3;
- (void)setURL:(id)a3;
- (void)setUti:(id)a3;
@end

@implementation SDAItemSource

- (SDAItemSource)initWithData:(id)a3 type:(id)a4 previewImage:(id)a5 subject:(id)a6 name:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SDAItemSource;
  v18 = [(SDAItemSource *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a3);
    objc_storeStrong((id *)&v19->_name, a7);
    objc_storeStrong((id *)&v19->_previewImage, a5);
    v20 = (NSString *)[v16 copy];
    subject = v19->_subject;
    v19->_subject = v20;

    v22 = (NSString *)[v14 copy];
    uti = v19->_uti;
    v19->_uti = v22;
  }
  return v19;
}

- (SDAItemSource)initWithURL:(id)a3 previewImage:(id)a4 subject:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SDAItemSource;
  v12 = [(SDAItemSource *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewImage, a4);
    id v14 = (NSString *)[v11 copy];
    subject = v13->_subject;
    v13->_subject = v14;

    objc_storeStrong((id *)&v13->_URL, a3);
  }

  return v13;
}

- (SDAItemSource)initWithString:(id)a3 previewImage:(id)a4 subject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SDAItemSource;
  id v11 = [(SDAItemSource *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_previewImage, a4);
    id v13 = (NSString *)[v10 copy];
    subject = v12->_subject;
    v12->_subject = v13;

    id v15 = (NSString *)[v8 copy];
    string = v12->_string;
    v12->_string = v15;
  }
  return v12;
}

- (SDAItemSource)initWithAttributedString:(id)a3 previewImage:(id)a4 subject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SDAItemSource;
  id v11 = [(SDAItemSource *)&v17 init];
  if (v11)
  {
    v12 = (NSAttributedString *)[v8 copy];
    attributedString = v11->_attributedString;
    v11->_attributedString = v12;

    objc_storeStrong((id *)&v11->_previewImage, a4);
    id v14 = (NSString *)[v10 copy];
    subject = v11->_subject;
    v11->_subject = v14;
  }
  return v11;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  attributedString = self->_attributedString;
  if (attributedString
    || (attributedString = self->_data) != 0
    || (attributedString = self->_string) != 0
    || (attributedString = self->_URL) != 0)
  {
    v4 = attributedString;
  }
  else
  {
    v4 = &stru_1008E7020;
  }

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  attributedString = self->_attributedString;
  if (attributedString
    || (attributedString = self->_data) != 0
    || (attributedString = self->_string) != 0
    || (attributedString = self->_URL) != 0)
  {
    id v5 = attributedString;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  return self->_subject;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return self->_uti;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return self->_previewImage;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  URL = self->_URL;
  if (URL)
  {
    v6 = [(NSURL *)URL lastPathComponent];
  }
  else
  {
    v6 = self->_name;
  }

  return v6;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = objc_alloc_init(off_1009692A8());
  if (self->_previewImage)
  {
    id v5 = [objc_alloc(off_1009692B0()) initWithPlatformImage:self->_previewImage];
    [v4 setImage:v5];
  }
  if (self->_URL) {
    [v4 setOriginalURL:];
  }
  if (self->_name || self->_subject) {
    [v4 setTitle:];
  }

  return v4;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)fakeBundleID
{
  return self->_fakeBundleID;
}

- (void)setFakeBundleID:(id)a3
{
}

- (int64_t)fakeBytes
{
  return self->_fakeBytes;
}

- (void)setFakeBytes:(int64_t)a3
{
  self->_fakeBytes = a3;
}

- (float)fakeDuration
{
  return self->_fakeDuration;
}

- (void)setFakeDuration:(float)a3
{
  self->_fakeDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeBundleID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end