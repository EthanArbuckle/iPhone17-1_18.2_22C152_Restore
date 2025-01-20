@interface WISGeoMetadataRequesterDelegateImpl
- (WISGeoMetadataRequesterDelegateImpl)init;
- (id).cxx_construct;
- (void)callOnFailedWithErrorCallback:(id)a3 ofMetaDataType:(unint64_t)a4 forLocation:(id)a5;
- (void)callOnReceivedResultsCallback:(id)a3 ofMetaDataType:(unint64_t)a4 forLocation:(id)a5;
- (void)geoGeographicMetadataRequester:(id)a3 failedWithError:(id)a4 forLocation:(id)a5;
- (void)geoGeographicMetadataRequester:(id)a3 returnedNewResults:(id)a4 forLocation:(id)a5;
- (void)onFailedWithErrorCallback:(function<void (NSError *);
- (void)onReceivedResultsCallback:(function<void (NSArray<NSData *> *);
- (void)updateLocation:(id)a3;
@end

@implementation WISGeoMetadataRequesterDelegateImpl

- (WISGeoMetadataRequesterDelegateImpl)init
{
  v10.receiver = self;
  v10.super_class = (Class)WISGeoMetadataRequesterDelegateImpl;
  v2 = [(WISGeoMetadataRequesterDelegateImpl *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.wirelessinsightsd.geometadatarequester", v3);
    fObj = v2->fQueue.fObj.fObj;
    v2->fQueue.fObj.fObj = (dispatch_object_s *)v4;
    if (fObj) {
      dispatch_release(fObj);
    }
    v6 = (GEOGeographicMetadataRequester *)[objc_alloc((Class)GEOGeographicMetadataRequester) initWithDataType:4 delegateQueue:v2->fQueue.fObj.fObj delegate:v2];
    fGEOGeographicMetadataRequester = v2->fGEOGeographicMetadataRequester;
    v2->fGEOGeographicMetadataRequester = v6;

    v8 = v2;
  }

  return v2;
}

- (void)onReceivedResultsCallback:(function<void (NSArray<NSData *> *)
{
  self;
  sub_10002984C((uint64_t)&v4, (uint64_t)a3);
  operator new();
}

- (void)onFailedWithErrorCallback:(function<void (NSError *)
{
  self;
  sub_100029AF0((uint64_t)&v4, (uint64_t)a3);
  operator new();
}

- (void)callOnReceivedResultsCallback:(id)a3 ofMetaDataType:(unint64_t)a4 forLocation:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = self;
  id v10 = v7;
  id v11 = v8;
  operator new();
}

- (void)callOnFailedWithErrorCallback:(id)a3 ofMetaDataType:(unint64_t)a4 forLocation:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = self;
  id v10 = v7;
  id v11 = v8;
  operator new();
}

- (void)updateLocation:(id)a3
{
}

- (void)geoGeographicMetadataRequester:(id)a3 returnedNewResults:(id)a4 forLocation:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  -[WISGeoMetadataRequesterDelegateImpl callOnReceivedResultsCallback:ofMetaDataType:forLocation:](self, "callOnReceivedResultsCallback:ofMetaDataType:forLocation:", v8, [v10 metadataType], v9);
}

- (void)geoGeographicMetadataRequester:(id)a3 failedWithError:(id)a4 forLocation:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  -[WISGeoMetadataRequesterDelegateImpl callOnFailedWithErrorCallback:ofMetaDataType:forLocation:](self, "callOnFailedWithErrorCallback:ofMetaDataType:forLocation:", v8, [v10 metadataType], v9);
}

- (void).cxx_destruct
{
  sub_100029B70(self->fFailedWithErrorCallback.__f_.__buf_.__lx);
  sub_1000298CC(self->fReceivedResultsCallback.__f_.__buf_.__lx);
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }

  objc_storeStrong((id *)&self->fGEOGeographicMetadataRequester, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 10) = 0;
  return self;
}

@end