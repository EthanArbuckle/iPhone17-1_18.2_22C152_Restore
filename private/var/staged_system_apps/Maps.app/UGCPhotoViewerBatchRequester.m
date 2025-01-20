@interface UGCPhotoViewerBatchRequester
- (UGCPhotoViewerBatchRequester)initWithMapItem:(id)a3;
- (void)fetchPhotosWithRange:(_NSRange)a3 completion:(id)a4;
@end

@implementation UGCPhotoViewerBatchRequester

- (UGCPhotoViewerBatchRequester)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UGCPhotoViewerBatchRequester;
  v6 = [(UGCPhotoViewerBatchRequester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
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
      v8 = +[GEOMapService sharedService];
      objc_super v9 = [(MKMapItem *)self->_mapItem _vendorID];
      v10 = [(MKMapItem *)self->_mapItem _geoMapItem];
      v11 = [v10 _identifier];
      v12 = +[GEOMapService sharedService];
      v13 = [v12 defaultTraits];
      [v8 ticketForVendorIdentifier:v9 mapItemIdentifier:v11 range:location length:v13];
      v14 = (GEOMapServicePhotoLookupTicket *)objc_claimAutoreleasedReturnValue();
      currentTicket = self->_currentTicket;
      self->_currentTicket = v14;

      v16 = self->_currentTicket;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1008C4744;
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
  objc_storeStrong((id *)&self->_currentTicket, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end