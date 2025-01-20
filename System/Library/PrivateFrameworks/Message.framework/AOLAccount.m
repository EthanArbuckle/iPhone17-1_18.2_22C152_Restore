@interface AOLAccount
+ (BOOL)deliveryAccountUsesSSL;
+ (id)accountTypeIdentifier;
+ (id)deliveryAccountHostname;
+ (id)displayedAccountTypeString;
+ (id)emailAddressWithUsername:(id)a3;
+ (unsigned)deliveryAccountPortNumber;
- (BOOL)derivesDeliveryAccountInfoFromMailAccount;
- (id)URLForMessage:(id)a3;
- (id)_defaultSpecialMailboxNameForType:(int64_t)a3;
- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3;
- (id)iconString;
- (id)statisticsKind;
@end

@implementation AOLAccount

+ (id)displayedAccountTypeString
{
  return @"AOL";
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E4F73CC8];
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F17740];
}

- (id)iconString
{
  return @"aolAccountIcon";
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (id)URLForMessage:(id)a3
{
  return 0;
}

+ (id)emailAddressWithUsername:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && ([v3 isEqualToString:&stru_1EFF11268] & 1) == 0)
  {
    if ([v4 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [NSString stringWithFormat:@"%@@aol.com", v4];
    }
    else
    {
      id v6 = v4;
    }
    v5 = v6;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_defaultSpecialMailboxNameForType:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) < 5 && ((0x1Du >> v3))
  {
    v4 = off_1E5D3B238[v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AOLAccount;
    -[YahooAccount _defaultSpecialMailboxNameForType:](&v6, sel__defaultSpecialMailboxNameForType_);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  if (a3)
  {
    v4 = objc_alloc_init(MFAOLSMTPAccount);
    [(MFAOLSMTPAccount *)v4 setMailAccount:self];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)deliveryAccountHostname
{
  return (id)[a1 standardAccountClass:a1 valueForKey:@"DeliveryHostname"];
}

+ (BOOL)deliveryAccountUsesSSL
{
  v2 = [a1 standardAccountClass:a1 valueForKey:@"DeliverySSLEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (unsigned)deliveryAccountPortNumber
{
  v2 = [a1 standardAccountClass:a1 valueForKey:@"DeliveryPortNumber"];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

@end