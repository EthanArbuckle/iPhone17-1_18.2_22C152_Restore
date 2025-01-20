@interface LookAroundShareItemSource
- (GEOComposedRoute)route;
- (LookAroundShareItemSource)initWithMapItem:(id)a3 muninViewState:(id)a4;
- (MULookAroundLinkPresentationActivityProvider)linkPresentationProvider;
- (MULookAroundTextActivityProvider)textProvider;
- (MULookAroundURLActivityProvider)urlProvider;
- (NSArray)activityProviders;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)includedActivityTypes;
- (NSData)pushSubmissionData;
- (SearchResult)searchResult;
- (void)setActivityProviderDelegate:(id)a3;
- (void)setLinkPresentationProvider:(id)a3;
- (void)setTextProvider:(id)a3;
- (void)setUrlProvider:(id)a3;
@end

@implementation LookAroundShareItemSource

- (LookAroundShareItemSource)initWithMapItem:(id)a3 muninViewState:(id)a4
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LookAroundShareItemSource;
  v6 = [(LookAroundShareItemSource *)&v11 init];
  if (v6)
  {
    id v7 = [objc_alloc((Class)MULookAroundTextActivityProvider) initWithMapItem:v5];
    [(LookAroundShareItemSource *)v6 setTextProvider:v7];

    id v8 = [objc_alloc((Class)MULookAroundURLActivityProvider) initWithMapItem:v5];
    [(LookAroundShareItemSource *)v6 setUrlProvider:v8];

    id v9 = [objc_alloc((Class)MULookAroundLinkPresentationActivityProvider) initWithMapItem:v5];
    [(LookAroundShareItemSource *)v6 setLinkPresentationProvider:v9];
  }
  return v6;
}

- (NSArray)activityProviders
{
  v3 = [(LookAroundShareItemSource *)self textProvider];
  v4 = [(LookAroundShareItemSource *)self urlProvider];
  v8[1] = v4;
  id v5 = [(LookAroundShareItemSource *)self linkPresentationProvider];
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

- (void)setActivityProviderDelegate:(id)a3
{
  id v9 = a3;
  UIActivityType v4 = [(LookAroundShareItemSource *)self textProvider];
  id v5 = [v4 delegate];

  if (!v5)
  {
    v6 = [(LookAroundShareItemSource *)self textProvider];
    [v6 setDelegate:v9];

    id v7 = [(LookAroundShareItemSource *)self urlProvider];
    [v7 setDelegate:v9];

    id v8 = [(LookAroundShareItemSource *)self linkPresentationProvider];
    [v8 setDelegate:v9];
  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (MULookAroundTextActivityProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (MULookAroundURLActivityProvider)urlProvider
{
  return self->_urlProvider;
}

- (void)setUrlProvider:(id)a3
{
}

- (MULookAroundLinkPresentationActivityProvider)linkPresentationProvider
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