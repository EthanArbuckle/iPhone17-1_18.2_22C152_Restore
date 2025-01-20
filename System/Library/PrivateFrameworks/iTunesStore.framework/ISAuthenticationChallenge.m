@interface ISAuthenticationChallenge
- (BOOL)hasPassword;
- (BOOL)userNameIsEditable;
- (BOOL)userNameIsEmail;
- (ISAuthenticationChallenge)initWithAuthenticationChallenge:(id)a3;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (NSString)password;
- (NSString)user;
- (NSURLAuthenticationChallengeSender)sender;
- (int64_t)failureCount;
- (void)cancelAuthentication;
- (void)dealloc;
- (void)setLocalizedMessage:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)useCredential:(id)a3;
@end

@implementation ISAuthenticationChallenge

- (ISAuthenticationChallenge)initWithAuthenticationChallenge:(id)a3
{
  v4 = [(ISAuthenticationChallenge *)self init];
  if (v4) {
    v4->_challenge = (NSURLAuthenticationChallenge *)a3;
  }
  return v4;
}

- (void)dealloc
{
  [(ISAuthenticationChallenge *)self setLocalizedMessage:0];
  [(ISAuthenticationChallenge *)self setLocalizedTitle:0];

  self->_challenge = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISAuthenticationChallenge;
  [(ISAuthenticationChallenge *)&v3 dealloc];
}

- (void)cancelAuthentication
{
  objc_super v3 = [(ISAuthenticationChallenge *)self sender];
  challenge = self->_challenge;

  [(NSURLAuthenticationChallengeSender *)v3 cancelAuthenticationChallenge:challenge];
}

- (int64_t)failureCount
{
  return 0;
}

- (BOOL)hasPassword
{
  return 0;
}

- (NSString)password
{
  return 0;
}

- (NSURLAuthenticationChallengeSender)sender
{
  return 0;
}

- (NSString)user
{
  return 0;
}

- (void)useCredential:(id)a3
{
  v5 = [(ISAuthenticationChallenge *)self sender];
  challenge = self->_challenge;

  [(NSURLAuthenticationChallengeSender *)v5 useCredential:a3 forAuthenticationChallenge:challenge];
}

- (BOOL)userNameIsEditable
{
  return 1;
}

- (BOOL)userNameIsEmail
{
  return 0;
}

- (NSString)localizedMessage
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalizedMessage:(id)a3
{
}

- (NSString)localizedTitle
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedTitle:(id)a3
{
}

@end