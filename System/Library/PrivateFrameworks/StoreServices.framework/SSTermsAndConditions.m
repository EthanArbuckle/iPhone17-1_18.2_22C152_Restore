@interface SSTermsAndConditions
- (BOOL)isUserAccepted;
- (BOOL)requiresAuthentication;
- (NSString)currentText;
- (SSTermsAndConditions)initWithResponseData:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)currentVersionIdentifier;
- (void)dealloc;
- (void)setCurrentText:(id)a3;
- (void)setCurrentVersionIdentifier:(int64_t)a3;
- (void)setUserAccepted:(BOOL)a3;
@end

@implementation SSTermsAndConditions

- (SSTermsAndConditions)initWithResponseData:(id)a3 error:(id *)a4
{
  v21 = 0;
  v6 = (void *)[MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v21];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_18:
    if (!a4) {
      return 0;
    }
    v17 = v21;
    if (!v21) {
      v17 = (void *)SSError(@"SSErrorDomain", 100, 0, 0);
    }
    v8 = 0;
    *a4 = v17;
    return v8;
  }
  v20.receiver = self;
  v20.super_class = (Class)SSTermsAndConditions;
  v7 = [(SSTermsAndConditions *)&v20 init];
  if (!v7) {
    goto LABEL_18;
  }
  v8 = v7;
  v9 = (void *)[v6 objectForKey:@"errorNumber"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v9 integerValue];
    BOOL v12 = v10 == 5300 || v10 == 5601;
    v8->_requiresAuthentication = v12;
  }
  v13 = (void *)[v6 objectForKey:@"latestTermsVersionId"];
  if (objc_opt_respondsToSelector()) {
    v8->_versionID = [v13 longLongValue];
  }
  v14 = (void *)[v6 objectForKey:@"isCurrent"];
  if (objc_opt_respondsToSelector()) {
    v8->_userAccepted = [v14 BOOLValue];
  }
  uint64_t v15 = [v6 objectForKey:@"termsContentText"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (void *)v15;
LABEL_25:
    v8->_text = (NSString *)[v16 copy];
    return v8;
  }
  uint64_t v18 = [v6 objectForKey:@"termsContextText"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (void *)v18;
    goto LABEL_25;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSTermsAndConditions;
  [(SSTermsAndConditions *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 8) = self->_requiresAuthentication;
  *(void *)(v5 + 16) = [(NSString *)self->_text copyWithZone:a3];
  *(unsigned char *)(v5 + 24) = self->_userAccepted;
  *(void *)(v5 + 32) = self->_versionID;
  return (id)v5;
}

- (NSString)currentText
{
  return self->_text;
}

- (void)setCurrentText:(id)a3
{
  self->_text = (NSString *)a3;
}

- (int64_t)currentVersionIdentifier
{
  return self->_versionID;
}

- (void)setCurrentVersionIdentifier:(int64_t)a3
{
  self->_versionID = a3;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (BOOL)isUserAccepted
{
  return self->_userAccepted;
}

- (void)setUserAccepted:(BOOL)a3
{
  self->_userAccepted = a3;
}

@end