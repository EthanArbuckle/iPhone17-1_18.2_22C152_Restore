@interface ISStoreAuthenticationChallenge
- (BOOL)hasPassword;
- (BOOL)userNameIsEditable;
- (BOOL)userNameIsEmail;
- (ISStoreAuthenticationChallenge)init;
- (NSString)password;
- (NSString)user;
- (NSURLAuthenticationChallengeSender)sender;
- (int64_t)failureCount;
- (void)dealloc;
- (void)setFailureCount:(int64_t)a3;
- (void)setHasPassword:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setSender:(id)a3;
- (void)setUser:(id)a3;
- (void)setUserNameIsEditable:(BOOL)a3;
@end

@implementation ISStoreAuthenticationChallenge

- (ISStoreAuthenticationChallenge)init
{
  v4.receiver = self;
  v4.super_class = (Class)ISStoreAuthenticationChallenge;
  v2 = [(ISStoreAuthenticationChallenge *)&v4 init];
  if (v2)
  {
    -[ISAuthenticationChallenge setLocalizedTitle:](v2, "setLocalizedTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ENTER_PASSWORD", &stru_26C6A2310, 0));
    [(ISStoreAuthenticationChallenge *)v2 setUserNameIsEditable:1];
  }
  return v2;
}

- (void)dealloc
{
  [(ISStoreAuthenticationChallenge *)self setPassword:0];
  [(ISStoreAuthenticationChallenge *)self setUser:0];
  v3.receiver = self;
  v3.super_class = (Class)ISStoreAuthenticationChallenge;
  [(ISAuthenticationChallenge *)&v3 dealloc];
}

- (BOOL)userNameIsEmail
{
  return 1;
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
}

- (BOOL)hasPassword
{
  return self->_hasPassword;
}

- (void)setHasPassword:(BOOL)a3
{
  self->_hasPassword = a3;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPassword:(id)a3
{
}

- (NSURLAuthenticationChallengeSender)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  self->_sender = (NSURLAuthenticationChallengeSender *)a3;
}

- (NSString)user
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUser:(id)a3
{
}

- (BOOL)userNameIsEditable
{
  return self->_userNameIsEditable;
}

- (void)setUserNameIsEditable:(BOOL)a3
{
  self->_userNameIsEditable = a3;
}

@end