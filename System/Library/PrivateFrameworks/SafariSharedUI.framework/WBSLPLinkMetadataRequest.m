@interface WBSLPLinkMetadataRequest
- (BOOL)allowFetching;
- (WBSLPLinkMetadataRequest)initWithURL:(id)a3;
- (WBSLPLinkMetadataRequest)initWithURL:(id)a3 allowFetching:(BOOL)a4;
@end

@implementation WBSLPLinkMetadataRequest

- (WBSLPLinkMetadataRequest)initWithURL:(id)a3 allowFetching:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WBSLPLinkMetadataRequest;
  v5 = [(WBSSiteMetadataRequest *)&v9 initWithURL:a3 extraInfo:0];
  v6 = v5;
  if (v5)
  {
    v5->_allowFetching = a4;
    v7 = v5;
  }

  return v6;
}

- (WBSLPLinkMetadataRequest)initWithURL:(id)a3
{
  return [(WBSLPLinkMetadataRequest *)self initWithURL:a3 allowFetching:1];
}

- (BOOL)allowFetching
{
  return self->_allowFetching;
}

@end