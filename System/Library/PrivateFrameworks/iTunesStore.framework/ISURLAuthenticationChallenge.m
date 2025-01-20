@interface ISURLAuthenticationChallenge
+ (id)_messageForProtectionSpace:(id)a3;
+ (id)_titleForProtectionSpace:(id)a3;
- (BOOL)hasPassword;
- (ISURLAuthenticationChallenge)initWithAuthenticationChallenge:(id)a3;
- (id)password;
- (id)sender;
- (id)user;
- (int64_t)failureCount;
- (void)cancelAuthentication;
- (void)useCredential:(id)a3;
@end

@implementation ISURLAuthenticationChallenge

- (ISURLAuthenticationChallenge)initWithAuthenticationChallenge:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ISURLAuthenticationChallenge;
  v4 = -[ISAuthenticationChallenge initWithAuthenticationChallenge:](&v7, sel_initWithAuthenticationChallenge_);
  if (v4)
  {
    uint64_t v5 = [a3 protectionSpace];
    v4->super._localizedMessage = (NSString *)(id)[(id)objc_opt_class() _messageForProtectionSpace:v5];
    v4->super._localizedTitle = (NSString *)(id)[(id)objc_opt_class() _titleForProtectionSpace:v5];
  }
  return v4;
}

- (void)cancelAuthentication
{
  id v3 = [(ISURLAuthenticationChallenge *)self sender];
  challenge = self->super._challenge;

  [v3 cancelAuthenticationChallenge:challenge];
}

- (int64_t)failureCount
{
  return [(NSURLAuthenticationChallenge *)self->super._challenge previousFailureCount];
}

- (BOOL)hasPassword
{
  v2 = [(NSURLAuthenticationChallenge *)self->super._challenge proposedCredential];

  return [(NSURLCredential *)v2 hasPassword];
}

- (id)password
{
  v2 = [(NSURLAuthenticationChallenge *)self->super._challenge proposedCredential];

  return [(NSURLCredential *)v2 password];
}

- (id)sender
{
  return [(NSURLAuthenticationChallenge *)self->super._challenge sender];
}

- (id)user
{
  v2 = [(NSURLAuthenticationChallenge *)self->super._challenge proposedCredential];

  return [(NSURLCredential *)v2 user];
}

- (void)useCredential:(id)a3
{
  id v5 = [(ISURLAuthenticationChallenge *)self sender];
  challenge = self->super._challenge;

  [v5 useCredential:a3 forAuthenticationChallenge:challenge];
}

+ (id)_messageForProtectionSpace:(id)a3
{
  v4 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v5 = [a3 host];
  uint64_t v6 = [a3 port];
  if (v6 >= 1) {
    uint64_t v5 = [NSString stringWithFormat:@"%@:%ld", v5, v6];
  }
  int v7 = [a3 isProxy];
  v8 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v7)
  {
    uint64_t v9 = [v8 localizedStringForKey:@"PROXY_AUTHENTICATION_MESSAGE_%@_%@" value:&stru_26C6A2310 table:0];
    uint64_t v10 = [NSString stringWithValidatedFormat:v9, @"%@%@", 0, objc_msgSend(a3, "protocol"), v5 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v11 = [v8 localizedStringForKey:@"SERVER_AUTHENTICATION_MESSAGE_%@" value:&stru_26C6A2310 table:0];
    uint64_t v10 = [NSString stringWithValidatedFormat:v11, @"%@", 0, v5, v14 validFormatSpecifiers error];
  }
  [v4 appendString:v10];
  if ([a3 receivesCredentialSecurely]) {
    v12 = @"SECURE_AUTH";
  }
  else {
    v12 = @"INSECURE_AUTH";
  }
  [v4 appendFormat:@" %@", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v12, &stru_26C6A2310, 0)];
  return v4;
}

+ (id)_titleForProtectionSpace:(id)a3
{
  if ([a3 isProxy]) {
    id v3 = @"PROXY_AUTHENTICATION_TITLE";
  }
  else {
    id v3 = @"SERVER_AUTHENTICATION_TITLE";
  }
  v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return (id)[v4 localizedStringForKey:v3 value:&stru_26C6A2310 table:0];
}

@end