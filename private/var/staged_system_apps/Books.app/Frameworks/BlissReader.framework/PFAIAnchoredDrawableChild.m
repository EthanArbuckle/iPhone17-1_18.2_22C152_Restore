@interface PFAIAnchoredDrawableChild
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIAnchoredDrawableChild

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3 = [a3 currentStackEntry];
  id v4 = [v3 flowState];
  v5 = (char *)[v4 childResultCount];
  if (objc_msgSend(objc_msgSend(v3, "paginatedState"), "childResultCount") == (char *)&dword_0 + 1) {
    objc_msgSend(objc_msgSend(v3, "paginatedState"), "setResult:", objc_msgSend(objc_msgSend(v3, "paginatedState"), "childResultAtIndex:", 0));
  }
  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    char v9 = 1;
    do
    {
      char v10 = v9;
      [v4 childResultAtIndex:v6];
      objc_opt_class();
      uint64_t v11 = TSUDynamicCast();
      if (v11)
      {
        uint64_t v7 = v11;
      }
      else
      {
        objc_opt_class();
        uint64_t v12 = TSUDynamicCast();
        if (v12) {
          uint64_t v8 = v12;
        }
      }
      char v9 = 0;
      uint64_t v6 = 1;
    }
    while ((v10 & 1) != 0);
    id v13 = objc_msgSend(objc_msgSend(v3, "currentEntryOrientationState", 1), "propertySet");
    v14 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v13, PFXTSDInfoGeometry((const char *)[v3 xmlValueForAttribute:PFXWidgetConstantDataGeometry[0]]), objc_msgSend(v3, "valueForAttribute:", PFXWidgetConstantDataGutterOrder[0]), 0);
    v15 = v14;
    if (v8) {
      [(NSMutableArray *)v14 addObject:v8];
    }
    if (v7) {
      [(NSMutableArray *)v15 addObject:v7];
    }
    id v16 = [v3 flowState];
    [v16 setResult:v15];
  }
}

@end