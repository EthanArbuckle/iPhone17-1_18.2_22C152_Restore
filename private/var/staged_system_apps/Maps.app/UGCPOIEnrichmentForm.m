@interface UGCPOIEnrichmentForm
+ (id)addPOIEnrichmentFormWithMapItem:(id)a3 photosForm:(id)a4 ratingsForm:(id)a5;
+ (id)editPOIEnrichmentFormWithMapItem:(id)a3 parentSubmissionIdentifier:(id)a4 photosForm:(id)a5 ratingsForm:(id)a6;
- (BOOL)isComplete;
- (BOOL)isEdited;
- (BOOL)isEmpty;
- (BOOL)passesMinimumRequirementsToBeSubmittable;
- (MKMapItem)mapItem;
- (UGCPOIEnrichmentForm)initWithMapItem:(id)a3 actionType:(int64_t)a4 photosForm:(id)a5 ratingsForm:(id)a6;
- (UGCPOIEnrichmentForm)initWithMapItem:(id)a3 parentSubmissionIdentifier:(id)a4 photosForm:(id)a5 ratingsForm:(id)a6;
- (UGCPhotosForm)photosForm;
- (UGCRatingsForm)ratingsForm;
- (id)parentSubmissionIdentifier;
- (int64_t)actionType;
- (void)_fillSubmissionFields:(id)a3;
- (void)fillSubmissionFields:(id)a3;
- (void)fillSubmissionFieldsForPhotos:(id)a3;
- (void)fillSubmissionFieldsForRatings:(id)a3;
- (void)setParentSubmissionIdentifier:(id)a3;
@end

@implementation UGCPOIEnrichmentForm

+ (id)addPOIEnrichmentFormWithMapItem:(id)a3 photosForm:(id)a4 ratingsForm:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[UGCPOIEnrichmentForm alloc] initWithMapItem:v9 actionType:0 photosForm:v8 ratingsForm:v7];

  return v10;
}

+ (id)editPOIEnrichmentFormWithMapItem:(id)a3 parentSubmissionIdentifier:(id)a4 photosForm:(id)a5 ratingsForm:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[UGCPOIEnrichmentForm alloc] initWithMapItem:v12 parentSubmissionIdentifier:v11 photosForm:v10 ratingsForm:v9];

  return v13;
}

- (UGCPOIEnrichmentForm)initWithMapItem:(id)a3 parentSubmissionIdentifier:(id)a4 photosForm:(id)a5 ratingsForm:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [[UGCPOIEnrichmentForm alloc] initWithMapItem:v12 actionType:1 photosForm:v11 ratingsForm:v10];

  if (v13) {
    v13->_parentSubmissionIdentifier = (NSString *)a4;
  }
  return v13;
}

- (UGCPOIEnrichmentForm)initWithMapItem:(id)a3 actionType:(int64_t)a4 photosForm:(id)a5 ratingsForm:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UGCPOIEnrichmentForm;
  v14 = [(UGCForm *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mapItem, a3);
    objc_storeStrong((id *)&v15->_photosForm, a5);
    objc_storeStrong((id *)&v15->_ratingsForm, a6);
    v15->_actionType = a4;
    [(UGCForm *)v15->_photosForm addObserver:v15];
    [(UGCForm *)v15->_ratingsForm addObserver:v15];
  }

  return v15;
}

