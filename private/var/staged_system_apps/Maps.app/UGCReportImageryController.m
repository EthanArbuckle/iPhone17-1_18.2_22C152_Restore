@interface UGCReportImageryController
- (UGCReportImageryController)initWithMapItem:(id)a3 reportedPhoto:(id)a4 presentingViewController:(id)a5;
- (void)cancelPresentation;
- (void)fetchLayoutAndPresentWithCompletion:(id)a3;
@end

@implementation UGCReportImageryController

- (UGCReportImageryController)initWithMapItem:(id)a3 reportedPhoto:(id)a4 presentingViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UGCReportImageryController;
  v12 = [(UGCReportImageryController *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mapItem, a3);
    objc_storeStrong((id *)&v13->_geoPhoto, a4);
    v14 = [v10 largestPhoto];
    v15 = [v14 url];
    uint64_t v16 = [v15 absoluteString];
    photoURL = v13->_photoURL;
    v13->_photoURL = (NSString *)v16;

    objc_storeStrong((id *)&v13->_presentingViewController, a5);
    uint64_t v18 = [v11 rapBarButtonView];
    rapButtonView = v13->_rapButtonView;
    v13->_rapButtonView = (UIView *)v18;

    v13->_shouldCancelPresentation = 0;
    uint64_t v20 = geo_isolater_create();
    downloadIsolator = v13->_downloadIsolator;
    v13->_downloadIsolator = (geo_isolater *)v20;
  }
  return v13;
}

- (void)fetchLayoutAndPresentWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [[RAPPlacecardImageryContextImpl alloc] initWithMapItem:self->_mapItem photo:self->_geoPhoto selectedPhotoURL:self->_photoURL];
  v6 = [RAPPlacecardImageryLayoutManager alloc];
  v7 = +[RAPPlacecardImageryIssueItem defaultIssueItems];
  v8 = [(RAPPlacecardImageryLayoutManager *)v6 initWithDefaultItems:v7];
  layoutManager = self->_layoutManager;
  self->_layoutManager = v8;

  location[1] = _NSConcreteStackBlock;
  location[2] = (id)3221225472;
  location[3] = sub_100885E90;
  location[4] = &unk_1012E5D08;
  location[5] = self;
  geo_isolate_sync();
  objc_initWeak(location, self);
  id v10 = self->_layoutManager;
  mapItem = self->_mapItem;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100885E9C;
  v14[3] = &unk_1012FE7B0;
  objc_copyWeak(&v17, location);
  v14[4] = self;
  v12 = v5;
  v15 = v12;
  id v13 = v4;
  id v16 = v13;
  [(RAPPlacecardImageryLayoutManager *)v10 downloadAndResolveLayoutWithMapItem:mapItem completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(location);
}

- (void)cancelPresentation
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadIsolator, 0);
  objc_storeStrong((id *)&self->_photoURL, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_geoPhoto, 0);
  objc_storeStrong((id *)&self->_rapButtonView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);

  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end