@interface UGCSubmissionParameters
- (GEOMapServiceTraits)traits;
- (GEORPFeedbackRequestParameters)requestParams;
- (NSArray)attachedImages;
- (UGCSubmissionParameters)initWithRequestParameters:(id)a3 attachedImages:(id)a4;
@end

@implementation UGCSubmissionParameters

- (UGCSubmissionParameters)initWithRequestParameters:(id)a3 attachedImages:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UGCSubmissionParameters;
  v9 = [(UGCSubmissionParameters *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestParams, a3);
    v11 = +[MKMapService sharedService];
    uint64_t v12 = [v11 defaultTraits];
    traits = v10->_traits;
    v10->_traits = (GEOMapServiceTraits *)v12;

    if ((sub_10098FF44() & 1) == 0) {
      [(GEOMapServiceTraits *)v10->_traits setDeviceLocation:0];
    }
    objc_storeStrong((id *)&v10->_attachedImages, a4);
  }

  return v10;
}

- (GEORPFeedbackRequestParameters)requestParams
{
  return self->_requestParams;
}

- (NSArray)attachedImages
{
  return self->_attachedImages;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_attachedImages, 0);

  objc_storeStrong((id *)&self->_requestParams, 0);
}

@end