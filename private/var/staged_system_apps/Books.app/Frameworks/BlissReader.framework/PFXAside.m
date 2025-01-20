@interface PFXAside
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXAside

- (BOOL)mapStartElementWithState:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "valueForAttribute:", "type");
  if ([@"noteref" isEqualToString:v3]) {
    return 1;
  }

  return [@"footnote" isEqualToString:v3];
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  if ([v5 childResultCount] == (char *)&dword_0 + 1)
  {
    [v5 childResultAtIndex:0];
    objc_opt_class();
    uint64_t v6 = TSUDynamicCast();
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v4 xmlElementId]);
      if ([(NSString *)v8 length])
      {
        [a3 setTargetDrawableInfo:v7 withIdentifier:v8];
      }
    }
  }
}

@end