@interface SFStartNetworkSearchFeedback
+ (BOOL)supportsSecureCoding;
- (NSDictionary)headers;
- (NSString)experimentId;
- (NSString)treatmentId;
- (NSString)url;
- (SFIndexState)indexState;
- (SFStartNetworkSearchFeedback)initWithCoder:(id)a3;
- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7;
- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7 queryId:(unint64_t)a8;
- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7 queryId:(unint64_t)a8 experimentId:(id)a9 treatmentId:(id)a10;
- (unint64_t)compressedRequestSize;
- (unint64_t)endpoint;
- (unint64_t)rawRequestSize;
- (void)encodeWithCoder:(id)a3;
- (void)setCompressedRequestSize:(unint64_t)a3;
- (void)setEndpoint:(unint64_t)a3;
- (void)setExperimentId:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setIndexState:(id)a3;
- (void)setRawRequestSize:(unint64_t)a3;
- (void)setTreatmentId:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SFStartNetworkSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexState, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setIndexState:(id)a3
{
}

- (SFIndexState)indexState
{
  return self->_indexState;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setCompressedRequestSize:(unint64_t)a3
{
  self->_compressedRequestSize = a3;
}

- (unint64_t)compressedRequestSize
{
  return self->_compressedRequestSize;
}

- (void)setRawRequestSize:(unint64_t)a3
{
  self->_rawRequestSize = a3;
}

- (unint64_t)rawRequestSize
{
  return self->_rawRequestSize;
}

- (void)setEndpoint:(unint64_t)a3
{
  self->_endpoint = a3;
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (void)setHeaders:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStartNetworkSearchFeedback;
  id v4 = a3;
  [(SFStartSearchFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, @"url", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_headers forKey:@"headers"];
  [v4 encodeInteger:self->_endpoint forKey:@"endpoint"];
  [v4 encodeObject:self->_indexState forKey:@"_indexState"];
}

- (SFStartNetworkSearchFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFStartNetworkSearchFeedback;
  objc_super v5 = [(SFStartSearchFeedback *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"headers"];
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v12;

    v5->_endpoint = [v4 decodeIntegerForKey:@"endpoint"];
    uint64_t v14 = [v4 decodeObjectForKey:@"_indexState"];
    indexState = v5->_indexState;
    v5->_indexState = (SFIndexState *)v14;
  }
  return v5;
}

- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7 queryId:(unint64_t)a8 experimentId:(id)a9 treatmentId:(id)a10
{
  id v17 = a9;
  id v18 = a10;
  v19 = [(SFStartNetworkSearchFeedback *)self initWithInput:a3 url:a4 headers:a5 triggerEvent:a6 endpoint:a7 queryId:a8];
  v20 = v19;
  if (v19)
  {
    [(SFStartNetworkSearchFeedback *)v19 setExperimentId:v17];
    [(SFStartNetworkSearchFeedback *)v20 setTreatmentId:v18];
    v21 = v20;
  }

  return v20;
}

- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7 queryId:(unint64_t)a8
{
  uint64_t v9 = [(SFStartNetworkSearchFeedback *)self initWithInput:a3 url:a4 headers:a5 triggerEvent:a6 endpoint:a7];
  uint64_t v10 = v9;
  if (v9) {
    [(SFFeedback *)v9 setQueryId:a8];
  }

  return v10;
}

- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFStartNetworkSearchFeedback;
  uint64_t v14 = [(SFStartSearchFeedback *)&v20 initWithInput:a3 triggerEvent:a6];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    url = v14->_url;
    v14->_url = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    headers = v14->_headers;
    v14->_headers = (NSDictionary *)v17;

    v14->_endpoint = a7;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end