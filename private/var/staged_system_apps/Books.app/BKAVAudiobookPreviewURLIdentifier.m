@interface BKAVAudiobookPreviewURLIdentifier
+ (id)audiobookIdentifierWithPreviewURL:(id)a3 storeID:(id)a4 title:(id)a5 author:(id)a6 duration:(double)a7;
- (BKAVAudiobookPreviewURLIdentifier)initWithPreviewURL:(id)a3 storeID:(id)a4 title:(id)a5 author:(id)a6 duration:(double)a7;
- (BOOL)isEqualToIdentifier:(id)a3;
- (NSString)author;
- (NSString)storeID;
- (NSString)title;
- (NSURL)previewURL;
- (double)duration;
- (id)copy;
- (void)setAuthor:(id)a3;
- (void)setDuration:(double)a3;
- (void)setPreviewURL:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKAVAudiobookPreviewURLIdentifier

+ (id)audiobookIdentifierWithPreviewURL:(id)a3 storeID:(id)a4 title:(id)a5 author:(id)a6 duration:(double)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [objc_alloc((Class)a1) initWithPreviewURL:v15 storeID:v14 title:v13 author:v12 duration:a7];

  return v16;
}

- (BKAVAudiobookPreviewURLIdentifier)initWithPreviewURL:(id)a3 storeID:(id)a4 title:(id)a5 author:(id)a6 duration:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BKAVAudiobookPreviewURLIdentifier;
  v17 = [(BKAVAudiobookPreviewURLIdentifier *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_previewURL, a3);
    objc_storeStrong((id *)&v18->_storeID, a4);
    objc_storeStrong((id *)&v18->_title, a5);
    objc_storeStrong((id *)&v18->_author, a6);
    v18->_duration = a7;
  }

  return v18;
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(BKAVAudiobookPreviewURLIdentifier *)self previewURL];
    v6 = [v4 previewURL];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)copy
{
  v3 = objc_opt_new();
  id v4 = [(BKAVAudiobookPreviewURLIdentifier *)self previewURL];
  [v3 setPreviewURL:v4];

  return v3;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeID, 0);

  objc_storeStrong((id *)&self->_previewURL, 0);
}

@end