@interface UGCPhotoViewerComingledBatchRequester
- (UGCPhotoViewerComingledBatchRequester)initWithMapItem:(id)a3 categoryId:(id)a4;
- (void)fetchPhotosWithRange:(_NSRange)a3 completion:(id)a4;
@end

@implementation UGCPhotoViewerComingledBatchRequester

- (UGCPhotoViewerComingledBatchRequester)initWithMapItem:(id)a3 categoryId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCPhotoViewerComingledBatchRequester;
  v9 = [(UGCPhotoViewerComingledBatchRequester *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_categoryId, a4);
    objc_storeStrong((id *)&v10->_mapItem, a3);
  }

  return v10;
}

- (void)fetchPhotosWithRange:(_NSRange)a3 completion:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (v7)
  {
    if (length)
    {
      [(GEOMapServicePhotoLookupTicket *)self->_currentTicket cancel];
      id v8 = +[GEOMapService sharedService];
      categoryId = self->_categoryId;
      v10 = [(MKMapItem *)self->_mapItem _geoMapItem];
      v11 = [v10 _identifier];
      objc_super v12 = +[GEOMapService sharedService];
      v13 = [v12 defaultTraits];
      [v8 ticketForCategoryIdentifier:categoryId mapItemIdentifier:v11 range:location length:length traits:v13];
      v14 = (GEOMapServicePhotoLookupTicket *)objc_claimAutoreleasedReturnValue();
      currentTicket = self->_currentTicket;
      self->_currentTicket = v14;

      v16 = self->_currentTicket;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1008C49E0;
      v17[3] = &unk_1012FF7D8;
      id v18 = v7;
      [(GEOMapServicePhotoLookupTicket *)v16 submitWithHandler:v17 networkActivity:0];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", buf, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_currentTicket, 0);

  objc_storeStrong((id *)&self->_categoryId, 0);
}

@end