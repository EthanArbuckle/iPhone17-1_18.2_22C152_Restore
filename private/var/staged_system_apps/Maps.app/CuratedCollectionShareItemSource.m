@interface CuratedCollectionShareItemSource
- (CuratedCollectionLinkMetadataProvider)linkPresentationProvider;
- (CuratedCollectionShareItemSource)initWithPlaceCollection:(id)a3 refinedMapItems:(id)a4;
- (CuratedCollectionShareItemSource)initWithPublisher:(id)a3;
- (CuratedCollectionTextActivityProvider)textProvider;
- (CuratedCollectionURLActivityProvider)urlProvider;
- (GEOComposedRoute)route;
- (NSArray)activityProviders;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)includedActivityTypes;
- (NSData)pushSubmissionData;
- (SearchResult)searchResult;
- (void)setLinkPresentationProvider:(id)a3;
- (void)setTextProvider:(id)a3;
- (void)setUrlProvider:(id)a3;
@end

@implementation CuratedCollectionShareItemSource

- (CuratedCollectionShareItemSource)initWithPlaceCollection:(id)a3 refinedMapItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CuratedCollectionShareItemSource;
  v8 = [(CuratedCollectionShareItemSource *)&v13 init];
  if (v8)
  {
    v9 = [(CuratedCollectionActivityProvider *)[CuratedCollectionTextActivityProvider alloc] initWithCuratedCollection:v6 refinedMapItems:v7];
    [(CuratedCollectionShareItemSource *)v8 setTextProvider:v9];

    v10 = [(CuratedCollectionActivityProvider *)[CuratedCollectionURLActivityProvider alloc] initWithCuratedCollection:v6 refinedMapItems:v7];
    [(CuratedCollectionShareItemSource *)v8 setUrlProvider:v10];

    v11 = [[CuratedCollectionLinkMetadataProvider alloc] initWithCuratedCollection:v6 refinedMapItems:v7];
    [(CuratedCollectionShareItemSource *)v8 setLinkPresentationProvider:v11];
  }
  return v8;
}

- (CuratedCollectionShareItemSource)initWithPublisher:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionShareItemSource;
  v5 = [(CuratedCollectionShareItemSource *)&v10 init];
  if (v5)
  {
    id v6 = [(CuratedCollectionActivityProvider *)[CuratedCollectionTextActivityProvider alloc] initWithPublisher:v4];
    [(CuratedCollectionShareItemSource *)v5 setTextProvider:v6];

    id v7 = [(CuratedCollectionActivityProvider *)[CuratedCollectionURLActivityProvider alloc] initWithPublisher:v4];
    [(CuratedCollectionShareItemSource *)v5 setUrlProvider:v7];

    v8 = [(CuratedCollectionActivityProvider *)[CuratedCollectionLinkMetadataProvider alloc] initWithPublisher:v4];
    [(CuratedCollectionShareItemSource *)v5 setLinkPresentationProvider:v8];
  }
  return v5;
}

- (NSArray)activityProviders
{
  v3 = [(CuratedCollectionShareItemSource *)self textProvider];
  id v4 = [(CuratedCollectionShareItemSource *)self urlProvider];
  v8[1] = v4;
  v5 = [(CuratedCollectionShareItemSource *)self linkPresentationProvider];
  v8[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:3];

  return (NSArray *)v6;
}

- (NSData)pushSubmissionData
{
  return 0;
}

- (NSArray)applicationActivities
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)excludedActivityTypes
{
  UIActivityType v4 = UIActivityTypeAddToReadingList;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)includedActivityTypes
{
  return 0;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (CuratedCollectionTextActivityProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (CuratedCollectionURLActivityProvider)urlProvider
{
  return self->_urlProvider;
}

- (void)setUrlProvider:(id)a3
{
}

- (CuratedCollectionLinkMetadataProvider)linkPresentationProvider
{
  return self->_linkPresentationProvider;
}

- (void)setLinkPresentationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationProvider, 0);
  objc_storeStrong((id *)&self->_urlProvider, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end