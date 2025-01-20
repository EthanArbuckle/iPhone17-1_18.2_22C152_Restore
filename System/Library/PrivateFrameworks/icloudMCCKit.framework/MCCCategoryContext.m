@interface MCCCategoryContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isNonPersonalAccount;
- (BOOL)isSenderInAddressBook;
- (BOOL)isSenderPrimary;
- (BOOL)isSenderRecentContact;
- (BOOL)isSenderVIP;
- (BOOL)isUnsubscribeHeaderPresent;
- (MCCCategoryContext)initWithCoder:(id)a3;
- (NSString)emailSubject;
- (NSString)localRuleCategory;
- (NSString)receiverEmail;
- (NSString)senderEmail;
- (NSString)senderName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringValue;
- (void)encodeWithCoder:(id)a3;
- (void)setEmailSubject:(id)a3;
- (void)setIsNonPersonalAccount:(BOOL)a3;
- (void)setIsSenderInAddressBook:(BOOL)a3;
- (void)setIsSenderPrimary:(BOOL)a3;
- (void)setIsSenderRecentContact:(BOOL)a3;
- (void)setIsSenderVIP:(BOOL)a3;
- (void)setIsUnsubscribeHeaderPresent:(BOOL)a3;
- (void)setLocalRuleCategory:(id)a3;
- (void)setReceiverEmail:(id)a3;
- (void)setSenderEmail:(id)a3;
- (void)setSenderName:(id)a3;
@end

@implementation MCCCategoryContext

- (MCCCategoryContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MCCCategoryContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_senderNAme"];
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_senderEmail"];
    senderEmail = v5->_senderEmail;
    v5->_senderEmail = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recipientEmail"];
    receiverEmail = v5->_receiverEmail;
    v5->_receiverEmail = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subject"];
    emailSubject = v5->_emailSubject;
    v5->_emailSubject = (NSString *)v12;

    v5->_isUnsubscribeHeaderPresent = [v4 decodeBoolForKey:@"_unsubscribed"];
    v5->_isSenderVIP = [v4 decodeBoolForKey:@"_isVIP"];
    v5->_isSenderInAddressBook = [v4 decodeBoolForKey:@"_inAddressBook"];
    v5->_isSenderRecentContact = [v4 decodeBoolForKey:@"_recentContact"];
    v5->_isSenderPrimary = [v4 decodeBoolForKey:@"_senderPrimary"];
    v5->_isNonPersonalAccount = [v4 decodeBoolForKey:@"_isNonPersonalAccount"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localRuleCategory"];
    localRuleCategory = v5->_localRuleCategory;
    v5->_localRuleCategory = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  senderName = self->_senderName;
  id v5 = a3;
  [v5 encodeObject:senderName forKey:@"_senderNAme"];
  [v5 encodeObject:self->_senderEmail forKey:@"_senderEmail"];
  [v5 encodeObject:self->_receiverEmail forKey:@"_recipientEmail"];
  [v5 encodeObject:self->_emailSubject forKey:@"_subject"];
  [v5 encodeBool:self->_isUnsubscribeHeaderPresent forKey:@"_unsubscribed"];
  [v5 encodeBool:self->_isSenderVIP forKey:@"_isVIP"];
  [v5 encodeBool:self->_isSenderInAddressBook forKey:@"_inAddressBook"];
  [v5 encodeBool:self->_isSenderRecentContact forKey:@"_recentContact"];
  [v5 encodeBool:self->_isSenderPrimary forKey:@"_senderPrimary"];
  [v5 encodeBool:self->_isNonPersonalAccount forKey:@"_isNonPersonalAccount"];
  [v5 encodeObject:self->_localRuleCategory forKey:@"_localRuleCategory"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_senderName copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_senderEmail copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_receiverEmail copy];
  uint64_t v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_emailSubject copy];
  uint64_t v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  *(unsigned char *)(v4 + 8) = self->_isUnsubscribeHeaderPresent;
  *(unsigned char *)(v4 + 9) = self->_isSenderVIP;
  *(unsigned char *)(v4 + 10) = self->_isSenderInAddressBook;
  *(unsigned char *)(v4 + 11) = self->_isSenderRecentContact;
  *(unsigned char *)(v4 + 12) = self->_isSenderPrimary;
  *(unsigned char *)(v4 + 13) = self->_isNonPersonalAccount;
  uint64_t v13 = [(NSString *)self->_localRuleCategory copy];
  uint64_t v14 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v13;

  return (id)v4;
}

