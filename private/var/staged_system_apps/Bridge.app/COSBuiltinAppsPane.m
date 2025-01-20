@interface COSBuiltinAppsPane
- (id)markupString;
- (id)title;
@end

@implementation COSBuiltinAppsPane

- (id)title
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"BUILTIN_APPS" value:&stru_100249230 table:@"Legal"];

  return v3;
}

- (id)markupString
{
  id WeakRetained = objc_loadWeakRetained(&qword_10029AF10);
  v3 = [WeakRetained builtinAppsMarkup];

  return v3;
}

@end