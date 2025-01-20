@interface APMetricHTTPDeliveryRequest
+ (BOOL)supportsSecureCoding;
- (APDestination)destination;
- (APFakeNetworkResponse)fakeNetworkResponse;
- (APMetricHTTPDeliveryRequest)initWithCoder:(id)a3;
- (NSArray)batchInfos;
- (NSData)data;
- (NSDictionary)headers;
- (NSString)billing;
- (NSString)signature;
- (id)buildSignatureUsingSigningAuthority:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBatchInfos:(id)a3;
- (void)setBilling:(id)a3;
- (void)setData:(id)a3;
- (void)setDestination:(id)a3;
- (void)setFakeNetworkResponse:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation APMetricHTTPDeliveryRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(APMetricHTTPDeliveryRequest *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  v6 = [(APMetricHTTPDeliveryRequest *)self billing];
  [v4 encodeObject:v6 forKey:@"billing"];

  v7 = [(APMetricHTTPDeliveryRequest *)self headers];
  [v4 encodeObject:v7 forKey:@"headers"];

  v8 = [(APMetricHTTPDeliveryRequest *)self destination];
  v9 = [v8 value];
  [v4 encodeObject:v9 forKey:@"destination"];

  id v10 = [(APMetricHTTPDeliveryRequest *)self signature];
  [v4 encodeObject:v10 forKey:@"signature"];
}

- (APMetricHTTPDeliveryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(APMetricHTTPDeliveryRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billing"];
    billing = v5->_billing;
    v5->_billing = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"headers"];
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v13;

    v15 = [APDestination alloc];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
    v17 = [(APDestination *)v15 initWithString:v16];
    destination = v5->_destination;
    v5->_destination = v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSString *)v19;
  }
  return v5;
}

- (id)buildSignatureUsingSigningAuthority:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(APMetricHTTPDeliveryRequest *)self data];
  uint64_t v8 = [v6 signatureForData:v7 error:a4];

  v9 = [v8 base64EncodedStringWithOptions:32];
  [(APMetricHTTPDeliveryRequest *)self setSignature:v9];

  uint64_t v10 = [(APMetricHTTPDeliveryRequest *)self signature];

  return v10;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)billing
{
  return self->_billing;
}

- (void)setBilling:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (APDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSArray)batchInfos
{
  return self->_batchInfos;
}

- (void)setBatchInfos:(id)a3
{
}

- (APFakeNetworkResponse)fakeNetworkResponse
{
  return self->_fakeNetworkResponse;
}

- (void)setFakeNetworkResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, 0);
  objc_storeStrong((id *)&self->_batchInfos, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_billing, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end