@interface ICLinkPresentationMetadata
- (ICLinkPresentationMetadata)initWithTitle:(id)a3 image:(id)a4;
- (ICLinkPresentationMetadata)initWithTitle:(id)a3 imageName:(id)a4;
- (LPLinkMetadata)linkMetadata;
- (void)setLinkMetadata:(id)a3;
@end

@implementation ICLinkPresentationMetadata

- (ICLinkPresentationMetadata)initWithTitle:(id)a3 imageName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICLinkPresentationMetadata;
  v8 = [(ICLinkPresentationMetadata *)&v15 init];
  if (v8)
  {
    id v9 = objc_alloc_init((Class)sub_1000A6178());
    id v10 = objc_alloc_init((Class)LPImageProperties);
    [v10 setType:5];
    id v11 = objc_alloc((Class)LPImage);
    v12 = +[UIImage imageNamed:v7];
    id v13 = [v11 initWithPlatformImage:v12 properties:v10];

    [v9 setImage:v13];
    [v9 setTitle:v6];
    [(ICLinkPresentationMetadata *)v8 setLinkMetadata:v9];
  }
  return v8;
}

- (ICLinkPresentationMetadata)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICLinkPresentationMetadata;
  v8 = [(ICLinkPresentationMetadata *)&v16 init];
  if (v8)
  {
    id v9 = objc_alloc_init((Class)sub_1000A6178());
    id v10 = objc_alloc_init((Class)LPImageProperties);
    [v10 setType:5];
    id v11 = objc_alloc((Class)LPImage);
    v12 = [v7 ic_PNGData];
    id v13 = [UTTypePNG preferredMIMEType];
    id v14 = [v11 initWithData:v12 MIMEType:v13 properties:v10];

    [v9 setImage:v14];
    [v9 setTitle:v6];
    [(ICLinkPresentationMetadata *)v8 setLinkMetadata:v9];
  }
  return v8;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end