@interface ReaderAnalyticsData
+ (BOOL)supportsSecureCoding;
- (ReaderAnalyticsData)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ReaderAnalyticsData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ReaderAnalyticsData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ReaderAnalyticsData;
  v5 = [(ReaderAnalyticsData *)&v15 init];
  if (v5)
  {
    v5->_trusted = [v4 decodeBoolForKey:@"trusted"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"untrustedIdentifier"];
    untrustedIdentifier = v5->_untrustedIdentifier;
    v5->_untrustedIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"untrustedOrganization"];
    untrustedOrganization = v5->_untrustedOrganization;
    v5->_untrustedOrganization = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"untrustedIssuerIdentifier"];
    untrustedIssuerIdentifier = v5->_untrustedIssuerIdentifier;
    v5->_untrustedIssuerIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"untrustedIssuerOrganization"];
    untrustedIssuerOrganization = v5->_untrustedIssuerOrganization;
    v5->_untrustedIssuerOrganization = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL trusted = self->_trusted;
  id v5 = a3;
  [v5 encodeBool:trusted forKey:@"trusted"];
  [v5 encodeObject:self->_untrustedIdentifier forKey:@"untrustedIdentifier"];
  [v5 encodeObject:self->_untrustedOrganization forKey:@"untrustedOrganization"];
  [v5 encodeObject:self->_untrustedIssuerIdentifier forKey:@"untrustedIssuerIdentifier"];
  [v5 encodeObject:self->_untrustedIssuerOrganization forKey:@"untrustedIssuerOrganization"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = @"NO";
  if (self)
  {
    if (self->_trusted) {
      uint64_t v6 = @"YES";
    }
    v7 = self->_untrustedIdentifier;
    uint64_t v8 = self->_untrustedOrganization;
    v9 = self->_untrustedIssuerIdentifier;
    untrustedIssuerOrganization = self->_untrustedIssuerOrganization;
  }
  else
  {
    v9 = 0;
    v7 = 0;
    uint64_t v8 = 0;
    untrustedIssuerOrganization = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@; BOOL trusted = %@; untrustedIdentifier = %@; untrustedOrganization = %@; untrustedIssuerIdentifier = %@; untrustedIssuerOrganization = %@>",
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = untrustedIssuerOrganization);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untrustedIssuerOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIssuerIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIdentifier, 0);
}

@end