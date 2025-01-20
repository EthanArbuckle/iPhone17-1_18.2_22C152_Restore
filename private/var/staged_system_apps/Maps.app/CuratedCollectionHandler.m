@interface CuratedCollectionHandler
+ (id)_delimiterString;
- (BOOL)canDelete;
- (BOOL)canShare;
- (BOOL)containsItem:(id)a3;
- (CuratedCollectionHandler)initWithCollection:(id)a3;
- (MKMapItemIdentifier)curatedCollectionIdentifier;
- (MSCachedCuratedCollection)curatedCollection;
- (UIImage)publisherImage;
- (id)badgeImage;
- (id)identifier;
- (id)publisherAttribution;
- (id)sharingURL;
- (id)subtitle;
- (id)title;
- (int64_t)handlerType;
- (void)deleteCollection:(id)a3;
- (void)retrieveGeoCollectionWithRefinedItems:(id)a3;
- (void)setCollection:(id)a3;
- (void)setCuratedCollection:(id)a3;
- (void)setPublisherImage:(id)a3;
- (void)updateWithMapsSyncCachedCuratedCollection:(id)a3;
@end

@implementation CuratedCollectionHandler

- (CuratedCollectionHandler)initWithCollection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CuratedCollectionHandler;
  v5 = [(CollectionHandler *)&v8 initWithCollection:v4];
  v6 = v5;
  if (v5) {
    [(CuratedCollectionHandler *)v5 setCuratedCollection:v4];
  }

  return v6;
}

- (void)updateWithMapsSyncCachedCuratedCollection:(id)a3
{
  id v6 = a3;
  id v4 = [(CollectionHandler *)self collection];
  unsigned __int8 v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0) {
    [(CuratedCollectionHandler *)self setCollection:v6];
  }
}

- (int64_t)handlerType
{
  return 4;
}

- (void)setCollection:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionHandler;
  id v4 = a3;
  [(CollectionHandler *)&v5 setCollection:v4];
  -[CuratedCollectionHandler setCuratedCollection:](self, "setCuratedCollection:", v4, v5.receiver, v5.super_class);
}

- (void)setCuratedCollection:(id)a3
{
  objc_super v5 = (MSCachedCuratedCollection *)a3;
  if (self->_curatedCollection != v5)
  {
    objc_storeStrong((id *)&self->_curatedCollection, a3);
    [(CollectionHandler *)self loadImage];
    objc_initWeak(&location, self);
    id v6 = +[MapsUIImageCache sharedCache];
    v7 = [(CuratedCollectionHandler *)self publisherAttribution];
    id v8 = [v7 iconIdentifier];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100AB3260;
    v9[3] = &unk_1012E7298;
    objc_copyWeak(&v10, &location);
    [v6 getImageForPublisherWithIconIdentifier:v8 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (MKMapItemIdentifier)curatedCollectionIdentifier
{
  id v3 = objc_alloc((Class)MKMapItemIdentifier);
  id v4 = [(CuratedCollectionHandler *)self curatedCollection];
  id v5 = [v4 curatedCollectionIdentifier];
  id v6 = [(CuratedCollectionHandler *)self curatedCollection];
  id v7 = [v6 resultProviderIdentifier];
  id v8 = [v3 initWithMUID:v5 resultProviderID:v7 coordinate:MKCoordinateInvalid[0], MKCoordinateInvalid[1]];

  return (MKMapItemIdentifier *)v8;
}

- (id)identifier
{
  v2 = [(CollectionHandler *)self collection];
  id v3 = [v2 identifier];
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)title
{
  v2 = [(CollectionHandler *)self collection];
  id v3 = [v2 title];

  return v3;
}

- (id)subtitle
{
  id v3 = [(CuratedCollectionHandler *)self publisherAttribution];
  id v4 = [v3 displayName];

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Number of places [Curated Collection]" value:@"localized string not found" table:0];
  id v7 = [(CuratedCollectionHandler *)self curatedCollection];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, [v7 placesCount]);

  if (v4)
  {
    v13[0] = v4;
    v13[1] = v8;
    v9 = +[NSArray arrayWithObjects:v13 count:2];
    id v10 = [(id)objc_opt_class() _delimiterString];
    id v11 = [v9 componentsJoinedByString:v10];
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (id)badgeImage
{
  return [(CuratedCollectionHandler *)self publisherImage];
}

- (BOOL)containsItem:(id)a3
{
  return 0;
}

- (id)publisherAttribution
{
  if (!self->_publisherAttribution)
  {
    id v3 = [(CuratedCollectionHandler *)self curatedCollection];

    if (v3)
    {
      id v4 = +[GEOCollectionPublisherAttributionManager sharedInstance];
      id v5 = [(CuratedCollectionHandler *)self curatedCollection];
      id v6 = [v5 publisherAttribution];
      id v7 = [v4 bestAttributionForPublisher:v6];
      publisherAttribution = self->_publisherAttribution;
      self->_publisherAttribution = v7;
    }
  }
  v9 = self->_publisherAttribution;

  return v9;
}

- (void)deleteCollection:(id)a3
{
  id v4 = a3;
  id v5 = +[CuratedCollectionSyncManager sharedManager];
  id v6 = [(CuratedCollectionHandler *)self curatedCollection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100AB372C;
  v8[3] = &unk_1012E6EA8;
  id v9 = v4;
  id v7 = v4;
  [v5 removeSavedMapsSyncCuratedCollection:v6 completion:v8];
}

- (id)sharingURL
{
  id v3 = [(CuratedCollectionHandler *)self curatedCollection];
  id v4 = [v3 curatedCollectionIdentifier];

  id v5 = [(CuratedCollectionHandler *)self curatedCollection];
  id v6 = [v5 resultProviderIdentifier];

  return +[GEOMapURLBuilder URLForCuratedCollection:v4 provider:v6];
}

- (BOOL)canShare
{
  v2 = [(CuratedCollectionHandler *)self sharingURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canDelete
{
  return 1;
}

- (void)retrieveGeoCollectionWithRefinedItems:(id)a3
{
  id v4 = a3;
  id v5 = [CuratedCollectionResolver alloc];
  id v6 = [(CuratedCollectionHandler *)self curatedCollectionIdentifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AB38E4;
  v10[3] = &unk_101316608;
  id v11 = v4;
  id v7 = v4;
  id v8 = [(CuratedCollectionResolver *)v5 initWithCuratedCollectionIdentifier:v6 handler:v10];
  resolver = self->_resolver;
  self->_resolver = v8;

  [(CuratedCollectionResolver *)self->_resolver resolveCollection];
}

+ (id)_delimiterString
{
  if (qword_1016106D8 != -1) {
    dispatch_once(&qword_1016106D8, &stru_101316628);
  }
  v2 = (void *)qword_1016106D0;

  return v2;
}

- (MSCachedCuratedCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (UIImage)publisherImage
{
  return self->_publisherImage;
}

- (void)setPublisherImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherImage, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_resolver, 0);

  objc_storeStrong((id *)&self->_publisherAttribution, 0);
}

@end