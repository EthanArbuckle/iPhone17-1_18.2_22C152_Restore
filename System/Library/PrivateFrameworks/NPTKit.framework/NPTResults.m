@interface NPTResults
+ (BOOL)supportsSecureCoding;
- (NPTMetricResult)downloadResults;
- (NPTMetricResult)uploadResults;
- (NPTPingResult)pingResults;
- (NPTResults)initWithCoder:(id)a3;
- (NSDictionary)asDictionary;
- (NSDictionary)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadResults:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPingResults:(id)a3;
- (void)setUploadResults:(id)a3;
@end

@implementation NPTResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(NPTResults *)self downloadResults];

  if (v4)
  {
    v5 = [(NPTResults *)self downloadResults];
    v6 = [v5 asDictionary];
    [v3 setValue:v6 forKey:@"download_results"];
  }
  v7 = [(NPTResults *)self uploadResults];

  if (v7)
  {
    v8 = [(NPTResults *)self uploadResults];
    v9 = [v8 asDictionary];
    [v3 setValue:v9 forKey:@"upload_results"];
  }
  v10 = [(NPTResults *)self pingResults];

  if (v10)
  {
    v11 = [(NPTResults *)self pingResults];
    v12 = [v11 asDictionary];
    [v3 setValue:v12 forKey:@"ping_results"];
  }
  v13 = [(NPTResults *)self metadata];

  if (v13)
  {
    v14 = [(NPTResults *)self metadata];
    [v3 setValue:v14 forKey:@"metadata"];
  }
  v15 = [NSDictionary dictionaryWithDictionary:v3];

  return (NSDictionary *)v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NPTResults *)self downloadResults];
  [v4 encodeObject:v5 forKey:@"downloadResults"];

  v6 = [(NPTResults *)self uploadResults];
  [v4 encodeObject:v6 forKey:@"uploadResults"];

  v7 = [(NPTResults *)self pingResults];
  [v4 encodeObject:v7 forKey:@"pingResults"];

  id v8 = [(NPTResults *)self metadata];
  [v4 encodeObject:v8 forKey:@"metadata"];
}

- (NPTResults)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NPTResults;
  id v3 = a3;
  id v4 = [(NPTResults *)&v10 init];
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"downloadResults", v10.receiver, v10.super_class);
  [(NPTResults *)v4 setDownloadResults:v5];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"uploadResults"];
  [(NPTResults *)v4 setUploadResults:v6];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pingResults"];
  [(NPTResults *)v4 setPingResults:v7];

  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];

  [(NPTResults *)v4 setMetadata:v8];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPTResults allocWithZone:a3] init];
  v5 = [(NPTResults *)self downloadResults];
  [(NPTResults *)v4 setDownloadResults:v5];

  v6 = [(NPTResults *)self uploadResults];
  [(NPTResults *)v4 setUploadResults:v6];

  v7 = [(NPTResults *)self pingResults];
  [(NPTResults *)v4 setPingResults:v7];

  id v8 = [(NPTResults *)self metadata];
  [(NPTResults *)v4 setMetadata:v8];

  return v4;
}

- (NPTMetricResult)downloadResults
{
  return self->_downloadResults;
}

- (void)setDownloadResults:(id)a3
{
}

- (NPTMetricResult)uploadResults
{
  return self->_uploadResults;
}

- (void)setUploadResults:(id)a3
{
}

- (NPTPingResult)pingResults
{
  return self->_pingResults;
}

- (void)setPingResults:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_pingResults, 0);
  objc_storeStrong((id *)&self->_uploadResults, 0);

  objc_storeStrong((id *)&self->_downloadResults, 0);
}

@end