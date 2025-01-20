@interface CRLSEImportableItem
- (BOOL)isHTTP;
- (BOOL)isPDF;
- (NSAttributedString)attributedText;
- (NSURL)url;
- (UIImage)image;
- (UTType)mediaUTI;
- (void)setAttributedText:(id)a3;
- (void)setImage:(id)a3;
- (void)setMediaUTI:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CRLSEImportableItem

- (BOOL)isPDF
{
  if (self->_url) {
    return [(UTType *)self->_mediaUTI conformsToType:UTTypePDF];
  }
  else {
    return 0;
  }
}

- (BOOL)isHTTP
{
  url = self->_url;
  if (!url) {
    return 0;
  }
  v4 = [(NSURL *)url scheme];
  if ([v4 caseInsensitiveCompare:@"http"])
  {
    v5 = [(NSURL *)self->_url scheme];
    BOOL v6 = [v5 caseInsensitiveCompare:@"https"] == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)setUrl:(id)a3
{
  v5 = (NSURL *)a3;
  if (self->_url != v5)
  {
    objc_storeStrong((id *)&self->_url, a3);
    NSURLResourceKey v11 = NSURLContentTypeKey;
    BOOL v6 = +[NSArray arrayWithObjects:&v11 count:1];
    v7 = [(NSURL *)self->_url resourceValuesForKeys:v6 error:0];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 objectForKeyedSubscript:NSURLContentTypeKey];
      mediaUTI = self->_mediaUTI;
      self->_mediaUTI = v9;
    }
  }
}

- (UTType)mediaUTI
{
  return self->_mediaUTI;
}

- (void)setMediaUTI:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_mediaUTI, 0);
}

@end