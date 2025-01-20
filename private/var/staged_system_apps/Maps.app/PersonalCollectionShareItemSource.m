@interface PersonalCollectionShareItemSource
- (CollectionLinkMetadataProvider)linkPresentationProvider;
- (CollectionTextActivityProvider)textProvider;
- (CollectionURLActivityProvider)urlProvider;
- (GEOComposedRoute)route;
- (NSArray)activityProviders;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)includedActivityTypes;
- (NSData)pushSubmissionData;
- (PersonalCollectionShareItemSource)initWithCollectionHandlerInfo:(id)a3;
- (SearchResult)searchResult;
- (void)setLinkPresentationProvider:(id)a3;
- (void)setTextProvider:(id)a3;
- (void)setUrlProvider:(id)a3;
@end

@implementation PersonalCollectionShareItemSource

- (PersonalCollectionShareItemSource)initWithCollectionHandlerInfo:(id)a3
{
  id v4 = a3;
  if ([v4 canShare])
  {
    v11.receiver = self;
    v11.super_class = (Class)PersonalCollectionShareItemSource;
    v5 = [(PersonalCollectionShareItemSource *)&v11 init];
    if (v5)
    {
      v6 = [(CollectionActivityProvider *)[CollectionTextActivityProvider alloc] initWithCollectionHandlerInfo:v4];
      [(PersonalCollectionShareItemSource *)v5 setTextProvider:v6];

      v7 = [(CollectionActivityProvider *)[CollectionURLActivityProvider alloc] initWithCollectionHandlerInfo:v4];
      [(PersonalCollectionShareItemSource *)v5 setUrlProvider:v7];

      v8 = [(CollectionActivityProvider *)[CollectionLinkMetadataProvider alloc] initWithCollectionHandlerInfo:v4];
      [(PersonalCollectionShareItemSource *)v5 setLinkPresentationProvider:v8];
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)activityProviders
{
  v3 = [(PersonalCollectionShareItemSource *)self textProvider];
  id v4 = [(PersonalCollectionShareItemSource *)self urlProvider];
  v8[1] = v4;
  v5 = [(PersonalCollectionShareItemSource *)self linkPresentationProvider];
  v8[2] = v5;
  v6 = +[NSArray arrayWithObjects:v8 count:3];

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

- (CollectionTextActivityProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (CollectionURLActivityProvider)urlProvider
{
  return self->_urlProvider;
}

- (void)setUrlProvider:(id)a3
{
}

- (CollectionLinkMetadataProvider)linkPresentationProvider
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