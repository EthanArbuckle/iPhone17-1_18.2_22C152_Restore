@interface UIActivityItemURLRep
- (BOOL)isFileURL;
- (NSURL)URL;
- (UIImage)thumbnail;
- (id)scheme;
- (int64_t)attachmentURLType;
- (void)setAttachmentURLType:(int64_t)a3;
- (void)setThumbnail:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation UIActivityItemURLRep

- (BOOL)isFileURL
{
  v2 = [(UIActivityItemURLRep *)self URL];
  char v3 = [v2 isFileURL];

  return v3;
}

- (id)scheme
{
  v2 = [(UIActivityItemURLRep *)self URL];
  char v3 = [v2 scheme];

  return v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (int64_t)attachmentURLType
{
  return self->_attachmentURLType;
}

- (void)setAttachmentURLType:(int64_t)a3
{
  self->_attachmentURLType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end