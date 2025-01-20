@interface WFUSC2257Tag
+ (id)twoTwoFiveSevenTag;
+ (id)unitedStatesCodeTag;
- (WFUSC2257Tag)tagWithWebpage:(id)a3;
@end

@implementation WFUSC2257Tag

+ (id)twoTwoFiveSevenTag
{
  return @"TwoTwoFiveSevenWebFilterTag";
}

+ (id)unitedStatesCodeTag
{
  return @"UnitedStatesCodeWebFilterTag";
}

- (WFUSC2257Tag)tagWithWebpage:(id)a3
{
  v3 = (void *)[a3 pageContent];
  int v4 = objc_msgSend(v3, "WF_containsWord:", @"2257");
  if (objc_msgSend(v3, "WF_containsWord:", @"U.S.C"))
  {
    int v5 = 1;
  }
  else
  {
    int v5 = objc_msgSend(v3, "WF_containsWord:", @"USC");
    if ((v5 | v4) != 1) {
      return 0;
    }
  }
  v6 = (WFUSC2257Tag *)[MEMORY[0x263F089D8] string];
  if (v4)
  {
    -[WFUSC2257Tag appendString:](v6, "appendString:", [(id)objc_opt_class() twoTwoFiveSevenTag]);
    [(WFUSC2257Tag *)v6 appendString:@" "];
  }
  if (v5)
  {
    -[WFUSC2257Tag appendString:](v6, "appendString:", [(id)objc_opt_class() unitedStatesCodeTag]);
    [(WFUSC2257Tag *)v6 appendString:@" "];
  }
  return v6;
}

@end