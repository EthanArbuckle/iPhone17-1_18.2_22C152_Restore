@interface WFJapanDatingTag
+ (id)japanDatingTag;
- (WFJapanDatingTag)tagWithWebpage:(id)a3;
@end

@implementation WFJapanDatingTag

+ (id)japanDatingTag
{
  return @"JapanDatingWebFilterTag";
}

- (WFJapanDatingTag)tagWithWebpage:(id)a3
{
  v3 = (void *)[a3 pageContent];
  v4 = @"18歳以上";
  v5 = off_26429C6D0;
  while (!objc_msgSend(v3, "WF_containsWord:", v4))
  {
    v6 = *v5++;
    v4 = v6;
    if (!v6) {
      return 0;
    }
  }
  v7 = (WFJapanDatingTag *)[MEMORY[0x263F089D8] string];
  -[WFJapanDatingTag appendString:](v7, "appendString:", [(id)objc_opt_class() japanDatingTag]);
  [(WFJapanDatingTag *)v7 appendString:@" "];
  return v7;
}

@end