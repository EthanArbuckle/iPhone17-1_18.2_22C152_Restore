@interface PKSharingMessageExtensionOpenGraphMessage
- (BOOL)hasFetchedOpenGraphPreview;
- (BOOL)isFromMe;
- (BOOL)isPending;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (PKSharingMessageExtensionOpenGraphMessage)init;
- (PKSharingMessageExtensionOpenGraphMessage)initWithURL:(id)a3;
- (UIImage)thumbnail;
- (id)urlRepresentation;
- (void)setHasFetchedOpenGraphPreview:(BOOL)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsPending:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKSharingMessageExtensionOpenGraphMessage

- (PKSharingMessageExtensionOpenGraphMessage)init
{
  return [(PKSharingMessageExtensionOpenGraphMessage *)self initWithURL:0];
}

- (PKSharingMessageExtensionOpenGraphMessage)initWithURL:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKSharingMessageExtensionOpenGraphMessage;
  v6 = [(PKSharingMessageExtensionOpenGraphMessage *)&v45 init];
  v7 = v6;
  if (v6)
  {
    id v39 = v5;
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v7->_url resolvingAgainstBaseURL:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v38 = v8;
    v9 = [v8 queryItems];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (!v10) {
      goto LABEL_24;
    }
    uint64_t v11 = v10;
    uint64_t v40 = *(void *)v42;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v42 != v40) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
        v14 = [v13 name];
        v15 = v14;
        if (v14 == @"title") {
          goto LABEL_10;
        }
        if (!v14) {
          goto LABEL_18;
        }
        int v16 = [(__CFString *)v14 isEqualToString:@"title"];

        if (v16)
        {
LABEL_10:
          uint64_t v17 = [v13 value];
          title = v7->_title;
          v7->_title = (NSString *)v17;

          goto LABEL_18;
        }
        v19 = v9;
        v20 = v15;
        if (v20 == @"subtitle"
          || (v21 = v20,
              int v22 = [(__CFString *)v20 isEqualToString:@"subtitle"],
              v21,
              v22))
        {
          uint64_t v23 = [v13 value];
          subtitle = v7->_subtitle;
          v7->_subtitle = (NSString *)v23;

LABEL_17:
          v9 = v19;
          goto LABEL_18;
        }
        v25 = v21;
        if (v25 == @"image"
          || (v26 = v25,
              int v27 = [(__CFString *)v25 isEqualToString:@"image"],
              v26,
              v27))
        {
          id v28 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v29 = [v13 value];
          v30 = (void *)[v28 initWithBase64EncodedString:v29 options:0];

          uint64_t v31 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v30];
          thumbnail = v7->_thumbnail;
          v7->_thumbnail = (UIImage *)v31;

          goto LABEL_17;
        }
        v33 = v26;
        v9 = v19;
        if (v33 == @"fetched"
          || (v34 = v33,
              int v35 = [(__CFString *)v33 isEqualToString:@"fetched"],
              v34,
              v35))
        {
          v7->_hasFetchedOpenGraphPreview = 1;
        }
LABEL_18:

        ++v12;
      }
      while (v11 != v12);
      uint64_t v36 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
      uint64_t v11 = v36;
      if (!v36)
      {
LABEL_24:

        id v5 = v39;
        break;
      }
    }
  }

  return v7;
}

- (id)urlRepresentation
{
  if (self->_isPending)
  {
    v3 = self->_url;
  }
  else
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:self->_url resolvingAgainstBaseURL:0];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (self->_title)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"title" value:self->_title];
      [v5 addObject:v6];
    }
    if (self->_subtitle)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"subtitle" value:self->_subtitle];
      [v5 addObject:v7];
    }
    v8 = UIImagePNGRepresentation(self->_thumbnail);
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F290C8]);
      uint64_t v10 = [v8 base64EncodedStringWithOptions:0];
      uint64_t v11 = (void *)[v9 initWithName:@"image" value:v10];
      [v5 addObject:v11];
    }
    if (self->_hasFetchedOpenGraphPreview)
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"fetched" value:@"Yes"];
      [v5 addObject:v12];
    }
    [v4 setQueryItems:v5];
    v3 = [v4 URL];
  }

  return v3;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"url: '%@'; ", self->_url];
  [v6 appendFormat:@"title: '%@'; ", self->_title];
  [v6 appendFormat:@"subtitle: '%@'; ", self->_subtitle];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return (NSString *)v7;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)isPending
{
  return self->_isPending;
}

- (void)setIsPending:(BOOL)a3
{
  self->_isPending = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (BOOL)hasFetchedOpenGraphPreview
{
  return self->_hasFetchedOpenGraphPreview;
}

- (void)setHasFetchedOpenGraphPreview:(BOOL)a3
{
  self->_hasFetchedOpenGraphPreview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end