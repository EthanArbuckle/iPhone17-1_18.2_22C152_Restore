@interface CuratedCollectionDescriptionCellModel
- (BOOL)hasAuthorImage;
- (BOOL)hasAuthorName;
- (CuratedCollectionDescriptionCellModel)initWithCollection:(id)a3 collectionDescription:(id)a4;
- (GEOMapItemPhotoInfo)photoInfo;
- (GEOPlaceCollection)collection;
- (NSAttributedString)collectionDescription;
- (NSString)authorName;
- (NSString)collectionMetadata;
- (NSString)companyName;
- (void)_loadCompanyLogoForSize:(CGSize)a3 authorError:(id)a4 completion:(id)a5;
- (void)cancelAuthorImageDownload;
- (void)loadAuthorImageForSize:(CGSize)a3 completion:(id)a4;
- (void)setPhotoInfo:(id)a3;
@end

@implementation CuratedCollectionDescriptionCellModel

- (CuratedCollectionDescriptionCellModel)initWithCollection:(id)a3 collectionDescription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CuratedCollectionDescriptionCellModel;
  v9 = [(CuratedCollectionDescriptionCellModel *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    v11 = (NSAttributedString *)[v8 copy];
    collectionDescription = v10->_collectionDescription;
    v10->_collectionDescription = v11;

    if (qword_10160EF08 != -1) {
      dispatch_once(&qword_10160EF08, &stru_1012ED1C8);
    }
  }

  return v10;
}

- (BOOL)hasAuthorImage
{
  v2 = [(CuratedCollectionDescriptionCellModel *)self collection];
  v3 = [v2 authorPhoto];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAuthorName
{
  v2 = [(CuratedCollectionDescriptionCellModel *)self collection];
  v3 = [v2 authorName];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)loadAuthorImageForSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = +[MKSystemController sharedInstance];
  [v8 screenScale];
  double v10 = v9;

  v11 = [(CuratedCollectionDescriptionCellModel *)self collection];
  v12 = [v11 authorPhoto];

  v13 = [v12 bestPhotoForSize:1 allowSmaller:width * v10, height * v10];
  [(CuratedCollectionDescriptionCellModel *)self setPhotoInfo:v13];

  if ([(CuratedCollectionDescriptionCellModel *)self hasAuthorImage])
  {
    objc_initWeak(&location, self);
    objc_super v14 = +[MKAppImageManager sharedImageManager];
    v15 = [(CuratedCollectionDescriptionCellModel *)self photoInfo];
    v16 = [v15 url];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1004E8DB8;
    v17[3] = &unk_1012ED1F0;
    objc_copyWeak(v19, &location);
    v19[1] = *(id *)&width;
    v19[2] = *(id *)&height;
    id v18 = v7;
    [v14 loadAppImageAtURL:v16 completionHandler:v17];

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CuratedCollectionDescriptionCellModel _loadCompanyLogoForSize:authorError:completion:](self, "_loadCompanyLogoForSize:authorError:completion:", 0, v7, width, height);
  }
}

- (void)_loadCompanyLogoForSize:(CGSize)a3 authorError:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = +[MKSystemController sharedInstance];
  [v9 screenScale];
  double v11 = v10;

  v12 = [(CuratedCollectionDescriptionCellModel *)self collection];
  v13 = [v12 publisherAttribution];
  id v14 = [v13 iconIdentifier];

  v15 = [(CuratedCollectionDescriptionCellModel *)self collection];
  v16 = [v15 publisherAttribution];
  v17 = [v16 displayName];

  id v18 = +[MKPlaceCollectionsPublisherIconManager sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1004E8FD4;
  v21[3] = &unk_1012E6118;
  id v22 = v7;
  id v23 = v8;
  id v19 = v7;
  id v20 = v8;
  [v18 iconForPublisherNamed:v17 usingId:v14 contentScale:v21 onCompletion:v11];
}

- (void)cancelAuthorImageDownload
{
  id v5 = +[MKAppImageManager sharedImageManager];
  v3 = [(CuratedCollectionDescriptionCellModel *)self photoInfo];
  BOOL v4 = [v3 url];
  [v5 cancelLoadAppImageAtURL:v4];
}

- (NSString)authorName
{
  if ([(CuratedCollectionDescriptionCellModel *)self hasAuthorName])
  {
    v3 = [(CuratedCollectionDescriptionCellModel *)self collection];
    BOOL v4 = [v3 authorName];
  }
  else
  {
    BOOL v4 = [(CuratedCollectionDescriptionCellModel *)self companyName];
  }

  return (NSString *)v4;
}

- (NSString)companyName
{
  v2 = [(CuratedCollectionDescriptionCellModel *)self collection];
  v3 = [v2 publisherAttribution];
  BOOL v4 = [v3 displayName];

  return (NSString *)v4;
}

- (NSString)collectionMetadata
{
  v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"Number of places [Curated Collection]" value:@"localized string not found" table:0];
  id v5 = [(CuratedCollectionDescriptionCellModel *)self collection];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, [v5 numberOfItems]);

  id v7 = +[NSDate date];
  id v8 = +[NSCalendar currentCalendar];
  double v9 = [(CuratedCollectionDescriptionCellModel *)self collection];
  double v10 = [v9 lastModifiedDate];
  double v11 = [v8 components:16 fromDate:v10 toDate:v7 options:0];

  v12 = 0;
  if ((uint64_t)[v11 day] <= 14)
  {
    v13 = (void *)qword_10160EF10;
    id v14 = [(CuratedCollectionDescriptionCellModel *)self collection];
    v15 = [v14 lastModifiedDate];
    v16 = [v13 localizedStringForDate:v15 relativeToDate:v7];

    v17 = +[NSBundle mainBundle];
    id v18 = [v17 localizedStringForKey:@"[Curated Collection] Updated" value:@"localized string not found" table:0];
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v16);
  }
  id v19 = +[NSBundle mainBundle];
  id v20 = [v19 localizedStringForKey:@" · [List view details separator]" value:@"localized string not found" table:0];

  v30 = v6;
  v21 = +[NSArray arrayWithObjects:&v30 count:1];
  if (v12)
  {
    v29[0] = v6;
    v29[1] = v12;
    uint64_t v22 = +[NSArray arrayWithObjects:v29 count:2];

    v21 = (void *)v22;
  }
  id v23 = +[UIApplication sharedApplication];
  id v24 = [v23 userInterfaceLayoutDirection];

  if (v24 == (id)1)
  {
    v25 = [v21 reverseObjectEnumerator];
    uint64_t v26 = [v25 allObjects];

    v21 = (void *)v26;
  }
  v27 = [v21 componentsJoinedByString:v20];

  return (NSString *)v27;
}

- (GEOPlaceCollection)collection
{
  return self->_collection;
}

- (NSAttributedString)collectionDescription
{
  return self->_collectionDescription;
}

- (GEOMapItemPhotoInfo)photoInfo
{
  return self->_photoInfo;
}

- (void)setPhotoInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoInfo, 0);
  objc_storeStrong((id *)&self->_collectionDescription, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end