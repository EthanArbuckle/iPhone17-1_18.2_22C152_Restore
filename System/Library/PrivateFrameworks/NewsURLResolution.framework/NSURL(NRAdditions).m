@interface NSURL(NRAdditions)
- (uint64_t)nr_isWebURL;
@end

@implementation NSURL(NRAdditions)

- (uint64_t)nr_isWebURL
{
  return objc_msgSend(a1, "nr_isNewsURL") ^ 1;
}

@end