- (BOOL)isComplete
{
  if ([(UGCPOIEnrichmentForm *)self passesMinimumRequirementsToBeSubmittable])
  {
    if ([(UGCRatingsForm *)self->_ratingsForm isComplete]) {
      unsigned int v3 = 1;
    }
    else {
      unsigned int v3 = [(UGCPhotosForm *)self->_photosForm isComplete];
    }
    int64_t v4 = [(UGCPOIEnrichmentForm *)self actionType];
    if (v4 == 2)
    {
      LOBYTE(v3) = 1;
    }
    else if (v4 == 1)
    {
      v3 &= [(UGCPOIEnrichmentForm *)self isEdited];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (int64_t)actionType
{
  if (self->_parentSubmissionIdentifier && [(UGCPOIEnrichmentForm *)self isEmpty]) {
    return 2;
  }
  else {
    return self->_actionType;
  }
}

- (BOOL)isEmpty
{
  unsigned int v3 = [(UGCRatingsForm *)self->_ratingsForm isEmpty];
  if (v3)
  {
    photosForm = self->_photosForm;
    LOBYTE(v3) = [(UGCPhotosForm *)photosForm isEmpty];
  }
  return v3;
}

- (BOOL)isEdited
{
  if ([(UGCRatingsForm *)self->_ratingsForm isEdited]) {
    return 1;
  }
  photosForm = self->_photosForm;

  return [(UGCPhotosForm *)photosForm isEdited];
}

- (BOOL)passesMinimumRequirementsToBeSubmittable
{
  ratingsForm = self->_ratingsForm;
  photosForm = self->_photosForm;
  if (ratingsForm)
  {
    unsigned int v5 = [(UGCRatingsForm *)ratingsForm passesMinimumRequirementsToBeSubmittable];
    unsigned int v6 = v5;
    if (photosForm)
    {
      LOBYTE(v5) = 0;
      BOOL v7 = v6 == 0;
    }
    else
    {
      BOOL v7 = 1;
    }
    if (v7) {
      return v5;
    }
    photosForm = self->_photosForm;
  }

  LOBYTE(v5) = [(UGCPhotosForm *)photosForm passesMinimumRequirementsToBeSubmittable];
  return v5;
}

- (void)fillSubmissionFields:(id)a3
{
  id v4 = a3;
  [(UGCPOIEnrichmentForm *)self _fillSubmissionFields:v4];
  [(UGCRatingsForm *)self->_ratingsForm fillSubmissionFields:v4];
  [(UGCPhotosForm *)self->_photosForm fillSubmissionFields:v4];
}

- (void)fillSubmissionFieldsForPhotos:(id)a3
{
  id v5 = a3;
  [(UGCPOIEnrichmentForm *)self _fillSubmissionFields:v5];
  [(UGCPhotosForm *)self->_photosForm fillSubmissionFields:v5];
  if (((id)[(UGCPOIEnrichmentForm *)self actionType] == (id)1
     || (id)[(UGCPOIEnrichmentForm *)self actionType] == (id)2)
    && [(NSString *)self->_parentSubmissionIdentifier length])
  {
    id v4 = [(UGCPhotosForm *)self->_photosForm parentSubmissionIdentifier];
    [v5 setParentSubmissionIdentifier:v4];
  }
}

- (void)fillSubmissionFieldsForRatings:(id)a3
{
  id v5 = a3;
  [(UGCPOIEnrichmentForm *)self _fillSubmissionFields:v5];
  [(UGCRatingsForm *)self->_ratingsForm fillSubmissionFields:v5];
  if (((id)[(UGCPOIEnrichmentForm *)self actionType] == (id)1
     || (id)[(UGCPOIEnrichmentForm *)self actionType] == (id)2)
    && [(NSString *)self->_parentSubmissionIdentifier length])
  {
    id v4 = [(UGCRatingsForm *)self->_ratingsForm parentSubmissionIdentifier];
    [v5 setParentSubmissionIdentifier:v4];
  }
}

- (void)_fillSubmissionFields:(id)a3
{
  id v9 = a3;
  id v4 = [v9 poiEnrichment];
  if ((id)[(UGCPOIEnrichmentForm *)self actionType] == (id)2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v4 setAction:v5];
  unsigned int v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
  BOOL v7 = [v6 _placeData];
  id v8 = +[GEORPPoiEnrichmentPlaceContext buildPlaceContextWithPlaceData:v7];
  [v4 setPlaceContext:v8];

  if (((id)[(UGCPOIEnrichmentForm *)self actionType] == (id)1
     || (id)[(UGCPOIEnrichmentForm *)self actionType] == (id)2)
    && [(NSString *)self->_parentSubmissionIdentifier length])
  {
    [v9 setParentSubmissionIdentifier:self->_parentSubmissionIdentifier];
  }
}

- (id)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  self->_parentSubmissionIdentifier = (NSString *)a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (UGCPhotosForm)photosForm
{
  return self->_photosForm;
}

- (UGCRatingsForm)ratingsForm
{
  return self->_ratingsForm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingsForm, 0);
  objc_storeStrong((id *)&self->_photosForm, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end