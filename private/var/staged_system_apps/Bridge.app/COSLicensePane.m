@interface COSLicensePane
- (id)markupString;
- (id)title;
@end

@implementation COSLicensePane

- (id)title
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"LICENSE" value:&stru_100249230 table:@"Legal"];

  return v3;
}

- (id)markupString
{
  id WeakRetained = objc_loadWeakRetained(&qword_10029AF10);
  v3 = [WeakRetained licenseMarkup];

  if (!v3)
  {
    v4 = [UIApp activeWatch];
    v5 = [v4 valueForProperty:NRDevicePropertyMarketingVersion];
    if (!v5)
    {
      v5 = [v4 valueForProperty:NRDevicePropertySystemVersion];
    }
    v6 = +[NSString stringWithFormat:@"<a href=\"%@\">%@</a>", @"https://www.apple.com/legal/", @"https://www.apple.com/legal/"];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"LICENSE_FALLBACK" value:&stru_100249230 table:@"Legal"];
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5, v6);
  }

  return v3;
}

@end