@interface COSWarrantyPointerPane
- (BOOL)adjustTextDirection;
- (id)markupString;
- (id)title;
@end

@implementation COSWarrantyPointerPane

- (id)title
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WARRANTY_POINTER" value:&stru_100249230 table:@"Legal"];

  return v3;
}

- (id)markupString
{
  v2 = +[PBBridgeWatchAttributeController sharedDeviceController];
  v3 = [UIApp activeWatch];
  [v2 setDevice:v3];

  LODWORD(v3) = [v2 hasTwoYearWarranty];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = v4;
  if (v3) {
    CFStringRef v6 = @"WARRANTY_POINTER_DETAIL_2Y";
  }
  else {
    CFStringRef v6 = @"WARRANTY_POINTER_DETAIL_1Y";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:@"Legal"];

  return v7;
}

- (BOOL)adjustTextDirection
{
  return 1;
}

@end