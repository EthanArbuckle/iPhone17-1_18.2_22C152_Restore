@interface VUIActionARQLPreview
- (NSString)previewURLString;
- (NSString)shareURLString;
- (VUIActionARQLPreview)initWithContextData:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setPreviewURLString:(id)a3;
- (void)setShareURLString:(id)a3;
@end

@implementation VUIActionARQLPreview

- (VUIActionARQLPreview)initWithContextData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIActionARQLPreview;
  v5 = [(VUIActionARQLPreview *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vui_stringForKey:", @"previewURL");
    previewURLString = v5->_previewURLString;
    v5->_previewURLString = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "vui_stringForKey:", @"shareURL");
    shareURLString = v5->_shareURLString;
    v5->_shareURLString = (NSString *)v8;
  }
  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", self->_previewURLString, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:self->_shareURLString];
    uint64_t v6 = +[VUIARQLPreviewManager sharedInstance];
    [v6 previewWithURL:v7 shareURL:v5];
  }
}

- (NSString)previewURLString
{
  return self->_previewURLString;
}

- (void)setPreviewURLString:(id)a3
{
}

- (NSString)shareURLString
{
  return self->_shareURLString;
}

- (void)setShareURLString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLString, 0);
  objc_storeStrong((id *)&self->_previewURLString, 0);
}

@end