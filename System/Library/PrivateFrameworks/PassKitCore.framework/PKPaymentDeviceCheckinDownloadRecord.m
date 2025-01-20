@interface PKPaymentDeviceCheckinDownloadRecord
+ (BOOL)supportsSecureCoding;
- (NSData)responseData;
- (NSString)region;
- (NSUUID)identifier;
- (PKPaymentDeviceCheckinDownloadRecord)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRegion:(id)a3;
- (void)setResponseData:(id)a3;
@end

@implementation PKPaymentDeviceCheckinDownloadRecord

- (PKPaymentDeviceCheckinDownloadRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentDeviceCheckinDownloadRecord;
  v5 = [(PKPaymentBackgroundDownloadRecord *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    [(PKPaymentDeviceCheckinDownloadRecord *)v5 setRegion:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(PKPaymentDeviceCheckinDownloadRecord *)v5 setIdentifier:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseData"];
    [(PKPaymentDeviceCheckinDownloadRecord *)v5 setResponseData:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentDeviceCheckinDownloadRecord;
  id v4 = a3;
  [(PKPaymentBackgroundDownloadRecord *)&v8 encodeWithCoder:v4];
  v5 = [(PKPaymentDeviceCheckinDownloadRecord *)self region];
  [v4 encodeObject:v5 forKey:@"region"];

  v6 = [(PKPaymentDeviceCheckinDownloadRecord *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(PKPaymentDeviceCheckinDownloadRecord *)self responseData];
  [v4 encodeObject:v7 forKey:@"responseData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end