@interface CCDEnrollmentRequest
- (CCDEnrollmentRequest)requestWithError:(id *)a3;
- (CCDRequestPayload)requestPayload;
- (NSArray)clientCertificates;
- (NSString)enrollmentURLString;
- (id)_enrollmentURL;
- (id)privateKey;
- (int64_t)requestType;
- (void)setClientCertificates:(id)a3;
- (void)setPrivateKey:(id)a3;
@end

@implementation CCDEnrollmentRequest

- (id)_enrollmentURL
{
  id v3 = objc_alloc((Class)NSURL);
  v4 = [(CCDEnrollmentRequest *)self enrollmentURLString];
  id v5 = [v3 initWithString:v4];

  return v5;
}

- (CCDEnrollmentRequest)requestWithError:(id *)a3
{
  id v5 = [(CCDEnrollmentRequest *)self requestPayload];
  v6 = [(CCDEnrollmentRequest *)self _enrollmentURL];
  v7 = [(CCDEnrollmentRequest *)self privateKey];
  v8 = [(CCDEnrollmentRequest *)self clientCertificates];
  v9 = +[CCDDeviceIdentitySupport requestWithPayload:v5 URL:v6 privateKey:v7 clientCertificates:v8 outError:a3];

  return (CCDEnrollmentRequest *)v9;
}

- (NSString)enrollmentURLString
{
  return self->_enrollmentURLString;
}

- (CCDRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (id)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCertificates, 0);
  objc_storeStrong(&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_requestPayload, 0);

  objc_storeStrong((id *)&self->_enrollmentURLString, 0);
}

@end