@interface NUANFLinkedContentProviderFactory
- (FCContentContext)contentContext;
- (NUANFLinkedContentProviderFactory)initWithContentContext:(id)a3;
- (id)createLinkedContentProviderForArticle:(id)a3;
@end

@implementation NUANFLinkedContentProviderFactory

- (id)createLinkedContentProviderForArticle:(id)a3
{
  v3 = [[NUANFLinkedContentProvider alloc] initWithContentContext:self->_contentContext];

  return v3;
}

- (NUANFLinkedContentProviderFactory)initWithContentContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUANFLinkedContentProviderFactory;
  v6 = [(NUANFLinkedContentProviderFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentContext, a3);
  }

  return v7;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void).cxx_destruct
{
}

@end