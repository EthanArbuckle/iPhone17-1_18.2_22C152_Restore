@interface NSURL
@end

@implementation NSURL

uint64_t __49__NSURL_UCNSURLExtras__truncatePayloadToV2Length__block_invoke(uint64_t a1, void *a2)
{
  return [a2 substringFromIndex:27];
}

id __44__NSURL_UCNSURLExtras__padPayloadToV1Length__block_invoke(int a1, id a2)
{
  id v2 = a2;
  id v3 = (id)objc_msgSend(&stru_26E243338, "stringByPaddingToLength:withString:startingAtIndex:", 32 - objc_msgSend(v2, "length"), @"0", 0);
  id v4 = (id)[NSString stringWithFormat:@"%@%@", v3, v2];

  return v4;
}

@end