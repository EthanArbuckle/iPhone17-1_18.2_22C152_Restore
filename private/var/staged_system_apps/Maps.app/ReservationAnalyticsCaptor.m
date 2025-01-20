@interface ReservationAnalyticsCaptor
- (MKMapItem)mapItem;
- (id)_createActionDetails;
- (void)_captureAction:(int)a3 target:(int)a4;
- (void)captureBookedCancel;
- (void)captureBookedChangeReservation;
- (void)captureMoreOptionsCancel;
- (void)captureMoreOptionsDecreaseTableSize;
- (void)captureMoreOptionsIncreaseTableSize;
- (void)captureMoreOptionsSelectDateTime;
- (void)captureMoreOptionsSubmit;
- (void)captureSelectTimeAddSpecialRequest;
- (void)captureSelectTimeCancel;
- (void)captureSelectTimeEditBooking;
- (void)captureSelectTimeEditUserInfo;
- (void)captureSelectTimeLearnMore;
- (void)captureSelectTimePunchOut;
- (void)captureSelectTimeReserveTable;
- (void)captureSelectTimeSelected;
- (void)captureSelectTimeViewMoreOptions;
- (void)setMapItem:(id)a3;
@end

@implementation ReservationAnalyticsCaptor

- (id)_createActionDetails
{
  v2 = [(ReservationAnalyticsCaptor *)self mapItem];
  v3 = [v2 _geoMapItem];
  v4 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v3 timestamp:0xFFFFFFFFLL resultIndex:0.0];

  return v4;
}

- (void)_captureAction:(int)a3 target:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v8 = +[MKMapService sharedService];
  v7 = [(ReservationAnalyticsCaptor *)self _createActionDetails];
  [v8 captureUserAction:v5 onTarget:v4 eventValue:0 placeActionDetails:v7];
}

- (void)captureSelectTimeViewMoreOptions
{
}

- (void)captureSelectTimeSelected
{
}

- (void)captureSelectTimeEditBooking
{
}

- (void)captureSelectTimeEditUserInfo
{
}

- (void)captureSelectTimeAddSpecialRequest
{
}

- (void)captureSelectTimeLearnMore
{
}

- (void)captureSelectTimePunchOut
{
}

- (void)captureSelectTimeReserveTable
{
}

- (void)captureSelectTimeCancel
{
}

- (void)captureMoreOptionsSelectDateTime
{
}

- (void)captureMoreOptionsIncreaseTableSize
{
}

- (void)captureMoreOptionsDecreaseTableSize
{
}

- (void)captureMoreOptionsSubmit
{
}

- (void)captureMoreOptionsCancel
{
}

- (void)captureBookedChangeReservation
{
}

- (void)captureBookedCancel
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end