@interface CuratedCollectionActivityProvider
- (CuratedCollectionActivityProvider)initWithCuratedCollection:(id)a3 refinedMapItems:(id)a4;
- (CuratedCollectionActivityProvider)initWithPublisher:(id)a3;
- (GEOPlaceCollection)curatedCollection;
- (GEOPublisher)publisher;
- (NSArray)refinedMapItems;
- (NSString)title;
- (NSURL)url;
@end

@implementation CuratedCollectionActivityProvider

- (CuratedCollectionActivityProvider)initWithCuratedCollection:(id)a3 refinedMapItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CuratedCollectionActivityProvider;
  v9 = [(CuratedCollectionActivityProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curatedCollection, a3);
    v11 = (NSArray *)[v8 copy];
    refinedMapItems = v10->_refinedMapItems;
    v10->_refinedMapItems = v11;
  }
  return v10;
}

- (CuratedCollectionActivityProvider)initWithPublisher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionActivityProvider;
  v6 = [(CuratedCollectionActivityProvider *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_publisher, a3);
  }

  return v7;
}

- (NSString)title
{
  v3 = [(CuratedCollectionActivityProvider *)self curatedCollection];

  if (v3)
  {
    v4 = [(CuratedCollectionActivityProvider *)self curatedCollection];
    id v5 = [v4 collectionTitle];
  }
  else
  {
    id v5 = [(CuratedCollectionActivityProvider *)self publisher];

    if (!v5) {
      goto LABEL_6;
    }
    v4 = [(CuratedCollectionActivityProvider *)self publisher];
    v6 = [v4 publisherAttribution];
    id v5 = [v6 displayName];
  }
LABEL_6:

  return (NSString *)v5;
}

- (NSURL)url
{
  v3 = [(CuratedCollectionActivityProvider *)self curatedCollection];

  if (v3)
  {
    v4 = [(CuratedCollectionActivityProvider *)self curatedCollection];
    uint64_t v5 = [v4 collectionURL];
  }
  else
  {
    v6 = [(CuratedCollectionActivityProvider *)self publisher];

    if (!v6) {
      goto LABEL_6;
    }
    v4 = [(CuratedCollectionActivityProvider *)self publisher];
    uint64_t v5 = [v4 publisherURL];
  }
  v6 = (void *)v5;

LABEL_6:

  return (NSURL *)v6;
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (NSArray)refinedMapItems
{
  return self->_refinedMapItems;
}

- (GEOPublisher)publisher
{
  return self->_publisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_refinedMapItems, 0);

  objc_storeStrong((id *)&self->_curatedCollection, 0);
}

@end