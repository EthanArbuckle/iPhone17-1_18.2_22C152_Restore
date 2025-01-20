@interface PDSharingStatefulProvisioningOperation
- (BOOL)isForegroundOperation;
- (BOOL)isWaitingOnUserAction;
- (BOOL)requiresSenderActivationVerification;
- (NSString)shareIdentifier;
- (NSString)transportIdentifier;
- (id)completion;
- (id)copyWithoutCompletion;
- (id)description;
- (void)setCompletion:(id)a3;
- (void)setIsForegroundOperation:(BOOL)a3;
- (void)setIsWaitingOnUserAction:(BOOL)a3;
- (void)setRequiresSenderActivationVerification:(BOOL)a3;
- (void)setShareIdentifier:(id)a3;
- (void)setTransportIdentifier:(id)a3;
@end

@implementation PDSharingStatefulProvisioningOperation

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p; ", v4, self];

  [v5 appendFormat:@"shareIdentifier: '%@'; ", self->_shareIdentifier];
  v6 = PKSharingLoggableMailboxAddress();
  [v5 appendFormat:@"transportIdentifier: '%@'; ", v6];

  if (self->_isForegroundOperation) {
    CFStringRef v7 = @"Yes";
  }
  else {
    CFStringRef v7 = @"No";
  }
  [v5 appendFormat:@"foreground: '%@'; ", v7];
  if (self->_isWaitingOnUserAction) {
    CFStringRef v8 = @"Yes";
  }
  else {
    CFStringRef v8 = @"No";
  }
  [v5 appendFormat:@"isWaitingOnUserAction: '%@'; ", v8];
  if (self->_requiresSenderActivationVerification) {
    CFStringRef v9 = @"Yes";
  }
  else {
    CFStringRef v9 = @"No";
  }
  [v5 appendFormat:@"requiresSenderActivationVerification: '%@'; ", v9];
  [v5 appendFormat:@">"];
  v10 = +[NSString stringWithString:v5];

  return v10;
}

- (id)copyWithoutCompletion
{
  v3 = objc_alloc_init(PDSharingStatefulProvisioningOperation);
  v4 = (NSString *)[(NSString *)self->_shareIdentifier copy];
  shareIdentifier = v3->_shareIdentifier;
  v3->_shareIdentifier = v4;

  v6 = (NSString *)[(NSString *)self->_transportIdentifier copy];
  transportIdentifier = v3->_transportIdentifier;
  v3->_transportIdentifier = v6;

  v3->_isForegroundOperation = self->_isForegroundOperation;
  v3->_isWaitingOnUserAction = self->_isWaitingOnUserAction;
  v3->_requiresSenderActivationVerification = self->_requiresSenderActivationVerification;
  return v3;
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
}

- (BOOL)isForegroundOperation
{
  return self->_isForegroundOperation;
}

- (void)setIsForegroundOperation:(BOOL)a3
{
  self->_isForegroundOperation = a3;
}

- (BOOL)isWaitingOnUserAction
{
  return self->_isWaitingOnUserAction;
}

- (void)setIsWaitingOnUserAction:(BOOL)a3
{
  self->_isWaitingOnUserAction = a3;
}

- (BOOL)requiresSenderActivationVerification
{
  return self->_requiresSenderActivationVerification;
}

- (void)setRequiresSenderActivationVerification:(BOOL)a3
{
  self->_requiresSenderActivationVerification = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
}

@end