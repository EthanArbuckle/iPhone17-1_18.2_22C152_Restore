@interface MFSignatures
+ (id)sharedInstance;
+ (id)signatureMarkupFormat:(id)a3;
+ (id)signaturePlainTextFormat:(id)a3;
+ (id)stripSignatureMarkup:(id)a3;
- (BOOL)useAccountSignatures;
- (MFSignatures)init;
- (id)_getValue:(id)a3;
- (id)_modelSpecificLocalizedStringKeyForKey:(id)a3;
- (id)defaultSignature;
- (id)signature;
- (id)signatureForAccount:(id)a3;
- (id)signatureForSendingEmailAddress:(id)a3;
- (id)signatureMarkupForSendingEmailAddress:(id)a3;
- (id)signaturePlainTextForSendingEmailAddress:(id)a3;
- (void)_setValue:(id)a3 value:(void *)a4;
- (void)clearSignature;
- (void)dealloc;
- (void)setSignature:(id)a3;
- (void)setSignature:(id)a3 forAccount:(id)a4;
- (void)setSignature:(id)a3 forEmailAddress:(id)a4;
- (void)setUseAccountSignatures:(BOOL)a3;
@end

@implementation MFSignatures

- (id)signatureMarkupForSendingEmailAddress:(id)a3
{
  id v3 = [(MFSignatures *)self signatureForSendingEmailAddress:a3];
  return +[MFSignatures signatureMarkupFormat:v3];
}

+ (id)signatureMarkupFormat:(id)a3
{
  id result = (id)[a3 length];
  if (result) {
    id result = (id)[@"<br/><br/>" stringByAppendingString:a3];
  }
  if (!result) {
    return a3;
  }
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MFSignatures_sharedInstance__block_invoke;
  block[3] = &unk_1E68661B8;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  return (id)sharedInstance_singleton;
}

id __30__MFSignatures_sharedInstance__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedInstance_singleton = (uint64_t)result;
  return result;
}

- (MFSignatures)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFSignatures;
  return [(MFSignatures *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MFSignatures;
  [(MFSignatures *)&v2 dealloc];
}

- (id)_modelSpecificLocalizedStringKeyForKey:(id)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)MGCopyAnswer(), "uppercaseString"), "stringByReplacingOccurrencesOfString:withString:", @" ", @"_");
  if ([v4 hasSuffix:@"_SIMULATOR"]) {
    v4 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "rangeOfString:", @"_SIMULATOR"));
  }
  return (id)[NSString stringWithFormat:@"%@_%@", a3, v4];
}

- (id)defaultSignature
{
  id v2 = [(MFSignatures *)self _modelSpecificLocalizedStringKeyForKey:@"DEFAULT_SIGNATURE"];
  if (v2) {
    objc_super v3 = (void *)MFLookupLocalizedString((uint64_t)v2, 0, 0);
  }
  else {
    objc_super v3 = 0;
  }
  if ([v3 length]) {
    return v3;
  }
  return (id)MFLookupLocalizedString(@"DEFAULT_SIGNATURE_IPHONE", @"Sent from my iPhone", 0);
}

- (id)_getValue:(id)a3
{
  MFMobileMailPreferenceDomain();
  MFMobileMailContainerPath();
  objc_super v3 = (void *)_CFPreferencesCopyValueWithContainer();
  return v3;
}

- (void)_setValue:(id)a3 value:(void *)a4
{
  MFMobileMailPreferenceDomain();
  MFMobileMailContainerPath();
  _CFPreferencesSetValueWithContainer();
  MFMobileMailContainerPath();
  if (_CFPreferencesSynchronizeWithContainer())
  {
    uint64_t v5 = *MEMORY[0x1E4F77E48];
    MEMORY[0x1F411CA08](v5, a3);
  }
}

- (id)signature
{
  id result = [(MFSignatures *)self _getValue:@"SignatureKey"];
  if (!result)
  {
    return [(MFSignatures *)self defaultSignature];
  }
  return result;
}

- (void)setSignature:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(a3, "isEqualToString:", -[MFSignatures defaultSignature](self, "defaultSignature"))) {
    id v3 = 0;
  }
  if ((objc_msgSend(v3, "isEqualToString:", -[MFSignatures signature](self, "signature")) & 1) == 0)
  {
    [(MFSignatures *)self _setValue:@"SignatureKey" value:v3];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mail.MailAccountSignaturesChanged", 0, 0, 0);
  }
}

- (void)clearSignature
{
}

- (BOOL)useAccountSignatures
{
  id v2 = [(MFSignatures *)self _getValue:@"UseAccountSignatures"];
  return [v2 BOOLValue];
}

- (void)setUseAccountSignatures:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(MFSignatures *)self _setValue:@"UseAccountSignatures" value:v4];
}

- (id)signatureForAccount:(id)a3
{
  if (a3) {
    return (id)[a3 customSignature];
  }
  else {
    return 0;
  }
}

- (void)setSignature:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  if (objc_msgSend(a3, "isEqualToString:", -[MFSignatures defaultSignature](self, "defaultSignature"))) {
    id v5 = 0;
  }
  if (a4
    && (objc_msgSend(v5, "isEqualToString:", -[MFSignatures signatureForAccount:](self, "signatureForAccount:", a4)) & 1) == 0)
  {
    [a4 setCustomSignature:v5];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mail.MailAccountSignaturesChanged", 0, 0, 0);
  }
}

- (id)signatureForSendingEmailAddress:(id)a3
{
  if (![a3 length]
    || (id v5 = +[MailAccount accountContainingEmailAddress:a3]) == 0)
  {
    id v5 = +[MailAccount defaultMailAccountForDelivery];
  }
  if (![(MFSignatures *)self useAccountSignatures]
    || (id v6 = [(MFSignatures *)self signatureForAccount:v5]) == 0)
  {
    id v6 = [(MFSignatures *)self signature];
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F734D8], "plainTextFromHTMLSnippet:", v6), "length")) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)setSignature:(id)a3 forEmailAddress:(id)a4
{
  if (![a4 length]
    || (id v7 = +[MailAccount accountContainingEmailAddress:a4]) == 0)
  {
    id v7 = +[MailAccount defaultMailAccountForDelivery];
  }
  [(MFSignatures *)self setSignature:a3 forAccount:v7];
}

- (id)signaturePlainTextForSendingEmailAddress:(id)a3
{
  id v3 = [(MFSignatures *)self signatureForSendingEmailAddress:a3];
  return +[MFSignatures signaturePlainTextFormat:v3];
}

+ (id)signaturePlainTextFormat:(id)a3
{
  id result = (id)[a3 length];
  if (result)
  {
    id v5 = (void *)[MEMORY[0x1E4F734D8] plainTextFromHTMLSnippet:a3];
    id result = (id)objc_msgSend(@"\n\n", "stringByAppendingString:", objc_msgSend(v5, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")));
  }
  if (!result) {
    return a3;
  }
  return result;
}

+ (id)stripSignatureMarkup:(id)a3
{
  if ([a3 length])
  {
    id v4 = (id)[a3 mutableCopy];
    uint64_t v9 = 0;
    id v5 = (void *)[MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:<br[/]?>){2}" options:1 error:&v9];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v4, 4, 0, objc_msgSend(v4, "length"));
      if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v4, "deleteCharactersInRange:", v6, v7);
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  if (v4) {
    return v4;
  }
  else {
    return a3;
  }
}

@end