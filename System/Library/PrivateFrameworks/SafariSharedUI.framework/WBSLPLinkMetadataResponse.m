@interface WBSLPLinkMetadataResponse
- (LPLinkMetadata)metadata;
- (WBSLPLinkMetadataResponse)initWithURL:(id)a3 metadata:(id)a4;
@end

@implementation WBSLPLinkMetadataResponse

- (WBSLPLinkMetadataResponse)initWithURL:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSLPLinkMetadataResponse;
  v7 = [(WBSSiteMetadataResponse *)&v12 initWithURL:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    metadata = v7->_metadata;
    v7->_metadata = (LPLinkMetadata *)v8;

    v10 = v7;
  }

  return v7;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
}

@end