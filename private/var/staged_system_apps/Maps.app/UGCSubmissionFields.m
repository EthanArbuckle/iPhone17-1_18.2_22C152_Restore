@interface UGCSubmissionFields
- (GEORPFeedbackUserInfo)userInfo;
- (GEORPIncidentFeedback)incidentFeedback;
- (GEORPPoiEnrichmentUpdate)poiEnrichment;
- (NSArray)photoList;
- (NSString)parentSubmissionIdentifier;
- (UGCSubmissionFields)init;
- (void)addPhoto:(id)a3;
- (void)setParentSubmissionIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation UGCSubmissionFields

- (UGCSubmissionFields)init
{
  v6.receiver = self;
  v6.super_class = (Class)UGCSubmissionFields;
  v2 = [(UGCSubmissionFields *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    photos = v2->_photos;
    v2->_photos = v3;
  }
  return v2;
}

- (GEORPPoiEnrichmentUpdate)poiEnrichment
{
  poiEnrichment = self->_poiEnrichment;
  if (!poiEnrichment)
  {
    v4 = (GEORPPoiEnrichmentUpdate *)objc_alloc_init((Class)GEORPPoiEnrichmentUpdate);
    v5 = self->_poiEnrichment;
    self->_poiEnrichment = v4;

    poiEnrichment = self->_poiEnrichment;
  }

  return poiEnrichment;
}

- (GEORPIncidentFeedback)incidentFeedback
{
  incidentFeedback = self->_incidentFeedback;
  if (!incidentFeedback)
  {
    v4 = (GEORPIncidentFeedback *)objc_alloc_init((Class)GEORPIncidentFeedback);
    v5 = self->_incidentFeedback;
    self->_incidentFeedback = v4;

    incidentFeedback = self->_incidentFeedback;
  }

  return incidentFeedback;
}

- (NSArray)photoList
{
  id v2 = [(NSMutableArray *)self->_photos copy];

  return (NSArray *)v2;
}

- (void)addPhoto:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_photos, "containsObject:") & 1) == 0) {
    [(NSMutableArray *)self->_photos addObject:v4];
  }
}

- (GEORPFeedbackUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSubmissionIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_incidentFeedback, 0);
  objc_storeStrong((id *)&self->_poiEnrichment, 0);

  objc_storeStrong((id *)&self->_photos, 0);
}

@end