- (id)stringValue
{
  v2 = "yes";
  if (self->_isUnsubscribeHeaderPresent) {
    v3 = "yes";
  }
  else {
    v3 = "no";
  }
  if (self->_isSenderVIP) {
    uint64_t v4 = "yes";
  }
  else {
    uint64_t v4 = "no";
  }
  if (self->_isSenderInAddressBook) {
    uint64_t v5 = "yes";
  }
  else {
    uint64_t v5 = "no";
  }
  if (self->_isSenderRecentContact) {
    uint64_t v6 = "yes";
  }
  else {
    uint64_t v6 = "no";
  }
  if (self->_isSenderPrimary) {
    uint64_t v7 = "yes";
  }
  else {
    uint64_t v7 = "no";
  }
  if (!self->_isNonPersonalAccount) {
    v2 = "no";
  }
  return (id)[NSString stringWithFormat:@"senderName:    %@\nsenderEmail:   %@\nreceiverEmail: %@\nemailSubject:  %@\nunsub header:  %s\nsender VIP:    %s\nsender in book:%s\nsender recent: %s\nsender primary:%s\nnon personal account:%s\nlocal rule category:%@\n", *(_OWORD *)&self->_senderName, self->_receiverEmail, self->_emailSubject, v3, v4, v5, v6, v7, v2, self->_localRuleCategory];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
}

- (NSString)senderEmail
{
  return self->_senderEmail;
}

- (void)setSenderEmail:(id)a3
{
}

- (NSString)receiverEmail
{
  return self->_receiverEmail;
}

- (void)setReceiverEmail:(id)a3
{
}

- (NSString)emailSubject
{
  return self->_emailSubject;
}

- (void)setEmailSubject:(id)a3
{
}

- (BOOL)isUnsubscribeHeaderPresent
{
  return self->_isUnsubscribeHeaderPresent;
}

- (void)setIsUnsubscribeHeaderPresent:(BOOL)a3
{
  self->_isUnsubscribeHeaderPresent = a3;
}

- (BOOL)isSenderVIP
{
  return self->_isSenderVIP;
}

- (void)setIsSenderVIP:(BOOL)a3
{
  self->_isSenderVIP = a3;
}

- (BOOL)isSenderInAddressBook
{
  return self->_isSenderInAddressBook;
}

- (void)setIsSenderInAddressBook:(BOOL)a3
{
  self->_isSenderInAddressBook = a3;
}

- (BOOL)isSenderRecentContact
{
  return self->_isSenderRecentContact;
}

- (void)setIsSenderRecentContact:(BOOL)a3
{
  self->_isSenderRecentContact = a3;
}

- (BOOL)isSenderPrimary
{
  return self->_isSenderPrimary;
}

- (void)setIsSenderPrimary:(BOOL)a3
{
  self->_isSenderPrimary = a3;
}

- (BOOL)isNonPersonalAccount
{
  return self->_isNonPersonalAccount;
}

- (void)setIsNonPersonalAccount:(BOOL)a3
{
  self->_isNonPersonalAccount = a3;
}

- (NSString)localRuleCategory
{
  return self->_localRuleCategory;
}

- (void)setLocalRuleCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRuleCategory, 0);
  objc_storeStrong((id *)&self->_emailSubject, 0);
  objc_storeStrong((id *)&self->_receiverEmail, 0);
  objc_storeStrong((id *)&self->_senderEmail, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
}

@end