@interface CuratedCollectionItemCellModel
- (BOOL)hasImage;
- (BOOL)isItemInLibrary;
- (BOOL)isItemInUserCollection;
- (CuratedCollectionItemCellModel)initWithMKPlaceCollectionMapItem:(id)a3 usingAttribution:(id)a4 itemDescription:(id)a5 itemInUserCollection:(BOOL)a6 libraryOperationsCoordinator:(id)a7 appClip:(id)a8;
- (CuratedCollectionPlaceSummaryViewModel)placeSummaryModel;
- (GEOAppStoreAppClip)appClip;
- (GEOLocation)currentLocation;
- (GEOMapItemPhotoInfo)photoInfo;
- (MKPlaceCollectionMapItem)collectionItem;
- (NSAttributedString)fullReviewString;
- (NSAttributedString)itemDescription;
- (NSString)imageAttribution;
- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)libraryOperationsCoordinator;
- (id)_collectionItemImage;
- (void)cancelImageDownload;
- (void)loadImageForSize:(CGSize)a3 completion:(id)a4;
- (void)setCurrentLocation:(id)a3;
- (void)setIsItemInUserCollection:(BOOL)a3;
- (void)setPhotoInfo:(id)a3;
@end

@implementation CuratedCollectionItemCellModel

- (CuratedCollectionItemCellModel)initWithMKPlaceCollectionMapItem:(id)a3 usingAttribution:(id)a4 itemDescription:(id)a5 itemInUserCollection:(BOOL)a6 libraryOperationsCoordinator:(id)a7 appClip:(id)a8
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CuratedCollectionItemCellModel;
  v19 = [(CuratedCollectionItemCellModel *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_collectionItem, a3);
    objc_storeStrong((id *)&v20->_attribution, a4);
    v21 = (NSAttributedString *)[v16 copy];
    itemDescription = v20->_itemDescription;
    v20->_itemDescription = v21;

    v20->_isItemInUserCollection = a6;
    objc_storeStrong((id *)&v20->_libraryOperationsCoordinator, a7);
    objc_storeStrong((id *)&v20->_appClip, a8);
  }

  return v20;
}

- (NSAttributedString)fullReviewString
{
  v3 = [(CuratedCollectionItemCellModel *)self collectionItem];
  v4 = [v3 placeCollectionItem];
  v5 = [v4 reviewUrl];

  if (v5)
  {
    v6 = [(CuratedCollectionItemCellModel *)self collectionItem];
    v7 = [v6 placeCollectionItem];
    v8 = [v7 reviewText];

    if (![v8 length])
    {
      v9 = +[NSBundle mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"[Curated Collection View] Read review text" value:@"localized string not found" table:0];

      v8 = (void *)v10;
    }
    id v11 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8];
    NSAttributedStringKey v16 = NSFontAttributeName;
    v12 = +[UIFont system15];
    id v17 = v12;
    v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v11 addAttributes:v13 range:NSMakeRange(0, [v8 length])];

    [v11 addAttribute:NSLinkAttributeName value:v5 range:0, [v8 length]];
    id v14 = [v11 copy];
  }
  else
  {
    id v14 = 0;
  }

  return (NSAttributedString *)v14;
}

- (CuratedCollectionPlaceSummaryViewModel)placeSummaryModel
{
  if (!self->_placeSummaryModel)
  {
    v3 = [CuratedCollectionPlaceSummaryViewModel alloc];
    v4 = [(CuratedCollectionItemCellModel *)self collectionItem];
    v5 = [v4 mapItem];
    v6 = [(CuratedCollectionPlaceSummaryViewModel *)v3 initWithMapItem:v5];
    placeSummaryModel = self->_placeSummaryModel;
    self->_placeSummaryModel = v6;
  }
  v8 = [(CuratedCollectionItemCellModel *)self currentLocation];
  [(CuratedCollectionPlaceSummaryViewModel *)self->_placeSummaryModel setCurrentLocation:v8];

  v9 = self->_placeSummaryModel;

  return v9;
}

