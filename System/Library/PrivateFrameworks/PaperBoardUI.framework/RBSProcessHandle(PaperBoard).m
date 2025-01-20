@interface RBSProcessHandle(PaperBoard)
- (id)pb_shortDesc;
@end

@implementation RBSProcessHandle(PaperBoard)

- (id)pb_shortDesc
{
  v2 = [a1 description];
  uint64_t v3 = objc_msgSend(v2, "rangeOfString:", @"(");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = [v2 substringToIndex:v3];

    v5 = [v4 componentsSeparatedByString:@"."];
    v6 = [v5 lastObject];

    v2 = [NSString stringWithFormat:@"%@:%d", v6, objc_msgSend(a1, "pid")];
  }
  return v2;
}

@end