@interface PFAIDualDrawable
+ (BOOL)shouldImportInCurrentLayoutWithStackEntry:(id)a3 state:(id)a4;
- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3;
@end

@implementation PFAIDualDrawable

+ (BOOL)shouldImportInCurrentLayoutWithStackEntry:(id)a3 state:(id)a4
{
  if (![a3 reader]) {
    return 1;
  }
  [a3 reader];
  v7 = (void *)TSUProtocolCast();
  if (!v7)
  {
LABEL_8:
    id v11 = [a3 parentEntry];
    return [a1 shouldImportInCurrentLayoutWithStackEntry:v11 state:a4];
  }
  [v7 currentSubreaderWithState:a4];
  v8 = (void *)TSUProtocolCast();
  if (!v8)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFAIDualDrawable shouldImportInCurrentLayoutWithStackEntry:state:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAIDualDrawable.mm") lineNumber:39 description:@"invalid nil value for '%s'", "drawableMapper"];
    return 1;
  }
  unsigned int v9 = objc_msgSend(objc_msgSend(v8, "placement"), "mode");
  BOOL result = 1;
  switch(v9)
  {
    case 0u:
      BOOL result = 0;
      break;
    case 1u:
      BOOL result = [a4 paginatedIsCurrent];
      break;
    case 4u:
      goto LABEL_8;
    case 5u:
    case 6u:
      BOOL result = [a4 flowIsCurrent];
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3
{
  v4 = objc_opt_class();
  id v5 = [a3 currentXmlStackEntry];

  return [v4 shouldImportInCurrentLayoutWithStackEntry:v5 state:a3];
}

@end