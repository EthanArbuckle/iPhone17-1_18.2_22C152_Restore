@interface NSSExternalAnalyticsRequest
+ (BOOL)supportsSecureCoding;
- (NSSExternalAnalyticsRequest)initWithCoder:(id)a3;
- (NSSExternalAnalyticsRequest)initWithURL:(id)a3 metadata:(id)a4;
- (NSSExternalAnalyticsRequestMetadata)metadata;
- (NSURL)URL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSExternalAnalyticsRequest

- (NSSExternalAnalyticsRequest)initWithURL:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NSSExternalAnalyticsRequest;
  v8 = [(NSSExternalAnalyticsRequest *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    URL = v8->_URL;
    v8->_URL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_metadata, a4);
  }

  return v8;
}

- (NSSExternalAnalyticsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"URL"];
  id v6 = [v4 decodeObjectForKey:@"metadata"];

  id v7 = [(NSSExternalAnalyticsRequest *)self initWithURL:v5 metadata:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NSSExternalAnalyticsRequest *)self URL];
  [v4 encodeObject:v5 forKey:@"URL"];

  id v6 = [(NSSExternalAnalyticsRequest *)self metadata];
  [v4 encodeObject:v6 forKey:@"metadata"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSSExternalAnalyticsRequestMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end