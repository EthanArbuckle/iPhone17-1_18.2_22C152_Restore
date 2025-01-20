@interface SKUIApplicationLicensePage
- (NSString)licenseAgreementHTML;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLicenseAgreementHTML:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIApplicationLicensePage

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIApplicationLicensePage copyWithZone:]();
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setLicenseAgreementHTML:self->_licenseAgreementHTML];
  [v5 setTitle:self->_title];
  return v5;
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

- (void)copyWithZone:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIApplicationLicensePage copyWithZone:]";
}

@end