@interface NEChannelLinkPresentationSource
- (LPLinkMetadata)linkMetadata;
- (NEChannelLinkPresentationSource)initWithChannel:(id)a3;
- (NSString)title;
- (NSURL)url;
@end

@implementation NEChannelLinkPresentationSource

- (NEChannelLinkPresentationSource)initWithChannel:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEChannelLinkPresentationSource;
  v5 = [(NEChannelLinkPresentationSource *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [v4 identifier];
    uint64_t v10 = objc_msgSend(v8, "nss_NewsURLForTagID:", v9);
    url = v5->_url;
    v5->_url = (NSURL *)v10;
  }
  return v5;
}

- (LPLinkMetadata)linkMetadata
{
  v3 = [NELinkMetadataSource alloc];
  id v4 = [(NEChannelLinkPresentationSource *)self title];
  v5 = [(NEChannelLinkPresentationSource *)self url];
  uint64_t v6 = [(NELinkMetadataSource *)v3 initWithTitle:v4 url:v5 image:0];

  v7 = [(NELinkMetadataSource *)v6 linkMetadata];

  return (LPLinkMetadata *)v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end