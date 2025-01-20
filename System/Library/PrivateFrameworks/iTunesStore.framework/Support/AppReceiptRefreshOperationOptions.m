@interface AppReceiptRefreshOperationOptions
- (AppReceiptRefreshOperationOptions)initWithReceiptFlags:(unint64_t)a3;
- (BOOL)needsAuthentication;
- (BOOL)performSinfMirartionCheckBeforeFailing;
- (NSNumber)targetAccount;
- (NSString)URLBagKey;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)authenticationPromptStyle;
- (unint64_t)receiptFlags;
- (void)setAuthenticationPromptStyle:(int64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setPerformSinfMirartionCheckBeforeFailing:(BOOL)a3;
- (void)setReceiptFlags:(unint64_t)a3;
- (void)setTargetAccount:(id)a3;
@end

@implementation AppReceiptRefreshOperationOptions

- (AppReceiptRefreshOperationOptions)initWithReceiptFlags:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AppReceiptRefreshOperationOptions;
  result = [(AppReceiptRefreshOperationOptions *)&v5 init];
  if (result)
  {
    result->_authenticationPromptStyle = 0;
    result->_flags = a3;
    result->_needsAuthentication = (a3 & 0xB) == 0;
  }
  return result;
}

- (NSString)URLBagKey
{
  if ((self->_flags & 0xB) != 0) {
    return (NSString *)@"renew-vpp-receipt";
  }
  else {
    return (NSString *)@"app-receipt-create";
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_authenticationPromptStyle;
  id v6 = [(NSString *)self->_bundleIdentifier copy];
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[3] = self->_flags;
  *((unsigned char *)v5 + 32) = self->_needsAuthentication;
  *((unsigned char *)v5 + 33) = self->_performSinfMirartionCheckBeforeFailing;
  id v8 = [(NSNumber *)self->_targetAccount copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  return v5;
}

- (int64_t)authenticationPromptStyle
{
  return self->_authenticationPromptStyle;
}

- (void)setAuthenticationPromptStyle:(int64_t)a3
{
  self->_authenticationPromptStyle = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (BOOL)performSinfMirartionCheckBeforeFailing
{
  return self->_performSinfMirartionCheckBeforeFailing;
}

- (void)setPerformSinfMirartionCheckBeforeFailing:(BOOL)a3
{
  self->_performSinfMirartionCheckBeforeFailing = a3;
}

- (unint64_t)receiptFlags
{
  return self->_flags;
}

- (void)setReceiptFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSNumber)targetAccount
{
  return self->_targetAccount;
}

- (void)setTargetAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAccount, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end