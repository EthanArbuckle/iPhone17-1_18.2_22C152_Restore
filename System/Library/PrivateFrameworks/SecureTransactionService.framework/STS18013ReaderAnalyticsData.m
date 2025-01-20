@interface STS18013ReaderAnalyticsData
- (BOOL)isTrusted;
- (NSString)untrustedIdentifier;
- (NSString)untrustedIssuerIdentifier;
- (NSString)untrustedIssuerOrganization;
- (NSString)untrustedOrganization;
- (STS18013ReaderAnalyticsData)initWithTrusted:(BOOL)a3 untrustedIdentifier:(id)a4 untrustedOrganization:(id)a5 untrustedIssuerIdentifier:(id)a6 untrustedIssuerOrganization:(id)a7;
- (STS18013ReaderAnalyticsData)initWithUntrustedIdentifier:(id)a3 untrustedOrganization:(id)a4;
- (id)description;
@end

@implementation STS18013ReaderAnalyticsData

- (STS18013ReaderAnalyticsData)initWithTrusted:(BOOL)a3 untrustedIdentifier:(id)a4 untrustedOrganization:(id)a5 untrustedIssuerIdentifier:(id)a6 untrustedIssuerOrganization:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)STS18013ReaderAnalyticsData;
  v17 = [(STS18013ReaderAnalyticsData *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_trusted = a3;
    objc_storeStrong((id *)&v17->_untrustedIdentifier, a4);
    objc_storeStrong((id *)&v18->_untrustedOrganization, a5);
    objc_storeStrong((id *)&v18->_untrustedIssuerIdentifier, a6);
    objc_storeStrong((id *)&v18->_untrustedIssuerOrganization, a7);
  }

  return v18;
}

- (STS18013ReaderAnalyticsData)initWithUntrustedIdentifier:(id)a3 untrustedOrganization:(id)a4
{
  return [(STS18013ReaderAnalyticsData *)self initWithTrusted:0 untrustedIdentifier:a3 untrustedOrganization:a4 untrustedIssuerIdentifier:0 untrustedIssuerOrganization:0];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if ([(STS18013ReaderAnalyticsData *)self isTrusted]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(STS18013ReaderAnalyticsData *)self untrustedIdentifier];
  v8 = [(STS18013ReaderAnalyticsData *)self untrustedOrganization];
  v9 = [(STS18013ReaderAnalyticsData *)self untrustedIssuerIdentifier];
  v10 = [(STS18013ReaderAnalyticsData *)self untrustedIssuerOrganization];
  objc_msgSend(v3, "stringWithFormat:", @"<%@; trusted = %@; untrustedIdentifier = %@; untrustedOrganization = %@; untrustedIssuerIdentifier = %@; untrustedIssuerOrganization = %@>",
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (NSString)untrustedIdentifier
{
  return self->_untrustedIdentifier;
}

- (NSString)untrustedOrganization
{
  return self->_untrustedOrganization;
}

- (NSString)untrustedIssuerIdentifier
{
  return self->_untrustedIssuerIdentifier;
}

- (NSString)untrustedIssuerOrganization
{
  return self->_untrustedIssuerOrganization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untrustedIssuerOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIssuerIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIdentifier, 0);
}

@end