- (BOOL)hasImage
{
  v2 = [(CuratedCollectionItemCellModel *)self _collectionItemImage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)loadImageForSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = +[MKSystemController sharedInstance];
  [v8 screenScale];
  double v10 = v9;

  id v11 = [(CuratedCollectionItemCellModel *)self _collectionItemImage];
  v12 = [v11 bestPhotoForSize:1 allowSmaller:width * v10, height * v10];
  [(CuratedCollectionItemCellModel *)self setPhotoInfo:v12];

  v13 = +[MKAppImageManager sharedImageManager];
  id v14 = [(CuratedCollectionItemCellModel *)self photoInfo];
  id v15 = [v14 url];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1009A9D8C;
  v17[3] = &unk_1012EC150;
  id v18 = v7;
  id v16 = v7;
  [v13 loadAppImageAtURL:v15 completionHandler:v17];
}

- (void)cancelImageDownload
{
  id v5 = +[MKAppImageManager sharedImageManager];
  BOOL v3 = [(CuratedCollectionItemCellModel *)self photoInfo];
  v4 = [v3 url];
  [v5 cancelLoadAppImageAtURL:v4];
}

- (NSString)imageAttribution
{
  BOOL v3 = [(CuratedCollectionItemCellModel *)self collectionItem];
  v4 = [v3 placeCollectionItem];
  id v5 = [v4 photos];
  v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = [v6 author];
    goto LABEL_10;
  }
  v8 = [(CuratedCollectionItemCellModel *)self collectionItem];
  double v9 = [v8 placeCollectionItem];
  unsigned int v10 = [v9 supportsPhotoFallback];

  if (v10)
  {
    id v11 = [(CuratedCollectionItemCellModel *)self collectionItem];
    v12 = [v11 mapItem];
    v13 = [v12 _geoMapItem];
    id v14 = [v13 _photos];
    v6 = [v14 firstObject];

    if (v6)
    {
      id v15 = [v6 attribution];
      unsigned __int8 v16 = [v15 shouldSuppressPhotoAttribution];

      if ((v16 & 1) == 0)
      {
        id v17 = [v6 attribution];
        id v18 = [v17 providerName];

        if ([v18 length])
        {
          v19 = +[NSBundle mainBundle];
          v20 = [v19 localizedStringForKey:@"Photo from [provider]" value:@"localized string not found" table:0];
          id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v18);

          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = 0;
LABEL_10:

  return (NSString *)v7;
}

- (id)_collectionItemImage
{
  BOOL v3 = [(CuratedCollectionItemCellModel *)self collectionItem];
  v4 = [v3 placeCollectionItem];
  id v5 = [v4 photos];
  v6 = [v5 firstObject];

  if (!v6)
  {
    id v7 = [(CuratedCollectionItemCellModel *)self collectionItem];
    v8 = [v7 placeCollectionItem];
    unsigned int v9 = [v8 supportsPhotoFallback];

    if (v9)
    {
      unsigned int v10 = [(CuratedCollectionItemCellModel *)self collectionItem];
      id v11 = [v10 mapItem];
      v12 = [v11 _geoMapItem];
      v13 = [v12 _photos];
      v6 = [v13 firstObject];
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isItemInLibrary
{
  v2 = [(CuratedCollectionItemCellModel *)self libraryOperationsCoordinator];
  unsigned __int8 v3 = [v2 isPlaceInLibrary];

  return v3;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)libraryOperationsCoordinator
{
  return self->_libraryOperationsCoordinator;
}

- (BOOL)isItemInUserCollection
{
  return self->_isItemInUserCollection;
}

- (void)setIsItemInUserCollection:(BOOL)a3
{
  self->_isItemInUserCollection = a3;
}

- (MKPlaceCollectionMapItem)collectionItem
{
  return self->_collectionItem;
}

- (NSAttributedString)itemDescription
{
  return self->_itemDescription;
}

- (GEOAppStoreAppClip)appClip
{
  return self->_appClip;
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
  objc_storeStrong((id *)&self->_appClip, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_collectionItem, 0);
  objc_storeStrong((id *)&self->_libraryOperationsCoordinator, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_attribution, 0);

  objc_storeStrong((id *)&self->_placeSummaryModel, 0);
}

@end