@interface SUUIApplicationLicensePage
- (NSString)licenseAgreementHTML;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLicenseAgreementHTML:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIApplicationLicensePage

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setLicenseAgreementHTML:self->_licenseAgreementHTML];
  [v4 setTitle:self->_title];
  return v4;
}

- (NSString)licenseAgreementHTML
{
  return self->_licenseAgreementHTML;
}

- (void)setLicenseAgreementHTML:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_licenseAgreementHTML, 0);
}

@end