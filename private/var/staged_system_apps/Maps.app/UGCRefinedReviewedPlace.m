@interface UGCRefinedReviewedPlace
- (MKMapItem)mapItem;
- (UGCRefinedReviewedPlace)initWithMapItem:(id)a3 reviewedPlace:(id)a4;
- (UGCReviewedPlace)reviewedPlace;
@end

@implementation UGCRefinedReviewedPlace

- (UGCRefinedReviewedPlace)initWithMapItem:(id)a3 reviewedPlace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCRefinedReviewedPlace;
  v9 = [(UGCRefinedReviewedPlace *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v10->_reviewedPlace, a4);
  }

  return v10;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (UGCReviewedPlace)reviewedPlace
{
  return self->_reviewedPlace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewedPlace, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end