@interface NELinkMetadataSource
- (LPLinkMetadata)linkMetadata;
- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 image:(id)a5;
- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 imageProvider:(id)a5 iconProvider:(id)a6;
- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 imageProvider:(id)a5 iconProvider:(id)a6 selectedText:(id)a7;
- (id)_linkPresentationImageFromImage:(id)a3;
@end

@implementation NELinkMetadataSource

- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 image:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)NELinkMetadataSource;
  v11 = [(NELinkMetadataSource *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v13 = [(NELinkMetadataSource *)v11 _linkPresentationImageFromImage:v10];
    v14 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E4F30A78]);
    [(LPLinkMetadata *)v14 setTitle:v8];
    [(LPLinkMetadata *)v14 setOriginalURL:v9];
    [(LPLinkMetadata *)v14 setURL:v9];
    id v15 = objc_alloc_init(MEMORY[0x1E4F309E0]);
    [(LPLinkMetadata *)v14 setSpecialization:v15];

    if (v13)
    {
      [(LPLinkMetadata *)v14 setImage:v13];
      [(LPLinkMetadata *)v14 setIcon:v13];
    }
    linkMetadata = v12->_linkMetadata;
    v12->_linkMetadata = v14;
  }
  return v12;
}

- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 imageProvider:(id)a5 iconProvider:(id)a6
{
  return [(NELinkMetadataSource *)self initWithTitle:a3 url:a4 imageProvider:a5 iconProvider:a6 selectedText:0];
}

- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 imageProvider:(id)a5 iconProvider:(id)a6 selectedText:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)NELinkMetadataSource;
  v17 = [(NELinkMetadataSource *)&v22 init];
  if (v17)
  {
    objc_super v18 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E4F30A78]);
    [(LPLinkMetadata *)v18 setOriginalURL:v13];
    [(LPLinkMetadata *)v18 setURL:v13];
    [(LPLinkMetadata *)v18 setTitle:v12];
    id v19 = objc_alloc_init(MEMORY[0x1E4F309E0]);
    [(LPLinkMetadata *)v18 setSpecialization:v19];

    [(LPLinkMetadata *)v18 setSelectedText:v16];
    [(LPLinkMetadata *)v18 setImageProvider:v14];
    [(LPLinkMetadata *)v18 setIconProvider:v15];
    linkMetadata = v17->_linkMetadata;
    v17->_linkMetadata = v18;
  }
  return v17;
}

- (id)_linkPresentationImageFromImage:(id)a3
{
  v3 = (UIImage *)a3;
  if ([(UIImage *)v3 isSymbolImage])
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v3];
  }
  else if (v3)
  {
    v5 = UIImagePNGRepresentation(v3);
    if (v5) {
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v5 MIMEType:@"image/png"];
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void).cxx_destruct
{
}

@end