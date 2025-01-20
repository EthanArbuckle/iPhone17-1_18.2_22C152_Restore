@interface NSURL(FCNewsURLType)
- (uint64_t)fc_newsURLType;
@end

@implementation NSURL(FCNewsURLType)

- (uint64_t)fc_newsURLType
{
  if (objc_msgSend(a1, "fc_isNewsTagURL")) {
    return 3;
  }
  if (objc_msgSend(a1, "fc_isNewsArticleURL")) {
    return 1;
  }
  if (objc_msgSend(a1, "fc_isNewsIssueURL")) {
    return 2;
  }
  if (objc_msgSend(a1, "fc_isNewsPuzzleURL")) {
    return 5;
  }
  if (objc_msgSend(a1, "fc_isNewsPuzzleTypeURL")) {
    return 6;
  }
  if (objc_msgSend(a1, "fc_isNewsSportsEventURL")) {
    return 4;
  }
  return 0;
}

@end