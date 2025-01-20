@interface NSURL(AttachmentURLUtilities)
- (BOOL)mf_isResourceURL;
- (uint64_t)mf_firstPartNumber;
- (uint64_t)mf_isValidAttachmentURL;
- (uint64_t)mf_lastPartNumber;
- (uint64_t)mf_partNumbers;
- (uint64_t)mf_rowID;
@end

@implementation NSURL(AttachmentURLUtilities)

- (uint64_t)mf_isValidAttachmentURL
{
  v1 = (void *)[a1 scheme];
  return [v1 hasPrefix:@"x-attach"];
}

- (BOOL)mf_isResourceURL
{
  return objc_msgSend((id)objc_msgSend(a1, "scheme"), "caseInsensitiveCompare:", @"cid") == 0;
}

- (uint64_t)mf_rowID
{
  if (!objc_msgSend(a1, "mf_isValidAttachmentURL")) {
    return 0xFFFFFFFFLL;
  }
  v2 = (void *)[a1 host];
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = [v2 integerValue];
  if (result < 0) {
    return -1;
  }
  return result;
}

- (uint64_t)mf_partNumbers
{
  if (!objc_msgSend(a1, "mf_isValidAttachmentURL")) {
    return 0;
  }
  v2 = objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "pathComponents");
  if (![v2 count]) {
    return 0;
  }
  uint64_t v3 = [v2 count] - 1;
  return objc_msgSend(v2, "subarrayWithRange:", 1, v3);
}

- (uint64_t)mf_lastPartNumber
{
  v1 = objc_msgSend(a1, "mf_partNumbers");
  return [v1 lastObject];
}

- (uint64_t)mf_firstPartNumber
{
  v1 = objc_msgSend(a1, "mf_partNumbers");
  uint64_t result = [v1 count];
  if (result)
  {
    return [v1 objectAtIndexedSubscript:0];
  }
  return result;
}

@end