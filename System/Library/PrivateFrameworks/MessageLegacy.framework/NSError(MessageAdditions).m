@interface NSError(MessageAdditions)
- (BOOL)mf_shouldFailDownload;
- (uint64_t)mf_isSMIMEError;
- (uint64_t)mf_isUserCancelledError;
- (uint64_t)mf_moreInfo;
- (uint64_t)mf_shortDescription;
- (uint64_t)mf_shouldBeReportedToUser;
@end

@implementation NSError(MessageAdditions)

- (uint64_t)mf_isUserCancelledError
{
  if ([a1 code] != 1028) {
    return 0;
  }
  uint64_t v2 = [a1 domain];
  return [@"MFMessageErrorDomain" isEqualToString:v2];
}

- (uint64_t)mf_isSMIMEError
{
  uint64_t v2 = [a1 domain];
  uint64_t v3 = [a1 code];
  LODWORD(result) = [@"MFMessageErrorDomain" isEqualToString:v2];
  if ((unint64_t)(v3 - 1035) < 2) {
    return result;
  }
  else {
    return 0;
  }
}

- (uint64_t)mf_shouldBeReportedToUser
{
  if (objc_msgSend(a1, "mf_isUserCancelledError")) {
    return 0;
  }
  if ([a1 code] == 1029) {
    return objc_msgSend(@"MFMessageErrorDomain", "isEqualToString:", objc_msgSend(a1, "domain")) ^ 1;
  }
  return 1;
}

- (uint64_t)mf_moreInfo
{
  v1 = (void *)[a1 userInfo];
  return [v1 objectForKey:@"_MFMoreInfo"];
}

- (uint64_t)mf_shortDescription
{
  v1 = (void *)[a1 userInfo];
  return [v1 objectForKey:@"_MFShortDescription"];
}

- (BOOL)mf_shouldFailDownload
{
  if (!objc_msgSend(@"MFMessageErrorDomain", "isEqualToString:", objc_msgSend(a1, "domain"))) {
    return 1;
  }
  if ([a1 code] == 1036) {
    return 0;
  }
  return [a1 code] != 1035;
}

@end