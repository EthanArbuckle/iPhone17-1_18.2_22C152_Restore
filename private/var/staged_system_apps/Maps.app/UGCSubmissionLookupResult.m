@interface UGCSubmissionLookupResult
+ (int64_t)_statusFromError:(id)a3;
- (BOOL)hasRatingsWithICloud;
- (BOOL)hasUserUploadedImages;
- (GEORPPoiEnrichment)previousSubmission;
- (NSString)parentSubmissionIdentifier;
- (NSString)photosSubmissionIdentifier;
- (NSString)ratingsSubmissionIdentifier;
- (UGCSubmissionLookupResult)initWithError:(id)a3;
- (UGCSubmissionLookupResult)initWithRatingsSubmissionIdentifier:(id)a3 photosSubmissionIdentifier:(id)a4 previousSubmission:(id)a5;
- (UGCSubmissionLookupResult)initWithSubmissionIdentifier:(id)a3 previousSubmission:(id)a4;
- (int64_t)status;
- (void)setHasRatingsWithICloud:(BOOL)a3;
@end

@implementation UGCSubmissionLookupResult

- (UGCSubmissionLookupResult)initWithSubmissionIdentifier:(id)a3 previousSubmission:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCSubmissionLookupResult;
  v9 = [(UGCSubmissionLookupResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentSubmissionIdentifier, a3);
    objc_storeStrong((id *)&v10->_previousSubmission, a4);
    v10->_status = 1;
  }

  return v10;
}

- (UGCSubmissionLookupResult)initWithRatingsSubmissionIdentifier:(id)a3 photosSubmissionIdentifier:(id)a4 previousSubmission:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UGCSubmissionLookupResult;
  objc_super v12 = [(UGCSubmissionLookupResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ratingsSubmissionIdentifier, a3);
    objc_storeStrong((id *)&v13->_photosSubmissionIdentifier, a4);
    objc_storeStrong((id *)&v13->_previousSubmission, a5);
    v13->_status = 1;
  }

  return v13;
}

- (UGCSubmissionLookupResult)initWithError:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UGCSubmissionLookupResult;
  v5 = [(UGCSubmissionLookupResult *)&v7 init];
  if (v5) {
    v5->_status = +[UGCSubmissionLookupResult _statusFromError:v4];
  }

  return v5;
}

+ (int64_t)_statusFromError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    v6 = GEOErrorDomain();
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7 && [v4 code] == (id)-8)
    {
      int64_t v8 = 3;
    }
    else if ((unint64_t)(MKCurrentNetworkConnectionFailureDiagnosis() - 1) >= 3)
    {
      int64_t v8 = 2;
    }
    else
    {
      int64_t v8 = 4;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (BOOL)hasUserUploadedImages
{
  v2 = [(UGCSubmissionLookupResult *)self previousSubmission];
  id v3 = [v2 images];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (GEORPPoiEnrichment)previousSubmission
{
  return self->_previousSubmission;
}

- (NSString)ratingsSubmissionIdentifier
{
  return self->_ratingsSubmissionIdentifier;
}

- (NSString)photosSubmissionIdentifier
{
  return self->_photosSubmissionIdentifier;
}

- (BOOL)hasRatingsWithICloud
{
  return self->_hasRatingsWithICloud;
}

- (void)setHasRatingsWithICloud:(BOOL)a3
{
  self->_hasRatingsWithICloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosSubmissionIdentifier, 0);
  objc_storeStrong((id *)&self->_ratingsSubmissionIdentifier, 0);
  objc_storeStrong((id *)&self->_previousSubmission, 0);

  objc_storeStrong((id *)&self->_parentSubmissionIdentifier, 0);
}

@end