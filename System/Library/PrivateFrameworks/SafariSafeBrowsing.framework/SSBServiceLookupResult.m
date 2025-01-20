@interface SSBServiceLookupResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isKnownToBeUnsafe;
- (BOOL)isMalware;
- (BOOL)isPhishing;
- (BOOL)isUnwantedSoftware;
- (NSString)localizedProviderDisplayName;
- (NSString)malwareDetailsBaseURLString;
- (NSString)provider;
- (NSString)reportAnErrorBaseURLString;
- (NSURL)learnMoreURL;
- (SSBServiceLookupResult)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)_initWithLookupResult:(LookupResult)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSBServiceLookupResult

- (id)_initWithLookupResult:(LookupResult)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSBServiceLookupResult;
  v4 = [(SSBServiceLookupResult *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_lookupResult = a3;
    v6 = v4;
  }

  return v5;
}

- (SSBServiceLookupResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSBServiceLookupResult;
  v5 = [(SSBServiceLookupResult *)&v9 init];
  if (v5)
  {
    unsigned int v6 = [v4 decodeInt64ForKey:@"type"];
    v5->_lookupResult = (LookupResult)(v6 | ((unint64_t)[v4 decodeInt64ForKey:@"provider"] << 32));
    v7 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_lookupResult.type.m_storage forKey:@"type"];
  [v4 encodeInt64:self->_lookupResult.provider forKey:@"provider"];
}

- (BOOL)isMalware
{
  return self->_lookupResult.type.m_storage & 1;
}

- (BOOL)isPhishing
{
  return (LOBYTE(self->_lookupResult.type.m_storage) >> 1) & 1;
}

- (BOOL)isUnwantedSoftware
{
  return (LOBYTE(self->_lookupResult.type.m_storage) >> 3) & 1;
}

- (BOOL)isKnownToBeUnsafe
{
  if ([(SSBServiceLookupResult *)self isMalware]
    || [(SSBServiceLookupResult *)self isPhishing])
  {
    return 1;
  }

  return [(SSBServiceLookupResult *)self isUnwantedSoftware];
}

- (NSString)provider
{
  int provider = self->_lookupResult.provider;
  v3 = @"SSBProviderGoogle";
  if (provider == 2) {
    v3 = @"SSBProviderTencent";
  }
  if (provider == 4) {
    return (NSString *)@"SSBProviderApple";
  }
  else {
    return &v3->isa;
  }
}

- (NSString)malwareDetailsBaseURLString
{
  int provider = self->_lookupResult.provider;
  v3 = @"https://google.com/safebrowsing/diagnostic?tpl=safari";
  if (provider == 2) {
    v3 = @"https://www.urlsec.qq.com/check.html?tpl=safari";
  }
  if (provider == 4) {
    return (NSString *)@"https://support.apple.com/kb/HT211650";
  }
  else {
    return &v3->isa;
  }
}

- (NSURL)learnMoreURL
{
  int provider = self->_lookupResult.provider;
  switch(provider)
  {
    case 1:
      v3 = @"https://www.google.com/support/bin/answer.py?answer=106318";
      break;
    case 4:
      v3 = @"https://support.apple.com/kb/HT211650";
      break;
    case 2:
      v3 = @"https://www.urlsec.qq.com/standard/s1.html?tpl=safari";
      break;
    default:
      goto LABEL_8;
  }
  self = [NSURL URLWithString:v3];
LABEL_8:

  return (NSURL *)self;
}

- (NSString)reportAnErrorBaseURLString
{
  int provider = self->_lookupResult.provider;
  v3 = @"https://www.google.com/safebrowsing/report_error/?tpl=safari";
  if (provider == 2) {
    v3 = @"https://www.urlsec.qq.com/complain.html?tpl=safari";
  }
  if (provider == 4) {
    return (NSString *)@"https://websitereview.apple.com/?tpl=safari";
  }
  else {
    return &v3->isa;
  }
}

- (NSString)localizedProviderDisplayName
{
  v2 = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__SSBServiceLookupResult_localizedProviderDisplayName__block_invoke;
  v8[3] = &unk_263FCE6F8;
  v8[4] = self;
  uint64_t v3 = MEMORY[0x210510880](v8, a2);
  id v4 = (void *)v3;
  int v5 = v2[3];
  switch(v5)
  {
    case 1:
      unsigned int v6 = @"Google Safe Browsing";
      break;
    case 2:
      unsigned int v6 = @"Tencent Safe Browsing";
      break;
    case 4:
      unsigned int v6 = @"Apple";
      break;
    default:
      goto LABEL_8;
  }
  (*(void (**)(uint64_t, __CFString *, void))(v3 + 16))(v3, v6, 0);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return (NSString *)v2;
}

id __54__SSBServiceLookupResult_localizedProviderDisplayName__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:v4 value:v4 table:v5];

  return v7;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end