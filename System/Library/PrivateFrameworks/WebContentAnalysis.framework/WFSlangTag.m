@interface WFSlangTag
+ (id)sixtyNineTag;
- (WFSlangTag)tagWithWebpage:(id)a3;
@end

@implementation WFSlangTag

+ (id)sixtyNineTag
{
  return @"SixtyNineWebFilterTag";
}

- (WFSlangTag)tagWithWebpage:(id)a3
{
  v3 = objc_msgSend((id)objc_msgSend(a3, "pageContent"), "lowercaseString");
  if ((objc_msgSend(v3, "WF_containsWord:", @"69") & 1) == 0
    && (objc_msgSend(v3, "WF_containsWord:", @"sixty nine") & 1) == 0
    && !objc_msgSend(v3, "WF_containsWord:", @"sixty-nine"))
  {
    return 0;
  }
  v4 = (WFSlangTag *)[MEMORY[0x263F089D8] string];
  -[WFSlangTag appendString:](v4, "appendString:", [(id)objc_opt_class() sixtyNineTag]);
  [(WFSlangTag *)v4 appendString:@" "];
  return v4;
}

@end