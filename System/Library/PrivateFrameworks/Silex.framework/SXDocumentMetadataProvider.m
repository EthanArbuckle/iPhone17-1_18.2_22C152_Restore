@interface SXDocumentMetadataProvider
- (NSString)language;
- (NSString)title;
- (SXDocumentMetadataProvider)initWithDocumentProvider:(id)a3;
- (SXDocumentProviding)documentProvider;
- (SXMetadata)metadata;
@end

@implementation SXDocumentMetadataProvider

- (SXDocumentMetadataProvider)initWithDocumentProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDocumentMetadataProvider;
  v6 = [(SXDocumentMetadataProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_documentProvider, a3);
  }

  return v7;
}

- (SXMetadata)metadata
{
  v2 = [(SXDocumentMetadataProvider *)self documentProvider];
  v3 = [v2 document];
  v4 = [v3 metadata];

  return (SXMetadata *)v4;
}

- (NSString)title
{
  v2 = [(SXDocumentMetadataProvider *)self documentProvider];
  v3 = [v2 document];
  v4 = [v3 title];

  return (NSString *)v4;
}

- (NSString)language
{
  v2 = [(SXDocumentMetadataProvider *)self documentProvider];
  v3 = [v2 document];
  v4 = [v3 language];

  return (NSString *)v4;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (void).cxx_destruct
{
}

@end