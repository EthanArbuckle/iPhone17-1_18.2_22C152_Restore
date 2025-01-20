@interface NSURL(SUAdditions)
+ (uint64_t)termsAndConditionsURL;
- (uint64_t)storeURLType;
@end

@implementation NSURL(SUAdditions)

+ (uint64_t)termsAndConditionsURL
{
  v0 = (void *)[MEMORY[0x263F89540] sharedCache];
  v1 = objc_msgSend(v0, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0));
  uint64_t result = [v1 urlForKey:*MEMORY[0x263F89448]];
  if (!result)
  {
    v3 = NSURL;
    return [v3 URLWithString:@"http://www.apple.com/legal/itunes/ww/"];
  }
  return result;
}

- (uint64_t)storeURLType
{
  v2 = (void *)[a1 absoluteString];
  if ([v2 rangeOfString:@"MZSearch.woa"] != 0x7FFFFFFFFFFFFFFFLL
    || [v2 rangeOfString:@"/search?"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    return 1;
  }
  if ([v2 rangeOfString:@"buyCharityGiftWizard"] != 0x7FFFFFFFFFFFFFFFLL) {
    return 3;
  }
  if ([v2 rangeOfString:@"getPass"] != 0x7FFFFFFFFFFFFFFFLL
    && [v2 rangeOfString:@"MZFinance.woa"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    return 4;
  }
  v3 = (void *)[a1 copyQueryStringDictionaryWithUnescapedValues:1];
  v4 = (void *)[v3 objectForKey:@"action"];
  if ([v4 isEqualToString:@"account"])
  {
    uint64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"donate"])
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = [v4 isEqualToString:@"search"];
  }

  return v5;
}

@end