@interface NETagLinkPresentationSource
- (LPLinkMetadata)linkMetadata;
- (NELinkMetadataSource)linkMetadataSource;
- (NETagLinkPresentationSource)initWithTag:(id)a3 image:(id)a4;
- (NETagLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 image:(id)a5;
@end

@implementation NETagLinkPresentationSource

- (NETagLinkPresentationSource)initWithTag:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NETagLinkPresentationSource;
  v8 = [(NETagLinkPresentationSource *)&v17 init];
  if (v8)
  {
    v9 = [NELinkMetadataSource alloc];
    v10 = [v6 name];
    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [v6 identifier];
    v13 = objc_msgSend(v11, "nss_NewsURLForTagID:", v12);
    uint64_t v14 = [(NELinkMetadataSource *)v9 initWithTitle:v10 url:v13 image:v7];
    linkMetadataSource = v8->_linkMetadataSource;
    v8->_linkMetadataSource = (NELinkMetadataSource *)v14;
  }
  return v8;
}

- (NETagLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 image:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NETagLinkPresentationSource;
  v11 = [(NETagLinkPresentationSource *)&v15 init];
  if (v11)
  {
    v12 = [[NELinkMetadataSource alloc] initWithTitle:v8 url:v9 image:v10];
    linkMetadataSource = v11->_linkMetadataSource;
    v11->_linkMetadataSource = v12;
  }
  return v11;
}

- (LPLinkMetadata)linkMetadata
{
  v2 = [(NETagLinkPresentationSource *)self linkMetadataSource];
  v3 = [v2 linkMetadata];

  return (LPLinkMetadata *)v3;
}

- (NELinkMetadataSource)linkMetadataSource
{
  return self->_linkMetadataSource;
}

- (void).cxx_destruct
{
}

@end