@interface _UIDICPreviewItem
- (NSString)previewItemContentType;
- (NSString)previewItemTitle;
- (NSURL)URLToDeleteOnDealloc;
- (NSURL)previewItemURL;
- (NSURL)previewItemURLForDisplay;
- (NSURL)previewItemURLOverride;
- (id)_primitive_previewItemContentType;
- (void)dealloc;
- (void)setPreviewItemContentType:(id)a3;
- (void)setPreviewItemTitle:(id)a3;
- (void)setPreviewItemURL:(id)a3;
- (void)setPreviewItemURLForDisplay:(id)a3;
- (void)setPreviewItemURLOverride:(id)a3;
- (void)setURLToDeleteOnDealloc:(id)a3;
@end

@implementation _UIDICPreviewItem

- (void)dealloc
{
  if (self->_URLToDeleteOnDealloc)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    URLToDeleteOnDealloc = self->_URLToDeleteOnDealloc;
    id v9 = 0;
    char v5 = [v3 removeItemAtURL:URLToDeleteOnDealloc error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0 && v6)
    {
      v7 = [v6 localizedDescription];
      NSLog(&cfstr_UnableToRemove.isa, v7);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIDICPreviewItem;
  [(_UIDICPreviewItem *)&v8 dealloc];
}

- (void)setPreviewItemContentType:(id)a3
{
  if (self->_previewItemContentType != a3)
  {
    v4 = (NSString *)[a3 copy];
    previewItemContentType = self->_previewItemContentType;
    self->_previewItemContentType = v4;
    MEMORY[0x1F41817F8](v4, previewItemContentType);
  }
}

- (NSString)previewItemContentType
{
  id v3 = (void *)[(NSString *)self->_previewItemContentType copy];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(_UIDICPreviewItem *)self previewItemURL];
    _UIQLPreviewUTIForURLAndMimeType(v6, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (id)_primitive_previewItemContentType
{
  return self->_previewItemContentType;
}

- (NSURL)previewItemURLForDisplay
{
  id v3 = [(_UIDICPreviewItem *)self previewItemURLOverride];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_UIDICPreviewItem *)self previewItemURL];
  }
  id v6 = v5;

  return (NSURL *)v6;
}

- (NSURL)previewItemURL
{
  return self->_URL;
}

- (void)setPreviewItemURL:(id)a3
{
}

- (NSURL)previewItemURLOverride
{
  return self->_previewURLOverride;
}

- (void)setPreviewItemURLOverride:(id)a3
{
}

- (NSString)previewItemTitle
{
  return self->_name;
}

- (void)setPreviewItemTitle:(id)a3
{
}

- (NSURL)URLToDeleteOnDealloc
{
  return self->_URLToDeleteOnDealloc;
}

- (void)setURLToDeleteOnDealloc:(id)a3
{
}

- (void)setPreviewItemURLForDisplay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItemURLForDisplay, 0);
  objc_storeStrong((id *)&self->_URLToDeleteOnDealloc, 0);
  objc_storeStrong((id *)&self->_previewItemContentType, 0);
  objc_storeStrong((id *)&self->_URLsToDeleteOnDealloc, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_previewURLOverride, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end