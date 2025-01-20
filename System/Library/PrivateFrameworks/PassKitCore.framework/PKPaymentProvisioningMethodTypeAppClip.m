@interface PKPaymentProvisioningMethodTypeAppClip
- (NSURL)appClipLaunchURL;
- (PKPaymentProvisioningMethodTypeAppClip)initWithCoder:(id)a3;
- (PKPaymentProvisioningMethodTypeAppClip)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_decorateDescription:(id)a3;
- (void)encodeWithCode:(id)a3;
@end

@implementation PKPaymentProvisioningMethodTypeAppClip

- (PKPaymentProvisioningMethodTypeAppClip)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentProvisioningMethodTypeAppClip;
  v5 = [(PKPaymentProvisioningMethod *)&v11 initWithDictionary:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [v4 PKStringForKey:@"appClipLaunchURL"];
    uint64_t v8 = [v6 URLWithString:v7];
    appClipLaunchURL = v5->_appClipLaunchURL;
    v5->_appClipLaunchURL = (NSURL *)v8;
  }
  return v5;
}

- (void)_decorateDescription:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethodTypeAppClip;
  id v4 = a3;
  [(PKPaymentProvisioningMethod *)&v5 _decorateDescription:v4];
  [v4 appendFormat:@"appClipLaunchURL: '%@'; ", self->_appClipLaunchURL];
}

- (PKPaymentProvisioningMethodTypeAppClip)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentProvisioningMethodTypeAppClip;
  objc_super v5 = [(PKPaymentProvisioningMethod *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appClipLaunchURL"];
    appClipLaunchURL = v5->_appClipLaunchURL;
    v5->_appClipLaunchURL = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCode:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethodTypeAppClip;
  id v4 = a3;
  [(PKPaymentProvisioningMethod *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_appClipLaunchURL, @"appClipLaunchURL", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_alloc_init(PKPaymentProvisioningMethodTypeAppClip);
  [(PKPaymentProvisioningMethod *)self _copyInto:v5];
  uint64_t v6 = [(NSURL *)self->_appClipLaunchURL copyWithZone:a3];
  appClipLaunchURL = v5->_appClipLaunchURL;
  v5->_appClipLaunchURL = (NSURL *)v6;

  return v5;
}

- (NSURL)appClipLaunchURL
{
  return self->_appClipLaunchURL;
}

- (void).cxx_destruct
{
}

@end