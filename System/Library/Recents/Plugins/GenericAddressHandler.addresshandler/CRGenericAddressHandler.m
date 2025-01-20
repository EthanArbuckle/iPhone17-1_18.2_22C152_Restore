@interface CRGenericAddressHandler
- (id)addressFromExternalAddress:(id)a3 kind:(id)a4;
- (id)externalAddressFromAddress:(id)a3 kind:(id)a4;
- (id)supportedAddressKinds;
- (id)syncKeyForAddress:(id)a3 kind:(id)a4;
@end

@implementation CRGenericAddressHandler

- (id)supportedAddressKinds
{
  v3[0] = CRAddressKindEmail;
  v3[1] = CRAddressKindInstantMessage;
  v3[2] = CRAddressKindPhoneNumber;
  v3[3] = CRAddressKindURL;
  return +[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:v3 count:4]);
}

- (id)syncKeyForAddress:(id)a3 kind:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  if ([CRAddressKindEmail isEqualToString:a4])
  {
    id v8 = objc_msgSend(a3, "cr_copyIDNAEncodedEmailAddress");
    id String = objc_msgSend(v8, "cr_lowercaseStringWithStandardLocale");
  }
  else if ([CRAddressKindPhoneNumber isEqualToString:a4])
  {
    uint64_t v11 = PNCopyBestGuessCountryCodeForNumber();
    if (v11) {
      CFStringRef v12 = (const __CFString *)v11;
    }
    else {
      CFStringRef v12 = @"us";
    }
    v13 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
    CFStringRef v14 = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, v13, 0x8000100u, kCFAllocatorMalloc);
    v15 = (const void *)CFPhoneNumberCreate();
    id String = (id)CFPhoneNumberCreateString();
    if (!String)
    {
      id String = (id)CFPhoneNumberCreateString();
      if (!String) {
        id String = objc_msgSend(a3, "cr_lowercaseStringWithStandardLocale");
      }
    }
    CFRelease(v12);
    if (v15) {
      CFRelease(v15);
    }
    if (v14) {
      CFRelease(v14);
    }
  }
  else
  {
    if ([CRAddressKindInstantMessage isEqualToString:a4])
    {
      id v16 = objc_msgSend(a3, "cr_lowercaseStringWithStandardLocale");
    }
    else
    {
      if (![CRAddressKindURL isEqualToString:a4]) {
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CRGenericAddressHandler.m", 74, @"%@: unexpected kind passed to %s", objc_opt_class(), "-[CRGenericAddressHandler syncKeyForAddress:kind:]");
      }
      id v16 = a3;
    }
    id String = v16;
  }
  id v17 = objc_msgSend(objc_msgSend(String, "dataUsingEncoding:", 4), "cr_md5DigestHexString");

  return v17;
}

- (id)externalAddressFromAddress:(id)a3 kind:(id)a4
{
  if (![CRAddressKindEmail isEqualToString:a4]) {
    return a3;
  }
  id v5 = objc_msgSend(a3, "cr_copyIDNADecodedEmailAddress");

  return v5;
}

- (id)addressFromExternalAddress:(id)a3 kind:(id)a4
{
  if (![CRAddressKindEmail isEqualToString:a4]) {
    return a3;
  }
  id v5 = objc_msgSend(a3, "cr_copyIDNADecodedEmailAddress");

  return v5;
}

@end